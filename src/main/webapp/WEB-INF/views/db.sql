--kgh
--회원
drop table member;
create table member(
    user_idx       number(4)    primary key,    --회원번호
    user_id         varchar2(20),               --회원아이디
    user_pw         varchar2(30),               --회원비밀번호
    user_name       varchar2(20),               --회원이름
    user_email      varchar2(100),              --회원이메일
    user_email_receive   number(1),	            --회원이메일 0: 비수신 1: 수신
    user_phone      varchar2(20),               --회원연락처
    user_zip        varchar(7),                 --회원우편번호
    user_address    varchar2(225),              --회원주소
    user_birth      date,                       --회원생일
    user_gender     number(1),	                --회원성별 1: 남 2:여
    user_grade      number(1) default 0,        --회원등급 0: 일반 1:vip
    user_point      number(8) default 0,	     --회원포인트
    user_join_date  date    default sysdate,     --회원가입날짜
    user_noname1    varchar2(255),      --여분필드1
    user_noname2    varchar2(255),      --여분필드2
    user_noname3    varchar2(255)       --여분필드3    
);

drop sequence member_seq;
create sequence member_seq;

select * from member;

insert into member(user_idx, user_id, user_pw, user_name, user_email, user_email_receive, user_phone, user_zip, user_address, user_birth, user_gender,user_grade,user_point,user_join_date,user_noname1,user_noname2,user_noname3) 
values (member_seq.nextval, 'hong1234', 'qwer1234!', '홍길동', 'test@gmail.com', 0,'01012341234','123-123','주소','2000/01/01',1,0,3000, sysdate,'','','');


--회원탈퇴
drop table memberOut;
create table memberOut(
    memberOut_idx       number(4) primary key,    --탈퇴번호
    memberOut_id      varchar2(20),               --탈퇴아이디
    memberOut_type    number(1) ,                  --탈퇴사유(1:이용률감소 2:상품저품질 3:상품가격불만 4:고객서비스불만 5:기타)
    memberOut_content      varchar2(255),           --탈퇴메시지
    memberOut_date     date default sysdate,       --탈퇴일시
    memberOut_noname1      varchar2(255),           --여유필드1
    memberOut_noname2      varchar2(255)           --여유필드2
);
drop sequence memberout_seq;
create sequence memberout_seq;

select * from memberout;

insert into memberout(memberout_idx, memberout_id, memberout_type, memberout_content, memberout_date, memberout_noname1, memberout_noname2)
values (memberout_seq.nextval, 'hong1234', 1, '탈퇴메시지', sysdate, '','');


--pym
--공지사항
drop table notice;
CREATE TABLE notice (
    notice_idx      number(4) PRIMARY KEY,      --공지사항번호
    notice_opt      number(1) default 0,        --공지구분(0:일반공지 1:중요공지)
    notice_title    varchar2(100),              --제목  
    notice_content  varchar2(2000),             --내용
    notice_writer   varchar2(20),               --작성자(아이디)
    notice_date     date    default sysdate,    --작성일
    notice_hit      varchar2(100) default 0,    --조회수
    notice_file     varchar2(255),              --첨부파일
    notice_noname   varchar2(255)               --여분필드
);

drop sequence notice_seq;
create sequence notice_seq;

select * from notice;

insert into notice(notice_idx, notice_opt, notice_title, notice_content, notice_writer, notice_date, notice_hit, notice_file, notice_noname)
values (notice_seq.nextval, 0, '공지사항제목입니다.', '공지사항 내용입니다.', 'testId', sysdate, 0, 'img.jpg','');

--자주하는질문
drop table faq;
CREATE TABLE faq (
    faq_idx         number(4)       PRIMARY KEY,        --자주하는질문번호
    faq_category    number(1)       default 0,          --카테고리 (1:배송/포장  2:상품  3:선물하기  4:주문/결제/대량주문)
    faq_title       varchar2(100),                      --제목
    faq_content     varchar2(2000),                     --내용
    faq_writer      varchar2(20),                       --작성자(아이디)
    faq_hit         varchar2(100)   default 0,          --조회수
    faq_date        date            default sysdate,    --작성일
    faq_noname      varchar2(255)                       --여분필드
);

drop sequence faq_seq;
create sequence faq_seq;

select * from faq;

insert into faq(faq_idx, faq_category, faq_title, faq_content, faq_writer, faq_hit, faq_date, faq_noname)
values (faq_seq.nextval, 1, '배송/포장은 어떻게 하나요?', '배송 및 포장 안내드립니다....', 'easychelin', 0, sysdate, '');


