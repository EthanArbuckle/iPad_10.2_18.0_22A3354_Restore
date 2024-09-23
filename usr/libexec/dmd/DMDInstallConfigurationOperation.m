@implementation DMDInstallConfigurationOperation

+ (id)whitelistedClassesForRequest
{
  uint64_t v2;

  v2 = objc_opt_class(DMFInstallConfigurationRequest, a2);
  return +[NSSet setWithObject:](NSSet, "setWithObject:", v2);
}

+ (id)requiredEntitlements
{
  return &off_1000C2DD8;
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
  v11.super_class = (Class)&OBJC_METACLASS___DMDInstallConfigurationOperation;
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

+ (NSSet)excludedBoolRestrictions
{
  if (qword_1000EB8B8 != -1)
    dispatch_once(&qword_1000EB8B8, &stru_1000BB210);
  return (NSSet *)(id)qword_1000EB8B0;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  unsigned __int8 v16;
  id v17;
  id v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  NSErrorUserInfoKey v29;
  id v30;
  void *v31;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profile"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("PayloadContent")));

  if (objc_msgSend(v6, "count") == (id)1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PayloadType")));
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.applicationaccess"));

    if (!v9)
    {
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profile"));
      v10 = 0;
      goto LABEL_9;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
  }
  else
  {
    if (objc_msgSend(v6, "count") == (id)2)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profile"));
      v12 = objc_msgSend(v11, "mutableCopy");

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
      v31 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("PayloadContent"));

      v15 = objc_msgSend(v12, "copy");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));

      goto LABEL_9;
    }
    v10 = 0;
  }
  v15 = 0;
LABEL_9:
  v28 = 0;
  v16 = -[DMDInstallConfigurationOperation _installProfile:withRequest:error:](self, "_installProfile:withRequest:error:", v15, v4, &v28);
  v17 = v28;
  v18 = v17;
  if ((v16 & 1) != 0)
  {
    v27 = v17;
    v19 = -[DMDInstallConfigurationOperation _installRestrictionsPayload:withRequest:error:](self, "_installRestrictionsPayload:withRequest:error:", v10, v4, &v27);
    v20 = v27;

    if ((v19 & 1) != 0)
    {
      -[DMDInstallConfigurationOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", 0);
      v18 = v20;
    }
    else
    {
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_100048974;
      v25[3] = &unk_1000B9B40;
      v25[4] = self;
      v26 = v20;
      v18 = v20;
      -[DMDInstallConfigurationOperation _rollbackProfile:withRequest:completion:](self, "_rollbackProfile:withRequest:completion:", v15, v4, v25);

    }
  }
  else if (v17)
  {
    v29 = NSUnderlyingErrorKey;
    v30 = v17;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
    v22 = DMFErrorWithCodeAndUserInfo(2002, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[DMDInstallConfigurationOperation endOperationWithError:](self, "endOperationWithError:", v23);

  }
  else
  {
    v24 = DMFErrorWithCodeAndUserInfo(2002, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue(v24);
    -[DMDInstallConfigurationOperation endOperationWithError:](self, "endOperationWithError:", v18);
  }

}

- (BOOL)_installProfile:(id)a3 withRequest:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;

  v8 = a4;
  if (a3)
  {
    v30 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", a3, 200, 0, &v30));
    v10 = v30;
    v11 = v10;
    if (!v9)
    {
      v15 = DMFConfigurationEngineLog(v10);
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_10007716C(v11);

      if (a5)
      {
        v17 = objc_retainAutorelease(v11);
        v14 = 0;
        *a5 = v17;
      }
      else
      {
        v14 = 0;
        v17 = v11;
      }
      goto LABEL_19;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DMDTaskOperation context](self, "context"));
    if (objc_msgSend(v13, "runAsUser"))
    {

    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallConfigurationOperation request](self, "request"));
      v19 = objc_msgSend(v18, "type");

      if (v19 != (id)1)
      {
        v20 = 1;
        goto LABEL_13;
      }
    }
    v20 = 2;
LABEL_13:
    v31 = kMCInstallProfileOptionInstallationType;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v20));
    v32 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1));
    v23 = objc_msgSend(v22, "mutableCopy");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managingProfileIdentifier"));
    if (v24)
    {
      objc_msgSend(v23, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, kMCInstallProfileOptionIsInstalledByMDM);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managingProfileIdentifier"));
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, kMCInstallProfileOptionManagingProfileIdentifier);

    }
    v26 = objc_msgSend(v23, "copy");
    v29 = v11;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "installProfileData:options:outError:", v9, v26, &v29));
    v17 = v29;

    v14 = v27 != 0;
    if (a5 && !v27)
      *a5 = objc_retainAutorelease(v17);

