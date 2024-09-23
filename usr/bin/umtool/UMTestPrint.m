@implementation UMTestPrint

+ (void)println
{
  putchar(10);
}

+ (void)println:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v3, &v6);

  v5 = objc_retainAutorelease(v4);
  puts((const char *)objc_msgSend(v5, "UTF8String"));

}

+ (void)printTable:(id)a3 withColumns:(id)a4 rows:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *k;
  uint64_t v28;
  void *v29;
  int v30;
  signed int v31;
  void *v32;
  signed int v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *m;
  uint64_t v41;
  uint64_t v42;
  __CFString *v43;
  void *v44;
  unsigned int v45;
  __CFString *v46;
  id v47;
  id v48;
  uint64_t v49;
  id obj;
  id obja;
  id v52;
  id v53;
  void *v54;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  _BYTE v79[128];
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];

  v7 = a4;
  v8 = a5;
  printf("%s:\n\n", (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"));
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v7, "count")));
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_100007728;
    v77[3] = &unk_10000C2D0;
    v47 = v7;
    v10 = v7;
    v78 = v10;
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortedArrayUsingComparator:", v77));

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    obj = v10;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    v56 = v9;
    if (v11)
    {
      v12 = v11;
      v52 = *(id *)v74;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(id *)v74 != v52)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * (_QWORD)i);
          v15 = objc_msgSend(v14, "length");
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v16 = v54;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v70;
            do
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(_QWORD *)v70 != v19)
                  objc_enumerationMutation(v16);
                v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)j), "objectForKeyedSubscript:", v14));
                v22 = objc_msgSend(v21, "length");

                if (v22 > v15)
                  v15 = v22;
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
            }
            while (v18);
          }

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15));
          v9 = v56;
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v23, v14);

          printf("%-*s ", (int)v15, (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
      }
      while (v12);
    }

    putchar(10);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v53 = obj;
    v24 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v66;
      do
      {
        for (k = 0; k != v25; k = (char *)k + 1)
        {
          if (*(_QWORD *)v66 != v26)
            objc_enumerationMutation(v53);
          v28 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)k);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v28));
          v30 = objc_msgSend(v29, "intValue");

          if (v30 >= 1)
          {
            v31 = 0;
            do
            {
              putchar(45);
              ++v31;
              v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v28));
              v33 = objc_msgSend(v32, "intValue");

            }
            while (v31 < v33);
          }
          putchar(32);
        }
        v25 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
      }
      while (v25);
    }

    putchar(10);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v48 = v54;
    obja = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
    if (obja)
    {
      v49 = *(_QWORD *)v62;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v62 != v49)
            objc_enumerationMutation(v48);
          v55 = v34;
          v35 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v34);
          v57 = 0u;
          v58 = 0u;
          v59 = 0u;
          v60 = 0u;
          v36 = v53;
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
          if (v37)
          {
            v38 = v37;
            v39 = *(_QWORD *)v58;
            do
            {
              for (m = 0; m != v38; m = (char *)m + 1)
              {
                if (*(_QWORD *)v58 != v39)
                  objc_enumerationMutation(v36);
                v41 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)m);
                v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v41));
                if (v42)
                  v43 = (__CFString *)v42;
                else
                  v43 = &stru_10000C850;
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectForKeyedSubscript:", v41));
                v45 = objc_msgSend(v44, "intValue");
                v46 = objc_retainAutorelease(v43);
                printf("%-*s ", v45, (const char *)-[__CFString UTF8String](v46, "UTF8String"));

              }
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v79, 16);
            }
            while (v38);
          }

          putchar(10);
          v34 = v55 + 1;
        }
        while ((id)(v55 + 1) != obja);
        obja = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v61, v80, 16);
      }
      while (obja);
    }
    v8 = v48;

    puts("\n");
    v7 = v47;
  }
  else
  {
    puts("None\n\n");
  }

}

+ (void)_printDivider
{
  objc_msgSend(a1, "println:", CFSTR("%@"), CFSTR("--------------------------------------------------"));
}

