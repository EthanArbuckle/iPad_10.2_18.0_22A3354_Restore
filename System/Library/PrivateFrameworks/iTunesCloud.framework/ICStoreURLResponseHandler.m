@implementation ICStoreURLResponseHandler

void __84__ICStoreURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke(id *a1, char a2, uint64_t a3, void *a4)
{
  __CFString *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  __CFString *v49;
  id v50;
  id v51;
  void *v52;
  char v53;
  uint64_t v54;
  void *v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  __CFString *v59;
  id v60;
  uint64_t v61;
  char v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  char v67;
  const __CFString *v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  uint8_t buf[4];
  id v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a1[4];
  objc_msgSend(v8, "storeRequestContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "urlResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "currentURLRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URL");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  +[ICAuthenticationUtilities sharedAuthKitSession](ICAuthenticationUtilities, "sharedAuthKitSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "handleResponse:forRequest:shouldRetry:", v10, v11, &v67);

  if (v67)
  {
    v13 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = a1[4];
      *(_DWORD *)buf = 138543362;
      v73 = v14;
      _os_log_impl(&dword_1A03E3000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ retry requested by authkit", buf, 0xCu);
    }

    v15 = CFSTR("authentication-performed");
    a3 = 1;
    v7 = CFSTR("authentication-performed");
    a2 = 1;
  }
  v53 = a2;
  v54 = a3;
  objc_msgSend(v9, "identityStore");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0;
  objc_msgSend(v16, "getPropertiesForUserIdentity:error:", v17, &v66);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v66;

  v19 = v18;
  if (v18)
  {
    v20 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = a1[4];
      *(_DWORD *)buf = 138543618;
      v73 = v21;
      v74 = 2114;
      v75 = v19;
      _os_log_impl(&dword_1A03E3000, v20, OS_LOG_TYPE_ERROR, "%{public}@ Failed to fetch identity properties to process the response. err=%{public}@", buf, 0x16u);
    }
  }
  else
  {
    v50 = v8;
    v48 = v9;
    v49 = v7;
    objc_msgSend(v10, "allHeaderFields");
    v20 = objc_claimAutoreleasedReturnValue();
    +[ICHTTPCookieStore sharedCookieStore](ICHTTPCookieStore, "sharedCookieStore");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C92C00], "cookiesWithResponseHeaderFields:forURL:", v20, v56);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(v55, "DSID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "saveCookies:forURL:userIdentifier:", v23, v56, v24);

    }
    objc_msgSend(v10, "ic_valueForHTTPHeaderField:", CFSTR("X-Apple-Set-Cookie"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
    {
      v27 = (void *)MEMORY[0x1E0C92C00];
      v70 = CFSTR("X-Apple-Set-Cookie");
      v71 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "cookiesWithResponseHeaderFields:forURL:", v28, v56);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v22, "saveGlobalAccountCookies:forURL:", v29, v56);
    }
    objc_msgSend(v10, "ic_valueForHTTPHeaderField:", CFSTR("X-Apple-Set-User-Cookie"));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)v30;
    if (v30)
    {
      v32 = (void *)MEMORY[0x1E0C92C00];
      v68 = CFSTR("X-Apple-Set-User-Cookie");
      v69 = v30;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "cookiesWithResponseHeaderFields:forURL:", v33, v56);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v55, "DSID");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "saveCookies:forURL:userIdentifier:", v34, v56, v35);

    }
    v7 = v49;
    v8 = v50;
    v9 = v48;
    v19 = 0;
  }

  objc_msgSend(v10, "ic_valueForHTTPHeaderField:", CFSTR("X-Set-Apple-Store-Front"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v36)
    goto LABEL_19;
  objc_msgSend(v11, "ic_valueForHTTPHeaderField:", CFSTR("X-Apple-Store-Front"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v36, "isEqual:", v37) & 1) == 0)
  {
    objc_msgSend(v11, "ic_valueForHTTPHeaderField:", CFSTR("X-Enqueuer-DSID"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
      goto LABEL_19;
    v52 = v19;
    v39 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      v40 = a1[4];
      *(_DWORD *)buf = 138543618;
      v73 = v40;
      v74 = 2114;
      v75 = v36;
      _os_log_impl(&dword_1A03E3000, v39, OS_LOG_TYPE_ERROR, "%{public}@ Server response included an updated storefront %{public}@", buf, 0x16u);
    }

    objc_msgSend(v9, "identity");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v9;
    objc_msgSend(v9, "identityStore");
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = (void *)v42;
    if (v37 && v42)
    {
      v44 = MEMORY[0x1E0C809B0];
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __84__ICStoreURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke_6;
      v63[3] = &unk_1E43905D8;
      v64 = v36;
      v65 = v43;
      v57[0] = v44;
      v57[1] = 3221225472;
      v57[2] = __84__ICStoreURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke_2;
      v57[3] = &unk_1E4390600;
      v58 = a1[4];
      v45 = a1[6];
      v62 = v53;
      v60 = v45;
      v61 = v54;
      v59 = v7;
      v46 = v43;
      objc_msgSend(v46, "updatePropertiesForUserIdentity:usingBlock:completionHandler:", v37, v63, v57);

      v9 = v41;
      v19 = v52;
      goto LABEL_20;
    }
    if (v42)
    {
      +[ICStoreURLResponseHandler _updateDefaultStorefrontIdentifier:usingIdentityStore:](ICStoreURLResponseHandler, "_updateDefaultStorefrontIdentifier:usingIdentityStore:", v36, v42);
    }
    else
    {
      +[ICUserIdentityStore defaultIdentityStore](ICUserIdentityStore, "defaultIdentityStore");
      v51 = v8;
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICStoreURLResponseHandler _updateDefaultStorefrontIdentifier:usingIdentityStore:](ICStoreURLResponseHandler, "_updateDefaultStorefrontIdentifier:usingIdentityStore:", v36, v47);

      v8 = v51;
    }

    v9 = v41;
    v19 = v52;
  }

