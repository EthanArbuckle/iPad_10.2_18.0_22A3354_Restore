@implementation RAPLayoutCache

+ (id)_layoutURLForType:(int64_t)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFileManager baseLayoutFilePath](RAPFileManager, "baseLayoutFilePath"));
  v5 = v4;
  if ((unint64_t)a3 > 5)
    v6 = &stru_1011EB268;
  else
    v6 = *(&off_1011E3288 + a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByAppendingPathComponent:", v6));

  return v7;
}

+ (void)setConfig:(id)a3 forLayoutType:(int64_t)a4
{
  id v6;
  const __CFString *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  const char *v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  const __CFString *v23;
  __int16 v24;
  unsigned int v25;

  v6 = a3;
  if ((unint64_t)a4 > 5)
    v7 = &stru_1011EB268;
  else
    v7 = *(&off_1011E3288 + a4);
  v8 = sub_100431F1C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v22 = 138412546;
    v23 = v7;
    v24 = 1024;
    v25 = objc_msgSend(v6, "ttl");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Saving a config of type %@ with TTL %u", (uint8_t *)&v22, 0x12u);
  }

  if (v6)
  {
    v10 = sub_100431F1C();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_layoutURLForType:", a4));
      v22 = 138412290;
      v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Will attempt to save config at path %@", (uint8_t *)&v22, 0xCu);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "data"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RAPFileManager baseLayoutFilePath](RAPFileManager, "baseLayoutFilePath"));
    v15 = +[RAPFileManager saveData:toDirectory:filename:](RAPFileManager, "saveData:toDirectory:filename:", v13, v14, v7);

    v16 = sub_100431F1C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = v17;
    if (v15)
    {
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v22 = 138412290;
        v23 = v7;
        v19 = "Successfully saved layout of type %@";
        v20 = v18;
        v21 = OS_LOG_TYPE_INFO;
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, (uint8_t *)&v22, 0xCu);
      }
    }
    else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v22 = 138412290;
      v23 = v7;
      v19 = "Failed to save layout of type %@";
      v20 = v18;
      v21 = OS_LOG_TYPE_ERROR;
      goto LABEL_14;
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    LOWORD(v22) = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: config != ((void *)0)", (uint8_t *)&v22, 2u);
  }
LABEL_16:

}

+ (id)configForLayoutType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  id v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  int v26;
  const __CFString *v27;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_layoutURLForType:"));
  v5 = objc_claimAutoreleasedReturnValue(+[RAPFileManager dataAtFileURL:](RAPFileManager, "dataAtFileURL:", v4));
  v6 = (void *)v5;
  if ((unint64_t)a3 <= 5)
  {
    v7 = *(&off_1011E3288 + a3);
    if (v5)
      goto LABEL_3;
LABEL_11:
    v21 = sub_100431F1C();
    v8 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v26 = 138412290;
      v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "We do not have a layout of type %@", (uint8_t *)&v26, 0xCu);
    }
    goto LABEL_23;
  }
  v7 = &stru_1011EB268;
  if (!v5)
    goto LABEL_11;
LABEL_3:
  v8 = objc_msgSend(objc_alloc((Class)GEORPFeedbackLayoutFormConfig), "initWithData:", v5);
  v9 = sub_100431F1C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (!v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v26 = 138412290;
      v27 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Trying to create a form config with malformed data of type %@.  We should delete this data", (uint8_t *)&v26, 0xCu);
    }

    +[RAPFileManager removeItemAtFilePath:](RAPFileManager, "removeItemAtFilePath:", v4);
    v8 = 0;
    goto LABEL_23;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v26 = 138412290;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Found a layout of type %@ from cache", (uint8_t *)&v26, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v13 = +[RAPFileManager haveContentsOfFilePathExpired:withSuggestedRetryDate:withTimeToLive:](RAPFileManager, "haveContentsOfFilePathExpired:withSuggestedRetryDate:withTimeToLive:", v4, v12, (double)-[NSObject ttl](v8, "ttl"));

  if (v13)
  {
    v14 = +[RAPFileManager removeItemAtFilePath:](RAPFileManager, "removeItemAtFilePath:", v4);
    v15 = sub_100431F1C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = v16;
    if (v14)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v26 = 138412290;
        v27 = v7;
        v18 = "Successfully deleted expired layout of type %@";
        v19 = v17;
        v20 = OS_LOG_TYPE_INFO;
LABEL_21:
        _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, (uint8_t *)&v26, 0xCu);
      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v26 = 138412290;
      v27 = v7;
      v18 = "Failed to delete expired layout of type %@";
      v19 = v17;
      v20 = OS_LOG_TYPE_ERROR;
      goto LABEL_21;
    }

LABEL_23:
    v24 = 0;
    goto LABEL_24;
  }
  v22 = sub_100431F1C();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v26 = 138412290;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Returning layout of type %@ from cache since it has not expired", (uint8_t *)&v26, 0xCu);
  }

  v8 = v8;
  v24 = v8;
LABEL_24:

  return v24;
}

@end
