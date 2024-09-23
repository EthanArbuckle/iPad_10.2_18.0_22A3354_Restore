@implementation MIFreeProfileValidatedAppTracker

+ (id)sharedTracker
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036160;
  block[3] = &unk_100084C08;
  block[4] = a1;
  if (qword_10009DFD8 != -1)
    dispatch_once(&qword_10009DFD8, block);
  return (id)qword_10009DFD0;
}

- (MIFreeProfileValidatedAppTracker)init
{
  MIFreeProfileValidatedAppTracker *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *q;
  MIFreeProfileValidatedAppTracker *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MIFreeProfileValidatedAppTracker;
  v2 = -[MIFreeProfileValidatedAppTracker init](&v9, "init");
  if (v2
    && (v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
        v4 = objc_claimAutoreleasedReturnValue(v3),
        v5 = dispatch_queue_create("com.apple.installd.MIFreeProfileValidatedAppTracker", v4),
        q = v2->_q,
        v2->_q = (OS_dispatch_queue *)v5,
        q,
        v4,
        !v2->_q))
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 3)
      MOLogWrite(qword_10009E048, 3, "-[MIFreeProfileValidatedAppTracker init]", CFSTR("Failed to create queue"));
    v7 = 0;
  }
  else
  {
    v7 = v2;
  }

  return v7;
}

- (void)invalidateCache
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker q](self, "q"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000362C0;
  block[3] = &unk_100084C30;
  block[4] = self;
  dispatch_sync(v3, block);

}

- (BOOL)_onQueue_addAppIdentifierIfCachedOnContainer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  BOOL v13;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100036430;
  v20 = sub_100036440;
  v21 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100036448;
  v15[3] = &unk_100085878;
  v15[4] = self;
  v15[5] = &v16;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v7, 1, v15));

  v10 = (void *)v17[5];
  if (v10 || (v10 = v9) != 0)
  {
    v11 = v10;
    v12 = v11;
    if (a4)
    {
      v12 = objc_retainAutorelease(v11);
      v13 = 0;
      *a4 = v12;
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v12 = 0;
    v13 = 1;
  }

  _Block_object_dispose(&v16, 8);
  return v13;
}

- (BOOL)_onQueue_discoverReferencesWithError:(id *)a3
{
  NSObject *v5;
  NSMutableSet *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker q](self, "q"));
  dispatch_assert_queue_V2(v5);

  v6 = objc_opt_new(NSMutableSet);
  -[MIFreeProfileValidatedAppTracker setRefs:](self, "setRefs:", v6);

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_100036430;
  v19 = sub_100036440;
  v20 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primaryPersonaString"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100036728;
  v14[3] = &unk_1000858A0;
  v14[4] = self;
  v14[5] = &v15;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIMCMContainer enumerateContainersWithClass:forPersona:isTransient:identifiers:groupIdentifiers:usingBlock:](MIMCMContainer, "enumerateContainersWithClass:forPersona:isTransient:identifiers:groupIdentifiers:usingBlock:", 1, v8, 0, 0, 0, v14));

  v10 = (void *)v16[5];
  if (v10)
  {
    v11 = v10;

    v12 = 0;
    v9 = v11;
    if (!a3)
      goto LABEL_7;
  }
  else
  {
    v12 = v9 == 0;
    if (!a3)
      goto LABEL_7;
  }
  if (!v12)
    *a3 = objc_retainAutorelease(v9);
LABEL_7:

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (BOOL)_onQueue_addReferenceForApplicationIdentifier:(id)a3 bundle:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  BOOL v15;
  unsigned __int8 v17;
  void *v18;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];

  v8 = a3;
  v9 = a4;
  v10 = objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker q](self, "q"));
  dispatch_assert_queue_V2(v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  if ((objc_msgSend(v9, "isPlaceholder") & 1) != 0 || objc_msgSend(v9, "bundleType") != 4)
  {
    v14 = 0;
    goto LABEL_6;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker refs](self, "refs"));
  if (v12)
  {

    v13 = 0;
  }
  else
  {
    v34 = 0;
    v17 = -[MIFreeProfileValidatedAppTracker _onQueue_discoverReferencesWithError:](self, "_onQueue_discoverReferencesWithError:", &v34);
    v13 = v34;
    v14 = v13;
    if ((v17 & 1) == 0)
      goto LABEL_17;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker refs](self, "refs"));
  if ((unint64_t)objc_msgSend(v18, "count") <= 2)
  {

    goto LABEL_13;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker refs](self, "refs"));
  v20 = objc_msgSend(v19, "containsObject:", v8);

  if ((v20 & 1) != 0)
  {
LABEL_13:
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleURL"));
    v33 = v13;
    v28 = objc_msgSend(v11, "setValidatedByFreeProfileAppIdentifier:insecurelyCachedOnBundle:error:", v8, v27, &v33);
    v14 = v33;

    if ((v28 & 1) == 0)
    {
      v30 = (void *)MIInstallerErrorDomain;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bundleURL"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "path"));
      v32 = sub_100010E50((uint64_t)"-[MIFreeProfileValidatedAppTracker _onQueue_addReferenceForApplicationIdentifier:bundle:error:]", 176, v30, 4, v14, 0, CFSTR("Failed to set app identifier (%@) for %@"), v31, (uint64_t)v8);
      v26 = objc_claimAutoreleasedReturnValue(v32);
      v13 = v14;
      goto LABEL_16;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker refs](self, "refs"));
    objc_msgSend(v29, "addObject:", v8);