LABEL_19:
    goto LABEL_20;
  }
  v14 = 1;
LABEL_20:

  return v14;
}

- (void)_rollbackProfile:(id)a3 withRequest:(id)a4 completion:(id)a5
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
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallConfigurationOperation request](self, "request"));
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

- (BOOL)_installRestrictionsPayload:(id)a3 withRequest:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  id v36;
  id v37;
  id v38;

  v8 = a4;
  if (a3)
  {
    v38 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallConfigurationOperation _mapMCRestrictionsFromPayload:error:](self, "_mapMCRestrictionsFromPayload:error:", a3, &v38));
    v10 = v38;
    v11 = v10;
    if (v9)
    {
      v37 = v10;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallConfigurationOperation _applyHeuristicsToRestrictions:error:](self, "_applyHeuristicsToRestrictions:error:", v9, &v37));
      v13 = v37;

      if (v12)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "profile"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PayloadIdentifier")));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-restrictions"), v16));

        v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
        v36 = v13;
        v19 = objc_msgSend(v18, "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", v12, CFSTR("com.apple.dmd"), v17, 0, 0, 0, 0, &v36);
        v11 = v36;

        if ((v19 & 1) != 0)
        {
          v21 = MCFeatureMaximumAppsRating;
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager valueForFeature:withRestrictionsDictionary:](MCRestrictionManager, "valueForFeature:withRestrictionsDictionary:", MCFeatureMaximumAppsRating, v12));
          v23 = objc_msgSend(v22, "intValue");
          v24 = DMFAppRatingUnrated;
          if (v23 == objc_msgSend(DMFAppRatingUnrated, "intValue"))
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "userValueForSetting:", v21));

            LODWORD(v25) = objc_msgSend(v26, "intValue");
            if ((_DWORD)v25 == objc_msgSend(DMFAppRatingAllApps, "intValue"))
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
              objc_msgSend(v27, "setValue:forSetting:", v24, v21);

            }
          }

        }
        else
        {
          v33 = DMFConfigurationEngineLog(v20);
          v34 = objc_claimAutoreleasedReturnValue(v33);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            sub_1000772D4(v11);

          if (a5)
            *a5 = objc_retainAutorelease(v11);
        }

        goto LABEL_27;
      }
      v31 = DMFConfigurationEngineLog(v14);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_10007725C(v13);

      if (!a5)
      {
        v19 = 0;
        v11 = v13;
        goto LABEL_27;
      }
      v30 = v13;
    }
    else
    {
      v28 = DMFConfigurationEngineLog(v10);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        sub_1000771E4(v11);

      if (!a5)
      {
        v19 = 0;
        goto LABEL_27;
      }
      v30 = v11;
    }
    v11 = objc_retainAutorelease(v30);
    v19 = 0;
    *a5 = v11;
LABEL_27:

    goto LABEL_28;
  }
  v19 = 1;
LABEL_28:

  return v19;
}

- (id)_mapMCRestrictionsFromPayload:(id)a3 error:(id *)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *j;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *k;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  uint64_t v51;
  void *m;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  id v76;
  void *v77;
  id *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v90;
  void *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  id v96;
  void *v97;
  void *v98;
  id obj;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  const __CFString *v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  const __CFString *v130;
  _BYTE v131[128];
  _BYTE v132[128];
  uint64_t v133;
  const __CFString *v134;
  uint64_t v135;
  id v136;
  uint64_t v137;
  const __CFString *v138;
  _BYTE v139[128];
  _BYTE v140[128];
  uint64_t v141;
  const __CFString *v142;
  _BYTE v143[128];
  uint64_t v144;
  const __CFString *v145;
  _BYTE v146[128];

  v79 = a4;
  v100 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 4));
  v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = MCRestrictedBoolKey;
  v98 = (void *)v5;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, MCRestrictedBoolKey);
  v10 = MCRestrictedValueKey;
  v97 = (void *)v6;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, MCRestrictedValueKey);
  v11 = MCIntersectionKey;
  v91 = (void *)v7;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, MCIntersectionKey);
  v12 = MCUnionKey;
  v81 = v4;
  v86 = (void *)v8;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, MCUnionKey);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "defaultRestrictions"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v9));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v10));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v11));
  v80 = v14;
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v12));
  v121 = 0u;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v146, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v122;
    v19 = MCRestrictedBoolValueKey;
    while (2)
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v122 != v18)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v121 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[DMDInstallConfigurationOperation excludedBoolRestrictions](DMDInstallConfigurationOperation, "excludedBoolRestrictions", v79));
        v23 = objc_msgSend(v22, "containsObject:", v21);

        if ((v23 & 1) == 0)
        {
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKey:", v21));
          v25 = (void *)v24;
          if (v24)
          {
            if ((objc_opt_respondsToSelector(v24, "BOOLValue") & 1) == 0)
            {
              v144 = DMFInvalidParameterErrorKey;
              v145 = CFSTR("key");
              v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v145, &v144, 1));
              v29 = DMFErrorWithCodeAndUserInfo(1, v28);
              v30 = (id)objc_claimAutoreleasedReturnValue(v29);

              if (v30)
                goto LABEL_76;
              goto LABEL_17;
            }
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKey:", v21));
            v27 = objc_msgSend(v26, "MCMutableDeepCopy");

            if (!v27)
              v27 = objc_alloc_init((Class)NSMutableDictionary);
            objc_msgSend(v27, "setObject:forKey:", v25, v19);
            objc_msgSend(v98, "setObject:forKey:", v27, v21);

          }
        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v121, v146, 16);
      if (v17)
        continue;
      break;
    }
  }

