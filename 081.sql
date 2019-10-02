/*Please add ; after each select statement*/
CREATE PROCEDURE sortBookChapters()
BEGIN
    SELECT 
    dd.chapter_name
    -- dd.*
    FROM (
    SELECT 
    d.*
    , (
        -- d.c01 + d.c02 + d.c03 + d.c04 + d.c05 + d.c06 + d.c07 + d.c08 + d.c09 + d.c10 + d.c11 + d.c12 + d.c13 + d.c14 + d.c15 + d.c16 + d.c17 + d.c18 + d.c19 + d.c20
        -- d.c01 + d.c02 + d.c03 + d.c04 + d.c05 + d.c06 + d.c07 + d.c08 + d.c09 + d.c10 + d.c11 + d.c12 + d.c13 + d.c14 + d.c15 + d.c16 + d.c17 + + d.c18
        d.c01 + d.c02 + d.c03 + d.c04 + d.c05 + d.c06 + d.c07 + d.c08 + d.c09 + d.c10 + d.c11 + d.c12 + d.c13 + d.c14 + d.c15 + d.c16 + d.c17 + d.c18 + d.c19 + d.c20 + d.c21 + d.c22 + d.c23 + d.c24 + d.c25 + d.c26 + d.c27 + d.c28
    ) total
    FROM (
        SELECT 
          chapter_name
        , chapter_number

        , IF(REGEXP_LIKE(chapter_number, '(^I$)|([^IV]I$)'), 1, 0) c01
        , IF(REGEXP_LIKE(chapter_number, '(^II$)|([^IV]II$)'), 2, 0) c02
        , IF(REGEXP_LIKE(chapter_number, '(^III$)|([^IV]III)$'), 3, 0) c03
        , IF(REGEXP_LIKE(chapter_number, '(^IV$)|([^IV]IV$)'), 4, 0) c04
        , IF(REGEXP_LIKE(chapter_number, '(^VI$)|([^IV]VI$)'), 6, 0) c05
        , IF(REGEXP_LIKE(chapter_number, '(^VII$)|([^IV]VII)$'), 7, 0) c06
        , IF(REGEXP_LIKE(chapter_number, '(^VIII$)|([^IV]VII)I$'), 8, 0) c07
        , IF(REGEXP_LIKE(chapter_number, '(^IX$)|([^IV]IX$)'), 9, 0) c08
        
        , IF(REGEXP_LIKE(chapter_number, '(^V$)|([^I]V$)'), 5, 0) c09

        , IF(REGEXP_LIKE(chapter_number, '(^X$)|(((^)|([^LXI]))X((I+V?X?)+|(VI*))$)|([^LIX]X$)'), 10, 0) c10
        , IF(REGEXP_LIKE(chapter_number, '(^XX$)|(((^)|([^LXI]))XX((I+V?X?)+|(VI*))$)|([^LIX]XX$)'), 20, 0) c11
        , IF(REGEXP_LIKE(chapter_number, '(^XXX$)|(((^)|([^LXI]))XXX((I+V?X?)+|(VI*))$)|([^LIX]XXX$)'), 30, 0) c12
        , IF(REGEXP_LIKE(chapter_number, '(^XL$)|(((^)|([^LXI]))XL((I+V?X?)+|(VI*))$)|([^LIX]XL$)'), 40, 0) c13
        , IF(REGEXP_LIKE(chapter_number, '(^LX$)|(((^)|([^LXI]))LX((I+V?X?)+|(VI*))$)|([^LIX]LX$)'), 60, 0) c14
        , IF(REGEXP_LIKE(chapter_number, '(^LXX$)|(((^)|([^LXI]))LXX((I+V?X?)+|(VI*))$)|([^LIX]LXX$)'), 70, 0) c15
        , IF(REGEXP_LIKE(chapter_number, '(^LXXX$)|(((^)|([^LXI]))LXXX((I+V?X?)+|(VI*))$)|([^LIX]LXXX$)'), 80, 0) c16
        , IF(REGEXP_LIKE(chapter_number, '(^XC$)|(((^)|([^LXI]))XC((I+V?X?)+|(VI*))$)|([^LIX]XC$)'), 90, 0) c17
        
        , IF(REGEXP_LIKE(chapter_number, '(^L$)|([^LX]+L$)|(((^)|([^XL]+))L((I+X?)|(IV)|(VI*))$)'), 50, 0) c18

        , IF(REGEXP_LIKE(chapter_number, '(^C$)|((^)|[^CDX])C((I.*)|(V.*)|(X.*)|(L.*))|([^CDX]C$)'), 100, 0) c19
        , IF(REGEXP_LIKE(chapter_number, '(^CC$)|((^)|[^CDX])CC((I.*)|(V.*)|(X.*)|(L.*))|([^CDX]CC$)'), 200, 0) c20
        , IF(REGEXP_LIKE(chapter_number, '(^CCC$)|((^)|[^CDX])CCC((I.*)|(V.*)|(X.*)|(L.*))|([^CDX]CCC$)'), 300, 0) c21
        , IF(REGEXP_LIKE(chapter_number, '(^CD$)|((^)|[^CDX])CD((I.*)|(V.*)|(X.*)|(L.*))|([^CDX]CD$)'), 400, 0) c22
        , IF(REGEXP_LIKE(chapter_number, '(^DC$)|((^)|[^CDX])DC((I.*)|(V.*)|(X.*)|(L.*))|([^CDX]DC$)'), 600, 0) c23
        , IF(REGEXP_LIKE(chapter_number, '(^DCC$)|((^)|[^CDX])DCC((I.*)|(V.*)|(X.*)|(L.*))|([^CDX]DCC$)'), 700, 0) c24
        , IF(REGEXP_LIKE(chapter_number, '(^DCCC$)|((^)|[^CDX])DCCC((I.*)|(V.*)|(X.*)|(L.*))|([^CDX]DCCC$)'), 800, 0) c25
        , IF(REGEXP_LIKE(chapter_number, '(^CM$)|((^)|[^CDX])CM((I.*)|(V.*)|(X.*)|(L.*))|([^CDX]CM$)'), 900, 0) c26

        , IF(REGEXP_LIKE(chapter_number, '(^D$)|((^)|([^C]))D((I.*)|(V.*)|(X.*)|(L.*))|([^C]D$)'), 500, 0) c27

        , IF(REGEXP_LIKE(chapter_number, '(^M$)|((^)|[^CM])M((I.*)|(V.*)|(X.*)|(L.*)|(D.*))|([^CM]M$)'), 1000, 0) c28

        FROM book_chapters
    ) d
    ) dd
    ORDER BY dd.total ASC
    ;
END