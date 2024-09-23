@implementation MSDServer

- (void)sendQueryForRequest:(id)a3 toPath:(id)a4 maxRetry:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  MSDServerResponse *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v8 = a3;
  v9 = a4;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000775FC;
  v26[3] = &unk_10013F228;
  v10 = v8;
  v27 = v10;
  v11 = objc_retainBlock(v26);
  if ((objc_msgSend(v10, "isValid") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getQueryItems"));

    if (v12)
    {
      if (v9)
      {
        v13 = objc_alloc_init((Class)NSURLComponents);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "getQueryItems"));
        objc_msgSend(v13, "setQueryItems:", v14);

        objc_msgSend(v13, "setPath:", v9);
        v15 = (MSDServerResponse *)objc_claimAutoreleasedReturnValue(-[MSDServer taskInfoFromCommandRequest:](self, "taskInfoFromCommandRequest:", v10));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URL"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "absoluteString"));
        -[MSDServerResponse setEndpoint:](v15, "setEndpoint:", v17);

        -[MSDServerResponse setMaxRetry:](v15, "setMaxRetry:", a5);
        -[MSDServerResponse setHandler:](v15, "setHandler:", v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDServer session](self, "session"));
        objc_msgSend(v18, "launchTaskWithInfo:", v15);

        v19 = 0;
        goto LABEL_5;
      }
      v23 = sub_1000604F0();
      v21 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1000C42C8(v10);
    }
    else
    {
      v22 = sub_1000604F0();
      v21 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_1000C4250(v10);
    }
  }
  else
  {
    v20 = sub_1000604F0();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_1000C4340(v10);
  }

  v25 = 0;
  sub_1000B63A4(&v25, 3727744769, (uint64_t)CFSTR("Input is invalid"));
  v19 = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "completion"));

  if (!v24)
    goto LABEL_6;
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "completion"));
  v15 = -[MSDServerResponse initWithError:]([MSDServerResponse alloc], "initWithError:", v19);
  (*((void (**)(id, MSDServerResponse *))v13 + 2))(v13, v15);
LABEL_5:

LABEL_6:
}

- (void)sendRequest:(id)a3 toEndpoint:(id)a4 postData:(BOOL)a5 maxRetry:(int64_t)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void (**v17)(_QWORD, _QWORD);
  void (**v18)(_QWORD, _QWORD);
  MSDServerResponse *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100077910;
  v26[3] = &unk_10013F228;
  v12 = v10;
  v27 = v12;
  v13 = objc_retainBlock(v26);
  if ((objc_msgSend(v12, "isValid") & 1) == 0)
  {
    v21 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C4340(v12);
    goto LABEL_14;
  }
  if (v7)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "getPostData"));
    if (!v14)
    {
      v15 = sub_1000604F0();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000C43B8(v12);
LABEL_14:
      v14 = 0;
      goto LABEL_19;
    }
  }
  else
  {
    v14 = 0;
  }
  if (v11)
  {
    v17 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MSDServer taskInfoFromCommandRequest:](self, "taskInfoFromCommandRequest:", v12));
    if (v17)
    {
      v18 = v17;
      objc_msgSend(v17, "setEndpoint:", v11);
      objc_msgSend(v18, "setMaxRetry:", a6);
      objc_msgSend(v18, "setPostData:", v14);
      objc_msgSend(v18, "setHandler:", v13);
      v19 = (MSDServerResponse *)objc_claimAutoreleasedReturnValue(-[MSDServer session](self, "session"));
      -[MSDServerResponse launchTaskWithInfo:](v19, "launchTaskWithInfo:", v18);
      v20 = 0;
      goto LABEL_10;
    }
    v23 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C44A8(v12);
  }
  else
  {
    v22 = sub_1000604F0();
    v16 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_1000C4430(v12);
  }
LABEL_19:

  v25 = 0;
  sub_1000B63A4(&v25, 3727744769, (uint64_t)CFSTR("Input is invalid"));
  v20 = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completion"));

  if (!v24)
    goto LABEL_11;
  v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completion"));
  v19 = -[MSDServerResponse initWithError:]([MSDServerResponse alloc], "initWithError:", v20);
  ((void (**)(_QWORD, MSDServerResponse *))v18)[2](v18, v19);
LABEL_10:

LABEL_11:
}

- (id)taskInfoFromCommandRequest:(id)a3
{
  return 0;
}

- (MSDSession)session
{
  return (MSDSession *)objc_getProperty(self, a2, 8, 1);
}

- (void)setSession:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);
}

@end