LABEL_19:
  (*((void (**)(void))a1[6] + 2))();
LABEL_20:

}

- (void)_verifyMescalSignatureForResponse:(id)a3 toRequest:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v8, "storeRequestContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __91__ICStoreURLResponseHandler__verifyMescalSignatureForResponse_toRequest_completionHandler___block_invoke;
  v16[3] = &unk_1E4390738;
  v17 = v7;
  v18 = v8;
  v19 = v10;
  v20 = v9;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v15 = v7;
  objc_msgSend(v11, "getBagForRequestContext:withCompletionHandler:", v12, v16);

}

void __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke(id *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  id v39;
  void *v40;
  _BOOL4 v41;
  ICStoreDialogResponse *v42;
  void *v43;
  NSObject *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  _BOOL4 v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  id v54;
  const char *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  BOOL v60;
  id v61;
  int8x16_t v62;
  uint64_t v63;
  id v64;
  void *v65;
  id v66;
  void *v67;
  _QWORD v68[4];
  ICStoreDialogResponse *v69;
  id v70;
  int8x16_t v71;
  id v72;
  id v73;
  uint64_t *v74;
  uint64_t v75;
  _QWORD v76[4];
  id v77;
  ICStoreDialogResponse *v78;
  uint64_t *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  uint8_t buf[4];
  id v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  __int16 v98;
  void *v99;
  _QWORD v100[3];
  _QWORD v101[6];

  v101[3] = *MEMORY[0x1E0C80C00];
  v66 = a3;
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__32824;
  v88 = __Block_byref_object_dispose__32825;
  v7 = a4;
  v89 = v7;
  v8 = a1[4];
  objc_msgSend(v8, "storeRequestContext");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = a2;
  objc_msgSend(a1[5], "urlResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "shouldParseBodyData"))
  {
    objc_msgSend(a1[5], "parsedBodyDictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v10, "objectForKey:", CFSTR("invalidate-url-bags"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v67, "BOOLValue"))
  {
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[4];
      *(_DWORD *)buf = 138543362;
      v91 = v12;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ invalidating bag cache because invalidate-url-bags is set in the response", buf, 0xCu);
    }

    +[ICURLBagProvider sharedBagProvider](ICURLBagProvider, "sharedBagProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "invalidateCache");

  }
  v14 = objc_msgSend(v9, "statusCode");
  if (!v85[5])
  {
    v15 = v14;
    if (v14 >= 400)
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v100[0] = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Received HTTP error status code %ld"), v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v101[0] = v17;
      v100[1] = CFSTR("ICStoreURLRequestHTTPStatusCodeUserInfoKey");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v15);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      v100[2] = CFSTR("ICStoreURLRequestParsedBodyInfoKey");
      v20 = (void *)MEMORY[0x1E0C9AA70];
      if (v10)
        v20 = v10;
      v101[1] = v18;
      v101[2] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, v100, 3);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7101, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)v85[5];
      v85[5] = v22;

    }
  }
  objc_msgSend(v9, "ic_valueForHTTPHeaderField:", CFSTR("x-apple-jingle-correlation-key"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v85[5])
  {
    v25 = os_log_create("com.apple.amp.iTunesCloud", "Default_Oversize");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)v85[5];
      v27 = a1[4];
      objc_msgSend(a1[5], "parsedBodyText");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v91 = v27;
      v92 = 2114;
      v93 = v26;
      v94 = 2114;
      v95 = v24;
      v96 = 2114;
      v97 = v9;
      v98 = 2114;
      v99 = v28;
      _os_log_impl(&dword_1A03E3000, v25, OS_LOG_TYPE_ERROR, "%{public}@ completed with:\nerror: %{public}@\ncorrelationKey: %{public}@\nresponse: \n%{public}@\nbody: \n%{public}@", buf, 0x34u);

    }
  }
  else
  {
    v25 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      v29 = a1[4];
      *(_DWORD *)buf = 138543618;
      v91 = v29;
      v92 = 2114;
      v93 = v24;
      _os_log_impl(&dword_1A03E3000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@ completed successfully. correlationKey=%{public}@", buf, 0x16u);
    }
  }

  if (!v85[5])
  {
    v30 = objc_msgSend(v10, "ic_integerValueForKey:", CFSTR("failureType"));
    if (v30
      || (v30 = objc_msgSend(v10, "ic_integerValueForKey:", CFSTR("errorNumber"))) != 0
      || (v30 = 510005, objc_msgSend(v10, "ic_integerValueForKey:", CFSTR("status")) == 510005))
    {
      v31 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = a1[6];
        v33 = a1[4];
        *(_DWORD *)buf = 138543874;
        v91 = v32;
        v92 = 2114;
        v93 = v33;
        v94 = 2114;
        v95 = v10;
        _os_log_impl(&dword_1A03E3000, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ Found error in response body %{public}@", buf, 0x20u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("ICStoreServerError"), v30, v10, CFSTR("Found error in response body. correlation-key: %@"), v24);
      v34 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("dialog"));
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v59 == 0;

      if (v60)
      {
LABEL_28:
        objc_msgSend(v10, "objectForKey:", CFSTR("dialog"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v37 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            v38 = a1[6];
            v39 = a1[4];
            *(_DWORD *)buf = 138543874;
            v91 = v38;
            v92 = 2114;
            v93 = v39;
            v94 = 2114;
            v95 = v36;
            _os_log_impl(&dword_1A03E3000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ Received store dialog response %{public}@", buf, 0x20u);
          }

          objc_msgSend(v65, "storeDialogResponseHandler");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v40 == 0;

          if (!v41)
          {
            v42 = -[ICStoreDialogResponse initWithResponseDictionary:]([ICStoreDialogResponse alloc], "initWithResponseDictionary:", v36);
            objc_msgSend(v65, "storeDialogResponseHandler");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v80[0] = MEMORY[0x1E0C809B0];
            v80[1] = 3221225472;
            v80[2] = __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_35;
            v80[3] = &unk_1E4390668;
            v81 = a1[4];
            v82 = a1[7];
            v83 = &v84;
            objc_msgSend(v43, "handleStoreDialogResponse:usingRequestContext:withCompletionHandler:", v42, v65, v80);

LABEL_41:
LABEL_48:

            goto LABEL_49;
          }
          v53 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v54 = a1[4];
            *(_DWORD *)buf = 138543362;
            v91 = v54;
            v55 = "%{public}@ Response contains a dialog but there's no response handler set - treating as error";
LABEL_46:
            _os_log_impl(&dword_1A03E3000, v53, OS_LOG_TYPE_DEFAULT, v55, buf, 0xCu);
          }
        }
        else
        {
          if (!objc_msgSend(a1[6], "_isAuthenticationError:", v85[5]))
          {
            +[ICMachineDataActionHandler sharedHandler](ICMachineDataActionHandler, "sharedHandler");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "storeRequestContext");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v68[0] = MEMORY[0x1E0C809B0];
            v68[1] = 3221225472;
            v68[2] = __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_38;
            v68[3] = &unk_1E43906B8;
            v74 = &v84;
            v69 = (ICStoreDialogResponse *)a1[4];
            v70 = v8;
            v73 = a1[7];
            v62 = *(int8x16_t *)(a1 + 5);
            v58 = (id)v62.i64[0];
            v71 = vextq_s8(v62, v62, 8uLL);
            v75 = v63;
            v72 = v66;
            objc_msgSend(v56, "processActionFromResponse:withRequestContext:withCompletionHandler:", v9, v57, v68);

            v42 = v69;
            goto LABEL_41;
          }
          v44 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v45 = a1[6];
            v46 = a1[4];
            *(_DWORD *)buf = 138543874;
            v91 = v45;
            v92 = 2114;
            v93 = v46;
            v94 = 2114;
            v95 = v10;
            _os_log_impl(&dword_1A03E3000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ Received authentication error. server response=%{public}@", buf, 0x20u);
          }

          objc_msgSend(a1[4], "requestContext");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "authenticationProvider");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v48 == 0;

          if (!v49)
          {
            objc_msgSend(a1[4], "requestContext");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "authenticationProvider");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = a1[5];
            v64 = a1[4];
            v76[0] = MEMORY[0x1E0C809B0];
            v76[1] = 3221225472;
            v76[2] = __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_36;
            v76[3] = &unk_1E4390668;
            v78 = (ICStoreDialogResponse *)a1[7];
            v77 = a1[4];
            v79 = &v84;
            objc_msgSend(v51, "performAuthenticationToHandleResponse:toRequest:withCompletionHandler:", v52, v64, v76);

            v42 = v78;
            goto LABEL_41;
          }
          v53 = os_log_create("com.apple.amp.iTunesCloud", "Default");
          if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
          {
            v61 = a1[4];
            *(_DWORD *)buf = 138543362;
            v91 = v61;
            v55 = "%{public}@ Not attempting reauthentication because no provider was specified";
            goto LABEL_46;
          }
        }

        (*((void (**)(void))a1[7] + 2))();
        goto LABEL_48;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:userInfo:debugDescription:", CFSTR("ICStoreServerError"), 0, v10, CFSTR("Found dialog in response body without an error code - treating as an error. correlation-key: %@"), v24);
      v34 = objc_claimAutoreleasedReturnValue();
    }
    v35 = (void *)v85[5];
    v85[5] = v34;

    goto LABEL_28;
  }
  (*((void (**)(void))a1[7] + 2))();
