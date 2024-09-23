@implementation WBSPageCollectionMetadata

- (WBSPageCollectionMetadata)init
{
  WBSPageCollectionMetadata *v2;
  uint64_t v3;
  NSDate *creationDate;
  uint64_t v5;
  NSString *platform;
  uint64_t v7;
  NSString *osBuild;
  void *v9;
  uint64_t v10;
  NSString *webkitVersion;
  void *v12;
  uint64_t v13;
  NSString *safariVersion;
  void *v15;
  uint64_t v16;
  NSString *assetUUIDString;
  WBSPageCollectionMetadata *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)WBSPageCollectionMetadata;
  v2 = -[WBSPageCollectionMetadata init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v3 = objc_claimAutoreleasedReturnValue();
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v3;

    mobileGestaltStringForQuery(CFSTR("j9Th5smJpdztHwc+i39zIg"));
    v5 = objc_claimAutoreleasedReturnValue();
    platform = v2->_platform;
    v2->_platform = (NSString *)v5;

    mobileGestaltStringForQuery(CFSTR("BuildVersion"));
    v7 = objc_claimAutoreleasedReturnValue();
    osBuild = v2->_osBuild;
    v2->_osBuild = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.WebKit"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "safari_version");
    v10 = objc_claimAutoreleasedReturnValue();
    webkitVersion = v2->_webkitVersion;
    v2->_webkitVersion = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safari_version");
    v13 = objc_claimAutoreleasedReturnValue();
    safariVersion = v2->_safariVersion;
    v2->_safariVersion = (NSString *)v13;

    v2->_collectionMethod = 0;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = objc_claimAutoreleasedReturnValue();
    assetUUIDString = v2->_assetUUIDString;
    v2->_assetUUIDString = (NSString *)v16;

    v18 = v2;
  }

  return v2;
}

- (id)_languageAndRegion
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_campaignName
{
  if (self->_collectionMethod == 1)
    return CFSTR("SafariDebugMenu");
  else
    return CFSTR("SafariUnknown");
}

- (NSDictionary)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *platform;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  NSString *assetUUIDString;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  NSString *indexFileName;
  NSString *pageTitle;
  NSString *userAgent;
  NSString *screenCaptureFileName;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[9];
  _QWORD v27[2];
  __int128 v28;
  NSString *safariVersion;
  void *v30;
  __CFString *v31;
  NSString *v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v26[0] = CFSTR("date");
  v3 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v3, "stringFromDate:", self->_creationDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  platform = self->_platform;
  v27[0] = v4;
  v27[1] = platform;
  v26[1] = CFSTR("platform");
  v26[2] = CFSTR("osBuild");
  v28 = *(_OWORD *)&self->_osBuild;
  v26[3] = CFSTR("webkitVersion");
  v26[4] = CFSTR("safariVersion");
  safariVersion = self->_safariVersion;
  v26[5] = CFSTR("languageAndRegion");
  -[WBSPageCollectionMetadata _languageAndRegion](self, "_languageAndRegion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v6;
  v26[6] = CFSTR("collectionMethod");
  if (self->_collectionMethod)
    v7 = CFSTR("SafariDebugMenu");
  else
    v7 = CFSTR("SafariUnknown");
  v8 = v7;
  assetUUIDString = self->_assetUUIDString;
  v31 = v8;
  v32 = assetUUIDString;
  v26[7] = CFSTR("assetUUID");
  v26[8] = CFSTR("campaignName");
  -[WBSPageCollectionMetadata _campaignName](self, "_campaignName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  -[NSURL absoluteString](self->_url, "absoluteString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13 == 0;

  if (!v14)
  {
    -[NSURL absoluteString](self->_url, "absoluteString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("url"));

  }
  indexFileName = self->_indexFileName;
  if (indexFileName)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", indexFileName, CFSTR("indexFile"));
  pageTitle = self->_pageTitle;
  if (pageTitle)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", pageTitle, CFSTR("pageTitle"));
  userAgent = self->_userAgent;
  if (userAgent)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", userAgent, CFSTR("userAgent"));
  screenCaptureFileName = self->_screenCaptureFileName;
  if (screenCaptureFileName)
    objc_msgSend(v12, "setObject:forKeyedSubscript:", screenCaptureFileName, CFSTR("screenCapture"));
  if (self->_viewportSize.width != *MEMORY[0x1E0C9D820]
    || self->_viewportSize.height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v24[0] = CFSTR("x");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = CFSTR("y");
    v25[0] = v20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_viewportSize.height);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, CFSTR("viewportSize"));

  }
  return (NSDictionary *)v12;
}

- (BOOL)writeMetadataJSONToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  -[WBSPageCollectionMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 9, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithData:encoding:", v9, 4);

  if (a4 && *a4)
    v11 = 0;
  else
    v11 = objc_msgSend(v10, "writeToURL:atomically:encoding:error:", v6, 0, 4, a4);

  return v11;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)pageTitle
{
  return self->_pageTitle;
}

- (void)setPageTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (CGSize)viewportSize
{
  double width;
  double height;
  CGSize result;

  width = self->_viewportSize.width;
  height = self->_viewportSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setViewportSize:(CGSize)a3
{
  self->_viewportSize = a3;
}

- (NSString)indexFileName
{
  return self->_indexFileName;
}

- (void)setIndexFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)screenCaptureFileName
{
  return self->_screenCaptureFileName;
}

- (void)setScreenCaptureFileName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (unint64_t)collectionMethod
{
  return self->_collectionMethod;
}

- (void)setCollectionMethod:(unint64_t)a3
{
  self->_collectionMethod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenCaptureFileName, 0);
  objc_storeStrong((id *)&self->_indexFileName, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_pageTitle, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_assetUUIDString, 0);
  objc_storeStrong((id *)&self->_safariVersion, 0);
  objc_storeStrong((id *)&self->_webkitVersion, 0);
  objc_storeStrong((id *)&self->_osBuild, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
