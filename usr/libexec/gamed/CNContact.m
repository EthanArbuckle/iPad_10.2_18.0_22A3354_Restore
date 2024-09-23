@implementation CNContact

- (id)_gkAllHandles
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact phoneNumbers](self, "phoneNumbers"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v26;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)v8), "value"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
        v11 = (void *)IDSCopyIDForPhoneNumber(v10);

        if (objc_msgSend(v11, "length"))
          objc_msgSend(v3, "addObject:", v11);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CNContact emailAddresses](self, "emailAddresses", 0));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v16), "value"));
        v18 = (void *)IDSCopyBestGuessIDForID();

        if (objc_msgSend(v18, "length"))
          objc_msgSend(v3, "addObject:", v18);

        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }

  v19 = objc_msgSend(v3, "copy");
  return v19;
}

+ (id)_gkContactFromCacheObject:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  id v22;
  id v23;

  v3 = a3;
  v4 = objc_alloc_init((Class)CNMutableContact);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "givenName"));
  objc_msgSend(v4, "setGivenName:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "familyName"));
  objc_msgSend(v4, "setFamilyName:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "namePrefix"));
  objc_msgSend(v4, "setNamePrefix:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nameSuffix"));
  objc_msgSend(v4, "setNameSuffix:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nickname"));
  objc_msgSend(v4, "setNickname:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "handle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[IDSURI URIWithPrefixedURI:](IDSURI, "URIWithPrefixedURI:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "unprefixedURI"));
  v13 = objc_msgSend(v11, "IDSIDType");
  if (v13 == (id)1)
  {
    v15 = objc_msgSend(objc_alloc((Class)CNLabeledValue), "initWithLabel:value:", 0, v12);
    v22 = v15;
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    objc_msgSend(v4, "setEmailAddresses:", v16);
    goto LABEL_5;
  }
  v14 = (uint64_t)v13;
  if (!v13)
  {
    v15 = objc_msgSend(objc_alloc((Class)CNPhoneNumber), "initWithStringValue:", v12);
    v16 = objc_msgSend(objc_alloc((Class)CNLabeledValue), "initWithLabel:value:", 0, v15);
    v23 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    objc_msgSend(v4, "setPhoneNumbers:", v17);

LABEL_5:
    goto LABEL_10;
  }
  if (!os_log_GKGeneral)
    v18 = (id)GKOSLoggers(v13);
  v19 = os_log_GKError;
  if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR))
    sub_1001402F8(v14, v19);
LABEL_10:
  v20 = objc_msgSend(v4, "copy");

  return v20;
}

@end
