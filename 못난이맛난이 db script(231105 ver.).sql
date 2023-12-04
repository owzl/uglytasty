-- UGLYTASTY ���̳� ������Ʈ ����_uglytasty
--CREATE USER uglytasty IDENTIFIED BY uglytasty;
--GRANT CONNECT, RESOURCE TO uglytasty;


--���������� ������̺� �� �������� ����
BEGIN
    FOR C IN (SELECT TABLE_NAME FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE '||C.TABLE_NAME||' CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--���������� ��� ������ ����
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--���������� ��� �� ����
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
--���������� ��� Ʈ���� ����
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/


---------------------------ȸ�� MEMBER-----------------------------
CREATE TABLE MEMBER(
    USER_ID VARCHAR2(50) PRIMARY KEY,
    USER_PWD VARCHAR2(200) NOT NULL,
    USER_NAME VARCHAR2(50) NOT NULL,
    PHONE VARCHAR2(20) NOT NULL,
    EMAIL VARCHAR2(50) NOT NULL,
    ADDRESS_BASE VARCHAR2(200) NOT NULL,
    ADDRESS_DETAIL VARCHAR2(200) NOT NULL,
    STATUS VARCHAR2(5) DEFAULT 'Y' NOT NULL,
    SUBSCRIBE VARCHAR2(5) DEFAULT 'N' NOT NULL,
    PROVIDER VARCHAR2(500),
    ACCESS_TOKEN VARCHAR2(500),
    REFRESH_TOKEN VARCHAR2(500)
);

COMMENT ON COLUMN MEMBER.USER_ID IS 'ȸ�� ���̵�';
COMMENT ON COLUMN MEMBER.USER_PWD IS 'ȸ�� ��й�ȣ';
COMMENT ON COLUMN MEMBER.USER_NAME IS 'ȸ�� �̸�';
COMMENT ON COLUMN MEMBER.PHONE IS 'ȸ�� ��ȭ��ȣ';
COMMENT ON COLUMN MEMBER.EMAIL IS 'ȸ�� �̸���';
COMMENT ON COLUMN MEMBER.ADDRESS_BASE IS 'ȸ�� �ּ�(�⺻)';
COMMENT ON COLUMN MEMBER.ADDRESS_DETAIL IS 'ȸ�� �ּ�(��)';
COMMENT ON COLUMN MEMBER.STATUS IS 'ȸ�� ����';
COMMENT ON COLUMN MEMBER.SUBSCRIBE IS '������ �ڽ� ���� ����';
COMMENT ON COLUMN MEMBER.PROVIDER IS 'SNS ����';
COMMENT ON COLUMN MEMBER.ACCESS_TOKEN IS '������ ��ū';
COMMENT ON COLUMN MEMBER.REFRESH_TOKEN IS '�������� ��ū';


INSERT
  INTO MEMBER
       (
        USER_ID,
        USER_PWD,
        USER_NAME,
        PHONE,
        EMAIL,
        ADDRESS_BASE,
        ADDRESS_DETAIL,
        STATUS,
        SUBSCRIBE
      )
VALUES
      (
       'admin'
     , '$2a$10$Y/sqU6veRhDmcwPDFAjbEeyxuSdOEvtPc0xzHR4QVbuF8Orb.TZ7q'
     , '������'
     , '010-1111-1111'
     , 'admin@naver.com'
     , '����� ������'
     , '������ 13-7'
     , 'Y'
     , 'Y'
     );
     
INSERT
  INTO MEMBER
       (
        USER_ID,
        USER_PWD,
        USER_NAME,
        PHONE,
        EMAIL,
        ADDRESS_BASE,
        ADDRESS_DETAIL,
        STATUS,
        SUBSCRIBE
      )
VALUES
      (
       'user01'
     , '$2a$10$YMwGi8MNp74obor9sU5iBuJ4wo3NDN3dFpuz3ykeXeohNfIRX9S8G'
     , '������'
     , '010-1111-2222'
     , 'user01@naver.com'
     , '����� ������'
     , '���̻�� 21��'
     , default
     , 'Y'
     );

INSERT
  INTO MEMBER
       (
        USER_ID,
        USER_PWD,
        USER_NAME,
        PHONE,
        EMAIL,
        ADDRESS_BASE,
        ADDRESS_DETAIL,
        STATUS,
        SUBSCRIBE
      )
VALUES
      (
       'user02'
     , '$2a$10$JwzWlDFDAHktI0l3BgIxFuAs9gAV2fJMxVqAua6gvkiu3e9fSPcYi'
     , '���Ϲ�'
     , '010-1111-3333'
     , 'user02@naver.com'
     , '����� ���۱�'
     , '�漮�� 15-9����'
     , default
     , 'Y'
     );
     
INSERT
  INTO MEMBER
       (
        USER_ID,
        USER_PWD,
        USER_NAME,
        PHONE,
        EMAIL,
        ADDRESS_BASE,
        ADDRESS_DETAIL,
        STATUS,
        SUBSCRIBE
      )
VALUES
      (
       'user03'
     , '$2a$10$OdZTblRWO4JufCqz3zTlCO1niRjFIpFIN3rkrew3wvGWEh6mqWECG'
     , '�̵���'
     , '010-3333-3333'
     , 'user03@naver.com'
     , '����� ���۱�'
     , '�뷮���� 23-1����'
     , default
     , 'Y'
     );
     
INSERT
  INTO MEMBER
       (
        USER_ID,
        USER_PWD,
        USER_NAME,
        PHONE,
        EMAIL,
        ADDRESS_BASE,
        ADDRESS_DETAIL,
        STATUS,
        SUBSCRIBE
      )
VALUES
      (
       'user04'
     , '$2a$10$hJ.xkNH/xoYiBb90fzlVleR58HyhAk07UJu7DYFuwY.JW6o4Moowe'
     , '������'
     , '010-4444-4444'
     , 'user04@naver.com'
     , '����� ������'
     , 'õȣ�� 17-7����'
     , default
     , 'Y'
     );
 

 
   
----------------------------������ RECIPE----------------------------

CREATE TABLE RECIPE(
    RECIPE_NO NUMBER PRIMARY KEY,
    RECIPE_WRITER VARCHAR2(50) DEFAULT 'admin' NOT NULL,
    RECIPE_TITLE VARCHAR2(100) NOT NULL,
    RECIPE_ORIGIN_NAME VARCHAR2(200),
    RECIPE_CHANGE_NAME VARCHAR2(200),
    RECIPE_EXP VARCHAR2(2000) NOT NULL,
    RECIPE_CONTENT VARCHAR2(4000) NOT NULL,
    COUNT NUMBER DEFAULT 0 NOT NULL,
    DIFFICULTY VARCHAR2(50) NOT NULL,
    TIME VARCHAR2(50) NOT NULL,
    RECIPE_DATE  DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR2(5) DEFAULT 'Y' NOT NULL
);

COMMENT ON COLUMN RECIPE.RECIPE_NO IS '�� ��ȣ';
COMMENT ON COLUMN RECIPE.RECIPE_WRITER IS '�ۼ���';
COMMENT ON COLUMN RECIPE.RECIPE_TITLE IS '������ ����';
COMMENT ON COLUMN RECIPE.RECIPE_ORIGIN_NAME IS '������ �̹��� ���� �̸�';
COMMENT ON COLUMN RECIPE.RECIPE_CHANGE_NAME IS '������ �̹��� ���� �̸�';
COMMENT ON COLUMN RECIPE.RECIPE_EXP IS '���� ����';
COMMENT ON COLUMN RECIPE.RECIPE_CONTENT IS '������ ����';
COMMENT ON COLUMN RECIPE.COUNT IS '��ȸ��';
COMMENT ON COLUMN RECIPE.DIFFICULTY IS '���̵�';
COMMENT ON COLUMN RECIPE.TIME IS '�ҿ� �ð�';
COMMENT ON COLUMN RECIPE.RECIPE_DATE IS '������ �ۼ���';
COMMENT ON COLUMN RECIPE.STATUS IS '����';

CREATE SEQUENCE SEQ_RECIPE_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 99999
NOCYCLE
NOCACHE;

INSERT
  INTO RECIPE
       (
         RECIPE_NO
       , RECIPE_WRITER
       , RECIPE_TITLE
       , RECIPE_ORIGIN_NAME
       , RECIPE_CHANGE_NAME
       , RECIPE_EXP
       , RECIPE_CONTENT
       , COUNT
       , DIFFICULTY
       , TIME
       , RECIPE_DATE	
       , STATUS
      )
VALUES
      (
         SEQ_RECIPE_NO.NEXTVAL
       , DEFAULT
       , '������ �� �Ծ�ó���? <br>�丶�� �ް� ����'
       , 'https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/image/20220123/bd89a01dbda445c29e5b6ab56eb061cb.jpg'
       , ''
       , '�� ���� �� �Ծ ����� �־, �� ���� �Ծ ����� ���ٴ�! �丶�� �ް� ����'
       , '1. ���Ĵ� �ı⸧�� ���� ���� ���� ����ݴϴ�.<br>2. �丶��� ������ �����ϰ� �Ա����� ũ��� �߶��ּ���.<br>3. ���� �ް��� �ְ� �ұݰ��� �� ���� ���� Ǯ���ݴϴ�.<br>4. �⸧ �θ� ���� �ޱ��� ���� �ް����� �װ� �������ݴϴ�. ������ ���� ��ũ�����״� ���ÿ� �����ּ���.<br>5. �ҿ� �⸧�� �ٽ� �θ��� ���ĸ� ���� �ı⸧�� ���ݴϴ�.<br>6. ������ �ּ� �ö���� �丶�並 �ְ� ���� �����鼭 ����� ���θ� �ְ� ������ �����ݴϴ�. ���ҿ��� ª�� �����ָ� �����ϴ�.<br>7. ������ ��ũ������ ���� �ְ� ���ٰ� ���⸧, ���߷� �������ϸ� �ϼ�!'
       , DEFAULT
       , '������'
       , '5�� �̳�'
       , DEFAULT 	
       , DEFAULT
     );
     
INSERT
  INTO RECIPE
       (
         RECIPE_NO
       , RECIPE_WRITER
       , RECIPE_TITLE
       , RECIPE_ORIGIN_NAME
       , RECIPE_CHANGE_NAME
       , RECIPE_EXP
       , RECIPE_CONTENT
       , COUNT
       , DIFFICULTY
       , TIME
       , RECIPE_DATE	
       , STATUS
      )
VALUES
      (
         SEQ_RECIPE_NO.NEXTVAL
       , DEFAULT
       , '������ �����ϴ�, ǥ����� �Ұ��'
       , 'https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/image/20220123/788e8a55646b440ba75956f503fa1e49.jpg'
       , ''
       , '�ǰ��� ���� ǥ������� ��� �־� ����� ǥ������Ұ��� ����ϰ� ��ܺ�����!'
       , '1. �Ұ��� �Ұ��� ŰģŸ���� �͹��� �۾� �غ����ݴϴ�.<br>2. ���� 4��Ǭ, �������� 1��Ǭ, ���� 1��Ǭ, ���߿� ���⸧�� ���ݾ� �ְ� ���� 4��Ǭ�� �־� ����� ������ּ���.<br>3. ��⸦ ��信 �� ������ ��� ������� ���������ݴϴ�.<br>4. ǥ������� ������ �ľ� �Ա� ���� ũ��� ����ֽð�, ��ȣ�� ���� ����, ����. ȫ���� �� �Ա� ���� ũ��� ��� �غ����ݴϴ�.<br>5. �ޱ��� �������ҿ� ��⸦ �ְ� �����ݴϴ�. <br>6. ��Ⱑ ������� ������ �غ��ص� ǥ������� ȫ���߸� ������ ä�ҵ��� �ְ� �Բ� �����ݴϴ�.<br>7. ���������� ȫ���߸� �ְ�, ���ĸ� ä��� ���� ��� ���������ָ�, ǥ������Ұ�� �ϼ�!'
       , DEFAULT
       , '�ʱ�'
       , '60�� �̳�'
       , DEFAULT 
       , DEFAULT
     );
     
INSERT
  INTO RECIPE
       (
         RECIPE_NO
       , RECIPE_WRITER
       , RECIPE_TITLE
       , RECIPE_ORIGIN_NAME
       , RECIPE_CHANGE_NAME
       , RECIPE_EXP
       , RECIPE_CONTENT
       , COUNT
       , DIFFICULTY
       , TIME
       , RECIPE_DATE	
       , STATUS
      )
VALUES
      (
         SEQ_RECIPE_NO.NEXTVAL
       , DEFAULT
       , '���Կ� �� ���� ����ݸ� �������'
       , 'https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/image/20220123/299b531c42924ea492978540a2f4c8ab.jpg'
       , ''
       , '���� �������� �Ʊ��ڱ��� ���־�! ���� ũ��� �ε巴�� �Ա⿡�� ������ ����ݸ� ��������Դϴ�.'
       , '1. ���� ���� �ұ��� �ְ� ����ݸ��� ��¦ �����ּ���. ���� �������� ���� ������ ��� ���⸦ �������ְ� �߰� �����ݴϴ�.<br>2. �ް��� ����, �븥�ڸ� �и��� �غ��մϴ�.<br>3. ���ڿ� ��ũ��, ����, ���� ����ݸ��� �־� �� �����ּ���.<br>4. �ҿ� �Ŀ����� �θ��� ��ް����� ��� �� �����ݴϴ�. ��ҿ� ������ ������ �� ���� ���ư��� ����� ����ּ���.<br>5. ���ڸ� �� ������ �� �Ѹ��� �븥�� �ް����� ����ó�� ���� ���ε� �����ּ���.<br>6. �� ������ ��߷� ���� ����� ����ְ�, �� �� ������ �˸��� ũ��� ��� �ϼ��մϴ�.'
       , DEFAULT
       , '�߱�'
       , '15�� �̳�'
       , DEFAULT 
       , DEFAULT
     );
     
INSERT
  INTO RECIPE
       (
         RECIPE_NO
       , RECIPE_WRITER
       , RECIPE_TITLE
       , RECIPE_ORIGIN_NAME
       , RECIPE_CHANGE_NAME
       , RECIPE_EXP
       , RECIPE_CONTENT
       , COUNT
       , DIFFICULTY
       , TIME
       , RECIPE_DATE	
       , STATUS
      )
VALUES
      (
         SEQ_RECIPE_NO.NEXTVAL
       , DEFAULT
       , '�ε巯��鼭 �ٴ��� ��ȣ�� �ٽ�ũ ġ������ũ'
       , 'https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/image/20220329/9f6a416cb2c147bb92e7366e840af11f.jpg'
       , ''
       , '�븩�븩 �������� ����� ���� �ູ! ���鸸 �� ���� ���쿡 ���⸸�ϸ� �ϼ��Ǵ� ������ �ε巯��, ��ȣ�� �ٽ�ũ ġ������ũ �Դϴ�'
       , '1. �ǿ¿� �� ũ��ġ� ���� ��� �ְ����� �� Ǯ���ݴϴ�.<br>2. Ǯ��� ũ��ġ� ������ �ְ� �����ݴϴ�.<br>3. ��ȣ���� �ǳ� �� �ε巴�� ���� �غ����ְ� ũ��ġ�� ȥ�չ��� ��ũ���� ��ȣ���� �־��� �� �� �����ּ���.<br>4. ũ��ġ�� ȥ�չ��� ����� �ٴҶ� �ͽ�Ʈ���� �ְ� ���� �����ݴϴ�.<br>5. ���������� �ڷºа� �ó����Ŀ���� ü�� �־��� �� �ְ����� �����ּ���.<br>6. �������� �� ���� Ʋ�� ������ �Ҵ��ϰ� 230���� ������ ���쿡�� 25~30�� �� �����ָ� �ϼ�!'
       , DEFAULT
       , '���'
       , '60�� �̳�'
       , DEFAULT 
       , DEFAULT
     );
     
INSERT
  INTO RECIPE
       (
         RECIPE_NO
       , RECIPE_WRITER
       , RECIPE_TITLE
       , RECIPE_ORIGIN_NAME
       , RECIPE_CHANGE_NAME
       , RECIPE_EXP
       , RECIPE_CONTENT
       , COUNT
       , DIFFICULTY
       , TIME
       , RECIPE_DATE	
       , STATUS
      )
VALUES
      (
         SEQ_RECIPE_NO.NEXTVAL
       , DEFAULT
       , '�븶���� ��! �� ���� ã�� �־�~? <br>���ö�����'
       , 'https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/image/20220123/f1fc331052f04654a5886a8d780204ad.jpg'
       , ''
       , 'Ƣ��� ������ ǳ�̸� ����ø� �븶�ÿ� �ٻ��� ���� �ķ���ũ���� ���ϴ� �ݻ�÷ȭ! �Ծ� ���� ���� ���� �����ϴ� ������ ������, ���ö�����'
       , '1. ���� 10���� �⸧�� �θ� �ҿ� Ƣ��� �����ּ���.<br>2. ���� 5���� �����ϰ� ������ �븩�븩 ������ ������ Ƣ�� �����ķ���ũ�� ����ϴ�.<br>3. ����, ���, ��� �Ա����� ũ��� ����ݴϴ�.<br>4. ������, �����尡��, ����, ����, ������ �����Ͽ� ������� ������ּ���.<br>5. ������ ���̳� ������ ���� ��, ä��, �����, ����(��or��ġ ��)�� �ξ� �����ݴϴ�.<br>6. ������ �����ϰ� ���Ƶ�� ���� ������ �ְ� �������ּ���.<br>7. �����̸� �׸��� �Űܴ�� �����ķ���ũ�� �ּ� �ѷ��ָ� �ϼ�!'
       , DEFAULT
       , '�߱�'
       , '30�� �̳�'
       , DEFAULT 
       , DEFAULT
     );
     
     

----------------------------��� INGREDIENTS----------------------------
CREATE TABLE INGREDIENTS(
    RECIPE_NO NUMBER PRIMARY KEY,
    SERVINGS NUMBER NOT NULL,
    INGREDIENT VARCHAR2(1000) NOT NULL,
    QUANTITY VARCHAR2(1000) NOT NULL,
    SEASONING VARCHAR2(1000),
    AMOUNT VARCHAR2(1000),
    
    FOREIGN KEY (RECIPE_NO) REFERENCES RECIPE (RECIPE_NO)
);

COMMENT ON COLUMN INGREDIENTS.RECIPE_NO IS '�� ��ȣ';
COMMENT ON COLUMN INGREDIENTS.SERVINGS IS '�κ�';
COMMENT ON COLUMN INGREDIENTS.INGREDIENT IS '�����';
COMMENT ON COLUMN INGREDIENTS.QUANTITY IS '����� ����';
COMMENT ON COLUMN INGREDIENTS.SEASONING IS '���';
COMMENT ON COLUMN INGREDIENTS.AMOUNT IS '��� ����';

INSERT
  INTO INGREDIENTS
       (
          RECIPE_NO
	, SERVINGS
        , INGREDIENT
        , QUANTITY
        , SEASONING
        , AMOUNT
      )
VALUES
      (
          1
	, 1
        , '�ް�,����,�丶��'
        , '1.5��,25g,100g'
        , '����,�ұ�,����,���⸧,����'
        , '0.3T,0.1T,0.5T,0.1T,0.1T'
     );
     
INSERT
  INTO INGREDIENTS
       (
          RECIPE_NO
	, SERVINGS
        , INGREDIENT
        , QUANTITY
        , SEASONING
        , AMOUNT
      )
VALUES
      (
          2
	, 1
        , '����,�Ұ��(�Ұ���),����,ǥ�����,ȫ����'
        , '20g,250g,40g,100g,10g'
        , '����,��������,����,���⸧,����'
        , '2T,0.5T,0.5T,0.3T,0.1T'
     );
     
INSERT
  INTO INGREDIENTS
       (
          RECIPE_NO
	, SERVINGS
        , INGREDIENT
        , QUANTITY
        , SEASONING
        , AMOUNT
      )
VALUES
      (
          3
	, 1
        , '�ް�,����ݸ�,��ũ��,����'
        , '2��,50g,50ml,0.3T'
        , ''
        , ''
     );
     
INSERT
  INTO INGREDIENTS
       (
          RECIPE_NO
	, SERVINGS
        , INGREDIENT
        , QUANTITY
        , SEASONING
        , AMOUNT
      )
VALUES
      (
          4
	, 3
        , '���,��ȣ��,�ٴҶ� �ͽ�Ʈ��,��ũ��,����,�ó��� �Ŀ��,���а���,ũ��ġ��'
        , '2��,200g,5g,80g,80g,0.5t,25g,350g'
        , ''
        , ''
     );
     
INSERT
  INTO INGREDIENTS
       (
          RECIPE_NO
	, SERVINGS
        , INGREDIENT
        , QUANTITY
        , SEASONING
        , AMOUNT
      )
VALUES
      (
          5
	, 2
        , '���,����,�����̶�,����,�簢�,����'
        , '20g,30g,300g,15��,2��,40g'
        , '����,������,���尡��,����,����'
        , '1��Ǭ,3��Ǭ,3��Ǭ,3��Ǭ,3��Ǭ'
     );
  
   
------------------------------��� REPLY------------------------------
CREATE TABLE REPLY(
    REPLY_NO NUMBER PRIMARY KEY,
    RECIPE_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(50) NOT NULL,
    REPLY_CONTENT VARCHAR2(4000) NOT NULL,
    REPLY_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR2(5) DEFAULT 'Y' NOT NULL,
    
    FOREIGN KEY (RECIPE_NO) REFERENCES RECIPE (RECIPE_NO),
    FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID)
);

