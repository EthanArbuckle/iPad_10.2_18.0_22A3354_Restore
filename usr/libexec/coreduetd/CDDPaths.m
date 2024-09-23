@implementation CDDPaths

+ (id)simulatorSystemPathFor:(id)a3 withEnvVar:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "environment"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v5));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", v6));
  return v10;
}

+ (id)simulatorHomePathFor:(id)a3
{
  id v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = NSHomeDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingString:", v3));

  return v6;
}

+ (id)simulatorSharedPathFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", CFSTR("/tmp")));
  objc_msgSend(v4, "addObject:", CFSTR("Developer/CoreSimulator/Shared/data"));
  if (v3 && objc_msgSend(v3, "length"))
    objc_msgSend(v4, "addObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v4));

  return v5;
}

+ (id)CDDDatabaseDirectory
{
  return CFSTR("/var/mobile/Library/CoreDuet/");
}

+ (id)CDDConfigurationBundlePathDefault
{
  return CFSTR("/System/Library/CoreDuet/CoreDuetDaemonConfig.bundle");
}

+ (id)CDDConfigurationBundlePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDDatabaseDirectory](CDDPaths, "CDDDatabaseDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingString:", CFSTR("CoreDuetDaemonConfig.bundle")));

  return v3;
}

+ (id)knowledgeDatabaseDirectory
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDDatabaseDirectory](CDDPaths, "CDDDatabaseDirectory"));
  v6[0] = v2;
  v6[1] = CFSTR("Knowledge");
  v6[2] = &stru_100039CD0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v3));

  return v4;
}

+ (id)peopleDatabaseDirectory
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDDatabaseDirectory](CDDPaths, "CDDDatabaseDirectory"));
  v6[0] = v2;
  v6[1] = CFSTR("People");
  v6[2] = &stru_100039CD0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v3));

  return v4;
}

+ (id)userLocalKnowledgeDatabaseDirectory
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CDDPaths CDDUserDatabaseDirectory](CDDPaths, "CDDUserDatabaseDirectory"));
  v6[0] = v2;
  v6[1] = CFSTR("Knowledge");
  v6[2] = &stru_100039CD0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString pathWithComponents:](NSString, "pathWithComponents:", v3));

  return v4;
}

@end
