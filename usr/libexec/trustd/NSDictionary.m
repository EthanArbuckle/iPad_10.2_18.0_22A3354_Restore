@implementation NSDictionary

- (BOOL)writeToClassDURL:(id)a3 permissions:(unsigned __int16)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  const void *v12;
  NSObject *v13;
  id v14;
  char *v15;
  NSString *v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v21;
  NSErrorUserInfoKey v22;
  void *v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  char *v27;

  v8 = a3;
  if (!-[NSDictionary writeToURL:error:](self, "writeToURL:error:", v8, a5))
    goto LABEL_10;
  v21 = 0;
  v9 = objc_retainAutorelease(v8);
  if (sub_100034EC8((const char *)objc_msgSend(v9, "fileSystemRepresentation"), &v21))
  {
    v10 = objc_retainAutorelease(v9);
    if (!chmod((const char *)objc_msgSend(v10, "fileSystemRepresentation"), a4))
    {
      v19 = 1;
      goto LABEL_11;
    }
    v11 = *__error();
    v12 = sub_100011628("SecError");
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation");
      v15 = strerror(v11);
      *(_DWORD *)buf = 136315394;
      v25 = v14;
      v26 = 2080;
      v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "failed to change permissions of %s: %s", buf, 0x16u);
    }

    if (a5)
    {
      v22 = NSLocalizedDescriptionKey;
      v16 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", CFSTR("failed to change permissions of %s: %s"), objc_msgSend(objc_retainAutorelease(v10), "fileSystemRepresentation"), strerror(v11));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v23 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
      *a5 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v11, v18));

    }
    goto LABEL_10;
  }
  if (!a5)
  {
LABEL_10:
    v19 = 0;
    goto LABEL_11;
  }
  v19 = 0;
  *a5 = v21;
LABEL_11:

  return v19;
}

@end