COMMENT ON COLUMN REPLY.REPLY_NO IS '��� ��ȣ';
COMMENT ON COLUMN REPLY.RECIPE_NO IS '���� �����Ǳ� ��ȣ';
COMMENT ON COLUMN REPLY.USER_ID IS 'ȸ�� ���̵�';
COMMENT ON COLUMN REPLY.REPLY_CONTENT IS '��� ����';
COMMENT ON COLUMN REPLY.REPLY_DATE IS '�ۼ���';
COMMENT ON COLUMN REPLY.STATUS IS '����';

CREATE SEQUENCE SEQ_REPLY_NO
START WITH 1
INCREMENT BY 1
NOCYCLE
NOCACHE;

INSERT
  INTO REPLY
       (
          REPLY_NO
        , RECIPE_NO
        , USER_ID
        , REPLY_CONTENT
        , REPLY_DATE
        , STATUS
      )
VALUES
      (
          SEQ_REPLY_NO.NEXTVAL
        , 1
        , 'user01'
        , '������ �Խñ� 1���� user01�� ���'
        , DEFAULT
        , DEFAULT
     );

INSERT
  INTO REPLY
       (
          REPLY_NO
        , RECIPE_NO
        , USER_ID
        , REPLY_CONTENT
        , REPLY_DATE
        , STATUS
      )
