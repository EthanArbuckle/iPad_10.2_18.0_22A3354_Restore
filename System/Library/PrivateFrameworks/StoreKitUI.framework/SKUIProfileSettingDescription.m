@implementation SKUIProfileSettingDescription

- (SKUIProfileSettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  id v6;
  id v7;
  SKUIProfileSettingDescription *v8;
  NSOperationQueue *v9;
  NSOperationQueue *operationQueue;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIProfileSettingDescription initWithViewElement:parent:].cold.1();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIProfileSettingDescription;
  v8 = -[SKUISettingDescription initWithViewElement:parent:](&v12, sel_initWithViewElement_parent_, v6, v7);
  if (v8)
  {
    v9 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    operationQueue = v8->_operationQueue;
    v8->_operationQueue = v9;

    -[NSOperationQueue setQualityOfService:](v8->_operationQueue, "setQualityOfService:", 25);
    -[NSOperationQueue setName:](v8->_operationQueue, "setName:", CFSTR("com.apple.StoreKitUI.SKUIProfileSettingDescription"));
    -[SKUIProfileSettingDescription reloadData](v8, "reloadData");
  }

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  v3.receiver = self;
  v3.super_class = (Class)SKUIProfileSettingDescription;
  -[SKUIProfileSettingDescription dealloc](&v3, sel_dealloc);
}

- (void)reloadData
{
  -[NSOperationQueue cancelAllOperations](self->_operationQueue, "cancelAllOperations");
  -[SKUIProfileSettingDescription _fetchAccountInfo](self, "_fetchAccountInfo");
  -[SKUIProfileSettingDescription _fetchProfilePhoto](self, "_fetchProfilePhoto");
}

+ (Class)_viewClassForSettingDescription:(id)a3
{
  return (Class)objc_opt_class();
}

- (void)_fetchAccountInfo
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  +[SKUIMediaSocialProfileCoordinator sharedCoordinator](SKUIMediaSocialProfileCoordinator, "sharedCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__SKUIProfileSettingDescription__fetchAccountInfo__block_invoke;
  v4[3] = &unk_1E73A3CA0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "getProfileWithOptions:profileBlock:", 0, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

void __50__SKUIProfileSettingDescription__fetchAccountInfo__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SKUIProfileSettingDescription__fetchAccountInfo__block_invoke_2;
  v5[3] = &unk_1E73A3138;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

  objc_destroyWeak(&v7);
}

void __50__SKUIProfileSettingDescription__fetchAccountInfo__block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = *(void **)(a1 + 32);
  if (v3)
    v4 = WeakRetained == 0;
  else
    v4 = 1;
  if (!v4)
  {
    v10 = WeakRetained;
    objc_msgSend(v3, "name");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v10[5];
    v10[5] = v5;

    objc_msgSend(*(id *)(a1 + 32), "handle");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v10[4];
    v10[4] = v7;

    objc_msgSend(v10, "parent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadSettingDescription:", v10);

    WeakRetained = v10;
  }

}

- (void)_fetchProfilePhoto
{
  void *v3;
  void *v4;
  SKUIMediaSocialLoadProfilePhotoOperation *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, void *, char);
  void *v9;
  id v10;
  id location;

  -[SKUISettingDescription parent](self, "parent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[SKUIMediaSocialLoadProfilePhotoOperation initWithClientContext:]([SKUIMediaSocialLoadProfilePhotoOperation alloc], "initWithClientContext:", v4);
  objc_initWeak(&location, self);
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __51__SKUIProfileSettingDescription__fetchProfilePhoto__block_invoke;
  v9 = &unk_1E73A3CC8;
  objc_copyWeak(&v10, &location);
  -[SKUIMediaSocialLoadProfilePhotoOperation setOutputBlock:](v5, "setOutputBlock:", &v6);
  -[NSOperationQueue addOperation:](self->_operationQueue, "addOperation:", v5, v6, v7, v8, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __51__SKUIProfileSettingDescription__fetchProfilePhoto__block_invoke(uint64_t a1, void *a2, char a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__SKUIProfileSettingDescription__fetchProfilePhoto__block_invoke_2;
  block[3] = &unk_1E73A2000;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a3;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __51__SKUIProfileSettingDescription__fetchProfilePhoto__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && (*(_BYTE *)(a1 + 48) || !WeakRetained[7]))
  {
    v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 7, *(id *)(a1 + 32));
    objc_msgSend(v4, "parent");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadSettingDescription:", v4);

    WeakRetained = v4;
  }

}

- (NSString)handle
{
  return self->_handle;
}

- (NSString)name
{
  return self->_name;
}

- (UIImage)photo
{
  return self->_photo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photo, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_handle, 0);
}

- (void)initWithViewElement:parent:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIProfileSettingDescription initWithViewElement:parent:]";
}

@end
