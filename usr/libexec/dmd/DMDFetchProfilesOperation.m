@implementation DMDFetchProfilesOperation

+ (id)whitelistedClassesForRequest
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[0] = objc_opt_class(DMFFetchProfilesRequest);
  v5[1] = objc_opt_class(DMFFetchInstalledProfilesRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000C2D00;
}

- (void)runWithRequest:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = -[DMDFetchProfilesOperation _profileListWithFilterFlags:](self, "_profileListWithFilterFlags:", MCProfileFilterFlagsFromDMFProfileFilterFlags((uint64_t)objc_msgSend(a3, "filterFlags")));
  v6 = (id)objc_claimAutoreleasedReturnValue(v4);
  v5 = objc_msgSend(objc_alloc((Class)DMFFetchProfilesResultObject), "initWithProfiles:", v6);
  -[DMDFetchProfilesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v5);

}

- (id)_profileListWithFilterFlags:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  uint64_t Length;
  NSData *v23;
  void *v24;
  _BOOL8 v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v34;
  void *v35;
  id v36;
  id obj;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];

  v3 = *(_QWORD *)&a3;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[MCDependencyReader sharedReader](MCDependencyReader, "sharedReader"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager sharedManager](MCRestrictionManager, "sharedManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "installedProfileIdentifiersWithFilterFlags:", v3));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userProfileRestrictions"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "systemProfileRestrictions"));
  v34 = v5;
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "defaultRestrictions"));
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v54;
    v38 = kMCDMManagedProfileToManagingProfileKey;
    v39 = *(_QWORD *)v54;
    v35 = v4;
    do
    {
      v10 = 0;
      v36 = v8;
      do
      {
        if (*(_QWORD *)v54 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)v10);
        v12 = objc_autoreleasePoolPush();
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "installedProfileWithIdentifier:", v11));
        if (v13)
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "dependentsOfParent:inDomain:", v11, v38));
          v14 = objc_msgSend(v48, "count");
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "signerCertificates"));
          if (objc_msgSend(v15, "count"))
          {
            v45 = v14;
            v46 = v15;
            v47 = v12;
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            v16 = v15;
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
            if (v17)
            {
              v18 = v17;
              v19 = *(_QWORD *)v50;
              do
              {
                for (i = 0; i != v18; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v50 != v19)
                    objc_enumerationMutation(v16);
                  v21 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
                  Length = SecCertificateGetLength(v21);
                  v23 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", SecCertificateGetBytePtr(v21), Length);
                  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
                  objc_msgSend(0, "addObject:", v24);

                }
                v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
              }
              while (v18);
            }

            v4 = v35;
            v8 = v36;
            v15 = v46;
            v12 = v47;
            v14 = v45;
          }
          v25 = v14 != 0;
          if (objc_msgSend(v13, "installType") == (id)2)
            v26 = v42;
          else
            v26 = v41;
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v11));
          v28 = v8;
          v29 = v4;
          v30 = (void *)objc_claimAutoreleasedReturnValue(+[MCRestrictionManager filterRestrictionDictionary:toIncludeOnlyRestrictionsThatDifferFromRestrictions:](MCRestrictionManager, "filterRestrictionDictionary:toIncludeOnlyRestrictionsThatDifferFromRestrictions:", v27, v40));

          v31 = objc_msgSend(objc_alloc((Class)DMFProfile), "initWithProfile:isManaged:signerCertificates:restrictions:", v13, v25, 0, v30);
          objc_msgSend(v43, "addObject:", v31);

          v9 = v39;
          v4 = v29;
          v8 = v28;

        }
        objc_autoreleasePoolPop(v12);
        v10 = (char *)v10 + 1;
      }
      while (v10 != v8);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v8);
  }

  v32 = objc_msgSend(v43, "copy");
  return v32;
}

@end
