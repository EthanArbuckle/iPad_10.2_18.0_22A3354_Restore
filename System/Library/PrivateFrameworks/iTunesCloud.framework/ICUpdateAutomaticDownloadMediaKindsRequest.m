@implementation ICUpdateAutomaticDownloadMediaKindsRequest

- (ICUpdateAutomaticDownloadMediaKindsRequest)initWithRequestContext:(id)a3 mediaKindsToAdd:(id)a4 mediaKindsToRemove:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICUpdateAutomaticDownloadMediaKindsRequest *v11;
  uint64_t v12;
  ICStoreRequestContext *requestContext;
  uint64_t v14;
  NSSet *mediaKindsToAdd;
  uint64_t v16;
  NSSet *mediaKindsToRemove;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ICUpdateAutomaticDownloadMediaKindsRequest;
  v11 = -[ICRequestOperation init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    requestContext = v11->_requestContext;
    v11->_requestContext = (ICStoreRequestContext *)v12;

    v14 = objc_msgSend(v9, "copy");
    mediaKindsToAdd = v11->_mediaKindsToAdd;
    v11->_mediaKindsToAdd = (NSSet *)v14;

    v16 = objc_msgSend(v10, "copy");
    mediaKindsToRemove = v11->_mediaKindsToRemove;
    v11->_mediaKindsToRemove = (NSSet *)v16;

  }
  return v11;
}

- (void)execute
{
  NSObject *v3;
  NSSet *mediaKindsToAdd;
  NSSet *mediaKindsToRemove;
  void *v6;
  void *v7;
  void *v8;
  NSSet *v9;
  NSSet *v10;
  NSObject *v11;
  NSSet *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSSet *v17;
  NSObject *v18;
  NSObject *v19;
  NSSet *v20;
  NSSet *v21;
  void *v22;
  NSSet *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  NSSet *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  uint64_t v33;
  NSSet *v34;
  NSSet *v35;
  char v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSSet *v45;
  NSSet *v46;
  void *v47;
  _QWORD v48[5];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  id v58;
  _BYTE v59[128];
  uint8_t v60[128];
  uint8_t buf[4];
  ICUpdateAutomaticDownloadMediaKindsRequest *v62;
  __int16 v63;
  NSSet *v64;
  __int16 v65;
  NSSet *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    mediaKindsToAdd = self->_mediaKindsToAdd;
    mediaKindsToRemove = self->_mediaKindsToRemove;
    *(_DWORD *)buf = 138543874;
    v62 = self;
    v63 = 2114;
    v64 = mediaKindsToAdd;
    v65 = 2114;
    v66 = mediaKindsToRemove;
    _os_log_impl(&dword_1A03E3000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ performing request with media kinds to add: %{public}@, kinds to remove: %{public}@", buf, 0x20u);
  }

  -[ICStoreRequestContext identity](self->_requestContext, "identity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICStoreRequestContext identityStore](self->_requestContext, "identityStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  objc_msgSend(v7, "DSIDForUserIdentity:outError:", v6, &v58);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSSet *)v58;
  if (v9)
  {
    v10 = v9;
    v11 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[ICStoreRequestContext identity](self->_requestContext, "identity");
      v12 = (NSSet *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v62 = self;
      v63 = 2114;
      v64 = v12;
      v65 = 2114;
      v66 = v10;
      _os_log_impl(&dword_1A03E3000, v11, OS_LOG_TYPE_ERROR, "%{public}@ Failed to lookup account ID for user identity %{public}@. err=%{public}@", buf, 0x20u);

    }
    -[ICRequestOperation finishWithError:](self, "finishWithError:", v10);
    goto LABEL_45;
  }
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ic_sharedAccountStore");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    objc_msgSend(v13, "ic_storeAccountForStoreAccountID:error:", v8, &v57);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSSet *)v57;

    if (!v14)
    {
      v19 = os_log_create("com.apple.amp.iTunesCloud", "Default");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        -[ICStoreRequestContext identity](self->_requestContext, "identity");
        v20 = (NSSet *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v62 = self;
        v63 = 2114;
        v64 = v20;
        v65 = 2114;
        v66 = v10;
        _os_log_impl(&dword_1A03E3000, v19, OS_LOG_TYPE_ERROR, "%{public}@ Failed to lookup account for user identity %{public}@. err=%{public}@", buf, 0x20u);

      }
      -[ICRequestOperation finishWithError:](self, "finishWithError:", v10);
      goto LABEL_44;
    }
    v46 = v10;
    objc_msgSend(v14, "ams_automaticDownloadKinds");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v47 = v14;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
      v17 = (NSSet *)objc_claimAutoreleasedReturnValue();
    }
    v21 = v17;

    v22 = (void *)-[NSSet mutableCopy](v21, "mutableCopy");
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v23 = self->_mediaKindsToRemove;
    v24 = -[NSSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v54;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v54 != v26)
            objc_enumerationMutation(v23);
          objc_msgSend(v22, "removeObject:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i));
        }
        v25 = -[NSSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
      }
      while (v25);
    }
    v45 = v21;

    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v28 = self->_mediaKindsToAdd;
    v29 = -[NSSet countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v50;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v50 != v31)
            objc_enumerationMutation(v28);
          v33 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j);
          if ((objc_msgSend(v22, "containsObject:", v33, v45) & 1) == 0)
            objc_msgSend(v22, "addObject:", v33);
        }
        v30 = -[NSSet countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
      }
      while (v30);
    }

    v34 = v22;
    v35 = v45;
    if (v45 == v34)
    {

      v10 = v46;
      v14 = v47;
    }
    else
    {
      v36 = -[NSSet isEqual:](v45, "isEqual:", v34);

      v10 = v46;
      v14 = v47;
      if ((v36 & 1) == 0)
      {
        v37 = os_log_create("com.apple.amp.iTunesCloud", "Default");
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v62 = self;
          v63 = 2114;
          v64 = v45;
          v65 = 2114;
          v66 = v34;
          _os_log_impl(&dword_1A03E3000, v37, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating media kinds from %{public}@ --> %{public}@", buf, 0x20u);
        }

        v38 = (void *)MEMORY[0x1E0CFD9E8];
        objc_msgSend(MEMORY[0x1E0CFD9E0], "bagSubProfile");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CFD9E0], "bagSubProfileVersion");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "bagForProfile:profileVersion:", v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = v45;
        v14 = v47;
        v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFD9E0]), "initWithEnabledMediaKinds:account:bag:presentationDelegate:", v34, v47, v41, self);
        objc_msgSend(v42, "perform");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __53__ICUpdateAutomaticDownloadMediaKindsRequest_execute__block_invoke;
        v48[3] = &unk_1E438FD20;
        v48[4] = self;
        objc_msgSend(v43, "resultWithCompletion:", v48);

        v10 = v46;
