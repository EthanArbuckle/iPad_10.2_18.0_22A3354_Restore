@implementation HAPAuthSession

- (HAPAuthSession)initWithRole:(int64_t)a3 instanceId:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  void *v11;
  HAPAuthSession *v12;
  HAPAuthSession *v13;
  const char *v14;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *workQueue;
  HAPAuthSession *v19;
  HAPAuthSession *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  __CFString *v24;
  void *v25;
  HAPAuthSession *v26;
  HAPAuthSession *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  __CFString *v31;
  void *v32;
  objc_super v34;
  uint8_t buf[4];
  void *v36;

  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    if ((objc_msgSend(v10, "conformsToProtocol:", &OBJC_PROTOCOL___HAPAuthSessionDelegate) & 1) != 0)
    {
      v34.receiver = self;
      v34.super_class = (Class)HAPAuthSession;
      v12 = -[HAPAuthSession init](&v34, "init");
      v13 = v12;
      if (v12)
      {
        v14 = (const char *)sub_100015E90(v12, 0);
        v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        v17 = dispatch_queue_create(v14, v16);
        workQueue = v13->_workQueue;
        v13->_workQueue = (OS_dispatch_queue *)v17;

        v13->_role = a3;
        objc_storeStrong((id *)&v13->_instanceId, a4);
        objc_storeWeak((id *)&v13->_delegate, v11);
        v13->_currentState = 0;
        -[HAPAuthSession _resetSession](v13, "_resetSession");
      }
      v19 = v13;
    }
    else
    {
      v27 = self;
      v29 = sub_10007CCE4((uint64_t)v27, v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = sub_10007CD2C(v27);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
        *(_DWORD *)buf = 138543362;
        v36 = v32;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@Delegate must confirm to the HAPAuthSessionDelegate protocol", buf, 0xCu);

      }
      v19 = v27;
    }
    v20 = v19;
    v26 = v19;
  }
  else
  {
    v20 = self;
    v22 = sub_10007CCE4((uint64_t)v20, v21);
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = sub_10007CD2C(v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      *(_DWORD *)buf = 138543362;
      v36 = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@A valid delegate is required.", buf, 0xCu);

    }
    v26 = 0;
  }

  return v26;
}

