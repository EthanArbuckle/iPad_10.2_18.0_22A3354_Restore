@implementation MSDContentInstaller

+ (id)sharedInstance
{
  if (qword_10000C768 != -1)
    dispatch_once(&qword_10000C768, &stru_1000083D0);
  return (id)qword_10000C760;
}

- (MSDContentInstaller)init
{
  MSDContentInstaller *v2;
  void *v3;
  void *v4;
  void *v5;
  MSDContentInstaller *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MSDContentInstaller;
  v2 = -[MSDContentInstaller init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/logs/demod"), "stringByAppendingPathComponent:", CFSTR("demod-finish-demo-restore.log")));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    objc_msgSend(v4, "enableLogToFile:", v3);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    objc_msgSend(v5, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("MSDContentInstaller launched!"));

    v6 = v2;
  }

  return v2;
}

- (BOOL)finishInstallContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  void *v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  id v19;
  void *v20;
  id v22;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoVolumeManager sharedInstance](MSDDemoVolumeManager, "sharedInstance"));
  objc_msgSend(v4, "mountDemoVolume");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoVolumeManager sharedInstance](MSDDemoVolumeManager, "sharedInstance"));
  objc_msgSend(v5, "moveDataFromShelterToFinal");

  if (objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/demo_backup/Metadata/.Content.plist")))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/demo_backup/Metadata/Content.plist")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/demo_backup/Metadata/.Content.plist")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    objc_msgSend(v8, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Restoring secure cookie file from %@ to %@"), CFSTR("/var/demo_backup/Metadata/.Content.plist"), CFSTR("/var/demo_backup/Metadata/Content.plist"));

    v23 = 0;
    v9 = objc_msgSend(v3, "replaceItemAtURL:withItemAtURL:backupItemName:options:resultingItemURL:error:", v6, v7, 0, 0, 0, &v23);
    v10 = v23;
    if ((v9 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
      objc_msgSend(v11, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Cannot restore secure cookie with error: %@"), v10);

    }
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    objc_msgSend(v12, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Skipping secure cookie restore as Content.plist does not exist at %@"), CFSTR("/var/demo_backup/Metadata/.Content.plist"));

    v10 = 0;
  }
  v13 = objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/private/var/demo_backup/backup"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
  v15 = v14;
  if (!v13)
  {
    objc_msgSend(v14, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Skipping demo content restore as staging folder does not exist."));
    v19 = v10;
    goto LABEL_12;
  }
  objc_msgSend(v14, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Starting to move staged demo content..."));

  if (!-[MSDContentInstaller adjustContentUnder:](self, "adjustContentUnder:", CFSTR("/private/var/demo_backup/backup")))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    objc_msgSend(v16, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Cannot move staged demo content."));

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
  objc_msgSend(v17, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Removing staging folder %@..."), CFSTR("/private/var/demo_backup/backup"));

  v22 = v10;
  v18 = objc_msgSend(v3, "removeItemAtPath:error:", CFSTR("/private/var/demo_backup/backup"), &v22);
  v19 = v22;

  if ((v18 & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedDescription"));
    objc_msgSend(v15, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Cannot remove staging folder: %@"), v20);

LABEL_12:
  }

  return 1;
}

- (BOOL)adjustContentUnder:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  unsigned __int8 v30;
  void *v31;
  void *v32;
  id v33;
  unsigned __int8 v34;
  uint64_t v35;
  void *v36;
  unsigned __int8 v37;
  unsigned __int8 v38;
  void *v39;
  void *v40;
  void *v41;
  BOOL v42;
  void *v43;
  void *v44;
  void *v45;
  unsigned __int8 v46;
  unsigned __int8 v47;
  void *v48;
  unsigned __int8 v49;
  void *v50;
  void *v51;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id obj;
  void *v59;
  MSDContentInstaller *v60;
  id v61;
  uint64_t v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  char v77;
  _BYTE v78[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v77 = 0;
  if (objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, &v77))
    v6 = v77 == 0;
  else
    v6 = 1;
  v63 = v5;
  v60 = self;
  if (v6)
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    goto LABEL_35;
  }
  v76 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, &v76));
  v12 = v76;
  v13 = v12;
  if (!v11)
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
    objc_msgSend(v41, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%s: Cannot find files/dirs under %@ - %@"), "-[MSDContentInstaller adjustContentUnder:]", v4, v53);

    v7 = 0;
    v8 = 0;
    v9 = 0;
LABEL_61:
    v43 = 0;
    goto LABEL_66;
  }
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
  if (!v15)
  {
    v7 = 0;
    v59 = 0;
    v9 = 0;
    goto LABEL_34;
  }
  v16 = v15;
  v7 = 0;
  v59 = 0;
  v9 = 0;
  v62 = *(_QWORD *)v73;
  v61 = v4;
  obj = v14;
  do
  {
    v17 = 0;
    do
    {
      v18 = v9;
      v19 = v7;
      if (*(_QWORD *)v73 != v62)
        objc_enumerationMutation(obj);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)v17)));

      v71 = v13;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "attributesOfItemAtPath:error:", v7, &v71));
      v20 = v71;

      if (!v9)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedDescription"));
        objc_msgSend(v50, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%s: Cannot get attribute from %@ - %@"), "-[MSDContentInstaller adjustContentUnder:]", v7, v51);
        v8 = v59;
LABEL_55:

        v41 = obj;
        v43 = 0;
        v42 = 0;
        v13 = v20;
        goto LABEL_56;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "fileType"));
      v22 = objc_msgSend(v21, "isEqualToString:", NSFileTypeSymbolicLink);

      if (v22)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[MSDDemoVolumeManager sharedInstance](MSDDemoVolumeManager, "sharedInstance"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "userHomePath"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/private/var/demo_backup/backup"), "stringByAppendingPathComponent:", v24));

        if (!v25 || objc_msgSend(v7, "caseInsensitiveCompare:", v25))
        {

          v13 = v20;
          goto LABEL_25;
        }
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
        objc_msgSend(v26, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Found wormhole in staging to user volume: %@"), v25);

        v4 = v61;
      }
      if (!-[MSDContentInstaller isNotExtracted:](v60, "isNotExtracted:", v7))
      {
        -[MSDContentInstaller adjustContentUnder:](v60, "adjustContentUnder:", v7);
        v13 = v20;
        goto LABEL_27;
      }
      v27 = objc_claimAutoreleasedReturnValue(-[MSDContentInstaller originalPathFor:](v60, "originalPathFor:", v7));

      v28 = objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
      objc_msgSend((id)v28, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%@ is not extracted (under a content root), should use the original content."), v7);

      v70 = v20;
      v5 = v63;
      LOBYTE(v28) = objc_msgSend(v63, "removeItemAtPath:error:", v7, &v70);
      v29 = v70;

      if ((v28 & 1) == 0)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedDescription"));
        objc_msgSend(v50, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%s: Cannot remove item: %@ - Error:  %@"), "-[MSDContentInstaller adjustContentUnder:]", v7, v51);
        v8 = (void *)v27;
        v20 = v29;
        v4 = v61;
        goto LABEL_55;
      }
      if (objc_msgSend(v63, "fileExistsAtPath:", v27))
      {
        v69 = v29;
        v30 = objc_msgSend(v63, "moveItemAtPath:toPath:error:", v27, v7, &v69);
        v13 = v69;

        if ((v30 & 1) == 0)
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
          objc_msgSend(v31, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%s: Could not move item %@ to %@.  Error:  %@"), "-[MSDContentInstaller adjustContentUnder:]", v27, v7, v32);

        }
        v59 = (void *)v27;
LABEL_25:
        v4 = v61;
LABEL_27:
        v5 = v63;
        goto LABEL_28;
      }
      v59 = (void *)v27;
      v13 = v29;
      v4 = v61;
LABEL_28:
      v17 = (char *)v17 + 1;
    }
    while (v16 != v17);
    v14 = obj;
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    v16 = v33;
  }
  while (v33);
