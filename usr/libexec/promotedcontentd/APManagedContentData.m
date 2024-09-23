@implementation APManagedContentData

+ (id)kind
{
  return CFSTR("a");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (APManagedContentData)initWithManagedContext:(id)a3 contentData:(id)a4 transaction:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  APManagedContentData *v13;
  uint64_t v14;
  NSString *contextIdentifier;
  APContentDataWrapper *v16;
  void *v17;
  APContentDataWrapper *v18;
  uint64_t v19;
  APContentDataWrapper *contentDataWrapper;
  APContentDataPrivateWrapper *v21;
  void *v22;
  APContentDataPrivateWrapper *v23;
  uint64_t v24;
  APContentDataPrivateWrapper *contentDataPrivateWrapper;
  APContentDataTransientWrapper *v26;
  void *v27;
  APContentDataTransientWrapper *v28;
  uint64_t v29;
  APContentDataTransientWrapper *contentDataTransientWrapper;
  void *v31;
  uint64_t v32;
  NSArray *placementTypes;
  void *v34;
  uint64_t v35;
  NSDate *expirationDate;
  objc_super v38;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "content"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));

  v38.receiver = self;
  v38.super_class = (Class)APManagedContentData;
  v13 = -[APCacheableSynchronizedObject initWithIdentifier:](&v38, "initWithIdentifier:", v12);
  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
    contextIdentifier = v13->_contextIdentifier;
    v13->_contextIdentifier = (NSString *)v14;

    v16 = [APContentDataWrapper alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "content"));
    v18 = -[APCacheableObjectWrapper initWithObject:identifier:](v16, "initWithObject:identifier:", v17, v12);

    v19 = objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject proxy](v18, "proxy"));
    contentDataWrapper = v13->_contentDataWrapper;
    v13->_contentDataWrapper = (APContentDataWrapper *)v19;

    v21 = [APContentDataPrivateWrapper alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "privateContent"));
    v23 = -[APCacheableObjectWrapper initWithObject:identifier:](v21, "initWithObject:identifier:", v22, v12);

    v24 = objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject proxy](v23, "proxy"));
    contentDataPrivateWrapper = v13->_contentDataPrivateWrapper;
    v13->_contentDataPrivateWrapper = (APContentDataPrivateWrapper *)v24;

    v26 = [APContentDataTransientWrapper alloc];
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "transientContent"));
    v28 = -[APCacheableObjectWrapper initWithObject:identifier:](v26, "initWithObject:identifier:", v27, v12);

    v29 = objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject proxy](v28, "proxy"));
    contentDataTransientWrapper = v13->_contentDataTransientWrapper;
    v13->_contentDataTransientWrapper = (APContentDataTransientWrapper *)v29;

    v13->_state = 1;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "content"));
    v32 = objc_claimAutoreleasedReturnValue(-[APManagedContentData allPlacementTypesForContentData:](v13, "allPlacementTypesForContentData:", v31));
    placementTypes = v13->_placementTypes;
    v13->_placementTypes = (NSArray *)v32;

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "content"));
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "expirationDate"));
    expirationDate = v13->_expirationDate;
    v13->_expirationDate = (NSDate *)v35;

    sub_10000E19C(v18, v10);
    sub_10000E19C(v23, v10);
    sub_10000E19C(v28, v10);
    sub_10000E19C(v13, v10);

  }
  return v13;
}

