@implementation SLGoogleAuthController

- (id)_webClient
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDE98D0]), "initWithClientID:", self->_clientID);
}

- (SLGoogleAuthController)initWithAccountDescription:(id)a3 presentationBlock:(id)a4
{
  return (SLGoogleAuthController *)-[SLGoogleAuthController _initWithAccount:accountStore:username:youTube:emailOnly:clientID:presentationBlock:completion:](self, "_initWithAccount:accountStore:username:youTube:emailOnly:clientID:presentationBlock:completion:", 0, 0, 0, 0, 0, 0, a4, 0);
}

- (SLGoogleAuthController)initWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5
{
  return (SLGoogleAuthController *)-[SLGoogleAuthController _initWithAccount:accountStore:username:youTube:emailOnly:clientID:presentationBlock:completion:](self, "_initWithAccount:accountStore:username:youTube:emailOnly:clientID:presentationBlock:completion:", a3, a4, 0, 0, 0, 0, a5, 0);
}

- (SLGoogleAuthController)initWithEmailOnlyScope:(BOOL)a3 presentationBlock:(id)a4
{
  return (SLGoogleAuthController *)-[SLGoogleAuthController _initWithAccount:accountStore:username:youTube:emailOnly:clientID:presentationBlock:completion:](self, "_initWithAccount:accountStore:username:youTube:emailOnly:clientID:presentationBlock:completion:", 0, 0, 0, 0, a3, 0, a4, 0);
}

- (SLGoogleAuthController)initWithClientID:(id)a3 emailOnlyScope:(BOOL)a4 presentationBlock:(id)a5
{
  return (SLGoogleAuthController *)-[SLGoogleAuthController _initWithAccount:accountStore:username:youTube:emailOnly:clientID:presentationBlock:completion:](self, "_initWithAccount:accountStore:username:youTube:emailOnly:clientID:presentationBlock:completion:", 0, 0, 0, 0, a4, a3, a5, 0);
}

+ (id)googleAuthControllerWithPresentationBlock:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAccount:accountStore:username:youTube:emailOnly:clientID:presentationBlock:completion:", 0, 0, 0, 0, 0, 0, v7, v6);

  return v8;
}

+ (id)googleAuthControllerWithAccount:(id)a3 accountStore:(id)a4 presentationBlock:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAccount:accountStore:username:youTube:emailOnly:clientID:presentationBlock:completion:", v13, v12, 0, 0, 0, 0, v11, v10);

  return v14;
}

+ (id)googleAuthControllerWithYouTubeUsername:(id)a3 presentationBlock:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAccount:accountStore:username:youTube:emailOnly:clientID:presentationBlock:completion:", 0, 0, v10, 1, 0, 0, v9, v8);

  return v11;
}

- (id)_initWithAccount:(id)a3 accountStore:(id)a4 username:(id)a5 youTube:(BOOL)a6 emailOnly:(BOOL)a7 clientID:(id)a8 presentationBlock:(id)a9 completion:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id *v20;
  id *v21;
  uint64_t v22;
  id v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  id *v45;
  id v46;
  void *v47;
  id *v48;
  id *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  _BOOL4 v55;
  _BOOL4 v56;
  void *v57;
  id v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id *v62;
  id v63;
  objc_super v64;

  v55 = a7;
  v56 = a6;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v58 = a8;
  v18 = a9;
  v19 = a10;
  v64.receiver = self;
  v64.super_class = (Class)SLGoogleAuthController;
  v20 = -[SLWebAuthController _init](&v64, sel__init);
  v21 = v20;
  if (!v20)
    goto LABEL_14;
  v59 = v17;
  v50 = v20;
  _SLLog();
  objc_storeStrong(v21 + 131, a3);
  objc_storeStrong(v21 + 132, a4);
  v22 = MEMORY[0x22E2DA1D4](v18);
  v23 = v21[133];
  v21[133] = (id)v22;

  objc_storeStrong(v21 + 135, a8);
  objc_msgSend(v21, "setCompletion:", v19, v50);
  objc_msgSend(v21, "_webClient");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_opt_respondsToSelector();

  v53 = v16;
  if ((v25 & 1) != 0)
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v21, "_webClient");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "clientRedirectForAppOpenURL");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%@:/"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_7;
    goto LABEL_6;
  }
  v29 = 0;
  if (v15)
  {
LABEL_6:
    objc_msgSend(v15, "username");
    v30 = objc_claimAutoreleasedReturnValue();

    v59 = (void *)v30;
  }
