@implementation WAMessageAWDStoreEntry

- (WAMessageAWDStoreEntry)initWithPayload:(id)a3
{
  id v5;
  WAMessageAWDStoreEntry *v6;
  void *v7;
  double v8;
  void *v9;
  WAMessageAWDStoreEntry *v10;
  id v12;
  NSObject *v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  int v18;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WAMessageAWDStoreEntry;
  v6 = -[WAMessageAWDStoreEntry init](&v14, "init");
  if ((objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___NSSecureCoding) & 1) != 0)
  {
    objc_storeStrong(&v6->_payload, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v7, "timeIntervalSince1970");
    v6->_lastModifiedTimeInMillisecondEpoch = (unint64_t)(v8 * 1000.0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6->_payload, 1, 0));
    v6->_size = (unint64_t)objc_msgSend(v9, "length");

    v10 = v6;
  }
  else
  {
    v12 = WALogCategoryDefaultHandle();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446466;
      v16 = "-[WAMessageAWDStoreEntry initWithPayload:]";
      v17 = 1024;
      v18 = 29;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}s::%d:WAMessageAWDStoreEntry can only accept payloads that conform to the NSSecureCoding protocol, returning nil", buf, 0x12u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)updatePayload:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  char isKindOfClass;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  NSObject *v17;
  const char *v18;
  id v19;
  id v20;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;

  v4 = a3;
  if ((objc_msgSend(v4, "conformsToProtocol:", &OBJC_PROTOCOL___NSSecureCoding) & 1) == 0)
  {
    v19 = WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v21 = 136446466;
    v22 = "-[WAMessageAWDStoreEntry updatePayload:]";
    v23 = 1024;
    v24 = 49;
    v18 = "%{public}s::%d:WAMessageAWDStoreEntry can only accept payloads that conform to the NSSecureCoding protocol, returning nil";
    goto LABEL_8;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
  v6 = objc_opt_class(v5);
  isKindOfClass = objc_opt_isKindOfClass(v4, v6);

  if ((isKindOfClass & 1) == 0)
  {
    v20 = WALogCategoryDefaultHandle();
    v17 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    v21 = 136446466;
    v22 = "-[WAMessageAWDStoreEntry updatePayload:]";
    v23 = 1024;
    v24 = 50;
    v18 = "%{public}s::%d:-[WAMessageAWDStoreEntry updatePayload:] can only accept payloads of the same class type that w"
          "as used to initalize this instance";
    goto LABEL_8;
  }
  v8 = objc_opt_class(WAMessageAWD);
  if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      v16 = WALogCategoryDefaultHandle();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
LABEL_9:

        goto LABEL_10;
      }
      v21 = 136446466;
      v22 = "-[WAMessageAWDStoreEntry updatePayload:]";
      v23 = 1024;
      v24 = 51;
      v18 = "%{public}s::%d:-[WAMessageAWDStoreEntry updatePayload:] can only accept updated payloads of type WAMessageAW"
            "D where the update has the same uuid as the WAMessageAWD instance used to initialize this entry";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v21, 0x12u);
      goto LABEL_9;
    }
  }
  -[WAMessageAWDStoreEntry setPayload:](self, "setPayload:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v13, "timeIntervalSince1970");
  -[WAMessageAWDStoreEntry setLastModifiedTimeInMillisecondEpoch:](self, "setLastModifiedTimeInMillisecondEpoch:", (unint64_t)(v14 * 1000.0));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", self->_payload, 1, 0));
  -[WAMessageAWDStoreEntry setSize:](self, "setSize:", objc_msgSend(v15, "length"));

LABEL_10:
}

- (WAMessageAWD)message
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
  v4 = objc_opt_class(WAMessageAWD);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
  else
    v6 = 0;
  return (WAMessageAWD *)v6;
}

- (WAMessageAWDStoreEntry)init
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, CFSTR("-init is not a valid initializer for this class"), 0));
  objc_exception_throw(v2);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
  v4 = objc_opt_class(WAMessageAWD);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "key"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WAMessageAWDStoreEntry payload](self, "payload"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "originalClassName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(-[WAMessageAWDStoreEntry lastModifiedTimeInMillisecondEpoch](self, "lastModifiedTimeInMillisecondEpoch")/ 0x3E8)));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Message with key: %@ original classname: %@ added: %@ + %llu size: %lu"), v7, v9, v10, -[WAMessageAWDStoreEntry lastModifiedTimeInMillisecondEpoch](self, "lastModifiedTimeInMillisecondEpoch")% 0x3E8, -[WAMessageAWDStoreEntry size](self, "size")));

  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(-[WAMessageAWDStoreEntry lastModifiedTimeInMillisecondEpoch](self, "lastModifiedTimeInMillisecondEpoch")/ 0x3E8)));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("added: %@ + %llu size: %lu"), v6, -[WAMessageAWDStoreEntry lastModifiedTimeInMillisecondEpoch](self, "lastModifiedTimeInMillisecondEpoch")% 0x3E8, -[WAMessageAWDStoreEntry size](self, "size")));
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id payload;
  id v5;

  payload = self->_payload;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", payload, CFSTR("_payload"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_lastModifiedTimeInMillisecondEpoch, CFSTR("_lastModifiedTimeInMillisecondEpoch"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_size, CFSTR("_size"));

}

- (WAMessageAWDStoreEntry)initWithCoder:(id)a3
{
  id v4;
  WAMessageAWDStoreEntry *v5;
  uint64_t v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  uint64_t v10;
  id payload;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WAMessageAWDStoreEntry;
  v5 = -[WAMessageAWDStoreEntry init](&v13, "init");
  if (v5)
  {
    v6 = objc_opt_class(NSData);
    v7 = objc_opt_class(WAMessageAWD);
    v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v6, v7, objc_opt_class(WAField), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_payload")));
    payload = v5->_payload;
    v5->_payload = (id)v10;

    v5->_lastModifiedTimeInMillisecondEpoch = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_lastModifiedTimeInMillisecondEpoch"));
    v5->_size = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_size"));
  }

  return v5;
}

- (id)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
  objc_storeStrong(&self->_payload, a3);
}

- (unint64_t)lastModifiedTimeInMillisecondEpoch
{
  return self->_lastModifiedTimeInMillisecondEpoch;
}

- (void)setLastModifiedTimeInMillisecondEpoch:(unint64_t)a3
{
  self->_lastModifiedTimeInMillisecondEpoch = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_payload, 0);
}

@end
