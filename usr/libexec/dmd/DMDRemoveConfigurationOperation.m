@implementation DMDRemoveConfigurationOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFRemoveConfigurationRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2F70;
}

- (unint64_t)queueGroup
{
  return 1;
}

+ (BOOL)validateRequest:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;
  uint64_t v12;
  const __CFString *v13;

  v6 = a3;
  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___DMDRemoveConfigurationOperation;
  if (!objc_msgSendSuper2(&v11, "validateRequest:error:", v6, a4))
    goto LABEL_6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "profile"));

  if (!v7)
  {
    if (!a4)
      goto LABEL_7;
    v12 = DMFInvalidParameterErrorKey;
    v13 = CFSTR("request.profile");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1));
    v9 = DMFErrorWithCodeAndUserInfo(1, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v9);

LABEL_6:
    LOBYTE(a4) = 0;
    goto LABEL_7;
  }
  LOBYTE(a4) = 1;
LABEL_7:

  return (char)a4;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  char v19;
  void *v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PayloadContent")));

  if (objc_msgSend(v6, "count") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PayloadType")));
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.applicationaccess"));

    if ((v9 & 1) != 0)
    {
      v10 = 0;
      v11 = 1;
    }
    else
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profile"));
      v11 = 0;
    }
  }
  else if (objc_msgSend(v6, "count") == (id)2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profile"));
    v13 = objc_msgSend(v12, "mutableCopy");

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
    v20 = v14;
    v11 = 1;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("PayloadContent"));

    v10 = objc_msgSend(v13, "copy");
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100060318;
  v17[3] = &unk_1000BBC98;
  v19 = v11;
  v17[4] = self;
  v18 = v4;
  v16 = v4;
  -[DMDRemoveConfigurationOperation _removeProfile:withRequest:completion:](self, "_removeProfile:withRequest:completion:", v10, v16, v17);

}

- (void)_removeProfile:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;

  v8 = a5;
  v9 = (void (**)(_QWORD, _QWORD))v8;
  if (a3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "profile"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PayloadIdentifier")));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "installedProfileWithIdentifier:", v11));

    if (!v13)
    {
      v22 = DMFProfileIdentifierErrorKey;
      v23 = v11;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      v16 = DMFErrorWithCodeAndUserInfo(1901, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      ((void (**)(_QWORD, void *))v9)[2](v9, v17);

LABEL_11:
      goto LABEL_12;
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation context](self, "context"));
    if (objc_msgSend(v14, "runAsUser"))
    {

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDRemoveConfigurationOperation request](self, "request"));
      v19 = objc_msgSend(v18, "type");

      if (v19 != (id)1)
      {
        v20 = 1;
        goto LABEL_10;
      }
    }
    v20 = 2;
LABEL_10:
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    objc_msgSend(v21, "removeProfileAsyncWithIdentifier:installationType:completion:", v11, v20, v9);

    goto LABEL_11;
  }
  (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
LABEL_12:

}

- (BOOL)_removeRestrictionsWithRequest:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  unsigned int v13;
  void *v14;
  unsigned __int8 v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  id v25;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "profile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("PayloadIdentifier")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-restrictions"), v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "clientRestrictionsForClientUUID:", v6));

  v9 = MCFeatureMaximumAppsRating;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", MCFeatureMaximumAppsRating, v8));
  v11 = objc_msgSend(v10, "intValue");
  v12 = (void *)DMFAppRatingUnrated;
  v13 = objc_msgSend(DMFAppRatingUnrated, "intValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v25 = 0;
  v15 = objc_msgSend(v14, "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", 0, CFSTR("com.apple.dmd"), v6, 0, 0, 0, 0, &v25);
  v16 = v25;

  if ((v15 & 1) != 0)
  {
    if (v11 == v13)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userValueForSetting:", v9));

      LODWORD(v18) = objc_msgSend(v19, "intValue");
      if ((_DWORD)v18 == objc_msgSend(v12, "intValue"))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
        objc_msgSend(v20, "setValue:forSetting:", DMFAppRatingAllApps, v9);

      }
    }
  }
  else
  {
    v21 = DMFConfigurationEngineLog(v17);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      sub_100079670(v16, v22);

    if (*a4)
      *a4 = objc_retainAutorelease(v16);
  }

  return v15;
}

@end
