@implementation MailPersistentStorageSaveOperation

- (void)dealloc
{
  objc_super v3;

  -[EFCancelable cancel](self->_finishedObservation, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MailPersistentStorageSaveOperation;
  -[MailPersistentStorageSaveOperation dealloc](&v3, "dealloc");
}

- (MailPersistentStorageSaveOperation)initWithDestinationPath:(id)a3 groupDictionary:(id)a4
{
  id v6;
  id v7;
  MailPersistentStorageSaveOperation *v8;
  NSString *v9;
  NSString *destinationPath;
  NSDictionary *v11;
  NSDictionary *groupDictionary;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  MFTaskAssertion *v17;
  MFTaskAssertion *taskAssertion;
  NSString *v19;
  void *v20;
  uint64_t v21;
  EFCancelable *finishedObservation;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v27.receiver = self;
  v27.super_class = (Class)MailPersistentStorageSaveOperation;
  v8 = -[MailPersistentStorageSaveOperation init](&v27, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    destinationPath = v8->_destinationPath;
    v8->_destinationPath = v9;

    v11 = (NSDictionary *)objc_msgSend(objc_alloc((Class)NSDictionary), "initWithDictionary:copyItems:", v7, 1);
    groupDictionary = v8->_groupDictionary;
    v8->_groupDictionary = v11;

    v13 = (objc_class *)objc_opt_class(v8);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("com.apple.mobilemail.%@-%p"), v15, v8));

    v17 = (MFTaskAssertion *)objc_msgSend(objc_alloc((Class)MFTaskAssertion), "initWithName:preventIdleSleep:", v16, 1);
    taskAssertion = v8->_taskAssertion;
    v8->_taskAssertion = v17;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v8);
    v19 = NSStringFromSelector("isFinished");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000F1764;
    v24[3] = &unk_10051C488;
    objc_copyWeak(&v25, &location);
    v21 = objc_claimAutoreleasedReturnValue(-[MailPersistentStorageSaveOperation ef_observeKeyPath:options:usingBlock:](v8, "ef_observeKeyPath:options:usingBlock:", v20, 0, v24));
    finishedObservation = v8->_finishedObservation;
    v8->_finishedObservation = (EFCancelable *)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)main
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint8_t buf[24];

  if ((-[MailPersistentStorageSaveOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailPersistentStorageSaveOperation groupDictionary](self, "groupDictionary"));
    v18 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v3, 100, 0, &v18));
    v5 = v18;

    if (v4)
    {
      if ((-[MailPersistentStorageSaveOperation isCancelled](self, "isCancelled") & 1) != 0)
      {
LABEL_11:

        return;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailPersistentStorageSaveOperation destinationPath](self, "destinationPath"));
      v17 = 0;
      v8 = objc_msgSend(v4, "writeToFile:options:error:", v7, 1073741825, &v17);
      v9 = v17;

      if ((v8 & 1) == 0)
      {
        v11 = MFLogGeneral(v10);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MailPersistentStorageSaveOperation destinationPath](self, "destinationPath"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject ef_publicDescription](v9, "ef_publicDescription"));
          sub_1003928D0(v13, v14, buf, v12);
        }

      }
    }
    else
    {
      v15 = MFLogGeneral(v6);
      v9 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ef_publicDescription"));
        sub_10039287C(v16, buf, v9);
      }
    }

    goto LABEL_11;
  }
}

- (NSDictionary)groupDictionary
{
  return self->_groupDictionary;
}

- (void)setGroupDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (void)setDestinationPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (EFCancelable)finishedObservation
{
  return self->_finishedObservation;
}

- (void)setFinishedObservation:(id)a3
{
  objc_storeStrong((id *)&self->_finishedObservation, a3);
}

- (MFTaskAssertion)taskAssertion
{
  return self->_taskAssertion;
}

- (void)setTaskAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_taskAssertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskAssertion, 0);
  objc_storeStrong((id *)&self->_finishedObservation, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_groupDictionary, 0);
}

@end
