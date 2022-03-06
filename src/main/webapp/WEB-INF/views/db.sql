--kgh
--ȸ��
drop table member;
create table member(
    user_idx       number(4)    primary key,    --ȸ����ȣ
    user_id         varchar2(20),               --ȸ�����̵�
    user_pw         varchar2(30),               --ȸ����й�ȣ
    user_name       varchar2(20),               --ȸ���̸�
    user_email      varchar2(100),              --ȸ���̸���
    user_email_receive   number(1),	            --ȸ���̸��� 0: ����� 1: ����
    user_phone      varchar2(20),               --ȸ������ó
    user_zip        varchar(7),                 --ȸ�������ȣ
    user_address    varchar2(225),              --ȸ���ּ�
    user_birth      date,                       --ȸ������
    user_gender     number(1),	                --ȸ������ 1: �� 2:��
    user_grade      number(1) default 0,        --ȸ����� 0: �Ϲ� 1:vip
    user_point      number(8) default 0,	     --ȸ������Ʈ
    user_join_date  date    default sysdate,     --ȸ�����Գ�¥
    user_noname1    varchar2(255),      --�����ʵ�1
    user_noname2    varchar2(255),      --�����ʵ�2
    user_noname3    varchar2(255)       --�����ʵ�3    
);

drop sequence member_seq;
create sequence member_seq;

select * from member;

insert into member(user_idx, user_id, user_pw, user_name, user_email, user_email_receive, user_phone, user_zip, user_address, user_birth, user_gender,user_grade,user_point,user_join_date,user_noname1,user_noname2,user_noname3) 
values (member_seq.nextval, 'hong1234', 'qwer1234!', 'ȫ�浿', 'test@gmail.com', 0,'01012341234','123-123','�ּ�','2000/01/01',1,0,3000, sysdate,'','','');


--ȸ��Ż��
drop table memberOut;
create table memberOut(
    memberOut_idx       number(4) primary key,    --Ż���ȣ
    memberOut_id      varchar2(20),               --Ż����̵�
    memberOut_type    number(1) ,                  --Ż�����(1:�̿������ 2:��ǰ��ǰ�� 3:��ǰ���ݺҸ� 4:�����񽺺Ҹ� 5:��Ÿ)
    memberOut_content      varchar2(255),           --Ż��޽���
    memberOut_date     date default sysdate,       --Ż���Ͻ�
    memberOut_noname1      varchar2(255),           --�����ʵ�1
    memberOut_noname2      varchar2(255)           --�����ʵ�2
);
drop sequence memberout_seq;
create sequence memberout_seq;

select * from memberout;

insert into memberout(memberout_idx, memberout_id, memberout_type, memberout_content, memberout_date, memberout_noname1, memberout_noname2)
values (memberout_seq.nextval, 'hong1234', 1, 'Ż��޽���', sysdate, '','');


--pym
--��������
drop table notice;
CREATE TABLE notice (
    notice_idx      number(4) PRIMARY KEY,      --�������׹�ȣ
    notice_opt      number(1) default 0,        --��������(0:�Ϲݰ��� 1:�߿����)
    notice_title    varchar2(100),              --����  
    notice_content  varchar2(2000),             --����
    notice_writer   varchar2(20),               --�ۼ���(���̵�)
    notice_date     date    default sysdate,    --�ۼ���
    notice_hit      varchar2(100) default 0,    --��ȸ��
    notice_file     varchar2(255),              --÷������
    notice_noname   varchar2(255)               --�����ʵ�
);

drop sequence notice_seq;
create sequence notice_seq;

select * from notice;

insert into notice(notice_idx, notice_opt, notice_title, notice_content, notice_writer, notice_date, notice_hit, notice_file, notice_noname)
values (notice_seq.nextval, 0, '�������������Դϴ�.', '�������� �����Դϴ�.', 'testId', sysdate, 0, 'img.jpg','');