LABEL_49:

  _Block_object_dispose(&v84, 8);
}

- (BOOL)_isAuthenticationError:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("ICStoreServerError"));

  if (!v5)
  {
    v7 = 0;
    goto LABEL_12;
  }
  v6 = objc_msgSend(v3, "code");
  v7 = 0;
  if (v6 > 2033)
  {
    if (((unint64_t)(v6 - 2034) > 0x26 || ((1 << (v6 + 14)) & 0x7000001001) == 0)
      && v6 != 510005)
    {
      goto LABEL_12;
    }
LABEL_11:
    v7 = 1;
    goto LABEL_12;
  }
  if ((unint64_t)(v6 - 1001) <= 3 && v6 != 1002 || v6 == 2002)
    goto LABEL_11;
LABEL_12:

  return v7;
}

- (void)processInitialResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v13[1] = 3221225472;
  v13[2] = __84__ICStoreURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E4390628;
  v14 = a4;
  v15 = v8;
  v16 = a5;
  v12.receiver = self;
  v12.super_class = (Class)ICStoreURLResponseHandler;
  v13[0] = MEMORY[0x1E0C809B0];
  v9 = v16;
  v10 = v8;
  v11 = v14;
  -[ICURLResponseHandler processInitialResponse:toRequest:withCompletionHandler:](&v12, sel_processInitialResponse_toRequest_withCompletionHandler_, v10, v11, v13);

}

