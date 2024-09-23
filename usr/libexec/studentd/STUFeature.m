@implementation STUFeature

- (STUFeature)initWithCRKFeature:(id)a3
{
  return -[STUFeature initWithCRKFeature:enrollmentRecord:](self, "initWithCRKFeature:enrollmentRecord:", a3, 0);
}

- (STUFeature)initWithCRKFeature:(id)a3 enrollmentRecord:(id)a4
{
  return -[STUFeature initWithCRKFeature:enrollmentRecord:forceKey:dataStore:](self, "initWithCRKFeature:enrollmentRecord:forceKey:dataStore:", a3, a4, 0, 0);
}

- (STUFeature)initWithCRKFeature:(id)a3 enrollmentRecord:(id)a4 forceKey:(id)a5
{
  return -[STUFeature initWithCRKFeature:enrollmentRecord:forceKey:dataStore:](self, "initWithCRKFeature:enrollmentRecord:forceKey:dataStore:", a3, a4, a5, 0);
}

- (STUFeature)initWithCRKFeature:(id)a3 enrollmentRecord:(id)a4 forceKey:(id)a5 dataStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  STUFeature *v15;
  NSString *v16;
  NSString *CRKFeature;
  CRKFeatureDataStoreProtocol *v18;
  CRKFeatureDataStoreProtocol *dataStore;
  uint64_t v20;
  CRKFeatureDataStoreProtocol *v21;
  void *v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUFeature.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("CRKFeature"));

  }
  v24.receiver = self;
  v24.super_class = (Class)STUFeature;
  v15 = -[STUFeature init](&v24, "init");
  if (v15)
  {
    v16 = (NSString *)objc_msgSend(v11, "copy");
    CRKFeature = v15->_CRKFeature;
    v15->_CRKFeature = v16;

    objc_storeStrong((id *)&v15->_enrollmentRecord, a4);
    objc_storeStrong((id *)&v15->_forceKey, a5);
    if (v14)
    {
      v18 = (CRKFeatureDataStoreProtocol *)v14;
      dataStore = v15->_dataStore;
      v15->_dataStore = v18;
    }
    else
    {
      dataStore = (CRKFeatureDataStoreProtocol *)objc_opt_new(CRKFeatureDataStoreProvider);
      v20 = objc_claimAutoreleasedReturnValue(-[CRKFeatureDataStoreProtocol makeFeatureDataStore](dataStore, "makeFeatureDataStore"));
      v21 = v15->_dataStore;
      v15->_dataStore = (CRKFeatureDataStoreProtocol *)v20;

    }
  }

  return v15;
}

- (BOOL)isModifiable
{
  unsigned int v3;
  void *v4;

  if (-[STUFeature isRestricted](self, "isRestricted") || -[STUFeature isForced](self, "isForced"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature enrollmentRecord](self, "enrollmentRecord"));
    v3 = objc_msgSend(v4, "isManaged") ^ 1;

  }
  return v3;
}

- (unint64_t)permissionWithError:(id *)a3
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (-[STUFeature isRestricted](self, "isRestricted"))
  {
    if (a3)
    {
      v5 = CRKErrorWithCodeAndUserInfo(108, 0);
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue(v5);
    }
    else
    {
      return 0;
    }
  }
  else if (-[STUFeature isForced](self, "isForced"))
  {
    return 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature enrollmentRecord](self, "enrollmentRecord"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "groupIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));

    v6 = -[STUFeature permissionForConfigurationUUID:](self, "permissionForConfigurationUUID:", v9);
    if ((v6 & 1) == 0)
    {
      if (a3)
      {
        v10 = CRKErrorWithCodeAndUserInfo(110, 0);
        v6 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue(v10);
      }
      else
      {
        v6 = 0;
      }
    }

  }
  return v6;
}

- (unint64_t)permission
{
  return -[STUFeature permissionWithError:](self, "permissionWithError:", 0);
}

- (void)setPermission:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature enrollmentRecord](self, "enrollmentRecord"));
  if (objc_msgSend(v5, "isManaged"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature enrollmentRecord](self, "enrollmentRecord"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "groupIdentifier"));
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));

  }
  else
  {
    v8 = 0;
  }

  -[STUFeature setPermission:forConfigurationUUID:](self, "setPermission:forConfigurationUUID:", a3, v8);
}

