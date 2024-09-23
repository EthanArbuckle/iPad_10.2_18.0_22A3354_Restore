@implementation MIAppReferenceManager

+ (id)defaultManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004F268;
  block[3] = &unk_100084C08;
  block[4] = a1;
  if (qword_10009E040 != -1)
    dispatch_once(&qword_10009E040, block);
  return (id)qword_10009E038;
}

- (MIAppReferenceManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MIAppReferenceManager;
  return -[MIAppReferenceManager init](&v3, "init");
}

- (BOOL)addReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 resultingPersonaUniqueStrings:(id *)a6 error:(id *)a7
{
  uint64_t v9;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  id v18;
  id v19;
  char v20;
  id v22;
  id v23;
  id v24;

  v9 = *(_QWORD *)&a5;
  v12 = a3;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleID"));
  v24 = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v13, a4, &v24));
  v15 = v24;

  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "personaUniqueString"));
    v22 = v15;
    v23 = 0;
    v17 = -[MIAppReferenceManager addReferenceForUserWithID:personaUniqueString:byRemovingTemporaryReference:inBundleContainer:resultingPersonaUniqueStrings:error:](self, "addReferenceForUserWithID:personaUniqueString:byRemovingTemporaryReference:inBundleContainer:resultingPersonaUniqueStrings:error:", v9, v16, 0, v14, &v23, &v22);
    v18 = v23;
    v19 = v22;

    v15 = v19;
    if (!a7)
      goto LABEL_7;
  }
  else
  {
    v18 = 0;
    v17 = 0;
    if (!a7)
      goto LABEL_7;
  }
  if (!v17)
    *a7 = objc_retainAutorelease(v15);
LABEL_7:
  v20 = !v17;
  if (!a6)
    v20 = 1;
  if ((v20 & 1) == 0)
    *a6 = objc_retainAutorelease(v18);

  return v17;
}

- (BOOL)removeReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8
{
  uint64_t v11;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  id v20;
  id v21;
  char v22;
  id v24;
  id v25;
  id v26;

  v11 = *(_QWORD *)&a5;
  v14 = a3;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundleID"));
  v26 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v15, a4, &v26));
  v17 = v26;

  if (v16)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "personaUniqueString"));
    v24 = v17;
    v25 = 0;
    v19 = -[MIAppReferenceManager removeReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:](self, "removeReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:", v11, v18, v16, a6, &v25, &v24);
    v20 = v25;
    v21 = v24;

    v17 = v21;
    if (!a8)
      goto LABEL_7;
  }
  else
  {
    v20 = 0;
    v19 = 0;
    if (!a8)
      goto LABEL_7;
  }
  if (!v19)
    *a8 = objc_retainAutorelease(v17);
LABEL_7:
  v22 = !v19;
  if (!a7)
    v22 = 1;
  if ((v22 & 1) == 0)
    *a7 = objc_retainAutorelease(v20);

  return v19;
}

- (id)addTemporaryReferenceForIdentity:(id)a3 inDomain:(unint64_t)a4 forUserWithID:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v21;
  id v22;

  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleID"));
  v22 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v11, a4, &v22));
  v13 = v22;

  if (!v12)
  {
    v19 = 0;
    if (!a6)
      goto LABEL_10;
    goto LABEL_8;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "personaUniqueString"));
  v21 = v13;
  v15 = -[MIAppReferenceManager addTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:error:](self, "addTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:error:", v7, v14, v12, &v21);
  v16 = v21;

  if (v15)
  {
    v17 = objc_alloc((Class)MIAppReference);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v19 = objc_msgSend(v17, "initWithReferenceUUID:identity:domain:uid:", v18, v10, a4, v7);

  }
  else
  {
    v19 = 0;
  }
  v13 = v16;
  if (a6)
  {
LABEL_8:
    if (!v19)
      *a6 = objc_retainAutorelease(v13);
  }
LABEL_10:

  return v19;
}

- (BOOL)finalizeTemporaryReference:(id)a3 resultingPersonaUniqueStrings:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  id v17;
  char v18;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleID"));
  v22 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v10, objc_msgSend(v8, "domain"), &v22));
  v12 = v22;

  if (v11)
  {
    v13 = objc_msgSend(v8, "uid");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "personaUniqueString"));
    v20 = v12;
    v21 = 0;
    v15 = -[MIAppReferenceManager addReferenceForUserWithID:personaUniqueString:byRemovingTemporaryReference:inBundleContainer:resultingPersonaUniqueStrings:error:](self, "addReferenceForUserWithID:personaUniqueString:byRemovingTemporaryReference:inBundleContainer:resultingPersonaUniqueStrings:error:", v13, v14, 1, v11, &v21, &v20);
    v16 = v21;
    v17 = v20;

    v12 = v17;
    if (!a5)
      goto LABEL_7;
  }
  else
  {
    v16 = 0;
    v15 = 0;
    if (!a5)
      goto LABEL_7;
  }
  if (!v15)
    *a5 = objc_retainAutorelease(v12);