- (void)processCompletedResponse:(id)a3 toRequest:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  id v15;
  ICStoreURLResponseHandler *v16;
  id v17;

  v8 = a3;
  v13[1] = 3221225472;
  v13[2] = __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E43906E0;
  v14 = a4;
  v15 = v8;
  v16 = self;
  v17 = a5;
  v12.receiver = self;
  v12.super_class = (Class)ICStoreURLResponseHandler;
  v13[0] = MEMORY[0x1E0C809B0];
  v9 = v17;
  v10 = v8;
  v11 = v14;
  -[ICURLResponseHandler processCompletedResponse:toRequest:withCompletionHandler:](&v12, sel_processCompletedResponse_toRequest_withCompletionHandler_, v10, v11, v13);

}

void __91__ICStoreURLResponseHandler__verifyMescalSignatureForResponse_toRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  id obj;
  void *v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  uint64_t v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  uint64_t v88;
  _BYTE v89[128];
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "urlResponse");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mescalConfigurationForResponse:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_44;
  if ((objc_msgSend(v8, "shouldSignBody") & 1) == 0)
  {
    objc_msgSend(v8, "fields");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {

      goto LABEL_6;
    }
    objc_msgSend(v8, "headers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
      goto LABEL_6;
LABEL_44:
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_57;
  }
LABEL_6:
  v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v84 = v13;
    v85 = 2114;
    v86 = (uint64_t)v8;
    _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ verifying mescal signature for request. configuration=%{public}@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "urlResponse");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ic_valueForHTTPHeaderField:", CFSTR("X-Apple-ActionSignature"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v60 = v15;
    v58 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v15, 0);
    v70 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    if (objc_msgSend(v8, "shouldSignBody"))
    {
      objc_msgSend(*(id *)(a1 + 32), "bodyData");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "appendData:", v16);

    }
    v66 = a1;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend(v8, "headers", v58);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v80 != v20)
            objc_enumerationMutation(v17);
          objc_msgSend(v14, "ic_valueForHTTPHeaderField:", *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v22;
          if (v22 && objc_msgSend(v22, "length"))
          {
            objc_msgSend(v23, "dataUsingEncoding:", 4);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "appendData:", v24);

          }
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
      }
      while (v19);
    }
    v61 = v14;
    v63 = v6;
    v64 = v5;

    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v62 = v8;
    objc_msgSend(v8, "fields");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v90, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = *(_QWORD *)v76;
      v29 = v66;
      v65 = *(_QWORD *)v76;
      do
      {
        v30 = 0;
        v67 = v26;
        do
        {
          if (*(_QWORD *)v76 != v28)
            objc_enumerationMutation(obj);
          v31 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v30);
          if (!v27)
          {
            v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
            v32 = objc_alloc(MEMORY[0x1E0CB3998]);
            objc_msgSend(*(id *)(v29 + 32), "urlResponse");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "URL");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = (void *)objc_msgSend(v32, "initWithURL:resolvingAgainstBaseURL:", v34, 0);

            v73 = 0u;
            v74 = 0u;
            v71 = 0u;
            v72 = 0u;
            v69 = v35;
            objc_msgSend(v35, "queryItems");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v71, v89, 16);
            if (v37)
            {
              v38 = v37;
              v39 = *(_QWORD *)v72;
              do
              {
                for (j = 0; j != v38; ++j)
                {
                  if (*(_QWORD *)v72 != v39)
                    objc_enumerationMutation(v36);
                  v41 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
                  objc_msgSend(v41, "name");
                  v42 = objc_claimAutoreleasedReturnValue();
                  if (v42)
                  {
                    v43 = (void *)v42;
                    objc_msgSend(v41, "value");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v44)
                    {
                      objc_msgSend(v41, "value");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v41, "name");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v27, "setObject:forKeyedSubscript:", v45, v46);

                    }
                  }
                }
                v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v71, v89, 16);
              }
              while (v38);
            }

            v28 = v65;
            v29 = v66;
            v26 = v67;
          }
          objc_msgSend(v27, "objectForKey:", v31);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = v47;
          if (v47 && objc_msgSend(v47, "length"))
          {
            objc_msgSend(v48, "dataUsingEncoding:", 4);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "appendData:", v49);

          }
          ++v30;
        }
        while (v30 != v26);
        v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v90, 16);
      }
      while (v26);
    }
    else
    {
      v27 = 0;
      v29 = v66;
    }

    if ((unint64_t)objc_msgSend(v70, "length") <= 0x100000)
    {
      v5 = v64;
      +[ICSAPSession sharedSAPSessionWithVersion:URLBag:requestContext:](ICSAPSession, "sharedSAPSessionWithVersion:URLBag:requestContext:", 200, v64, *(_QWORD *)(v29 + 48));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = v55;
      v57 = *(_QWORD *)(v29 + 56);
      v15 = v60;
      v14 = v61;
      if (v55)
      {
        v51 = v59;
        objc_msgSend(v55, "verifySignatureData:forData:withCompletionHandler:", v59, v70, v57);
      }
      else
      {
        (*(void (**)(_QWORD, uint64_t, _QWORD))(v57 + 16))(*(_QWORD *)(v29 + 56), 1, 0);
        v51 = v59;
      }

    }
    else
    {
      v52 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      v5 = v64;
      v14 = v61;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        v53 = *(_QWORD *)(v29 + 40);
        v54 = objc_msgSend(v70, "length");
        *(_DWORD *)buf = 138543874;
        v84 = v53;
        v85 = 2048;
        v86 = v54;
        v87 = 2048;
        v88 = 0x100000;
        _os_log_impl(&dword_1A03E3000, v52, OS_LOG_TYPE_DEFAULT, "%{public}@ Not verifying mescal signature because the payload is too large. length=%lld, limit=%lld", buf, 0x20u);
      }

      (*(void (**)(void))(*(_QWORD *)(v29 + 56) + 16))();
      v51 = v59;
      v15 = v60;
    }

    v8 = v62;
    v6 = v63;
  }
  else
  {
    v50 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v50 + 16))(v50, 0, v51);
  }

