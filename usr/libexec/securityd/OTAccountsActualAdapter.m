@implementation OTAccountsActualAdapter

- (BOOL)isErrorRetryable:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "domain"));
    if (objc_msgSend(v5, "isEqualToString:", NSCocoaErrorDomain))
      v6 = objc_msgSend(v4, "code") == (id)4097 || objc_msgSend(v4, "code") == (id)4099;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)fetchAccountsRetryingWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  int v10;
  const void *v11;
  NSObject *v12;
  void *v13;
  const void *v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  _QWORD v18[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountsActualAdapter store](self, "store"));
  v16 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_appleAccountsWithError:", &v16));
  v7 = v16;

  if (v6)
  {
LABEL_2:
    v8 = v6;
  }
  else
  {
    v10 = 0;
    while (v10 != 5 && -[OTAccountsActualAdapter isErrorRetryable:](self, "isErrorRetryable:", v7))
    {
      v11 = sub_10000EF14("octagon-account");
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v18[0]) = v10;
        WORD2(v18[0]) = 2112;
        *(_QWORD *)((char *)v18 + 6) = v7;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "retrying accountsd XPC, (%d, %@)", buf, 0x12u);
      }

      ++v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountsActualAdapter store](self, "store"));
      v16 = 0;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "aa_appleAccountsWithError:", &v16));
      v7 = v16;

      if (v6)
        goto LABEL_2;
    }
    v14 = sub_10000EF14("SecError");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v18[0] = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "octagon-account: Can't talk with accountsd: %@", buf, 0xCu);
    }

    if (a3)
    {
      v7 = objc_retainAutorelease(v7);
      v8 = 0;
      *a3 = v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)findAccountForCurrentThread:(id)a3 optionalAltDSID:(id)a4 cloudkitContainerName:(id)a5 octagonContextID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  unsigned int v16;
  void *v17;
  const void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  unsigned int v31;
  NSObject *v32;
  void *v33;
  unsigned int v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  const void *v38;
  TPSpecificUser *v39;
  const void *v40;
  NSObject *v41;
  const void *v42;
  NSObject *v43;
  const void *v44;
  NSObject *v45;
  const void *v46;
  NSObject *v47;
  NSObject *v48;
  void *v49;
  void *v50;
  unsigned __int8 v51;
  const void *v52;
  NSObject *v53;
  const void *v54;
  NSObject *v55;
  void *v56;
  const void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  const void *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  void *v65;
  const void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  TPSpecificUser *v71;
  const void *v73;
  NSObject *v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id *v81;
  id v82;
  id v83;
  unsigned int v84;
  id v85;
  NSObject *v86;
  id obj;
  NSObject *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint8_t buf[4];
  _BYTE v94[18];
  _BYTE v95[128];

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_msgSend(v12, "currentThreadIsForPrimaryiCloudAccount");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentThreadPersonaUniqueString"));
  v18 = sub_10000EF14("octagon-account");
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v94 = v17;
    _os_log_debug_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "persona identifier: %@", buf, 0xCu);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountsActualAdapter store](self, "store"));
  if (!v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
    -[OTAccountsActualAdapter setStore:](self, "setStore:", v21);

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[OTAccountsActualAdapter fetchAccountsRetryingWithError:](self, "fetchAccountsRetryingWithError:", a7));
  obj = v22;
  if (!v22)
  {
    v38 = sub_10000EF14("SecError");
    v25 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "octagon-account: failed to find accounts", buf, 2u);
    }
    v39 = 0;
    goto LABEL_61;
  }
  v84 = v16;
  v81 = a7;
  v82 = v12;
  v85 = v15;
  v83 = v14;
  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
  if (!v23)
  {
    v25 = 0;
    v88 = 0;
    v86 = 0;
    goto LABEL_27;
  }
  v24 = v23;
  v25 = 0;
  v88 = 0;
  v86 = 0;
  v26 = *(_QWORD *)v90;
  v27 = AAAccountClassPrimary;
  do
  {
    for (i = 0; i != v24; i = (char *)i + 1)
    {
      if (*(_QWORD *)v90 != v26)
        objc_enumerationMutation(obj);
      v29 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)i);
      if (v13)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * (_QWORD)i), "aa_altDSID"));
        v31 = objc_msgSend(v13, "isEqualToString:", v30);

        if (v31)
        {
          v32 = v29;

          v88 = v32;
        }
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "personaIdentifier"));
      v34 = objc_msgSend(v17, "isEqualToString:", v33);

      if (v34)
      {
        v35 = v29;

        v25 = v35;
      }
      v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "personaIdentifier"));
      if (!v36)
      {
        if (!objc_msgSend(v29, "aa_isAccountClass:", v27))
          continue;
        v37 = v29;
        v36 = v86;
        v86 = v37;
      }

    }
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
  }
  while (v24);
