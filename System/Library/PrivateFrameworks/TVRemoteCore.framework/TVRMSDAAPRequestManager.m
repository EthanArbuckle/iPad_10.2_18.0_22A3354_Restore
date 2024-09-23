@implementation TVRMSDAAPRequestManager

- (TVRMSDAAPRequestManager)init
{
  TVRMSDAAPRequestManager *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSURLSession *urlSession;
  objc_super v13;
  _QWORD v14[5];
  _QWORD v15[6];

  v15[5] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)TVRMSDAAPRequestManager;
  v2 = -[TVRMSDAAPRequestManager init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d.%d"), 3, 12);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld.%ld"), 3, 10);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld.%ld"), 1, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = CFSTR("Accept-Encoding");
    v14[1] = CFSTR("Viewer-Only-Client");
    v15[0] = CFSTR("gzip");
    v15[1] = CFSTR("1");
    v14[2] = CFSTR("Client-DAAP-Version");
    v14[3] = CFSTR("Client-iTunes-Sharing-Version");
    v15[2] = v3;
    v15[3] = v4;
    v14[4] = CFSTR("Client-ATV-Sharing-Version");
    v15[4] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHTTPAdditionalHeaders:", v7);

    v8 = (void *)MEMORY[0x24BDD1850];
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sessionWithConfiguration:delegate:delegateQueue:", v6, 0, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    urlSession = v2->_urlSession;
    v2->_urlSession = (NSURLSession *)v10;

  }
  return v2;
}

- (id)requestWithPath:(id)a3 method:(id)a4 postData:(id)a5 queryArgs:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  NSString *homeSharingGroupKey;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  NSString *pairingGUID;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  TVRMSFairPlaySession *fairPlaySession;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  void *v47;
  NSURLSession *urlSession;
  id v49;
  id v50;
  void *v51;
  _QWORD v53[4];
  id v54;
  TVRMSDAAPRequestManager *v55;
  id v56;
  _QWORD v57[5];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  const __CFString *v68;
  NSString *v69;
  const __CFString *v70;
  NSString *v71;
  const __CFString *v72;
  _QWORD v73[4];

  v73[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__0;
  v62 = __Block_byref_object_dispose__0;
  v63 = (id)objc_opt_new();
  objc_msgSend((id)v59[5], "setScheme:", CFSTR("http"));
  objc_msgSend((id)v59[5], "setHost:", self->_hostName);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_port);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v59[5], "setPort:", v17);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/%@"), v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v59[5], "setPath:", v18);

  if (self->_sessionIdentifier)
  {
    v19 = (void *)v59[5];
    v72 = CFSTR("session-id");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v73[0] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "rms_componentsByAddingQueryParameters:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v59[5];
    v59[5] = v22;

  }
  homeSharingGroupKey = self->_homeSharingGroupKey;
  if (homeSharingGroupKey)
  {
    v25 = (void *)v59[5];
    v70 = CFSTR("hsgid");
    v71 = homeSharingGroupKey;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "rms_componentsByAddingQueryParameters:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)v59[5];
    v59[5] = v27;

  }
  pairingGUID = self->_pairingGUID;
  if (pairingGUID)
  {
    v30 = (void *)v59[5];
    v68 = CFSTR("pairing-guid");
    v69 = pairingGUID;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "rms_componentsByAddingQueryParameters:", v31);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v59[5];
    v59[5] = v32;

  }
  v34 = MEMORY[0x24BDAC760];
  v57[0] = MEMORY[0x24BDAC760];
  v57[1] = 3221225472;
  v57[2] = __87__TVRMSDAAPRequestManager_requestWithPath_method_postData_queryArgs_completionHandler___block_invoke;
  v57[3] = &unk_24DCD7408;
  v57[4] = &v58;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v57);
  v35 = (void *)MEMORY[0x24BDD16B0];
  objc_msgSend((id)v59[5], "URL");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "requestWithURL:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "setHTTPMethod:", v13);
  objc_msgSend(v37, "setHTTPBody:", v14);
  if (-[TVRMSFairPlaySession isHandshakeComplete](self->_fairPlaySession, "isHandshakeComplete"))
  {
    fairPlaySession = self->_fairPlaySession;
    objc_msgSend((id)v59[5], "URL");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRMSFairPlaySession headerForURL:](fairPlaySession, "headerForURL:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "addValue:forHTTPHeaderField:", v40, CFSTR("Client-DAAP-Validation"));
  }
  _TVRCRMSLog();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    v42 = v12;
    v43 = v15;
    v44 = v14;
    v45 = v16;
    objc_msgSend((id)v59[5], "URL");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "absoluteString");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v65 = v13;
    v66 = 2112;
    v67 = v47;
    _os_log_impl(&dword_21A51B000, v41, OS_LOG_TYPE_DEFAULT, "%@/ %@", buf, 0x16u);

    v16 = v45;
    v14 = v44;
    v15 = v43;
    v12 = v42;
    v34 = MEMORY[0x24BDAC760];

  }
  urlSession = self->_urlSession;
  v53[0] = v34;
  v53[1] = 3221225472;
  v53[2] = __87__TVRMSDAAPRequestManager_requestWithPath_method_postData_queryArgs_completionHandler___block_invoke_37;
  v53[3] = &unk_24DCD7430;
  v49 = v12;
  v54 = v49;
  v50 = v16;
  v55 = self;
  v56 = v50;
  -[NSURLSession dataTaskWithRequest:completionHandler:](urlSession, "dataTaskWithRequest:completionHandler:", v37, v53);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "resume");

  _Block_object_dispose(&v58, 8);
  return v51;
}