VALUES
      (
          SEQ_REPLY_NO.NEXTVAL
        , 1
        , 'user02'
        , '������ �Խñ� 1���� user02�� ���'
        , DEFAULT
        , DEFAULT
     );

INSERT
  INTO REPLY
       (
          REPLY_NO
        , RECIPE_NO
        , USER_ID
        , REPLY_CONTENT
        , REPLY_DATE
        , STATUS
      )
VALUES
      (
          SEQ_REPLY_NO.NEXTVAL
        , 2
        , 'user01'
        , '������ �Խñ� 2���� user01�� ���'
        , DEFAULT
        , DEFAULT
     );

INSERT
  INTO REPLY
       (
          REPLY_NO
        , RECIPE_NO
        , USER_ID
        , REPLY_CONTENT
        , REPLY_DATE
        , STATUS
      )
VALUES
      (
          SEQ_REPLY_NO.NEXTVAL
        , 2
        , 'user02'
        , '������ �Խñ� 2���� user02�� ���'
        , DEFAULT
        , DEFAULT
     );

INSERT
  INTO REPLY
       (
          REPLY_NO
        , RECIPE_NO
        , USER_ID
        , REPLY_CONTENT
        , REPLY_DATE
        , STATUS
      )
VALUES
      (
          SEQ_REPLY_NO.NEXTVAL
        , 3
        , 'user01'
        , '������ �Խñ� 3���� user01�� ���'
        , DEFAULT
        , DEFAULT
     );


