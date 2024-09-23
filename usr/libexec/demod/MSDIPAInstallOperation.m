@implementation MSDIPAInstallOperation

- (MSDIPAInstallOperation)initWithContext:(id)a3
{
  id v4;
  void *v5;
  MSDIPAInstallOperation *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDContentCacheManager sharedInstance](MSDContentCacheManager, "sharedInstance"));
  v6 = -[MSDIPAInstallOperation initWithContext:andContentCacheManager:](self, "initWithContext:andContentCacheManager:", v4, v5);

  return v6;
}

- (MSDIPAInstallOperation)initWithContext:(id)a3 andContentCacheManager:(id)a4
{
  id v6;
  MSDIPAInstallOperation *v7;
  MSDIPAInstallOperation *v8;
  dispatch_semaphore_t v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MSDIPAInstallOperation;
  v7 = -[MSDOperation initWithContext:](&v11, "initWithContext:", a3);
  v8 = v7;
  if (v7)
  {
    -[MSDIPAInstallOperation setContentCacheProtocol:](v7, "setContentCacheProtocol:", v6);
    v9 = dispatch_semaphore_create(0);
    -[MSDIPAInstallOperation setSemaphore:](v8, "setSemaphore:", v9);

    -[MSDIPAInstallOperation setInstallError:](v8, "setInstallError:", 0);
  }

  return v8;
}

- (id)methodSelectors
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_IXInstallAppIPA"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithPointer:](NSValue, "valueWithPointer:", "_verifyInstalledApp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v2, v3, 0));

  return v4;
}

- (BOOL)rollback
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDOperationRepository createOperationFromIdentifier:withContext:](MSDOperationRepository, "createOperationFromIdentifier:withContext:", CFSTR("MSDIPAUninstallOperation"), v3));

  -[MSDOperation produceNewDependentOperation:forRollback:](self, "produceNewDependentOperation:forRollback:", v4, 1);
  return 1;
}

- (int64_t)type
{
  return 3;
}

- (BOOL)runInstallInParallel
{
  return 1;
}

