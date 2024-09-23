@implementation MISafeHarborManager

+ (id)defaultManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045288;
  block[3] = &unk_100084C08;
  block[4] = a1;
  if (qword_10009DFF8 != -1)
    dispatch_once(&qword_10009DFF8, block);
  return (id)qword_10009DFF0;
}

- (BOOL)registerSafeHarborAtURL:(id)a3 withOptions:(id)a4 forIdentifier:(id)a5 forPersona:(id)a6 ofType:(unint64_t)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  unsigned int v19;
  id v20;
  BOOL v21;
  id v23;
  id v24;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v17 = a6;
  if (a7 > 7 || ((1 << a7) & 0x94) == 0)
  {
    v23 = sub_100010E50((uint64_t)"-[MISafeHarborManager registerSafeHarborAtURL:withOptions:forIdentifier:forPersona:ofType:error:]", 257, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Safe harbors are not supported for container type %ld"), v16, a7);
    v20 = (id)objc_claimAutoreleasedReturnValue(v23);
    if (!a8)
      goto LABEL_10;
    goto LABEL_9;
  }
  sub_10004E780(v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[MIHelperServiceClient sharedInstance](MIHelperServiceClient, "sharedInstance"));
  v24 = 0;
  v19 = objc_msgSend(v18, "createSafeHarborWithIdentifier:forPersona:containerType:andMigrateDataFrom:withError:", v15, v17, a7, v13, &v24);
  v20 = v24;

  if (v19)
  {

    v21 = 1;
LABEL_12:
    sub_10004E89C(v15);
    goto LABEL_13;
  }
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MISafeHarborManager registerSafeHarborAtURL:withOptions:forIdentifier:forPersona:ofType:error:]", CFSTR("Failure from helper service when trying to create and migrate safe harbor content: %@"));
  if (a8)
LABEL_9:
    *a8 = objc_retainAutorelease(v20);
LABEL_10:

  v21 = 0;
  if (a7 <= 7 && ((1 << a7) & 0x94) != 0)
    goto LABEL_12;
LABEL_13:

  return v21;
}

- (BOOL)removeSafeHarborWithIdentifier:(id)a3 forPersona:(id)a4 ofType:(unint64_t)a5 options:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  unsigned int v20;
  id v21;
  uint64_t v22;
  BOOL v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  id v33;
  id v35;
  id v36;
  id v37;
  id v38;

  v11 = a3;
  v12 = a4;
  v35 = a6;
  if (a5 > 7 || ((1 << a5) & 0x94) == 0)
  {
    v26 = sub_100010E50((uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]", 312, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Safe harbors are not supported for container type %ld"), v13, a5);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if (!a7)
      goto LABEL_20;
    goto LABEL_19;
  }
  sub_10004E780(v11);
  v38 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainer containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:](MIContainer, "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:", v11, v12, a5, 0, 0, &v38));
  v15 = v38;
  v17 = v15;
  if (!v14)
  {
    v24 = sub_100010E50((uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]", 321, MIInstallerErrorDomain, 26, v15, 0, CFSTR("Safe harbor with identifier %@ persona %@ of type %ld not found"), v16, (uint64_t)v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    goto LABEL_18;
  }
  v37 = v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "infoValueForKey:error:", CFSTR("com.apple.MobileContainerManager.SafeHarborInfo"), &v37));
  v19 = v37;

  if (v18)
  {
    v36 = v19;
    v20 = objc_msgSend(v14, "removeUnderlyingContainerWaitingForDeletion:error:", 0, &v36);
    v21 = v36;

    if (v20)
    {

      v23 = 1;
LABEL_22:
      sub_10004E89C(v11);
      goto LABEL_23;
    }
    v32 = sub_100010E50((uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]", 337, MIInstallerErrorDomain, 4, v21, 0, CFSTR("Failed to destroy safe harbor container %@"), v22, (uint64_t)v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v32);

    v19 = v14;
    v14 = v18;
    goto LABEL_17;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "domain"));
  if (!objc_msgSend(v27, "isEqualToString:", MIContainerManagerErrorDomain))
  {

    goto LABEL_15;
  }
  v28 = objc_msgSend(v19, "code");

  if (v28 != (id)24)
  {
LABEL_15:
    v33 = sub_100010E50((uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]", 331, MIInstallerErrorDomain, 4, v19, 0, CFSTR("Unable to get safe harbor container attribute from container %@ : %@"), v29, (uint64_t)v14);
    v31 = objc_claimAutoreleasedReturnValue(v33);
    goto LABEL_16;
  }
  v30 = sub_100010E50((uint64_t)"-[MISafeHarborManager removeSafeHarborWithIdentifier:forPersona:ofType:options:error:]", 329, MIInstallerErrorDomain, 26, v19, 0, CFSTR("Safe harbor with identifier %@ persona %@ of type %ld was already installed."), v29, (uint64_t)v11);
  v31 = objc_claimAutoreleasedReturnValue(v30);
LABEL_16:
  v25 = (void *)v31;
LABEL_17:

  v17 = v14;
LABEL_18:

  if (a7)
LABEL_19:
    *a7 = objc_retainAutorelease(v25);
LABEL_20:

  v23 = 0;
  if (a5 <= 7 && ((1 << a5) & 0x94) != 0)
    goto LABEL_22;
LABEL_23:

  return v23;
}

