@implementation MBSQLiteResultSet

- (id)_initWithDatabase:(id)a3 creationError:(id)a4 resultSet:(id)a5
{
  id v9;
  id v10;
  id v11;
  MBSQLiteResultSet *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MBSQLiteResultSet;
  v12 = -[MBSQLiteResultSet init](&v15, "init");
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_database, a3);
    objc_storeStrong(p_isa + 2, a5);
    objc_storeStrong(p_isa + 3, a4);
  }

  return p_isa;
}

- (BOOL)enumerateWithError:(id *)a3 block:(id)a4
{
  id v6;
  NSError *creationError;
  NSError *v8;
  unsigned __int8 v9;
  PQLResultSet *resultSet;
  PQLResultSet *v11;
  PQLResultSet *v12;
  MBSQLiteDB *database;
  PQLResultSet *v14;
  _QWORD v16[4];
  PQLResultSet *v17;
  id v18;

  v6 = a4;
  creationError = self->_creationError;
  if (!creationError)
  {
    resultSet = self->_resultSet;
    if (resultSet)
    {
      v11 = resultSet;
      v12 = self->_resultSet;
      self->_resultSet = 0;

      database = self->_database;
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10004F974;
      v16[3] = &unk_1000D9C90;
      v17 = v11;
      v18 = v6;
      v14 = v11;
      v9 = -[MBSQLiteDB performWithConnection:error:](database, "performWithConnection:error:", v16, a3);

      goto LABEL_10;
    }
    if (a3)
    {
      v8 = (NSError *)(id)objc_claimAutoreleasedReturnValue(-[MBSQLiteDB _invalidatedError](self->_database, "_invalidatedError"));
      goto LABEL_4;
    }
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if (!a3)
    goto LABEL_9;
  v8 = objc_retainAutorelease(creationError);
LABEL_4:
  v9 = 0;
  *a3 = v8;
LABEL_10:

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationError, 0);
  objc_storeStrong((id *)&self->_resultSet, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

@end
