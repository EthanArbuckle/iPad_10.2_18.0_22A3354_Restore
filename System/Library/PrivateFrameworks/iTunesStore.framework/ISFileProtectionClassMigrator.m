@implementation ISFileProtectionClassMigrator

+ (BOOL)isMigrationNeeded
{
  return CFPreferencesGetAppBooleanValue(CFSTR("NeedsFileProtectionClassMigration"), CFSTR("com.apple.itunesstored"), 0) != 0;
}

+ (void)setMigrationNeededIfNotSet:(BOOL)a3
{
  _BOOL8 v3;
  Boolean keyExistsAndHasValidFormat;

  v3 = a3;
  keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(CFSTR("NeedsFileProtectionClassMigration"), CFSTR("com.apple.itunesstored"), &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat)
    CFPreferencesSetAppValue(CFSTR("NeedsFileProtectionClassMigration"), (CFPropertyListRef)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3), CFSTR("com.apple.itunesstored"));
}

+ (BOOL)migrate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  id v28;
  void *v29;
  int v30;
  int v31;
  NSObject *v32;
  void *v33;
  int v34;
  void *v35;
  id v36;
  int v37;
  int v38;
  NSObject *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  BOOL v48;
  id v49;
  int v50;
  int v51;
  NSObject *v52;
  void *v53;
  int v54;
  int v55;
  void *v56;
  int *v58;
  int *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  id v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  uint64_t *v79;
  void *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  char v92;
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;
  _BYTE v96[128];
  int v97;
  id v98;
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB1E98], "sharedStoreServicesConfig");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  CPSharedResourcesDirectory();
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = 0;
  v90 = &v89;
  v91 = 0x2020000000;
  v92 = 1;
  if (!v65)
  {
    v49 = v67;
    if (!v49)
    {
      objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v49 = (id)objc_claimAutoreleasedReturnValue();
    }
    v50 = objc_msgSend(v49, "shouldLog");
    v51 = objc_msgSend(v49, "shouldLogToDisk");
    objc_msgSend(v49, "OSLogObject");
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v51)
      v54 = v50 | 2;
    else
      v54 = v50;
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
      v55 = v54;
    else
      v55 = v54 & 2;
    if (v55)
    {
      LOWORD(v97) = 0;
      LODWORD(v60) = 2;
      v56 = (void *)_os_log_send_and_compose_impl();

      if (!v56)
      {
LABEL_86:

        v48 = 0;
        *((_BYTE *)v90 + 24) = 0;
        goto LABEL_88;
      }
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v56, 4, &v97, v60);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      free(v56);
      SSFileLog();
    }

    goto LABEL_86;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v2 = objc_msgSend(&unk_24C4532B8, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
  if (!v2)
    goto LABEL_23;
  v3 = *(_QWORD *)v86;
  do
  {
    for (i = 0; i != v2; ++i)
    {
      if (*(_QWORD *)v86 != v3)
        objc_enumerationMutation(&unk_24C4532B8);
      objc_msgSend(v65, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i), v58, v60);
      v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      if ((_set_path_class((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0) & 0xFFFFFFFD) != 0)
      {
        v6 = v67;
        if (!v67)
        {
          objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
          v6 = (id)objc_claimAutoreleasedReturnValue();
        }
        v7 = v6;
        v8 = objc_msgSend(v6, "shouldLog");
        v9 = objc_msgSend(v7, "shouldLogToDisk");
        objc_msgSend(v7, "OSLogObject");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v9)
          v12 = v8 | 2;
        else
          v12 = v8;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          v13 = v12;
        else
          v13 = v12 & 2;
        if (v13)
        {
          v97 = 138543362;
          v98 = v5;
          LODWORD(v60) = 12;
          v58 = &v97;
          v14 = (void *)_os_log_send_and_compose_impl();

          if (v14)
          {
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v97, v60);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            free(v14);
            v58 = (int *)v11;
            SSFileLog();
            goto LABEL_19;
          }
        }
        else
        {
LABEL_19:

        }
        *((_BYTE *)v90 + 24) = 0;
      }

    }
    v2 = objc_msgSend(&unk_24C4532B8, "countByEnumeratingWithState:objects:count:", &v85, v99, 16);
  }
  while (v2);
