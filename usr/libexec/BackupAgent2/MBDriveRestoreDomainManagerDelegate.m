@implementation MBDriveRestoreDomainManagerDelegate

+ (id)domainForName:(id)a3 containerID:(id)a4 engine:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  unsigned int v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "persona"));
  if (!v10)
    sub_100088A30();
  if (!v8)
    sub_100088A58();
  v11 = (void *)v10;
  v12 = +[MBDomain isSystemContainerName:](MBDomain, "isSystemContainerName:", v7);
  if ((_DWORD)v12)
  {
    v14 = MBGetDefaultLog(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Creating system container domain for %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Creating system container domain for %@", v7);
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "systemDataContainerRestoreDirectory"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByAppendingPathComponent:", v8));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "systemContainersVolumeMountPoint"));
    v19 = objc_claimAutoreleasedReturnValue(+[MBDomain systemContainerDomainWithIdentifier:volumeMountPoint:rootPath:](MBDomain, "systemContainerDomainWithIdentifier:volumeMountPoint:rootPath:", v8, v18, v17));
LABEL_11:
    v25 = (void *)v19;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    objc_msgSend(v25, "setRelativePathsToBackupAndRestore:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", &stru_1000DBB88));
    objc_msgSend(v25, "setRelativePathsToRestoreOnly:", v27);

    objc_msgSend(v25, "setShouldDigest:", 0);
    goto LABEL_12;
  }
  v20 = +[MBDomain isSystemSharedContainerName:](MBDomain, "isSystemSharedContainerName:", v7);
  if ((_DWORD)v20)
  {
    v22 = MBGetDefaultLog(v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v7;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Creating system shared container domain for %@", buf, 0xCu);
      _MBLog(CFSTR("INFO"), "Creating system shared container domain for %@", v7);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "systemSharedDataContainerRestoreDirectory"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByAppendingPathComponent:", v8));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "systemContainersVolumeMountPoint"));
    v19 = objc_claimAutoreleasedReturnValue(+[MBDomain systemSharedContainerDomainWithIdentifier:volumeMountPoint:rootPath:](MBDomain, "systemSharedContainerDomainWithIdentifier:volumeMountPoint:rootPath:", v8, v18, v17));
    goto LABEL_11;
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "settingsContext"));
  v30 = objc_msgSend(v29, "shouldRestoreAppWithID:", v8);

  if (!v30)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MBDomain uninstalledDomainWithName:](MBDomain, "uninstalledDomainWithName:", v7));
    goto LABEL_13;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "manifest"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "properties"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "containerWithIdentifier:", v8));

  if (v17)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appManager"));
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "containerWithIdentifier:", v8));

    if (v36)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v36, "domain"));
    }
    else
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appManager"));
      v40 = 0;
      v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "createSafeHarborForContainer:withPersona:error:", v17, v11, &v40));
      v39 = v40;

      if (!v36)
        objc_exception_throw(objc_msgSend(objc_alloc((Class)MBException), "initWithCode:format:", 1, CFSTR("Error creating safe harbor for %@: %@"), v8, v39));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject domain](v36, "domain"));

    }
  }
  else
  {
    v37 = MBGetDefaultLog(v33, v34);
    v36 = objc_claimAutoreleasedReturnValue(v37);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v8;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "Container domain %@ without an entry in manifest properties", buf, 0xCu);
      _MBLog(CFSTR("ERROR"), "Container domain %@ without an entry in manifest properties", v8);
    }
    v25 = 0;
  }

LABEL_12:
LABEL_13:

  return v25;
}

@end