--상품문의
drop table goodsQna;
CREATE TABLE goodsQna (
    goodsQna_idx            number(4)       PRIMARY KEY,        --상품문의번호
    goods_idx               number(4)       not null,           --상품번호
    goods_opt               number(1)       default 0,          --공지 checked : 1
    goodsQna_category       number(1)       default 0,          --카테고리(1:상품 2:배송 3:주문/결제/대량주문 4:교환/반품 5:기타)
    goodsQna_title          varchar2(100),                      --제목
    goodsQna_content        varchar2(2000),                     --내용
    goodsQna_writer         varchar2(20),                       --작성자(아이디)
    goodsQna_date           date            default sysdate,    --작성일  
    goodsQnaReply_opt       number(1)       default 0,          --답글여부 (0:문의글 1:답변글)
    goodsQnaReply_title     varchar2(100),                      --답글제목
    goodsQnaReply_content   varchar2(2000),                     --답글내용
    goodsQnaReply_writer    varchar2(20),                       --답글작성자(아이디)
    goodsQnaReply_date      date            default sysdate,    --답글작성일
    goodsQna_noname         varchar2(255)                       --여분필드
);

drop sequence goodsQna_seq;
create sequence goodsQna_seq;

select * from goodsQna;

insert into goodsQna(goodsQna_idx, goods_idx, goods_opt, goodsQna_category, goodsQna_title, goodsQna_content, goodsQna_writer, goodsQna_date, 
goodsQnaReply_opt, goodsQnaReply_title, goodsQnaReply_content, goodsQnaReply_writer, goodsQnaReply_date, goodsQna_noname)
values (goodsQna_seq.nextval, 0001, 0, 1, '배송/포장은 어떻게 하나요?', '배송 및 포장 안내드립니다....', 'easychelin', sysdate, 0, '', '', '', '', '');


--1:1문의
drop table qna;
CREATE TABLE qna (
    qna_idx             number(4)   PRIMARY KEY,        --1:1문의번호
    buy_idx             number(10),                     --주문번호
    qna_category        number(1)   default 0,          --카테고리(1:배송지연/불만 2:반품/환불문의 3:주문/결제문의 4:회원정보문의 5:취소문의 6:교환문의 7:기타문의)
    qna_title           varchar2(100),                  --제목
    qna_content         varchar2(2000),                 --내용
    qna_email           varchar2(100),                  --작성자(이메일) 수정가능
    qna_email_receive   number(1)   default 0,          --답변메일수신 1: 수신
    qna_writer          varchar2(20),                   --작성자(아이디)
    qna_date            date        default sysdate,    --작성일
    qnaReply_opt        number(1)   default 0,          --답글여부(0:문의글  1:답변글)
    qnaReply_title      varchar2(100),                  --답글제목
    qnaReply_content    varchar2(2000),                 --답글내용
    qnaReply_writer     varchar2(20),                   --답글작성자(아이디)
    qnaReply_date       date        default sysdate,    --답글작성일
    qna_noname          varchar2(255)                   --여분필드
);

drop sequence qna_seq;
create sequence qna_seq;

select * from qna;

insert into qna(qna_idx, buy_idx, qna_category, qna_title, qna_content, qna_email, qna_email_receive, qna_writer, qna_date,  
qnaReply_opt, qnaReply_title, qnaReply_content, qnaReply_writer, qnaReply_date, qna_noname)
values (qna_seq.nextval, 2201210001, 1, '배송은 언제되나요?', '배송 안내드립니다....', 'test@naver.com', 1, 'easychelin', sysdate, 0, '', '', '', '', '');


--상품평
drop table review;
CREATE TABLE review ( 
    review_idx      number(4)   PRIMARY KEY,        --상품평번호
    buy_idx         number(10)  not null,           --주문번호
    review_star     number(1),                      --평점(1:매우만족 2:만족 3:보통 4:불만 5:매우불만)
    review_title    varchar2(100),                  --제목
    review_content  varchar2(2000),                 --내용
    review_writer   varchar2(20),                   --작성자(아이디)
    review_img      varchar2(255),                  --첨부이미지
    review_date     date        default sysdate,    --작성일
    review_noname   varchar2(255)                   --여유필드
);

drop sequence review_seq;
create sequence review_seq;

select * from review;

insert into review(review_idx, buy_idx, review_star, review_title, review_content, review_writer, review_img, review_date, review_noname)
values (review_seq.nextval, 2201210001, 1, '맛있어요~', '배송도 빠르고, 맛도 좋아....', 'easychelin', 'img.jpg', sysdate, '');