- (BOOL)_IXInstallAppIPA
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  id v26;
  NSObject *v27;
  void *v28;
  unsigned __int8 v29;
  void *v30;
  unsigned __int8 v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  unsigned __int8 v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  id v44;
  unsigned __int8 v45;
  unsigned __int8 v46;
  NSObject *v47;
  _BOOL4 v48;
  id v49;
  NSObject *v50;
  unint64_t v51;
  os_signpost_id_t v52;
  id v53;
  NSObject *v54;
  unsigned __int8 v55;
  id v56;
  id v57;
  NSObject *v58;
  void *v59;
  void *v60;
  unsigned int v61;
  void *v62;
  unsigned __int8 v63;
  void *v64;
  id v65;
  NSObject *v66;
  id v67;
  void *v68;
  id v70;
  NSObject *v71;
  void *v72;
  id v73;
  NSObject *v74;
  void *v75;
  id v76;
  NSObject *v77;
  void *v78;
  const char *v79;
  id v80;
  NSObject *v81;
  void *v82;
  id v83;
  id v84;
  NSObject *v85;
  id v86;
  NSObject *v87;
  void *v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  _QWORD v100[5];
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  uint8_t buf[4];
  void *v112;
  __int16 v113;
  _BYTE v114[10];
  uint64_t v115;
  __int16 v116;
  unsigned int v117;

  v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stagingRootPath"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uniqueIdentifier"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "currentUniqueIdentifier"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v12 = objc_msgSend(v11, "alreadyInstalled");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v14 = objc_msgSend(v13, "useDiffPatch");

  v15 = sub_1000604F0();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544130;
    v112 = v6;
    v113 = 2114;
    *(_QWORD *)v114 = v8;
    *(_WORD *)&v114[8] = 2114;
    v115 = v10;
    v116 = 1026;
    v117 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Installing IPA for app: %{public}@ <UID %{public}@, CurrentUID: %{public}@, DiffPatch: %{public, BOOL}d>", buf, 0x26u);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](MSDAppHelper, "sharedInstance"));
  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "acquireAppTerminationAssertionForApp:", v6));

  if (v14)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation contentCacheProtocol](self, "contentCacheProtocol"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "appDiffPatchFileForSourceAppUID:targetAppUID:", v10, v8));
  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "fileHash"));
  }
  v97 = (void *)v20;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("ipa")));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", v21));

  v22 = sub_1000604F0();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v112 = v97;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "IPA/Patch file hash to use: %{public}@", buf, 0xCu);
  }

  v93 = v4;
  v94 = (void *)v10;
  v95 = (void *)v8;
  v92 = (void *)v18;
  if (v12)
  {
    v110 = 0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[IXUpdatingAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:](IXUpdatingAppInstallCoordinator, "coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:", v6, 9, 1, 0, &v110));
    v25 = v110;
    if (!v24)
    {
      v26 = sub_1000604F0();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1000C33F4(v25, v27);
LABEL_83:

      v48 = 0;
      v44 = 0;
      v90 = 0;
      v33 = 0;
      v24 = 0;
      goto LABEL_33;
    }
  }
  else
  {
    v109 = 0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[IXInitiatingAppInstallCoordinator coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:](IXInitiatingAppInstallCoordinator, "coordinatorForAppWithBundleID:withClientID:createIfNotExisting:created:error:", v6, 9, 1, 0, &v109));
    v25 = v109;
    if (!v24)
    {
      v89 = sub_1000604F0();
      v27 = objc_claimAutoreleasedReturnValue(v89);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_1000C3474(v25, v27);
      goto LABEL_83;
    }
  }
  v28 = v25;
  objc_msgSend(v24, "setObserver:", self);
  v108 = v25;
  v29 = objc_msgSend(v24, "setImportance:error:", 3, &v108);
  v25 = v108;

  if ((v29 & 1) == 0)
  {
    v70 = sub_1000604F0();
    v71 = objc_claimAutoreleasedReturnValue(v70);
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedDescription"));
      *(_DWORD *)buf = 138543362;
      v112 = v72;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Could not set coordinator importance with error - %{public}@", buf, 0xCu);

    }
    v48 = 0;
    v44 = 0;
    v90 = 0;
    v33 = 0;
    goto LABEL_33;
  }
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v107 = v25;
  v31 = objc_msgSend(v24, "setInitialODRAssetPromises:error:", v30, &v107);
  v32 = v107;

  if ((v31 & 1) == 0)
  {
    v73 = sub_1000604F0();
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedDescription"));
      *(_DWORD *)buf = 138543362;
      v112 = v75;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Could not setInitialODRAssetPromises with error - %{public}@", buf, 0xCu);

    }
    v48 = 0;
    v44 = 0;
    v90 = 0;
    v33 = 0;
    goto LABEL_80;
  }
  if (v14)
  {
    v33 = objc_msgSend(objc_alloc((Class)IXPromisedStreamingZipTransfer), "initWithName:client:streamingZipOptions:archiveSize:diskSpaceNeeded:", CFSTR("IPAPromise"), 9, &__NSDictionary0__struct, 0, 0);
  }
  else
  {
    v34 = objc_alloc((Class)IXPromisedTransferToPath);
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithString:](NSURL, "fileURLWithString:", v98));
    v33 = objc_msgSend(v34, "initWithName:client:transferPath:diskSpaceNeeded:", CFSTR("IPAPromise"), 9, v35, 0);

  }
  v36 = objc_msgSend(objc_alloc((Class)IXPlaceholder), "initAppPlaceholderWithBundleName:bundleID:installType:client:", CFSTR("TempApp"), v6, 1, 9);
  v106 = v32;
  v37 = objc_msgSend(v24, "setPlaceholderPromise:error:", v36, &v106);
  v25 = v106;

  v90 = v36;
  if ((v37 & 1) == 0)
  {
    v76 = sub_1000604F0();
    v77 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedDescription", v90));
      *(_DWORD *)buf = 138543362;
      v112 = v78;
      v79 = "Could not set place holder promise with error - %{public}@";
LABEL_71:
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_DEFAULT, v79, buf, 0xCu);

    }
LABEL_72:

