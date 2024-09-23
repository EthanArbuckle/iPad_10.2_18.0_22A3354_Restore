@implementation NSFileManager

+ (id)iOSSystemContainerURL
{
  if (qword_1000FC6C0 != -1)
    dispatch_once(&qword_1000FC6C0, &stru_1000CBF08);
  return (id)qword_1000FC6B8;
}

+ (id)studentdLibraryURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "appGroupLibraryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("studentd"), 1));

  return v3;
}

+ (id)eventDatabaseDirectoryURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "studentdLibraryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Events"), 1));

  return v3;
}

+ (id)signInHistoryPlistURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "studentdLibraryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("SignInHistory.plist")));

  return v3;
}

+ (id)userImagesDirectoryURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "studentdLibraryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("UserImages"), 1));

  return v3;
}

+ (id)resourceCacheDirectoryURL
{
  void *v3;
  uint64_t v4;
  void *v5;

  if (CRKIsiOS(a1, a2))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager iOSSystemContainerURL](NSFileManager, "iOSSystemContainerURL"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Caches/Resources")));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "appGroupLibraryURL"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Caches/studentd/Resources"), 1));
  }
  v5 = (void *)v4;

  return v5;
}

+ (id)systemDataStoreDirectoryURL
{
  void *v2;
  void *v3;

  if (CRKIsOSX(a1, a2))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager studentdLibraryURL](NSFileManager, "studentdLibraryURL"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager iOSSystemContainerURL](NSFileManager, "iOSSystemContainerURL"));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1));

  }
  return v2;
}

+ (id)IDSDirectoryURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "studentdLibraryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("IDS")));

  return v3;
}

+ (id)temporaryURLForImageNamed:(id)a3 bundle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  UIImage *v16;
  UIImage *v17;
  NSData *v18;
  NSObject *v19;
  void *v20;
  unsigned __int8 v21;
  id v22;
  id v23;
  NSObject *v24;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.png"), v5));
  v9 = NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringByAppendingPathComponent:", v8));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v11));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
  v14 = objc_msgSend(v7, "fileExistsAtPath:", v13);

  if (!v14)
  {
    if (v6)
      v16 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0));
    else
      v16 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v5));
    v17 = v16;
    if (v16)
    {
      v18 = UIImagePNGRepresentation(v16);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "path"));
      v21 = objc_msgSend(v7, "createFileAtPath:contents:attributes:", v20, v19, 0);

      if ((v21 & 1) != 0)
      {
        v15 = v12;
LABEL_15:

        goto LABEL_16;
      }
      v23 = sub_100076700();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        sub_10007E59C((uint64_t)v5, v24);

    }
    else
    {
      v22 = sub_100076700();
      v19 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_10007E518((uint64_t)v5, (uint64_t)v6, v19);
    }
    v15 = 0;
    goto LABEL_15;
  }
  v15 = v12;
LABEL_16:

  return v15;
}

+ (id)appGroupLibraryURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.studentd")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1));
  return v4;
}

@end