LABEL_7:
  v18 = !v15;
  if (!a4)
    v18 = 1;
  if ((v18 & 1) == 0)
    *a4 = objc_retainAutorelease(v16);

  return v15;
}

- (BOOL)revokeTemporaryReference:(id)a3 wasLastReference:(BOOL *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  id v18;
  id v19;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleID"));
  v19 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", v10, objc_msgSend(v8, "domain"), &v19));
  v12 = v19;

  if (v11)
  {
    v13 = objc_msgSend(v8, "uid");
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "personaUniqueString"));
    v18 = v12;
    v15 = -[MIAppReferenceManager removeTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:error:](self, "removeTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:error:", v13, v14, v11, a4, &v18);
    v16 = v18;

    v12 = v16;
    if (!a5)
      goto LABEL_7;
  }
  else
  {
    v15 = 0;
    if (!a5)
      goto LABEL_7;
  }
  if (!v15)
    *a5 = objc_retainAutorelease(v12);
LABEL_7:

  return v15;
}

- (id)_referenceURLForUserWithID:(unsigned int)a3 inBundleContainer:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "referenceStorageURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("user_%d/%@"), v4, CFSTR("AppReferences")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v6, 0));

  return v7;
}

- (id)_temporaryReferenceURLForUserWithID:(unsigned int)a3 inBundleContainer:(id)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "referenceStorageURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("user_%d/%@"), v4, CFSTR("TemporaryAppReferences")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", v6, 0));

  return v7;
}

- (BOOL)_updateReferenceAtURL:(id)a3 byAddingPersonaUniqueString:(id)a4 resultingPersonaUniqueStrings:(id *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  MIAppReferenceMetadata *v12;
  id v13;
  id v14;
  void *v15;
  NSMutableArray *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  unsigned int v22;
  id v23;
  unsigned __int8 v24;
  id v25;
  BOOL v26;
  unsigned __int8 v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  void *v35;
  id v36;
  id *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v42 = 0;
  v12 = (MIAppReferenceMetadata *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceMetadata referenceMetadataFromURL:error:](MIAppReferenceMetadata, "referenceMetadataFromURL:error:", v9, &v42));
  v13 = v42;
  v14 = v13;
  if (!v12)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
    v37 = a6;
    if (objc_msgSend(v18, "isEqualToString:", NSCocoaErrorDomain))
    {
      v19 = objc_msgSend(v14, "code");

      if (v19 == (id)260)
      {
        v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URLByDeletingLastPathComponent"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "URLByDeletingLastPathComponent"));
        v41 = v14;
        v22 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:mode:error:", v21, 0, 493, &v41);
        v23 = v41;

        if (v22)
        {
          v40 = v23;
          v24 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:mode:error:", v20, 0, 493, &v40);
          v14 = v40;

          if ((v24 & 1) != 0)
          {
            v12 = objc_opt_new(MIAppReferenceMetadata);

            a6 = v37;
            goto LABEL_14;
          }
          v23 = v14;
        }

LABEL_27:
        v16 = 0;
        v12 = 0;
        goto LABEL_31;
      }
    }
    else
    {

    }
    v39 = 0;
    v27 = objc_msgSend(v11, "removeItemAtURL:error:", v9, &v39);
    v20 = v39;
    if ((v27 & 1) == 0)
    {
      v28 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
        v36 = v20;
        MOLogWrite(v28, 3, "-[MIAppReferenceManager _updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:]", CFSTR("Failed to remove malformed references file %@ : %@"));

      }
    }
    v29 = (void *)MIInstallerErrorDomain;
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path", v35, v36));
    v32 = sub_100010E50((uint64_t)"-[MIAppReferenceManager _updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:]", 222, v29, 4, v14, 0, CFSTR("Failed to deserialize temporary references from %@"), v31, (uint64_t)v30);
    v23 = (id)objc_claimAutoreleasedReturnValue(v32);

    goto LABEL_27;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceMetadata personas](v12, "personas"));
  v16 = (NSMutableArray *)objc_msgSend(v15, "mutableCopy");

  if (!v16)
  {
LABEL_14:
    v16 = objc_opt_new(NSMutableArray);
    goto LABEL_15;
  }
  if (!-[NSMutableArray count](v16, "count"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      sub_100053880(v9);
    v17 = qword_10009E048;
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
      MOLogWrite(v17, 3, "-[MIAppReferenceManager _updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:]", CFSTR("Unexpectedly found no personas in : %@"));

    }
  }