LABEL_76:
    v48 = 0;
    v44 = 0;
    goto LABEL_33;
  }
  v105 = v25;
  v38 = objc_msgSend(v24, "setAppAssetPromise:error:", v33, &v105, v36);
  v32 = v105;

  if ((v38 & 1) == 0)
  {
    v80 = sub_1000604F0();
    v81 = objc_claimAutoreleasedReturnValue(v80);
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedDescription"));
      *(_DWORD *)buf = 138543362;
      v112 = v82;
      _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Could not set app asset promise with error - %{public}@", buf, 0xCu);

    }
    v48 = 0;
    v44 = 0;
    goto LABEL_80;
  }
  v104 = v32;
  v39 = objc_msgSend(v36, "setConfigurationCompleteWithError:", &v104);
  v25 = v104;

  if ((v39 & 1) == 0)
  {
    v83 = sub_1000604F0();
    v77 = objc_claimAutoreleasedReturnValue(v83);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedDescription"));
      *(_DWORD *)buf = 138543362;
      v112 = v78;
      v79 = "Could not set configuration comlete with error - %{public}@";
      goto LABEL_71;
    }
    goto LABEL_72;
  }
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation contentCacheProtocol](self, "contentCacheProtocol"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v42 = objc_msgSend(v40, "copyFileIfPresentInCache:toLocation:verifyHash:", v97, v98, objc_msgSend(v41, "verifyFileHash"));

  if ((v42 & 1) == 0)
  {
    v84 = sub_1000604F0();
    v85 = objc_claimAutoreleasedReturnValue(v84);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v112 = v97;
      _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "Could not copy IPA/Patch file from cache: %{public}@", buf, 0xCu);
    }

    goto LABEL_76;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.retailtech.arkenstone")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ist.windward")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.ist.DemoDiscoveryApp")))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[F13Server sharedInstance](F13Server, "sharedInstance"));
    objc_msgSend(v43, "windwardAppInstallationStarted");

  }
  v44 = objc_alloc_init((Class)MIInstallOptions);
  objc_msgSend(v44, "setInstallTargetType:", 1);
  v103 = v25;
  v45 = objc_msgSend(v24, "setInstallOptions:error:", v44, &v103);
  v32 = v103;

  if ((v45 & 1) == 0)
  {
    v86 = sub_1000604F0();
    v87 = objc_claimAutoreleasedReturnValue(v86);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedDescription"));
      *(_DWORD *)buf = 138543362;
      v112 = v88;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "Set install options failed with error - %{public}@", buf, 0xCu);

    }
    v48 = 0;
LABEL_80:
    v25 = v32;
    goto LABEL_33;
  }
  if (v14)
  {
    v102 = v32;
    v46 = -[MSDIPAInstallOperation _fulfillIXSZTransferPromise:withFile:outError:](self, "_fulfillIXSZTransferPromise:withFile:outError:", v33, v98, &v102);
    v25 = v102;

    if ((v46 & 1) == 0)
    {
      v48 = 0;
      goto LABEL_33;
    }
    v32 = v25;
  }
  else
  {
    objc_msgSend(v33, "setComplete:", 1);
  }
  v47 = objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
  dispatch_semaphore_wait(v47, 0xFFFFFFFFFFFFFFFFLL);

  v25 = (id)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation installError](self, "installError"));
  v48 = v25 == 0;
LABEL_33:
  v49 = sub_100060640();
  v50 = objc_claimAutoreleasedReturnValue(v49);
  v51 = -[MSDOperation signpostId](self, "signpostId");
  if (v51 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v52 = v51;
    if (os_signpost_enabled(v50))
    {
      *(_DWORD *)buf = 138412802;
      v112 = v6;
      v113 = 1024;
      *(_DWORD *)v114 = v14;
      *(_WORD *)&v114[4] = 1024;
      *(_DWORD *)&v114[6] = v48;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v50, OS_SIGNPOST_EVENT, v52, "Install IPA", "App identifier: %{xcode:string}@ Use diff patch: %{xcode:BOOLean}d Install Result: %{xcode:BOOLean}d", buf, 0x18u);
    }
  }

  if (v48)
  {
    v53 = v25;
  }
  else
  {
    v101 = v25;
    sub_1000B6428(&v101, 3727740962, CFSTR("Cannot install app."));
    v53 = v101;

    -[MSDOperation setError:](self, "setError:", v53);
    if (v33)
    {
      v100[0] = _NSConcreteStackBlock;
      v100[1] = 3221225472;
      v100[2] = sub_100071B34;
      v100[3] = &unk_10013E818;
      v100[4] = self;
      objc_msgSend(v33, "cancelForReason:client:completion:", v53, 9, v100);
      v54 = objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
      dispatch_semaphore_wait(v54, 0xFFFFFFFFFFFFFFFFLL);

    }
    -[MSDIPAInstallOperation _createFullIPAInstallOperationsAsFallback](self, "_createFullIPAInstallOperationsAsFallback", v90);
  }
  if (objc_msgSend(v96, "fileExistsAtPath:", v98, v90))
  {
    v99 = v53;
    v55 = objc_msgSend(v96, "removeItemAtPath:error:", v98, &v99);
    v56 = v99;

    if ((v55 & 1) == 0)
    {
      v57 = sub_1000604F0();
      v58 = objc_claimAutoreleasedReturnValue(v57);
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        sub_1000C3344((uint64_t)v98, v56, v58);

    }
  }
  else
  {
    v56 = v53;
  }
  if (v14)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation contentCacheProtocol](self, "contentCacheProtocol"));
    objc_msgSend(v59, "removeAppDiffPatchFileForSourceAppUID:targetAppUID:", v94, v95);

  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v61 = objc_msgSend(v60, "deleteInstallableFileAfterInstall");

  if (!v61)
  {
    v67 = sub_1000604F0();
    v66 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v112 = v97;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Skipping deletion of IPA/Patch file from cache: %{public}@", buf, 0xCu);
    }
    v64 = v92;
    goto LABEL_56;
  }
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation contentCacheProtocol](self, "contentCacheProtocol"));
  v63 = objc_msgSend(v62, "deleteFromCache:", v97);

  v64 = v92;
  if ((v63 & 1) == 0)
  {
    v65 = sub_1000604F0();
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      sub_1000C32E0();
LABEL_56:

  }
  v68 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](MSDAppHelper, "sharedInstance"));
  objc_msgSend(v68, "releaseAppTerminationAssertion:forApp:", v64, v6);

  return v48;
}

