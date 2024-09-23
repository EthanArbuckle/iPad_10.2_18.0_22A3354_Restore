@implementation SearchUIAppColorGenerator

- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__SearchUIAppColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke;
  v7[3] = &unk_1EA1F6908;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v7);

}

void __70__SearchUIAppColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  id v20;

  objc_msgSend(*(id *)(a1 + 32), "sfColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_opt_new();
  v20 = 0;
  objc_msgSend(v4, "colorsForBundleIdentifier:error:", v3, &v20);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v20;

  objc_msgSend(v5, "backgroundGradient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v6, "startColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "platformColor", v18);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);

  }
  objc_msgSend(v6, "endColor", v18);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    v13 = v11 == v9;
  else
    v13 = 1;
  if (!v13)
  {
    objc_msgSend(v11, "platformColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v14);

  }
  objc_msgSend(v7, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "isEqual:", v16);

  if (v17)
  {

    v7 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (int)defaultTintStyle
{
  return 1;
}

@end
