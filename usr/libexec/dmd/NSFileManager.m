@implementation NSFileManager

+ (id)dmd_systemLibraryURL
{
  if (qword_1000EBB28 != -1)
    dispatch_once(&qword_1000EBB28, &stru_1000BC060);
  return (id)qword_1000EBB20;
}

+ (id)dmd_systemDMDDirectoryURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_systemLibraryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("dmd"), 1));

  return v3;
}

+ (id)dmd_systemConfigurationEngineDirectoryURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_systemDMDDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("ConfigurationEngine"), 1));

  return v3;
}

+ (id)dmd_systemConfigurationDatabaseURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_systemConfigurationEngineDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Database"), 0));

  return v3;
}

+ (id)dmd_userHomeURL
{
  if (qword_1000EBB38 != -1)
    dispatch_once(&qword_1000EBB38, &stru_1000BC080);
  return (id)qword_1000EBB30;
}

+ (id)dmd_userLibraryURL
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100070708;
  block[3] = &unk_1000BA638;
  block[4] = a1;
  if (qword_1000EBB48 != -1)
    dispatch_once(&qword_1000EBB48, block);
  return (id)qword_1000EBB40;
}

+ (id)dmd_userDarwinUserTempDirectoryURL
{
  if (qword_1000EBB58 != -1)
    dispatch_once(&qword_1000EBB58, &stru_1000BC0A0);
  return (id)qword_1000EBB50;
}

+ (id)dmd_userDMDDirectoryURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userLibraryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("dmd"), 1));

  return v3;
}

+ (id)dmd_userConfigurationEngineDirectoryURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userDMDDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("ConfigurationEngine"), 1));

  return v3;
}

+ (id)dmd_userConfigurationDatabaseURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userConfigurationEngineDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Database"), 0));

  return v3;
}

+ (id)dmd_userImageDatabaseDirectoryURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userConfigurationEngineDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Images"), 1));

  return v3;
}

+ (id)dmd_userFontDatabaseDirectoryURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userConfigurationEngineDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Font"), 1));

  return v3;
}

+ (id)dmd_userEffectivePoliciesDatabaseURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userDMDDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Policies"), 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Database"), 0));

  return v4;
}

+ (void)dmd_createUserDMDDirectoryDataVault
{
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int *v11;
  NSString *v12;
  void *v13;
  id v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userDMDDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v14 = 0;
  v4 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v14);
  v5 = v14;
  if ((v4 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_createUserDMDDirectoryDataVault]"));
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("NSFileManager+DMDAdditions.m"), 190, CFSTR("Failed to create data vault directory: %@"), v5);

  }
  v6 = objc_retainAutorelease(v2);
  if (rootless_convert_to_datavault(objc_msgSend(v6, "fileSystemRepresentation"), "dmd"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_createUserDMDDirectoryDataVault]"));
    v11 = __error();
    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", strerror(*v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("NSFileManager+DMDAdditions.m"), 193, CFSTR("Failed to enable data vault: %@ (%d)"), v13, *__error());

  }
}

+ (void)dmd_setUserDirSuffix:(char *)a3
{
  void *v3;
  int *v4;
  NSString *v5;
  void *v6;
  id v7;

  if ((_set_user_dir_suffix(a3, a2) & 1) == 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSFileManager(DMDAdditions) dmd_setUserDirSuffix:]"));
    v4 = __error();
    v5 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", strerror(*v4));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("NSFileManager+DMDAdditions.m"), 197, CFSTR("Failed to set the user directory suffix: %@ (%d)"), v6, *__error());

  }
}

+ (id)dmd_legacyUserConfigurationEngineDatabaseURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dmd_userDMDDirectoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Configurations"), 0));

  return v3;
}

@end