- (BOOL)_verifyInstalledApp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v14;
  NSObject *v15;
  id v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueIdentifier"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDAppHelper sharedInstance](MSDAppHelper, "sharedInstance"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundlePathForInstalledApp:", v4));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MSDiOSApp appWithPath:](MSDiOSApp, "appWithPath:", v8));
  v10 = v9;
  if (!v9)
  {
    v14 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543362;
      v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Cannot create MSDiOSApp from bundle path %{public}@", (uint8_t *)&v17, 0xCu);
    }
    v11 = 0;
    goto LABEL_10;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "uniqueIdentifier"));
  if ((objc_msgSend(v11, "isEqualToString:", v6) & 1) == 0)
  {
    v16 = sub_1000604F0();
    v15 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138543618;
      v18 = v11;
      v19 = 2114;
      v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "The installed app has UID %{public}@ but the expected UID is %{public}@", (uint8_t *)&v17, 0x16u);
    }
LABEL_10:

    -[MSDIPAInstallOperation _createFullIPAInstallOperationsAsFallback](self, "_createFullIPAInstallOperationsAsFallback");
    v12 = 0;
    goto LABEL_4;
  }
  v12 = 1;
LABEL_4:

  return v12;
}

- (BOOL)_fulfillIXSZTransferPromise:(id)a3 withFile:(id)a4 outError:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  int v10;
  unint64_t st_size;
  NSObject *v12;
  size_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  BOOL v18;
  id v20;
  id v21;
  int *v22;
  id v23;
  id v24;
  NSObject *v25;
  int *v26;
  id v28;
  int v29;
  id v30;
  _QWORD v31[6];
  _QWORD v32[7];
  _QWORD v33[6];
  stat v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  id v46;

  v30 = a3;
  v7 = a4;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_10007221C;
  v43 = sub_10007222C;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  memset(&v34, 0, sizeof(v34));
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sending bytes to IXPromisedStreamingZipTransfer from file: %{public}@", buf, 0xCu);
  }

  v28 = objc_retainAutorelease(v7);
  v10 = open((const char *)objc_msgSend(v28, "fileSystemRepresentation"), 0);
  v29 = v10;
  if (v10 < 0)
  {
    v24 = sub_1000604F0();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = __error();
      sub_1000C3574((uint64_t)v28, v26, buf, v25);
    }

