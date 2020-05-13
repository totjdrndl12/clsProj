CREATE TABLE reboard(
    reno NUMBER(4)
        CONSTRAINT REBD_NO_PK PRIMARY KEY,
    remno NUMBER(4)
        CONSTRAINT REBD_MNO_FK REFERENCES member(mno)
        CONSTRAINT REBD_MNO_NN NOT NULL,
    rebody VARCHAR2(4000)
        CONSTRAINT REBD_BODY_NN NOT NULL,
    redate DATE DEFAULT sysdate
        CONSTRAINT REBD_DATE_NN NOT NULL,
    reupno NUMBER(4),
    isShow CHAR(1) DEFAULT 'Y'
        CONSTRAINT REBD_SHOW_CK CHECK (isShow IN('Y', 'N'))
        CONSTRAINT REBD_SHOW_NN NOT NULL
);

-- DATA INSERT

INSERT INTO 
    reboard(reno, remno, rebody, reupno)
VALUES(
    (SELECT NVL(MAX(reno) + 1, 1000) FROM reboard),
    1000, '내가 처음이다.', null
);


INSERT INTO 
    reboard(reno, remno, rebody, reupno)
VALUES(
    (SELECT NVL(MAX(reno) + 1, 1000) FROM reboard),
    1002, '네! 선생님....', 1000
);


INSERT INTO 
    reboard(reno, remno, rebody, reupno)
VALUES(
    (SELECT NVL(MAX(reno) + 1, 1000) FROM reboard),
    1001, 'dDragon!!!', 1001
);

INSERT INTO 
    reboard(reno, remno, rebody, reupno)
VALUES(
    (SELECT NVL(MAX(reno) + 1, 1000) FROM reboard),
    9999, 'Do It!!!', null
);


INSERT INTO 
    reboard(reno, remno, rebody, reupno)
VALUES(
    (SELECT NVL(MAX(reno) + 1, 1000) FROM reboard),
    1000, 'Yes!!!', 1003
);
/*

1002	서동혁	sdh
1000	전은석	euns
1001	최두용	dDragon
9999	김수진	chairman
1003	김이슬	jinro
*/
select * from member;


SELECT
    rno, reno, id, remno, rebody, reupno, redate, step
FROM
    (
        SELECT
            ROWNUM RNO, R.*
        FROM
            (SELECT
                RENO, REMNO, REBODY, REUPNO, REDATE,
                (LEVEL -1) step, id, savename avatar
            FROM
                REBOARD, member m, avatar a
            WHERE
                isShow = 'Y'
                AND m.ano = a.ano
            START WITH
                REUPNO IS NULL
            CONNECT BY
                PRIOR RENO = REUPNO) R
    )
WHERE
    RNO BETWEEN 2 AND 3
    AND mno = remno
;

commit;