- (void)markInUseByClientWithId:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  uint64_t v16;

  v4 = a3;
  -[APCacheableSynchronizedObject lockObject](self, "lockObject");
  if ((id)-[APManagedContentData state](self, "state") == (id)1)
  {
    -[APManagedContentData setState:](self, "setState:", 2);
    -[APManagedContentData setClientId:](self, "setClientId:", v4);
    -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
    -[APManagedContentData _update](self, "_update");
    v5 = APLogForCategory(9);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v11 = 138543874;
      v12 = v7;
      v13 = 2048;
      v14 = 1;
      v15 = 2048;
      v16 = 2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Changed managed contend data '%{public}@' state from %ld to %ld.", (uint8_t *)&v11, 0x20u);

    }
  }
  else
  {
    v8 = APLogForCategory(9);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v11 = 138543618;
      v12 = v10;
      v13 = 2048;
      v14 = -[APManagedContentData state](self, "state");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to mark managed contend data %{public}@ as in use. Current state: %ld", (uint8_t *)&v11, 0x16u);

    }
    -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
  }

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)APManagedContentData;
  v4 = a3;
  -[APCacheableBaseObject encodeWithCoder:](&v9, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contextIdentifier](self, "contextIdentifier", v9.receiver, v9.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("contextId"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData placementTypes](self, "placementTypes"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("placementTypes"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData clientId](self, "clientId"));
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("clientId"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[APManagedContentData state](self, "state"), CFSTR("state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData expirationDate](self, "expirationDate"));
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("lastModified"));

}

- (int64_t)state
{
  return self->_state;
}

- (NSArray)placementTypes
{
  return self->_placementTypes;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSString)contextIdentifier
{
  return self->_contextIdentifier;
}

- (NSString)clientId
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (void)setClientId:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (id)allPlacementTypesForContentData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "representations"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "representations"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100002B78;
  v10[3] = &unk_100218B40;
  v11 = v5;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  v8 = objc_msgSend(v7, "copy");
  return v8;
}

- (BOOL)_update
{
  APManagedContentData *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = self;
  v3 = sub_10001869C(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "createTransaction"));

  sub_10000E19C(v2, v5);
  LOBYTE(v2) = objc_msgSend(v5, "commit");

  return (char)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentDataTransientWrapper, 0);
  objc_storeStrong((id *)&self->_contentDataPrivateWrapper, 0);
  objc_storeStrong((id *)&self->_contentDataWrapper, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_placementTypes, 0);
}

- (APManagedContentData)initWithCoder:(id)a3
{
  id v4;
  APManagedContentData *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSString *contextIdentifier;
  uint64_t v10;
  NSSet *v11;
  void *v12;
  uint64_t v13;
  NSArray *placementTypes;
  id v15;
  uint64_t v16;
  NSString *clientId;
  void *v18;
  uint64_t v19;
  APContentDataWrapper *contentDataWrapper;
  void *v21;
  uint64_t v22;
  APContentDataPrivateWrapper *contentDataPrivateWrapper;
  void *v24;
  uint64_t v25;
  APContentDataTransientWrapper *contentDataTransientWrapper;
  id v27;
  uint64_t v28;
  NSDate *expirationDate;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)APManagedContentData;
  v5 = -[APCacheableSynchronizedObject initWithCoder:](&v34, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_autoreleasePoolPush();
    objc_initWeak(&location, v5);
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("contextId"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    contextIdentifier = v5->_contextIdentifier;
    v5->_contextIdentifier = (NSString *)v8;

    v10 = objc_opt_class(NSArray);
    v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, objc_opt_class(NSNumber), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("placementTypes")));
    placementTypes = v5->_placementTypes;
    v5->_placementTypes = (NSArray *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("clientId"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    clientId = v5->_clientId;
    v5->_clientId = (NSString *)v16;

    v5->_state = (int64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](v5, "identifier"));
    v19 = objc_claimAutoreleasedReturnValue(+[APCacheableBaseObject proxyForIdentifier:](APContentDataWrapper, "proxyForIdentifier:", v18));
    contentDataWrapper = v5->_contentDataWrapper;
    v5->_contentDataWrapper = (APContentDataWrapper *)v19;

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10016FB3C;
    v31[3] = &unk_100218B18;
    objc_copyWeak(&v32, &location);
    -[APContentDataWrapper setProvideIgnorableKeyNamesBlock:](v5->_contentDataWrapper, "setProvideIgnorableKeyNamesBlock:", v31);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](v5, "identifier"));
    v22 = objc_claimAutoreleasedReturnValue(+[APCacheableBaseObject proxyForIdentifier:](APContentDataPrivateWrapper, "proxyForIdentifier:", v21));
    contentDataPrivateWrapper = v5->_contentDataPrivateWrapper;
    v5->_contentDataPrivateWrapper = (APContentDataPrivateWrapper *)v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](v5, "identifier"));
    v25 = objc_claimAutoreleasedReturnValue(+[APCacheableBaseObject proxyForIdentifier:](APContentDataTransientWrapper, "proxyForIdentifier:", v24));
    contentDataTransientWrapper = v5->_contentDataTransientWrapper;
    v5->_contentDataTransientWrapper = (APContentDataTransientWrapper *)v25;

    v27 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("lastModified"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v28;

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (BOOL)_updateTransientData
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contentDataTransient](self, "contentDataTransient"));
  if (v3)
  {
    v4 = sub_10001869C(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "createTransaction"));

    sub_10016BBF4(self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contentDataTransientWrapper](self, "contentDataTransientWrapper"));
    sub_10000E19C(v7, v6);

    v8 = objc_msgSend(v6, "commit");
  }
  else
  {
    v9 = APLogForCategory(9);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v13 = 138543362;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Trying to update non-existing transient data for id %{public}@.", (uint8_t *)&v13, 0xCu);

    }
    v8 = 0;
  }

  return v8;
}

