@implementation ICStoreFileAssetInfo

- (ICStoreFileAssetInfo)initWithAssetURL:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  ICStoreFileAssetInfo *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "absoluteString");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    v9 = CFSTR("URL");
    v10[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[ICStoreFileAssetInfo initWithFileAssetResponseDictionary:](self, "initWithFileAssetResponseDictionary:", v6);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (ICStoreFileAssetInfo)initWithFileAssetResponseDictionary:(id)a3
{
  id v4;
  ICStoreFileAssetInfo *v5;
  uint64_t v6;
  NSDictionary *responseDictionary;

  v4 = a3;
  v5 = -[ICStoreFileAssetInfo init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    responseDictionary = v5->_responseDictionary;
    v5->_responseDictionary = (NSDictionary *)v6;

  }
  return v5;
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (NSURL)assetURL
{
  NSDictionary *responseDictionary;
  void *v4;
  NSURL *v5;

  responseDictionary = self->_responseDictionary;
  if (responseDictionary)
  {
    -[NSDictionary objectForKey:](responseDictionary, "objectForKey:", CFSTR("URL"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString() && objc_msgSend(v4, "length"))
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v4);
      v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = self->_assetURL;
  }
  return v5;
}

- (NSString)downloadKey
{
  NSDictionary *responseDictionary;
  void *v4;
  NSString *v5;

  responseDictionary = self->_responseDictionary;
  if (responseDictionary)
  {
    -[NSDictionary objectForKey:](responseDictionary, "objectForKey:", CFSTR("downloadKey"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString()
      && objc_msgSend(v4, "length")
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("null")) & 1) == 0)
    {
      v5 = v4;
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = self->_downloadKey;
  }
  return v5;
}

- (NSArray)fairPlayInfoList
{
  NSDictionary *responseDictionary;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  ICStoreFileAssetFairPlayInfo *v12;
  ICStoreFileAssetFairPlayInfo *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  responseDictionary = self->_responseDictionary;
  if (!responseDictionary)
    return self->_fairPlayInfoList;
  -[NSDictionary objectForKey:](responseDictionary, "objectForKey:", CFSTR("sinfs"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (_NSIsNSDictionary())
          {
            v12 = [ICStoreFileAssetFairPlayInfo alloc];
            v13 = -[ICStoreFileAssetFairPlayInfo initWithResponseSinfDictionary:](v12, "initWithResponseSinfDictionary:", v11, (_QWORD)v15);
            if (v13)
            {
              if (!v8)
                v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
              objc_msgSend(v8, "addObject:", v13);
            }

          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
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

  return (NSArray *)v8;
}

- (NSString)fileExtension
{
  NSDictionary *responseDictionary;
  NSString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  responseDictionary = self->_responseDictionary;
  v4 = self->_fileExtension;
  v5 = (__CFString *)v4;
  if (responseDictionary)
  {
    if (!-[NSString length](v4, "length"))
    {
      -[ICStoreFileAssetInfo _metadataDictionary](self, "_metadataDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("fileExtension"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (_NSIsNSString() && objc_msgSend(v7, "length"))
      {
        v8 = v7;

        v5 = v8;
      }

    }
    if (!-[__CFString length](v5, "length"))
    {

      v5 = CFSTR("m4a");
    }
  }
  return (NSString *)v5;
}

- (int64_t)flavorType
{
  NSDictionary *responseDictionary;
  void *v4;
  id v5;
  int64_t v6;

  responseDictionary = self->_responseDictionary;
  if (!responseDictionary)
    return self->_flavorType;
  -[NSDictionary objectForKey:](responseDictionary, "objectForKey:", CFSTR("flavor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSString() && objc_msgSend(v4, "length"))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LWHQ")) & 1) != 0)
    {
      v6 = 102;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("HQ")) & 1) != 0)
    {
      v6 = 101;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("LW")) & 1) != 0)
    {
      v6 = 103;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SLW")) & 1) != 0)
    {
      v6 = 104;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("1080p")) & 1) != 0)
    {
      v6 = 203;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("720p")) & 1) != 0
           || (objc_msgSend(v5, "isEqualToString:", CFSTR("hdmv")) & 1) != 0)
    {
      v6 = 202;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("480p")) & 1) != 0)
    {
      v6 = 201;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("SDMV")))
    {
      v6 = 201;
    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)fileSize
{
  NSDictionary *responseDictionary;
  void *v4;
  void *v5;
  unint64_t v6;

  responseDictionary = self->_responseDictionary;
  if (!responseDictionary)
    return self->_fileSize;
  -[NSDictionary objectForKey:](responseDictionary, "objectForKey:", CFSTR("fileSize"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("file-size"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("asset-info"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (_NSIsNSDictionary())
      {
        objc_msgSend(v5, "objectForKey:", CFSTR("file-size"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }

    }
  }
  if (_NSIsNSNumber())
    v6 = objc_msgSend(v4, "unsignedLongLongValue");
  else
    v6 = 0;

  return v6;
}

- (ICStoreFinanceItemMetadata)metadata
{
  NSDictionary *responseDictionary;
  void *v4;
  ICStoreFinanceItemMetadata *v5;

  responseDictionary = self->_responseDictionary;
  if (responseDictionary)
  {
    -[NSDictionary objectForKey:](responseDictionary, "objectForKey:", CFSTR("metadata"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSDictionary())
      v5 = -[ICStoreFinanceItemMetadata initWithMetadataDictionary:]([ICStoreFinanceItemMetadata alloc], "initWithMetadataDictionary:", v4);
    else
      v5 = 0;

  }
  else
  {
    v5 = self->_metadata;
  }
  return v5;
}

- (NSData)md5
{
  NSDictionary *responseDictionary;
  void *v4;
  id v5;
  size_t v6;
  id v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  int v11;
  char v12;
  void *v13;
  void *v14;
  NSData *v15;
  size_t v17;

  responseDictionary = self->_responseDictionary;
  if (responseDictionary)
  {
    -[NSDictionary objectForKey:](responseDictionary, "objectForKey:", CFSTR("md5"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (_NSIsNSString())
    {
      v5 = v4;
      v6 = (unint64_t)objc_msgSend(v5, "length") >> 1;
      objc_msgSend(v5, "lowercaseString");
      v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v8 = objc_msgSend(v7, "UTF8String");

      v17 = v6;
      v9 = malloc_type_calloc(v6, 1uLL, 0x100004077774924uLL);
      if (objc_msgSend(v5, "length") >= 1)
      {
        v10 = 0;
        do
        {
          v11 = *(unsigned __int8 *)(v8 + v10);
          v12 = v11 - 48;
          if ((v11 - 48) >= 0xA)
          {
            if ((v11 - 97) > 5)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSData * _Nonnull MSVDataFromHexString(NSString * _Nonnull __strong)");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("NSString+MSVAdditions.h"), 83, CFSTR("Passed non-hex string into MSVDataFromHexString: %@"), v5);

              v12 = 0;
            }
            else
            {
              v12 = v11 - 87;
            }
          }
          v9[(unint64_t)v10 >> 1] += v12 << (4 * ((v10 + 1) & 1));
          ++v10;
        }
        while (v10 < objc_msgSend(v5, "length"));
      }
      v15 = (NSData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v9, v17, 1);

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = self->_md5;
  }
  return v15;
}

- (int64_t)protectionType
{
  void *v3;
  uint64_t v4;

  -[ICStoreFileAssetInfo fairPlayInfoList](self, "fairPlayInfoList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return self->_expectedProtectionType;
  else
    return 1;
}

- (id)_metadataDictionary
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_responseDictionary, "objectForKey:", CFSTR("metadata"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSDictionary())
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (void)setAssetURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setDownloadKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFairPlayInfoList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setFlavorType:(int64_t)a3
{
  self->_flavorType = a3;
}

- (void)setFileExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setFileSize:(unint64_t)a3
{
  self->_fileSize = a3;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setMd5:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)expectedProtectionType
{
  return self->_expectedProtectionType;
}

- (void)setExpectedProtectionType:(int64_t)a3
{
  self->_expectedProtectionType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_md5, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_fileExtension, 0);
  objc_storeStrong((id *)&self->_fairPlayInfoList, 0);
  objc_storeStrong((id *)&self->_downloadKey, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_responseDictionary, 0);
}

@end
