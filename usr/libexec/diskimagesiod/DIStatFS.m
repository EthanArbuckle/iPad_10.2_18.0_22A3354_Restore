@implementation DIStatFS

- (DIStatFS)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  DIStatFS *v6;
  id v7;
  uint64_t v8;
  NSURL *mountedOnURL;
  uint64_t v10;
  id v11;
  uint64_t v12;
  NSString *mountedFrom;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)DIStatFS;
  v6 = -[DIStatFS init](&v15, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSURL, v5), CFSTR("mountedOnURL"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    mountedOnURL = v6->_mountedOnURL;
    v6->_mountedOnURL = (NSURL *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v10), CFSTR("mountedFrom"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    mountedFrom = v6->_mountedFrom;
    v6->_mountedFrom = (NSString *)v12;

    v6->_blockSize = (unint64_t)objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("blockSize"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedOnURL](self, "mountedOnURL"));
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("mountedOnURL"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedFrom](self, "mountedFrom"));
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("mountedFrom"));

  objc_msgSend(v6, "encodeInteger:forKey:", -[DIStatFS blockSize](self, "blockSize"), CFSTR("blockSize"));
}

- (DIStatFS)initWithFileDescriptor:(int)a3 error:(id *)a4
{
  DIStatFS *v6;
  void *v7;
  uint64_t v8;
  NSURL *mountedOnURL;
  id v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  char *v16;
  id v17;
  DIStatFS *v18;
  uint64_t v19;
  NSObject *v20;
  DIStatFS *v21;
  uint64_t v23;
  objc_super v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  char *f_fstypename;
  statfs v31;

  v24.receiver = self;
  v24.super_class = (Class)DIStatFS;
  v6 = -[DIStatFS init](&v24, "init");
  if (!v6)
  {
LABEL_17:
    v18 = v6;
    goto LABEL_18;
  }
  if ((fstatfs(a3, &v31) & 0x80000000) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v31.f_mntonname));
    v8 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v7, 1));
    mountedOnURL = v6->_mountedOnURL;
    v6->_mountedOnURL = (NSURL *)v8;

    v6->_blockSize = v31.f_bsize;
    v10 = +[DIHelpers copyDevicePathWithStatfs:](DIHelpers, "copyDevicePathWithStatfs:", &v31);
    v11 = v10;
    if ((v31.f_flags & 0x1000) != 0 && objc_msgSend(v10, "hasPrefix:", CFSTR("/dev/disk")))
      objc_storeStrong((id *)&v6->_mountedFrom, v11);
    v12 = *__error();
    if (sub_1000BF0BC())
    {
      v23 = 0;
      v13 = sub_1000BF044();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        v15 = 3;
      else
        v15 = 2;
      *(_DWORD *)buf = 68158210;
      v26 = 41;
      v27 = 2080;
      v28 = "-[DIStatFS initWithFileDescriptor:error:]";
      v29 = 2082;
      f_fstypename = v31.f_fstypename;
      v16 = (char *)_os_log_send_and_compose_impl(v15, &v23, 0, 0, &_mh_execute_header, v14, 0, "%.*s: File system is %{public}s", buf, 28);

      if (v16)
      {
        fprintf(__stderrp, "%s\n", v16);
        free(v16);
      }
    }
    else
    {
      v19 = sub_1000BF044();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        v26 = 41;
        v27 = 2080;
        v28 = "-[DIStatFS initWithFileDescriptor:error:]";
        v29 = 2082;
        f_fstypename = v31.f_fstypename;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%.*s: File system is %{public}s", buf, 0x1Cu);
      }

    }
    *__error() = v12;

    goto LABEL_17;
  }
  v17 = +[DIError nilWithPOSIXCode:verboseInfo:error:](DIError, "nilWithPOSIXCode:verboseInfo:error:", *__error(), CFSTR("fstatfs failed"), a4);
  v18 = (DIStatFS *)objc_claimAutoreleasedReturnValue(v17);
LABEL_18:
  v21 = v18;

  return v21;
}

- (void)logWithHeader:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  __CFString *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  __CFString *v21;
  char *v22;
  int v23;
  uint64_t v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  __CFString *v36;

  v6 = a3;
  v23 = *__error();
  if (sub_1000BF0BC())
  {
    v24 = 0;
    v7 = sub_1000BF044();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v9 = 3;
    else
      v9 = 2;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedOnURL](self, "mountedOnURL"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "path"));
    v12 = -[DIStatFS blockSize](self, "blockSize");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedFrom](self, "mountedFrom"));
    if (v13)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedFrom](self, "mountedFrom"));
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("locally mounted from %@"), v4));
    }
    else
    {
      v14 = CFSTR("remote mount");
    }
    *(_DWORD *)buf = 68158979;
    v26 = 26;
    v27 = 2080;
    v28 = "-[DIStatFS logWithHeader:]";
    v29 = 2114;
    v30 = v6;
    v31 = 2113;
    v32 = v11;
    v33 = 1024;
    v34 = v12;
    v35 = 2114;
    v36 = v14;
    v22 = (char *)_os_log_send_and_compose_impl(v9, &v24, 0, 0, &_mh_execute_header, v8, 0, "%.*s: %{public}@: mounted on %{private}@, %u bytes block size, %{public}@", buf, 54);
    if (v13)
    {

    }
    if (v22)
    {
      fprintf(__stderrp, "%s\n", v22);
      free(v22);
    }
  }
  else
  {
    v15 = sub_1000BF044();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedOnURL](self, "mountedOnURL"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "path"));
      v19 = -[DIStatFS blockSize](self, "blockSize");
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedFrom](self, "mountedFrom"));
      if (v20)
      {
        v3 = (void *)objc_claimAutoreleasedReturnValue(-[DIStatFS mountedFrom](self, "mountedFrom"));
        v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("locally mounted from %@"), v3));
      }
      else
      {
        v21 = CFSTR("remote mount");
      }
      *(_DWORD *)buf = 68158979;
      v26 = 26;
      v27 = 2080;
      v28 = "-[DIStatFS logWithHeader:]";
      v29 = 2114;
      v30 = v6;
      v31 = 2113;
      v32 = v18;
      v33 = 1024;
      v34 = v19;
      v35 = 2114;
      v36 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%.*s: %{public}@: mounted on %{private}@, %u bytes block size, %{public}@", buf, 0x36u);
      if (v20)
      {

      }
    }

  }
  *__error() = v23;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURL)mountedOnURL
{
  return self->_mountedOnURL;
}

- (NSString)mountedFrom
{
  return self->_mountedFrom;
}

- (unint64_t)blockSize
{
  return self->_blockSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountedFrom, 0);
  objc_storeStrong((id *)&self->_mountedOnURL, 0);
}

@end