LABEL_34:

  v10 = v13;
  v8 = v59;
  self = v60;
LABEL_35:
  if (!-[MSDContentInstaller isContentRoot:](self, "isContentRoot:", v4))
  {
    v43 = 0;
LABEL_44:
    v42 = 1;
    goto LABEL_58;
  }
  v34 = -[MSDContentInstaller isContentRootToRemove:](self, "isContentRootToRemove:", v4);
  -[MSDContentInstaller removeXattr:](self, "removeXattr:", v4);
  v35 = objc_claimAutoreleasedReturnValue(-[MSDContentInstaller originalPathFor:](self, "originalPathFor:", v4));
  v36 = v8;
  v8 = (void *)v35;

  if (!objc_msgSend(v63, "fileExistsAtPath:", v8))
    goto LABEL_39;
  v68 = v10;
  v37 = objc_msgSend(v63, "removeItemAtPath:error:", v8, &v68);
  v13 = v68;

  if ((v37 & 1) == 0)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
    objc_msgSend(v54, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Cannot remove %@ - %@"), v8, v55);

    v41 = v54;
    goto LABEL_61;
  }
  v10 = v13;
LABEL_39:
  if ((v34 & 1) == 0)
  {
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    objc_msgSend(v44, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Moving content root item %@ to %@."), v4, v8);

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByDeletingLastPathComponent"));
    if ((objc_msgSend(v63, "fileExistsAtPath:isDirectory:", v43, &v77) & 1) == 0
      && !-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:](v60, "createIntermdediateDirectoriesInPathAndRestoreAttributes:", v43))
    {
      v42 = 0;
      goto LABEL_58;
    }
    if (-[MSDContentInstaller hasInheritanceACL:](v60, "hasInheritanceACL:", v43))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
      objc_msgSend(v45, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Parent folder of content root item has inheritance ACL: %@"), v43);

      v67 = v10;
      v46 = objc_msgSend(v63, "copyItemAtPath:toPath:error:", v4, v8, &v67);
      v13 = v67;

      if ((v46 & 1) != 0)
      {
        v66 = v13;
        v47 = objc_msgSend(v63, "removeItemAtPath:error:", v4, &v66);
        v10 = v66;

        if ((v47 & 1) == 0)
        {
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedDescription"));
          objc_msgSend(v41, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Cannot remove item %@.  Error:  %@"), v4, v48);

          v42 = 0;
          v13 = v10;
          goto LABEL_56;
        }
        goto LABEL_44;
      }
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
      objc_msgSend(v56, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Cannot copy %@ to %@.  Error:  %@"), v4, v8, v57);
    }
    else
    {
      v65 = v10;
      v49 = objc_msgSend(v63, "moveItemAtPath:toPath:error:", v4, v8, &v65);
      v13 = v65;

      if ((v49 & 1) != 0)
      {
        v42 = 1;
        goto LABEL_57;
      }
      v56 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
      objc_msgSend(v56, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Cannot move %@ to %@.  Error:  %@"), v4, v8, v57);
    }

    v41 = v56;
LABEL_66:
    v42 = 0;
    goto LABEL_56;
  }
  v64 = v10;
  v38 = objc_msgSend(v63, "removeItemAtPath:error:", v4, &v64);
  v13 = v64;

  if ((v38 & 1) == 0)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedDescription"));
    objc_msgSend(v39, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Failed to remove:  %@ - Error:  %@"), v4, v40);

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
  v42 = 1;
  objc_msgSend(v41, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Removed %@."), v8);
  v43 = 0;
LABEL_56:

LABEL_57:
  v10 = v13;
LABEL_58:

  return v42;
}

- (BOOL)createIntermdediateDirectoriesInPathAndRestoreAttributes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  _QWORD *v11;
  uint64_t *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
  objc_msgSend(v4, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%s - fullPath:  %@"), "-[MSDContentInstaller createIntermdediateDirectoriesInPathAndRestoreAttributes:]", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = sub_100004D70;
  v13[4] = sub_100004D80;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString string](NSString, "string"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathComponents"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004D88;
  v9[3] = &unk_1000083F8;
  v11 = v13;
  v7 = v5;
  v10 = v7;
  v12 = &v15;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  LOBYTE(v6) = *((_BYTE *)v16 + 24);
  _Block_object_dispose(v13, 8);

  _Block_object_dispose(&v15, 8);
  return (char)v6;
}

- (BOOL)isNotExtracted:(id)a3
{
  return -[MSDContentInstaller hasXattr:path:](self, "hasXattr:path:", CFSTR("NotExtracted"), a3);
}

- (BOOL)isContentRoot:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[MSDContentInstaller hasXattr:path:](self, "hasXattr:path:", CFSTR("ContentRoot"), v4))
    v5 = 1;
  else
    v5 = -[MSDContentInstaller hasXattr:path:](self, "hasXattr:path:", CFSTR("ContentRootToRemove"), v4);

  return v5;
}

- (BOOL)isContentRootToRemove:(id)a3
{
  return -[MSDContentInstaller hasXattr:path:](self, "hasXattr:path:", CFSTR("ContentRootToRemove"), a3);
}

- (BOOL)hasXattr:(id)a3 path:(id)a4
{
  id v5;
  id v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  ssize_t v11;
  id v12;
  ssize_t v13;
  id v14;
  void *v15;
  BOOL v16;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = (const char *)objc_msgSend(CFSTR("MSDAnnotation"), "UTF8String");
  v9 = objc_retainAutorelease(v6);
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
  v11 = getxattr(v10, v8, 0, 0, 0, 1);
  if (v11 < 0)
  {
    if (*__error() != 93)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
      objc_msgSend(v15, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Could not extract extended file attributes from %@, returned %ld"), v9, v11);
      v16 = 0;
      v14 = 0;
      v12 = 0;
      goto LABEL_9;
    }
    v16 = 0;
    v14 = 0;
    v12 = 0;
  }
  else
  {
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v11)));
    v13 = getxattr(v10, v8, objc_msgSend(v12, "mutableBytes"), v11, 0, 1);
    if (v13 < 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
      objc_msgSend(v15, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Coud not extract extended file attributes from %@. File is expected to have extended attributes."), v9);
      v16 = 0;
      v14 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v12, "setLength:", v13);
    v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v12, 4);
    if (objc_msgSend(v14, "isEqualToString:", v7))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
      v16 = 1;
      objc_msgSend(v15, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%@: Has expected xattr %@"), v9, v7);
LABEL_9:

      goto LABEL_10;
    }
    v16 = 0;
  }
