@implementation UINavigationBar(Bridge)

- (TUNavigationBarCompressibleTitleView)ts_fetchCompressibleTitleView
{
  void *v2;
  void *v3;
  TUNavigationBarCompressibleTitleView *v4;
  void *v5;

  objc_msgSend(a1, "ts_contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "fetchCustomTitleViewInView:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[TUNavigationBarCompressibleTitleView initWithCustomTitleView:]([TUNavigationBarCompressibleTitleView alloc], "initWithCustomTitleView:", v3);
  }
  else
  {
    objc_msgSend(a1, "fetchRegularTitleViewInView:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v4 = -[TUNavigationBarCompressibleTitleView initWithRegularTitleView:]([TUNavigationBarCompressibleTitleView alloc], "initWithRegularTitleView:", v5);
    else
      v4 = 0;

  }
  return v4;
}

- (id)ts_contentView
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", &__block_literal_global_2);

  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "subviews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)fetchCustomTitleViewInView:()Bridge
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EEF7AC60))
  {
    v5 = v4;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "fetchCustomTitleViewInView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v5 = (id)v11;

            goto LABEL_13;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

+ (uint64_t)ts_chromelessBarsEnabled
{
  return _os_feature_enabled_impl();
}

- (void)ts_setBlurthroughBackground
{
  void *v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3F50], "ts_sideBarEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundEffects:", v3);

}

- (id)ts_barButtonViews
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "topItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rightBarButtonItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __44__UINavigationBar_Bridge__ts_barButtonViews__block_invoke;
  v15[3] = &unk_1E6309630;
  v6 = v2;
  v16 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v15);

  objc_msgSend(a1, "topItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leftBarButtonItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __44__UINavigationBar_Bridge__ts_barButtonViews__block_invoke_2;
  v13[3] = &unk_1E6309630;
  v9 = v6;
  v14 = v9;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

- (void)ts_resetButtonTransforms
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _OWORD v17[8];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(a1, "ts_barButtonViews");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v19;
    v15 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v16 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v13 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v14 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v11 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v12 = *MEMORY[0x1E0CD2610];
    v9 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v10 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v19 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "setContentAlpha:", 1.0, v9, v10, v11, v12, v13, v14, v15, v16);
        objc_msgSend(v6, "view");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "layer");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v17[4] = v16;
        v17[5] = v15;
        v17[6] = v14;
        v17[7] = v13;
        v17[0] = v12;
        v17[1] = v11;
        v17[2] = v10;
        v17[3] = v9;
        objc_msgSend(v8, "setTransform:", v17);

      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v3);
  }

}

- (id)ts_fetchTitleView
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ts_fetchCompressibleTitleView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)syncBarButtonItems:()Bridge
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  void *v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, a1);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__UINavigationBar_Bridge__syncBarButtonItems___block_invoke;
  v6[3] = &unk_1E63096A0;
  objc_copyWeak(&v9, &location);
  v7 = v4;
  v8 = a1;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)fetchRegularTitleViewInView:()Bridge
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
  }
  else
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(a1, "fetchRegularTitleViewInView:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v5 = (id)v11;

            goto LABEL_13;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          continue;
        break;
      }
    }

    v5 = 0;
  }
LABEL_13:

  return v5;
}

@end