LABEL_17:
  v119 = 0u;
  v120 = 0u;
  v117 = 0u;
  v118 = 0u;
  v31 = v84;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v117, v143, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v118;
    v35 = MCRestrictedValueValueKey;
    while (2)
    {
      for (j = 0; j != v33; j = (char *)j + 1)
      {
        if (*(_QWORD *)v118 != v34)
          objc_enumerationMutation(v31);
        v37 = *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * (_QWORD)j);
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKey:", v37, v79));
        if (v38)
        {
          v39 = objc_opt_class(NSNumber);
          if ((objc_opt_isKindOfClass(v38, v39) & 1) == 0)
          {
            v141 = DMFInvalidParameterErrorKey;
            v142 = CFSTR("key");
            v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v142, &v141, 1));
            v43 = DMFErrorWithCodeAndUserInfo(1, v42);
            v30 = (id)objc_claimAutoreleasedReturnValue(v43);

            if (v30)
              goto LABEL_76;
            goto LABEL_31;
          }
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", v37));
          v41 = objc_msgSend(v40, "MCMutableDeepCopy");

          if (!v41)
            v41 = objc_alloc_init((Class)NSMutableDictionary);
          objc_msgSend(v41, "setObject:forKey:", v38, v35);
          objc_msgSend(v97, "setObject:forKey:", v41, v37);

        }
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v117, v143, 16);
      if (v33)
        continue;
      break;
    }
  }

LABEL_31:
  v115 = 0u;
  v116 = 0u;
  v113 = 0u;
  v114 = 0u;
  v92 = v83;
  v95 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v113, v140, 16);
  if (v95)
  {
    v93 = *(_QWORD *)v114;
    v85 = DMFInvalidParameterErrorKey;
    v87 = MCIntersectionValuesKey;
    while (2)
    {
      for (k = 0; k != v95; k = (char *)k + 1)
      {
        if (*(_QWORD *)v114 != v93)
          objc_enumerationMutation(v92);
        v45 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * (_QWORD)k);
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKeyedSubscript:", v45, v79));
        if (v46)
        {
          v47 = objc_opt_class(NSArray);
          if ((objc_opt_isKindOfClass(v46, v47) & 1) == 0)
          {
            v133 = v85;
            v134 = CFSTR("key");
            v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v134, &v133, 1));
            v60 = DMFErrorWithCodeAndUserInfo(1, v59);
            v30 = (id)objc_claimAutoreleasedReturnValue(v60);

            if (v30)
              goto LABEL_76;
            goto LABEL_53;
          }
          v111 = 0u;
          v112 = 0u;
          v109 = 0u;
          v110 = 0u;
          v48 = v46;
          v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v109, v139, 16);
          if (v49)
          {
            v50 = v49;
            v51 = *(_QWORD *)v110;
            while (2)
            {
              for (m = 0; m != v50; m = (char *)m + 1)
              {
                if (*(_QWORD *)v110 != v51)
                  objc_enumerationMutation(v48);
                v53 = *(_QWORD *)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)m);
                v54 = objc_opt_class(NSString);
                if ((objc_opt_isKindOfClass(v53, v54) & 1) == 0)
                {
                  v137 = v85;
                  v138 = CFSTR("key");
                  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v138, &v137, 1));
                  v56 = DMFErrorWithCodeAndUserInfo(1, v55);
                  v30 = (id)objc_claimAutoreleasedReturnValue(v56);

                  if (v30)
                  {
LABEL_74:

                    goto LABEL_76;
                  }
                  goto LABEL_48;
                }
              }
              v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v109, v139, 16);
              if (v50)
                continue;
              break;
            }
          }