LABEL_7:
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "UUIDString");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "_webClient");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  v54 = v15;
  v51 = v19;
  v52 = v18;
  if (v56)
  {
    objc_msgSend(v33, "youTubeScope");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v55)
      objc_msgSend(v33, "emailScope");
    else
      objc_msgSend(v33, "defaultScope");
    v35 = objc_claimAutoreleasedReturnValue();
  }
  v36 = v35;
  v57 = (void *)v35;

  objc_msgSend(v32, "sl_urlEncodedSHA256");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)MEMORY[0x24BDE98C8];
  objc_msgSend(v21, "_webClient");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "clientID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_webClient");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "authRequestURL");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "urlForClientID:redirectURI:scope:username:authRequestURL:codeChallenge:", v40, v29, v36, v59, v42, v37);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  _SLLog();
  v44 = objc_alloc(MEMORY[0x24BDE9898]);
  v60[0] = MEMORY[0x24BDAC760];
  v60[1] = 3221225472;
  v60[2] = __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke;
  v60[3] = &unk_24F34E540;
  v61 = 0;
  v45 = v21;
  v62 = v45;
  v63 = v32;
  v46 = v32;
  v47 = (void *)objc_msgSend(v44, "initForPermissionToAccessURL:fromURLString:completion:", v43, CFSTR("https://gil.apple.com/"), v60, v43);
  v48 = v45;

  v17 = v59;
  v16 = v53;
  v15 = v54;
  v19 = v51;
  v18 = v52;
LABEL_14:

  return v21;
}

void __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5 != 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog();

  _SLLog();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke_2;
  block[3] = &unk_24F34E518;
  v11 = v5;
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v14 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (*(_QWORD *)(a1 + 32))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1072);
    _SLLog();
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    v19 = *(id *)(a1 + 40);
    v2 = objc_alloc(MEMORY[0x24BDB7178]);
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend((id)v15[5], "_webClient", v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clientRedirectForAppOpenURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke_21;
    v10[3] = &unk_24F34E4F0;
    v13 = &v14;
    v11 = *(id *)(a1 + 48);
    v12 = *(id *)(a1 + 40);
    v6 = objc_msgSend(v2, "initWithURL:callbackURLScheme:usingEphemeralSession:completionHandler:", v3, v5, 1, v10);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v7 + 1072);
    *(_QWORD *)(v7 + 1072) = v6;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1072), "start");
    _Block_object_dispose(&v14, 8);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_completeWithIdentity:error:", 0, *(_QWORD *)(a1 + 56));
  }
}

void __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke_21(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD block[4];
  id v13;
  uint64_t v14;

  v5 = a3;
  if (v5)
  {
    _SLLog();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke_2_24;
    block[3] = &unk_24F34E4C8;
    v6 = v5;
    v7 = a1[6];
    v13 = v6;
    v14 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "_didRedirectToURL:codeVerifier:", a2, a1[4]);
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
  v10 = a1[5];
  v11 = *(void **)(v10 + 1072);
  *(_QWORD *)(v10 + 1072) = 0;

}

void __121__SLGoogleAuthController__initWithAccount_accountStore_username_youTube_emailOnly_clientID_presentationBlock_completion___block_invoke_2_24(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDB7068]))
  {

    goto LABEL_5;
  }
  v3 = objc_msgSend(*(id *)(a1 + 32), "code");

  if (v3 != 1)
  {
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  _SLLog();
  v4 = -1;
LABEL_6:
  v5 = (void *)MEMORY[0x24BDD1540];
  v6 = *MEMORY[0x24BDE9928];
  v7 = *(_QWORD *)(a1 + 32);
  v12 = *MEMORY[0x24BDD1398];
  v13[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "_dismissAndCompleteWithIdentity:error:", 0, v9);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = 0;

}

- (void)cancelAuthorization
{
  -[ASWebAuthenticationSession cancel](self->_authenticationSession, "cancel");
}

- (void)dealloc
{
  objc_super v3;

  -[ASWebAuthenticationSession cancel](self->_authenticationSession, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)SLGoogleAuthController;
  -[SLGoogleAuthController dealloc](&v3, sel_dealloc);
}

- (id)_redirectPathForURI:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "host");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v3, "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "hasPrefix:", CFSTR("/"));

      objc_msgSend(v3, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v7;
      if (v6)
      {
        objc_msgSend(v7, "substringFromIndex:", 1);
        v8 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v8;
      }
    }
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "scheme");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@://%@"), v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  return v11;
}

+ (id)_identityFromUsername:(id)a3 displayName:(id)a4 token:(id)a5 refreshToken:(id)a6 idToken:(id)a7 grantedDataclasses:(id)a8
{
  id v8;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v8 = a3;
  if (a3)
  {
    v13 = (objc_class *)MEMORY[0x24BDE98D8];
    v14 = a8;
    v15 = a7;
    v16 = a6;
    v17 = a5;
    v18 = a4;
    v19 = v8;
    v8 = (id)objc_msgSend([v13 alloc], "initWithUsername:token:displayName:refreshToken:youTubeUsername:idToken:grantedDataclasses:", v19, v17, v18, v16, 0, v15, v14);

  }
  return v8;
}

