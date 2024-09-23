@implementation SDActivityKey

- (SDActivityKey)initWithDictRepresentation:(id)a3
{
  id v4;
  SDActivityKey *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSMutableData *v9;
  NSMutableData *keyData;
  id v11;
  void *v12;
  NSUUID *v13;
  NSUUID *keyIdentifier;
  uint64_t v15;
  NSDate *dateCreated;
  void *v17;
  SDActivityKey *v18;
  uint64_t v19;
  NSObject *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)SDActivityKey;
  v5 = -[SDActivityKey init](&v22, "init");
  if (!v5)
    goto LABEL_4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyData")));
  v7 = objc_msgSend(v6, "length");
  if (v7 == (id)32)
  {
    v9 = (NSMutableData *)objc_msgSend(v6, "mutableCopy");
    keyData = v5->_keyData;
    v5->_keyData = v9;

    v11 = objc_alloc((Class)NSUUID);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("keyIdentifier")));
    v13 = (NSUUID *)objc_msgSend(v11, "initWithUUIDString:", v12);
    keyIdentifier = v5->_keyIdentifier;
    v5->_keyIdentifier = v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dateCreated")));
    dateCreated = v5->_dateCreated;
    v5->_dateCreated = (NSDate *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lastUsedCounter")));
    v5->_lastUsedCounter = (unsigned __int16)objc_msgSend(v17, "integerValue");

LABEL_4:
    v18 = v5;
    goto LABEL_8;
  }
  v19 = handoff_log(v7, v8);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    sub_100164854(v6, v20);

  v18 = 0;
LABEL_8:

  return v18;
}

- (void)dealloc
{
  void *v3;
  id v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData"));
  v4 = objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData")));
  cc_clear(v4, objc_msgSend(v5, "mutableBytes"));

  v6.receiver = self;
  v6.super_class = (Class)SDActivityKey;
  -[SDActivityKey dealloc](&v6, "dealloc");
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyIdentifier](self, "keyIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "UUIDString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey dateCreated](self, "dateCreated"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p, keyIdentifier:%@, dateCreated:%@, lastUsedCounter:%hu>"), v5, self, v7, v8, -[SDActivityKey lastUsedCounter](self, "lastUsedCounter")));

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v4 = a3;
  v6 = objc_opt_class(self, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "keyData"));

    v10 = objc_msgSend(v8, "isEqual:", v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  return (unint64_t)-[NSMutableData hash](self->_keyData, "hash");
}

- (NSDictionary)dictRepresentation
{
  NSMutableDictionary *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyData](self, "keyData"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v4, CFSTR("keyData"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey keyIdentifier](self, "keyIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "UUIDString"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v6, CFSTR("keyIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDActivityKey dateCreated](self, "dateCreated"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v7, CFSTR("dateCreated"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", -[SDActivityKey lastUsedCounter](self, "lastUsedCounter")));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v3, "setObject:forKeyedSubscript:", v8, CFSTR("lastUsedCounter"));

  return (NSDictionary *)v3;
}

- (BOOL)isValidKey
{
  return -[SDActivityKey lastUsedCounter](self, "lastUsedCounter") != 0;
}

- (NSUUID)keyIdentifier
{
  return self->_keyIdentifier;
}

- (void)setKeyIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keyIdentifier, a3);
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (void)setDateCreated:(id)a3
{
  objc_storeStrong((id *)&self->_dateCreated, a3);
}

- (unsigned)lastUsedCounter
{
  return self->_lastUsedCounter;
}

- (void)setLastUsedCounter:(unsigned __int16)a3
{
  self->_lastUsedCounter = a3;
}

- (void)setValidKey:(BOOL)a3
{
  self->_validKey = a3;
}

- (NSMutableData)keyData
{
  return self->_keyData;
}

- (void)setKeyData:(id)a3
{
  objc_storeStrong((id *)&self->_keyData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyData, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end
