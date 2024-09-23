@implementation SKUIMediaSocialLoadProfilePhotoOperation

- (SKUIMediaSocialLoadProfilePhotoOperation)initWithClientContext:(id)a3
{
  id v5;
  SKUIMediaSocialLoadProfilePhotoOperation *v6;
  SKUIMediaSocialLoadProfilePhotoOperation *v7;
  NSLock *v8;
  NSLock *lock;
  objc_super v11;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    -[SKUIMediaSocialLoadProfilePhotoOperation initWithClientContext:].cold.1();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIMediaSocialLoadProfilePhotoOperation;
  v6 = -[SSVOperation init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clientContext, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v7->_lock;
    v7->_lock = v8;

    -[NSLock setName:](v7->_lock, "setName:", CFSTR("com.apple.MediaSocial.loadProfilePhoto"));
  }

  return v7;
}

- (id)outputBlock
{
  void *v3;
  void *v4;

  -[NSLock lock](self->_lock, "lock");
  v3 = (void *)objc_msgSend(self->_outputBlock, "copy");
  -[NSLock unlock](self->_lock, "unlock");
  v4 = _Block_copy(v3);

  return v4;
}

- (void)setOutputBlock:(id)a3
{
  void *v4;
  id outputBlock;
  id v6;

  v6 = a3;
  -[NSLock lock](self->_lock, "lock");
  if (self->_outputBlock != v6)
  {
    v4 = (void *)objc_msgSend(v6, "copy");
    outputBlock = self->_outputBlock;
    self->_outputBlock = v4;

  }
  -[NSLock unlock](self->_lock, "unlock");

}

- (void)main
{
  void *v3;

  -[SKUIMediaSocialLoadProfilePhotoOperation _silhouette](self, "_silhouette");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIMediaSocialLoadProfilePhotoOperation _returnPhoto:isFinal:](self, "_returnPhoto:isFinal:", v3, 0);

  -[SKUIMediaSocialLoadProfilePhotoOperation _fetchProfile](self, "_fetchProfile");
}

- (void)_fetchMonogram
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[SKUIMediaSocialProfile name](self->_profile, "name");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = SKUIContactsUIFramework();
    v4 = (void *)objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(CFSTR("CNMonogrammer"), v3)), "initWithStyle:diameter:", 0, 57.0);
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(" "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    if (!v6)
      goto LABEL_8;
    if (v6 == 1)
    {
      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "monogramForPersonWithFirstName:lastName:", v7, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v5, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "monogramForPersonWithFirstName:lastName:", v7, v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (!v8)
    {
LABEL_8:
      -[SKUIMediaSocialLoadProfilePhotoOperation _silhouette](self, "_silhouette");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SKUIMediaSocialLoadProfilePhotoOperation _returnPhoto:isFinal:](self, "_returnPhoto:isFinal:", v8, 1);

  }
  else
  {
    -[SKUIMediaSocialLoadProfilePhotoOperation _silhouette](self, "_silhouette");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIMediaSocialLoadProfilePhotoOperation _returnPhoto:isFinal:](self, "_returnPhoto:isFinal:", v4, 1);
  }

}

- (void)_fetchPhoto
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id location;

  -[SKUIMediaSocialProfile profileImageURL](self->_profile, "profileImageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAF698]), "initWithURL:", v3);
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __55__SKUIMediaSocialLoadProfilePhotoOperation__fetchPhoto__block_invoke;
    v5[3] = &unk_1E73A9508;
    objc_copyWeak(&v6, &location);
    v5[4] = self;
    objc_msgSend(v4, "setOutputBlock:", v5);
    -[SSVOperation runChildOperation:](self, "runChildOperation:", v4);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);

  }
  else
  {
    -[SKUIMediaSocialLoadProfilePhotoOperation _fetchMonogram](self, "_fetchMonogram");
  }

}

void __55__SKUIMediaSocialLoadProfilePhotoOperation__fetchPhoto__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id WeakRetained;
  void *v6;
  void *v7;
  SKUIStyledImageDataConsumer *v8;
  void *v9;
  id v10;

  v10 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (a3)
  {
    objc_msgSend(WeakRetained, "_fetchMonogram");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithData:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SKUIStyledImageDataConsumer initWithSize:treatment:]([SKUIStyledImageDataConsumer alloc], "initWithSize:treatment:", 10, 56.0, 56.0);
    -[SKUIStyledImageDataConsumer imageForImage:](v8, "imageForImage:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_msgSend(v6, "_returnPhoto:isFinal:", v9, 1);
    else
      objc_msgSend(*(id *)(a1 + 32), "_fetchMonogram");

  }
}

- (void)_fetchProfile
{
  void *v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  _QWORD v6[5];
  NSObject *v7;
  id v8;
  id location;

  +[SKUIMediaSocialProfileCoordinator sharedCoordinator](SKUIMediaSocialProfileCoordinator, "sharedCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = dispatch_semaphore_create(0);
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SKUIMediaSocialLoadProfilePhotoOperation__fetchProfile__block_invoke;
  v6[3] = &unk_1E73A9530;
  objc_copyWeak(&v8, &location);
  v6[4] = self;
  v5 = v4;
  v7 = v5;
  objc_msgSend(v3, "getProfileWithOptions:profileBlock:", 0, v6);
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

void __57__SKUIMediaSocialLoadProfilePhotoOperation__fetchProfile__block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  if (a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v9 = WeakRetained;
    if (a4)
    {
      objc_msgSend(WeakRetained, "_silhouette");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_returnPhoto:isFinal:", v10, 1);

    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 336), a2);
      objc_msgSend(v9, "_fetchPhoto");
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (void)_returnPhoto:(id)a3 isFinal:(BOOL)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  id v11;
  BOOL v12;

  v6 = a3;
  -[SKUIMediaSocialLoadProfilePhotoOperation outputBlock](self, "outputBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__SKUIMediaSocialLoadProfilePhotoOperation__returnPhoto_isFinal___block_invoke;
    block[3] = &unk_1E73A9558;
    v11 = v7;
    v10 = v6;
    v12 = a4;
    dispatch_async(v8, block);

  }
}

uint64_t __65__SKUIMediaSocialLoadProfilePhotoOperation__returnPhoto_isFinal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (id)_silhouette
{
  uint64_t v2;
  void *v3;
  void *v4;

  v2 = SKUIContactsUIFramework();
  v3 = (void *)objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(CFSTR("CNMonogrammer"), v2)), "initWithStyle:diameter:", 0, 57.0);
  objc_msgSend(v3, "silhouetteMonogram");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong(&self->_outputBlock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUIMediaSocialLoadProfilePhotoOperation initWithClientContext:]";
}

@end