LABEL_23:
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v15 = objc_msgSend(&unk_24C4532D0, "countByEnumeratingWithState:objects:count:", &v81, v96, 16, v58);
  if (!v15)
    goto LABEL_65;
  v61 = *(_QWORD *)v82;
  v16 = *MEMORY[0x24BDBCC60];
  while (2)
  {
    v17 = 0;
    v63 = v15;
    while (2)
    {
      if (*(_QWORD *)v82 != v61)
        objc_enumerationMutation(&unk_24C4532D0);
      objc_msgSend(v65, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v17), v59);
      v18 = objc_claimAutoreleasedReturnValue();
      v80 = 0;
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v18, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v95 = v16;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v95, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = MEMORY[0x24BDAC760];
      v77[1] = 3221225472;
      v77[2] = __40__ISFileProtectionClassMigrator_migrate__block_invoke;
      v77[3] = &unk_24C43C278;
      v21 = v67;
      v78 = v21;
      v79 = &v89;
      objc_msgSend(v62, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v19, v20, 0, v77);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = (void *)v18;
      v64 = v17;

      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v74;
        do
        {
          for (j = 0; j != v24; ++j)
          {
            if (*(_QWORD *)v74 != v25)
              objc_enumerationMutation(v23);
            v27 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * j);
            v72 = 0;
            if (!objc_msgSend(v27, "getResourceValue:forKey:error:", &v72, v16, &v80, v59, v60))
            {
              v36 = v21;
              if (!v67)
              {
                objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
                v36 = (id)objc_claimAutoreleasedReturnValue();
              }
              v29 = v36;
              v37 = objc_msgSend(v36, "shouldLog");
              v38 = objc_msgSend(v29, "shouldLogToDisk");
              objc_msgSend(v29, "OSLogObject");
              v39 = objc_claimAutoreleasedReturnValue();
              v40 = v39;
              if (v38)
                v37 |= 2u;
              if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
                v41 = v37;
              else
                v41 = v37 & 2;
              if (v41)
              {
                v97 = 138543362;
                v98 = v80;
                LODWORD(v60) = 12;
                v59 = &v97;
                v42 = (void *)_os_log_send_and_compose_impl();

                if (v42)
                {
                  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v42, 4, &v97, v60);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  free(v42);
                  v59 = (int *)v40;
                  SSFileLog();
                  goto LABEL_58;
                }
              }
              else
              {
LABEL_58:

              }
LABEL_59:

              *((_BYTE *)v90 + 24) = 0;
              continue;
            }
            if (objc_msgSend(v72, "BOOLValue"))
            {
              if ((_set_path_class((const char *)objc_msgSend(objc_retainAutorelease(v27), "fileSystemRepresentation"), 0) & 0xFFFFFFFD) == 0)continue;
              v28 = v21;
              if (!v67)
              {
                objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
                v28 = (id)objc_claimAutoreleasedReturnValue();
              }
              v29 = v28;
              v30 = objc_msgSend(v28, "shouldLog");
              v31 = objc_msgSend(v29, "shouldLogToDisk");
              objc_msgSend(v29, "OSLogObject");
              v32 = objc_claimAutoreleasedReturnValue();
              v33 = v32;
              if (v31)
                v30 |= 2u;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
                v34 = v30;
              else
                v34 = v30 & 2;
              if (v34)
              {
                v97 = 138543362;
                v98 = v66;
                LODWORD(v60) = 12;
                v59 = &v97;
                v35 = (void *)_os_log_send_and_compose_impl();

                if (!v35)
                  goto LABEL_59;
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v35, 4, &v97, v60);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                free(v35);
                v59 = (int *)v33;
                SSFileLog();
              }

              goto LABEL_59;
            }
            objc_msgSend(v27, "path");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            setFileClassC(v43, v21, (_BYTE *)v90 + 24);

          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v73, v94, 16);
        }
        while (v24);
      }

      v17 = v64 + 1;
      if (v64 + 1 != v63)
        continue;
      break;
    }
    v15 = objc_msgSend(&unk_24C4532D0, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
    if (v15)
      continue;
    break;
  }
LABEL_65:
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v44 = objc_msgSend(&unk_24C4532E8, "countByEnumeratingWithState:objects:count:", &v68, v93, 16, v59);
  if (v44)
  {
    v45 = *(_QWORD *)v69;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v69 != v45)
          objc_enumerationMutation(&unk_24C4532E8);
        objc_msgSend(v65, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * k));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        setFileClassC(v47, v67, (_BYTE *)v90 + 24);

      }
      v44 = objc_msgSend(&unk_24C4532E8, "countByEnumeratingWithState:objects:count:", &v68, v93, 16);
    }
    while (v44);
  }

  if (*((_BYTE *)v90 + 24))
  {
    CFPreferencesSetAppValue(CFSTR("NeedsFileProtectionClassMigration"), (CFPropertyListRef)*MEMORY[0x24BDBD270], CFSTR("com.apple.itunesstored"));
    v48 = *((_BYTE *)v90 + 24) != 0;
  }
  else
  {
    v48 = 0;
  }
LABEL_88:
  _Block_object_dispose(&v89, 8);

  return v48;
}

uint64_t __40__ISFileProtectionClassMigrator_migrate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  int v8;
  int v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  objc_msgSend(v7, "OSLogObject");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    v11 = v9;
  else
    v11 = v9 & 2;
  if (!v11)
    goto LABEL_12;
  v17 = 138543362;
  v18 = v6;
  LODWORD(v16) = 12;
  v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v17, v16);
    v10 = objc_claimAutoreleasedReturnValue();
    free(v12);
    SSFileLog();
LABEL_12:

  }
  if (objc_msgSend(v6, "code") != 260
    || (objc_msgSend(v6, "domain"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x24BDD0B88]),
        v13,
        (v14 & 1) == 0))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

  return 1;
}

@end