- (void)_resetSession
{
  int64_t v3;
  HAPAuthSession *v4;
  uint64_t v5;
  HAPAuthSession *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  int64_t v15;

  -[HAPAuthSession setToken2:](self, "setToken2:", 0);
  -[HAPAuthSession setToken1:](self, "setToken1:", 0);
  v3 = -[HAPAuthSession role](self, "role");
  if (v3 == 1)
  {
    v4 = self;
    v5 = 2;
    goto LABEL_5;
  }
  if (!v3)
  {
    v4 = self;
    v5 = 1;
LABEL_5:
    -[HAPAuthSession setCurrentState:](v4, "setCurrentState:", v5);
    return;
  }
  v6 = self;
  v8 = sub_10007CCE4((uint64_t)v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = sub_10007CD2C(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = 138543618;
    v13 = v11;
    v14 = 2048;
    v15 = -[HAPAuthSession role](v6, "role");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@Invalid auth session role: %tu", (uint8_t *)&v12, 0x16u);

  }
}

- (void)_reportAuthFailure
{
  void *v3;
  char v4;
  void *v5;
  HAPAuthSession *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;

  -[HAPAuthSession _resetSession](self, "_resetSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "authSession:authComplete:");

  if ((v4 & 1) != 0)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[HAPAuthSession delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("HAPErrorDomain"), 17, 0));
    objc_msgSend(v12, "authSession:authComplete:", self, v5);

  }
  else
  {
    v6 = self;
    v8 = sub_10007CCE4((uint64_t)v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = sub_10007CD2C(v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138543362;
      v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement authComplete:", buf, 0xCu);

    }
  }
}

- (void)resetSession
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[HAPAuthSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F5F0;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)handleAuthExchangeData:(id)a3 withHeader:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  v7 = objc_claimAutoreleasedReturnValue(-[HAPAuthSession workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F698;
  block[3] = &unk_100236BE0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_handleAuthExchangeData:(id)a3 withHeader:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HAPAuthSession *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  unint64_t v16;

  v4 = a4;
  v6 = a3;
  switch(-[HAPAuthSession currentState](self, "currentState"))
  {
    case 0uLL:
    case 2uLL:
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 9uLL:
      v7 = self;
      v9 = sub_10007CCE4((uint64_t)v7, v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = sub_10007CD2C(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = 138543618;
        v14 = v12;
        v15 = 2048;
        v16 = -[HAPAuthSession currentState](v7, "currentState");
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@Unhandled state: %tu", (uint8_t *)&v13, 0x16u);

      }
      break;
    case 1uLL:
      -[HAPAuthSession _sendTokenRequest](self, "_sendTokenRequest");
      break;
    case 4uLL:
      -[HAPAuthSession _handleTokenResponse:withHeader:](self, "_handleTokenResponse:withHeader:", v6, v4);
      break;
    case 8uLL:
      -[HAPAuthSession _handleTokenUpdateResponse:withHeader:](self, "_handleTokenUpdateResponse:withHeader:", v6, v4);
      break;
    default:
      break;
  }

}

- (void)continueAuthAfterValidation:(BOOL)a3
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = objc_claimAutoreleasedReturnValue(-[HAPAuthSession workQueue](self, "workQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001F86C;
  v6[3] = &unk_100236C08;
  v7 = a3;
  v6[4] = self;
  dispatch_async(v5, v6);

}

- (void)_sendTokenRequest
{
  void *v3;
  void *v4;
  HAPAuthSession *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  HAPAuthSession *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  __CFString *v23;
  unsigned __int8 v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;

  v24 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession instanceId](self, "instanceId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[HAPProtocolMessages constructTokenRequest:outTID:](HAPProtocolMessages, "constructTokenRequest:outTID:", v3, &v24));

  if (!v4)
  {
    v14 = self;
    v16 = sub_10007CCE4((uint64_t)v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = sub_10007CD2C(v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138543362;
      v26 = v19;
      v20 = "%{public}@Failed constructing token request";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v20, buf, 0xCu);

    }
LABEL_11:

    -[HAPAuthSession _reportAuthFailure](v14, "_reportAuthFailure");
    goto LABEL_12;
  }
  -[HAPAuthSession setCurrentState:](self, "setCurrentState:", 4);
  -[HAPAuthSession setCurrentTID:](self, "setCurrentTID:", v24);
  v5 = self;
  v7 = sub_10007CCE4((uint64_t)v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = sub_10007CD2C(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    *(_DWORD *)buf = 138543618;
    v26 = v10;
    v27 = 2112;
    v28 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%{public}@Sending Token Request: %@", buf, 0x16u);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession delegate](v5, "delegate"));
  v12 = objc_opt_respondsToSelector(v11, "authSession:sendAuthExchangeData:");

  if ((v12 & 1) == 0)
  {
    v14 = v5;
    v22 = sub_10007CCE4((uint64_t)v14, v21);
    v17 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v23 = sub_10007CD2C(v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v23);
      *(_DWORD *)buf = 138543362;
      v26 = v19;
      v20 = "%{public}@Delegate does not implement sendAuthExchangeData:";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession delegate](v5, "delegate"));
  objc_msgSend(v13, "authSession:sendAuthExchangeData:", v5, v4);

LABEL_12:
}

- (void)_handleTokenResponse:(id)a3 withHeader:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  HAPAuthSession *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  const __CFString *v13;
  unsigned int v14;
  id v15;
  id v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  HAPAuthSession *v22;
  uint64_t v23;
  id v24;
  NSObject *v25;
  __CFString *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  id v30;
  __CFString *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  const __CFString *v39;

  v4 = a4;
  v6 = a3;
  v7 = self;
  v9 = sub_10007CCE4((uint64_t)v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = sub_10007CD2C(v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = CFSTR("No");
    *(_DWORD *)buf = 138543874;
    v35 = v12;
    v36 = 2112;
    if (v4)
      v13 = CFSTR("Yes");
    v37 = v6;
    v38 = 2112;
    v39 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@Received Token Response: %@ withHeader: %@", buf, 0x20u);

  }
  v32 = 0;
  v33 = 0;
  v14 = +[HAPProtocolMessages parseTokenResponse:expectedTID:withHeader:outToken:outUUID:](HAPProtocolMessages, "parseTokenResponse:expectedTID:withHeader:outToken:outUUID:", v6, -[HAPAuthSession currentTID](v7, "currentTID"), v4, &v33, &v32);
  v15 = v33;
  v16 = v32;
  if (!v14)
  {
    v22 = v7;
    v24 = sub_10007CCE4((uint64_t)v22, v23);
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = sub_10007CD2C(v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      *(_DWORD *)buf = 138543362;
      v35 = v27;
      v28 = "%{public}@Failed to parse token response";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, v28, buf, 0xCu);

    }
LABEL_13:

    -[HAPAuthSession _reportAuthFailure](v22, "_reportAuthFailure");
    goto LABEL_14;
  }
  -[HAPAuthSession setCurrentState:](v7, "setCurrentState:", 5);
  -[HAPAuthSession setToken1:](v7, "setToken1:", v15);
  -[HAPAuthSession setProvisionUUID:](v7, "setProvisionUUID:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession delegate](v7, "delegate"));
  v18 = objc_opt_respondsToSelector(v17, "authSession:validateUUID:token:");

  if ((v18 & 1) == 0)
  {
    v22 = v7;
    v30 = sub_10007CCE4((uint64_t)v22, v29);
    v25 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v31 = sub_10007CD2C(v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue(v31);
      *(_DWORD *)buf = 138543362;
      v35 = v27;
      v28 = "%{public}@Delegate does not implement validateUUID:token:";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession delegate](v7, "delegate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession provisionUUID](v7, "provisionUUID"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession token1](v7, "token1"));
  objc_msgSend(v19, "authSession:validateUUID:token:", v7, v20, v21);

LABEL_14:
}

- (void)sendTokenUpdateRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPAuthSession workQueue](self, "workQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001FFC8;
  v7[3] = &unk_100236AD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_sendTokenUpdateRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  HAPAuthSession *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  __CFString *v19;
  void *v20;
  const char *v21;
  __CFString *v22;
  unsigned __int8 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;

  v4 = a3;
  v23 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession instanceId](self, "instanceId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HAPProtocolMessages constructTokenUpdateRequest:token:outTID:](HAPProtocolMessages, "constructTokenUpdateRequest:token:outTID:", v5, v4, &v23));

  if (!v6)
  {
    v9 = self;
    v18 = sub_10007CCE4((uint64_t)v9, v17);
    v13 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v19 = sub_10007CD2C(v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      *(_DWORD *)buf = 138543362;
      v25 = v20;
      v21 = "%{public}@Failed constructing token request";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, v21, buf, 0xCu);

    }
LABEL_11:

    -[HAPAuthSession _reportAuthFailure](v9, "_reportAuthFailure");
    goto LABEL_12;
  }
  -[HAPAuthSession setToken1:](self, "setToken1:", v4);
  -[HAPAuthSession setCurrentTID:](self, "setCurrentTID:", v23);
  -[HAPAuthSession setCurrentState:](self, "setCurrentState:", 8);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "authSession:sendAuthExchangeData:");

  v9 = self;
  v11 = sub_10007CCE4((uint64_t)v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if ((v8 & 1) == 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v22 = sub_10007CD2C(v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 138543362;
      v25 = v20;
      v21 = "%{public}@[HAPAuthSession] Delegate does not implement sendAuthExchangeData:";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v14 = sub_10007CD2C(v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    *(_DWORD *)buf = 138543618;
    v25 = v15;
    v26 = 2112;
    v27 = v6;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@Sending Token Update Request: %@", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession delegate](v9, "delegate"));
  objc_msgSend(v16, "authSession:sendAuthExchangeData:", v9, v6);

LABEL_12:
}

- (BOOL)getToken:(id *)a3 uuid:(id *)a4
{
  NSObject *v7;
  char v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_1000203A8;
  v25 = sub_1000203B8;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1000203A8;
  v19 = sub_1000203B8;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = objc_claimAutoreleasedReturnValue(-[HAPAuthSession workQueue](self, "workQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000203C0;
  v10[3] = &unk_100236C30;
  v10[4] = self;
  v10[5] = &v21;
  v10[6] = &v15;
  v10[7] = &v11;
  dispatch_sync(v7, v10);

  if (a3)
    *a3 = objc_retainAutorelease((id)v22[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v8 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v8;
}

- (void)_handleTokenUpdateResponse:(id)a3 withHeader:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  HAPAuthSession *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  HAPAuthSession *v17;
  uint64_t v18;
  id v19;
  NSObject *v20;
  __CFString *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;

  v4 = a4;
  v6 = a3;
  LODWORD(v4) = +[HAPProtocolMessages parseTokenUpdateResponse:expectedTID:withHeader:](HAPProtocolMessages, "parseTokenUpdateResponse:expectedTID:withHeader:", v6, -[HAPAuthSession currentTID](self, "currentTID"), v4);

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "authSession:confirmUUID:token:");

    if ((v8 & 1) != 0)
    {
      v23 = (id)objc_claimAutoreleasedReturnValue(-[HAPAuthSession delegate](self, "delegate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession provisionUUID](self, "provisionUUID"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession token1](self, "token1"));
      objc_msgSend(v23, "authSession:confirmUUID:token:", self, v9, v10);

    }
    else
    {
      v17 = self;
      v19 = sub_10007CCE4((uint64_t)v17, v18);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = sub_10007CD2C(v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        *(_DWORD *)buf = 138543362;
        v25 = v22;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%{public}@Delegate does not implement confirmUUID:token:", buf, 0xCu);

      }
      -[HAPAuthSession _resetSession](v17, "_resetSession");
    }
  }
  else
  {
    v11 = self;
    v13 = sub_10007CCE4((uint64_t)v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = sub_10007CD2C(v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      *(_DWORD *)buf = 138543362;
      v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing token update response", buf, 0xCu);

    }
    -[HAPAuthSession _reportAuthFailure](v11, "_reportAuthFailure");
  }
}

+ (id)logCategory
{
  if (qword_100271668 != -1)
    dispatch_once(&qword_100271668, &stru_100236C50);
  return (id)qword_100271670;
}

- (id)logIdentifier
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPAuthSession delegate](self, "delegate"));
  v6 = objc_opt_class(HAPAccessoryServer, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
    v7 = v4;
  else
    v7 = 0;
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v3, v9));

  return v10;
}

- (HAPAuthSessionDelegate)delegate
{
  return (HAPAuthSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)role
{
  return self->_role;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (unint64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(unint64_t)a3
{
  self->_currentState = a3;
}

- (unsigned)currentTID
{
  return self->_currentTID;
}

- (void)setCurrentTID:(unsigned __int8)a3
{
  self->_currentTID = a3;
}

- (NSNumber)instanceId
{
  return self->_instanceId;
}

- (void)setInstanceId:(id)a3
{
  objc_storeStrong((id *)&self->_instanceId, a3);
}

- (NSData)token1
{
  return self->_token1;
}

- (void)setToken1:(id)a3
{
  objc_storeStrong((id *)&self->_token1, a3);
}

- (NSData)token2
{
  return self->_token2;
}

- (void)setToken2:(id)a3
{
  objc_storeStrong((id *)&self->_token2, a3);
}

- (NSUUID)provisionUUID
{
  return self->_provisionUUID;
}

- (void)setProvisionUUID:(id)a3
{
  objc_storeStrong((id *)&self->_provisionUUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provisionUUID, 0);
  objc_storeStrong((id *)&self->_token2, 0);
  objc_storeStrong((id *)&self->_token1, 0);
  objc_storeStrong((id *)&self->_instanceId, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
