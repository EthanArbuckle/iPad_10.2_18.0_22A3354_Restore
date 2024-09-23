@implementation RestorationMailboxEncoder

+ (id)encoderWithLog:(id)a3
{
  id v3;
  RestorationMailboxEncoder *v4;

  v3 = a3;
  v4 = -[RestorationMailboxEncoder initWithLog:]([RestorationMailboxEncoder alloc], "initWithLog:", v3);

  return v4;
}

- (RestorationMailboxEncoder)initWithLog:(id)a3
{
  RestorationMailboxEncoder *v4;
  RestorationMailboxEncoder *v5;
  id v6;
  OS_os_log *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)RestorationMailboxEncoder;
  v4 = -[RestorationMailboxEncoder init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_log = (OS_os_log *)a3;
    }
    else
    {
      v6 = sub_1001D0850();
      v7 = (OS_os_log *)objc_claimAutoreleasedReturnValue(v6);
      v5->_log = v7;

    }
  }
  return v5;
}

- (id)encodeMailbox:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  int v15;
  void *v16;

  v4 = a3;
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxEncoder log](self, "log"));
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ef_publicDescription"));
      v15 = 138543362;
      v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "RestorationMailboxEncoder: Encoding mailbox: %{public}@", (uint8_t *)&v15, 0xCu);

    }
    v7 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    if ((objc_msgSend(v4, "isSmartMailbox") & 1) != 0
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectID")),
          v9 = objc_msgSend(v8, "isEphemeral"),
          v8,
          (v9 & 1) != 0))
    {
      if (objc_msgSend(v4, "isSmartMailbox"))
      {
        v10 = v4;
        if (objc_msgSend(v10, "smartMailboxType") == (id)8)
          -[RestorationMailboxEncoder _encodeUnifiedMailbox:coder:](self, "_encodeUnifiedMailbox:coder:", v10, v7);
        else
          -[RestorationMailboxEncoder _encodeSmartMailbox:coder:](self, "_encodeSmartMailbox:coder:", v10, v7);

      }
    }
    else
    {
      -[RestorationMailboxEncoder _encodeGenericMailbox:coder:](self, "_encodeGenericMailbox:coder:", v4, v7);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject encodedData](v7, "encodedData"));
    if (objc_msgSend(v12, "length"))
    {
      v11 = v12;
    }
    else
    {
      v13 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxEncoder log](self, "log"));
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_100395164();

      v11 = 0;
    }

  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxEncoder log](self, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100395138();
    v11 = 0;
  }

  return v11;
}

- (void)_encodeGenericMailbox:(id)a3 coder:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxEncoder log](self, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
    sub_100395190();
  }

  objc_msgSend(v7, "encodeInteger:forKey:", 1, CFSTR("SerializationType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectID"));
  objc_msgSend(v7, "encodeObject:forKey:", v9, CFSTR("ObjectID"));

}

- (void)_encodeSmartMailbox:(id)a3 coder:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void **v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, uint64_t, _BYTE *);
  void *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxEncoder log](self, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
    sub_100395220();
  }

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SharedMailboxController allSharedInstances](SharedMailboxController, "allSharedInstances"));
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1001D0E74;
  v16 = &unk_100523650;
  v10 = v6;
  v17 = v10;
  v18 = &v19;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v13);

  v11 = v20[3];
  if (v11 && (_MSSourceTypeIsValid(v11) & 1) != 0)
  {
    objc_msgSend(v7, "encodeInteger:forKey:", 2, CFSTR("SerializationType"), v13, v14, v15, v16);
    v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v20[3]));
    objc_msgSend(v7, "encodeObject:forKey:", v12, CFSTR("SmartMailboxSourceType"));
  }
  else
  {
    v12 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxEncoder log](self, "log", v13, v14, v15, v16));
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_publicDescription"));
      sub_1003951CC();
    }
  }

  _Block_object_dispose(&v19, 8);
}

- (void)_encodeUnifiedMailbox:(id)a3 coder:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[RestorationMailboxEncoder log](self, "log"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ef_publicDescription"));
    sub_10039525C();
  }

  objc_msgSend(v7, "encodeInteger:forKey:", 3, CFSTR("SerializationType"));
  objc_msgSend(v7, "encodeInteger:forKey:", objc_msgSend(v6, "type"), CFSTR("UnifiedMailboxType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
  objc_msgSend(v7, "encodeObject:forKey:", v9, CFSTR("UnifiedMailboxName"));

}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  self->_log = (OS_os_log *)a3;
}

@end
