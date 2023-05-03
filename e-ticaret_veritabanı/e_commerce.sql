create database e_commerce;
use e_commerce;

create table customers_info(
     customer_id int not null,
     firstName varchar(50) not null,
     lastName varchar(50) not null,
     registered_at timestamp,
     email varchar(50) not null,
	 Password varchar(50) not null,
     phone_number varchar(50) not null,
	 is_seller BOOLEAN,
     primary key(customer_id)
);
create table acountForBuyer(
     acount_id int,
     customer_id int,
     acountType char(1),
     foreign key(customer_id) references customers_info(customer_id),
     primary key(acount_id)
);
create table premiumAcount(
    premium_id int,
    acount_id int,
    foreign key(acount_id) references acountForBuyer(acount_id),
    freeshipActive boolean,
    primary key(premium_id)
);
create table studentAcount(
    student_id int,
    acount_id int,
    foreign key(acount_id) references acountForBuyer(acount_id),
     extDiscount decimal,
     primary key(student_id)
);
create table normalAcount(
    normal_id int,
    acount_id int,
    foreign key(acount_id) references acountForBuyer(acount_id),
    primary key(normal_id)
);
create table seller(
    seller_id int,
    customer_id int,
    compName varchar(50),
    foreign key(customer_id) references customers_info(customer_id),
    primary key(seller_id)
);

create table adress(
	adress_id int,
    adressType char(1),
    customer_id int,
    adress_title varchar(50),
    adress_line text,
    postacode varchar(50),
    city varchar(50),
    state varchar(50),
    foreign key(customer_id) references customers_info(customer_id),
    primary key(adress_id)
);

create table home_adress(
    homeAdress_id int,
    adress_id int,
    foreign key(adress_id) references adress(adress_id),
    primary key(homeAdress_id)
);
create table work_adress(
   workAdress_id int,
   adress_id int,
   foreign key(adress_id) references adress(adress_id),
   companyName varchar(50),
   primary key(workAdress_id)
);
create table shipper(
    shipper_id int,
    shipperName varchar(50),
    primary key(shipper_id)
);
create table orderDetail(
    order_id int,
    ordernum int,
    orderdate date,
    Estimated_delivery date,
    summary varchar(50),
    total_price decimal,
    order_detail varchar(50),
    order_active boolean,
    adress_id int,
    foreign key(adress_id) references adress(adress_id),
    shipper_id int,
    foreign key(shipper_id) references shipper(shipper_id),
    primary key(order_id)
);
create table billing_info(
     billingInfo_id int,
     customer_id int,
     billing_type char(1),
     order_id int,
     foreign key(order_id) references orderDetail(order_id),
     foreign key(customer_id) references customers_info(customer_id),
     primary key(billingInfo_id)
);
create table individual(
     individual_id int,
     billingInfo_id int,
     foreign key(billingInfo_id) references billing_info(billingInfo_id),
     primary key(individual_id)
);
create table institutional(
     institutional_id int,
     billingInfo_id int,
     foreign key(billingInfo_id) references billing_info(billingInfo_id),
     primary key(institutional_id)
);

create table payments(
    payment_id int,
    paymentMethod char(1),
    primary key(payment_id)
);
create table credirCard_info(
     creditCard_id int,
     CardNumber int,
     CardExpMonth int,
     CardExpYear int,
     CardCVV int,
     payment_id int,
     foreign KEY (payment_id) REFERENCES payments(payment_id),
     primary key(creditCard_id)
);
create table categories(
     categories_id int,
     catName varchar(100),
     catDesc text,
     icon blob,
     primary key(categories_id)
);
create table product(
     product_id int,
     categories_id int,
     productName varchar(55),
     productDesc text,
     unitPrice decimal,
     quantity int,
     stock int,
     picture_data blob,
     shortDesc varchar(255),
     foreign key(categories_id) references categories(categories_id),
     primary key(product_id)
);

create table discount(
     discount_id int,
     discountPrecent decimal,
     primary key(discount_id)
);
alter table orderDetail
add payment_id int;
ALTER TABLE orderDetail
ADD foreign KEY (payment_id) REFERENCES payments(payment_id);




