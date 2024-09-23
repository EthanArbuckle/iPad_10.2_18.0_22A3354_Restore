@implementation NSPBAA

+ (id)description
{
  return CFSTR("BAA");
}

+ (void)authenticationFailure
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSPDeviceIdentityCertificate sharedDeviceIdentity](NSPDeviceIdentityCertificate, "sharedDeviceIdentity"));
  objc_msgSend(v2, "deviceIdentityAuthenticationFailed");

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
  void *v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  void (**v27)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  const char *v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v12;
  if (!v9)
  {
    v18 = nplog_obj(v12, v13, v14);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:completionHandler:]";
      v20 = "%s called with null urlRequest";
      goto LABEL_13;
    }
LABEL_11:

    v15[2](v15, 1, 0, 0, 0);
    goto LABEL_5;
  }
  if (!v10)
  {
    v21 = nplog_obj(v12, v13, v14);
    v19 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v29 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:completionHandler:]";
      v20 = "%s called with null tokenFetchURLSession";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!v11)
  {
    v22 = nplog_obj(v12, v13, v14);
    v19 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 136315138;
    v29 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:completionHandler:]";
    v20 = "%s called with null tokenActivationQuery";
LABEL_13:
    _os_log_fault_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, v20, buf, 0xCu);
    goto LABEL_11;
  }
  objc_msgSend(v11, "setAuthType:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tokenInfo"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "data"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000A6D58;
  v23[3] = &unk_1000F7028;
  v24 = v11;
  v25 = v9;
  v26 = v10;
  v27 = v15;
  sub_1000A6328((uint64_t)NSPBAA, v17, v23);

LABEL_5:
}

+ (void)sendRequestForTokens:(id)a3 tokenFetchURLSession:(id)a4 messageBody:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint8_t buf[4];
  const char *v27;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v12;
  if (!v9)
  {
    v16 = nplog_obj(v12, v13, v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
      v18 = "%s called with null urlRequest";
      goto LABEL_13;
    }
LABEL_11:

    v15[2](v15, 1, 0, 0, 0);
    goto LABEL_5;
  }
  if (!v10)
  {
    v19 = nplog_obj(v12, v13, v14);
    v17 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v27 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
      v18 = "%s called with null tokenFetchURLSession";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!v11)
  {
    v20 = nplog_obj(v12, v13, v14);
    v17 = objc_claimAutoreleasedReturnValue(v20);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    *(_DWORD *)buf = 136315138;
    v27 = "+[NSPBAA sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
    v18 = "%s called with null messageBody";
LABEL_13:
    _os_log_fault_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, v18, buf, 0xCu);
    goto LABEL_11;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000A75E4;
  v21[3] = &unk_1000F7078;
  v22 = v9;
  v23 = v11;
  v24 = v10;
  v25 = v15;
  sub_1000A6F88((uint64_t)NSPBAA, v23, v22, v21);

LABEL_5:
}

@end
