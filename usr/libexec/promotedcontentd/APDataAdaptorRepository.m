@implementation APDataAdaptorRepository

+ (id)sharedRepository
{
  if (qword_1002687C0 != -1)
    dispatch_once(&qword_1002687C0, &stru_1002131C8);
  return (id)qword_1002687B8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APDataAdaptorRepository)initWithCoder:(id)a3
{
  id v4;
  APDataAdaptorRepository *v5;
  id v6;
  uint64_t v7;
  NSMutableDictionary *registeredAdaptors;
  uint64_t v9;
  NSMutableDictionary *adaptors;
  APUnfairLock *v11;
  APUnfairLock *lock;
  APDataAdaptorRepository *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)APDataAdaptorRepository;
  v5 = -[APDataAdaptorRepository init](&v15, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSMutableDictionary), CFSTR("registeredAdaptors"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    registeredAdaptors = v5->_registeredAdaptors;
    v5->_registeredAdaptors = (NSMutableDictionary *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    adaptors = v5->_adaptors;
    v5->_adaptors = (NSMutableDictionary *)v9;

    v11 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
    lock = v5->_lock;
    v5->_lock = v11;

    v13 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[APDataAdaptorRepository registeredAdaptors](self, "registeredAdaptors"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("registeredAdaptors"));

}

- (APDataAdaptorRepository)init
{
  APDataAdaptorRepository *v2;
  uint64_t v3;
  NSMutableDictionary *registeredAdaptors;
  uint64_t v5;
  NSMutableDictionary *adaptors;
  APUnfairLock *v7;
  APUnfairLock *lock;
  APDataAdaptorRepository *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)APDataAdaptorRepository;
  v2 = -[APDataAdaptorRepository init](&v11, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    registeredAdaptors = v2->_registeredAdaptors;
    v2->_registeredAdaptors = (NSMutableDictionary *)v3;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    adaptors = v2->_adaptors;
    v2->_adaptors = (NSMutableDictionary *)v5;

    v7 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
    lock = v2->_lock;
    v2->_lock = v7;

    v9 = v2;
  }

  return v2;
}

- (id)adaptorWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  objc_class *v7;
  objc_class *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptorRepository lock](self, "lock"));
  objc_msgSend(v5, "lock");

  v6 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary valueForKey:](self->_adaptors, "valueForKey:", v4));
  if (!v6)
  {
    v7 = (objc_class *)-[NSMutableDictionary valueForKey:](self->_registeredAdaptors, "valueForKey:", v4);
    if (v7
      && (v8 = v7,
          -[objc_class isSubclassOfClass:](v7, "isSubclassOfClass:", objc_opt_class(APDataAdaptor))))
    {
      v6 = objc_alloc_init(v8);
      if (v6)
        -[NSMutableDictionary setValue:forKey:](self->_adaptors, "setValue:forKey:", v6, v4);
    }
    else
    {
      v9 = APLogForCategory(46);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13 = 138543362;
        v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Adaptor %{public}@ is not a subclass of APDataAdaptor.", (uint8_t *)&v13, 0xCu);
      }

      v6 = 0;
    }
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptorRepository lock](self, "lock"));
  objc_msgSend(v11, "unlock");

  return v6;
}

- (id)registerAdaptorClass:(Class)a3
{
  void *v5;
  void *v6;
  objc_class *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  NSString *v11;
  void *v12;
  unsigned __int8 v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  NSErrorUserInfoKey v23;
  void *v24;
  NSErrorUserInfoKey v25;
  void *v26;

  if (a3
    && (-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class(APDataAdaptor)) & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptorRepository lock](self, "lock"));
    objc_msgSend(v5, "lock");

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class identifier](a3, "identifier"));
    v7 = (objc_class *)-[NSMutableDictionary objectForKeyedSubscript:](self->_registeredAdaptors, "objectForKeyedSubscript:", v6);
    if (v7)
    {
      v8 = v7;
      v9 = NSStringFromClass(v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v11 = NSStringFromClass(a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = objc_msgSend(v10, "isEqualToString:", v12);

      if ((v13 & 1) == 0)
      {
        v14 = NSStringFromClass(v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Data adaptor '%@' is already registered for class %@"), v6, v15));

        v23 = NSLocalizedDescriptionKey;
        v24 = v16;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5204, v17));

LABEL_9:
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptorRepository lock](self, "lock"));
        objc_msgSend(v21, "unlock");
        goto LABEL_10;
      }
    }
    else
    {
      -[NSMutableDictionary setObject:forKey:](self->_registeredAdaptors, "setObject:forKey:", a3, v6);
    }
    v18 = 0;
    goto LABEL_9;
  }
  v19 = NSStringFromClass(a3);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Adaptor is of type '%@'; must be of type 'APDataAdaptor'"),
                   v20));

  v25 = NSLocalizedDescriptionKey;
  v26 = v6;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.ap.dataadaptors"), 5203, v21));
LABEL_10:

  return v18;
}

- (void)unregisterAdaptorClass:(Class)a3
{
  void *v5;
  NSMutableDictionary *registeredAdaptors;
  void *v7;
  NSMutableDictionary *adaptors;
  void *v9;
  id v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APDataAdaptorRepository lock](self, "lock"));
  objc_msgSend(v5, "lock");

  registeredAdaptors = self->_registeredAdaptors;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class identifier](a3, "identifier"));
  -[NSMutableDictionary removeObjectForKey:](registeredAdaptors, "removeObjectForKey:", v7);

  adaptors = self->_adaptors;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class identifier](a3, "identifier"));
  -[NSMutableDictionary removeObjectForKey:](adaptors, "removeObjectForKey:", v9);

  v10 = (id)objc_claimAutoreleasedReturnValue(-[APDataAdaptorRepository lock](self, "lock"));
  objc_msgSend(v10, "unlock");

}

- (NSMutableDictionary)registeredAdaptors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRegisteredAdaptors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)adaptors
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAdaptors:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (APUnfairLock)lock
{
  return (APUnfairLock *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_adaptors, 0);
  objc_storeStrong((id *)&self->_registeredAdaptors, 0);
}

@end
