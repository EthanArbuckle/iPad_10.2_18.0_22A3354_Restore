@implementation STUASMRosterCertificateIngestor

+ (BOOL)ingestCertificateDatas:(id)a3 intoRosterProvider:(id)a4 instructorAppleID:(id)a5 courseIdentifier:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;

  v12 = a3;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "instructorIdentifierForAppleID:courseIdentifier:rosterProvider:error:", a5, a6, v13, a7));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "certificatesWithDatas:error:", v12, a7));
    if (v15)
      v16 = objc_msgSend(a1, "ingestCertificates:intoRosterProvider:trustedUserIdentifier:error:", v15, v13, v14, a7);
    else
      v16 = 0;

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)instructorIdentifierForAppleID:(id)a3 courseIdentifier:(id)a4 rosterProvider:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v22;
  const __CFString *v23;

  v10 = a3;
  v11 = a4;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "roster"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[STUASMRosterQueryUtilities courseWithIdentifier:inRoster:](STUASMRosterQueryUtilities, "courseWithIdentifier:inRoster:", v11, v12));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifierOfInstructorWithAppleID:inCourse:error:", v10, v13, a6));
  }
  else
  {
    v22 = CFSTR("kCRKItemNameErrorKey");
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
    v16 = (void *)v15;
    v17 = CFSTR("<nil>");
    if (v15)
      v17 = (const __CFString *)v15;
    v23 = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
    v19 = CRKErrorWithCodeAndUserInfo(12, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

    if (a6)
      *a6 = objc_retainAutorelease(v20);

    v14 = 0;
  }

  return v14;
}

+ (id)identifierOfInstructorWithAppleID:(id)a3 inCourse:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v7 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "trustedUsers", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "appleID"));
        v15 = objc_msgSend(v14, "isEqualToString:", v7);

        if ((v15 & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));

          goto LABEL_12;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (a5)
  {
    v16 = CRKErrorWithCodeAndUserInfo(104, 0);
    v17 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue(v16);
  }
  else
  {
    v17 = 0;
  }
LABEL_12:

  return v17;
}

+ (id)certificatesWithDatas:(id)a3 error:(id *)a4
{
  id v5;
  NSMutableArray *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v5 = a3;
  v6 = objc_opt_new(NSMutableArray);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[CRKKeychainProvider sharedProvider](CRKKeychainProvider, "sharedProvider", (_QWORD)v19));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "keychain"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "makeCertificateWithData:", v12));

        if (!v15)
        {
          if (a4)
          {
            v17 = CRKErrorWithCodeAndUserInfo(11, 0);
            *a4 = (id)objc_claimAutoreleasedReturnValue(v17);
          }

          v16 = 0;
          goto LABEL_13;
        }
        -[NSMutableArray addObject:](v6, "addObject:", v15);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }

  v16 = -[NSMutableArray copy](v6, "copy");
LABEL_13:

  return v16;
}

+ (BOOL)ingestCertificates:(id)a3 intoRosterProvider:(id)a4 trustedUserIdentifier:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  unsigned __int8 v15;
  uint64_t v16;
  int v18;
  id v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v9, "count"))
  {
    if (qword_1000FC1F8 != -1)
      dispatch_once(&qword_1000FC1F8, &stru_1000CA420);
    v12 = (void *)qword_1000FC1F0;
    if (os_log_type_enabled((os_log_t)qword_1000FC1F0, OS_LOG_TYPE_INFO))
    {
      v13 = v12;
      v18 = 134217984;
      v19 = objc_msgSend(v9, "count");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Ingesting %lu certificates", (uint8_t *)&v18, 0xCu);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
    v15 = objc_msgSend(v10, "ingestCertificates:forTrustedUserIdentifier:error:", v14, v11, a6);

  }
  else if (a6)
  {
    v16 = CRKErrorWithCodeAndUserInfo(2, &off_1000D31C8);
    v15 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue(v16);
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

@end
