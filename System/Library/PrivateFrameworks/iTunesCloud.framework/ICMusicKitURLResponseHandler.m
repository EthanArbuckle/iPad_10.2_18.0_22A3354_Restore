@implementation ICMusicKitURLResponseHandler

- (void)processCompletedResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;
  NSObject *v23;
  int v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  NSObject *log;
  void *v35;
  id v36;
  void *v37;
  objc_super v38;
  _QWORD v39[5];
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  ICMusicKitURLResponseHandler *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  BOOL v50;
  BOOL v51;
  uint8_t buf[4];
  ICMusicKitURLResponseHandler *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicKitURLResponseHandler.m"), 62, CFSTR("%@ only knows how to process responses for MusicKit requests. %@ is unsupported."), self, v10);

  }
  v12 = objc_msgSend(v10, "handlingType");
  if (!v12)
  {
    v16 = objc_msgSend(v9, "statusCode");
    ICURLResponseStatusCodeGetExtendedDescription(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v10;
    objc_msgSend(v18, "requestContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "personalizationMethod");
    if (v20)
    {
      if (v20 != 1)
      {
        v35 = v19;
        v22 = 0;
        v21 = 0;
        goto LABEL_14;
      }
      v21 = v16 == 403;
      if (v16 != 401)
      {
        v35 = v19;
        v22 = 0;
LABEL_14:
        v24 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      v22 = v16 == 403;
      if (v16 != 401)
      {
        v35 = v19;
        v21 = 0;
        v24 = 1;
LABEL_16:
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __89__ICMusicKitURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke;
        v43[3] = &unk_1E438D378;
        v36 = v18;
        v44 = v18;
        v50 = v22;
        v49 = v11;
        v45 = self;
        v37 = v17;
        v25 = v17;
        v46 = v25;
        v26 = v9;
        v47 = v26;
        v27 = v44;
        v48 = v27;
        v51 = v21;
        v28 = (void *)MEMORY[0x1A1AFA8D0](v43);
        if (v24)
        {
          objc_msgSend(v27, "_pendingEquivalentStoreURLRequest");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "responseHandler");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v29 && v30)
          {
            log = os_log_create("com.apple.amp.iTunesCloud", "Default");
            if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138544130;
              v53 = self;
              v54 = 2114;
              v55 = v31;
              v56 = 2114;
              v57 = v25;
              v58 = 2114;
              v59 = v29;
              _os_log_impl(&dword_1A03E3000, log, OS_LOG_TYPE_DEFAULT, "%{public}@: Deferring to %{public}@ to process completed response with status code %{public}@ for %{public}@.", buf, 0x2Au);
            }

            v39[0] = MEMORY[0x1E0C809B0];
            v39[1] = 3221225472;
            v39[2] = __89__ICMusicKitURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_10;
            v39[3] = &unk_1E43906E0;
            v39[4] = self;
            v40 = v27;
            v41 = v29;
            v42 = v28;
            v32 = v29;
            objc_msgSend(v31, "processCompletedResponse:toRequest:withCompletionHandler:", v26, v32, v39);

            goto LABEL_24;
          }

        }
        v38.receiver = self;
        v38.super_class = (Class)ICMusicKitURLResponseHandler;
        -[ICURLResponseHandler processCompletedResponse:toRequest:withCompletionHandler:](&v38, sel_processCompletedResponse_toRequest_withCompletionHandler_, v26, v27, v28);
LABEL_24:
        v19 = v35;

        v18 = v36;
        v17 = v37;
LABEL_25:

        goto LABEL_26;
      }
    }
    v23 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v53 = self;
      v54 = 2114;
      v55 = v17;
      _os_log_impl(&dword_1A03E3000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating developer token upon processing completed response with status code %{public}@.", buf, 0x16u);
    }

    -[ICMusicKitURLResponseHandler _invalidateDeveloperTokenForInitialResponse:toRequest:withCompletionHandler:](self, "_invalidateDeveloperTokenForInitialResponse:toRequest:withCompletionHandler:", v9, v18, v11);
    goto LABEL_25;
  }
  v13 = v12;
  objc_msgSend(v10, "retryReason");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, uint64_t, void *, void *))v11 + 2))(v11, v13, v14, v15);

