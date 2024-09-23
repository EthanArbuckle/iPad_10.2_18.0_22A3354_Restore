@implementation WBSFaviconRequestsController

- (WBSFaviconRequestsController)initWithSiteMetadataManager:(id)a3
{
  id v5;
  WBSFaviconRequestsController *v6;
  WBSFaviconRequestsController *v7;
  uint64_t v8;
  NSMapTable *tokenToRequestToken;
  WBSFaviconRequestsController *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSFaviconRequestsController;
  v6 = -[WBSFaviconRequestsController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    tokenToRequestToken = v7->_tokenToRequestToken;
    v7->_tokenToRequestToken = (NSMapTable *)v8;

    v7->_priority = 0;
    v7->_size = (CGSize)WBSFaviconRequestSmallIconSize;
    v10 = v7;
  }

  return v7;
}

- (void)dealloc
{
  NSMapTable *v3;
  objc_super v4;

  v3 = self->_tokenToRequestToken;
  objc_sync_enter(v3);
  objc_sync_exit(v3);

  v4.receiver = self;
  v4.super_class = (Class)WBSFaviconRequestsController;
  -[WBSFaviconRequestsController dealloc](&v4, sel_dealloc);
}

- (void)registerRequestForDomain:(id)a3 withToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSFaviconRequest *v11;
  WBSFaviconRequest *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [WBSFaviconRequest alloc];
  -[WBSFaviconRequestsController size](self, "size");
  v12 = -[WBSFaviconRequest initWithDomain:iconSize:fallbackType:](v11, "initWithDomain:iconSize:fallbackType:", v10, 1);

  -[WBSFaviconRequestsController _issueRequest:isOneTime:withToken:completion:](self, "_issueRequest:isOneTime:withToken:completion:", v12, 0, v9, v8);
}

- (void)registerRequestForURLString:(id)a3 withToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WBSFaviconRequestsController size](self, "size");
  v12 = v11;
  v14 = v13;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__WBSFaviconRequestsController_registerRequestForURLString_withToken_completion___block_invoke;
  v16[3] = &unk_1E5443568;
  v17 = v8;
  v15 = v8;
  -[WBSFaviconRequestsController registerRequestForURLString:withToken:returnDefaultIconIfNoneAvailable:iconSize:isURLTypedByUser:completion:](self, "registerRequestForURLString:withToken:returnDefaultIconIfNoneAvailable:iconSize:isURLTypedByUser:completion:", v10, v9, 1, 0, v16, v12, v14);

}

uint64_t __81__WBSFaviconRequestsController_registerRequestForURLString_withToken_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerRequestForURLString:(id)a3 withToken:(id)a4 returnDefaultIconIfNoneAvailable:(BOOL)a5 iconSize:(CGSize)a6 isURLTypedByUser:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v8;
  double height;
  double width;
  _BOOL4 v11;
  void *v15;
  id v16;
  id v17;
  WBSFaviconRequest *v18;
  id v19;

  v8 = a7;
  height = a6.height;
  width = a6.width;
  v11 = a5;
  v15 = (void *)MEMORY[0x1E0C99E98];
  v16 = a8;
  v17 = a4;
  if (v8)
    objc_msgSend(v15, "safari_URLWithUserTypedString:", a3);
  else
    objc_msgSend(v15, "URLWithString:", a3);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v18 = -[WBSFaviconRequest initWithURL:iconSize:fallbackType:isURLTypedByUser:]([WBSFaviconRequest alloc], "initWithURL:iconSize:fallbackType:isURLTypedByUser:", v19, v11, v8, width, height);
  -[WBSFaviconRequestsController _issueRequest:isOneTime:withToken:completion:](self, "_issueRequest:isOneTime:withToken:completion:", v18, 0, v17, v16);

}