- (id)safeHarborListForType:(unint64_t)a3 forPersona:(id)a4 withError:(id *)a5
{
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  BOOL v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v33;
  void *v35;
  uint64_t v36;
  id obj;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  id v43;
  _BYTE v44[128];

  v33 = a4;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 0));
  if (a3 > 7 || ((1 << a3) & 0x94) == 0)
  {
    v28 = sub_100010E50((uint64_t)"-[MISafeHarborManager safeHarborListForType:forPersona:withError:]", 384, MIInstallerErrorDomain, 25, 0, 0, CFSTR("Safe harbors are not supported for container type %ld"), v5, a3);
    v12 = (id)objc_claimAutoreleasedReturnValue(v28);
    v27 = 0;
    goto LABEL_43;
  }
  sub_10004ECE0();
  v43 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MIContainer containersWithClass:personaUniqueString:error:](MIContainer, "containersWithClass:personaUniqueString:error:", a3, v33, &v43));
  v7 = v43;
  v9 = v7;
  if (!v6)
  {
    v26 = sub_100010E50((uint64_t)"-[MISafeHarborManager safeHarborListForType:forPersona:withError:]", 393, MIInstallerErrorDomain, 4, v7, 0, CFSTR("Failed to get list of containers of type %ld for persona %@: %@"), v8, a3);
    v12 = (id)objc_claimAutoreleasedReturnValue(v26);
    v27 = 0;
    goto LABEL_42;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (!v10)
  {
    v12 = v9;
    goto LABEL_41;
  }
  v11 = *(_QWORD *)v40;
  v36 = MIContainerManagerErrorDomain;
  v12 = v9;
  do
  {
    v13 = 0;
    v14 = v12;
    do
    {
      if (*(_QWORD *)v40 != v11)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v13);
      v16 = objc_autoreleasePoolPush();
      v38 = v14;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "infoValueForKey:error:", CFSTR("com.apple.MobileContainerManager.SafeHarborInfo"), &v38));
      v12 = v38;

      if (v17)
      {
        objc_opt_class(NSDictionary);
        v18 = v17;
        if ((objc_opt_isKindOfClass(v18) & 1) != 0)
          v19 = v18;
        else
          v19 = 0;

        if (v19)
        {
          v22 = objc_msgSend(v18, "mutableCopy");
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "containerURL"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "path"));

          if (v24)
          {
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("HarborPathKey"));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));
            if (v25)
            {
              objc_msgSend(v35, "setObject:forKeyedSubscript:", v22, v25);
            }
            else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
            {
              MOLogWrite(qword_10009E048, 3, "-[MISafeHarborManager safeHarborListForType:forPersona:withError:]", CFSTR("Failed to get identifier from container %@"));
            }

          }
          else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          {
            MOLogWrite(qword_10009E048, 3, "-[MISafeHarborManager safeHarborListForType:forPersona:withError:]", CFSTR("Failed to get path for container %@"));
          }

        }
        else if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          MOLogWrite(qword_10009E048, 3, "-[MISafeHarborManager safeHarborListForType:forPersona:withError:]", CFSTR("Harbor info for container %@ was not a dictionary!"));
        }
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "domain"));
        if (objc_msgSend(v20, "isEqualToString:", v36))
        {
          v21 = objc_msgSend(v12, "code") == (id)24;

          if (v21)
            goto LABEL_35;
        }
        else
        {

        }
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
          MOLogWrite(qword_10009E048, 3, "-[MISafeHarborManager safeHarborListForType:forPersona:withError:]", CFSTR("Failed to get harbor info from container %@ : %@"));
      }
LABEL_35:

      objc_autoreleasePoolPop(v16);
      v13 = (char *)v13 + 1;
      v14 = v12;
    }
    while (v10 != v13);
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  }
  while (v10);
LABEL_41:

  v27 = objc_msgSend(v35, "copy");
  v9 = obj;
LABEL_42:

LABEL_43:
  if (a5 && !v27)
    *a5 = objc_retainAutorelease(v12);

  if (a3 <= 7 && ((1 << a3) & 0x94) != 0)
    sub_10004EE5C(v29, v30);

  return v27;
}

@end