void __87__TVRMSDAAPRequestManager_requestWithPath_method_postData_queryArgs_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v13 = a2;
  v14[0] = a3;
  v6 = (void *)MEMORY[0x24BDBCE70];
  v7 = a3;
  v8 = a2;
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rms_componentsByAddingQueryParameters:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

}

void __87__TVRMSDAAPRequestManager_requestWithPath_method_postData_queryArgs_completionHandler___block_invoke_37(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *WeakRetained;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(void);
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v8;
  if (v9)
  {
    v11 = objc_msgSend(v9, "code");
    if (v11 != -1001)
    {
      if (v11 == -999)
      {
        _TVRCRMSLog();
        WeakRetained = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
        {
          v13 = a1[4];
          v27 = 138412290;
          v28 = v13;
          _os_log_impl(&dword_21A51B000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Request was cancelled: %@", (uint8_t *)&v27, 0xCu);
        }
      }
      else
      {
        _TVRCRMSLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v23 = a1[4];
          v27 = 138412546;
          v28 = (uint64_t)v9;
          v29 = 2112;
          v30 = v23;
          _os_log_impl(&dword_21A51B000, v22, OS_LOG_TYPE_DEFAULT, "Unexpected error [%@]: %@", (uint8_t *)&v27, 0x16u);
        }

        v24 = a1[6];
        if (v24)
          (*(void (**)(uint64_t, uint64_t, _QWORD))(v24 + 16))(v24, -1, 0);
        WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 56));
        -[NSObject requestManagerFailedWithUnknownError:](WeakRetained, "requestManagerFailedWithUnknownError:", a1[5]);
      }
LABEL_27:

      goto LABEL_28;
    }
    _TVRCRMSLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = a1[4];
      v27 = 138412290;
      v28 = v20;
      _os_log_impl(&dword_21A51B000, v19, OS_LOG_TYPE_DEFAULT, "Request timed out: %@", (uint8_t *)&v27, 0xCu);
    }

    v21 = a1[6];
    if (v21)
    {
      v18 = *(void (**)(void))(v21 + 16);
      goto LABEL_15;
    }
  }
  else
  {
    _TVRCRMSLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v10, "statusCode");
      v16 = a1[4];
      v27 = 134218242;
      v28 = v15;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_21A51B000, v14, OS_LOG_TYPE_DEFAULT, "HTTP response code [%td] for [%@]", (uint8_t *)&v27, 0x16u);
    }

    if (objc_msgSend(v10, "statusCode") > 299)
    {
      if (objc_msgSend(v10, "statusCode") == 401
        || objc_msgSend(v10, "statusCode") == 403
        || objc_msgSend(v10, "statusCode") == 503)
      {
        v25 = a1[6];
        if (v25)
          (*(void (**)(uint64_t, uint64_t, id))(v25 + 16))(v25, -2, v7);
        WeakRetained = objc_loadWeakRetained((id *)(a1[5] + 56));
        -[NSObject requestManagerFailedWithUnauthorizedError:](WeakRetained, "requestManagerFailedWithUnauthorizedError:", a1[5]);
        goto LABEL_27;
      }
      v26 = a1[6];
      if (!v26)
        goto LABEL_28;
      v18 = *(void (**)(void))(v26 + 16);
      goto LABEL_15;
    }
    v17 = a1[6];
    if (v17)
    {
      v18 = *(void (**)(void))(v17 + 16);
LABEL_15:
      v18();
    }
  }