--�����ϴ�����
drop table faq;
CREATE TABLE faq (
    faq_idx         number(4)       PRIMARY KEY,        --�����ϴ�������ȣ
    faq_category    number(1)       default 0,          --ī�װ� (1:���/����  2:��ǰ  3:�����ϱ�  4:�ֹ�/����/�뷮�ֹ�)
    faq_title       varchar2(100),                      --����
    faq_content     varchar2(2000),                     --����
    faq_writer      varchar2(20),                       --�ۼ���(���̵�)
    faq_hit         varchar2(100)   default 0,          --��ȸ��
    faq_date        date            default sysdate,    --�ۼ���
    faq_noname      varchar2(255)                       --�����ʵ�
);

drop sequence faq_seq;
create sequence faq_seq;

select * from faq;

insert into faq(faq_idx, faq_category, faq_title, faq_content, faq_writer, faq_hit, faq_date, faq_noname)
values (faq_seq.nextval, 1, '���/������ ��� �ϳ���?', '��� �� ���� �ȳ��帳�ϴ�....', 'easychelin', 0, sysdate, '');


--��ǰ����
drop table goodsQna;
CREATE TABLE goodsQna (
    goodsQna_idx            number(4)       PRIMARY KEY,        --��ǰ���ǹ�ȣ
    goods_idx               number(4)       not null,           --��ǰ��ȣ
    goods_opt               number(1)       default 0,          --���� checked : 1
    goodsQna_category       number(1)       default 0,          --ī�װ�(1:��ǰ 2:��� 3:�ֹ�/����/�뷮�ֹ� 4:��ȯ/��ǰ 5:��Ÿ)
    goodsQna_title          varchar2(100),                      --����
    goodsQna_content        varchar2(2000),                     --����
    goodsQna_writer         varchar2(20),                       --�ۼ���(���̵�)
    goodsQna_date           date            default sysdate,    --�ۼ���  
    goodsQnaReply_opt       number(1)       default 0,          --��ۿ��� (0:���Ǳ� 1:�亯��)
    goodsQnaReply_title     varchar2(100),                      --�������
    goodsQnaReply_content   varchar2(2000),                     --��۳���
    goodsQnaReply_writer    varchar2(20),                       --����ۼ���(���̵�)
    goodsQnaReply_date      date            default sysdate,    --����ۼ���
    goodsQna_noname         varchar2(255)                       --�����ʵ�
);

drop sequence goodsQna_seq;
create sequence goodsQna_seq;

select * from goodsQna;

insert into goodsQna(goodsQna_idx, goods_idx, goods_opt, goodsQna_category, goodsQna_title, goodsQna_content, goodsQna_writer, goodsQna_date, 
goodsQnaReply_opt, goodsQnaReply_title, goodsQnaReply_content, goodsQnaReply_writer, goodsQnaReply_date, goodsQna_noname)
values (goodsQna_seq.nextval, 0001, 0, 1, '���/������ ��� �ϳ���?', '��� �� ���� �ȳ��帳�ϴ�....', 'easychelin', sysdate, 0, '', '', '', '', '');


--1:1����
drop table qna;
CREATE TABLE qna (
    qna_idx             number(4)   PRIMARY KEY,        --1:1���ǹ�ȣ
    buy_idx             number(10),                     --�ֹ���ȣ
    qna_category        number(1)   default 0,          --ī�װ�(1:�������/�Ҹ� 2:��ǰ/ȯ�ҹ��� 3:�ֹ�/�������� 4:ȸ���������� 5:��ҹ��� 6:��ȯ���� 7:��Ÿ����)
    qna_title           varchar2(100),                  --����
    qna_content         varchar2(2000),                 --����
    qna_email           varchar2(100),                  --�ۼ���(�̸���) ��������
    qna_email_receive   number(1)   default 0,          --�亯���ϼ��� 1: ����
    qna_writer          varchar2(20),                   --�ۼ���(���̵�)
    qna_date            date        default sysdate,    --�ۼ���
    qnaReply_opt        number(1)   default 0,          --��ۿ���(0:���Ǳ�  1:�亯��)
    qnaReply_title      varchar2(100),                  --�������
    qnaReply_content    varchar2(2000),                 --��۳���
    qnaReply_writer     varchar2(20),                   --����ۼ���(���̵�)
    qnaReply_date       date        default sysdate,    --����ۼ���
    qna_noname          varchar2(255)                   --�����ʵ�
);