------------------------------���ƿ� LIKED------------------------------     
CREATE TABLE LIKED(
    RECIPE_NO NUMBER NOT NULL,
    USER_ID VARCHAR2(50) NOT NULL,
    
    PRIMARY KEY(RECIPE_NO,USER_ID)
);


COMMENT ON COLUMN LIKED.RECIPE_NO IS '���� �����Ǳ� ��ȣ';
COMMENT ON COLUMN LIKED.USER_ID IS 'ȸ�� ���̵�';


----------------     PRODUCT ����     -----------------

CREATE TABLE PRODUCT(
    PRODUCT_NO NUMBER PRIMARY KEY,
    PRODUCT_NAME VARCHAR2(200) NOT NULL,
    PRICE NUMBER NOT NULL,
    SALE NUMBER NOT NULL,
    EXPLANATION VARCHAR2(4000) NOT NULL,
    LOCATION VARCHAR2(200) NOT NULL,
    PRODUCTION_DATE DATE NOT NULL,
    STOCK NUMBER NOT NULL,
    STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N', 'R')),
    COUNT NUMBER DEFAULT 0 NOT NULL,
    ENROLL_DATE DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN PRODUCT.PRODUCT_NO IS '��ǰ��ȣ';
COMMENT ON COLUMN PRODUCT.PRODUCT_NAME IS '��ǰ��';
COMMENT ON COLUMN PRODUCT.PRICE IS '��ǰ����';
COMMENT ON COLUMN PRODUCT.SALE IS '������';
COMMENT ON COLUMN PRODUCT.EXPLANATION IS '��ǰ����';
COMMENT ON COLUMN PRODUCT.LOCATION IS '������';
COMMENT ON COLUMN PRODUCT.PRODUCTION_DATE IS '��������';
COMMENT ON COLUMN PRODUCT.STOCK IS '���';
COMMENT ON COLUMN PRODUCT.STATUS IS '��ǰ����(Y/N/Ready)';
COMMENT ON COLUMN PRODUCT.COUNT IS '��ȸ��';
COMMENT ON COLUMN PRODUCT.ENROLL_DATE IS '�ۼ���';

CREATE SEQUENCE SEQ_PRODUCT_NO NOCACHE;

INSERT
  INTO PRODUCT
       (
        PRODUCT_NO
      , PRODUCT_NAME
      , PRICE
      , SALE
      , EXPLANATION
      , LOCATION
      , PRODUCTION_DATE
      , STOCK
      , STATUS
      , COUNT
      , ENROLL_DATE
      )
VALUES
      (
       SEQ_PRODUCT_NO.NEXTVAL
     , '���������� ������ ����'
     , 25000
     , 30
     , '������� �� ���ִ�?? �ܿ���� ����'
     , '���� ��â�� ��â�� ���ε������� 75'
     , '2023-09-18'
     , 50
     , 'Y'
     , DEFAULT
     , DEFAULT
     );

INSERT
  INTO PRODUCT
       (
        PRODUCT_NO
      , PRODUCT_NAME
      , PRICE
      , SALE
      , EXPLANATION
      , LOCATION
      , PRODUCTION_DATE
      , STOCK
      , STATUS
      , COUNT
      , ENROLL_DATE
      )
VALUES
      (
       SEQ_PRODUCT_NO.NEXTVAL
     , 'ũ��� ������ �߹��� ����'
     , 18000
     , 10
     , '�丮�� �� ������ �ʿ��� ���� �ٷ� ����!'
     , '���� ��õ�� ����� 9'
     , '2023-09-10'
     , 30
     , DEFAULT
     , DEFAULT
     , DEFAULT
     );

INSERT
  INTO PRODUCT
       (
        PRODUCT_NO
      , PRODUCT_NAME
      , PRICE
      , SALE
      , EXPLANATION
      , LOCATION
      , PRODUCTION_DATE
      , STOCK
      , STATUS
      , COUNT
      , ENROLL_DATE
      )
VALUES
      (
       SEQ_PRODUCT_NO.NEXTVAL
     , '�丮�� ���⸦ �Ҿ� �ִ� ���'
     , 15000
     , 10
     , '������ΰ���? ���!!'
     , '����Ư����ġ�� ������ ���۷� 21'
     , '2023-09-28'
     , 15
     , 'Y'
     , DEFAULT
     , DEFAULT
     );

INSERT
  INTO PRODUCT
       (
        PRODUCT_NO
      , PRODUCT_NAME
      , PRICE
      , SALE
      , EXPLANATION
      , LOCATION
      , PRODUCTION_DATE
      , STOCK
      , STATUS
      , COUNT
      , ENROLL_DATE
      )
VALUES
      (
       SEQ_PRODUCT_NO.NEXTVAL
     , '�������� �丶��'
     , 22000
     , 15
     , '�������� ��������~�� �ǰ� �ʹٸ� �丶�並 �缼��!'
     , '��� ���ý� ������ ������ 64'
     , '2023-10-10'
     , 20
     , DEFAULT
     , DEFAULT
     , DEFAULT
     );

INSERT
  INTO PRODUCT
       (
        PRODUCT_NO
      , PRODUCT_NAME
      , PRICE
      , SALE
      , EXPLANATION
      , LOCATION
      , PRODUCTION_DATE
      , STOCK
      , STATUS
      , COUNT
      , ENROLL_DATE
      )
VALUES
      (
       SEQ_PRODUCT_NO.NEXTVAL
     , '�Ǹ� ģ�� ������ī'
     , 12000
     , 10
     , '���� ���ߴµ��� ���� ���� ������ī'
     , '��� ���ֽ� ���ո� �ٶ����� 8'
     , '2023-10-05'
     , 10
     , 'Y'
     , DEFAULT
     , DEFAULT
     );

-----------------------------------�ֹ� ORDERS--------------------------------       
CREATE TABLE ORDERS (
   ORDER_NO NUMBER PRIMARY KEY,
   USER_ID VARCHAR2(50) NOT NULL,
   PRODUCT_NO NUMBER DEFAULT 0 NOT NULL,
   ORDER_DATE DATE DEFAULT SYSDATE NOT NULL,
   ORDER_CODE NUMBER DEFAULT 1 NOT NULL,
   TRACKING_NO VARCHAR2(2000),
   ADDRESS_MAIN VARCHAR2(2000) NOT NULL,
   ADDRESS_DETAIL VARCHAR2(2000) NOT NULL,
   RECEIVER VARCHAR2(50) NOT NULL,
   RECEIVER_PHONE VARCHAR2(20) NOT NULL,
   DELIVERY_MEMO VARCHAR2(2000),
   DELIVERY_FEE NUMBER DEFAULT 2500 NOT NULL,
   TOTAL_PRICE NUMBER DEFAULT 0 NOT NULL,
 
   FOREIGN KEY (USER_ID) REFERENCES MEMBER(USER_ID)

);

CREATE SEQUENCE SEQ_ORDERS_NO NOCACHE;

COMMENT ON COLUMN ORDERS.ORDER_NO IS '�ֹ���ȣ';
COMMENT ON COLUMN ORDERS.USER_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN ORDERS.PRODUCT_NO IS '��ǰ��ȣ';
COMMENT ON COLUMN ORDERS.ORDER_DATE IS '�ֹ�����';
COMMENT ON COLUMN ORDERS.ORDER_CODE IS '1:�̰��� / 2:�����Ϸ�(�ֹ���ȣ) / 3:����غ���(�����ȣ) / 4:����� / 5:��ۿϷ�';
COMMENT ON COLUMN ORDERS.TRACKING_NO IS '�����ȣ';
COMMENT ON COLUMN ORDERS.ADDRESS_MAIN IS '�����(�ּ�)';
COMMENT ON COLUMN ORDERS.ADDRESS_DETAIL IS '�����(��)';
COMMENT ON COLUMN ORDERS.RECEIVER IS '�޴»��';
COMMENT ON COLUMN ORDERS.RECEIVER_PHONE IS '�޴»�� ����ó';
COMMENT ON COLUMN ORDERS.DELIVERY_MEMO IS '��� ��û����';
COMMENT ON COLUMN ORDERS.DELIVERY_FEE IS '��ۺ�';
COMMENT ON COLUMN ORDERS.TOTAL_PRICE IS '�� �ֹ� �ݾ�';


--------------------�ֹ� �� ORDERS_DETAIL--------------------
CREATE TABLE ORDERS_DETAIL(
    ORDER_NO NUMBER NOT NULL,
    PRODUCT_NO NUMBER NOT NULL,
    QUANTITY NUMBER DEFAULT 0 NOT NULL,
    
    FOREIGN KEY (ORDER_NO) REFERENCES ORDERS (ORDER_NO),
    FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT (PRODUCT_NO)
);

COMMENT ON COLUMN ORDERS_DETAIL.ORDER_NO IS '�ֹ���ȣ';
COMMENT ON COLUMN ORDERS_DETAIL.PRODUCT_NO IS '��ǰ��ȣ';
COMMENT ON COLUMN ORDERS_DETAIL.QUANTITY IS '���ż���';

----------------     ATTACHMENT ����     -----------------

CREATE TABLE ATTACHMENT(
    FILE_NO NUMBER PRIMARY KEY,
    REF_PNO NUMBER NOT NULL,
    ORIGIN_NAME VARCHAR2(200) NOT NULL,
    CHANGE_NAME VARCHAR2(200) NOT NULL,
    FILE_EXP VARCHAR2(4000) NOT NULL,
    UPLOAD_DATE DATE DEFAULT SYSDATE NOT NULL,
    STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    FILE_LEVEL NUMBER DEFAULT 1 NOT NULL,
    
    FOREIGN KEY (REF_PNO) REFERENCES PRODUCT (PRODUCT_NO)
);

COMMENT ON COLUMN ATTACHMENT.FILE_NO IS '���Ϲ�ȣ';
COMMENT ON COLUMN ATTACHMENT.REF_PNO IS '������ǰ��ȣ';
COMMENT ON COLUMN ATTACHMENT.ORIGIN_NAME IS '���Ͽ�����';
COMMENT ON COLUMN ATTACHMENT.CHANGE_NAME IS '���ϼ�����';
COMMENT ON COLUMN ATTACHMENT.FILE_EXP IS '���ϼ���';
COMMENT ON COLUMN ATTACHMENT.UPLOAD_DATE IS '���Ͼ��ε���';
COMMENT ON COLUMN ATTACHMENT.STATUS IS '���ϻ���';
COMMENT ON COLUMN ATTACHMENT.FILE_LEVEL IS '���Ϸ���';

CREATE SEQUENCE SEQ_ATTACHMENT_NO NOCACHE;


----------------     REVIEW ����     -----------------

CREATE TABLE REVIEW(
    REVIEW_NO NUMBER PRIMARY KEY,
    REF_PNO NUMBER NOT NULL,
    USER_ID VARCHAR2(50) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL,
    REVIEW_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),

    FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID),
    FOREIGN KEY (REF_PNO) REFERENCES PRODUCT (PRODUCT_NO)
);