LABEL_26:
}

- (void)processInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  ICMusicKitURLResponseHandler *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ICMusicKitURLResponseHandler.m"), 35, CFSTR("%@ only knows how to process responses for MusicKit requests. %@ is unsupported."), self, v10);

  }
  v12 = v10;
  objc_msgSend(v12, "requestContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "personalizationMethod"))
    goto LABEL_10;
  objc_msgSend(v12, "_pendingEquivalentStoreURLRequest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "responseHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v14 || !v15)
  {

LABEL_10:
    v21.receiver = self;
    v21.super_class = (Class)ICMusicKitURLResponseHandler;
    -[ICURLResponseHandler processInitialResponse:toRequest:withCompletionHandler:](&v21, sel_processInitialResponse_toRequest_withCompletionHandler_, v9, v12, v11);
    goto LABEL_11;
  }
  v17 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    ICURLResponseStatusCodeGetExtendedDescription(objc_msgSend(v9, "statusCode"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v27 = self;
    v28 = 2114;
    v29 = v16;
    v30 = 2114;
    v31 = v18;
    v32 = 2114;
    v33 = v14;
    _os_log_impl(&dword_1A03E3000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Deferring to %{public}@ to process initial response with status code %{public}@ for %{public}@.", buf, 0x2Au);

  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __87__ICMusicKitURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke;
  v22[3] = &unk_1E438D350;
  v22[4] = self;
  v23 = v12;
  v24 = v14;
  v25 = v11;
  v19 = v14;
  objc_msgSend(v16, "processInitialResponse:toRequest:withCompletionHandler:", v9, v19, v22);

LABEL_11:
}

void __89__ICMusicKitURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  __CFString *v7;
  id v8;
  __CFString *v9;
  int v10;
  unint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = CFSTR("authentication-performed");
    if (v7 == CFSTR("authentication-performed"))
    {

    }
    else
    {
      v10 = -[__CFString isEqual:](v7, "isEqual:", CFSTR("authentication-performed"));

      if (!v10)
        goto LABEL_7;
    }
    v11 = objc_msgSend(*(id *)(a1 + 32), "_retryCountForReason:", CFSTR("authentication-performed"));
    if (v11 < objc_msgSend(*(id *)(a1 + 32), "_maxRetryCountForReason:", CFSTR("authentication-performed")))
    {
LABEL_21:
      (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
      goto LABEL_22;
    }
  }
LABEL_7:
  if (*(_BYTE *)(a1 + 80))
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(void **)(a1 + 48);
      v26 = 138543618;
      v27 = v13;
      v28 = 2114;
      v29 = v14;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating developer token upon processing completed response with status code %{public}@, after considering generic response handler.", (uint8_t *)&v26, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "_invalidateDeveloperTokenForInitialResponse:toRequest:withCompletionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
    goto LABEL_22;
  }
  if (!*(_BYTE *)(a1 + 81))
  {
    v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    v19 = v18;
    if (v8)
    {
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = *(_QWORD *)(a1 + 32);
        v21 = *(void **)(a1 + 56);
        objc_msgSend(v21, "urlResponse");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "parsedBodyDictionary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138544386;
        v27 = v20;
        v28 = 2114;
        v29 = v21;
        v30 = 2114;
        v31 = v8;
        v32 = 2114;
        v33 = v22;
        v34 = 2114;
        v35 = v23;
        _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Completed processing response %{public}@ with error %{public}@.\nHTTP response=%{public}@\nbody=%{public}@", (uint8_t *)&v26, 0x34u);

      }
    }
    else if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v24 = *(_QWORD *)(a1 + 32);
      v25 = *(void **)(a1 + 56);
      v26 = 138543618;
      v27 = v24;
      v28 = 2114;
      v29 = v25;
      _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Completed processing response %{public}@.", (uint8_t *)&v26, 0x16u);
    }

    goto LABEL_21;
  }
  v15 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 40);
    v17 = *(void **)(a1 + 48);
    v26 = 138543618;
    v27 = v16;
    v28 = 2114;
    v29 = v17;
    _os_log_impl(&dword_1A03E3000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Invalidating user token upon processing completed response with status code %{public}@, after considering generic response handler.", (uint8_t *)&v26, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_invalidateUserTokenForInitialResponse:toRequest:withCompletionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
LABEL_22:

}