- (void)_didRedirectToURL:(id)a3 codeVerifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[5];
  _QWORD v19[5];

  v6 = a4;
  v7 = a3;
  _SLLog();
  objc_msgSend(MEMORY[0x24BDE98C8], "authCodeFromRedirectURL:", v7, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v8)
  {
    v9 = objc_alloc(MEMORY[0x24BDE98E0]);
    -[SLGoogleAuthController _webClient](self, "_webClient");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithWebClient:", v10);

    -[SLGoogleAuthController _webClient](self, "_webClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = (void *)MEMORY[0x24BDD17C8];
      -[SLGoogleAuthController _webClient](self, "_webClient");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "clientRedirectForAppOpenURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringWithFormat:", CFSTR("%@:/"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke;
    v19[3] = &unk_24F34E5E0;
    v19[4] = self;
    objc_msgSend(v11, "exchangeAuthCode:usingRedirect:codeVerifier:forAccountResponse:", v8, v17, v6, v19);

  }
  else
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_5;
    block[3] = &unk_24F34E608;
    block[4] = self;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }

}

void __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  _QWORD block[4];
  id v47;
  uint64_t v48;
  id v49;
  _QWORD v50[4];
  id v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _SLLog();
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048))
  {
    objc_msgSend(v5, "token", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      objc_msgSend(v5, "refreshToken");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        objc_msgSend(v5, "usernames");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v55 = 0u;
          v56 = 0u;
          v53 = 0u;
          v54 = 0u;
          objc_msgSend(v5, "usernames");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
          if (v14)
          {
            v15 = v14;
            v16 = *(_QWORD *)v54;
            while (2)
            {
              for (i = 0; i != v15; ++i)
              {
                if (*(_QWORD *)v54 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "username");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "compare:options:", v18, 1);

                if (!v20)
                {

                  goto LABEL_16;
                }
              }
              v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
              if (v15)
                continue;
              break;
            }
          }

          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "username");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "usernames");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "firstObject");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          _SLLog();

          +[SLGoogleAuthController _presentUsernameMismatchAlert](SLGoogleAuthController, "_presentUsernameMismatchAlert", v21, v45);
          objc_msgSend(v5, "setToken:", 0);
        }
      }
      else
      {

      }
    }
  }
LABEL_16:
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048))
    goto LABEL_22;
  objc_msgSend(v5, "token");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
    goto LABEL_22;
  v24 = (void *)v23;
  objc_msgSend(v5, "refreshToken");
  v25 = objc_claimAutoreleasedReturnValue();
  if (!v25)
  {

    goto LABEL_22;
  }
  v26 = (void *)v25;
  objc_msgSend(v5, "usernames");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "firstObject");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
LABEL_22:
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_4;
    block[3] = &unk_24F34E5B8;
    v44 = *(_QWORD *)(a1 + 32);
    v47 = v5;
    v48 = v44;
    v49 = v6;
    v33 = v5;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v43 = v47;
    goto LABEL_23;
  }
  v29 = objc_alloc(MEMORY[0x24BDB4388]);
  objc_msgSend(v5, "token");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refreshToken");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expiryDate");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (id)objc_msgSend(v29, "initWithOAuth2Token:refreshToken:expiryDate:", v30, v31, v32);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "setCredential:", v33);
  objc_msgSend(v5, "usernames");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "firstObject");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "setUsername:", v35);

  v36 = *(void **)(*(_QWORD *)(a1 + 32) + 1048);
  objc_msgSend(v5, "grantedDataclasses");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAccountProperty:forKey:", v37, *MEMORY[0x24BDB3F08]);

  v38 = *(void **)(*(_QWORD *)(a1 + 32) + 1048);
  objc_msgSend(v5, "displayName");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setAccountProperty:forKey:", v39, *MEMORY[0x24BDB3F00]);

  _SLLog();
  v40 = *(_QWORD *)(a1 + 32);
  v41 = *(void **)(v40 + 1056);
  v42 = *(_QWORD *)(v40 + 1048);
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_2;
  v50[3] = &unk_24F34E590;
  v51 = v5;
  v52 = v40;
  v43 = v5;
  objc_msgSend(v41, "saveAccount:withCompletionHandler:", v42, v50);

LABEL_23:
}

void __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  char v13;

  v5 = a3;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_3;
  v9[3] = &unk_24F34E568;
  v13 = a2;
  v10 = v5;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v7;
  v8 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v9);

}

