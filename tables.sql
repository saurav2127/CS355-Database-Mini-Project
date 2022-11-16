create table Users (
    UID int not null primary key ,
    username varchar(30),
    password varchar(100),
    role_id int
);

create table Stores(
    store_id int not null primary key ,
    name varchar(30),
    location varchar(30),
    category varchar(30),
    availability text,
    rating float
);

create table Shopkeepers(
    SID int primary key not null AUTO_INCREMENT,
    name varchar(30),
    sec_pass_exp date,
    phone_no bigint,
    sec_pass_id varchar(20),
    store_id int not null,
    username varchar(30),
    CONSTRAINT fk_Shopkeepers_Stores1
    foreign key (store_id) references Stores(store_id),
    CONSTRAINT fk_Shopkeepers_Users1
    foreign key (username) references Users(username)
);

create index fk_Shopkeepers_Stores1_idx on Shopkeepers(store_id ASC);
create index fk_Shopkeepers_Users1_idx on Shopkeepers(username ASC);

create table License(
    lic_id VARCHAR(30) not null primary key,
    expiry date,
    store_id int not null,
    CONSTRAINT fk_License_Stores1
    foreign key (store_id) references Stores(store_id)
);

create index fk_License_Stores1_idx on License(store_id ASC);

create table Feedback(
    feed_id int not null primary key,
    store_id int not null,
    service int not null,
    availability int not null,
    quality int not null,
    price int not null,
    conduct int not null,
    message varchar(100),
    CONSTRAINT fk_Feedback_Stores1
    foreign key (store_id) references Stores(store_id)
);

create index fk_Feedback_Stores1_idx on Feedback(store_id ASC);

create table Billrequests(
    breq_id int not null primary key,
    paid_amt int,
    tran_id varchar(30),
    mode varchar(30),
    status varchar(30),
    pb_id int
);

create table Pendingbills(
    pb_id int not null primary key,
    type_of_service varchar(30),
    due_amt int,
    month_no date,
    store_id int not null,
    CONSTRAINT fk_Pendingbills_Stores1
    foreign key (store_id) references Stores(store_id)
);

create index fk_Pendingbills_Stores1_idx on Pendingbills(store_id);

create table License_ext_req(
    er_id int not null primary key,
    lic_id varchar(30) not null,
    extension_period_days int,
    fee_paid int,
    status varchar(20),
    tran_id varchar(30),
    mode varchar(10),
    CONSTRAINT fk_License_ext_req_License1
    foreign key (lic_id) references License(lic_id)
);

create index fk_License_ext_req_License1_idx on License_ext_req(lic_id ASC);
