@implementation CKRecord

- (NSSecureCoding)data
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSSet *v17;
  id v18;
  NSObject *v19;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("value")));

  v5 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v22 = 0;
    v6 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v4, &v22);
    v7 = v22;
    v8 = objc_msgSend((id)objc_opt_class(self), "acceptedClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if (!v9)
    {
      v21 = objc_opt_class(NSDictionary);
      v10 = objc_opt_class(NSArray);
      v11 = objc_opt_class(NSData);
      v12 = objc_opt_class(NSDate);
      v13 = objc_opt_class(NSNumber);
      v14 = objc_opt_class(NSSet);
      v15 = objc_opt_class(NSString);
      v16 = objc_opt_class(NSURL);
      v17 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, v10, v11, v12, v13, v14, v15, v16, objc_opt_class(NSUUID), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v17);
    }
    v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v9, NSKeyedArchiveRootObjectKey));
    objc_msgSend(v6, "finishDecoding");
    if (v7)
    {
      v19 = CKLogContextDaemon;
      if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[CKRecord(SiriKnowledgeAdditions) data]";
        v25 = 2112;
        v26 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s Error encountered while decoding record data: %@", buf, 0x16u);
      }

      v18 = 0;
    }

  }
  else
  {
    v18 = v4;
  }

  return (NSSecureCoding *)v18;
}

- (void)setData:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;

  if (!a3)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
    objc_msgSend(v8, "setObject:forKey:", 0, CFSTR("value"));

    return;
  }
  v9 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v9));
  v5 = v9;
  if (v5)
  {
    v6 = CKLogContextDaemon;
    if (os_log_type_enabled(CKLogContextDaemon, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[CKRecord(SiriKnowledgeAdditions) setData:]";
      v12 = 2112;
      v13 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%s Error encountered while encoding record data: %@", buf, 0x16u);
    }
    goto LABEL_8;
  }
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CKRecord encryptedValuesByKey](self, "encryptedValuesByKey"));
    objc_msgSend(v7, "setObject:forKey:", v4, CFSTR("value"));

LABEL_8:
  }

}

+ (id)acceptedClasses
{
  if (qword_10001DEA8 != -1)
    dispatch_once(&qword_10001DEA8, &stru_100018578);
  return (id)qword_10001DEA0;
}

@end