COMMENT ON COLUMN REVIEW.REVIEW_NO IS '�ı��ȣ';
COMMENT ON COLUMN REVIEW.REF_PNO IS '������ǰ��ȣ';
COMMENT ON COLUMN REVIEW.USER_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN REVIEW.CONTENT IS '�ı⳻��';
COMMENT ON COLUMN REVIEW.REVIEW_DATE IS '�ۼ���';
COMMENT ON COLUMN REVIEW.STATUS IS '�ı����';

CREATE SEQUENCE SEQ_REVIEW_NO NOCACHE;

INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 1, 'admin', '������! ���������� ������ ���ֽ��ϴ�!', '20231008', DEFAULT);

INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 1, 'user01', '�ļվ��� �̽��� ä�� �� �޾ҽ��ϴ٤��� �����մϴ�!', '20231008', DEFAULT);

INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 1, 'user02', '�ξ� ������ ���ݿ� �� �� �� ���ƿ�! ���� �̿��ҰԿ�', '20231008', DEFAULT);

INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 2, 'admin', '�����ڵ� �������ꤾ��', '20231008', DEFAULT);

INSERT INTO REVIEW
VALUES (SEQ_REVIEW_NO.NEXTVAL, 2, 'user01', '��ǰ���°� �ʹ� ���׿�! ���� �����Ϸ� ���߰ͳ׿�!', '20231008', DEFAULT);



