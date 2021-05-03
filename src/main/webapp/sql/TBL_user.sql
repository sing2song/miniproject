use minidb;

-- TBL_user
ALTER TABLE TBL_user
	DROP PRIMARY KEY; -- TBL_user 기본키

-- TBL_user
DROP TABLE IF EXISTS TBL_user;

-- TBL_user
CREATE TABLE TBL_user (
	userId VARCHAR(35) NOT NULL -- userId,
	,userpwd VARCHAR(100) NOT NULL -- userpwd,
	,username VARCHAR(30) NOT NULL -- username,
	,useremail VARCHAR(30) NOT NULL -- useremail,
	,userphone VARCHAR(30) NULL -- userphone,
	,userpoint INT DEFAULT '0' -- userpoint,
	,productincart INT DEFAULT '0' -- productincart,
	,recievername VARCHAR(30) NULL -- recievername,
	,recieverzipcode VARCHAR(20) NULL -- recieverzipcode,
	,recieveraddr1 VARCHAR(500) NULL -- recieveraddr1,
	,recieveraddr2 VARCHAR(500) NULL -- recieveraddr2,
	,recieverphone VARCHAR(30) NULL -- recieverphone,
    ,deliveryMsg VARCHAR(500) NULL
	,deliveryoption VARCHAR(20) DEFAULT '기본배송' -- deliveryoption,
	,joindate DATE -- joindate,
	,totalpayment INT NULL -- 총구매
);

-- TBL_user
ALTER TABLE TBL_user
	ADD CONSTRAINT PK_TBL_user -- TBL_user 기본키
	PRIMARY KEY (
		userId -- userId
	);
    
    
select * from TBL_user;
alter table TBL_user drop userpoint;