LABEL_28:

}

- (id)requestControlCommand:(id)a3 text:(id)a4 promptRevision:(int64_t)a5 completionHandler:(id)a6
{
  return -[TVRMSDAAPRequestManager requestControlCommand:text:data:controlValue:promptRevision:completionHandler:](self, "requestControlCommand:text:data:controlValue:promptRevision:completionHandler:", a3, a4, 0, 0, a5, a6);
}

- (id)requestControlCommand:(id)a3 text:(id)a4 data:(id)a5 controlValue:(int64_t)a6 promptRevision:(int64_t)a7 completionHandler:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v29;
  _QWORD v30[4];
  id v31;
  const __CFString *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s/1/%s"), "ctrl-int", "controlpromptentry");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_new();
  v19 = v18;
  if (v13)
    objc_msgSend(v18, "encodeString:forCode:", v13, 1668112997);
  if (v14)
    objc_msgSend(v19, "encodeString:forCode:", v14, 1668117605);
  v29 = v13;
  if (v15)
    objc_msgSend(v19, "encodeData:forCode:", v15, 1668112741);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringValue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "encodeString:forCode:", v21, 1668113251);
  objc_msgSend(v19, "data");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = CFSTR("prompt-id");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a7);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __105__TVRMSDAAPRequestManager_requestControlCommand_text_data_controlValue_promptRevision_completionHandler___block_invoke;
  v30[3] = &unk_24DCD6FE0;
  v31 = v16;
  v25 = v16;
  -[TVRMSDAAPRequestManager requestWithPath:method:postData:queryArgs:completionHandler:](self, "requestWithPath:method:postData:queryArgs:completionHandler:", v17, CFSTR("POST"), v22, v24, v30);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t __105__TVRMSDAAPRequestManager_requestControlCommand_text_data_controlValue_promptRevision_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSString)hostName
{
  return self->_hostName;
}

- (void)setHostName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)pairingGUID
{
  return self->_pairingGUID;
}

- (void)setPairingGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)homeSharingGroupKey
{
  return self->_homeSharingGroupKey;
}

- (void)setHomeSharingGroupKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(int64_t)a3
{
  self->_sessionIdentifier = a3;
}

- (int64_t)port
{
  return self->_port;
}

- (void)setPort:(int64_t)a3
{
  self->_port = a3;
}

- (TVRMSDAAPRequestManagerDelegate)delegate
{
  return (TVRMSDAAPRequestManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRMSFairPlaySession)fairPlaySession
{
  return self->_fairPlaySession;
}

- (void)setFairPlaySession:(id)a3
{
  objc_storeStrong((id *)&self->_fairPlaySession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fairPlaySession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_homeSharingGroupKey, 0);
  objc_storeStrong((id *)&self->_pairingGUID, 0);
  objc_storeStrong((id *)&self->_hostName, 0);
  objc_storeStrong((id *)&self->_urlSession, 0);
}

@end