--------------------��ٱ��� ����--------------------
CREATE TABLE CART(
    USER_ID VARCHAR2(50) NOT NULL,
    PRODUCT_NO NUMBER NOT NULL,
    QUANTITY NUMBER DEFAULT 0 NOT NULL,
    
    FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID),
    FOREIGN KEY (PRODUCT_NO) REFERENCES PRODUCT (PRODUCT_NO)
);

COMMENT ON COLUMN CART.USER_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN CART.PRODUCT_NO IS '��ǰ��ȣ';
COMMENT ON COLUMN CART.QUANTITY IS '��ǰ����';

---------------------------- QA ���� ------------------

CREATE TABLE QA(
    QA_NO NUMBER PRIMARY KEY,
    QA_CATEGORY VARCHAR2(500) NOT NULL,
    USER_ID VARCHAR2(50) NOT NULL,
    A_ID VARCHAR2(50),
    Q_TITLE VARCHAR2(500) NOT NULL,
    Q_CONTENT VARCHAR2(4000) NOT NULL,
    A_CONTENT VARCHAR2(4000),
    Q_STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (Q_STATUS IN('Y', 'N')) ,
    A_STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (A_STATUS IN('Y', 'N')) ,
    Q_DATE DATE DEFAULT SYSDATE,
    A_DATE DATE DEFAULT SYSDATE,
    
    FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID)
);

COMMENT ON COLUMN QA.QA_NO IS '�۹�ȣ';
COMMENT ON COLUMN QA.QA_CATEGORY IS 'ī�װ�';
COMMENT ON COLUMN QA.USER_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN QA.A_ID IS '�亯�� ���̵�';
COMMENT ON COLUMN QA.Q_TITLE IS '������ ����';
COMMENT ON COLUMN QA.Q_CONTENT IS '������ ����';
COMMENT ON COLUMN QA.A_CONTENT IS '�亯�� ����';
COMMENT ON COLUMN QA.Q_STATUS IS '���ǻ���';
COMMENT ON COLUMN QA.A_STATUS IS '�亯����';
COMMENT ON COLUMN QA.Q_DATE IS '�����ۼ���';
COMMENT ON COLUMN QA.A_DATE IS '�亯�ۼ���';

