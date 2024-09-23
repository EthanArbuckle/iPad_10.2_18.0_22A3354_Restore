@implementation PKDiscoveryMedia

- (PKDiscoveryMedia)initWithDictionary:(id)a3
{
  id v4;
  PKDiscoveryMedia *v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t v10;
  PKColor *backgroundColor;
  uint64_t v12;
  NSString *passKitUIImageName;
  uint64_t v14;
  NSURL *localAssetURL;
  void *v16;
  NSDictionary *v17;
  NSObject *v18;
  uint64_t v19;
  NSDictionary *urls;
  _QWORD v22[4];
  NSDictionary *v23;
  PKDiscoveryMedia *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  objc_super v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)PKDiscoveryMedia;
  v5 = -[PKDiscoveryMedia init](&v32, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(CFSTR("image"), "isEqualToString:", v6) & 1) != 0)
    {
      v7 = 1;
    }
    else if ((objc_msgSend(CFSTR("video"), "isEqualToString:", v6) & 1) != 0)
    {
      v7 = 2;
    }
    else if ((objc_msgSend(CFSTR("bundleAsset"), "isEqualToString:", v6) & 1) != 0)
    {
      v7 = 3;
    }
    else if (objc_msgSend(CFSTR("localAsset"), "isEqualToString:", v6))
    {
      v7 = 4;
    }
    else
    {
      v7 = 0;
    }

    v5->_type = v7;
    objc_msgSend(v4, "PKDoubleForKey:", CFSTR("width"));
    v5->_width = v8;
    objc_msgSend(v4, "PKDoubleForKey:", CFSTR("height"));
    v5->_height = v9;
    objc_msgSend(v4, "PKColorForKey:", CFSTR("backgroundColor"));
    v10 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v10;

    objc_msgSend(v4, "PKStringForKey:", CFSTR("bundleAssetFilename"));
    v12 = objc_claimAutoreleasedReturnValue();
    passKitUIImageName = v5->_passKitUIImageName;
    v5->_passKitUIImageName = (NSString *)v12;

    objc_msgSend(v4, "PKURLForKey:", CFSTR("localAssetURL"));
    v14 = objc_claimAutoreleasedReturnValue();
    localAssetURL = v5->_localAssetURL;
    v5->_localAssetURL = (NSURL *)v14;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("urls"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v16, "count"));
    if (v16)
    {
      v26 = 0;
      v27 = &v26;
      v28 = 0x3032000000;
      v29 = __Block_byref_object_copy__13;
      v30 = __Block_byref_object_dispose__13;
      v31 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __39__PKDiscoveryMedia_initWithDictionary___block_invoke;
      v22[3] = &unk_1E2AC4BB0;
      v23 = v17;
      v25 = &v26;
      v24 = v5;
      objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v22);
      if (objc_msgSend((id)v27[5], "length"))
      {
        PKLogFacilityTypeGetObject(0x10uLL);
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = v27[5];
          *(_DWORD *)buf = 138412290;
          v34 = v19;
          _os_log_impl(&dword_18FC92000, v18, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }

      }
      _Block_object_dispose(&v26, 8);

    }
    urls = v5->_urls;
    v5->_urls = v17;

  }
  return v5;
}

void __39__PKDiscoveryMedia_initWithDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PKDiscoveryMediaRemoteAsset *v6;
  void *v7;
  objc_class *v8;
  objc_class *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = -[PKDiscoveryMediaRemoteAsset initWithDictionary:]([PKDiscoveryMediaRemoteAsset alloc], "initWithDictionary:", v5);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v11);
  }
  else
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v6 = (PKDiscoveryMediaRemoteAsset *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("Malformed %@: expected dictionary and received %@"), v6, v10);

  }
}

- (id)imageDataFromCacheWithScale:(double)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKDiscoveryMedia _remoteAssetForScale:](self, "_remoteAssetForScale:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[PKObjectDownloader sharedImageAssetDownloader](PKObjectDownloader, "sharedImageAssetDownloader");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "url");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cachedDataForURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)downloadImageDataWithScale:(double)a3 shouldWriteData:(BOOL)a4 completion:(id)a5
{
  void (**v8)(id, _QWORD, uint64_t);
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  void (**v20)(id, _QWORD, uint64_t);
  BOOL v21;

  v8 = (void (**)(id, _QWORD, uint64_t))a5;
  if (v8)
  {
    -[PKDiscoveryMedia _remoteAssetForScale:](self, "_remoteAssetForScale:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "url");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (self->_type != 1 || v10 == 0)
    {
      v8[2](v8, 0, 1);
    }
    else
    {
      +[PKObjectDownloader sharedImageAssetDownloader](PKObjectDownloader, "sharedImageAssetDownloader");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "cachedDataForURL:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sha1Hex");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
      {
        ((void (**)(id, void *, uint64_t))v8)[2](v8, v14, 1);
      }
      else if (v15 && PKCachedFileForSHA1Exists(v15))
      {
        PKCachedFileForSHA1(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, uint64_t))v8)[2](v8, v17, 1);

      }
      else
      {
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __74__PKDiscoveryMedia_downloadImageDataWithScale_shouldWriteData_completion___block_invoke;
        v18[3] = &unk_1E2AC4BD8;
        v19 = v11;
        v20 = v8;
        v21 = a4;
        objc_msgSend(v13, "downloadFromUrl:completionHandler:", v19, v18);

      }
    }

  }
}