+ (void)_printInfoForUser:(id)a3
{
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  const __CFString *v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  const __CFString *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];

  v4 = a3;
  objc_msgSend(a1, "println:", CFSTR("UID                        : %d"), objc_msgSend(v4, "uid"));
  objc_msgSend(a1, "println:", CFSTR("GID                        : %d"), objc_msgSend(v4, "gid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "alternateDSID"));
  objc_msgSend(a1, "println:", CFSTR("Alternate DSID             : %@"), v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "homeDirectoryURL"));
  objc_msgSend(a1, "println:", CFSTR("Home Directory URL         : %@"), v6);

  objc_msgSend(a1, "println");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
  objc_msgSend(a1, "println:", CFSTR("Username                   : %@"), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "givenName"));
  objc_msgSend(a1, "println:", CFSTR("Given Name                 : %@"), v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "familyName"));
  objc_msgSend(a1, "println:", CFSTR("Family Name                : %@"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
  objc_msgSend(a1, "println:", CFSTR("Display Name               : %@"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "photoURL"));
  objc_msgSend(a1, "println:", CFSTR("Photo URL                  : %@"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userAuxiliaryString"));
  objc_msgSend(a1, "println:", CFSTR("User AuxString             : %@"), v12);

  objc_msgSend(a1, "println");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "creationDate"));
  objc_msgSend(a1, "println:", CFSTR("Creation Date              : %@"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastLoginDate"));
  objc_msgSend(a1, "println:", CFSTR("Last Login Date            : %@"), v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastRemoteAuthDate"));
  objc_msgSend(a1, "println:", CFSTR("Last Remote Auth Date      : %@"), v15);

  objc_msgSend(a1, "println");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstLoginStartDate"));
  objc_msgSend(a1, "println:", CFSTR("FirstLogin Start Date       : %@"), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstLoginEndDate"));
  objc_msgSend(a1, "println:", CFSTR("FirstLogin End Date         : %@"), v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastCachedLoginStartDate"));
  objc_msgSend(a1, "println:", CFSTR("CachedLogin Start Date      : %@"), v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastCachedLoginEndDate"));
  objc_msgSend(a1, "println:", CFSTR("CachedLogin End Date        : %@"), v19);

  objc_msgSend(a1, "println");
  v20 = objc_msgSend(v4, "userType");
  v21 = CFSTR("Permanent");
  if (v20)
    v21 = 0;
  if (v20 == (id)1)
    v21 = CFSTR("Ephemeral");
  objc_msgSend(a1, "println:", CFSTR("User Type                  : %@"), v21);
  v22 = objc_msgSend(v4, "passcodeType");
  v23 = 0;
  if ((unint64_t)v22 <= 3)
    v23 = (uint64_t)*(&off_10000C2F0 + (_QWORD)v22);
  objc_msgSend(a1, "println:", CFSTR("Passcode Type              : %@"), v23);
  objc_msgSend(a1, "println");
  if (objc_msgSend(v4, "isLoginUser"))
    v24 = CFSTR("true");
  else
    v24 = CFSTR("false");
  objc_msgSend(a1, "println:", CFSTR("Is Login User              : %@"), v24);
  if (objc_msgSend(v4, "isAuditor"))
    v25 = CFSTR("true");
  else
    v25 = CFSTR("false");
  objc_msgSend(a1, "println:", CFSTR("Is Auditor                 : %@"), v25);
  if (objc_msgSend(v4, "isDisabled"))
    v26 = CFSTR("true");
  else
    v26 = CFSTR("false");
  objc_msgSend(a1, "println:", CFSTR("Is Disabled                : %@"), v26);
  if (objc_msgSend(v4, "isTransientUser"))
    v27 = CFSTR("true");
  else
    v27 = CFSTR("false");
  objc_msgSend(a1, "println:", CFSTR("Is TransientUser           : %@"), v27);
  if (objc_msgSend(v4, "isPrimaryUser"))
    v28 = CFSTR("true");
  else
    v28 = CFSTR("false");
  objc_msgSend(a1, "println:", CFSTR("Is PrimaryUser              : %@"), v28);
  if (objc_msgSend(v4, "isAdminUser"))
    v29 = CFSTR("true");
  else
    v29 = CFSTR("false");
  objc_msgSend(a1, "println:", CFSTR("Is AdminUser               : %@"), v29);
  objc_msgSend(a1, "println");
  objc_msgSend(a1, "println:", CFSTR("Passcode Lock Grace Period : %lu"), objc_msgSend(v4, "passcodeLockGracePeriod"));
  v31 = (void *)objc_opt_new(NSMutableString, v30);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "languages"));
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v44;
    v36 = &stru_10000C850;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v44 != v35)
          objc_enumerationMutation(v32);
        objc_msgSend(v31, "appendFormat:", CFSTR("%@%@"), v36, *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v37));
        v37 = (char *)v37 + 1;
        v36 = CFSTR(", ");
      }
      while (v34 != v37);
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      v36 = CFSTR(", ");
    }
    while (v34);
  }

  objc_msgSend(a1, "println:", CFSTR("Languages                  : [%@]"), v31);
  objc_msgSend(a1, "println");
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_dataSizeStringFromBytes:", objc_msgSend(v4, "dataQuota")));
  objc_msgSend(a1, "println:", CFSTR("Data Quota                 : %@"), v38);

  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_dataSizeStringFromBytes:", objc_msgSend(v4, "dataUsed")));
  objc_msgSend(a1, "println:", CFSTR("Data Used                  : %@"), v39);

  objc_msgSend(a1, "println");
  v40 = objc_msgSend(v4, "hasDataToSync");
  v41 = CFSTR("false");
  if (v40)
    v41 = CFSTR("true");
  objc_msgSend(a1, "println:", CFSTR("Has Data to Sync           : %@"), v41);
  objc_msgSend(a1, "println");
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "debugErrorCausingLogout"));
  objc_msgSend(a1, "println:", CFSTR("Error Causing Logout       : %@"), v42);

}