CREATE SEQUENCE SEQ_QA_NO NOCACHE;

INSERT
  INTO QA
VALUES (SEQ_QA_NO.NEXTVAL,1,'user01','admin','��ǰ �ļս� ���� �����Ͽ� �����ֽ��ϴ�.','��ǰ�� �ջ��ä�� ����� �Դµ� �̿������� ������å�� �ñ��մϴ�.','������å������ ������ ���ֹ��������� �亯�� �ֽ��ϴ�. �� �� �����Ͽ� �ּ���!',DEFAULT,DEFAULT,'20231008','20231009');
INSERT
  INTO QA
VALUES (SEQ_QA_NO.NEXTVAL,2,'user02','admin','��� �����Ͽ� �����ֽ��ϴ�.','��۽ÿ� �ż��� �����Ͽ� ���������ֽ��ϴ�.','���� ������ �����̴� �ż����� ���Ͽ� �������� �����ϰ� �����帮�� �ֽ��ϴ�.',DEFAULT,DEFAULT,'20231005','20231009');
INSERT
  INTO QA
VALUES (SEQ_QA_NO.NEXTVAL,3,'user01','admin','���� �����Ͽ� �����ֽ��ϴ�.','���� ����̿�� ������ �ֳ���?','���� ���ñ��� �������ּ���!',DEFAULT,DEFAULT,'20231006','20231009');

--------------------�������� ����--------------------
CREATE TABLE NOTICE(
    NOTICE_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(50) NOT NULL,
    NOTICE_TITLE VARCHAR2(500) NOT NULL,
    NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
    STATUS VARCHAR2(5) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    UPFIX VARCHAR(5) DEFAULT 'Y' CHECK (UPFIX IN('Y', 'N')),
    
    FOREIGN KEY (USER_ID) REFERENCES MEMBER (USER_ID)
);

COMMENT ON COLUMN NOTICE.NOTICE_NO IS '�۹�ȣ';
COMMENT ON COLUMN NOTICE.USER_ID IS '�ۼ���';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '������';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '�۳���';
COMMENT ON COLUMN NOTICE.STATUS IS'����';
COMMENT ON COLUMN NOTICE.UPFIX IS'��ܰ�������';

CREATE SEQUENCE SEQ_NOT_NO NOCACHE;

INSERT
 INTO NOTICE
VALUES (SEQ_NOT_NO.NEXTVAL,'admin','�����̸����� ����Ʈ�� �����Ǿ����ϴ�.','OO��OO�Ϸ� �����Ǿ����ϴ�.',DEFAULT,DEFAULT);
INSERT
 INTO NOTICE
VALUES (SEQ_NOT_NO.NEXTVAL,'admin','������ ������ ��������� �����Ǿ����ϴ�.','���� �̿��Ź�����.',DEFAULT,DEFAULT);
INSERT
 INTO NOTICE
VALUES (SEQ_NOT_NO.NEXTVAL,'admin','�ÿ����� ���ΰ�?','�ٷο���',DEFAULT,'N');

------------------------------���� SUBSCRIBE---------------------------------------------------

CREATE TABLE SUBSCRIBE (
   USER_ID VARCHAR2(50) PRIMARY KEY,
   START_DATE DATE DEFAULT SYSDATE NOT NULL,
   END_DATE DATE NOT NULL,
   BOX_SIZE VARCHAR2(5) NOT NULL,
   TERM VARCHAR2(5) NOT NULL,
   STATUS VARCHAR2(5) DEFAULT 'Y' NOT NULL,
   DISLIKE VARCHAR2(2000),
   ADDRESS VARCHAR2(2000) NOT NULL,
   DETAIL_ADDRESS VARCHAR2(2000) NOT NULL
    
    
    );
    
     INSERT INTO SUBSCRIBE
    (
        USER_ID
    ,   START_DATE
    ,   END_DATE
    ,   BOX_SIZE
    ,   TERM
    ,   STATUS
    ,   DISLIKE
    ,  ADDRESS
    ,  DETAIL_ADDRESS  
    )
    VALUES
    (
        'admin'
       ,SYSDATE
       ,SYSDATE+30
       ,1
       ,2
       ,'Y'
       ,'���,���,����'
	,'�����'
	,'������'
       );
    
     INSERT INTO SUBSCRIBE
    (
       USER_ID
    ,   START_DATE
    ,   END_DATE
    ,   BOX_SIZE
    ,   TERM
    ,   STATUS
    ,   DISLIKE
    ,  ADDRESS
    ,  DETAIL_ADDRESS  
    )
    VALUES
    (
        'user01'
       ,SYSDATE
       ,SYSDATE+30
       ,2
       ,1
       ,'Y'
       ,'��,���,����'
,'�����'
	,'������'
       );
    
     INSERT INTO SUBSCRIBE
    (
       USER_ID
    ,   START_DATE
    ,   END_DATE
    ,   BOX_SIZE
    ,   TERM
    ,   STATUS
    ,   DISLIKE
    ,  ADDRESS
    ,  DETAIL_ADDRESS  
    )
    VALUES
    (
        'user02'
       ,SYSDATE
       ,SYSDATE+30
       ,1
       ,3
       ,'Y'
       ,'���'
,'�����'
	,'������'
       );
       
        INSERT INTO SUBSCRIBE
    (
        USER_ID
    ,   START_DATE
    ,   END_DATE
    ,   BOX_SIZE
    ,   TERM
    ,   STATUS
    ,   DISLIKE
    ,  ADDRESS
    ,  DETAIL_ADDRESS  
    )
    VALUES
    (
        'user03'
       ,SYSDATE
       ,SYSDATE+30
       ,2
       ,1
       ,'Y'
       ,'���'
,'�����'
	,'������'
       );
       
        INSERT INTO SUBSCRIBE
    (
       USER_ID
    ,   START_DATE
    ,   END_DATE
    ,   BOX_SIZE
    ,   TERM
    ,   STATUS
    ,   DISLIKE
    ,  ADDRESS
    ,  DETAIL_ADDRESS  
    )
    VALUES
    (
        'user04'
       ,SYSDATE
       ,SYSDATE+30
       ,1
       ,2
       ,'Y'
       ,'����'
,'�����'
	,'������'
       );
    



