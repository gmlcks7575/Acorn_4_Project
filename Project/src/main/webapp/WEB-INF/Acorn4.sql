CREATE TABLE users(
	name VARCHAR2(50) NOT NULL,
   	id VARCHAR2(100) PRIMARY KEY,
   	pwd VARCHAR2(100) NOT NULL,
   	email VARCHAR2(100)NOT NULL,
   	address VARCHAR2(100), 
	regdate DATE,
	usertype NUMBER(10) DEFAULT 0 NOT NULL
);

CREATE SEQUENCE users_seq;

CREATE TABLE product(
	productId VARCHAR2(100) PRIMARY KEY, /* 상품 아이디 */
	productName VARCHAR2(200) NOT NULL, /* 상품 이름 */
	price NUMBER(10) NOT NULL, /* 상품 가격 */
	stock NUMBER(10) DEFAULT 0, /* 상품 재고 */
	productCate VARCHAR2(30), /* 상품 카테고리 */
	regDate DATE, /* 상품 등록일 */
	updateDate DATE, /* 상품 정보 업데이트일 */
	buyCount NUMBER(10) /*인기 품목 선정을 위해*/
);


CREATE TABLE cart(
	cart_id NUMBER(10) NOT NULL PRIMARY KEY, /* 카트 번호 */
	id VARCHAR2(100), /* 사용자 id */
	productId VARCHAR2(100), /* 상품 id */
	price NUMBER(10),
	amount NUMBER default 0 /* 상품 수량 */
)

ALTER TABLE cart ADD CONSTRAINT cart_fk_id FOREIGN KEY (id) REFERENCES users(id)
ALTER TABLE cart ADD CONSTRAINT cart_fk_productId FOREIGN KEY (productId) REFERENCES product(productId)

CREATE SEQUENCE seq_cart
INCREMENT BY 1
START WITH 1

-- Q&A를  저장할 테이블 
CREATE TABLE board_inquiry(
	num NUMBER PRIMARY KEY, --글번호
	writer VARCHAR2(100) NOT NULL, --작성자 (로그인된 아이디)
	title VARCHAR2(100) NOT NULL, --제목
	content CLOB, --글 내용
	viewCount NUMBER, -- 조회수
	regdate DATE --글 작성일
);
-- 게시글의 번호를 얻어낼 시퀀스
CREATE SEQUENCE board_inquiry_seq; 

--Q&A 댓글 저장할 테이블
CREATE TABLE board_inquiry_comment(
	num NUMBER PRIMARY KEY, --댓글의 글번호
	writer VARCHAR2(100), --댓글 작성자의 아이디
	content VARCHAR2(500), --댓글 내용
	target_id VARCHAR2(100), --댓글의 대상자 아이디
	ref_group NUMBER,
	comment_group NUMBER,
	deleted CHAR(3) DEFAULT 'no',
	regdate DATE
);

CREATE SEQUENCE board_inquiry_comment_seq;
/*
create table orderHistory 
	(id varchar2(100),
	quantity NUMBER(10), 
	productName varchar2(100), 
	address varchar2(100), 
	price NUMBER(10), 
	orderDate DATE, 
	status varchar2(100)
);

DropCREATE TABLE OrderResult(	
	productId VARCHAR2(100),
	productName VARCHAR2(300),
	price NUMBER(30),
	quantity NUMBER(30),
	imagePath VARCHAR2(200),

	userid VARCHAR2(50),
	username VARCHAR2(30),
	email VARCHAR2(100),
	tel NUMBER(11),
	useraddress VARCHAR2(100),
	orderDate DATE,

	orderNumber NUMBER(30),
	totalPrice NUMBER(30),
	billingDate DATE DEFAULT SYSDATE
);

CREATE sequence ordernumber_seq;
*/
CREATE TABLE ordertable(	
	orderId NUMBER(35),
	userId varchar2(50),
	receiver varchar2(50)
	userAddr varchar2(100),
	userPostal varchar2(20),
	userAddrDetail varchar2(100),
	tel varchar2(50),
	totalPrice NUMBER(20),
	orderDate Date,
	delivery varchar2(50),
	primary key(orderId)
);

CREATE SEQUENCE orderId_seq;

CREATE TABLE ordertable_detail(	
	orderId NUMBER(35),
	userId varchar2(50),
	orderId_detail NUMBER,
	productId varchar2(100),
	amount_detail NUMBER,
	
	FOREIGN KEY (orderId) REFERENCES ordertable(orderId)
);d

CREATE SEQUENCE orderId_detail_seq;


/*지난주 주문내역*/
SELECT *
FROM ordertable
where orderdate between TRUNC(SYSDATE -7, 'iw') and TRUNC(SYSDATE, 'dy');