@implementation WLKMovieClip

+ (id)movieClipsWithArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  WLKMovieClip *v12;
  WLKMovieClip *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (v10)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v11 = v10;
              v12 = [WLKMovieClip alloc];
              v13 = -[WLKMovieClip initWithDictionary:](v12, "initWithDictionary:", v11, (_QWORD)v16);

              objc_msgSend(v4, "addObject:", v13);
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v14 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (WLKMovieClip)initWithDictionary:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  WLKMovieClipPreviewArtwork *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  WLKMovieClip *v18;

  v4 = a3;
  if (v4)
  {
    v5 = -[WLKMovieClip _init](self, "_init");
    if (v5)
    {
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("title"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "copy");
      v8 = (void *)v5[1];
      v5[1] = v7;

      objc_msgSend(v4, "wlk_dictionaryForKey:", CFSTR("previewArtwork"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = -[WLKMovieClipPreviewArtwork initWithDictionary:]([WLKMovieClipPreviewArtwork alloc], "initWithDictionary:", v9);
        v11 = (void *)v5[2];
        v5[2] = v10;

      }
      objc_msgSend(v4, "wlk_arrayForKey:", CFSTR("clipAssets"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        +[WLKMovieClipAsset movieClipAssetsWithArray:](WLKMovieClipAsset, "movieClipAssetsWithArray:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "copy");
        v15 = (void *)v5[3];
        v5[3] = v14;

      }
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("hlsUrl"));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v5[4];
      v5[4] = v16;

    }
    self = v5;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WLKMovieClip;
  return -[WLKMovieClip init](&v3, sel_init);
}

- (WLKMovieClip)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("WLKMovieClip"), CFSTR("-init is not supported. Use -initWithDictionary:"));

  return 0;
}

- (WLKMovieClipAsset)preferredAsset
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  v16 = 0;
  v17[0] = CFSTR("1080pHdVideo");
  v17[1] = CFSTR("720pHdVideo");
  v17[2] = CFSTR("sd480pVideo");
  v17[3] = CFSTR("sdVideo");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__WLKMovieClip_preferredAsset__block_invoke;
  v10[3] = &unk_1E68A98F8;
  v10[4] = self;
  v10[5] = &v11;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);
  v4 = (void *)v12[5];
  if (!v4)
  {
    -[WLKMovieClip assets](self, "assets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v12[5];
    v12[5] = v6;

    v4 = (void *)v12[5];
  }
  v8 = v4;

  _Block_object_dispose(&v11, 8);
  return (WLKMovieClipAsset *)v8;
}

void __30__WLKMovieClip_preferredAsset__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "assets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__WLKMovieClip_preferredAsset__block_invoke_2;
  v10[3] = &unk_1E68A98D0;
  v8 = *(_QWORD *)(a1 + 40);
  v11 = v6;
  v12 = v8;
  v13 = a4;
  v9 = v6;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

}

void __30__WLKMovieClip_preferredAsset__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "flavor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
    **(_BYTE **)(a1 + 48) = 1;
  }

}

- (id)preferredURL
{
  void *v3;
  void *v4;

  -[WLKMovieClip hlsUrl](self, "hlsUrl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[WLKMovieClip preferredAsset](self, "preferredAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "url");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (WLKMovieClipPreviewArtwork)previewArtwork
{
  return self->_previewArtwork;
}

- (NSArray)assets
{
  return self->_assets;
}

- (NSString)hlsUrl
{
  return self->_hlsUrl;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hlsUrl, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_previewArtwork, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
