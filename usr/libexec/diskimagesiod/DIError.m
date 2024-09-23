@implementation DIError

+ (id)copyDefaultLocalizedStringForDIErrorCode:(int64_t)a3
{
  id result;

  switch(a3)
  {
    case 160:
      result = CFSTR("The disk image format is obsolete. Please convert it to a new format using Disk Utility");
      break;
    case 161:
      result = CFSTR("The disk image format is not supported by this OS");
      break;
    case 162:
    case 163:
    case 164:
      goto LABEL_5;
    case 165:
      result = CFSTR("Failed to mount filesystems");
      break;
    case 166:
      result = CFSTR("Corrupted shadow file(s) chain");
      break;
    default:
      if (a3 == 152)
        result = CFSTR("The disk image is corrupted");
      else
LABEL_5:
        result = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Disk image operation failed with error code %d"), a3));
      break;
  }
  return result;
}

+ (id)errorWithDomain:(id)a3 code:(int64_t)a4 description:(id)a5 verboseInfo:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  int64_t v16;
  int64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  uint64_t v46;
  uint8_t buf[4];
  int v48;
  __int16 v49;
  const char *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  id v54;
  __int16 v55;
  void *v56;

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v15 = objc_msgSend(v11, "isEqualToString:", NSPOSIXErrorDomain);
  if (a4 >= 0)
    v16 = a4;
  else
    v16 = -a4;
  if (v15)
    v17 = v16;
  else
    v17 = a4;
  if (!v12)
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.DiskImages2.ErrorDomain")))
      v12 = +[DIError copyDefaultLocalizedStringForDIErrorCode:](DIError, "copyDefaultLocalizedStringForDIErrorCode:", v17);
    else
      v12 = 0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(err code %d)"), v17));
  if (v12)
  {
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, NSLocalizedDescriptionKey);
    if (v13)
    {
      v19 = *__error();
      if (!sub_1000BF0BC())
      {
        v32 = sub_1000BF044();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68158722;
          v48 = 62;
          v49 = 2080;
          v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
          v51 = 2114;
          v52 = v12;
          v53 = 2114;
          v54 = v13;
          v55 = 2114;
          v56 = v18;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ - %{public}@ %{public}@", buf, 0x30u);
        }

        goto LABEL_45;
      }
      v46 = 0;
      v20 = sub_1000BF044();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      *(_DWORD *)buf = 68158722;
      v48 = 62;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        v22 = 3;
      else
        v22 = 2;
      v49 = 2080;
      v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
      v51 = 2114;
      v52 = v12;
      v53 = 2114;
      v54 = v13;
      v55 = 2114;
      v56 = v18;
      v23 = (char *)_os_log_send_and_compose_impl(v22, &v46, 0, 0, &_mh_execute_header, v21, 16, "%.*s: %{public}@ - %{public}@ %{public}@", buf, 48);

      if (v23)
        goto LABEL_25;
      goto LABEL_45;
    }
    v27 = *__error();
    if (!sub_1000BF0BC())
    {
      v39 = sub_1000BF044();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158466;
        v48 = 62;
        v49 = 2080;
        v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
        v51 = 2114;
        v52 = v12;
        v53 = 2114;
        v54 = v18;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ %{public}@", buf, 0x26u);
      }

      goto LABEL_53;
    }
    v46 = 0;
    v28 = sub_1000BF044();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    *(_DWORD *)buf = 68158466;
    v48 = 62;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      v30 = 3;
    else
      v30 = 2;
    v49 = 2080;
    v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
    v51 = 2114;
    v52 = v12;
    v53 = 2114;
    v54 = v18;
    v31 = (char *)_os_log_send_and_compose_impl(v30, &v46, 0, 0, &_mh_execute_header, v29, 16, "%.*s: %{public}@ %{public}@", buf, 38);

    if (v31)
      goto LABEL_41;
  }
  else
  {
    if (v13)
    {
      v19 = *__error();
      if (!sub_1000BF0BC())
      {
        v37 = sub_1000BF044();
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 68158466;
          v48 = 62;
          v49 = 2080;
          v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
          v51 = 2114;
          v52 = v13;
          v53 = 2114;
          v54 = v18;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ %{public}@", buf, 0x26u);
        }

        goto LABEL_45;
      }
      v46 = 0;
      v24 = sub_1000BF044();
      v25 = objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 68158466;
      v48 = 62;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        v26 = 3;
      else
        v26 = 2;
      v49 = 2080;
      v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
      v51 = 2114;
      v52 = v13;
      v53 = 2114;
      v54 = v18;
      v23 = (char *)_os_log_send_and_compose_impl(v26, &v46, 0, 0, &_mh_execute_header, v25, 16, "%.*s: %{public}@ %{public}@", buf, 38);

      if (v23)
      {
LABEL_25:
        fprintf(__stderrp, "%s\n", v23);
        free(v23);
      }
LABEL_45:
      *__error() = v19;
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("DIErrorVerboseInfo"));
      goto LABEL_54;
    }
    v27 = *__error();
    if (!sub_1000BF0BC())
    {
      v41 = sub_1000BF044();
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68158466;
        v48 = 62;
        v49 = 2080;
        v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
        v51 = 2114;
        v52 = v11;
        v53 = 2114;
        v54 = v18;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%.*s: %{public}@ error %{public}@", buf, 0x26u);
      }

      goto LABEL_53;
    }
    v46 = 0;
    v34 = sub_1000BF044();
    v35 = objc_claimAutoreleasedReturnValue(v34);
    *(_DWORD *)buf = 68158466;
    v48 = 62;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      v36 = 3;
    else
      v36 = 2;
    v49 = 2080;
    v50 = "+[DIError errorWithDomain:code:description:verboseInfo:error:]";
    v51 = 2114;
    v52 = v11;
    v53 = 2114;
    v54 = v18;
    v31 = (char *)_os_log_send_and_compose_impl(v36, &v46, 0, 0, &_mh_execute_header, v35, 16, "%.*s: %{public}@ error %{public}@", buf, 38);

    if (v31)
    {
LABEL_41:
      fprintf(__stderrp, "%s\n", v31);
      free(v31);
    }
  }
