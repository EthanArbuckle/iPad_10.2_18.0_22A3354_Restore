@implementation GKSQLRunner

+ (id)runnerWithConnection:(id)a3
{
  id v3;
  GKSQLRunner *v4;

  v3 = a3;
  v4 = -[GKSQLRunner initWithConnection:]([GKSQLRunner alloc], "initWithConnection:", v3);

  return v4;
}

- (GKSQLRunner)initWithConnection:(id)a3
{
  id v4;
  GKSQLRunner *v5;
  GKSQLRunner *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKSQLRunner;
  v5 = -[GKSQLRunner init](&v8, "init");
  v6 = v5;
  if (v5)
    -[GKSQLRunner setConnection:](v5, "setConnection:", v4);

  return v6;
}

- (int)runSQLFromFileAtPath:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithContentsOfFile:encoding:error:](NSString, "stringWithContentsOfFile:encoding:error:", a3, 4, 0));
  LODWORD(self) = -[GKSQLRunner runSQL:](self, "runSQL:", v4);

  return (int)self;
}

- (int)runSQL:(id)a3
{
  id v4;
  GKDatabaseConnection *connection;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  connection = self->_connection;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000D6D34;
  v8[3] = &unk_1002C1FE0;
  v10 = &v11;
  v6 = v4;
  v9 = v6;
  -[GKDatabaseConnection performSync:](connection, "performSync:", v8);
  LODWORD(connection) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)connection;
}

- (GKDatabaseConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
