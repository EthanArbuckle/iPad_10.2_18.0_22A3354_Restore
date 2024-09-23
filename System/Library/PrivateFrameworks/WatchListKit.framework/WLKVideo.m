@implementation WLKVideo

+ (id)videosWithDictionaries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  WLKVideo *v11;
  WLKVideo *v12;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
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
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = [WLKVideo alloc];
        v12 = -[WLKVideo initWithDictionary:](v11, "initWithDictionary:", v10, (_QWORD)v16);
        if (v12)
          objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v4, "count"))
    v13 = v4;
  else
    v13 = 0;
  v14 = v13;

  return v14;
}

- (WLKVideo)initWithDictionary:(id)a3
{
  id v4;
  WLKVideo *v5;
  uint64_t v6;
  NSString *ID;
  uint64_t v8;
  NSString *externalID;
  uint64_t v10;
  NSString *title;
  void *v12;
  WLKVideoAsset *v13;
  WLKVideoAsset *asset;
  void *v15;
  WLKArtworkVariantListing *v16;
  WLKArtworkVariantListing *images;
  void *v18;
  WLKVideo *v19;
  objc_super v21;

  v4 = a3;
  if (v4)
  {
    v21.receiver = self;
    v21.super_class = (Class)WLKVideo;
    v5 = -[WLKVideo init](&v21, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("id"));
      v6 = objc_claimAutoreleasedReturnValue();
      ID = v5->_ID;
      v5->_ID = (NSString *)v6;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("externalId"));
      v8 = objc_claimAutoreleasedReturnValue();
      externalID = v5->_externalID;
      v5->_externalID = (NSString *)v8;

      objc_msgSend(v4, "wlk_stringForKey:", CFSTR("title"));
      v10 = objc_claimAutoreleasedReturnValue();
      title = v5->_title;
      v5->_title = (NSString *)v10;

      objc_msgSend(v4, "wlk_dictionaryForKey:", CFSTR("assets"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        v13 = -[WLKVideoAsset initWithDictionary:]([WLKVideoAsset alloc], "initWithDictionary:", v12);
        asset = v5->_asset;
        v5->_asset = v13;

      }
      objc_msgSend(v4, "wlk_dictionaryForKey:", CFSTR("images"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[WLKArtworkVariantListing initWithArtworkDictionary:]([WLKArtworkVariantListing alloc], "initWithArtworkDictionary:", v15);
      images = v5->_images;
      v5->_images = v16;

      objc_msgSend(v4, "wlk_numberForKey:", CFSTR("duration"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_duration = objc_msgSend(v18, "unsignedIntegerValue");

    }
    self = v5;
    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSString)ID
{
  return self->_ID;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)title
{
  return self->_title;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (WLKArtworkVariantListing)images
{
  return self->_images;
}

- (WLKVideoAsset)asset
{
  return self->_asset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_ID, 0);
}

@end