- (BOOL)isRestricted
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature dataStore](self, "dataStore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature CRKFeature](self, "CRKFeature"));
  v5 = objc_msgSend(v3, "BOOLRestrictionForFeature:", v4) != 0;

  return v5;
}

- (BOOL)isForced
{
  if (-[STUFeature isForcedByRestriction](self, "isForcedByRestriction"))
    return 1;
  else
    return -[STUFeature isForcedByASM](self, "isForcedByASM");
}

- (BOOL)isForcedByASM
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature enrollmentRecord](self, "enrollmentRecord"));
  if (objc_msgSend(v2, "isASM"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[STUCloudConfiguration sharedConfiguration](STUCloudConfiguration, "sharedConfiguration"));
    v4 = objc_msgSend(v3, "isSupervised");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)isForcedByRestriction
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature forceKey](self, "forceKey"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature dataStore](self, "dataStore"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature forceKey](self, "forceKey"));
    v6 = objc_msgSend(v4, "effectiveBoolValueForSetting:outAsk:", v5, 0) == (id)1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setPermission:(unint64_t)a3 forConfigurationUUID:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if (-[STUFeature permissionForConfigurationUUID:](self, "permissionForConfigurationUUID:") != a3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature dataStore](self, "dataStore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature CRKFeature](self, "CRKFeature"));
    objc_msgSend(v6, "setBoolValue:ask:forSetting:configurationUUID:", a3 & 1, (a3 >> 1) & 1, v7, v8);

  }
}

- (unint64_t)permissionForConfigurationUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned __int8 v10;

  v10 = 0;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature dataStore](self, "dataStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature CRKFeature](self, "CRKFeature"));
  v7 = objc_msgSend(v5, "effectiveValueForSetting:configurationUUID:outAsk:", v6, v4, &v10);

  v8 = (void *)objc_opt_class(self);
  return (unint64_t)objc_msgSend(v8, "featurePermissionFromFeatureBoolType:ask:", v7, v10);
}

+ (unint64_t)featurePermissionFromFeatureBoolType:(unint64_t)a3 ask:(BOOL)a4
{
  unint64_t v4;
  uint64_t v5;

  v4 = 3;
  v5 = 3;
  if (!a4)
    v5 = 1;
  if (a3 == 1)
    v4 = v5;
  if (a3 == 2)
    return 0;
  else
    return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;

  v4 = a3;
  v5 = objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    v6 = -[STUFeature isEqualToFeature:](self, "isEqualToFeature:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)isEqualToFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  void *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature CRKFeature](self, "CRKFeature"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "CRKFeature"));
  v7 = v5;
  v8 = v6;
  if (v7 | v8
    && (v9 = objc_msgSend((id)v7, "isEqual:", v8), (id)v8, (id)v7, !v9))
  {
    v17 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature enrollmentRecord](self, "enrollmentRecord"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enrollmentRecord"));
    v12 = v10;
    v13 = v11;
    if (v12 | v13
      && (v14 = objc_msgSend((id)v12, "isEqual:", v13), (id)v13, (id)v12, !v14))
    {
      v17 = 0;
    }
    else
    {
      v15 = objc_claimAutoreleasedReturnValue(-[STUFeature forceKey](self, "forceKey"));
      v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "forceKey"));
      if (v15 | v16)
        v17 = objc_msgSend((id)v15, "isEqual:", v16);
      else
        v17 = 1;

    }
  }

  return v17;
}

- (NSString)description
{
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  __CFString *v7;
  const __CFString *v8;
  __CFString *v9;
  void *v10;

  v3 = -[STUFeature permission](self, "permission");
  v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUFeature CRKFeature](self, "CRKFeature"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
  if ((v3 & 1) != 0)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if ((v3 & 2) != 0)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  v9 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p { feature = %@, permission = %@ (allowed = %@, ask = %@) }>"), v4, self, v5, v6, v9, v8));

  return (NSString *)v10;
}

- (STUControlGroupEnrollmentRecord)enrollmentRecord
{
  return self->_enrollmentRecord;
}

- (NSString)CRKFeature
{
  return self->_CRKFeature;
}

- (void)setCRKFeature:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (CRKFeatureDataStoreProtocol)dataStore
{
  return self->_dataStore;
}

- (NSString)forceKey
{
  return self->_forceKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forceKey, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_CRKFeature, 0);
  objc_storeStrong((id *)&self->_enrollmentRecord, 0);
}

@end
