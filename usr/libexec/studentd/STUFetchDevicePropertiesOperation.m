@implementation STUFetchDevicePropertiesOperation

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___STUFetchDevicePropertiesOperation;
  if (!objc_msgSendSuper2(&v15, "validateRequest:error:", v6, a4))
    goto LABEL_10;
  v7 = objc_opt_class(DMFFetchDevicePropertiesRequest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) == 0)
  {
    v8 = objc_opt_class(CRKFetchDevicePropertiesRequest);
    if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
    {
      if (a4)
      {
        v13 = CATErrorWithCodeAndUserInfo(2, &off_1000D39E8);
        v11 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue(v13);
        goto LABEL_11;
      }
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "propertyKeysForRequest:", v6));
  v10 = (void *)v9;
  v11 = v9 != 0;
  if (a4 && !v9)
  {
    v12 = CATErrorWithCodeAndUserInfo(2, &off_1000D3A10);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v12);
  }

LABEL_11:
  return v11;
}

- (void)runWithRequest:(id)a3
{
  void *v4;
  unsigned __int8 v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *j;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  char isKindOfClass;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  STUFetchDevicePropertiesOperation *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  STUFetchDevicePropertiesOperation *v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _QWORD v51[12];

  v33 = a3;
  v34 = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v5 = objc_msgSend(v4, "supportsConnectedInstructor");

  if ((v5 & 1) != 0)
  {
    v6 = objc_opt_new(NSMutableDictionary);
    v7 = objc_opt_new(NSMutableDictionary);
    v51[0] = CRKDeviceUserIdentifierKey;
    v51[1] = CRKDeviceUserDisplayNameKey;
    v51[2] = CRKDeviceUserGivenNameKey;
    v51[3] = CRKDeviceUserFamilyNameKey;
    v51[4] = CRKDeviceUserImageURLKey;
    v51[5] = CRKDeviceUserRequestingUnenrollmentKey;
    v51[6] = CRKDeviceStagedAdHocIdentityFingerprintKey;
    v51[7] = CRKDeviceTrustedAnchorCertificateFingerprintsKey;
    v51[8] = CRKDeviceUserPhoneticGivenNameKey;
    v51[9] = CRKDeviceUserPhoneticFamilyNameKey;
    v51[10] = CRKDeviceStudentImageIdentifierKey;
    v51[11] = CRKDeviceInstructorImageIdentifierKey;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 12));
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchDevicePropertiesOperation propertyKeys](self, "propertyKeys"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          v14 = CATErrorWithCodeAndUserInfo(2, &off_1000D3A38);
          v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
          -[NSMutableDictionary setValue:forKey:](v7, "setValue:forKey:", v15, v13);

        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
      }
      while (v10);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](v34, "context"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "device"));

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchDevicePropertiesOperation propertyKeys](v34, "propertyKeys"));
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(_QWORD *)v36 != v20)
            objc_enumerationMutation(v18);
          v22 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)j);
          if (objc_msgSend(v8, "containsObject:", v22))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchDevicePropertiesOperation valueForUserPropertyKey:](v34, "valueForUserPropertyKey:", v22));
            -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v22);
            if (!v23)
              v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          }
          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "valueForKey:", v22));
            -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v22);
            if (!v23)
              v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          }
          -[NSMutableDictionary setValue:forKey:](v6, "setValue:forKey:", v23, v22);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v49, 16);
      }
      while (v19);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchDevicePropertiesOperation request](v34, "request"));
    v25 = objc_opt_class(DMFFetchDevicePropertiesRequest);
    isKindOfClass = objc_opt_isKindOfClass(v24, v25);

    if ((isKindOfClass & 1) != 0)
    {
      v27 = objc_msgSend(objc_alloc((Class)DMFFetchDevicePropertiesResultObject), "initWithValuesByPropertyKey:errorsByPropertyKey:", v6, v7);
    }
    else
    {
      v27 = (id)objc_opt_new(CRKFetchDevicePropertiesResultObject);
      objc_msgSend(v27, "setValuesByPropertyKey:", v6);
      objc_msgSend(v27, "setErrorsByPropertyKey:", v7);
    }
    -[STUFetchDevicePropertiesOperation endOperationWithResultObject:](v34, "endOperationWithResultObject:", v27);

  }
  else
  {
    v28 = sub_100046B34();
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(&v6->super.super, OS_LOG_TYPE_INFO))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "instructorClassroomAppVersion"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v31, "instructorPlatform")));
      *(_DWORD *)buf = 138543874;
      v44 = self;
      v45 = 2114;
      v46 = v30;
      v47 = 2114;
      v48 = v32;
      _os_log_impl((void *)&_mh_execute_header, &v6->super.super, OS_LOG_TYPE_INFO, "%{public}@: Blocking attempt to fetch device properties from an unsupported instructor. Classroom App (%{public}@), Platform (%{public}@)", buf, 0x20u);

    }
  }

}