LABEL_57:
}

void __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_35(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v8 = a1[4];
      v11 = 138543362;
      v12 = v8;
      _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Retrying request after action taken for dialog response", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (v7)
  {
    v9 = a1[4];
    v10 = v5;
    if (!v5)
      v10 = *(id *)(*(_QWORD *)(a1[6] + 8) + 40);
    v11 = 138543618;
    v12 = v9;
    v13 = 2114;
    v14 = v10;
    _os_log_impl(&dword_1A03E3000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Dialog action not completed - completing response handling with error %{public}@", (uint8_t *)&v11, 0x16u);
  }

  (*(void (**)(void))(a1[5] + 16))();
}

uint64_t __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_36(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (a3)
    return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, a3);
  v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v6;
    _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Retrying request after successful re-authentication", (uint8_t *)&v7, 0xCu);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_38(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v11 = v9;
  if (!v9)
    v11 = *(void **)(v10 + 40);
  objc_storeStrong((id *)(v10 + 40), v11);
  if (v7)
  {
    v12 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v30 = v13;
      v31 = 2114;
      v32 = v7;
      _os_log_impl(&dword_1A03E3000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Retrying request after machine data action %{public}@", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 40), "setMachineDataSyncState:", v8);
    v14 = *(_QWORD *)(a1 + 72);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    {
      (*(void (**)(_QWORD, uint64_t, const __CFString *))(v14 + 16))(*(_QWORD *)(a1 + 72), 1, CFSTR("machine-data-action-performed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7103, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, uint64_t, const __CFString *, void *))(v14 + 16))(v14, 1, CFSTR("machine-data-action-performed"), v22);

    }
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)
         || (v15 = objc_msgSend(*(id *)(a1 + 40), "shouldUseMescalSigning"), v16 = *(_QWORD *)(a1 + 80), (v15 & 1) == 0))
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 72) + 16))(*(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 64));
  }
  else
  {
    v17 = *(void **)(a1 + 48);
    v18 = *(_QWORD *)(a1 + 56);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_39;
    v23[3] = &unk_1E4390690;
    v27 = v16;
    v19 = *(_QWORD *)(a1 + 40);
    v24 = *(id *)(a1 + 32);
    v20 = *(id *)(a1 + 72);
    v21 = *(_QWORD *)(a1 + 88);
    v26 = v20;
    v28 = v21;
    v25 = *(id *)(a1 + 64);
    objc_msgSend(v17, "_verifyMescalSignatureForResponse:toRequest:completionHandler:", v18, v19, v23);

  }
}