LABEL_6:
    v15 = 1;
    goto LABEL_7;
  }
  v21 = (void *)MIInstallerErrorDomain;
  v35[0] = CFSTR("LegacyErrorString");
  v35[1] = MILibMISErrorNumberKey;
  v36[0] = CFSTR("ApplicationVerificationFailed");
  v36[1] = &off_10008EDA8;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v36, v35, 2));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker refs](self, "refs"));
  v25 = sub_100010E50((uint64_t)"-[MIFreeProfileValidatedAppTracker _onQueue_addReferenceForApplicationIdentifier:bundle:error:]", 171, v21, 13, 0, v22, CFSTR("This device has reached the maximum number of installed apps using a free developer profile: %@"), v24, (uint64_t)v23);
  v26 = objc_claimAutoreleasedReturnValue(v25);
LABEL_16:

  v14 = (id)v26;
LABEL_17:
  if (a5)
  {
    v14 = objc_retainAutorelease(v14);
    v15 = 0;
    *a5 = v14;
  }
  else
  {
    v15 = 0;
  }
LABEL_7:

  return v15;
}

- (BOOL)addReferenceForApplicationIdentifier:(id)a3 bundle:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  int v13;
  BOOL v14;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v8 = a3;
  v9 = a4;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100036430;
  v25 = sub_100036440;
  v26 = 0;
  v10 = objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker q](self, "q"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100036C40;
  block[3] = &unk_100085668;
  v19 = &v27;
  block[4] = self;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v20 = &v21;
  dispatch_sync(v10, block);

  v13 = *((unsigned __int8 *)v28 + 24);
  if (a5 && !*((_BYTE *)v28 + 24))
  {
    *a5 = objc_retainAutorelease((id)v22[5]);
    v13 = *((unsigned __int8 *)v28 + 24);
  }
  v14 = v13 != 0;

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

  return v14;
}

- (BOOL)_onQueue_removeReferenceForBundle:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  BOOL v21;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;

  v6 = a3;
  if ((objc_msgSend(v6, "isPlaceholder") & 1) != 0 || objc_msgSend(v6, "bundleType") != 4)
    goto LABEL_12;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleURL"));
  v27 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "insecureCachedAppIdentifierIfValidatedByFreeProfileForBundle:error:", v8, &v27));
  v10 = v27;

  if (v9)
  {
    v11 = (char *)objc_msgSend(v9, "rangeOfString:", CFSTR("."));
    if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL || (v13 = v11 + 1, v11 + 1 >= objc_msgSend(v9, "length")))
    {
      v18 = sub_100010E50((uint64_t)"-[MIFreeProfileValidatedAppTracker _onQueue_removeReferenceForBundle:error:]", 229, MIInstallerErrorDomain, 4, 0, 0, CFSTR("Cached app identifier contains invalid data (%@)"), v12, (uint64_t)v9);
      v14 = 0;
      v19 = v10;
      v10 = (id)objc_claimAutoreleasedReturnValue(v18);
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringFromIndex:", v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

      if ((v16 & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker refs](self, "refs"));
        objc_msgSend(v17, "removeObject:", v9);

        MIUninstallProfilesForAppIdentifier(v9);
LABEL_13:
        v21 = 1;
        goto LABEL_14;
      }
      v23 = (void *)MIInstallerErrorDomain;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      v25 = sub_100010E50((uint64_t)"-[MIFreeProfileValidatedAppTracker _onQueue_removeReferenceForBundle:error:]", 234, v23, 4, 0, 0, CFSTR("Cached bundle identifier (%@) does not match bundle identifier (%@)"), v24, (uint64_t)v14);
      v26 = objc_claimAutoreleasedReturnValue(v25);

      v10 = (id)v26;
    }
    goto LABEL_18;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "domain"));
  if (objc_msgSend(v19, "isEqualToString:", NSPOSIXErrorDomain))
  {
    v20 = objc_msgSend(v10, "code");

    if (v20 != (id)93)
    {
      v14 = 0;
      goto LABEL_19;
    }

LABEL_12:
    v9 = 0;
    v14 = 0;
    v10 = 0;
    goto LABEL_13;
  }
  v14 = 0;
LABEL_18:

LABEL_19:
  if (a4)
  {
    v10 = objc_retainAutorelease(v10);
    v21 = 0;
    *a4 = v10;
  }
  else
  {
    v21 = 0;
  }
LABEL_14:

  return v21;
}

- (BOOL)removeReferenceForBundle:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v6 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100036430;
  v20 = sub_100036440;
  v21 = 0;
  v7 = objc_claimAutoreleasedReturnValue(-[MIFreeProfileValidatedAppTracker q](self, "q"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10003709C;
  v12[3] = &unk_100084EF0;
  v14 = &v22;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v15 = &v16;
  dispatch_sync(v7, v12);

  v9 = *((unsigned __int8 *)v23 + 24);
  if (a4 && !*((_BYTE *)v23 + 24))
  {
    *a4 = objc_retainAutorelease((id)v17[5]);
    v9 = *((unsigned __int8 *)v23 + 24);
  }
  v10 = v9 != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);

  return v10;
}

- (NSMutableSet)refs
{
  return self->_refs;
}

- (void)setRefs:(id)a3
{
  objc_storeStrong((id *)&self->_refs, a3);
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_refs, 0);
}

@end