- (void)registerOneTimeRequestForURLString:(id)a3 withToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[WBSFaviconRequestsController size](self, "size");
  v12 = v11;
  v14 = v13;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __88__WBSFaviconRequestsController_registerOneTimeRequestForURLString_withToken_completion___block_invoke;
  v16[3] = &unk_1E5443568;
  v17 = v8;
  v15 = v8;
  -[WBSFaviconRequestsController registerOneTimeRequestForURLString:withToken:returnDefaultIconIfNoneAvailable:iconSize:isURLTypedByUser:completion:](self, "registerOneTimeRequestForURLString:withToken:returnDefaultIconIfNoneAvailable:iconSize:isURLTypedByUser:completion:", v10, v9, 1, 0, v16, v12, v14);

}

uint64_t __88__WBSFaviconRequestsController_registerOneTimeRequestForURLString_withToken_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)registerOneTimeRequestForURLString:(id)a3 withToken:(id)a4 returnDefaultIconIfNoneAvailable:(BOOL)a5 iconSize:(CGSize)a6 isURLTypedByUser:(BOOL)a7 completion:(id)a8
{
  _BOOL8 v8;
  double height;
  double width;
  _BOOL4 v11;
  void *v15;
  id v16;
  id v17;
  WBSFaviconRequest *v18;
  id v19;

  v8 = a7;
  height = a6.height;
  width = a6.width;
  v11 = a5;
  v15 = (void *)MEMORY[0x1E0C99E98];
  v16 = a8;
  v17 = a4;
  if (v8)
    objc_msgSend(v15, "safari_URLWithUserTypedString:", a3);
  else
    objc_msgSend(v15, "URLWithString:", a3);
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v18 = -[WBSFaviconRequest initWithURL:iconSize:fallbackType:isURLTypedByUser:]([WBSFaviconRequest alloc], "initWithURL:iconSize:fallbackType:isURLTypedByUser:", v19, v11, v8, width, height);
  -[WBSFaviconRequestsController _issueRequest:isOneTime:withToken:completion:](self, "_issueRequest:isOneTime:withToken:completion:", v18, 1, v17, v16);

}

- (void)registerOneTimeRequestForDomain:(id)a3 withToken:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSFaviconRequest *v11;
  WBSFaviconRequest *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = [WBSFaviconRequest alloc];
  -[WBSFaviconRequestsController size](self, "size");
  v12 = -[WBSFaviconRequest initWithDomain:iconSize:fallbackType:](v11, "initWithDomain:iconSize:fallbackType:", v10, 1);

  -[WBSFaviconRequestsController _issueRequest:isOneTime:withToken:completion:](self, "_issueRequest:isOneTime:withToken:completion:", v12, 1, v9, v8);
}

