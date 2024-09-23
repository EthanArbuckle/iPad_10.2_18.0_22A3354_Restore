@implementation SSVPlaybackItem

- (SSVPlaybackItem)initWithItemDictionary:(id)a3
{
  id v4;
  SSVPlaybackItem *v5;
  uint64_t v6;
  NSDictionary *itemDictionary;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSVPlaybackItem;
  v5 = -[SSVPlaybackItem init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    itemDictionary = v5->_itemDictionary;
    v5->_itemDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (id)assetForFlavor:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__28;
  v15 = __Block_byref_object_dispose__28;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__SSVPlaybackItem_assetForFlavor___block_invoke;
  v8[3] = &unk_1E47BCE20;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[SSVPlaybackItem _enumerateAssetsUsingBlock:](self, "_enumerateAssetsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __34__SSVPlaybackItem_assetForFlavor___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "flavor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (NSArray)assets
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__SSVPlaybackItem_assets__block_invoke;
  v6[3] = &unk_1E47BCE48;
  v4 = v3;
  v7 = v4;
  -[SSVPlaybackItem _enumerateAssetsUsingBlock:](self, "_enumerateAssetsUsingBlock:", v6);

  return (NSArray *)v4;
}

uint64_t __25__SSVPlaybackItem_assets__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (NSURL)HLSKeyCertificateURL
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("hls-key-cert-url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isNSString")
    || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[SSVPlaybackItem fallbackStreamingKeyCertificateURL](self, "fallbackStreamingKeyCertificateURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v4;
}

- (NSURL)HLSKeyServerURL
{
  void *v3;
  void *v4;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("hls-key-server-url"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isNSString")
    || (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[SSVPlaybackItem fallbackStreamingKeyServerURL](self, "fallbackStreamingKeyServerURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSURL *)v4;
}

- (NSURL)HLSPlaylistURL
{
  void *v2;
  void *v3;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("hls-playlist-url"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isNSString"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSURL *)v3;
}

- (BOOL)isiTunesStoreStream
{
  void *v2;
  char v3;

  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("is-itunes-stream"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = objc_msgSend(v2, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (id)itemIdentifier
{
  return -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("songId"));
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)SSVPlaybackItem;
  -[SSVPlaybackItem description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPlaybackItem itemIdentifier](self, "itemIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSVPlaybackItem assets](self, "assets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ [ID: %@, Assets: %@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;
  objc_super v8;

  -[SSVPlaybackItem itemIdentifier](self, "itemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (id)objc_msgSend(v3, "hash");
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SSVPlaybackItem;
    v5 = -[SSVPlaybackItem hash](&v8, sel_hash);
  }
  v6 = (unint64_t)v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    -[SSVPlaybackItem itemIdentifier](self, "itemIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_enumerateAssetsUsingBlock:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  -[NSDictionary objectForKey:](self->_itemDictionary, "objectForKey:", CFSTR("assets"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__SSVPlaybackItem__enumerateAssetsUsingBlock___block_invoke;
    v6[3] = &unk_1E47BCE70;
    v7 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

  }
}

void __46__SSVPlaybackItem__enumerateAssetsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  SSVPlaybackAsset *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = -[SSVPlaybackAsset initWithAssetDictionary:]([SSVPlaybackAsset alloc], "initWithAssetDictionary:", v4);
    if (v3)
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

- (NSDictionary)itemDictionary
{
  return self->_itemDictionary;
}

- (NSURL)fallbackStreamingKeyServerURL
{
  return self->_fallbackStreamingKeyServerURL;
}

- (void)setFallbackStreamingKeyServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)fallbackStreamingKeyCertificateURL
{
  return self->_fallbackStreamingKeyCertificateURL;
}

- (void)setFallbackStreamingKeyCertificateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallbackStreamingKeyCertificateURL, 0);
  objc_storeStrong((id *)&self->_fallbackStreamingKeyServerURL, 0);
  objc_storeStrong((id *)&self->_itemDictionary, 0);
}

@end
