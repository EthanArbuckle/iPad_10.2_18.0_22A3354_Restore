@implementation RadioURLConnectionRequest

- (void)startWithConnectionResponseBlock:(id)a3
{
  id v3;
  objc_super v4;
  _QWORD v5[4];
  RadioURLConnectionRequest *v6;
  id v7;

  v5[1] = 3221225472;
  v5[2] = __62__RadioURLConnectionRequest_startWithConnectionResponseBlock___block_invoke;
  v5[3] = &unk_24CA2EA00;
  v6 = self;
  v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)RadioURLConnectionRequest;
  v5[0] = MEMORY[0x24BDAC760];
  v3 = v7;
  -[SSURLConnectionRequest startWithConnectionResponseBlock:](&v4, sel_startWithConnectionResponseBlock_, v5);

}

void __62__RadioURLConnectionRequest_startWithConnectionResponseBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint8_t buf[16];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = objc_msgSend(v5, "statusCode");
  }
  else
  {
    objc_msgSend(v6, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BEB24A8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "integerValue");

  }
  if (v8 == 401
    && (objc_msgSend(MEMORY[0x24BEB1D88], "defaultStore"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "activeAccount"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v12))
  {
    v13 = os_log_create("com.apple.amp.radio", "Requests");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2105F8000, v13, OS_LOG_TYPE_ERROR, "[RadioURLConnectionRequest] Authenticating for 401 response...", buf, 2u);
    }

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1F28]), "initWithAccount:", v12);
    objc_msgSend(v14, "setAccountNameEditable:", 0);
    objc_msgSend(v14, "setPromptStyle:", 1);
    objc_msgSend(v14, "setAllowsSilentAuthentication:", 1);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB1DB8]), "initWithAuthenticationContext:", v14);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __62__RadioURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_3;
    v19[3] = &unk_24CA2E5C8;
    v16 = *(id *)(a1 + 40);
    v17 = *(_QWORD *)(a1 + 32);
    v22 = v16;
    v19[4] = v17;
    v20 = v5;
    v21 = v7;
    objc_msgSend(v15, "startWithAuthenticateResponseBlock:", v19);

  }
  else
  {
    v18 = *(_QWORD *)(a1 + 40);
    if (v18)
      (*(void (**)(uint64_t, id, void *))(v18 + 16))(v18, v5, v7);
  }

}

void __62__RadioURLConnectionRequest_startWithConnectionResponseBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = os_log_create("com.apple.amp.radio", "Requests");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v12 = objc_msgSend(v3, "authenticateResponseType");
    _os_log_impl(&dword_2105F8000, v4, OS_LOG_TYPE_ERROR, "[RadioURLConnectionRequest] Authentication response type: %ld", buf, 0xCu);
  }

  v5 = objc_msgSend(v3, "authenticateResponseType");
  v6 = os_log_create("com.apple.amp.radio", "Requests");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (v5 == 4)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2105F8000, v6, OS_LOG_TYPE_ERROR, "[RadioURLConnectionRequest] Retrying request after authentication...", buf, 2u);
    }

    v8 = *(_QWORD *)(a1 + 56);
    v10.receiver = *(id *)(a1 + 32);
    v10.super_class = (Class)RadioURLConnectionRequest;
    objc_msgSendSuper2(&v10, sel_startWithConnectionResponseBlock_, v8);
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2105F8000, v6, OS_LOG_TYPE_ERROR, "[RadioURLConnectionRequest] Authentication failed, not retrying.", buf, 2u);
    }

    v9 = *(_QWORD *)(a1 + 56);
    if (v9)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

@end
