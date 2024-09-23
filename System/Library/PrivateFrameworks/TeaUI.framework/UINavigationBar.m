@implementation UINavigationBar

uint64_t __41__UINavigationBar_Bridge__ts_contentView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("_UINavigationBarContentView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __44__UINavigationBar_Bridge__ts_barButtonViews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  TUNavigationBarCompressibleBarButtonItemView *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "ts_barButtonItemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EEF537C0);
    v5 = *(void **)(a1 + 32);
    v6 = [TUNavigationBarCompressibleBarButtonItemView alloc];
    if (v4)
      v7 = -[TUNavigationBarCompressibleBarButtonItemView initWithCustomItemView:](v6, "initWithCustomItemView:", v9);
    else
      v7 = -[TUNavigationBarCompressibleBarButtonItemView initWithRegularItemView:](v6, "initWithRegularItemView:", v9);
    v8 = (void *)v7;
    objc_msgSend(v5, "addObject:", v7);

    v3 = v9;
  }

}

void __44__UINavigationBar_Bridge__ts_barButtonViews__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  TUNavigationBarCompressibleBarButtonItemView *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "ts_barButtonItemView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v3;
    v4 = objc_msgSend(v3, "conformsToProtocol:", &unk_1EEF537C0);
    v5 = *(void **)(a1 + 32);
    v6 = [TUNavigationBarCompressibleBarButtonItemView alloc];
    if (v4)
      v7 = -[TUNavigationBarCompressibleBarButtonItemView initWithCustomItemView:](v6, "initWithCustomItemView:", v9);
    else
      v7 = -[TUNavigationBarCompressibleBarButtonItemView initWithRegularItemView:](v6, "initWithRegularItemView:", v9);
    v8 = (void *)v7;
    objc_msgSend(v5, "addObject:", v7);

    v3 = v9;
  }

}

void __46__UINavigationBar_Bridge__syncBarButtonItems___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  _BOOL4 IsIdentity;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  float v20;
  CGAffineTransform v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "ts_fetchCompressibleTitleView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v4 = *(id *)(a1 + 32);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (!v5)
      goto LABEL_21;
    v6 = v5;
    v7 = *(_QWORD *)v23;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v10 = *(void **)(a1 + 40);
        if (v10)
          objc_msgSend(v10, "transform");
        else
          memset(&v21, 0, sizeof(v21));
        IsIdentity = CGAffineTransformIsIdentity(&v21);
        objc_msgSend(v9, "ts_compressibleBarButtonItemView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (IsIdentity)
        {
          if (v12)
          {
            objc_msgSend(v12, "setContentAlpha:", 1.0);
            v14 = 0.0;
LABEL_15:
            objc_msgSend(v13, "setVerticalOffset:", v14, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx);
            goto LABEL_19;
          }
          objc_msgSend(v9, "ts_barButtonItemView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "layer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          LODWORD(v19) = 1.0;
        }
        else
        {
          objc_msgSend(v3, "contentAlpha");
          if (v13)
          {
            objc_msgSend(v13, "setContentAlpha:");
            objc_msgSend(v3, "verticalOffset");
            goto LABEL_15;
          }
          v20 = v15;
          objc_msgSend(v9, "ts_barButtonItemView");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "layer");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          *(float *)&v19 = v20;
        }
        objc_msgSend(v17, "setOpacity:", v19, *(_OWORD *)&v21.a, *(_OWORD *)&v21.c, *(_OWORD *)&v21.tx, (_QWORD)v22);

LABEL_19:
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (!v6)
      {
LABEL_21:

        break;
      }
    }
  }

}

@end