void __87__ICMusicKitURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;

  v7 = (void *)a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a5;
  v11 = a4;
  objc_msgSend(v7, "_updateRequest:forProcessedResponseOfStoreURLRequest:", v8, v9);
  (*(void (**)(void))(a1[7] + 16))();

}

- (void)_updateRequest:(id)a3 forProcessedResponseOfStoreURLRequest:(id)a4
{
  id v5;

  v5 = a3;
  objc_msgSend(a4, "retryDelay");
  objc_msgSend(v5, "setRetryDelay:");

}

- (void)_invalidateDeveloperTokenForInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "requestContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clientInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "developerTokenProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __108__ICMusicKitURLResponseHandler__invalidateDeveloperTokenForInitialResponse_toRequest_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E43901D8;
  v17 = v8;
  v18 = v7;
  v19 = v9;
  v13 = v9;
  v14 = v7;
  v15 = v8;
  objc_msgSend(v12, "invalidateCachedDeveloperTokenForClientInfo:completionHandler:", v11, v16);

}

- (void)_invalidateUserTokenForInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "requestContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_developerToken");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICMusicUserTokenCache sharedCache](ICMusicUserTokenCache, "sharedCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __103__ICMusicKitURLResponseHandler__invalidateUserTokenForInitialResponse_toRequest_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E43901D8;
  v17 = v8;
  v18 = v7;
  v19 = v9;
  v13 = v9;
  v14 = v7;
  v15 = v8;
  objc_msgSend(v12, "setCachedUserToken:forDeveloperToken:requestContext:completion:", 0, v11, v10, v16);

}

void __103__ICMusicKitURLResponseHandler__invalidateUserTokenForInitialResponse_toRequest_withCompletionHandler___block_invoke(_QWORD *a1, int a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      v11 = 138543362;
      v12 = v5;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrying request after successfully invalidating music user token.", (uint8_t *)&v11, 0xCu);
    }
    v6 = 0;
    v7 = CFSTR("music-user-token-invalidated");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -8104, a3, CFSTR("Failed to invalidate music user token."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = a1[5];
      objc_msgSend(v6, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error while processing initial response %{public}@. %{public}@", (uint8_t *)&v11, 0x20u);

    }
    v7 = 0;
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __108__ICMusicKitURLResponseHandler__invalidateDeveloperTokenForInitialResponse_toRequest_withCompletionHandler___block_invoke(_QWORD *a1, int a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = a1[4];
      v11 = 138543362;
      v12 = v5;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Retrying request after successfully invalidating developer token.", (uint8_t *)&v11, 0xCu);
    }
    v6 = 0;
    v7 = CFSTR("developer-token-invalidated");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), -8201, a3, CFSTR("Failed to invalidate developer token."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v8 = a1[4];
      v9 = a1[5];
      objc_msgSend(v6, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543874;
      v12 = v8;
      v13 = 2114;
      v14 = v9;
      v15 = 2114;
      v16 = v10;
      _os_log_impl(&dword_1A03E3000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Encountered error while processing initial response %{public}@. %{public}@", (uint8_t *)&v11, 0x20u);

    }
    v7 = 0;
  }

  (*(void (**)(void))(a1[6] + 16))();
}

void __89__ICMusicKitURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_10(_QWORD *a1, uint64_t a2, void *a3, void *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;

  v6 = (void *)a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v6, "_updateRequest:forProcessedResponseOfStoreURLRequest:", v7, v8);
  (*(void (**)(void))(a1[7] + 16))();

}

@end
