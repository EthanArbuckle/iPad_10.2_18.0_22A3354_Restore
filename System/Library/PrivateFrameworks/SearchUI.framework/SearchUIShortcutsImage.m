@implementation SearchUIShortcutsImage

- (SearchUIShortcutsImage)initWithSFImage:(id)a3
{
  id v4;
  SearchUIShortcutsImage *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SearchUIShortcutsImage;
  v5 = -[SearchUIImage initWithSFImage:](&v10, sel_initWithSFImage_, v4);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0DC7A68]);
    objc_msgSend(v4, "lnPropertyIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithLNPropertyIdentifier:displayStyle:", v7, 0);
    -[SearchUIShortcutsImage setIcon:](v5, "setIcon:", v8);

  }
  return v5;
}

- (void)loadImageWithScale:(double)a3 isDarkStyle:(BOOL)a4 completionHandler:(id)a5
{
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v6 = a5;
  -[SearchUIShortcutsImage icon](self, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_initWeak(&location, self);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __75__SearchUIShortcutsImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke;
    v8[3] = &unk_1EA1F8B88;
    objc_copyWeak(&v10, &location);
    v9 = v6;
    +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD, uint64_t))v6 + 2))(v6, 0, 1);
  }

}

void __75__SearchUIShortcutsImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lnPropertyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__SearchUIShortcutsImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2;
  v7[3] = &unk_1EA1F8B60;
  v8 = v4;
  v9 = *(id *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v5, "loadLNPropertyImageWithCompletion:", v7);

}

void __75__SearchUIShortcutsImage_loadImageWithScale_isDarkStyle_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6 || (objc_msgSend(v5, "imageData"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    SearchUIGeneralLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v14 = 138412546;
      v15 = v8;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_1DAD39000, v7, OS_LOG_TYPE_DEFAULT, "SearchUIShortcutsImage failed to load image with property identifier: %@, error: %@", (uint8_t *)&v14, 0x16u);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 40);
    v11 = objc_alloc(MEMORY[0x1E0DC3870]);
    objc_msgSend(v5, "imageData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithData:", v12);
    (*(void (**)(uint64_t, void *, uint64_t))(v10 + 16))(v10, v13, 1);

  }
}

+ (id)imageFromContexualActionIcon:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "imageData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v3, "imageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImageData:", v6);

    objc_msgSend(v3, "imageScale");
    objc_msgSend(v5, "setScale:");
    goto LABEL_8;
  }
  objc_msgSend(v3, "systemName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v3, "wfIcon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "symbolName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSymbolName:", v9);

    objc_msgSend(v5, "setIsTemplate:", 1);
    objc_msgSend(v5, "setPunchThroughBackground:", 1);
    objc_msgSend(v5, "setCornerRoundingStyle:", 4);
  }
  else
  {
    objc_msgSend(v3, "applicationBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_8;
    v5 = (void *)objc_opt_new();
    objc_msgSend(v3, "applicationBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBundleIdentifier:", v8);
  }

LABEL_8:
  if (!objc_msgSend(v5, "cornerRoundingStyle"))
    objc_msgSend(v5, "setCornerRoundingStyle:", 4 * (objc_msgSend(v3, "displayStyle") == 1));

  return v5;
}

- (WFContextualActionIcon)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
  objc_storeStrong((id *)&self->_icon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_icon, 0);
}

@end