LABEL_43:

LABEL_44:
LABEL_45:

        goto LABEL_46;
      }
    }
    v44 = os_log_create("com.apple.amp.iTunesCloud", "Default");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v62 = self;
      _os_log_impl(&dword_1A03E3000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ No change in media types - finishing", buf, 0xCu);
    }

    -[ICRequestOperation finishWithError:](self, "finishWithError:", 0);
    goto LABEL_43;
  }
  v18 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v62 = self;
    _os_log_impl(&dword_1A03E3000, v18, OS_LOG_TYPE_ERROR, "%{public}@ No active account so nothing to do", buf, 0xCu);
  }

  -[ICRequestOperation finishWithError:](self, "finishWithError:", 0);
LABEL_46:

}

- (void)handleAuthenticateRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  ICUpdateAutomaticDownloadMediaKindsRequest *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ handling authentication request %{public}@", buf, 0x16u);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFD9D8]), "initWithRequest:", v6);
  objc_msgSend(v9, "performAuthentication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__ICUpdateAutomaticDownloadMediaKindsRequest_handleAuthenticateRequest_completion___block_invoke;
  v12[3] = &unk_1E438FD48;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "addFinishBlock:", v12);

}

- (void)handleDialogRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  ICUpdateAutomaticDownloadMediaKindsRequest *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v15 = self;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ handling dialog request %{public}@", buf, 0x16u);
  }

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDC48]), "initWithRequest:", v6);
  objc_msgSend(v9, "present");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__ICUpdateAutomaticDownloadMediaKindsRequest_handleDialogRequest_completion___block_invoke;
  v12[3] = &unk_1E438FD70;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  objc_msgSend(v10, "addFinishBlock:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaKindsToRemove, 0);
  objc_storeStrong((id *)&self->_mediaKindsToAdd, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
}

void __77__ICUpdateAutomaticDownloadMediaKindsRequest_handleDialogRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ dialog task complete error=%{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ dialog task complete", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __83__ICUpdateAutomaticDownloadMediaKindsRequest_handleAuthenticateRequest_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a2;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v10;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ Authentication task complete error=%{public}@", (uint8_t *)&v12, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(a1 + 32);
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Authentication task complete", (uint8_t *)&v12, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __53__ICUpdateAutomaticDownloadMediaKindsRequest_execute__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_create("com.apple.amp.iTunesCloud", "Default");
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "msv_description");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v9;
      v15 = 2114;
      v16 = v5;
      v17 = 2114;
      v18 = v10;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_ERROR, "%{public}@ AMSAutomaticDownloadKindsSetTask completed with result %{public}@ error=%{public}@", (uint8_t *)&v13, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "msv_errorWithDomain:code:underlyingError:debugDescription:", CFSTR("ICError"), 0, v6, CFSTR("AMSAutomaticDownloadKindsSetTask failed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = 138543618;
      v14 = v12;
      v15 = 2114;
      v16 = v5;
      _os_log_impl(&dword_1A03E3000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ AMSAutomaticDownloadKindsSetTask completed with result %{public}@", (uint8_t *)&v13, 0x16u);
    }

    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v11);

}

+ (NSSet)automaticDownloadMediaKindsForMusic
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("music-video"), CFSTR("song"), 0);
}

@end