void __86__ICStoreURLResponseHandler_processCompletedResponse_toRequest_withCompletionHandler___block_invoke_39(_QWORD *a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if ((a2 & 1) == 0)
  {
    v7 = v5;
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ICError"), -7102, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), v7);
    if (!v6)

    v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = a1[4];
      v10 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
      v11 = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v10;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Mescal verification failed for the response. err=%{public}@", (uint8_t *)&v11, 0x16u);
    }

  }
  (*(void (**)(void))(a1[6] + 16))();

}

uint64_t __84__ICStoreURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  if (a2)
    return objc_msgSend(a2, "setStorefrontIdentifier:", *(_QWORD *)(a1 + 32));
  else
    return +[ICStoreURLResponseHandler _updateDefaultStorefrontIdentifier:usingIdentityStore:](ICStoreURLResponseHandler, "_updateDefaultStorefrontIdentifier:usingIdentityStore:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __84__ICStoreURLResponseHandler_processInitialResponse_toRequest_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543618;
      v8 = v6;
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_1A03E3000, v5, OS_LOG_TYPE_ERROR, "%{public}@ Failed to save updated storefront value. err=%{public}@", (uint8_t *)&v7, 0x16u);
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (void)_updateDefaultStorefrontIdentifier:(id)a3 usingIdentityStore:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __83__ICStoreURLResponseHandler__updateDefaultStorefrontIdentifier_usingIdentityStore___block_invoke;
  v7[3] = &unk_1E4390708;
  v8 = v5;
  v6 = v5;
  objc_msgSend(a4, "updatePropertiesForLocalStoreAccountUsingBlock:completionHandler:", v7, 0);

}

uint64_t __83__ICStoreURLResponseHandler__updateDefaultStorefrontIdentifier_usingIdentityStore___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStorefrontIdentifier:", *(_QWORD *)(a1 + 32));
}

@end