--이벤트
drop table event;
CREATE TABLE event (
    event_idx           number(4)   PRIMARY KEY,        --이벤트번호
    event_list_img      varchar2(255),                  --리스트에서 보여지는 이미지
    event_title         varchar2(100),                  --제목
    event_list_content  varchar2(200),                  --리스트에서 보여지는 내용
    event_periodStart   date,                           --이벤트 시작일
    event_periodEnd     date,                           --이벤트 종료일
    event_hit           number(10),                     --조회수
    event_view_content  varchar2(2000),                 --뷰에서 보여지는 내용
    event_date          date        default sysdate,    --이벤트등록일
    event_noname        varchar2(255)                   --여분필드
);

drop sequence event_seq;
create sequence event_seq;

select * from event;

insert into event(event_idx, event_list_img, event_title, event_list_content, event_periodStart, event_periodEnd, event_hit, event_view_content, event_date, event_noname)
values (event_seq.nextval, 'img.jpg', '첫 구매 이벤트', '첫구매하고 적립금도 받자...', '2022/01/01', '2022/02/15', 0, '첫구매이벤트 안내입니다..', sysdate, '');


--khr
-- 상품 카테고리 db 만들기
drop table goodsCate;
create table goodsCate(
    goodsCate1          number(1) NOT NULL,     -- 1차 상품 카테고리(1:밀키트 2:신선식품 3:냉동식품 4:건강식품)
    goodsCate2_idx      number(2) PRIMARY KEY,  -- 2차 상품 카테고리
    goodsCate2_name     varchar2(50),           -- 2차 상품 카테고리명
    goodsCate2_noname1  varchar2(255),          -- 여유필드1
    goodsCate2_noname2  varchar2(255)           -- 여유필드2
);
drop sequence goodsCate_seq;
create sequence goodsCate_seq;

select * from goodsCate;

insert into goodsCate(goodsCate2_idx, goodsCate1, goodsCate2_name, goodsCate2_noname1, goodsCate2_noname2)
values (goodsCate_seq.nextval, 2, '채소', '', '');


-- 상품 db 만들기
drop table goods;
create table goods(
    goods_idx           number(4) PRIMARY KEY,  -- 상품번호
    goodsCate1          number(1),              -- 1차 상품 카테고리(1: 밀키트 / 2: 신선 / 3:냉동 / 4: 건강)
    goodsCate2_idx      number(2),              -- 2차 상품 카테고리
    goods_brand         varchar2(60),           -- 상품브랜드
    goods_name          varchar2(100),          -- 상품명
    goods_summary       varchar2(100),          -- 상품간략소개
    goods_inew          char(1) DEFAULT '0',    -- 상품특성(신상품) 선택 : 1
    goods_ibest         char(1) DEFAULT '0',    -- 상품특성(베스트) 선택 : 1
    goods_isale         char(1) DEFAULT '0',    -- 상품특성(세일) 선택 : 1
    goods_isoldout      char(1) DEFAULT '0',    -- 상품특성(품절) 선택 : 1
    goods_price         number(7),              -- 정가
    goods_salePrice     number(7),              -- 할인가(판매가)
    goods_maxbuy        number(2) DEFAULT 20,   -- 최대 구매 가능 수
    goods_point         char(1) DEFAULT '0',    -- 적립금(1: 기본 적립금 / 2: 별도 적립금 / 3: 적립금 없음)
    goods_delivery      char(1) DEFAULT '0',    -- 배송비(1: 기본 배송비 / 2: 별도 배송비 / 3: 배송비 없음)
    goods_weight        varchar2(100),          -- 중량/용량
    goods_allergy       varchar2(2000),         -- 알레르기 정보
    goods_item_use      char(1) DEFAULT '0',    -- 상품추가항목(1: 사용 / 0: 사용안함)
    goods_item1_title   varchar2(30),           -- 항목1 제목
    goods_item1_content varchar2(1000),         -- 항목1 내용
    goods_item2_title   varchar2(30),           -- 항목2 제목
    goods_item2_content varchar2(1000),         -- 항목2 내용
    goods_count         number(2) DEFAULT 1,    -- 상품수량
    goods_detail        varchar2(1000),         -- 상품상세정보
    goods_hit           number(10) DEFAULT 0,   -- 조회수
    goods_star          number(1) DEFAULT 0,    -- 평점
    goods_sale_count    number(10) DEFAULT 0,   -- 판매수
    goods_indate        date DEFAULT sysdate,   -- 상품 등록일
    goods_modidate      date DEFAULT sysdate,   -- 상품 수정일
    goods_available     number(4) default 9999, -- 재고수량
    goods_delinfo_opt   number(1) DEFAULT 0,    -- 상품 배송 정보(선택 : 1)
    goods_delinfo_text  varchar2(2000),         -- 별도 배송 정보
    goods_return_opt    number(1) DEFAULT 0,    -- 교환반품 정보(선택 : 1)
    goods_return_text   varchar2(2000),         -- 별도 교환반품 정보
    goods_img_main      varchar2(255),          -- 상품 메인/리스트 이미지
    goods_img_detail1   varchar2(255),          -- 상품 상세보기1 이미지
    goods_img_detail2   varchar2(255),          -- 상품 상세보기2 이미지
    goods_img_detail3   varchar2(255),          -- 상품 상세보기3 이미지
    goods_img_detail4   varchar2(255),          -- 상품 상세보기4 이미지
    goods_noname1       varchar2(255),          -- 여유필드1
    goods_noname2       varchar2(255)           -- 여유필드2
);

