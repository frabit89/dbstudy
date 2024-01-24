/*
    다대다 관계
    1. 2개의 테이블을 직접 관계 짓는 것은 불가능하다.
    2. 다대다 관계를 가지는 2개의 테이블과 연결될 중간 테이블이 필요하다.
    3. 일대다 관계를 2개 만들면 다대다 관계가 된다.
*/

-- 학생 테이블

CREATE TABLE STUDENT_T( 
    STUDENT_CL      NUMBER              NOT NULL    PRIMARY KEY,            --학번
    STUDENT_NAME    VARCHAR2(100 BYTE)  NOT NULL,                           --성명
    STUDENT_YR      NUMBER              NOT NULL,                           --학년
    STUDENT_GR      NUMBER              NOT NULL,                           --반
    STUDENT_MB      NUMBER              NULL                                --번호
    );

-- 과목 테이블

CREATE TABLE SUBJECT_T(
    STUDENT_SUBNUM      NUMBER              NOT NULL    PRIMARY KEY,        --과목번호
    STUDENT_SUBNAME     VARCHAR2(100 BYTE)  NOT NULL                        --과목명
    );

-- 수강신청 테이블
    
CREATE TABLE SUBSCRIP_T(
    SUBSCRIP_NO     NUMBER          NOT NULL   PRIMARY KEY,
    STUDENT_CL      NUMBER          REFERENCES STUDENT_T(STUDENT_CL)    ON DELETE SET NULL,   --과목이 지워지면 수강신청에서 과목번호만 지워진다.
    STUDENT_SUBNUM  NUMBER          REFERENCES SUBJECT_T(STUDENT_SUBNUM) ON DELETE CASCADE    --학생이 지워지면 수강신청도 지워진다.

    );


--수강신청 테이블 삭제
DROP TABLE SUBSCRIP_T;
--과목 테이블 삭제
DROP TABLE SUBJECT_T;
--학생 테이블 삭제
DROP TABLE STUDENT_T;