LABEL_18:
    close(v29);
    goto LABEL_19;
  }
  fstat(v10, &v34);
  st_size = v34.st_size;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100072234;
  v33[3] = &unk_10013F148;
  v33[4] = self;
  v33[5] = &v39;
  objc_msgSend(v30, "prepareForExtraction:", v33);
  v12 = objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
  dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  if (!v40[5])
  {
    if (st_size)
    {
      while (!*((_BYTE *)v36 + 24))
      {
        if (st_size >= 0x19000)
          v13 = 102400;
        else
          v13 = st_size;
        v14 = malloc_type_malloc(v13, 0xDF1B4414uLL);
        if (!v14)
        {
          v20 = sub_1000604F0();
          v15 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            sub_1000C35CC();
          goto LABEL_16;
        }
        if (read(v29, v14, v13) != v13)
        {
          v21 = sub_1000604F0();
          v15 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v22 = __error();
            sub_1000C3670(v22, buf, v15);
          }
          goto LABEL_16;
        }
        v15 = objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", v14, v13, 1));
        if (!v15)
        {
          v23 = sub_1000604F0();
          v15 = objc_claimAutoreleasedReturnValue(v23);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            sub_1000C3630(v15);
          goto LABEL_16;
        }
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_1000722C4;
        v32[3] = &unk_10013F170;
        v32[5] = &v39;
        v32[6] = &v35;
        v32[4] = self;
        objc_msgSend(v30, "supplyBytes:withCompletionBlock:", v15, v32);
        v16 = objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
        dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);

        if (v40[5])
          goto LABEL_16;

        st_size -= v13;
        if (!st_size)
          break;
      }
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10007236C;
    v31[3] = &unk_10013DA58;
    v31[4] = self;
    v31[5] = &v39;
    objc_msgSend(v30, "finishStreamWithCompletionBlock:", v31);
    v15 = objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
LABEL_16:

  }
  if (v29)
    goto LABEL_18;
LABEL_19:
  if (a5)
  {
    v17 = (void *)v40[5];
    if (v17)
      *a5 = objc_retainAutorelease(v17);
  }
  v18 = *((_BYTE *)v36 + 24) != 0;
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  return v18;
}

- (void)_createFullIPAInstallOperationsAsFallback
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation dependents](self, "dependents"));
  v6 = objc_msgSend(v5, "copy");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v8 = objc_msgSend(v7, "useDiffPatch");

  if (v8)
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Falling back to install full IPA for app: %{public}@", buf, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
    v12 = objc_msgSend(v11, "copy");

    objc_msgSend(v12, "setAlreadyInstalled:", 0);
    objc_msgSend(v12, "setCurrentUniqueIdentifier:", 0);
    objc_msgSend(v12, "setUseDiffPatch:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDOperationRepository createOperationFromIdentifier:withContext:](MSDOperationRepository, "createOperationFromIdentifier:withContext:", CFSTR("MSDInstallableFileDownloadOperation"), v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDOperationRepository createOperationFromIdentifier:withContext:](MSDOperationRepository, "createOperationFromIdentifier:withContext:", CFSTR("MSDIPAInstallOperation"), v12));
    objc_msgSend(v14, "addDependency:", v13);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "addDependency:", v14, (_QWORD)v20);
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v17);
    }

    -[MSDOperation produceNewDependentOperation:forRollback:](self, "produceNewDependentOperation:forRollback:", v13, 0);
    -[MSDOperation produceNewDependentOperation:forRollback:](self, "produceNewDependentOperation:forRollback:", v14, 0);
    -[MSDOperation setSkipped:](self, "setSkipped:", 1);

  }
}

- (void)coordinatorDidCompleteSuccessfully:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleID"));
    v9 = 138543362;
    v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "App %{public}@ successfully installed.", (uint8_t *)&v9, 0xCu);

  }
  -[MSDIPAInstallOperation setInstallError:](self, "setInstallError:", 0);
  v8 = objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
  dispatch_semaphore_signal(v8);

}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;

  v7 = a3;
  v8 = a4;
  v9 = sub_1000604F0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedDescription"));
    v14 = 138543618;
    v15 = v11;
    v16 = 2114;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "App %{public}@ cannot be installed: %{public}@", (uint8_t *)&v14, 0x16u);

  }
  -[MSDIPAInstallOperation setInstallError:](self, "setInstallError:", v8);
  v13 = objc_claimAutoreleasedReturnValue(-[MSDIPAInstallOperation semaphore](self, "semaphore"));
  dispatch_semaphore_signal(v13);

}

- (MSDContentCacheManagerProtocol)contentCacheProtocol
{
  return self->_contentCacheProtocol;
}

- (void)setContentCacheProtocol:(id)a3
{
  objc_storeStrong((id *)&self->_contentCacheProtocol, a3);
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_semaphore, a3);
}

- (NSError)installError
{
  return self->_installError;
}

- (void)setInstallError:(id)a3
{
  objc_storeStrong((id *)&self->_installError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installError, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_contentCacheProtocol, 0);
}

@end