drop sequence goods_seq;
create sequence goods_seq;

select * from goods;

INSERT INTO goods (goods_idx, goodsCate1, goodsCate2_idx, goods_brand, goods_name, goods_summary,
                   goods_inew, goods_ibest, goods_isale, goods_isoldout, goods_price, goods_salePrice,
                   goods_maxbuy, goods_point, goods_delivery, goods_weight, goods_allergy,
                   goods_item_use, goods_item1_title, goods_item1_content, goods_item2_title, goods_item2_content,
                   goods_count, goods_detail, goods_hit, goods_star, goods_sale_count, goods_indate, goods_modidate,
                   goods_available, goods_delinfo_opt, goods_delinfo_text, goods_return_opt, goods_return_text,
                   goods_img_main, goods_img_detail1, goods_img_detail2, goods_img_detail3, goods_img_detail4,
                   goods_noname1, goods_noname2) 
values (goods_seq.nextval, 1, 05, '스윗밸런스', '오늘의 샐러드 6종', '다채로운 토핑을 얹은 샐러드',
        '1', '1', '1', '1', 4900, 4165, 5, '1', '1', '1통(240g)', '쉬림프 에그 샐러드 : 토마토, 대두, 새우, 알류, 우유, 밀, 조개류 함유', '0', '', '', '', '',
        1, '01. 쉬림프 에그 샐러드', 0, 1, 0, sysdate, sysdate, 9999, 0, '', 0, '', 'main.jpg', 'subimg1.jpg', 'subimg2.jpg', 'subimg3.jpg', 'subimg4.jpg', '', '');

--sej
--장바구니
drop table cart;
create table cart(
    cart_idx        number(4) not null  primary key,    --카드번호
    user_idx        number(4) not null,     --회원아이디
    goods_idx       number(4),              --상품아이디
    cart_img        varchar2(255),          --상품이미지
    cart_brand      varchar2(60),           --상품브랜드   
    cart_name       varchar2(100),          --상품명
    cart_pcs        number(4),              --상품수량
    cart_subPrice   number(10),             --상품단가
    cart_noname1    varchar2(255),          --여분필드1
    cart_noname2    varchar2(255)           --여분필드2  
);
drop sequence cart_seq;
create sequence cart_seq; 

select * from cart;

insert into cart(cart_idx, user_idx, goods_idx, cart_img, cart_brand, cart_name, cart_pcs, cart_subPrice, cart_noname1, cart_noname2)
values (cart_seq.nextval, 0001, 0120, 'img.jpg', '스윗밸런스', '샐러드 6종', 5, 9600, '', '');


--주문
drop table buy;
create table buy(
    buy_idx         number(10)  not null  primary key,    --주문번호
    user_idx        number(4)   not null,           --회원아이디
    receive_name    varchar2(20),                   --수취인 이름
    receive_phone   varchar2(20),                   --수취인 전화번호
    receive_zip     varchar2(7),                    --수취인 우편번호
    receive_add     varchar2(255),                  --수취인 주소
    buy_message     varchar2(255),                  --배송메시지
    buy_totalPrice  number(10),                     --상품총금액
    buy_usePoint    number(8)   default 0,          --사용적립금	
    buy_useCupon    number(8)   default 0,	        --사용쿠폰   
    buy_fare        number(8)   default 0,	        --배송비
    buy_payment     number(8)   default 0,	        --결제금액
    buy_date        date        default sysdate,    --주문일
    buy_state       number(1)   default 1,          --주문상태(1:주문확인전 2:상품준비중 3:배송중 4:배송완료)
    buy_returnState number(1)   default 1,          --교환/변경일 (1:신규 2:취소 3:교환 4:반품)
    buy_deliveryNo  varchar2(255),                  --송장번호
    buy_noname1     varchar2(255),                  --여유필드1
    buy_noname2     varchar2(255)                   --여유필드2
);

