@implementation DIDiskArbEmulation

- (BOOL)waitForDAIdleWithError:(id *)a3
{
  return 1;
}

- (BOOL)ejectWithBSDName:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  BOOL v20;
  int v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  id v36;

  v5 = a3;
  v6 = *__error();
  if (sub_1000BF0BC())
  {
    v30 = 0;
    v7 = sub_1000BF044();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v9 = 3;
    else
      v9 = 2;
    *(_DWORD *)buf = 68158210;
    v32 = 45;
    v33 = 2080;
    v34 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
    v35 = 2112;
    v36 = v5;
    v10 = (char *)_os_log_send_and_compose_impl(v9, &v30, 0, 0, &_mh_execute_header, v8, 0, "%.*s: Ejecting %@", buf, 28);

    if (v10)
    {
      fprintf(__stderrp, "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    v11 = sub_1000BF044();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      v32 = 45;
      v33 = 2080;
      v34 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
      v35 = 2112;
      v36 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Ejecting %@", buf, 0x1Cu);
    }

  }
  *__error() = v6;
  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/dev/%@"), v5)));
  v14 = open((const char *)objc_msgSend(v13, "fileSystemRepresentation"), 0);
  if (v14 < 0)
  {
    v19 = *__error();
    v18 = CFSTR("Failed to eject - cannot open device");
    goto LABEL_14;
  }
  v15 = v14;
  v16 = ioctl(v14, 0x20006415uLL, 0);
  v17 = *__error();
  close(v15);
  if (v16)
  {
    v18 = CFSTR("Failed to eject");
    v19 = v17;
LABEL_14:
    v20 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", v19, v18, a4);
    goto LABEL_25;
  }
  close(v15);
  v21 = *__error();
  if (sub_1000BF0BC())
  {
    v30 = 0;
    v22 = sub_1000BF044();
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      v24 = 3;
    else
      v24 = 2;
    *(_DWORD *)buf = 68158210;
    v32 = 45;
    v33 = 2080;
    v34 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
    v35 = 2112;
    v36 = v5;
    LODWORD(v29) = 28;
    v25 = (char *)_os_log_send_and_compose_impl(v24, &v30, 0, 0, &_mh_execute_header, v23, 0, "%.*s: %@ ejected successfully", buf, v29);

    if (v25)
    {
      fprintf(__stderrp, "%s\n", v25);
      free(v25);
    }
  }
  else
  {
    v26 = sub_1000BF044();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158210;
      v32 = 45;
      v33 = 2080;
      v34 = "-[DIDiskArbEmulation ejectWithBSDName:error:]";
      v35 = 2112;
      v36 = v5;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%.*s: %@ ejected successfully", buf, 0x1Cu);
    }

  }
  *__error() = v21;
  v20 = 1;
LABEL_25:

  return v20;
}

- (BOOL)unmountWithMountPoint:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  BOOL v14;
  int v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;

  v5 = a3;
  v6 = *__error();
  if (sub_1000BF0BC())
  {
    v17 = 0;
    v7 = sub_1000BF044();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      v9 = 3;
    else
      v9 = 2;
    *(_DWORD *)buf = 68158211;
    v20 = 50;
    v21 = 2080;
    v22 = "-[DIDiskArbEmulation unmountWithMountPoint:error:]";
    v23 = 2113;
    v24 = v5;
    v16 = 28;
    v10 = (char *)_os_log_send_and_compose_impl(v9, &v17, 0, 0, &_mh_execute_header, v8, 0, "%.*s: Ejecting %{private}@", buf, v16);

    if (v10)
    {
      fprintf(__stderrp, "%s\n", v10);
      free(v10);
    }
  }
  else
  {
    v11 = sub_1000BF044();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68158211;
      v20 = 50;
      v21 = 2080;
      v22 = "-[DIDiskArbEmulation unmountWithMountPoint:error:]";
      v23 = 2113;
      v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%.*s: Ejecting %{private}@", buf, 0x1Cu);
    }

  }
  *__error() = v6;
  v18 = v5;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v14 = +[DIHelpers executeWithPath:arguments:error:](DIHelpers, "executeWithPath:arguments:error:", CFSTR("/sbin/umount"), v13, a4);

  return v14;
}

- (id)copyDescriptionWithBSDName:(id)a3
{
  return 0;
}

@end