+ (id)fingerprintsByPersistentIDCache
{
  if (qword_1000FC418 != -1)
    dispatch_once(&qword_1000FC418, &stru_1000CAEA0);
  return (id)qword_1000FC410;
}

- (id)valueForUserPropertyKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "configurationManager"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "enrollmentRecord"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "groupUser"));
  if (!objc_msgSend(v4, "isEqualToString:", CRKDeviceUserIdentifierKey))
  {
    if (objc_msgSend(v4, "isEqualToString:", CRKDeviceUserDisplayNameKey))
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "displayName"));
    }
    else if (objc_msgSend(v4, "isEqualToString:", CRKDeviceUserGivenNameKey))
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "givenName"));
    }
    else if (objc_msgSend(v4, "isEqualToString:", CRKDeviceUserFamilyNameKey))
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "familyName"));
    }
    else if (objc_msgSend(v4, "isEqualToString:", CRKDeviceUserImageURLKey))
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageURL"));
    }
    else if (objc_msgSend(v4, "isEqualToString:", CRKDeviceUserPhoneticGivenNameKey))
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "phoneticGivenName"));
    }
    else if (objc_msgSend(v4, "isEqualToString:", CRKDeviceUserPhoneticFamilyNameKey))
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "phoneticFamilyName"));
    }
    else if (objc_msgSend(v4, "isEqualToString:", CRKDeviceStudentImageIdentifierKey))
    {
      v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "imageIdentifier"));
    }
    else
    {
      if (objc_msgSend(v4, "isEqualToString:", CRKDeviceInstructorImageIdentifierKey))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "instructor"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageIdentifier"));

        goto LABEL_22;
      }
      if (objc_msgSend(v4, "isEqualToString:", CRKDeviceStagedAdHocIdentityFingerprintKey))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rollingCourseIdentitySet"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "stagedIdentityPersistentID"));

        if (v11)
        {
          v22 = objc_msgSend((id)objc_opt_class(self), "fingerprintsByPersistentIDCache");
          v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "objectForKey:", v11));

          if (!v13)
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "keychain"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identityWithPersistentID:", v11));

            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "certificate"));
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "fingerprint"));

            if (v13)
            {
              v28 = objc_msgSend((id)objc_opt_class(self), "fingerprintsByPersistentIDCache");
              v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
              objc_msgSend(v29, "setObject:forKey:", v13, v11);

            }
          }
        }
        else
        {
          v13 = 0;
        }
        goto LABEL_10;
      }
      if (objc_msgSend(v4, "isEqualToString:", CRKDeviceTrustedAnchorCertificateFingerprintsKey))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "groupIdentifier"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trustedAnchorCertificatesForGroupIdentifier:", v30));

        v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crk_mapUsingBlock:", &stru_1000CAEE0));
        goto LABEL_4;
      }
      if (!objc_msgSend(v4, "isEqualToString:", CRKDeviceUserRequestingUnenrollmentKey))
      {
        v13 = 0;
        goto LABEL_22;
      }
      v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "isRequestingUnenroll")));
    }
    v13 = (void *)v14;
    goto LABEL_22;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userIdentifier"));
  v11 = v10;
  if (!v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUTaskOperation context](self, "context"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "enrollmentRecord"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "groupIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "adHocUserIdentifierForCourseWithIdentifier:", v17));

    goto LABEL_10;
  }
  v12 = v10;
LABEL_4:
  v13 = v12;
LABEL_10:

LABEL_22:
  return v13;
}

- (id)propertyKeys
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUFetchDevicePropertiesOperation request](self, "request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "propertyKeysForRequest:", v4));

  return v5;
}

+ (id)propertyKeysForRequest:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  v3 = a3;
  v4 = objc_opt_class(DMFFetchDevicePropertiesRequest);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;
  v7 = v3;
  v8 = objc_opt_class(CRKFetchDevicePropertiesRequest);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
    v9 = v7;
  else
    v9 = 0;
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "propertyKeys"));
  v12 = v11;
  if (v11)
    v13 = v11;
  else
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "propertyKeys"));
  v14 = v13;

  return v14;
}

@end
