## 쇼핑몰 project 환경 세팅
1. encoding - UTF-8 세팅 (page 기본 인코딩 설정)
2. Tomcat 연결
3. Oracle 연결
4. (ojdbc6.jar import)    
![image](https://github.com/hwan06/shoppingmall/assets/114748934/3a3ac7d2-d9cc-49bd-af1f-c6a5419ffb96)
---

### 테이블 생성하고 데이터 삽입하기 ![전체코드](https://github.com/hwan06/shoppingmall/blob/main/setting/Oracle.sql)
``` sql
DROP TABLE member_tbl_02;
CREATE TABLE member_tbl_02(
	custno number(6) primary key,
	custname varchar2(20),
	phone varchar2(13),
	address varchar2(60),
	joindate date,
	grade char(2),
	city char(2)
);
INSERT INTO MEMBER_TBL_02 VALUES(100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
INSERT INTO MEMBER_TBL_02 VALUES(100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
INSERT INTO MEMBER_TBL_02 VALUES(100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151001', 'C', '30');
INSERT INTO MEMBER_TBL_02 VALUES(100004, '최사랑', '010-1111-5555', '울릉군 울릉웁 독도2리', '20151113', 'A', '30');
INSERT INTO MEMBER_TBL_02 VALUES(100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
INSERT INTO MEMBER_TBL_02 VALUES(100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');
```
---
### index.jsp, join.jsp, join_p.jsp, memberlist.jsp, layout(header, nav, section, footer), css(style) 생성
![image](https://github.com/hwan06/shoppingmall/assets/114748934/f258c5e2-5132-4ad8-a358-8cc17c61473c)