+ (BOOL)printInfoForUser:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v11;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v11 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    v9 = objc_msgSend(a1, "printInfoForUsers:outError:", v8, a4);

  }
  else
  {
    v9 = objc_msgSend(a1, "printInfoForUsers:outError:", &__NSArray0__struct, a4);
  }

  return v9;
}

+ (BOOL)printInfoForUsers:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(a1, "_printDivider", (_QWORD)v16);
          objc_msgSend(a1, "println");
          objc_msgSend(a1, "_printInfoForUser:", v13);
          objc_msgSend(a1, "println");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    objc_msgSend(a1, "_printDivider");
    v14 = 1;
  }
  else
  {
    v14 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[UMTestError errorWithMessage:](UMTestError, "errorWithMessage:", CFSTR("Nothing to print")));
  }

  return v14;
}

+ (BOOL)printInfoForUMLUser:(id)a3 outError:(id *)a4
{
  id v5;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;

  v5 = a3;
  +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("UID                        : %d"), objc_msgSend(v5, "uid"));
  +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("GID                        : %d"), objc_msgSend(v5, "gid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userUUID"));
  +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("User UUID                  : %@"), v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alternateDSID"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alternateDSID"));
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Alternate DSID                 : %@"), v8);

  }
  +[UMTestPrint println](UMTestPrint, "println");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "userType"));
  +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("UserType                   : %@"), v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "username"));
  +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Username                   : %@"), v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstName"));
  +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("First Name                 : %@"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastName"));
  +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Last Name                  : %@"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "displayName"));
  +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Display Name               : %@"), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileInfoPath"));
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fileInfoPath"));
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("FileInfo Path               : %@"), v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "libInfoPath"));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "libInfoPath"));
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Libinfo Path               : %@"), v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homeDirPath"));

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "homeDirPath"));
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("HomeDir Path               : %@"), v19);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "diskNode"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "diskNode"));
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Disk Node               : %@"), v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "volumeUUID"));
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Disk Vol UUID               : %@"), v22);

  }
  objc_msgSend(a1, "println");
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "creationDate"));
  +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Creation Date              : %@"), v23);

  +[UMTestPrint println](UMTestPrint, "println");
  if (objc_msgSend(v5, "isLoginUser"))
    v24 = CFSTR("true");
  else
    v24 = CFSTR("false");
  objc_msgSend(a1, "println:", CFSTR("Is Login User              : %@"), v24);
  if (objc_msgSend(v5, "isAuditor"))
    v25 = CFSTR("true");
  else
    v25 = CFSTR("false");
  objc_msgSend(a1, "println:", CFSTR("Is Auditor                 : %@"), v25);
  if (objc_msgSend(v5, "isPrimaryUser"))
    v26 = CFSTR("true");
  else
    v26 = CFSTR("false");
  objc_msgSend(a1, "println:", CFSTR("Is PrimaryUser             : %@"), v26);
  if (objc_msgSend(v5, "isAdminUser"))
    v27 = CFSTR("true");
  else
    v27 = CFSTR("false");
  objc_msgSend(a1, "println:", CFSTR("Is AdminUser               : %@"), v27);
  objc_msgSend(a1, "println");
  if (objc_msgSend(v5, "gracePeriod"))
    objc_msgSend(a1, "println:", CFSTR("Passcode Lock Grace Period : %lu"), (int)objc_msgSend(v5, "gracePeriod"));

  return 1;
}

