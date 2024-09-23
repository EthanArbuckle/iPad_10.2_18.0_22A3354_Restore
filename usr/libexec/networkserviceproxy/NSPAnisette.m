@implementation NSPAnisette

+ (id)description
{
  return CFSTR("Anisette");
}

+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 tokenActivationQuery:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  char *v22;
  void *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  const char *v27;
  uint64_t v28;
  _QWORD v29[4];
  void (**v30)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  const char *v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v12;
  if (!v9)
  {
    v25 = nplog_obj(v12, v13, v14);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v15[2](v15, 2, 0, 0, 0);
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v32 = "+[NSPAnisette sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:completionHandler:]";
    v27 = "%s called with null urlRequest";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_FAULT, v27, buf, 0xCu);
    goto LABEL_10;
  }
  if (!v11)
  {
    v28 = nplog_obj(v12, v13, v14);
    v26 = objc_claimAutoreleasedReturnValue(v28);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    *(_DWORD *)buf = 136315138;
    v32 = "+[NSPAnisette sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:completionHandler:]";
    v27 = "%s called with null tokenActivationQuery";
    goto LABEL_12;
  }
  objc_msgSend(v9, "ak_addClientInfoHeader");
  objc_msgSend(v9, "ak_addDeviceUDIDHeader");
  objc_msgSend(v11, "setAuthType:", 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data"));
  objc_msgSend(v9, "setHTTPBody:", v16);

  ++dword_100112F60;
  v20 = nplog_obj(v17, v18, v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "URL"));
    *(_DWORD *)buf = 138412290;
    v32 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Sending request for %@", buf, 0xCu);

  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLSession sharedURLSession](AKURLSession, "sharedURLSession"));
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000A605C;
  v29[3] = &unk_1000F6FD8;
  v30 = v15;
  v24 = objc_msgSend(v23, "beginDataTaskWithRequest:completionHandler:", v9, v29);

LABEL_6:
}

+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (**v16)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  char *v23;
  void *v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  _QWORD v30[4];
  void (**v31)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  const char *v33;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v16 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v13;
  if (!v10)
  {
    v26 = nplog_obj(v13, v14, v15);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
LABEL_10:

      v16[2](v16, 2, 0, 0, 0);
      goto LABEL_6;
    }
    *(_DWORD *)buf = 136315138;
    v33 = "+[NSPAnisette sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
    v28 = "%s called with null urlRequest";
LABEL_12:
    _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, v28, buf, 0xCu);
    goto LABEL_10;
  }
  if (!v12)
  {
    v29 = nplog_obj(v13, v14, v15);
    v27 = objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      goto LABEL_10;
    *(_DWORD *)buf = 136315138;
    v33 = "+[NSPAnisette sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
    v28 = "%s called with null messageBody";
    goto LABEL_12;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  objc_msgSend(v10, "addValue:forHTTPHeaderField:", v17, CFSTR("Client-Auth-Type"));

  objc_msgSend(v10, "ak_addClientInfoHeader");
  objc_msgSend(v10, "ak_addDeviceUDIDHeader");
  v18 = objc_msgSend(v10, "setHTTPBody:", v12);
  ++dword_100112F60;
  v21 = nplog_obj(v18, v19, v20);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
    *(_DWORD *)buf = 138412290;
    v33 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Sending request for %@", buf, 0xCu);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[AKURLSession sharedURLSession](AKURLSession, "sharedURLSession"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_1000A6300;
  v30[3] = &unk_1000F6FD8;
  v31 = v16;
  v25 = objc_msgSend(v24, "beginDataTaskWithRequest:completionHandler:", v10, v30);

LABEL_6:
}

@end