LABEL_10:

  return v16;
}

- (BOOL)removeXattr:(id)a3
{
  id v3;
  const char *v4;
  id v5;
  int v6;
  void *v8;

  v3 = a3;
  v4 = (const char *)objc_msgSend(CFSTR("MSDAnnotation"), "UTF8String");
  v5 = objc_retainAutorelease(v3);
  v6 = removexattr((const char *)objc_msgSend(v5, "fileSystemRepresentation"), v4, 1);
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    objc_msgSend(v8, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Cannot remove xattr for %@"), v5);

  }
  return v6 == 0;
}

- (BOOL)hasInheritanceACL:(id)a3
{
  id v3;
  _acl *file;
  void *v5;
  void *v6;
  int *v7;
  _acl *v8;
  BOOL v9;
  void *v10;
  void *v11;
  int *v12;
  int v13;
  acl_flagset_t flagset_p;
  acl_entry_t entry_p;

  flagset_p = 0;
  entry_p = 0;
  v3 = objc_retainAutorelease(a3);
  file = acl_get_file((const char *)objc_msgSend(v3, "fileSystemRepresentation"), ACL_TYPE_EXTENDED);
  if (file)
  {
    v8 = file;
    v9 = 0;
    if (!acl_get_entry(file, 0, &entry_p))
    {
      while (1)
      {
        if (acl_get_flagset_np(entry_p, &flagset_p))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[ERR] %s"), "-[MSDContentInstaller hasInheritanceACL:]"));
          v12 = __error();
          objc_msgSend(v10, "logMessage:prefix:message:", 2, v11, CFSTR("Failed to read ACL flagset from %@: %s"), v3, strerror(*v12));

        }
        else if (acl_get_flag_np(flagset_p, ACL_ENTRY_DIRECTORY_INHERIT) == 1
               && acl_get_flag_np(flagset_p, ACL_ENTRY_FILE_INHERIT) == 1)
        {
          v9 = 1;
          break;
        }
        if (entry_p)
          v13 = -1;
        else
          v13 = 0;
        if (acl_get_entry(v8, v13, &entry_p))
          goto LABEL_13;
      }
    }
  }
  else
  {
    if (*__error() != 2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[ERR] %s"), "-[MSDContentInstaller hasInheritanceACL:]"));
      v7 = __error();
      objc_msgSend(v5, "logMessage:prefix:message:", 2, v6, CFSTR("Could not read ACL from %@: %s"), v3, strerror(*v7), flagset_p);

    }
LABEL_13:
    v9 = 0;
  }

  return v9;
}

- (id)originalPathFor:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;

  v3 = a3;
  v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("/private/var/demo_backup/backup"));
  if (v4 == (id)0x7FFFFFFFFFFFFFFFLL)
    v4 = objc_msgSend(v3, "rangeOfString:", CFSTR("/var/demo_backup/backup"));
  if (v4)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    objc_msgSend(v8, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Cannot calculate original path for %@"), v3);

    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "substringFromIndex:", v5));
  }

  return v6;
}

@end