LABEL_27:
  v40 = sub_10000EF14("octagon-account");
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v94 = v17;
    *(_WORD *)&v94[8] = 2112;
    *(_QWORD *)&v94[10] = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Search Criteria  - persona: %@ altDSID: %@", buf, 0x16u);
  }

  v42 = sub_10000EF14("octagon-account");
  v43 = objc_claimAutoreleasedReturnValue(v42);
  v15 = v85;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject aa_altDSID](v86, "aa_altDSID"));
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v94 = v84;
    *(_WORD *)&v94[4] = 2112;
    *(_QWORD *)&v94[6] = v76;
    _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "Primary account - persona primary: %{BOOL}d altDSID: %@", buf, 0x12u);

  }
  v44 = sub_10000EF14("octagon-account");
  v45 = objc_claimAutoreleasedReturnValue(v44);
  v14 = v83;
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject personaIdentifier](v25, "personaIdentifier"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject aa_altDSID](v25, "aa_altDSID"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v94 = v77;
    *(_WORD *)&v94[8] = 2112;
    *(_QWORD *)&v94[10] = v78;
    _os_log_debug_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEBUG, "Match by persona - persona: %@ altDSID: %@", buf, 0x16u);

  }
  v46 = sub_10000EF14("octagon-account");
  v47 = objc_claimAutoreleasedReturnValue(v46);
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
  {
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject personaIdentifier](v88, "personaIdentifier"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject aa_altDSID](v88, "aa_altDSID"));
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v94 = v79;
    *(_WORD *)&v94[8] = 2112;
    *(_QWORD *)&v94[10] = v80;
    _os_log_debug_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEBUG, "Match by altDSID - persona: %@ altDSID: %@", buf, 0x16u);

  }
  if (!v84)
  {
    if (v13)
    {
      if (!v25
        || !v88
        || (v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject personaIdentifier](v88, "personaIdentifier")),
            v50 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject personaIdentifier](v25, "personaIdentifier")),
            v51 = objc_msgSend(v49, "isEqualToString:", v50),
            v50,
            v49,
            v48 = v25,
            (v51 & 1) == 0))
      {
        v52 = sub_10000EF14("octagon-account");
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v94 = v17;
          *(_WORD *)&v94[8] = 2112;
          *(_QWORD *)&v94[10] = v13;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Search Criteria  - persona: %@ altDSID: %@", buf, 0x16u);
        }

        v54 = sub_10000EF14("octagon-account");
        v55 = objc_claimAutoreleasedReturnValue(v54);
        v12 = v82;
        if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject aa_altDSID](v86, "aa_altDSID"));
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v94 = 0;
          *(_WORD *)&v94[4] = 2112;
          *(_QWORD *)&v94[6] = v56;
          _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Primary account - persona primary: %{BOOL}d altDSID: %@", buf, 0x12u);

        }
        v57 = sub_10000EF14("octagon-account");
        v58 = objc_claimAutoreleasedReturnValue(v57);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject personaIdentifier](v25, "personaIdentifier"));
          v60 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject aa_altDSID](v25, "aa_altDSID"));
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v94 = v59;
          *(_WORD *)&v94[8] = 2112;
          *(_QWORD *)&v94[10] = v60;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "Match by persona - persona: %@ altDSID: %@", buf, 0x16u);

        }
        v61 = sub_10000EF14("octagon-account");
        v62 = objc_claimAutoreleasedReturnValue(v61);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          v63 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject personaIdentifier](v88, "personaIdentifier"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject aa_altDSID](v88, "aa_altDSID"));
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)v94 = v63;
          *(_WORD *)&v94[8] = 2112;
          *(_QWORD *)&v94[10] = v64;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Match by altDSID - persona: %@ altDSID: %@", buf, 0x16u);

        }
        if (v81)
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("AppleAccount mismatch for persona '%@' and altDSID '%@'"), v17, v13));
          *v81 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 63, v65));

        }
        v66 = sub_10000EF14("octagon-account");
        v67 = objc_claimAutoreleasedReturnValue(v66);
        v15 = v85;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "Persona/altDSID mis-match specified for query", buf, 2u);
        }
        v39 = 0;
        goto LABEL_59;
      }
      goto LABEL_58;
    }
    goto LABEL_57;
  }
  if (!v13)
  {
    v48 = v86;
    if (v86)
      goto LABEL_58;
LABEL_57:
    v48 = v25;
    if (!v25)
      goto LABEL_62;
    goto LABEL_58;
  }
  v48 = v88;
  if (v88)
  {
LABEL_58:
    v67 = v48;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject aa_altDSID](v67, "aa_altDSID"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v67, "identifier"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject personaIdentifier](v67, "personaIdentifier"));
    v71 = [TPSpecificUser alloc];
    v39 = -[TPSpecificUser initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:](v71, "initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:", v83, v85, v69, v68, -[NSObject aa_isAccountClass:](v67, "aa_isAccountClass:", AAAccountClassPrimary), v70);

    v12 = v82;