+ (BOOL)printPersonaInfo:(id)a3 outError:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  const __CFString *v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userPersonaUniqueString"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userPersonaUniqueString"));
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Persona identifier: %@"), v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userPersonaNickName"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userPersonaNickName"));
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Persona NickName: %@"), v8);

  }
  v9 = objc_msgSend(v4, "userPersonaType");
  v10 = CFSTR("Persona Type: Personal");
  switch((unint64_t)v9)
  {
    case 0uLL:
      goto LABEL_14;
    case 1uLL:
      v10 = CFSTR("Persona Type: Managed");
      goto LABEL_14;
    case 2uLL:
      v10 = CFSTR("Persona Type: Enterprise");
      goto LABEL_14;
    case 3uLL:
      v10 = CFSTR("Persona Type: System");
      goto LABEL_14;
    case 4uLL:
      v10 = CFSTR("Persona Type: Universal");
      goto LABEL_14;
    case 5uLL:
      v10 = CFSTR("Persona Type: Default");
      goto LABEL_14;
    case 6uLL:
      v10 = CFSTR("Persona Type: Guest");
      goto LABEL_14;
    default:
      if (v9 != (id)1000)
        goto LABEL_15;
      v10 = CFSTR("Persona Type: Invalid");
LABEL_14:
      +[UMTestPrint println:](UMTestPrint, "println:", v10);
LABEL_15:

      return 1;
  }
}

