@implementation MTImageAnalyzer

- (MTImageAnalyzer)init
{
  MTImageAnalyzer *v2;
  uint64_t v3;
  NSCache *memoryCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTImageAnalyzer;
  v2 = -[MTImageAnalyzer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    memoryCache = v2->_memoryCache;
    v2->_memoryCache = (NSCache *)v3;

  }
  return v2;
}

- (id)colorThemeForPodcastUuid:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLForKey:", *MEMORY[0x1E0D7F3A8]);

  if (v6)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__4;
    v26 = __Block_byref_object_dispose__4;
    -[NSCache objectForKey:](self->_memoryCache, "objectForKey:", v4);
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)v23[5];
    if (v7)
    {
      v8 = v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D7F218], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mainOrPrivateContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __44__MTImageAnalyzer_colorThemeForPodcastUuid___block_invoke;
      v18[3] = &unk_1EA0C5A48;
      v21 = &v22;
      v11 = v10;
      v19 = v11;
      v12 = v4;
      v20 = v12;
      objc_msgSend(v11, "performBlockAndWait:", v18);
      v13 = v23[5];
      if (v13)
      {
        -[NSCache setObject:forKey:](self->_memoryCache, "setObject:forKey:", v13, v12);
        v8 = (id)v23[5];
      }
      else
      {
        _MTLogCategoryDefault();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v12;
          _os_log_impl(&dword_1DA478000, v14, OS_LOG_TYPE_DEFAULT, "Artwork has not yet been analyzed for podcast with uuid: %@", buf, 0xCu);
        }

        +[MTImageStore defaultStore](MTImageStore, "defaultStore");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "imageForKey:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        -[MTImageAnalyzer addImage:forKey:](self, "addImage:forKey:", v16, v12);
        v8 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    _Block_object_dispose(&v22, 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __44__MTImageAnalyzer_colorThemeForPodcastUuid___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "colorThemeForUuid:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)addImage:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v6, "squareImage");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "scale");
      v11 = v10;
      objc_msgSend(v9, "size");
      v13 = v12;
      v15 = v14;
      v16 = v11 * v14;
      if (v11 * v12 <= 3000.0 && v16 <= 3000.0)
      {
        -[MTImageAnalyzer colorThemeForArtwork:](self, "colorThemeForArtwork:", v9);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          objc_msgSend(MEMORY[0x1E0D7F218], "sharedInstance");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "privateQueueContext");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __35__MTImageAnalyzer_addImage_forKey___block_invoke;
          v26[3] = &unk_1EA0C51D0;
          v22 = v18;
          v27 = v22;
          v23 = v8;
          v28 = v23;
          v29 = v21;
          v24 = v21;
          objc_msgSend(v24, "performBlock:", v26);
          -[NSCache setObject:forKey:](self->_memoryCache, "setObject:forKey:", v22, v23);
          v18 = v22;

        }
        v19 = v18;
      }
      else
      {
        _MTLogCategoryDefault();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138413058;
          v31 = v8;
          v32 = 2048;
          v33 = v13;
          v34 = 2048;
          v35 = v15;
          v36 = 2048;
          v37 = 0x40A7700000000000;
          _os_log_impl(&dword_1DA478000, v18, OS_LOG_TYPE_DEFAULT, "Skipping color analysis for %@ since its too big ({%f,%f} > max size (px) of %f)...", buf, 0x2Au);
        }
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
      v9 = v6;
    }
  }
  else
  {
    v9 = 0;
    v19 = 0;
  }

  return v19;
}

uint64_t __35__MTImageAnalyzer_addImage_forKey___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7F268], "createOrUpdateTheme:forUuid:inMOC:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 48), "saveInCurrentBlock");
  return result;
}

- (id)colorThemeForArtwork:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v12;
  uint8_t v13[16];

  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x1E0CC2330];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithImage:algorithm:", v4, 1);

  objc_msgSend(v5, "analyze");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(v6, "backgroundColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v8);

    objc_msgSend(v6, "primaryTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPrimaryTextColor:", v9);

    objc_msgSend(v6, "secondaryTextColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSecondaryTextColor:", v10);

    objc_msgSend(v7, "setIsBackgroundLight:", objc_msgSend(v6, "isBackgroundColorLight"));
  }
  else
  {
    _MTLogCategoryDefault();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1DA478000, v12, OS_LOG_TYPE_DEFAULT, "Unable to analyze image colors.", v13, 2u);
    }

    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memoryCache, 0);
}

@end
