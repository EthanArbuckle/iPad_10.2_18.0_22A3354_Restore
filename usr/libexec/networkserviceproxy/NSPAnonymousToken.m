@implementation NSPAnonymousToken

+ (id)description
{
  return CFSTR("AnonToken");
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
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *, void *, void *);
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __int128 *p_buf;
  __int128 buf;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v12;
  if (!v9)
  {
    v22 = nplog_obj(v12, v13, v14);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[NSPAnonymousToken sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery"
                                      ":completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "%s called with null urlRequest", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_18;
  }
  if (!v10)
  {
    v24 = nplog_obj(v12, v13, v14);
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[NSPAnonymousToken sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery"
                                      ":completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "%s called with null tokenFetchURLSession", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_18;
  }
  if (!v11)
  {
    v25 = nplog_obj(v12, v13, v14);
    v23 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[NSPAnonymousToken sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery"
                                      ":completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "%s called with null tokenActivationQuery", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_18;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "authInfo"));

  if (!v16)
  {
    v26 = nplog_obj(v17, v18, v19);
    v23 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[NSPAnonymousToken sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery"
                                      ":completionHandler:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "%s called with null tokenActivationQuery.authInfo", (uint8_t *)&buf, 0xCu);
    }
LABEL_18:

    v15[2](v15, 4, 0, 0, 0);
    goto LABEL_6;
  }
  objc_msgSend(v11, "setAuthType:", 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "data"));
  objc_msgSend(v9, "setHTTPBody:", v20);

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v34 = 0x3032000000;
  v35 = sub_10000318C;
  v36 = sub_1000A6A60;
  v37 = 0;
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_1000A837C;
  v30 = &unk_1000F6A58;
  p_buf = &buf;
  v31 = v15;
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dataTaskWithRequest:completionHandler:", v9, &v27));
  objc_storeStrong((id *)(*((_QWORD *)&buf + 1) + 40), v21);
  objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "resume", v27, v28, v29, v30);

  _Block_object_dispose(&buf, 8);
LABEL_6:

}

+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6
{
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))a6 + 2))(a6, 4, 0, 0, 0);
}

@end