drop sequence qna_seq;
create sequence qna_seq;

select * from qna;

insert into qna(qna_idx, buy_idx, qna_category, qna_title, qna_content, qna_email, qna_email_receive, qna_writer, qna_date,  
qnaReply_opt, qnaReply_title, qnaReply_content, qnaReply_writer, qnaReply_date, qna_noname)
values (qna_seq.nextval, 2201210001, 1, '����� �����ǳ���?', '��� �ȳ��帳�ϴ�....', 'test@naver.com', 1, 'easychelin', sysdate, 0, '', '', '', '', '');


--��ǰ��
drop table review;
CREATE TABLE review ( 
    review_idx      number(4)   PRIMARY KEY,        --��ǰ���ȣ
    buy_idx         number(10)  not null,           --�ֹ���ȣ
    review_star     number(1),                      --����(1:�ſ츸�� 2:���� 3:���� 4:�Ҹ� 5:�ſ�Ҹ�)
    review_title    varchar2(100),                  --����
    review_content  varchar2(2000),                 --����
    review_writer   varchar2(20),                   --�ۼ���(���̵�)
    review_img      varchar2(255),                  --÷���̹���
    review_date     date        default sysdate,    --�ۼ���
    review_noname   varchar2(255)                   --�����ʵ�
);

drop sequence review_seq;
create sequence review_seq;

select * from review;

insert into review(review_idx, buy_idx, review_star, review_title, review_content, review_writer, review_img, review_date, review_noname)
values (review_seq.nextval, 2201210001, 1, '���־��~', '��۵� ������, ���� ����....', 'easychelin', 'img.jpg', sysdate, '');


--�̺�Ʈ
drop table event;
CREATE TABLE event (
    event_idx           number(4)   PRIMARY KEY,        --�̺�Ʈ��ȣ
    event_list_img      varchar2(255),                  --����Ʈ���� �������� �̹���
    event_title         varchar2(100),                  --����
    event_list_content  varchar2(200),                  --����Ʈ���� �������� ����
    event_periodStart   date,                           --�̺�Ʈ ������
    event_periodEnd     date,                           --�̺�Ʈ ������
    event_hit           number(10),                     --��ȸ��
    event_view_content  varchar2(2000),                 --�信�� �������� ����
    event_date          date        default sysdate,    --�̺�Ʈ�����
    event_noname        varchar2(255)                   --�����ʵ�
);

drop sequence event_seq;
create sequence event_seq;

select * from event;

insert into event(event_idx, event_list_img, event_title, event_list_content, event_periodStart, event_periodEnd, event_hit, event_view_content, event_date, event_noname)
values (event_seq.nextval, 'img.jpg', 'ù ���� �̺�Ʈ', 'ù�����ϰ� �����ݵ� ����...', '2022/01/01', '2022/02/15', 0, 'ù�����̺�Ʈ �ȳ��Դϴ�..', sysdate, '');


--khr
-- ��ǰ ī�װ� db �����
drop table goodsCate;
create table goodsCate(
    goodsCate1          number(1) NOT NULL,     -- 1�� ��ǰ ī�װ�(1:��ŰƮ 2:�ż���ǰ 3:�õ���ǰ 4:�ǰ���ǰ)
    goodsCate2_idx      number(2) PRIMARY KEY,  -- 2�� ��ǰ ī�װ�
    goodsCate2_name     varchar2(50),           -- 2�� ��ǰ ī�װ���
    goodsCate2_noname1  varchar2(255),          -- �����ʵ�1
    goodsCate2_noname2  varchar2(255)           -- �����ʵ�2
);
drop sequence goodsCate_seq;
create sequence goodsCate_seq;