LABEL_15:
  if ((-[NSMutableArray containsObject:](v16, "containsObject:", v10, v35) & 1) == 0)
  {
    v37 = a6;
    -[NSMutableArray addObject:](v16, "addObject:", v10);
    v25 = -[NSMutableArray copy](v16, "copy");
    -[MIAppReferenceMetadata setPersonas:](v12, "setPersonas:", v25);

    v38 = v14;
    LOBYTE(v25) = -[MIAppReferenceMetadata serializeToURL:error:](v12, "serializeToURL:error:", v9, &v38);
    v23 = v38;

    if ((v25 & 1) != 0)
    {
      v14 = v23;
      goto LABEL_18;
    }
    v33 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
    {
LABEL_32:
      v14 = v23;
      if (v37)
      {
        v14 = objc_retainAutorelease(v23);
        v26 = 0;
        *v37 = v14;
      }
      else
      {
        v26 = 0;
      }
      goto LABEL_35;
    }
    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    MOLogWrite(v33, 3, "-[MIAppReferenceManager _updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:]", CFSTR("Failed to write %@ : %@"));
LABEL_31:

    goto LABEL_32;
  }
LABEL_18:
  if (a5)
    *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));
  v26 = 1;
LABEL_35:

  return v26;
}

- (BOOL)_updateReferenceAtURL:(id)a3 byRemovingPersonaUniqueString:(id)a4 resultingPersonaUniqueStrings:(id *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  unsigned __int8 v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  BOOL v32;
  unsigned __int8 v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;

  v9 = a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v45 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceMetadata referenceMetadataFromURL:error:](MIAppReferenceMetadata, "referenceMetadataFromURL:error:", v9, &v45));
  v13 = v45;
  v14 = v13;
  if (!v12)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
    if (objc_msgSend(v21, "isEqualToString:", NSCocoaErrorDomain))
    {
      v22 = objc_msgSend(v14, "code");

      if (v22 == (id)260)
      {

        v16 = 0;
        if (!a5)
        {
          v32 = 1;
          v14 = 0;
          goto LABEL_38;
        }
        v14 = 0;
LABEL_12:
        v23 = 0;
LABEL_36:
        v37 = objc_retainAutorelease(v23);
        *a5 = v37;

        goto LABEL_37;
      }
    }
    else
    {

    }
    v44 = 0;
    v26 = objc_msgSend(v11, "removeItemAtURL:error:", v9, &v44);
    v25 = v44;
    if ((v26 & 1) == 0)
    {
      v27 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
        v41 = v25;
        MOLogWrite(v27, 3, "-[MIAppReferenceManager _updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:]", CFSTR("Failed to remove malformed references file %@ : %@"));

      }
    }
    v28 = (void *)MIInstallerErrorDomain;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path", v39, v41));
    v31 = sub_100010E50((uint64_t)"-[MIAppReferenceManager _updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:]", 280, v28, 4, v14, 0, CFSTR("Failed to deserialize temporary references from %@"), v30, (uint64_t)v29);
    v20 = (id)objc_claimAutoreleasedReturnValue(v31);

    v16 = 0;
    goto LABEL_20;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "personas"));
  v16 = objc_msgSend(v15, "mutableCopy");

  if (!v16)
  {
    if (!a5)
      goto LABEL_37;
    goto LABEL_12;
  }
  if ((objc_msgSend(v16, "containsObject:", v10) & 1) != 0)
  {
    objc_msgSend(v16, "removeObject:", v10);
    v18 = objc_msgSend(v16, "copy");
    objc_msgSend(v12, "setPersonas:", v18);

    if (!objc_msgSend(v16, "count"))
    {
      v42 = v14;
      v33 = objc_msgSend(v11, "removeItemAtURL:error:", v9, &v42);
      v34 = v42;

      if ((v33 & 1) != 0)
      {
        v14 = v34;
      }
      else
      {
        v36 = qword_10009E048;
        if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
        {
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
          MOLogWrite(v36, 3, "-[MIAppReferenceManager _updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:]", CFSTR("Failed to remove file %@ : %@"));

        }
        v14 = 0;
      }
LABEL_34:
      if (a5)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v16));
        goto LABEL_36;
      }
