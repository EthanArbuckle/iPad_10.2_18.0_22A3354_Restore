@implementation SESDatabaseTransaction

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  unsigned int state;
  objc_super v6;
  uint8_t buf[4];
  unsigned int v8;

  if (self->_state == 1)
  {
    v3 = SESDefaultLogObject(self, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      state = self->_state;
      *(_DWORD *)buf = 67109120;
      v8 = state;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Transaction object deallocated in unexpected state %u", buf, 8u);
    }

    -[NSManagedObjectContext rollback](self->_managedObjectContext, "rollback");
  }
  v6.receiver = self;
  v6.super_class = (Class)SESDatabaseTransaction;
  -[SESDatabaseTransaction dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (id)stageEndPointEntityWithIdentifier:(id)a3 endPointCAEntity:(id)a4 airInstanceEntity:(id)a5 clientName:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v17 = v15;
  if (v14 && v13 && v12 && v15)
  {
    v18 = sub_1000117DC((uint64_t)self);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v36 = 0;
    v20 = sub_10003AC24((uint64_t)v19, v12, v17, &v36);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = v36;

    if (v21)
    {
      if (a7)
      {
        v25 = SESDefaultLogObject(v23, v24);
        v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
        v27 = SESCreateAndLogError(0, v26, SESErrorDomain, 3, CFSTR("epEntity with identifier %@ for client %@ already exists"));
        *a7 = (id)objc_claimAutoreleasedReturnValue(v27);

      }
    }
    else
    {
      if (!v22)
      {
        v33 = sub_10002BA88((uint64_t)self);
        v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription insertNewObjectForEntityForName:inManagedObjectContext:](NSEntityDescription, "insertNewObjectForEntityForName:inManagedObjectContext:", CFSTR("SEEndPointEntity"), v34));

        objc_msgSend(v35, "setIdentifier:", v12);
        objc_msgSend(v35, "setClientName:", v17);
        objc_msgSend(v35, "setAuthority:", v13);
        objc_msgSend(v35, "setInstance:", v14);
        if (objc_msgSend(v35, "validateForInsert:", a7))
          v28 = v35;
        else
          v28 = 0;

        goto LABEL_9;
      }
      if (a7)
      {
        v28 = 0;
        *a7 = objc_retainAutorelease(v22);
        goto LABEL_9;
      }
    }
    v28 = 0;
LABEL_9:

    goto LABEL_13;
  }
  if (a7)
  {
    v29 = SESDefaultLogObject(v15, v16);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = SESCreateAndLogError(0, v30, SESErrorDomain, 1, CFSTR("Nil passed to addEndPointEntityWithIdentifier"));
    *a7 = (id)objc_claimAutoreleasedReturnValue(v31);

  }
  v28 = 0;
LABEL_13:

  return v28;
}

- (id)stageEndPointEntityUpdates:(id)a3 fromEndPoint:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v17;

  v5 = a3;
  v6 = a4;
  v17 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "encodeWithError:", &v17));
  v8 = v17;
  v10 = v8;
  if (v8)
    v11 = 1;
  else
    v11 = v7 == 0;
  if (v11)
  {
    v12 = SESDefaultLogObject(v8, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = SESCreateAndLogError(0, v13, SESErrorDomain, 0, CFSTR("Encoding endpoint %@"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  }
  else
  {
    objc_msgSend(v5, "setEndPointData:", v7);
    v15 = 0;
  }

  return v15;
}

@end