- (void)cancelAllRegistrationsWithCompletionHandler:(id)a3
{
  NSMapTable *v4;
  WBSSiteMetadataManager *manager;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = self->_tokenToRequestToken;
  objc_sync_enter(v4);
  manager = self->_manager;
  -[NSMapTable objectEnumerator](self->_tokenToRequestToken, "objectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSiteMetadataManager cancelRequestsWithTokens:completionHandler:](manager, "cancelRequestsWithTokens:completionHandler:", v7, v8);

  -[NSMapTable removeAllObjects](self->_tokenToRequestToken, "removeAllObjects");
  objc_sync_exit(v4);

}

- (void)cancelAllRegistrations
{
  -[WBSFaviconRequestsController cancelAllRegistrationsWithCompletionHandler:](self, "cancelAllRegistrationsWithCompletionHandler:", 0);
}

- (void)_issueRequest:(id)a3 isOneTime:(BOOL)a4 withToken:(id)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  NSMapTable *v13;
  WBSSiteMetadataManager *manager;
  void *v15;
  WBSSiteMetadataManager *v16;
  int64_t v17;
  _QWORD *v18;
  id *v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[8];
  id v23;
  _QWORD v24[8];
  id v25;
  id location;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  id *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = self->_tokenToRequestToken;
  objc_sync_enter(v13);
  manager = self->_manager;
  -[NSMapTable objectForKey:](self->_tokenToRequestToken, "objectForKey:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSiteMetadataManager cancelRequestWithToken:](manager, "cancelRequestWithToken:", v15);

  -[NSMapTable removeObjectForKey:](self->_tokenToRequestToken, "removeObjectForKey:", v11);
  v31 = 0;
  v32 = (id *)&v31;
  v33 = 0x3042000000;
  v34 = __Block_byref_object_copy__5;
  v35 = __Block_byref_object_dispose__5;
  v36 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  objc_initWeak(&location, self);
  v16 = self->_manager;
  v17 = -[WBSFaviconRequestsController priority](self, "priority");
  if (v8)
  {
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __77__WBSFaviconRequestsController__issueRequest_isOneTime_withToken_completion___block_invoke;
    v24[3] = &unk_1E5443590;
    v18 = v24;
    v19 = &v25;
    objc_copyWeak(&v25, &location);
    v24[6] = &v27;
    v24[7] = &v31;
    v24[4] = v11;
    v24[5] = v12;
    -[WBSSiteMetadataManager registerOneTimeRequest:priority:responseHandler:](v16, "registerOneTimeRequest:priority:responseHandler:", v10, v17, v24);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __77__WBSFaviconRequestsController__issueRequest_isOneTime_withToken_completion___block_invoke_2;
    v22[3] = &unk_1E5443590;
    v18 = v22;
    v19 = &v23;
    objc_copyWeak(&v23, &location);
    v22[6] = &v27;
    v22[7] = &v31;
    v22[4] = v11;
    v22[5] = v12;
    -[WBSSiteMetadataManager registerRequest:priority:responseHandler:](v16, "registerRequest:priority:responseHandler:", v10, v17, v22);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;

  objc_destroyWeak(v19);
  *((_BYTE *)v28 + 24) = 1;
  if (v21)
  {
    objc_storeWeak(v32 + 5, v21);
    -[NSMapTable setObject:forKey:](self->_tokenToRequestToken, "setObject:forKey:", v21, v11);
  }
  objc_destroyWeak(&location);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  objc_destroyWeak(&v36);

  objc_sync_exit(v13);
}

void __77__WBSFaviconRequestsController__issueRequest_isOneTime_withToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      v5 = WeakRetained[1];
      objc_sync_enter(v5);
      v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      if (!v6
        || (objc_msgSend(v4[1], "objectForKey:", *(_QWORD *)(a1 + 32)),
            v7 = (id)objc_claimAutoreleasedReturnValue(),
            v7,
            v7 != v6))
      {

        objc_sync_exit(v5);
LABEL_8:

        goto LABEL_9;
      }
      objc_msgSend(v4[1], "removeObjectForKey:", *(_QWORD *)(a1 + 32));

      objc_sync_exit(v5);
    }
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v9, "favicon");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, BOOL))(v8 + 16))(v8, v5, objc_msgSend(v9, "faviconType") == 0);
    goto LABEL_8;
  }
LABEL_9:

}

void __77__WBSFaviconRequestsController__issueRequest_isOneTime_withToken_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      goto LABEL_5;
    v5 = WeakRetained[1];
    objc_sync_enter(v5);
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
    if (!v6)
    {
      objc_sync_exit(v5);
      goto LABEL_7;
    }
    v7 = v6;
    objc_msgSend(v4[1], "objectForKey:", *(_QWORD *)(a1 + 32));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v5);
    if (v8 == v7)
    {
LABEL_5:
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v10, "favicon");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, BOOL))(v9 + 16))(v9, v5, objc_msgSend(v10, "faviconType") == 0);
LABEL_7:

    }
  }

}

- (WBSSiteMetadataManager)manager
{
  return self->_manager;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_tokenToRequestToken, 0);
}

@end