LABEL_37:
      v32 = 1;
      goto LABEL_38;
    }
    v43 = v14;
    v19 = objc_msgSend(v12, "serializeToURL:error:", v9, &v43);
    v20 = v43;

    if ((v19 & 1) != 0)
    {
      v14 = v20;
      goto LABEL_34;
    }
    v35 = qword_10009E048;
    if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      goto LABEL_21;
    v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "path"));
    MOLogWrite(v35, 3, "-[MIAppReferenceManager _updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:]", CFSTR("Failed to write %@ : %@"));
  }
  else
  {
    v24 = sub_100010E50((uint64_t)"-[MIAppReferenceManager _updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:]", 289, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Persona %@ not found in %@"), v17, (uint64_t)v10);
    v20 = (id)objc_claimAutoreleasedReturnValue(v24);
    v25 = v14;
  }
LABEL_20:

LABEL_21:
  v14 = v20;
  if (a6)
  {
    v14 = objc_retainAutorelease(v20);
    v32 = 0;
    *a6 = v14;
  }
  else
  {
    v32 = 0;
  }
LABEL_38:

  return v32;
}

- (BOOL)_countReferencesWithType:(int)a3 atBaseURL:(id)a4 count:(unint64_t *)a5 withError:(id *)a6
{
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  id v13;
  _QWORD v15[6];
  int v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v9 = a4;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v17 = 0;
  v18 = (id *)&v17;
  v19 = 0x3032000000;
  v20 = sub_100050490;
  v21 = sub_1000504A0;
  v22 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  if (objc_msgSend(v10, "itemDoesNotExistAtURL:", v9))
  {
    if (a5)
      *a5 = 0;
    v11 = 1;
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000504A8;
    v15[3] = &unk_100085B68;
    v16 = a3;
    v15[4] = &v17;
    v15[5] = &v23;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traverseDirectoryAtURL:withBlock:", v9, v15));
    if (v12)
      objc_storeStrong(v18 + 5, v12);
    v13 = v18[5];
    v11 = v13 == 0;
    if (v13)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v13);
    }
    else if (a5)
    {
      *a5 = v24[3];
    }

  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v11;
}

- (BOOL)_countFinalReferences:(unint64_t *)a3 inBundleContainer:(id)a4 withError:(id *)a5
{
  void *v8;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "referenceStorageURL"));
  LOBYTE(a5) = -[MIAppReferenceManager _countReferencesWithType:atBaseURL:count:withError:](self, "_countReferencesWithType:atBaseURL:count:withError:", 2, v8, a3, a5);

  return (char)a5;
}

- (BOOL)_countTemporaryReferences:(unint64_t *)a3 inBundleContainer:(id)a4 withError:(id *)a5
{
  void *v8;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "referenceStorageURL"));
  LOBYTE(a5) = -[MIAppReferenceManager _countReferencesWithType:atBaseURL:count:withError:](self, "_countReferencesWithType:atBaseURL:count:withError:", 1, v8, a3, a5);

  return (char)a5;
}

- (BOOL)addTemporaryReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 error:(id *)a6
{
  uint64_t v8;
  id v10;
  void *v11;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceManager _temporaryReferenceURLForUserWithID:inBundleContainer:](self, "_temporaryReferenceURLForUserWithID:inBundleContainer:", v8, a5));
  LOBYTE(a6) = -[MIAppReferenceManager _updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:](self, "_updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:", v11, v10, 0, a6);

  return (char)a6;
}

- (BOOL)addReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 byRemovingTemporaryReference:(BOOL)a5 inBundleContainer:(id)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8
{
  _BOOL4 v11;
  uint64_t v12;
  id v14;
  id v15;
  void *v16;
  BOOL v17;

  v11 = a5;
  v12 = *(_QWORD *)&a3;
  v14 = a4;
  v15 = a6;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceManager _referenceURLForUserWithID:inBundleContainer:](self, "_referenceURLForUserWithID:inBundleContainer:", v12, v15));
  if (v11
    && !-[MIAppReferenceManager removeTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:error:](self, "removeTemporaryReferenceForUserWithID:personaUniqueString:inBundleContainer:wasLastReference:error:", v12, v14, v15, 0, a8))
  {
    v17 = 0;
  }
  else
  {
    v17 = -[MIAppReferenceManager _updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:](self, "_updateReferenceAtURL:byAddingPersonaUniqueString:resultingPersonaUniqueStrings:error:", v16, v14, a7, a8);
  }

  return v17;
}

