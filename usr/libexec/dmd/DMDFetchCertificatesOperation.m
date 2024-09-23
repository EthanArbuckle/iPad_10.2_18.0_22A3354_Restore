@implementation DMDFetchCertificatesOperation

+ (id)whitelistedClassesForRequest
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[0] = objc_opt_class(DMFFetchCertificatesRequest);
  v5[1] = objc_opt_class(DMFFetchInstalledCertificatesRequest);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v5, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v2));

  return v3;
}

+ (id)requiredEntitlements
{
  return &off_1000C2BF8;
}

- (void)runWithRequest:(id)a3
{
  NSMutableSet *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  void *v17;
  CFTypeID TypeID;
  NSMutableSet *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *k;
  __SecCertificate *v24;
  __SecCertificate *v25;
  CFTypeID v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  NSMutableArray *v32;
  id obj;
  id v34;
  SecCertificateRef certificateRef;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];

  v34 = a3;
  v32 = objc_opt_new(NSMutableArray);
  v3 = objc_opt_new(NSMutableSet);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "installedProfilesWithFilterFlags:", 1));
  v5 = objc_opt_class(MCCertificatePayload);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v45;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        if (!objc_msgSend(v34, "managedOnly") || objc_msgSend(v10, "isManagedByMDM"))
        {
          v42 = 0u;
          v43 = 0u;
          v40 = 0u;
          v41 = 0u;
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "payloads"));
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(_QWORD *)v41 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)j);
                if ((objc_opt_isKindOfClass(v16, v5) & 1) != 0)
                {
                  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "certificatePersistentID"));
                  -[NSMutableSet addObject:](v3, "addObject:", v17);

                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
            }
            while (v13);
          }

        }
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v7);
  }

  TypeID = SecIdentityGetTypeID();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v19 = v3;
  v20 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v37;
    do
    {
      for (k = 0; k != v21; k = (char *)k + 1)
      {
        if (*(_QWORD *)v37 != v22)
          objc_enumerationMutation(v19);
        v24 = (__SecCertificate *)+[MCKeychain copyItemWithPersistentID:useSystemKeychain:](MCKeychain, "copyItemWithPersistentID:useSystemKeychain:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)k), 1);
        if (v24)
        {
          v25 = v24;
          certificateRef = 0;
          v26 = CFGetTypeID(v24);
          if (v26 != TypeID)
          {
            certificateRef = v25;
LABEL_30:
            v27 = objc_alloc((Class)DMFCertificate);
            v28 = objc_msgSend(v27, "initWithCertificateRef:isIdentity:", certificateRef, v26 == TypeID);
            -[NSMutableArray addObject:](v32, "addObject:", v28);

            CFRelease(certificateRef);
            continue;
          }
          SecIdentityCopyCertificate(v25, &certificateRef);
          CFRelease(v25);
          if (certificateRef)
            goto LABEL_30;
        }
      }
      v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v36, v48, 16);
    }
    while (v21);
  }

  v29 = objc_msgSend(objc_alloc((Class)DMFFetchCertificatesResultObject), "initWithCertificates:", v32);
  -[DMDFetchCertificatesOperation endOperationWithResultObject:](self, "endOperationWithResultObject:", v29);

}

@end
