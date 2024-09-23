@implementation STUScreenObserveFeature

- (STUScreenObserveFeature)initWithEnrollmentRecord:(id)a3 configurationManager:(id)a4
{
  id v6;
  id v7;
  STUScreenObserveFeature *v8;
  STUScreenObserveFeature *v9;
  STUFeature *v10;
  void *v11;
  STUFeature *v12;
  STUFeature *featureScreenObserveAllowed;
  STUFeature *v14;
  void *v15;
  STUFeature *v16;
  STUFeature *featureUnpromptedRemoteScreenObservationForced;
  void *v18;
  uint64_t v19;
  CRKFeatureDataStoreProtocol *featureDataStore;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)STUScreenObserveFeature;
  v8 = -[STUScreenObserveFeature init](&v22, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configurationManager, a4);
    v10 = [STUFeature alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRKRestrictions classroomScreenObservationAllowed](CRKRestrictions, "classroomScreenObservationAllowed"));
    v12 = -[STUFeature initWithCRKFeature:](v10, "initWithCRKFeature:", v11);
    featureScreenObserveAllowed = v9->_featureScreenObserveAllowed;
    v9->_featureScreenObserveAllowed = v12;

    v14 = [STUFeature alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CRKRestrictions unpromptedRemoteScreenObservationForced](CRKRestrictions, "unpromptedRemoteScreenObservationForced"));
    v16 = -[STUFeature initWithCRKFeature:enrollmentRecord:](v14, "initWithCRKFeature:enrollmentRecord:", v15, v6);
    featureUnpromptedRemoteScreenObservationForced = v9->_featureUnpromptedRemoteScreenObservationForced;
    v9->_featureUnpromptedRemoteScreenObservationForced = v16;

    v18 = (void *)objc_opt_new(CRKFeatureDataStoreProvider);
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "makeFeatureDataStore"));
    featureDataStore = v9->_featureDataStore;
    v9->_featureDataStore = (CRKFeatureDataStoreProtocol *)v19;

  }
  return v9;
}

- (STUControlGroupEnrollmentRecord)enrollmentRecord
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUScreenObserveFeature featureUnpromptedRemoteScreenObservationForced](self, "featureUnpromptedRemoteScreenObservationForced"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "enrollmentRecord"));

  return (STUControlGroupEnrollmentRecord *)v3;
}

- (NSString)CRKFeature
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUScreenObserveFeature featureScreenObserveAllowed](self, "featureScreenObserveAllowed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "CRKFeature"));

  return (NSString *)v3;
}

- (BOOL)isRestricted
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUScreenObserveFeature featureScreenObserveAllowed](self, "featureScreenObserveAllowed"));
  v3 = objc_msgSend(v2, "isRestricted");

  return v3;
}

- (BOOL)isModifiable
{
  void *v4;
  unsigned int v5;

  if (-[STUScreenObserveFeature isRestricted](self, "isRestricted")
    || -[STUScreenObserveFeature isForced](self, "isForced"))
  {
    return 0;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUScreenObserveFeature enrollmentRecord](self, "enrollmentRecord"));
  v5 = objc_msgSend(v4, "isManaged");

  if (v5)
    return -[STUScreenObserveFeature EDUProfileAllowsScreenObservationPermissionModification](self, "EDUProfileAllowsScreenObservationPermissionModification");
  else
    return 1;
}

- (unint64_t)permissionWithError:(id *)a3
{
  uint64_t v5;
  id v6;
  unint64_t result;
  void *v8;
  id v9;

  if (-[STUScreenObserveFeature isRestricted](self, "isRestricted"))
  {
    if (a3)
    {
      v5 = CRKErrorWithCodeAndUserInfo(108, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue(v5);
      result = 0;
      *a3 = v6;
    }
    else
    {
      return 0;
    }
  }
  else if (-[STUScreenObserveFeature isForced](self, "isForced"))
  {
    return 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUScreenObserveFeature featureScreenObserveAllowed](self, "featureScreenObserveAllowed"));
    v9 = objc_msgSend(v8, "permissionWithError:", a3);

    return (unint64_t)v9;
  }
  return result;
}

- (unint64_t)permission
{
  return -[STUScreenObserveFeature permissionWithError:](self, "permissionWithError:", 0);
}

- (void)setPermission:(unint64_t)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[STUScreenObserveFeature featureScreenObserveAllowed](self, "featureScreenObserveAllowed"));
  objc_msgSend(v4, "setPermission:", a3);

}

- (BOOL)EDUProfileAllowsScreenObservationPermissionModification
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUScreenObserveFeature configurationManager](self, "configurationManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "effectiveManagedConfiguration"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", kCRKEDUScreenObservationPermissionModificationAllowedKey));
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (BOOL)isForced
{
  if (-[STUScreenObserveFeature isForcedByRestriction](self, "isForcedByRestriction"))
    return 1;
  else
    return -[STUScreenObserveFeature isForcedByASM](self, "isForcedByASM");
}

- (BOOL)isForcedByRestriction
{
  uint64_t v3;
  unsigned __int8 v4;
  void *v5;

  v3 = objc_claimAutoreleasedReturnValue(-[STUScreenObserveFeature featureUnpromptedRemoteScreenObservationForced](self, "featureUnpromptedRemoteScreenObservationForced"));
  v4 = objc_msgSend((id)v3, "permission");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUScreenObserveFeature featureDataStore](self, "featureDataStore"));
  LOBYTE(v3) = objc_msgSend(v5, "isClassroomUnpromptedScreenObservationForced");

  return (v4 | v3) & 1;
}

- (BOOL)isForcedByASM
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUScreenObserveFeature enrollmentRecord](self, "enrollmentRecord"));
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

- (STUConfigurationManager)configurationManager
{
  return self->_configurationManager;
}

- (STUFeature)featureScreenObserveAllowed
{
  return self->_featureScreenObserveAllowed;
}

- (STUFeature)featureUnpromptedRemoteScreenObservationForced
{
  return self->_featureUnpromptedRemoteScreenObservationForced;
}

- (CRKFeatureDataStoreProtocol)featureDataStore
{
  return self->_featureDataStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureDataStore, 0);
  objc_storeStrong((id *)&self->_featureUnpromptedRemoteScreenObservationForced, 0);
  objc_storeStrong((id *)&self->_featureScreenObserveAllowed, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);
}

@end