void __74__PKDiscoveryMedia_downloadImageDataWithScale_shouldWriteData_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_4;
  v10 = v8;
  if (objc_msgSend(v10, "statusCode") == 200)
  {

LABEL_4:
    if (v7)
    {
      if (*(_BYTE *)(a1 + 48))
      {
        objc_msgSend(v7, "SHA1Hash");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hexEncoding");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        PKCacheFile(v7, v12);
      }
    }
    else
    {
      PKLogFacilityTypeGetObject(0x10uLL);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v18 = 138412546;
        v19 = v14;
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_18FC92000, v13, OS_LOG_TYPE_DEFAULT, "Failed to download card image from %@ due to %@", (uint8_t *)&v18, 0x16u);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_16;
  }
  PKLogFacilityTypeGetObject(0x10uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = *(_QWORD *)(a1 + 32);
    v18 = 138412546;
    v19 = v16;
    v20 = 1024;
    LODWORD(v21) = objc_msgSend(v10, "statusCode");
    _os_log_impl(&dword_18FC92000, v15, OS_LOG_TYPE_DEFAULT, "Could not download image asset from %@ http status %d", (uint8_t *)&v18, 0x12u);
  }

  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, _QWORD, _QWORD))(v17 + 16))(v17, 0, 0);

LABEL_16:
}

- (id)_remoteAssetForScale:(double)a3
{
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;

  if (a3 <= 2.0)
    v5 = CFSTR("2x");
  else
    v5 = CFSTR("3x");
  v6 = v5;
  -[NSDictionary objectForKey:](self->_urls, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
  }
  else
  {
    if (a3 >= 3.0)
      v9 = CFSTR("2x");
    else
      v9 = CFSTR("3x");
    v10 = v9;

    -[NSDictionary objectForKey:](self->_urls, "objectForKey:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSDictionary *urls;
  NSDictionary *v6;
  NSString *passKitUIImageName;
  NSString *v8;
  NSURL *localAssetURL;
  NSURL *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_type != *((_QWORD *)v4 + 1))
    goto LABEL_18;
  urls = self->_urls;
  v6 = (NSDictionary *)*((_QWORD *)v4 + 2);
  if (urls && v6)
  {
    if ((-[NSDictionary isEqual:](urls, "isEqual:") & 1) == 0)
      goto LABEL_18;
  }
  else if (urls != v6)
  {
    goto LABEL_18;
  }
  if (self->_width != *((double *)v4 + 3)
    || self->_height != *((double *)v4 + 4)
    || !CGColorEqualToColor(-[PKColor CGColor](self->_backgroundColor, "CGColor"), (CGColorRef)objc_msgSend(*((id *)v4 + 5), "CGColor")))
  {
    goto LABEL_18;
  }
  passKitUIImageName = self->_passKitUIImageName;
  v8 = (NSString *)*((_QWORD *)v4 + 6);
  if (!passKitUIImageName || !v8)
  {
    if (passKitUIImageName == v8)
      goto LABEL_14;
LABEL_18:
    v11 = 0;
    goto LABEL_19;
  }
  if ((-[NSString isEqual:](passKitUIImageName, "isEqual:") & 1) == 0)
    goto LABEL_18;
LABEL_14:
  localAssetURL = self->_localAssetURL;
  v10 = (NSURL *)*((_QWORD *)v4 + 7);
  if (localAssetURL && v10)
    v11 = -[NSURL isEqual:](localAssetURL, "isEqual:");
  else
    v11 = localAssetURL == v10;
LABEL_19:

  return v11;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_urls);
  objc_msgSend(v3, "safelyAddObject:", self->_backgroundColor);
  objc_msgSend(v3, "safelyAddObject:", self->_passKitUIImageName);
  objc_msgSend(v3, "safelyAddObject:", self->_localAssetURL);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = (unint64_t)self->_width - v5 + 32 * v5;
  v7 = (unint64_t)self->_height - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("type"), self->_type);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("urls"), self->_urls);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%f'; "), CFSTR("width"), *(_QWORD *)&self->_width);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%f'; "), CFSTR("height"), *(_QWORD *)&self->_height);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("backgroundColor"), self->_backgroundColor);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("bundleAssetFilename"), self->_passKitUIImageName);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%@'; "), CFSTR("localAssetURL"), self->_localAssetURL);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_urls, CFSTR("urls"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("width"), self->_width);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("height"), self->_height);
  objc_msgSend(v5, "encodeObject:forKey:", self->_backgroundColor, CFSTR("backgroundColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_passKitUIImageName, CFSTR("bundleAssetFilename"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localAssetURL, CFSTR("localAssetURL"));

}

- (PKDiscoveryMedia)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryMedia *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *urls;
  double v12;
  double v13;
  uint64_t v14;
  PKColor *backgroundColor;
  uint64_t v16;
  NSString *passKitUIImageName;
  uint64_t v18;
  NSURL *localAssetURL;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKDiscoveryMedia;
  v5 = -[PKDiscoveryMedia init](&v21, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("urls"));
    v10 = objc_claimAutoreleasedReturnValue();
    urls = v5->_urls;
    v5->_urls = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("width"));
    v5->_width = v12;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("height"));
    v5->_height = v13;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("backgroundColor"));
    v14 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v5->_backgroundColor;
    v5->_backgroundColor = (PKColor *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleAssetFilename"));
    v16 = objc_claimAutoreleasedReturnValue();
    passKitUIImageName = v5->_passKitUIImageName;
    v5->_passKitUIImageName = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localAssetURL"));
    v18 = objc_claimAutoreleasedReturnValue();
    localAssetURL = v5->_localAssetURL;
    v5->_localAssetURL = (NSURL *)v18;

  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (NSDictionary)urls
{
  return self->_urls;
}

- (double)width
{
  return self->_width;
}

- (double)height
{
  return self->_height;
}

- (PKColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSString)passKitUIImageName
{
  return self->_passKitUIImageName;
}

- (NSURL)localAssetURL
{
  return self->_localAssetURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAssetURL, 0);
  objc_storeStrong((id *)&self->_passKitUIImageName, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_urls, 0);
}

@end
