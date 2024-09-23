@implementation STUFetchIdentitiesOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___STUFetchIdentitiesOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = objc_opt_class(CRKFetchIdentitiesRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    if (a4)
    {
      v9 = CRKErrorWithCodeAndUserInfo(2, &off_1000D3A60);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(v9);
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = 1;
LABEL_7:

  return v8;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  NSMutableDictionary *v5;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  NSMutableDictionary *v12;
  STUFetchIdentitiesOperation *v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context", a3));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configurationManager"));

  v5 = objc_opt_new(NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "visibleGroupEnrollmentRecords"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100047AD4;
  v11[3] = &unk_1000CAF48;
  v12 = v5;
  v13 = self;
  v7 = v5;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  v8 = (void *)objc_opt_new(CRKFetchIdentitiesTaskResultObject);
  v9 = -[NSMutableDictionary copy](v7, "copy");
  objc_msgSend(v8, "setCourseIdentityInfosByGroupIdentifier:", v9);

  -[STUFetchIdentitiesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v8);
}

- (id)resultDictionaryForRollingIdentity:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_opt_new(NSMutableDictionary);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "commonNamePrefix"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v6, CFSTR("CommonNamePrefix"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeIdentityPersistentID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchIdentitiesOperation identityInfoFromIdentityPersistentID:](self, "identityInfoFromIdentityPersistentID:", v7));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, CFSTR("Active"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stagedIdentityPersistentID"));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stagedIdentityPersistentID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchIdentitiesOperation identityInfoFromIdentityPersistentID:](self, "identityInfoFromIdentityPersistentID:", v10));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v11, CFSTR("Staged"));

  }
  return v5;
}

- (id)identityInfoFromIdentityPersistentID:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v3 = a3;
  v4 = objc_opt_new(NSMutableDictionary);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "keychain"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identityWithPersistentID:", v3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "certificate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "validityDateInterval"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "commonNames"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v10, CFSTR("CertificateCommonNames"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "fingerprint"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v11, CFSTR("Fingerprint"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "startDate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crk_JSONStringValue"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v13, CFSTR("ValidityStartDate"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "endDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "crk_JSONStringValue"));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v15, CFSTR("ValidityEndDate"));

  v16 = -[NSMutableDictionary copy](v4, "copy");
  return v16;
}

@end
