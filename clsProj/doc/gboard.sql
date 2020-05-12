-- data insert

INSERT INTO
    gboard(gno, gmno, gbody)
VALUES(
    (SELECT NVL(MAX(GNO)+1, 1000) FROM gboard),
    1000, '내가 일등이다.'
);

commit;

-- 데이터 조회 질의 명령
SELECT
    gno, gmno, id, gdate, gbody body, savename avatar
FROM
    gboard, member m, avatar a
WHERE
    gmno = mno
    AND m.ano = a.ano
;


