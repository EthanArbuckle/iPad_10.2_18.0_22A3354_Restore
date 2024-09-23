@implementation UMTestSysdiagnose

+ (id)name
{
  return CFSTR("sysdiagnose");
}

+ (id)description
{
  return CFSTR("Dump sysdiagnose information");
}

+ (id)examples
{
  return &off_10000D830;
}

+ (BOOL)executeWithOutError:(id *)a3
{
  mach_port_t v3;
  uint64_t multiuser_config_flags;
  const char *v5;
  const char *v6;
  void *v7;
  void *v8;
  __CFString *i;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  dispatch_semaphore_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  const __CFString *v43;
  void *v44;
  uint64_t v45;
  unsigned int *v46;
  unint64_t v47;
  void *v48;
  id v49;
  void *k;
  void *v51;
  __CFString *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  dispatch_semaphore_t dsema;
  id v61;
  id obj;
  __CFString *v63;
  uint64_t v64;
  void *v65;
  __CFString *v66;
  __CFString *v67;
  __CFString *v68;
  __CFString *v70;
  __CFString *v71;
  id v72;
  __CFString *v73;
  __CFString *v74;
  void *v75;
  __CFString *v76;
  void *j;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[4];
  dispatch_semaphore_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t (*v93)(uint64_t, uint64_t);
  void (*v94)(uint64_t);
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint32_t multiuser_flags;
  _QWORD v101[128];
  _QWORD v102[4];
  _QWORD v103[4];
  int v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[256];
  uint64_t v111;
  _BYTE v112[128];
  _QWORD v113[7];
  _QWORD v114[7];
  _BYTE v115[128];
  _QWORD v116[7];
  _QWORD v117[7];
  _BYTE v118[128];

  multiuser_flags = 0;
  v3 = mach_host_self();
  multiuser_config_flags = host_get_multiuser_config_flags(v3, &multiuser_flags);
  if ((_DWORD)multiuser_config_flags)
  {
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Failed to get host config: %d\n"), multiuser_config_flags);
  }
  else
  {
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Host Config: 0x%08x"), multiuser_flags);
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Foreground UID: %u"), multiuser_flags & 0x3FFFFFFF);
    if ((multiuser_flags & 0x80000000) != 0)
      v5 = "Y";
    else
      v5 = "N";
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Shared iPad: %s"), v5);
    if ((multiuser_flags & 0x40000000) != 0)
      v6 = "Y";
    else
      v6 = "N";
    +[UMTestPrint println:](UMTestPrint, "println:", CFSTR("Secondary Users: %s"), v6);
    +[UMTestPrint println:](UMTestPrint, "println:", &stru_10000C850);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allUsersUnfiltered"));

  v70 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = v8;
  v71 = (__CFString *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v118, 16);
  if (v71)
  {
    v68 = *(__CFString **)v97;
    do
    {
      for (i = 0; i != v71; i = (__CFString *)((char *)i + 1))
      {
        if (*(__CFString **)v97 != v68)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * (_QWORD)i);
        v116[0] = CFSTR("UID");
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), objc_msgSend(v10, "uid")));
        v117[0] = v11;
        v116[1] = CFSTR("UUID");
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "alternateDSID"));
        if (v12)
        {
          v76 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "alternateDSID"));
          v13 = v76;
        }
        else
        {
          v13 = &stru_10000C850;
        }
        v117[1] = v13;
        v116[2] = CFSTR("GID");
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), objc_msgSend(v10, "gid")));
        v117[2] = v14;
        v116[3] = CFSTR("Type");
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "stringForUserType:", objc_msgSend(v10, "userType")));
        v117[3] = v15;
        v117[4] = CFSTR("(private)");
        v116[4] = CFSTR("Username");
        v116[5] = CFSTR("Display Name");
        v117[5] = CFSTR("(private)");
        v116[6] = CFSTR("Home Directory");
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "homeDirectoryURL"));
        if (v16)
        {
          v74 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "homeDirectoryURL"));
          v73 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString path](v74, "path"));
          v17 = v73;
        }
        else
        {
          v17 = &stru_10000C850;
        }
        v117[6] = v17;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v117, v116, 7));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v18));

        if (v16)
        {

        }
        if (v12)

        -[__CFString addObject:](v70, "addObject:", v19);
        if (os_variant_has_internal_diagnostics("com.apple.umtest"))
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "username"));
          if (v20)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "username"));
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v21, CFSTR("Username"));

          }
          else
          {
            objc_msgSend(v19, "setObject:forKeyedSubscript:", &stru_10000C850, CFSTR("Username"));
          }

          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayName"));
          if (v22)
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayName"));
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v23, CFSTR("Display Name"));

          }
          else
          {
            objc_msgSend(v19, "setObject:forKeyedSubscript:", &stru_10000C850, CFSTR("Display Name"));
          }

        }
      }
      v71 = (__CFString *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v118, 16);
    }
    while (v71);
  }

  +[UMTestPrint printTable:withColumns:rows:](UMTestPrint, "printTable:withColumns:rows:", CFSTR("Users"), &off_10000D848, v70);
  v90 = 0;
  v91 = &v90;
  v92 = 0x3032000000;
  v93 = sub_100006FB4;
  v94 = sub_100006FC4;
  v95 = 0;
  v24 = dispatch_semaphore_create(0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UMUserManager sharedManager](UMUserManager, "sharedManager"));
  v87[0] = _NSConcreteStackBlock;
  v87[1] = 3221225472;
  v87[2] = sub_100006FCC;
  v87[3] = &unk_10000C2A8;
  v89 = &v90;
  dsema = v24;
  v88 = dsema;
  objc_msgSend(v25, "fetchAllPersonasForAllUsersWithCompletionHandler:", v87);

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v61 = (id)v91[5];
  v26 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v83, v115, 16);
  if (v26)
  {
    v64 = *(_QWORD *)v84;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(_QWORD *)v84 != v64)
          objc_enumerationMutation(v61);
        v27 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)j);
        v113[0] = CFSTR("User UUID");
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("UserPersonaUserODUUID")));
        if (v28)
        {
          v74 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("UserPersonaUserODUUID")));
          v29 = v74;
        }
        else
        {
          v29 = &stru_10000C850;
        }
        v114[0] = v29;
        v113[1] = CFSTR("Type");
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("UserPersonaType")));
        if (v30)
        {
          v73 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("UserPersonaType")));
          v71 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v73));
          v31 = v71;
        }
        else
        {
          v31 = &stru_10000C850;
        }
        v114[1] = v31;
        v113[2] = CFSTR("UUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("UserPersonaUniqueString")));
        if (v32)
        {
          v70 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("UserPersonaUniqueString")));
          v33 = v70;
        }
        else
        {
          v33 = &stru_10000C850;
        }
        v114[2] = v33;
        v113[3] = CFSTR("ID");
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("UserPersonaID")));
        if (v34)
        {
          a1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("UserPersonaID")));
          v68 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), a1));
          v35 = v68;
        }
        else
        {
          v35 = &stru_10000C850;
        }
        v114[3] = v35;
        v114[4] = CFSTR("(private)");
        v113[4] = CFSTR("Nickname");
        v113[5] = CFSTR("Volume UUID");
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("MKBUserSessionVolumeUUID")));
        if (v36)
        {
          v67 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("MKBUserSessionVolumeUUID")));
          v37 = v67;
        }
        else
        {
          v37 = &stru_10000C850;
        }
        v114[5] = v37;
        v113[6] = CFSTR("Home Dir");
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("MKBUserSessionHomeDir")));
        if (v38)
        {
          v66 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("MKBUserSessionHomeDir")));
          v39 = v66;
        }
        else
        {
          v39 = &stru_10000C850;
        }
        v114[6] = v39;
        v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v114, v113, 7));
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v40));

        if (v38)
        if (v36)

        if (v34)
        {

        }
        if (v32)

        if (v30)
        {

        }
        if (v28)

        objc_msgSend(v65, "addObject:", v41);
        if (os_variant_has_internal_diagnostics("com.apple.umtest"))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("UserPersonaNickName")));
          if (v42)
          {
            v63 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("UserPersonaNickName")));
            v43 = v63;
          }
          else
          {
            v43 = &stru_10000C850;
          }
          objc_msgSend(v41, "setObject:forKeyedSubscript:", v43, CFSTR("Nickname"));
          if (v42)

        }
      }
      v26 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v83, v115, 16);
    }
    while (v26);
  }

  +[UMTestPrint printTable:withColumns:rows:](UMTestPrint, "printTable:withColumns:rows:", CFSTR("Personas"), &off_10000D860, v65);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v45 = 1;
  do
  {
    v101[0] = 0;
    if ((kpersona_find_by_type(v45, 0, v101) & 0x80000000) == 0)
    {
      v46 = (unsigned int *)malloc_type_malloc(4 * v101[0], 0x100004052888210uLL);
      if ((kpersona_find_by_type(v45, v46, v101) & 0x80000000) == 0 && v101[0])
      {
        v47 = 0;
        do
        {
          v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v46[v47]));
          objc_msgSend(v44, "addObject:", v48);

          ++v47;
        }
        while (v101[0] > v47);
      }
      free(v46);
    }
    v45 = (v45 + 1);
  }
  while ((_DWORD)v45 != 8);
  v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v72 = v44;
  v49 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v79, v112, 16);
  if (v49)
  {
    v78 = *(_QWORD *)v80;
    do
    {
      for (k = 0; k != v49; k = (char *)k + 1)
      {
        if (*(_QWORD *)v80 != v78)
          objc_enumerationMutation(v72);
        v51 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * (_QWORD)k);
        v111 = 0;
        memset(v110, 0, sizeof(v110));
        v108 = 0u;
        v109 = 0u;
        v106 = 0u;
        v107 = 0u;
        v105 = 0u;
        v104 = 2;
        if ((kpersona_info(objc_msgSend(v51, "unsignedIntValue"), &v104) & 0x80000000) == 0)
        {
          if (HIDWORD(v111) == -101)
          {
            v52 = CFSTR("-101");
          }
          else if (HIDWORD(v111) == -1)
          {
            v52 = CFSTR("-1");
          }
          else
          {
            v52 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), HIDWORD(v111)));
          }
          v103[0] = v52;
          v102[0] = CFSTR("UID");
          v102[1] = CFSTR("ID");
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), v105));
          v103[1] = v53;
          v102[2] = CFSTR("Type");
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), DWORD1(v105)));
          v103[2] = v54;
          v102[3] = CFSTR("Name");
          v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", &v110[4]));
          v103[3] = v55;
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v103, v102, 4));
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v56));

          objc_msgSend(v75, "addObject:", v57);
          bzero(v101, 0x400uLL);
          if (!kpersona_getpath(objc_msgSend(v51, "unsignedIntValue"), v101))
          {
            v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v101));
            objc_msgSend(v57, "setObject:forKeyedSubscript:", v58, CFSTR("Path"));

          }
        }
      }
      v49 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v79, v112, 16);
    }
    while (v49);
  }

  +[UMTestPrint printTable:withColumns:rows:](UMTestPrint, "printTable:withColumns:rows:", CFSTR("Kernel Personas"), &off_10000D878, v75);
  _Block_object_dispose(&v90, 8);

  return 1;
}

+ (id)stringForUserType:(unint64_t)a3
{
  if (a3 == 1)
    return CFSTR("E");
  else
    return CFSTR("P");
}

@end