- (BOOL)_updatePrivateData
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contentDataPrivate](self, "contentDataPrivate"));
  if (v3)
  {
    v4 = sub_10001869C(self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "createTransaction"));

    sub_10016BBF4(self, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contentDataPrivateWrapper](self, "contentDataPrivateWrapper"));
    sub_10000E19C(v7, v6);

    v8 = objc_msgSend(v6, "commit");
  }
  else
  {
    v9 = APLogForCategory(9);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v13 = 138543362;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Trying to update non-existing private data for id %{public}@.", (uint8_t *)&v13, 0xCu);

    }
    v8 = 0;
  }

  return v8;
}

+ (id)findById:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  id v11;

  v3 = a3;
  if (!objc_msgSend(v3, "length"))
  {
    v8 = APLogForCategory(9);
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to find managed content data. Content data identifier is empty.", (uint8_t *)&v10, 2u);
    }
    v5 = 0;
    goto LABEL_8;
  }
  v4 = sub_10001EAB0((uint64_t)APManagedContentData, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    v6 = APLogForCategory(9);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543362;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found managed content data '%{public}@' in a cache.", (uint8_t *)&v10, 0xCu);
    }
LABEL_8:

  }
  return v5;
}

- (APContentData)contentData
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contentDataWrapper](self, "contentDataWrapper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));

  if (!v4)
  {
    v5 = APLogForCategory(9);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v9 = 138543362;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to load associated Content Data object for '%{public}@'.", (uint8_t *)&v9, 0xCu);

    }
  }
  return (APContentData *)v4;
}

- (APContentDataPrivate)contentDataPrivate
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contentDataPrivateWrapper](self, "contentDataPrivateWrapper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));

  if (!v4)
  {
    v5 = APLogForCategory(9);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v9 = 138543362;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to load associated Content Data Private object for '%{public}@'.", (uint8_t *)&v9, 0xCu);

    }
  }
  objc_msgSend(v4, "setDelegate:", self);
  return (APContentDataPrivate *)v4;
}

- (APContentDataTransient)contentDataTransient
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contentDataTransientWrapper](self, "contentDataTransientWrapper"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "object"));

  if (!v4)
  {
    v5 = APLogForCategory(9);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v9 = 138543362;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to load associated Content Data Transient object for '%{public}@'.", (uint8_t *)&v9, 0xCu);

    }
  }
  objc_msgSend(v4, "setDelegate:", self);
  return (APContentDataTransient *)v4;
}

- (BOOL)isAvailable
{
  return (id)-[APManagedContentData state](self, "state") == (id)1;
}