- (BOOL)_removeReferenceAtURL:(id)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  unsigned int v16;
  BOOL v17;
  unsigned __int8 v18;
  id v19;
  unsigned __int8 v20;
  id v21;
  uint64_t v22;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;

  v14 = a4;
  v15 = a5;
  v16 = -[MIAppReferenceManager _updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:](self, "_updateReferenceAtURL:byRemovingPersonaUniqueString:resultingPersonaUniqueStrings:error:", a3, v14, a7, a8);
  v17 = v16;
  if (a6 && v16)
  {
    v29 = 0;
    v30 = 0;
    v28 = 0;
    v18 = -[MIAppReferenceManager _countFinalReferences:inBundleContainer:withError:](self, "_countFinalReferences:inBundleContainer:withError:", &v30, v15, &v28);
    v19 = v28;
    if ((v18 & 1) == 0)
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      {
        v24 = v19;
        MOLogWrite(qword_10009E048, 3, "-[MIAppReferenceManager _removeReferenceAtURL:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:]", CFSTR("Failed to count final references : %@"));
      }

      v19 = 0;
    }
    v27 = v19;
    v20 = -[MIAppReferenceManager _countTemporaryReferences:inBundleContainer:withError:](self, "_countTemporaryReferences:inBundleContainer:withError:", &v29, v15, &v27, v24);
    v21 = v27;

    v22 = qword_10009E048;
    if ((v20 & 1) == 0)
    {
      if (qword_10009E048 && *(int *)(qword_10009E048 + 44) < 3)
      {
LABEL_13:
        if (*(int *)(v22 + 44) < 5)
        {
LABEL_15:
          *a6 = v30 + v29 == 0;

          goto LABEL_16;
        }
LABEL_14:
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier", v25));
        MOLogWrite(v22, 5, "-[MIAppReferenceManager _removeReferenceAtURL:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:]", CFSTR("We've got %lu final and %lu temporary references for %@/%@"));

        goto LABEL_15;
      }
      v25 = v21;
      MOLogWrite(qword_10009E048, 3, "-[MIAppReferenceManager _removeReferenceAtURL:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:]", CFSTR("Failed to count temporary references : %@"));
      v22 = qword_10009E048;
    }
    if (!v22)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_16:

  return v17;
}

- (BOOL)removeTemporaryReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 error:(id *)a7
{
  uint64_t v10;
  id v12;
  id v13;
  void *v14;

  v10 = *(_QWORD *)&a3;
  v12 = a5;
  v13 = a4;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceManager _temporaryReferenceURLForUserWithID:inBundleContainer:](self, "_temporaryReferenceURLForUserWithID:inBundleContainer:", v10, v12));
  LOBYTE(a7) = -[MIAppReferenceManager _removeReferenceAtURL:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:](self, "_removeReferenceAtURL:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:", v14, v13, v12, a6, 0, a7);

  return (char)a7;
}

- (BOOL)removeReferenceForUserWithID:(unsigned int)a3 personaUniqueString:(id)a4 inBundleContainer:(id)a5 wasLastReference:(BOOL *)a6 resultingPersonaUniqueStrings:(id *)a7 error:(id *)a8
{
  uint64_t v12;
  id v14;
  id v15;
  void *v16;

  v12 = *(_QWORD *)&a3;
  v14 = a5;
  v15 = a4;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceManager _referenceURLForUserWithID:inBundleContainer:](self, "_referenceURLForUserWithID:inBundleContainer:", v12, v14));
  LOBYTE(a8) = -[MIAppReferenceManager _removeReferenceAtURL:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:](self, "_removeReferenceAtURL:personaUniqueString:inBundleContainer:wasLastReference:resultingPersonaUniqueStrings:error:", v16, v15, v14, a6, a7, a8);

  return (char)a8;
}

- (void)enumerateAppReferencesWithBlock:(id)a3
{
  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
    MOLogWrite(qword_10009E048, 3, "-[MIAppReferenceManager enumerateAppReferencesWithBlock:]", CFSTR("%s is not yet implemented"));
}

