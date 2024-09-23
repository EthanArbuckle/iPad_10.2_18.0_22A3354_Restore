@implementation NSPBAA_Anisette

+ (id)description
{
  return CFSTR("BAA_Anisette");
}

+ (void)authenticationFailure
{
  +[NSPBAA authenticationFailure](NSPBAA, "authenticationFailure");
  +[NSPAnisette authenticationFailure](NSPAnisette, "authenticationFailure");
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
  id v16;
  id v17;
  id v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  uint64_t v26;
  NSObject *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  void (**v38)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __int128 buf;
  void (*v40)(uint64_t, uint64_t);
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v12;
  if (!v9)
  {
    v26 = nplog_obj(v12, v13, v14);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:c"
                                      "ompletionHandler:]";
      v28 = "%s called with null urlRequest";
      goto LABEL_13;
    }
LABEL_11:

    v15[2](v15, 1, 0, 0, 0);
    goto LABEL_5;
  }
  if (!v10)
  {
    v29 = nplog_obj(v12, v13, v14);
    v27 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:c"
                                      "ompletionHandler:]";
      v28 = "%s called with null tokenFetchURLSession";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!v11)
  {
    v30 = nplog_obj(v12, v13, v14);
    v27 = objc_claimAutoreleasedReturnValue(v30);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:tokenActivationQuery:com"
                                    "pletionHandler:]";
    v28 = "%s called with null tokenActivationQuery";
LABEL_13:
    _os_log_fault_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_FAULT, v28, (uint8_t *)&buf, 0xCu);
    goto LABEL_11;
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000A7B40;
  v34[3] = &unk_1000F70A0;
  v33 = v9;
  v35 = v9;
  v32 = v10;
  v36 = v10;
  v31 = v11;
  v37 = v11;
  v38 = v15;
  v16 = v35;
  v17 = v36;
  v18 = v37;
  v19 = v34;
  objc_opt_self(NSPBAA);
  objc_msgSend(v18, "setAuthType:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "tokenInfo"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "data"));
  *(_QWORD *)&buf = _NSConcreteStackBlock;
  *((_QWORD *)&buf + 1) = 3221225472;
  v40 = sub_1000A6E6C;
  v41 = &unk_1000F7028;
  v22 = v18;
  v42 = v22;
  v23 = v16;
  v43 = v23;
  v24 = v17;
  v44 = v24;
  v25 = v19;
  v45 = v25;
  sub_1000A6328((uint64_t)NSPBAA, v21, &buf);

  v11 = v31;
  v9 = v33;

  v10 = v32;
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
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  _QWORD *v23;
  id v24;
  id v25;
  id v26;
  _QWORD *v27;
  id v28;
  uint64_t v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  void (**v38)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  __int128 buf;
  void (*v40)(uint64_t, int);
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v15 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v12;
  if (!v9)
  {
    v29 = nplog_obj(v12, v13, v14);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
      v31 = "%s called with null urlRequest";
      goto LABEL_13;
    }
LABEL_11:

    v15[2](v15, 1, 0, 0, 0);
    goto LABEL_5;
  }
  if (!v10)
  {
    v32 = nplog_obj(v12, v13, v14);
    v30 = objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
      v31 = "%s called with null tokenFetchURLSession";
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (!v11)
  {
    v33 = nplog_obj(v12, v13, v14);
    v30 = objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      goto LABEL_11;
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "+[NSPBAA_Anisette sendRequestForTokens:tokenFetchURLSession:messageBody:completionHandler:]";
    v31 = "%s called with null messageBody";
LABEL_13:
    _os_log_fault_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, v31, (uint8_t *)&buf, 0xCu);
    goto LABEL_11;
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_1000A7F10;
  v34[3] = &unk_1000F70A0;
  v35 = v9;
  v36 = v10;
  v37 = v11;
  v38 = v15;
  v16 = v35;
  v17 = v36;
  v18 = v37;
  v19 = v11;
  v20 = v10;
  v21 = v9;
  v22 = v15;
  v23 = v34;
  objc_opt_self(NSPBAA);
  *(_QWORD *)&buf = _NSConcreteStackBlock;
  *((_QWORD *)&buf + 1) = 3221225472;
  v40 = sub_1000A76D4;
  v41 = &unk_1000F7078;
  v24 = v16;
  v42 = v24;
  v25 = v18;
  v43 = v25;
  v26 = v17;
  v44 = v26;
  v27 = v23;
  v15 = v22;
  v9 = v21;
  v10 = v20;
  v11 = v19;
  v28 = v27;
  v45 = v27;
  sub_1000A6F88((uint64_t)NSPBAA, v25, v24, &buf);

LABEL_5:
}

@end
