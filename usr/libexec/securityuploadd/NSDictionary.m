@implementation NSDictionary

- (BOOL)writeToClassDURL:(id)a3 permissions:(unsigned __int16)a4 error:(id *)a5
{
  id v8;
  id v9;
  const char *v10;
  int v11;
  int v12;
  id v13;
  uint64_t v14;
  const void *v15;
  NSObject *v16;
  NSString *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  int *v21;
  NSString *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  BOOL v27;
  uint64_t v28;
  int *v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  _BYTE buf[12];
  __int16 v38;
  char *v39;
  NSErrorUserInfoKey v40;
  void *v41;
  NSErrorUserInfoKey v42;

  v8 = a3;
  if (!-[NSDictionary writeToURL:error:](self, "writeToURL:error:", v8, a5))
    goto LABEL_12;
  v9 = objc_retainAutorelease(v8);
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
  v11 = open(v10, 0);
  if (v11)
  {
    v12 = v11;
    if ((fcntl(v11, 64, 4) & 0x80000000) == 0)
    {
      close(v12);
      v13 = objc_retainAutorelease(v9);
      if (!chmod((const char *)objc_msgSend(v13, "fileSystemRepresentation"), a4))
      {
        v27 = 1;
        goto LABEL_13;
      }
      v14 = *__error();
      v15 = sub_100010B28("SecError");
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)&buf[4] = objc_msgSend(objc_retainAutorelease(v13), "fileSystemRepresentation");
        v38 = 2080;
        v39 = strerror(v14);
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "failed to change permissions of %s: %s", buf, 0x16u);
      }

      if (a5)
      {
        v17 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("failed to change permissions of %s: %s"), objc_msgSend(objc_retainAutorelease(v13), "fileSystemRepresentation"), strerror(v14), NSLocalizedDescriptionKey);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v36 = v18;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1));
        *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v14, v19));

      }
      goto LABEL_12;
    }
    v28 = *__error();
    v42 = NSLocalizedDescriptionKey;
    v29 = __error();
    v30 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("failed to change protection class of %s: %s"), v10, strerror(*v29));
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    *(_QWORD *)buf = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, &v42, 1));
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v28, v32));

    v26 = v33;
    close(v12);
    if (!a5)
    {
LABEL_12:
      v27 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v20 = *__error();
    v40 = NSLocalizedDescriptionKey;
    v21 = __error();
    v22 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("failed to open file for protection class change %s: %s"), v10, strerror(*v21));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v41 = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v20, v24));

    v26 = v25;
    if (!a5)
      goto LABEL_12;
  }
  v27 = 0;
  *a5 = v26;
LABEL_13:

  return v27;
}

@end