LABEL_48:
          v57 = (void *)objc_claimAutoreleasedReturnValue(-[DMDInstallConfigurationOperation _intersectionFeatureForPayloadRestrictionKey:](self, "_intersectionFeatureForPayloadRestrictionKey:", v45));
          v135 = v87;
          v136 = v48;
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v136, &v135, 1));
          objc_msgSend(v91, "setObject:forKeyedSubscript:", v58, v57);

        }
      }
      v95 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v113, v140, 16);
      if (v95)
        continue;
      break;
    }
  }

LABEL_53:
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v92 = v82;
  v96 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v105, v132, 16);
  if (!v96)
  {
LABEL_73:

LABEL_81:
    v77 = v81;
    v76 = v81;
    v30 = 0;
    goto LABEL_80;
  }
  v94 = *(_QWORD *)v106;
  v88 = DMFInvalidParameterErrorKey;
  v90 = MCUnionValuesKey;
LABEL_55:
  v61 = 0;
  while (1)
  {
    if (*(_QWORD *)v106 != v94)
      objc_enumerationMutation(v92);
    v62 = *(_QWORD *)(*((_QWORD *)&v105 + 1) + 8 * v61);
    v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "objectForKeyedSubscript:", v62, v79));
    if (v63)
      break;
LABEL_71:

    if ((id)++v61 == v96)
    {
      v96 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v105, v132, 16);
      if (v96)
        goto LABEL_55;
      goto LABEL_73;
    }
  }
  v64 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v63, v64) & 1) != 0)
  {
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v48 = v63;
    v65 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v101, v131, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v102;
LABEL_62:
      v68 = 0;
      while (1)
      {
        if (*(_QWORD *)v102 != v67)
          objc_enumerationMutation(v48);
        v69 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * v68);
        v70 = objc_opt_class(NSString);
        if ((objc_opt_isKindOfClass(v69, v70) & 1) == 0)
          break;
        if (v66 == (id)++v68)
        {
          v66 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v101, v131, 16);
          if (v66)
            goto LABEL_62;
          goto LABEL_68;
        }
      }
      v129 = v88;
      v130 = CFSTR("key");
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1));
      v72 = DMFErrorWithCodeAndUserInfo(1, v71);
      v30 = (id)objc_claimAutoreleasedReturnValue(v72);

      if (v30)
        goto LABEL_74;
    }
    else
    {
LABEL_68:

    }
    v127 = v90;
    v128 = v48;
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v128, &v127, 1));
    objc_msgSend(v86, "setObject:forKeyedSubscript:", v73, v62);

    goto LABEL_71;
  }
  v125 = v88;
  v126 = CFSTR("key");
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1));
  v75 = DMFErrorWithCodeAndUserInfo(1, v74);
  v30 = (id)objc_claimAutoreleasedReturnValue(v75);

  if (!v30)
    goto LABEL_81;
LABEL_76:
  if (v79)
  {
    v30 = objc_retainAutorelease(v30);
    v76 = 0;
    *v79 = v30;
  }
  else
  {
    v76 = 0;
  }
  v77 = v81;
LABEL_80:

  return v76;
}

- (id)_applyHeuristicsToRestrictions:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v13;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
  v13 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:](MCRestrictionManager, "restrictionsAfterApplyingRestrictionsDictionary:toRestrictionsDictionary:outChangeDetected:outError:", v5, v6, 0, &v13));

  v8 = v13;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MCHacks sharedHacks](MCHacks, "sharedHacks"));
  v10 = (void *)objc_opt_new(MCProfile);
  objc_msgSend(v9, "_applyHeuristicsToRestrictions:forProfile:ignoresUnrestrictableApps:", v7, v10, 0);

  if (v8)
  {
    v11 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }
  else
  {
    v11 = objc_msgSend(v7, "copy");
  }

  return v11;
}

+ (id)_intersectionAliasToFeatures
{
  if (qword_1000EB8C8 != -1)
    dispatch_once(&qword_1000EB8C8, &stru_1000BB230);
  return (id)qword_1000EB8C0;
}

- (id)_intersectionFeatureForPayloadRestrictionKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "_intersectionAliasToFeatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));
  v8 = v7;
  if (!v7)
    v7 = v4;
  v9 = v7;

  return v9;
}

@end