- (void)markUsed
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int64_t v14;
  __int16 v15;
  uint64_t v16;

  -[APCacheableSynchronizedObject lockObject](self, "lockObject");
  if ((id)-[APManagedContentData state](self, "state") == (id)2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contentDataWrapper](self, "contentDataWrapper"));
    v4 = +[APCacheableObjectProxy objectIsLoaded:](APCacheableObjectProxy, "objectIsLoaded:", v3);

    if (v4)
      -[APManagedContentData _unloadHeavyContentFromContentData](self, "_unloadHeavyContentFromContentData");
    -[APManagedContentData setState:](self, "setState:", 3);
    -[APManagedContentData setClientId:](self, "setClientId:", 0);
    -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
    -[APManagedContentData _update](self, "_update");
    v5 = APLogForCategory(9);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v11 = 138543874;
      v12 = v7;
      v13 = 2048;
      v14 = 2;
      v15 = 2048;
      v16 = 3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Changed managed contend data '%{public}@' state from %ld to %ld.", (uint8_t *)&v11, 0x20u);

    }
  }
  else
  {
    v8 = APLogForCategory(9);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v11 = 138543618;
      v12 = v10;
      v13 = 2048;
      v14 = -[APManagedContentData state](self, "state");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to mark managed contend data %{public}@ as used. Current state: %ld", (uint8_t *)&v11, 0x16u);

    }
    -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
  }
}

- (void)close
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  int64_t v13;
  __int16 v14;
  uint64_t v15;

  -[APCacheableSynchronizedObject lockObject](self, "lockObject");
  if ((id)-[APManagedContentData state](self, "state") == (id)2)
  {
    -[APManagedContentData setState:](self, "setState:", 1);
    -[APManagedContentData setClientId:](self, "setClientId:", 0);
    -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
    -[APManagedContentData _update](self, "_update");
    v3 = APLogForCategory(9);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v10 = 138543874;
      v11 = v5;
      v12 = 2048;
      v13 = 2;
      v14 = 2048;
      v15 = 1;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Changed managed contend data '%{public}@' state from %ld to %ld.", (uint8_t *)&v10, 0x20u);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ((id)-[APManagedContentData state](self, "state") == (id)3)
  {
    -[APManagedContentData setState:](self, "setState:", 4);
    -[APManagedContentData setClientId:](self, "setClientId:", 0);
    -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
    -[APManagedContentData _update](self, "_update");
    v6 = APLogForCategory(9);
    v4 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v10 = 138543874;
      v11 = v5;
      v12 = 2048;
      v13 = 3;
      v14 = 2048;
      v15 = 4;
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  v7 = APLogForCategory(9);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
    v10 = 138543618;
    v11 = v9;
    v12 = 2048;
    v13 = -[APManagedContentData state](self, "state");
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to close managed contend data %{public}@. Current state: %ld", (uint8_t *)&v10, 0x16u);

  }
  -[APCacheableSynchronizedObject unlockObject](self, "unlockObject");
}