LABEL_53:
  *__error() = v27;
LABEL_54:
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v11, v17, v14));
  v44 = v43;
  if (a7)
    *a7 = objc_retainAutorelease(v43);

  return v44;
}

+ (id)errorWithPOSIXCode:(int)a3 verboseInfo:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(+[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", NSPOSIXErrorDomain, a3, 0, a4, 0));
}

+ (BOOL)failWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", NSPOSIXErrorDomain, a3, a4, 0, a5);
  return 0;
}

+ (BOOL)failWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", NSPOSIXErrorDomain, a3, 0, a4, a5);
  return 0;
}

+ (BOOL)failWithPOSIXCode:(int)a3 error:(id *)a4
{
  id v4;

  v4 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", NSPOSIXErrorDomain, a3, 0, 0, a4);
  return 0;
}

+ (id)nilWithPOSIXCode:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", NSPOSIXErrorDomain, a3, a4, 0, a5);
  return 0;
}

+ (id)nilWithPOSIXCode:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", NSPOSIXErrorDomain, a3, 0, a4, a5);
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", NSOSStatusErrorDomain, a3, a4, 0, a5);
  return 0;
}

+ (BOOL)failWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", NSOSStatusErrorDomain, a3, 0, a4, a5);
  return 0;
}

+ (id)nilWithOSStatus:(int)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", NSOSStatusErrorDomain, a3, 0, a4, a5);
  return 0;
}

+ (id)errorWithEnumValue:(int64_t)a3 verboseInfo:(id)a4
{
  return (id)objc_claimAutoreleasedReturnValue(+[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", CFSTR("com.apple.DiskImages2.ErrorDomain"), a3, 0, a4, 0));
}

+ (BOOL)failWithEnumValue:(int64_t)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", CFSTR("com.apple.DiskImages2.ErrorDomain"), a3, a4, 0, a5);
  return 0;
}

+ (BOOL)failWithEnumValue:(int64_t)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", CFSTR("com.apple.DiskImages2.ErrorDomain"), a3, 0, a4, a5);
  return 0;
}

+ (id)nilWithEnumValue:(int64_t)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", CFSTR("com.apple.DiskImages2.ErrorDomain"), a3, a4, 0, a5);
  return 0;
}

+ (id)nilWithEnumValue:(int64_t)a3 verboseInfo:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", CFSTR("com.apple.DiskImages2.ErrorDomain"), a3, 0, a4, a5);
  return 0;
}

+ (BOOL)mandatoryArgumentFailWithError:(id *)a3
{
  id v3;

  v3 = +[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", NSPOSIXErrorDomain, 22, 0, CFSTR("A mandatory argument is null in a DiskImages2 API call. Remember to check if init succeeded"), a3);
  return 0;
}

+ (NSBundle)frameworkBundle
{
  if (qword_1001A0F78 != -1)
    dispatch_once(&qword_1001A0F78, &stru_1001741B0);
  return (NSBundle *)(id)qword_1001A0F70;
}

+ (id)errorWithDIException:(const void *)a3 description:(id)a4 prefix:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v9 = a4;
  v10 = a5;
  v11 = *((_DWORD *)a3 + 2);
  if (v11 >= 0)
    v12 = v11;
  else
    v12 = -v11;
  v13 = (__CFString *)NSPOSIXErrorDomain;
  if (v12 >= 0x6B)
    v13 = CFSTR("com.apple.DiskImages2.ErrorDomain");
  v14 = v13;
  v15 = (*(uint64_t (**)(const void *))(*(_QWORD *)a3 + 16))(a3);
  if (v10)
    v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), v10, v15));
  else
    v16 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v15));
  v17 = (void *)v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[DIError errorWithDomain:code:description:verboseInfo:error:](DIError, "errorWithDomain:code:description:verboseInfo:error:", v14, v12, v9, v16, a6));

  return v18;
}

+ (BOOL)failWithDIException:(const void *)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDIException:description:prefix:error:](DIError, "errorWithDIException:description:prefix:error:", a3, a4, 0, a5);
  return 0;
}

+ (id)nilWithDIException:(const void *)a3 description:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDIException:description:prefix:error:](DIError, "errorWithDIException:description:prefix:error:", a3, a4, 0, a5);
  return 0;
}

+ (BOOL)failWithDIException:(const void *)a3 prefix:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDIException:description:prefix:error:](DIError, "errorWithDIException:description:prefix:error:", a3, 0, a4, a5);
  return 0;
}

+ (id)nilWithDIException:(const void *)a3 prefix:(id)a4 error:(id *)a5
{
  id v5;

  v5 = +[DIError errorWithDIException:description:prefix:error:](DIError, "errorWithDIException:description:prefix:error:", a3, 0, a4, a5);
  return 0;
}

@end