+ (BOOL)printPersonaAttributesInfo:(id)a3 outError:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("************************************************************"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userPersonaUniqueString"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userPersonaUniqueString"));
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Persona identifier: %@"), v6);

  }
  else
  {
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Persona identifier: NONE"));
  }
  v7 = objc_msgSend(v4, "userPersonaType");
  v8 = CFSTR("Persona Type: Personal");
  switch((unint64_t)v7)
  {
    case 0uLL:
      goto LABEL_12;
    case 1uLL:
      v8 = CFSTR("Persona Type: Managed");
      goto LABEL_12;
    case 2uLL:
      v8 = CFSTR("Persona Type: Enterprise");
      goto LABEL_12;
    case 3uLL:
      v8 = CFSTR("Persona Type: System");
      goto LABEL_12;
    case 4uLL:
      v8 = CFSTR("Persona Type: Universal");
      goto LABEL_12;
    case 5uLL:
      v8 = CFSTR("Persona Type: Default");
      goto LABEL_12;
    default:
      if (v7 != (id)1000)
        goto LABEL_13;
      v8 = CFSTR("Persona Type: Invalid");
LABEL_12:
      +[UMTestPrint println:](UMTestPrint, "println:", v8);
LABEL_13:
      if (objc_msgSend(v4, "userPersona_id"))
        +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Kernel Persona ID is: %d"), objc_msgSend(v4, "userPersona_id"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personaLayoutPathURL"));

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personaLayoutPathURL"));
        +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Persona Volume Path is: %@"), v10);

      }
      if (objc_msgSend(v4, "isEnterprisePersona"))
        +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("isEnterprisePersona:true"));
      if (objc_msgSend(v4, "isDataSeparatedPersona"))
        +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("isDataSeparatedPersona:true"));
      if (objc_msgSend(v4, "isPersonalPersona"))
        +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("isPersonalPersona:true"));
      if (objc_msgSend(v4, "isUniversalPersona"))
        +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("isUniversalPersona:true"));
      if (objc_msgSend(v4, "isSystemPersona"))
        +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("isSystemPersona:true"));
      if (objc_msgSend(v4, "isDefaultPersona"))
        +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("isDefaultPersona:true"));
      if (objc_msgSend(v4, "isDisabled"))
        +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("isDisabled:true"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userPersonaDisplayName"));

      if (v11)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userPersonaDisplayName"));
        +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Persona Display String: %@"), v12);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userPersonaBundleIDList"));

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userPersonaBundleIDList"));
        +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Persona Associated BundleIDs are: %@"), v14);

      }
      +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("************************************************************"));

      return 1;
  }
}

+ (void)_printSyncBubbleInfoForUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v4 = a3;
  objc_msgSend(a1, "println:", CFSTR("UID           : %d"), objc_msgSend(v4, "uid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "username"));
  objc_msgSend(a1, "println:", CFSTR("Username      : %@"), v5);

  objc_msgSend(a1, "println");
  objc_msgSend(a1, "println:", CFSTR("Mach Services :"));
  objc_msgSend(a1, "println");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UMMobileKeyBag syncBubbleMachServiceNamesForUser:](UMMobileKeyBag, "syncBubbleMachServiceNamesForUser:", v4));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "println:", CFSTR("\t%@"), *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

+ (BOOL)printSyncBubbleInfoForUser:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v11;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v11 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
    v9 = objc_msgSend(a1, "printSyncBubbleInfoForUsers:outError:", v8, a4);

  }
  else
  {
    v9 = objc_msgSend(a1, "printSyncBubbleInfoForUsers:outError:", &__NSArray0__struct, a4);
  }

  return v9;
}

+ (BOOL)printSyncBubbleInfoForUsers:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  uint64_t v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          objc_msgSend(a1, "_printDivider", (_QWORD)v16);
          objc_msgSend(a1, "println");
          objc_msgSend(a1, "_printSyncBubbleInfoForUser:", v13);
          objc_msgSend(a1, "println");
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    objc_msgSend(a1, "_printDivider");
    v14 = 1;
  }
  else
  {
    v14 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[UMTestError errorWithMessage:](UMTestError, "errorWithMessage:", CFSTR("Nothing to print")));
  }

  return v14;
}

+ (id)_dataSizeStringFromBytes:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  BOOL v7;
  const __CFString *v8;

  v5 = (double)a3;
  v6 = (double)a3 * 0.0009765625;
  if (v6 <= 1.0)
  {
    v8 = CFSTR("bytes");
  }
  else
  {
    v5 = v6 * 0.0009765625;
    if (v6 * 0.0009765625 <= 1.0)
    {
      v8 = CFSTR("KB");
      v5 = (double)a3 * 0.0009765625;
    }
    else
    {
      v7 = v5 * 0.0009765625 <= 1.0;
      if (v5 * 0.0009765625 > 1.0)
        v5 = v5 * 0.0009765625;
      v8 = CFSTR("MB");
      if (!v7)
        v8 = CFSTR("GB");
    }
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f %@"), *(_QWORD *)&v5, v8, v3, v4);
}

@end