select * from goodsCate;

insert into goodsCate(goodsCate2_idx, goodsCate1, goodsCate2_name, goodsCate2_noname1, goodsCate2_noname2)
values (goodsCate_seq.nextval, 2, 'ä��', '', '');


-- ��ǰ db �����
drop table goods;
create table goods(
    goods_idx           number(4) PRIMARY KEY,  -- ��ǰ��ȣ
    goodsCate1          number(1),              -- 1�� ��ǰ ī�װ�(1: ��ŰƮ / 2: �ż� / 3:�õ� / 4: �ǰ�)
    goodsCate2_idx      number(2),              -- 2�� ��ǰ ī�װ�
    goods_brand         varchar2(60),           -- ��ǰ�귣��
    goods_name          varchar2(100),          -- ��ǰ��
    goods_summary       varchar2(100),          -- ��ǰ�����Ұ�
    goods_inew          char(1) DEFAULT '0',    -- ��ǰƯ��(�Ż�ǰ) ���� : 1
    goods_ibest         char(1) DEFAULT '0',    -- ��ǰƯ��(����Ʈ) ���� : 1
    goods_isale         char(1) DEFAULT '0',    -- ��ǰƯ��(����) ���� : 1
    goods_isoldout      char(1) DEFAULT '0',    -- ��ǰƯ��(ǰ��) ���� : 1
    goods_price         number(7),              -- ����
    goods_salePrice     number(7),              -- ���ΰ�(�ǸŰ�)
    goods_maxbuy        number(2) DEFAULT 20,   -- �ִ� ���� ���� ��
    goods_point         char(1) DEFAULT '0',    -- ������(1: �⺻ ������ / 2: ���� ������ / 3: ������ ����)
    goods_delivery      char(1) DEFAULT '0',    -- ��ۺ�(1: �⺻ ��ۺ� / 2: ���� ��ۺ� / 3: ��ۺ� ����)
    goods_weight        varchar2(100),          -- �߷�/�뷮
    goods_allergy       varchar2(2000),         -- �˷����� ����
    goods_item_use      char(1) DEFAULT '0',    -- ��ǰ�߰��׸�(1: ��� / 0: ������)
    goods_item1_title   varchar2(30),           -- �׸�1 ����
    goods_item1_content varchar2(1000),         -- �׸�1 ����
    goods_item2_title   varchar2(30),           -- �׸�2 ����
    goods_item2_content varchar2(1000),         -- �׸�2 ����
    goods_count         number(2) DEFAULT 1,    -- ��ǰ����
    goods_detail        varchar2(1000),         -- ��ǰ������
    goods_hit           number(10) DEFAULT 0,   -- ��ȸ��
    goods_star          number(1) DEFAULT 0,    -- ����
    goods_sale_count    number(10) DEFAULT 0,   -- �Ǹż�
    goods_indate        date DEFAULT sysdate,   -- ��ǰ �����
    goods_modidate      date DEFAULT sysdate,   -- ��ǰ ������
    goods_available     number(4) default 9999, -- ������
    goods_delinfo_opt   number(1) DEFAULT 0,    -- ��ǰ ��� ����(���� : 1)
    goods_delinfo_text  varchar2(2000),         -- ���� ��� ����
    goods_return_opt    number(1) DEFAULT 0,    -- ��ȯ��ǰ ����(���� : 1)
    goods_return_text   varchar2(2000),         -- ���� ��ȯ��ǰ ����
    goods_img_main      varchar2(255),          -- ��ǰ ����/����Ʈ �̹���
    goods_img_detail1   varchar2(255),          -- ��ǰ �󼼺���1 �̹���
    goods_img_detail2   varchar2(255),          -- ��ǰ �󼼺���2 �̹���
    goods_img_detail3   varchar2(255),          -- ��ǰ �󼼺���3 �̹���
    goods_img_detail4   varchar2(255),          -- ��ǰ �󼼺���4 �̹���
    goods_noname1       varchar2(255),          -- �����ʵ�1
    goods_noname2       varchar2(255)           -- �����ʵ�2
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
values (goods_seq.nextval, 1, 05, '�����뷱��', '������ ������ 6��', '��ä�ο� ������ ���� ������',
        '1', '1', '1', '1', 4900, 4165, 5, '1', '1', '1��(240g)', '������ ���� ������ : �丶��, ���, ����, �˷�, ����, ��, ������ ����', '0', '', '', '', '',
        1, '01. ������ ���� ������', 0, 1, 0, sysdate, sysdate, 9999, 0, '', 0, '', 'main.jpg', 'subimg1.jpg', 'subimg2.jpg', 'subimg3.jpg', 'subimg4.jpg', '', '');

--sej
--��ٱ���
drop table cart;
create table cart(
    cart_idx        number(4) not null  primary key,    --ī���ȣ
    user_idx        number(4) not null,     --ȸ�����̵�
    goods_idx       number(4),              --��ǰ���̵�
    cart_img        varchar2(255),          --��ǰ�̹���
    cart_brand      varchar2(60),           --��ǰ�귣��   
    cart_name       varchar2(100),          --��ǰ��
    cart_pcs        number(4),              --��ǰ����
    cart_subPrice   number(10),             --��ǰ�ܰ�
    cart_noname1    varchar2(255),          --�����ʵ�1
    cart_noname2    varchar2(255)           --�����ʵ�2  
);
drop sequence cart_seq;
create sequence cart_seq; 

select * from cart;

insert into cart(cart_idx, user_idx, goods_idx, cart_img, cart_brand, cart_name, cart_pcs, cart_subPrice, cart_noname1, cart_noname2)
values (cart_seq.nextval, 0001, 0120, 'img.jpg', '�����뷱��', '������ 6��', 5, 9600, '', '');


--�ֹ�
drop table buy;
create table buy(
    buy_idx         number(10)  not null  primary key,    --�ֹ���ȣ
    user_idx        number(4)   not null,           --ȸ�����̵�
    receive_name    varchar2(20),                   --������ �̸�
    receive_phone   varchar2(20),                   --������ ��ȭ��ȣ
    receive_zip     varchar2(7),                    --������ �����ȣ
    receive_add     varchar2(255),                  --������ �ּ�
    buy_message     varchar2(255),                  --��۸޽���
    buy_totalPrice  number(10),                     --��ǰ�ѱݾ�
    buy_usePoint    number(8)   default 0,          --���������	
    buy_useCupon    number(8)   default 0,	        --�������   
    buy_fare        number(8)   default 0,	        --��ۺ�
    buy_payment     number(8)   default 0,	        --�����ݾ�
    buy_date        date        default sysdate,    --�ֹ���
    buy_state       number(1)   default 1,          --�ֹ�����(1:�ֹ�Ȯ���� 2:��ǰ�غ��� 3:����� 4:��ۿϷ�)
    buy_returnState number(1)   default 1,          --��ȯ/������ (1:�ű� 2:��� 3:��ȯ 4:��ǰ)
    buy_deliveryNo  varchar2(255),                  --�����ȣ
    buy_noname1     varchar2(255),                  --�����ʵ�1
    buy_noname2     varchar2(255)                   --�����ʵ�2
);

drop sequence buy_seq;
create sequence buy_seq; 

select * from buy;

insert into buy(buy_idx, user_idx, receive_name, receive_phone, receive_zip, receive_add, 
buy_message, buy_totalPrice, buy_usePoint, buy_useCupon, buy_fare, buy_payment, buy_date,
buy_state, buy_returnState, buy_deliveryNo, buy_noname1, buy_noname2)
values (buy_seq.nextval, 0001, 'ȫ�浿', '01012345678', '123-123', '����...', '����', 13800, 1000, 0, 3500, 9300, sysdate, 1, 1, '', '', '');


--���
drop table banner;
create table banner(
    banner_idx      number(4)   not null    primary key,    --��ʹ�ȣ
    banner_cate     number(1)   default 0,  --���ī�װ�(1:GNB 2:����1-ĳ���� 3:����2  4:��ǰī�װ�  5:���������� 6:�α��� 7:��Ÿ-����)
    banner_on       number(1)   default 0,  --���ⱸ�� (1:���� 2:����)
    banner_goods    number(20),             --��ǰī�װ�(banner_cate4�ϰ�� �ʼ��Է�)
    banner_file     varchar2(255),          --÷���̹���
    banner_txt      varchar2(255),          --��ü�ؽ�Ʈ
    banner_url      varchar2(255),          --��ũ
    banner_date     date        default sysdate,    --��� �����
    banner_noname1  varchar2(255),          --�����ʵ�1
    banner_noname2  varchar2(255)           --�����ʵ�2
);
drop sequence banner_seq;
create sequence banner_seq; 

select * from banner;    

insert into banner(banner_idx, banner_cate, banner_on, banner_goods, banner_file, banner_txt, 
banner_url, banner_date, banner_noname1, banner_noname2)
values (banner_seq.nextval, 4, 1, '101', 'img.jpg', '', 'http://www.naver.com', sysdate, '', '');

--������
drop table easyPoint;
create table easyPoint(
    easyPoint_idx       number(4)       not null primary key,   --�����ݹ�ȣ
    user_idx            number(4)       not null,           --ȸ�����̵�(�ܷ�Ű ���� ��)
    easyPoint_type      varchar2(20)    default 0,          --������ ����(1:����  2:���  3:���  4:�Ҹ�)
    easyPoint_content   varchar2(255),                      --������ ����
    easyPoint_money     number(8)       default 0,          --������ ����
    easyPoint_date      date            default sysdate,    --������ �߻��Ͻ�
    easyPoint_noname1   varchar2(255),                      --�����ʵ�1
    easyPoint_noname2   varchar2(255)                       --�����ʵ�2
);
drop sequence easyPoint_seq;
create sequence easyPoint_seq; 

select * from easyPoint; 

insert into easyPoint(easyPoint_idx, user_idx, easyPoint_type, easyPoint_content, easyPoint_money, easyPoint_date, easyPoint_noname1, easyPoint_noname2)
values (easyPoint_seq.nextval, 0001, 1, '��ǰ����', '500', sysdate, '', '');

--�������
drop table terms;
create table terms(
    terms_idx       number(4)   not null primary key,   --������� ��ȣ
    terms_title     varchar2(100),                  --�������
    terms_content   varchar2(3000),                 --�������
    terms_opt       number(1)   default 0,          --���Ǳ���(1:�ʼ� 2:����)
    terms_date      date        default sysdate,    --�����
    terms_noname   varchar2(255)                   --�����ʵ�
);
drop sequence terms_seq;
create sequence terms_seq;

select * from terms;

insert into terms(terms_idx, terms_title, terms_content, terms_opt, terms_date, terms_noname)
values (terms_seq.nextval, '���� �̿� ��� ����', '���....', 1, sysdate, '');


--��å����
drop table easyPolicy;
create table easyPolicy(
    easyPolicy_idx       number(4)   not null primary key,   --��å���� ��ȣ
    easyPolicy_title     varchar2(100),                  --��å����
    easyPolicy_content   varchar2(3000),                 --��å����
    easyPolicy_date      date        default sysdate,    --�����
    easyPolicy_noname   varchar2(255)                    --�����ʵ�
);
drop sequence easyPolicy_seq;
create sequence easyPolicy_seq;

select * from easyPolicy;

insert into easyPolicy(easyPolicy_idx, easyPolicy_title, easyPolicy_content, easyPolicy_date, easyPolicy_noname)
values (easyPolicy_seq.nextval, '��ۺ���å', '��ۺ�...', sysdate, '');


commit;