- (id)referencesForIdentifier:(id)a3 inDomain:(unint64_t)a4 error:(id *)a5
{
  id v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id *v21;
  NSMutableDictionary *v22;
  uint64_t v23;
  id v24;
  id v25;
  NSMutableDictionary *v28;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v30 = a3;
  v28 = objc_opt_new(NSMutableDictionary);
  v7 = sub_10000B5D0();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = sub_10000B4F8();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  v29 = v10;
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v33;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v14)
        objc_enumerationMutation(v10);
      v16 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v15), "uid");
      v17 = v16;
      if (a4 != 3 || v9 == (_DWORD)v16)
      {
        v31 = v13;
        v18 = (id)objc_claimAutoreleasedReturnValue(-[MIAppReferenceManager personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:](self, "personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:", v30, a4, v16, &v31));
        v19 = v31;

        if (!v18)
        {

          v21 = a5;
          v22 = v28;
          if (a5)
            goto LABEL_20;
          goto LABEL_22;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v17));
        -[NSMutableDictionary setObject:forKeyedSubscript:](v28, "setObject:forKeyedSubscript:", v18, v20);

        v13 = v19;
        v10 = v29;
      }
      if (v12 == (id)++v15)
      {
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v12)
          goto LABEL_3;
        goto LABEL_16;
      }
    }
  }
  v13 = 0;
LABEL_16:

  v22 = v28;
  if (-[NSMutableDictionary count](v28, "count"))
  {
    v18 = -[NSMutableDictionary copy](v28, "copy");
    v19 = v13;
  }
  else
  {
    v24 = sub_100010E50((uint64_t)"-[MIAppReferenceManager referencesForIdentifier:inDomain:error:]", 511, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Unexpectedly got no references for %@ for users %@"), v23, (uint64_t)v30);
    v19 = (id)objc_claimAutoreleasedReturnValue(v24);

    v18 = 0;
  }
  v21 = a5;
  if (a5)
  {
LABEL_20:
    if (!v18)
      *v21 = objc_retainAutorelease(v19);
  }
LABEL_22:
  v25 = v18;

  return v25;
}

- (id)personaUniqueStringsForAppWithBundleID:(id)a3 domain:(unint64_t)a4 forUserWithID:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;

  v7 = *(_QWORD *)&a5;
  v28 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIBundleContainer appBundleContainerForIdentifier:inDomain:withError:](MIBundleContainer, "appBundleContainerForIdentifier:inDomain:withError:", a3, a4, &v28));
  v10 = v28;
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MIAppReferenceManager _referenceURLForUserWithID:inBundleContainer:](self, "_referenceURLForUserWithID:inBundleContainer:", v7, v9));
    v27 = v10;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MIAppReferenceMetadata referenceMetadataFromURL:error:](MIAppReferenceMetadata, "referenceMetadataFromURL:error:", v11, &v27));
    v13 = v27;

    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "personas"));
      v15 = v14;
      v16 = qword_10009E048;
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) < 7)
        goto LABEL_18;
      v17 = objc_msgSend(v14, "count");
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
      v25 = v15;
      v26 = v18;
      v24 = v17;
      MOLogWrite(v16, 7, "-[MIAppReferenceManager personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:]", CFSTR("Found %lu (%@) references at %@"));
      goto LABEL_6;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "domain"));
    if (objc_msgSend(v20, "isEqualToString:", NSCocoaErrorDomain))
    {
      v21 = objc_msgSend(v13, "code");

      if (v21 == (id)260)
      {

        v13 = (id)qword_10009E048;
        if (qword_10009E048)
        {
          if (*(int *)(qword_10009E048 + 44) >= 7)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
            v24 = v18;
            MOLogWrite(v13, 7, "-[MIAppReferenceManager personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:]", CFSTR("No references found at %@"));
            v13 = 0;
            v15 = &__NSArray0__struct;
LABEL_6:

LABEL_18:
            v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15, v24, v25, v26));
LABEL_19:
            v10 = v13;
            if (!a6)
              goto LABEL_22;
            goto LABEL_20;
          }
          v13 = 0;
        }
        v15 = &__NSArray0__struct;
        goto LABEL_18;
      }
    }
    else
    {

    }
    v19 = 0;
    v12 = 0;
    v15 = 0;
    goto LABEL_19;
  }
  v19 = 0;
  v11 = 0;
  v12 = 0;
  v15 = 0;
  if (!a6)
    goto LABEL_22;
LABEL_20:
  if (!v19)
    *a6 = objc_retainAutorelease(v10);
LABEL_22:
  v22 = v19;

  return v22;
}

- (id)personaUniqueStringsForAppWithBundleID:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = -[MIAppReferenceManager personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:](self, "personaUniqueStringsForAppWithBundleID:domain:forUserWithID:error:", v6, 2, sub_10000B4F8(), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

@end
