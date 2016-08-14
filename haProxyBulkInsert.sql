USE Test
GO

--CREATE TABLE haProxyTestLogs 
--  (DateLogged VARCHAR(15), 
--  PID INT,
--  IP VARCHAR(15),
--  DateReceived VARCHAR(25),
--  FrontEnd VARCHAR(7),
--  BackEnd VARCHAR(15),
--  ServerName VARCHAR(12),
--  TQ SMALLINT,
--  TW SMALLINT,
--  TC SMALLINT,
--  TR SMALLINT,
--  TT SMALLINT,
--  ResponseCode INT,
--  BytesSent INT,
--  TerminationState VARCHAR(5),
--  ActConn SMALLINT,
--  FeConn SMALLINT,
--  BeConn SMALLINT,
--  SrvConn SMALLINT,
--  Retries SMALLINT,
--  HostName VARCHAR(27),
--  QueryPath VARCHAR(1000)
--  );
--GO

--SELECT * FROM haProxyTestLogs

--DROP TABLE haProxyTestLogs;

INSERT INTO haProxyTestLogs
	SELECT *
	FROM OPENROWSET(BULK '\\server\c$\haproxysample.log',
	FORMATFILE='\\server\c$\haProxyBulkInsertSchema.xml')
	AS t1;
GO