void __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  _SLLog();

  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "usernames", v9, v10);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "token");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "refreshToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "idToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "grantedDataclasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SLGoogleAuthController _identityFromUsername:displayName:token:refreshToken:idToken:grantedDataclasses:](SLGoogleAuthController, "_identityFromUsername:displayName:token:refreshToken:idToken:grantedDataclasses:", v3, v4, v5, v6, v7, v8);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "_dismissAndCompleteWithIdentity:error:", v11, *(_QWORD *)(a1 + 32), v9, v10);

}

void __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "usernames");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "token");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "refreshToken");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "idToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "grantedDataclasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SLGoogleAuthController _identityFromUsername:displayName:token:refreshToken:idToken:grantedDataclasses:](SLGoogleAuthController, "_identityFromUsername:displayName:token:refreshToken:idToken:grantedDataclasses:", v3, v4, v5, v6, v7, v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_dismissAndCompleteWithIdentity:error:", v9, *(_QWORD *)(a1 + 48));
}

uint64_t __57__SLGoogleAuthController__didRedirectToURL_codeVerifier___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dismissAndCompleteWithIdentity:error:", 0, 0);
}

- (void)_dismissAndCompleteWithIdentity:(id)a3 error:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  _SLLog();
  -[ASWebAuthenticationSession cancel](self->_authenticationSession, "cancel", v7, v6);
  _SLLog();
  -[SLGoogleAuthController _completeWithIdentity:error:](self, "_completeWithIdentity:error:", v7, v6);

}

- (void)_completeWithIdentity:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v12 = v6;
  v11 = v13;
  _SLLog();
  if (!v6)
    goto LABEL_6;
  objc_msgSend(v6, "domain", v13, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD1308]))
  {
    v8 = objc_msgSend(v6, "code");

    if (v8 != -1009)
      goto LABEL_6;
    +[SLGoogleAuthController _presentInternetOfflineError](SLGoogleAuthController, "_presentInternetOfflineError");
    v7 = v6;
    v6 = 0;
  }

LABEL_6:
  -[SLWebAuthController completion](self, "completion", v11, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SLWebAuthController completion](self, "completion");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v10)[2](v10, v13, v6);

    -[SLWebAuthController setCompletion:](self, "setCompletion:", 0);
  }
  else
  {
    _SLLog();
  }

}

+ (void)_presentUsernameMismatchAlert
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  CFUserNotificationRef v20;

  v14 = (void *)MEMORY[0x24BDBCED8];
  SLSocialFrameworkBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("GOOGLE_EMAIL_MISMATCH_TITLE"), &stru_24F34E9D0, CFSTR("Localizable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDBD6D8];
  SLSocialFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("GOOGLE_EMAIL_MISMATCH_MESSAGE"), &stru_24F34E9D0, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BDBD6E0];
  SLSocialFrameworkBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("GOOGLE_EMAIL_MISMATCH_OK"), &stru_24F34E9D0, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x24BDBD6F8];
  SLSocialFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resourceURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v2, v3, v5, v6, v8, v9, v11, *MEMORY[0x24BDBD710], 0);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v20 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, 0, v12);
  if (v18[3])
  {
    dispatch_get_global_queue(25, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__SLGoogleAuthController__presentUsernameMismatchAlert__block_invoke;
    block[3] = &unk_24F34E630;
    block[4] = &v17;
    dispatch_async(v13, block);

  }
  _Block_object_dispose(&v17, 8);

}

void __55__SLGoogleAuthController__presentUsernameMismatchAlert__block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

+ (void)_presentInternetOfflineError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;
  NSObject *v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  CFUserNotificationRef v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v17[0] = *MEMORY[0x24BDBD6D8];
  SLSocialFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_TITLE"), &stru_24F34E9D0, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v3;
  v17[1] = *MEMORY[0x24BDBD6E0];
  SLSocialFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_MESSAGE_NO_CONNECTION"), &stru_24F34E9D0, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  v17[2] = *MEMORY[0x24BDBD6F8];
  SLSocialFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SIGN_IN_ERROR_OK"), &stru_24F34E9D0, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  v17[3] = *MEMORY[0x24BDBD710];
  SLSocialFrameworkBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resourceURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v16 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0.0, 0, 0, v10);
  if (v14[3])
  {
    dispatch_get_global_queue(25, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __54__SLGoogleAuthController__presentInternetOfflineError__block_invoke;
    v12[3] = &unk_24F34E630;
    v12[4] = &v13;
    dispatch_async(v11, v12);

  }
  _Block_object_dispose(&v13, 8);

}

void __54__SLGoogleAuthController__presentInternetOfflineError__block_invoke(uint64_t a1)
{
  CFOptionFlags responseFlags;

  responseFlags = 0;
  CFUserNotificationReceiveResponse(*(CFUserNotificationRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), 0.0, &responseFlags);
  CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_authenticationSession, 0);
  objc_storeStrong(&self->_presentationBlock, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
