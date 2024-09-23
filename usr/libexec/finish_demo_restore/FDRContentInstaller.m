@implementation FDRContentInstaller

+ (id)sharedInstance
{
  if (qword_10000C758 != -1)
    dispatch_once(&qword_10000C758, &stru_1000083B0);
  return (id)qword_10000C750;
}

- (FDRContentInstaller)init
{
  FDRContentInstaller *v2;
  void *v3;
  FDRContentInstaller *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FDRContentInstaller;
  v2 = -[FDRContentInstaller init](&v6, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    objc_msgSend(v3, "enableLogToFilesUnder:prefix:expireDays:", CFSTR("/private/var/logs/MobileDemo"), CFSTR("finish-demo-retore"), 10);

    v4 = v2;
  }

  return v2;
}

- (BOOL)finishInstallContent
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  unsigned __int8 v10;
  id v11;
  void *v12;
  BOOL v13;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = objc_msgSend(&off_100008FE8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(&off_100008FE8);
        v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v3, "fileExistsAtPath:", v9) & 1) != 0)
        {
          if (!-[FDRContentInstaller updateContent:](self, "updateContent:", v9))
          {
            v13 = 0;
            goto LABEL_16;
          }
          v18 = v6;
          v10 = objc_msgSend(v3, "removeItemAtPath:error:", v9, &v18);
          v11 = v18;

          if ((v10 & 1) == 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[ERR] %s"), "-[FDRContentInstaller finishInstallContent]"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedDescription"));
            objc_msgSend(v15, "logMessage:prefix:message:", 2, v16, CFSTR("Cannot remove %@ - %@"), v9, v17);

            v13 = 0;
            v6 = v11;
            goto LABEL_16;
          }
          v6 = v11;
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
          objc_msgSend(v12, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("No content need to install from %@."), v9);

        }
      }
      v5 = objc_msgSend(&off_100008FE8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v6 = 0;
  }
  v13 = 1;
LABEL_16:

  return v13;
}

- (BOOL)updateContent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  uint64_t v28;
  BOOL v29;
  void *v30;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  unsigned __int8 v38;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v38 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
  v35 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 0, 0));

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));
  if (!v7)
  {
    v29 = 1;
    goto LABEL_17;
  }
  v8 = (void *)v7;
  v34 = 0;
  v9 = 0;
  while (1)
  {
    while (1)
    {
      v10 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
      objc_msgSend(v11, "rangeOfString:", v3);
      v13 = v12;

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "substringFromIndex:", v13));

      if (objc_msgSend(v9, "hasPrefix:", CFSTR("/var/")))
        break;
LABEL_7:
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));

      v8 = (void *)v20;
      if (!v20)
      {
        v29 = 1;
LABEL_14:
        v8 = v9;
        v30 = v34;
        goto LABEL_15;
      }
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
    objc_msgSend(v15, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Copying %@ to %@"), v16, v9);

    if (!objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v9, &v38))
    {
      v21 = v34;
      goto LABEL_12;
    }
    v17 = v38;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    v19 = v18;
    if (v17)
    {
      objc_msgSend(v18, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%@ exists and it's folder, skip"), v9);

      goto LABEL_7;
    }
    objc_msgSend(v18, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("%@ exist and it's not folder, remove it first"), v9);

    v37 = v34;
    v22 = objc_msgSend(v4, "removeItemAtPath:error:", v9, &v37);
    v23 = v37;

    if ((v22 & 1) == 0)
      break;
    v21 = v23;
LABEL_12:
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v9));
    v36 = v21;
    v25 = objc_msgSend(v4, "moveItemAtURL:toURL:error:", v8, v24, &v36);
    v34 = v36;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
    if ((v25 & 1) == 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[ERR] %s"), "-[FDRContentInstaller updateContent:]"));
      v30 = v34;
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "localizedDescription"));
      objc_msgSend(v26, "logMessage:prefix:message:", 2, v32, CFSTR("Failed to copy %@ - %@"), v9, v33);
      goto LABEL_20;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path"));
    v29 = 1;
    objc_msgSend(v26, "logMessage:prefix:message:", 1, CFSTR("[INF]"), CFSTR("Done copying %@ to %@"), v27, v9);

    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "nextObject"));
    v8 = (void *)v28;
    if (!v28)
      goto LABEL_14;
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MSDLogModel sharedInstance](MSDLogModel, "sharedInstance"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[ERR] %s"), "-[FDRContentInstaller updateContent:]"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedDescription"));
  objc_msgSend(v26, "logMessage:prefix:message:", 2, v32, CFSTR("Failed to remove %@ - %@"), v9, v33);
  v30 = v23;
LABEL_20:

  v29 = 0;
LABEL_15:

LABEL_17:
  return v29;
}

@end