LABEL_59:

    goto LABEL_60;
  }
LABEL_62:
  v73 = sub_10000EF14("octagon-account");
  v74 = objc_claimAutoreleasedReturnValue(v73);
  v75 = v74;
  if (v17)
  {
    v12 = v82;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v94 = v17;
      _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Unable to find Apple account matching persona %@", buf, 0xCu);
    }
  }
  else
  {
    v12 = v82;
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEBUG, "Unable to find Apple account matching primary persona (nil)", buf, 2u);
    }
  }

  if (v81 && !*v81)
  {
    v67 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No AppleAccount exists matching persona '%@' and altDSID '%@'"), v17, v13));
    v39 = 0;
    *v81 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:description:](NSError, "errorWithDomain:code:description:", CFSTR("com.apple.security.octagon"), 59, v67));
    goto LABEL_59;
  }
  v39 = 0;
LABEL_60:

LABEL_61:
  return v39;
}

- (id)inflateAllTPSpecificUsers:(id)a3 octagonContextID:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  TPSpecificUser *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  TPSpecificUser *v18;
  void *v20;
  id obj;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v23 = a3;
  v22 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore defaultStore](ACAccountStore, "defaultStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v20 = v5;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "aa_appleAccounts"));
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    v10 = AAAccountClassPrimary;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v11);
        v13 = [TPSpecificUser alloc];
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "aa_altDSID"));
        v16 = objc_msgSend(v12, "aa_isAccountClass:", v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "personaIdentifier"));
        v18 = -[TPSpecificUser initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:](v13, "initWithCloudkitContainerName:octagonContextID:appleAccountID:altDSID:isPrimaryPersona:personaUniqueString:", v23, v22, v14, v15, v16, v17);

        objc_msgSend(v6, "addObject:", v18);
        v11 = (char *)v11 + 1;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v8);
  }

  return v6;
}

- (ACAccountStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
}

@end
