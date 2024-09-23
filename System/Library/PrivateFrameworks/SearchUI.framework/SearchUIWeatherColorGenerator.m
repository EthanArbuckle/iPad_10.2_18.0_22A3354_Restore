@implementation SearchUIWeatherColorGenerator

- (void)generateUIColorsIsDark:(BOOL)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__SearchUIWeatherColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke;
  v7[3] = &unk_1EA1F6908;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  +[SearchUIUtilities dispatchAsyncIfNecessary:](SearchUIUtilities, "dispatchAsyncIfNecessary:", v7);

}

void __74__SearchUIWeatherColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isDayLightForLocation;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t v18;

  objc_msgSend(*(id *)(a1 + 32), "sfColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lat");
  v17 = v4;

  objc_msgSend(v2, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lng");
  v18 = v6;

  objc_msgSend(v2, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v2, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x1DF0A8080]();

  }
  else
  {
    CFAbsoluteTimeGetCurrent();
  }

  isDayLightForLocation = geo_isDayLightForLocation();
  v10 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "sfColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __74__SearchUIWeatherColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke_2;
  v13[3] = &unk_1EA1F6C50;
  v16 = isDayLightForLocation;
  v14 = v2;
  v15 = *(id *)(a1 + 40);
  v12 = v2;
  objc_msgSend(v10, "generateHexColorsWithSfColor:completionHandler:", v11, v13);

}

void __74__SearchUIWeatherColorGenerator_generateUIColorsIsDark_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        +[SearchUIBackgroundColorUtilities colorWithHexString:](SearchUIBackgroundColorUtilities, "colorWithHexString:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v9));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v7);
  }

  if (*(_BYTE *)(a1 + 48))
  {
    if (UIAccessibilityDarkerSystemColorsEnabled())
    {
      objc_msgSend(*(id *)(a1 + 32), "condition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", CFSTR("haze")) & 1) != 0)
      {
        v12 = 0.3;
      }
      else if (objc_msgSend(v11, "isEqualToString:", CFSTR("cloudy")))
      {
        v12 = 0.3;
      }
      else
      {
        v12 = 0.2;
      }

    }
    else
    {
      v12 = 0.1;
    }
  }
  else
  {
    v12 = 0.0;
  }
  v13 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v4;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    v18 = 1.0 - v12;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v20 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v19);
        v24 = 0.0;
        v25 = 0.0;
        v22 = 0.0;
        v23 = 0.0;
        objc_msgSend(v20, "getRed:green:blue:alpha:", &v25, &v24, &v23, &v22);
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v18 * v25, v18 * v24, v18 * v23, v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v21);

        ++v19;
      }
      while (v16 != v19);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v16);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (int)defaultTintStyle
{
  return 1;
}

@end