- (int64_t)garbageCollect
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  unsigned __int8 v8;
  int64_t v9;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
  v4 = sub_10016B8D8((uint64_t)APContentDataWrapper, v3);

  if ((v4 & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
    v6 = sub_10016B8D8((uint64_t)APContentDataPrivateWrapper, v5);

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
      v8 = sub_10016B8D8((uint64_t)APContentDataTransientWrapper, v7);

      if ((v8 & 1) == 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contextIdentifier](self, "contextIdentifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[APManagedContext findManagedContextByFingerprint:](APManagedContext, "findManagedContextByFingerprint:", v11));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
          v14 = objc_msgSend(v12, "removeManagedContentDataForId:", v13);

          if ((v14 & 1) == 0)
          {
            v15 = APLogForCategory(33);
            v16 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              v17 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
              v18 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contextIdentifier](self, "contextIdentifier"));
              v31 = 138543618;
              v32 = v17;
              v33 = 2114;
              v34 = v18;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to remove content data '%{public}@' reference from '%{public}@' context.", (uint8_t *)&v31, 0x16u);

            }
            v9 = 0;
LABEL_19:

            return v9;
          }
        }
        else
        {
          v19 = APLogForCategory(33);
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contextIdentifier](self, "contextIdentifier"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
            v31 = 138543618;
            v32 = v21;
            v33 = 2114;
            v34 = v22;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to find context '%{public}@' for content data '%{public}@'.", (uint8_t *)&v31, 0x16u);

          }
        }
        v23 = sub_10001869C(self);
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "createTransaction"));

        sub_10016BA60(self, v16);
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
        sub_10016BAE0((uint64_t)APContentDataWrapper, v25, v16);

        v26 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
        sub_10016BAE0((uint64_t)APContentDataPrivateWrapper, v26, v16);

        v27 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
        sub_10016BAE0((uint64_t)APContentDataTransientWrapper, v27, v16);

        if ((-[NSObject commit](v16, "commit") & 1) != 0)
        {
          v9 = (int64_t)-[NSObject count](v16, "count");
        }
        else
        {
          v28 = APLogForCategory(33);
          v29 = objc_claimAutoreleasedReturnValue(v28);
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[APCacheableBaseObject identifier](self, "identifier"));
            v31 = 138543362;
            v32 = v30;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Failed to remove managed content data '%{public}@'.", (uint8_t *)&v31, 0xCu);

          }
          v9 = -1;
        }
        goto LABEL_19;
      }
    }
  }
  return 0;
}

- (id)_heavyContentKeyNames
{
  if ((id)-[APManagedContentData state](self, "state") == (id)3
    || (id)-[APManagedContentData state](self, "state") == (id)4)
  {
    return &off_10022B368;
  }
  else
  {
    return 0;
  }
}

- (void)_unloadHeavyContentFromContentData
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  _BYTE v17[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contentData](self, "contentData"));
  objc_msgSend(v2, "setDisclosureRendererPayload:", 0);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "representations", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7), "setAdTag:", 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v5);
  }

  v8 = APLogForCategory(9);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "identifier"));
    *(_DWORD *)buf = 138543362;
    v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Removing heavy content from ContentData %{public}@", buf, 0xCu);

  }
}

- (void)transientDataDidChange
{
  -[APManagedContentData _updateTransientData](self, "_updateTransientData");
}

- (void)privateDataDidChange
{
  -[APManagedContentData _updatePrivateData](self, "_updatePrivateData");
}

- (id)toJSONObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_autoreleasePoolPush();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[APJSONArchiver JSONObjectWithObject:](APJSONArchiver, "JSONObjectWithObject:", self));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contentData](self, "contentData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[APJSONArchiver JSONObjectWithObject:](APJSONArchiver, "JSONObjectWithObject:", v5));

  if (v6)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("contentData"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("contentData"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contentDataPrivate](self, "contentDataPrivate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[APJSONArchiver JSONObjectWithObject:](APJSONArchiver, "JSONObjectWithObject:", v8));

  if (v9)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("contentDataPrivate"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("contentDataPrivate"));

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APManagedContentData contentDataTransient](self, "contentDataTransient"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[APJSONArchiver JSONObjectWithObject:](APJSONArchiver, "JSONObjectWithObject:", v11));

  if (v12)
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, CFSTR("contentDataTransient"));
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("contentDataTransient"));

  }
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (void)setPlacementTypes:(id)a3
{
  objc_storeStrong((id *)&self->_placementTypes, a3);
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void)setContextIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_contextIdentifier, a3);
}

- (APContentDataWrapper)contentDataWrapper
{
  return self->_contentDataWrapper;
}

- (void)setContentDataWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_contentDataWrapper, a3);
}

- (APContentDataPrivateWrapper)contentDataPrivateWrapper
{
  return self->_contentDataPrivateWrapper;
}

- (void)setContentDataPrivateWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_contentDataPrivateWrapper, a3);
}

- (APContentDataTransientWrapper)contentDataTransientWrapper
{
  return self->_contentDataTransientWrapper;
}

- (void)setContentDataTransientWrapper:(id)a3
{
  objc_storeStrong((id *)&self->_contentDataTransientWrapper, a3);
}

@end
