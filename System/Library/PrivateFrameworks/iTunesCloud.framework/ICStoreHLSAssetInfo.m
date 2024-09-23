@implementation ICStoreHLSAssetInfo

- (ICStoreHLSAssetInfo)initWithItemResponseDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ICStoreHLSAssetInfo *v7;
  ICStoreHLSAssetInfo *v8;
  uint64_t v9;
  NSDictionary *itemResponseDictionary;
  ICStoreHLSAssetInfo *v11;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("hls-playlist-url"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString() && objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[ICStoreHLSAssetInfo init](self, "init");
      v8 = v7;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_playlistURL, v6);
        v9 = objc_msgSend(v4, "copy");
        itemResponseDictionary = v8->_itemResponseDictionary;
        v8->_itemResponseDictionary = (NSDictionary *)v9;

      }
      self = v8;
      v11 = self;
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSURL)keyCertificateURL
{
  NSURL *keyCertificateURL;
  NSURL *v3;
  NSDictionary *itemResponseDictionary;
  void *v5;

  keyCertificateURL = self->_keyCertificateURL;
  if (!keyCertificateURL)
  {
    itemResponseDictionary = self->_itemResponseDictionary;
    if (itemResponseDictionary)
    {
      -[NSDictionary objectForKey:](itemResponseDictionary, "objectForKey:", CFSTR("hls-key-cert-url"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString() && objc_msgSend(v5, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
        v3 = (NSURL *)objc_claimAutoreleasedReturnValue();

        return v3;
      }

    }
    v3 = 0;
    return v3;
  }
  v3 = keyCertificateURL;
  return v3;
}

- (NSURL)keyServerURL
{
  NSURL *keyServerURL;
  NSURL *v3;
  NSDictionary *itemResponseDictionary;
  void *v5;

  keyServerURL = self->_keyServerURL;
  if (!keyServerURL)
  {
    itemResponseDictionary = self->_itemResponseDictionary;
    if (itemResponseDictionary)
    {
      -[NSDictionary objectForKey:](itemResponseDictionary, "objectForKey:", CFSTR("hls-key-server-url"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSString() && objc_msgSend(v5, "length"))
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
        v3 = (NSURL *)objc_claimAutoreleasedReturnValue();

        return v3;
      }

    }
    v3 = 0;
    return v3;
  }
  v3 = keyServerURL;
  return v3;
}

- (BOOL)isiTunesStoreStream
{
  NSDictionary *itemResponseDictionary;
  void *v4;
  char v5;

  itemResponseDictionary = self->_itemResponseDictionary;
  if (!itemResponseDictionary)
    return self->_isiTunesStoreStream;
  -[NSDictionary objectForKey:](itemResponseDictionary, "objectForKey:", CFSTR("is-itunes-stream"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (NSURL)alternatePlaylistURL
{
  NSDictionary *itemResponseDictionary;
  void *v3;
  void *v4;

  itemResponseDictionary = self->_itemResponseDictionary;
  if (itemResponseDictionary)
  {
    -[NSDictionary objectForKey:](itemResponseDictionary, "objectForKey:", CFSTR("mp-hls-playlist-url"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString() && objc_msgSend(v3, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return (NSURL *)v4;
}

- (NSURL)alternateKeyCertificateURL
{
  NSDictionary *itemResponseDictionary;
  void *v3;
  void *v4;

  itemResponseDictionary = self->_itemResponseDictionary;
  if (itemResponseDictionary)
  {
    -[NSDictionary objectForKey:](itemResponseDictionary, "objectForKey:", CFSTR("mp-hls-key-cert-url"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString() && objc_msgSend(v3, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return (NSURL *)v4;
}

- (NSURL)alternateKeyServerURL
{
  NSDictionary *itemResponseDictionary;
  void *v3;
  void *v4;

  itemResponseDictionary = self->_itemResponseDictionary;
  if (itemResponseDictionary)
  {
    -[NSDictionary objectForKey:](itemResponseDictionary, "objectForKey:", CFSTR("mp-hls-key-server-url"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString() && objc_msgSend(v3, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return (NSURL *)v4;
}

- (NSSet)audioTraits
{
  NSDictionary *itemResponseDictionary;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  itemResponseDictionary = self->_itemResponseDictionary;
  if (itemResponseDictionary)
  {
    -[NSDictionary objectForKey:](itemResponseDictionary, "objectForKey:", CFSTR("audioTraits"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString() && objc_msgSend(v3, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("[]"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(","));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "msv_map:", &__block_literal_global_23077);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (_NSIsNSArray() && objc_msgSend(v3, "count"))
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return (NSSet *)v8;
}

- (NSString)keyServerProtocolType
{
  NSString *keyServerProtocolType;

  keyServerProtocolType = self->_keyServerProtocolType;
  if (keyServerProtocolType)
    return keyServerProtocolType;
  -[NSDictionary ic_stringValueForKey:](self->_itemResponseDictionary, "ic_stringValueForKey:", CFSTR("key-server-protocol-type"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setITunesStoreStream:(BOOL)a3
{
  self->_isiTunesStoreStream = a3;
}

- (void)setKeyCertificateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setKeyServerURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)playlistURL
{
  return self->_playlistURL;
}

- (void)setPlaylistURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setKeyServerProtocolType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSNumber)keyServerAdamID
{
  return self->_keyServerAdamID;
}

- (void)setKeyServerAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void)setAudioTraits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTraits, 0);
  objc_storeStrong((id *)&self->_keyServerAdamID, 0);
  objc_storeStrong((id *)&self->_keyServerProtocolType, 0);
  objc_storeStrong((id *)&self->_playlistURL, 0);
  objc_storeStrong((id *)&self->_keyServerURL, 0);
  objc_storeStrong((id *)&self->_keyCertificateURL, 0);
  objc_storeStrong((id *)&self->_itemResponseDictionary, 0);
}

id __34__ICStoreHLSAssetInfo_audioTraits__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3500];
  v3 = a2;
  objc_msgSend(v2, "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
