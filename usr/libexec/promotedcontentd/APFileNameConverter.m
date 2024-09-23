@implementation APFileNameConverter

+ (BOOL)validateName:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  uint8_t buf[4];
  id v22;
  const __CFString *v23;
  const __CFString *v24;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pathComponents"));
    if (objc_msgSend(v6, "count") == (id)1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathExtension"));

      v9 = objc_msgSend(v8, "length");
      v10 = v9 != 0;
      if (!v9)
      {
        v11 = APLogForCategory(32);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138477827;
          v22 = v5;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Extension is required. %{private}@", buf, 0xCu);
        }

        if (a4)
        {
          v17[0] = CFSTR("name");
          v17[1] = CFSTR("reason");
          v18[0] = v5;
          v18[1] = CFSTR("Extension is required.");
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("APFileSystemNameErrorDomain"), 1, v13));

        }
        v10 = 0;
      }
    }
    else
    {
      v14 = APLogForCategory(32);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138477827;
        v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Name contains illegal characters. %{private}@", buf, 0xCu);
      }

      if (!a4)
      {
        v10 = 0;
        goto LABEL_16;
      }
      v19[0] = CFSTR("name");
      v19[1] = CFSTR("reason");
      v20[0] = v5;
      v20[1] = CFSTR("Name contains illegal characters.");
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
      v10 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("APFileSystemNameErrorDomain"), 1, v8));
    }

  }
  else
  {
    if (!a4)
    {
      v10 = 0;
      goto LABEL_17;
    }
    v23 = CFSTR("reason");
    v24 = CFSTR("Name is empty.");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("APFileSystemNameErrorDomain"), 1, v6));
  }
LABEL_16:

LABEL_17:
  return v10;
}

@end