drop sequence buy_seq;
create sequence buy_seq; 

select * from buy;

insert into buy(buy_idx, user_idx, receive_name, receive_phone, receive_zip, receive_add, 
buy_message, buy_totalPrice, buy_usePoint, buy_useCupon, buy_fare, buy_payment, buy_date,
buy_state, buy_returnState, buy_deliveryNo, buy_noname1, buy_noname2)
values (buy_seq.nextval, 0001, '홍길동', '01012345678', '123-123', '서울...', '문앞', 13800, 1000, 0, 3500, 9300, sysdate, 1, 1, '', '', '');


--배너
drop table banner;
create table banner(
    banner_idx      number(4)   not null    primary key,    --배너번호
    banner_cate     number(1)   default 0,  --배너카테고리(1:GNB 2:메인1-캐러셀 3:메인2  4:상품카테고리  5:마이페이지 6:로그인 7:기타-여분)
    banner_on       number(1)   default 0,  --노출구분 (1:노출 2:숨김)
    banner_goods    number(20),             --제품카테고리(banner_cate4일경우 필수입력)
    banner_file     varchar2(255),          --첨부이미지
    banner_txt      varchar2(255),          --대체텍스트
    banner_url      varchar2(255),          --링크
    banner_date     date        default sysdate,    --배너 등록일
    banner_noname1  varchar2(255),          --여분필드1
    banner_noname2  varchar2(255)           --여분필드2
);
drop sequence banner_seq;
create sequence banner_seq; 

select * from banner;    

insert into banner(banner_idx, banner_cate, banner_on, banner_goods, banner_file, banner_txt, 
banner_url, banner_date, banner_noname1, banner_noname2)
values (banner_seq.nextval, 4, 1, '101', 'img.jpg', '', 'http://www.naver.com', sysdate, '', '');

--적립금
drop table easyPoint;
create table easyPoint(
    easyPoint_idx       number(4)       not null primary key,   --적립금번호
    user_idx            number(4)       not null,           --회원아이디(외래키 설정 전)
    easyPoint_type      varchar2(20)    default 0,          --적립금 종류(1:적립  2:사용  3:취소  4:소멸)
    easyPoint_content   varchar2(255),                      --적립금 내용
    easyPoint_money     number(8)       default 0,          --적립금 점수
    easyPoint_date      date            default sysdate,    --적립금 발생일시
    easyPoint_noname1   varchar2(255),                      --여유필드1
    easyPoint_noname2   varchar2(255)                       --여유필드2
);
drop sequence easyPoint_seq;
create sequence easyPoint_seq; 

select * from easyPoint; 

insert into easyPoint(easyPoint_idx, user_idx, easyPoint_type, easyPoint_content, easyPoint_money, easyPoint_date, easyPoint_noname1, easyPoint_noname2)
values (easyPoint_seq.nextval, 0001, 1, '상품구매', '500', sysdate, '', '');

--약관관리
drop table terms;
create table terms(
    terms_idx       number(4)   not null primary key,   --약관관리 번호
    terms_title     varchar2(100),                  --약관제목
    terms_content   varchar2(3000),                 --약관내용
    terms_opt       number(1)   default 0,          --동의구분(1:필수 2:선택)
    terms_date      date        default sysdate,    --등록일
    terms_noname   varchar2(255)                   --여분필드
);
drop sequence terms_seq;
create sequence terms_seq;

select * from terms;

insert into terms(terms_idx, terms_title, terms_content, terms_opt, terms_date, terms_noname)
values (terms_seq.nextval, '서비스 이용 약관 동의', '약관....', 1, sysdate, '');


--정책관리
drop table easyPolicy;
create table easyPolicy(
    easyPolicy_idx       number(4)   not null primary key,   --정책관리 번호
    easyPolicy_title     varchar2(100),                  --정책제목
    easyPolicy_content   varchar2(3000),                 --정책내용
    easyPolicy_date      date        default sysdate,    --등록일
    easyPolicy_noname   varchar2(255)                    --여분필드
);
drop sequence easyPolicy_seq;
create sequence easyPolicy_seq;

select * from easyPolicy;

insert into easyPolicy(easyPolicy_idx, easyPolicy_title, easyPolicy_content, easyPolicy_date, easyPolicy_noname)
values (easyPolicy_seq.nextval, '배송비정책', '배송비...', sysdate, '');


commit;