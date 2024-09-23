@implementation MSDXattr

+ (BOOL)isNotExtracted:(id)a3
{
  return +[MSDXattr hasXattr:path:](MSDXattr, "hasXattr:path:", CFSTR("NotExtracted"), a3);
}

+ (BOOL)isContentRoot:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (+[MSDXattr hasXattr:path:](MSDXattr, "hasXattr:path:", CFSTR("ContentRoot"), v3))
    v4 = 1;
  else
    v4 = +[MSDXattr hasXattr:path:](MSDXattr, "hasXattr:path:", CFSTR("ContentRootToRemove"), v3);

  return v4;
}

+ (BOOL)isContentRootToRemove:(id)a3
{
  return +[MSDXattr hasXattr:path:](MSDXattr, "hasXattr:path:", CFSTR("ContentRootToRemove"), a3);
}

+ (BOOL)removeXattr:(id)a3
{
  id v3;
  const char *v4;
  id v5;
  int v6;
  id v8;
  NSObject *v9;

  v3 = a3;
  v4 = (const char *)objc_msgSend(CFSTR("MSDAnnotation"), "UTF8String");
  v5 = objc_retainAutorelease(v3);
  v6 = removexattr((const char *)objc_msgSend(v5, "fileSystemRepresentation"), v4, 1);
  if (v6)
  {
    v8 = sub_100024A40();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10002840C();

  }
  return v6 == 0;
}

+ (BOOL)setContentRoot:(id)a3
{
  return +[MSDXattr setXattr:path:](MSDXattr, "setXattr:path:", CFSTR("ContentRoot"), a3);
}

+ (BOOL)setContentRootToRemove:(id)a3
{
  return +[MSDXattr setXattr:path:](MSDXattr, "setXattr:path:", CFSTR("ContentRootToRemove"), a3);
}

+ (BOOL)setIsNotExtracted:(id)a3
{
  return +[MSDXattr setXattr:path:](MSDXattr, "setXattr:path:", CFSTR("NotExtracted"), a3);
}

+ (BOOL)setIsNotBackedUp:(id)a3
{
  return +[MSDXattr setXattr:value:path:](MSDXattr, "setXattr:value:path:", CFSTR("MBRestoreAnnotation"), CFSTR("NotBackedUp"), a3);
}

+ (BOOL)hasXattr:(id)a3 path:(id)a4
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
  id v15;
  NSObject *v16;
  BOOL v17;
  id v18;
  id v20;
  int v21;
  id v22;
  __int16 v23;
  id v24;

  v5 = a3;
  v6 = a4;
  v7 = v5;
  v8 = (const char *)objc_msgSend(CFSTR("MSDAnnotation"), "UTF8String");
  v9 = objc_retainAutorelease(v6);
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
  v11 = getxattr(v10, v8, 0, 0, 0, 1);
  if (v11 < 0)
  {
    if (*__error() == 93)
    {
      v12 = 0;
      v14 = 0;
      goto LABEL_9;
    }
    v18 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100028480((uint64_t)v9, v11, v16);
    v12 = 0;
LABEL_13:
    v14 = 0;
    v17 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v11)));
  v13 = getxattr(v10, v8, objc_msgSend(v12, "mutableBytes"), v11, 0, 1);
  if (v13 < 0)
  {
    v20 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_100028504();
    goto LABEL_13;
  }
  objc_msgSend(v12, "setLength:", v13);
  v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v12, 4);
  if (objc_msgSend(v14, "isEqualToString:", v7))
  {
    v15 = sub_100024A40();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412546;
      v22 = v9;
      v23 = 2114;
      v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@: Has expected xattr %{public}@", (uint8_t *)&v21, 0x16u);
    }
    v17 = 1;
    goto LABEL_14;
  }
LABEL_9:
  v17 = 0;
LABEL_15:

  return v17;
}

+ (BOOL)setXattr:(id)a3 path:(id)a4
{
  return +[MSDXattr setXattr:value:path:](MSDXattr, "setXattr:value:path:", CFSTR("MSDAnnotation"), a3, a4);
}

+ (BOOL)setXattr:(id)a3 value:(id)a4 path:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;
  int v15;
  id v17;
  NSObject *v18;

  v7 = a3;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "dataUsingEncoding:", 4));
  v10 = objc_retainAutorelease(v8);
  v11 = (const char *)objc_msgSend(v10, "fileSystemRepresentation");
  v12 = objc_retainAutorelease(v7);
  v13 = (const char *)objc_msgSend(v12, "UTF8String");
  v14 = objc_retainAutorelease(v9);
  v15 = setxattr(v11, v13, objc_msgSend(v14, "bytes"), (size_t)objc_msgSend(v14, "length"), 0, 1);
  if (v15)
  {
    v17 = sub_100024A40();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_100028578((uint64_t)v12, (uint64_t)v10, v18);

  }
  return v15 == 0;
}

@end