----------------------------����ǰ SUB_COMP-------------------------

CREATE TABLE SUB_COMP(
    COMP_NO NUMBER PRIMARY KEY,
    COMP_NAME VARCHAR2(50) NOT NULL
    );
    
CREATE SEQUENCE SEQ_COMP_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 99999999999
NOCYCLE
NOCACHE;

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );
INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��������'
    );
    
    INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�븶��'
    );
    
    INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�ʸ�����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'������'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );


INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�񸶴�'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'ǲ����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�ٱ����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���̰���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'û�����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'ǲ����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��������'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'������'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���ߴܰ�'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'ī����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'Ȳ����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'������'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�Ѷ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�̴ϻ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����Ű��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���Ű��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�׸�Ű��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�׸�����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'ü��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�������'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��纣��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�ڵ�'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'õ����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�ñ�ġ'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���̹���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'������巹�ͽ�'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�̴� �����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�θ��׽�ũ'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'������'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���̽��÷�Ʈ'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'������'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�������'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'û��ä'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'û�ٴ�'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�������'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'û����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����ݸ���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�˹���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��Ÿ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���ٴ�'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��� �����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��� �����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���̺����ݸ�'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�ݸ��ö��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�������'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��������̽�'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'ûġĿ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�ӹ���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'û����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�ƿ�'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����ݸ�'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'ûġ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��ġĿ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�θ���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��Ʈ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��ġ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��ä��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'ȣ�ڰ���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���ο��Ʈ'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'ȫ����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�޼�����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���κ����Ʈ'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�����Ʈ'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�ݶ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'������Ʈ'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�̴ϻ����̹���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�ִϾ�����̹���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��Ÿ������'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�ִ�Ÿ������'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�����̹���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��ȭ����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�������̹���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'ǥ�����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���̹���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�򸸰��ڹ���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�����̹���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�޷�'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���ֳ���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�ݳ���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�θ�'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�̳���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�̴ϴ�ȣ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�ϼ��丶��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��ȣ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���ÿ���'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'���ܸ�����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����丶��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��Ű��ȣ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�̴�������ī'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�����ȣ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'������ī'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'ǲȣ��'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�Ǹ�'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'�ٴٱ����'
    );

INSERT INTO SUB_COMP
(
    COMP_NO
   ,COMP_NAME
   )
   VALUES
   (
    SEQ_COMP_NO.NEXTVAL
    ,'��û����'
    );

CREATE TABLE SUB_HISTORY(
    HIS_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(50) NOT NULL,
    COMP_NO1 NUMBER NOT NULL,
    COMP_NO2 NUMBER,
    COMP_NO3 NUMBER,
    COMP_NO4 NUMBER,
    COMP_NO5 NUMBER,
    HIS_DATE DATE DEFAULT SYSDATE NOT NULL,
    FOREIGN KEY (USER_ID) REFERENCES MEMBER(USER_ID),
    FOREIGN KEY (COMP_NO1) REFERENCES SUB_COMP(COMP_NO)
    );
    
     CREATE SEQUENCE SEQ_HISTORY_NO
START WITH 1
INCREMENT BY 1
MAXVALUE 99999999999
NOCYCLE
NOCACHE;
    
    
    INSERT INTO SUB_HISTORY
(
    HIS_NO
   ,USER_ID
   ,COMP_NO1
   ,COMP_NO2
   ,COMP_NO3
   ,COMP_NO4
   ,COMP_NO5
   ,HIS_DATE
   )
   VALUES
   (
    SEQ_HISTORY_NO.NEXTVAL
    ,'admin'
    ,1
    ,2
    ,3
    ,4
    ,5
    ,SYSDATE
    );

INSERT INTO SUB_HISTORY
(
    HIS_NO
   ,USER_ID
   ,COMP_NO1
   ,COMP_NO2
   ,COMP_NO3
   ,COMP_NO4
   ,COMP_NO5
   ,HIS_DATE
   )
   VALUES
   (
    SEQ_HISTORY_NO.NEXTVAL
    ,'user01'
    ,1
    ,2
    ,3
    ,4
    ,5
    ,SYSDATE
    );
    
    INSERT INTO SUB_HISTORY
(
    HIS_NO
   ,USER_ID
   ,COMP_NO1
   ,COMP_NO2
   ,COMP_NO3
   ,COMP_NO4
   ,COMP_NO5
   ,HIS_DATE
   )
   VALUES
   (
    SEQ_HISTORY_NO.NEXTVAL
    ,'user02'
    ,1
    ,2
    ,3
    ,4
    ,5
    ,SYSDATE
    );
    
    INSERT INTO SUB_HISTORY
(
    HIS_NO
   ,USER_ID
   ,COMP_NO1
   ,COMP_NO2
   ,COMP_NO3
   ,COMP_NO4
   ,COMP_NO5
   ,HIS_DATE
   )
   VALUES
   (
    SEQ_HISTORY_NO.NEXTVAL
    ,'user03'
    ,1
    ,2
    ,3
    ,4
    ,5
    ,SYSDATE
    );
    
    INSERT INTO SUB_HISTORY
(
    HIS_NO
   ,USER_ID
   ,COMP_NO1
   ,COMP_NO2
   ,COMP_NO3
   ,COMP_NO4
   ,COMP_NO5
   ,HIS_DATE
   )
   VALUES
   (
    SEQ_HISTORY_NO.NEXTVAL
    ,'user04'
    ,1
    ,2
    ,3
    ,4
    ,5
    ,SYSDATE
    );



------------------------QA_CATEGORY

CREATE TABLE QA_CATEGORY(
    CATEGORY_NO NUMBER PRIMARY KEY,
    CATEGORY_NAME VARCHAR2(50)
);

INSERT INTO QA_CATEGORY VALUES(1,'��ǰ����');
INSERT INTO QA_CATEGORY VALUES(2,'��۹���');
INSERT INTO QA_CATEGORY VALUES(3,'�ֹ�/��ҹ���');
INSERT INTO QA_CATEGORY VALUES(4,'��ǰ/��ȯ����');
INSERT INTO QA_CATEGORY VALUES(5,'�ֹ�/����');
INSERT INTO QA_CATEGORY VALUES(6,'���ⱸ������');
INSERT INTO QA_CATEGORY VALUES(7,'����/������');
INSERT INTO QA_CATEGORY VALUES(8,'ȸ����������');
INSERT INTO QA_CATEGORY VALUES(9,'��Ÿ����');


commit;