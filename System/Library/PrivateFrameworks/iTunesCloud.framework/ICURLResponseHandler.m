@implementation ICURLResponseHandler

- (void)processInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  id v11;

  v11 = a5;
  v7 = a4;
  v8 = objc_msgSend(a3, "statusCode");
  v9 = objc_msgSend(v7, "cancelOnHTTPErrors");

  if (v8 > 399)
    v10 = v9;
  else
    v10 = 0;
  (*((void (**)(id, uint64_t, _QWORD, _QWORD, _QWORD))v11 + 2))(v11, v10, 0, 0, 0);

}

- (void)processCompletedResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  ICURLResponseHandler *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "statusCode");
  ICURLResponseStatusCodeGetExtendedDescription(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "authenticationProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v11 & 0xFFFFFFFFFFFFFFFDLL) == 0x191 && v14)
  {
    v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v29 = self;
      v30 = 2114;
      v31 = v9;
      v32 = 2114;
      v33 = v12;
      _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ attempting re-authentication for HTTP response code %{public}@.", buf, 0x20u);
    }

    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __81__ICURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke;
    v24[3] = &unk_1E438E350;
    v24[4] = self;
    v25 = v9;
    v26 = v12;
    v27 = v10;
    objc_msgSend(v14, "performAuthenticationToHandleResponse:toRequest:withCompletionHandler:", v8, v25, v24);

  }
  else
  {
    v16 = objc_msgSend(v9, "handlingType");
    objc_msgSend(v9, "retryReason");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(v9, "error");
      v16 = objc_claimAutoreleasedReturnValue();

      if (v11 == 502 || v16)
      {
        +[ICEnvironmentMonitor sharedMonitor](ICEnvironmentMonitor, "sharedMonitor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isRemoteServerLikelyReachable");

        objc_msgSend(v9, "error");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "code");

        if (v21 != -7100 || (v19 & 1) != 0)
        {

          v17 = CFSTR("other");
          v16 = 2;
        }
        else
        {
          v22 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v29 = self;
            v30 = 2114;
            v31 = v9;
            _os_log_impl(&dword_1A03E3000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ Got connection error and server is not reachable - skipping retry", buf, 0x16u);
          }

          v16 = 0;
        }
      }
    }
    objc_msgSend(v9, "error");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, uint64_t, __CFString *, void *))v10 + 2))(v10, v16, v17, v23);

  }
}

void __81__ICURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke(uint64_t a1, unsigned int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5 && a2)
  {
    v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a1 + 48);
      v15 = 138543874;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      v19 = 2114;
      v20 = v10;
      _os_log_impl(&dword_1A03E3000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ authentication for HTTP response code %{public}@ successful - retrying request", (uint8_t *)&v15, 0x20u);
    }

    v11 = *(_QWORD *)(a1 + 56);
    v12 = CFSTR("authentication-performed");
    v13 = 1;
    goto LABEL_11;
  }
  v13 = a2;
  if (a2)
    v12 = CFSTR("authentication-performed");
  else
    v12 = 0;
  v11 = *(_QWORD *)(a1 + 56);
  if (!v5)
  {
LABEL_11:
    objc_msgSend(*(id *)(a1 + 40), "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, const __CFString *, void *))(v11 + 16))(v11, v13, v12, v14);

    goto LABEL_12;
  }
  (*(void (**)(_QWORD, uint64_t, const __CFString *, id))(v11 + 16))(*(_QWORD *)(a1 + 56), v13, v12, v5);
LABEL_12:

}

@end
