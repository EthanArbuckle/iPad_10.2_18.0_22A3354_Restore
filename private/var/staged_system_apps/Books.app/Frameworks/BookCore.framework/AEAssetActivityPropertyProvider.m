@implementation AEAssetActivityPropertyProvider

- (AEAssetActivityPropertyProvider)initWithPropertySource:(id)a3
{
  id v4;
  AEAssetActivityPropertyProvider *v5;
  id v6;
  id propertySource;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEAssetActivityPropertyProvider;
  v5 = -[AEAssetActivityPropertyProvider init](&v9, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    propertySource = v5->_propertySource;
    v5->_propertySource = v6;

  }
  return v5;
}

- (NSString)assetID
{
  NSString *assetID;
  uint64_t (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  assetID = self->_assetID;
  if (!assetID)
  {
    v4 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
    v6 = ((uint64_t (**)(_QWORD, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyAssetId);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->_assetID;
    self->_assetID = v7;

    assetID = self->_assetID;
    if (!assetID)
    {
      v9 = (NSString *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider storeID](self, "storeID"));
      v10 = self->_assetID;
      self->_assetID = v9;

      assetID = self->_assetID;
    }
  }
  return assetID;
}

- (NSString)storeID
{
  NSString *storeID;
  uint64_t (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  NSString *v7;
  NSString *v8;

  storeID = self->_storeID;
  if (!storeID)
  {
    v4 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
    v6 = ((uint64_t (**)(_QWORD, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyStoreId);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->_storeID;
    self->_storeID = v7;

    storeID = self->_storeID;
  }
  return storeID;
}

- (NSString)readingDirection
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;
  NSLocaleLanguageDirection v7;
  __CFString *v8;
  __CFString *v9;

  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v5 = ((uint64_t (**)(_QWORD, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyLanguage);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = +[NSLocale characterDirectionForLanguage:](NSLocale, "characterDirectionForLanguage:", v6);
  v8 = CFSTR("auto");
  if (v7 == NSLocaleLanguageDirectionRightToLeft)
    v8 = CFSTR("rtl");
  v9 = v8;

  return (NSString *)v9;
}

- (NSURL)storeURL
{
  NSURL *storeURL;
  uint64_t (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  NSURL *v7;
  NSURL *v8;

  storeURL = self->_storeURL;
  if (!storeURL)
  {
    v4 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
    v6 = ((uint64_t (**)(_QWORD, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyStoreUrl);
    v7 = (NSURL *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->_storeURL;
    self->_storeURL = v7;

    storeURL = self->_storeURL;
  }
  return storeURL;
}

- (NSURL)storeShortURL
{
  NSURL *storeShortURL;
  uint64_t (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  NSURL *v7;
  NSURL *v8;

  storeShortURL = self->_storeShortURL;
  if (!storeShortURL)
  {
    v4 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
    v6 = ((uint64_t (**)(_QWORD, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyStoreShortUrl);
    v7 = (NSURL *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->_storeShortURL;
    self->_storeShortURL = v7;

    storeShortURL = self->_storeShortURL;
  }
  return storeShortURL;
}

- (NSURL)storeURLPreferShort
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider storeShortURL](self, "storeShortURL"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider storeURL](self, "storeURL"));
  v6 = v5;

  return (NSURL *)v6;
}

- (NSURL)bookURL
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v5 = ((uint64_t (**)(_QWORD, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyBookPath);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v6)
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v6));
  else
    v7 = 0;

  return (NSURL *)v7;
}

- (NSString)epubID
{
  NSString *epubID;
  uint64_t (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  NSString *v7;
  NSString *v8;

  epubID = self->_epubID;
  if (!epubID)
  {
    v4 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
    v6 = ((uint64_t (**)(_QWORD, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyEpubId);
    v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->_epubID;
    self->_epubID = v7;

    epubID = self->_epubID;
  }
  return epubID;
}

- (UIImage)assetCover
{
  UIImage *assetCover;
  uint64_t (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  UIImage *v7;
  UIImage *v8;

  assetCover = self->_assetCover;
  if (!assetCover)
  {
    v4 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
    v6 = ((uint64_t (**)(_QWORD, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyAssetCover);
    v7 = (UIImage *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->_assetCover;
    self->_assetCover = v7;

    assetCover = self->_assetCover;
  }
  return assetCover;
}

- (NSString)title
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v5 = ((uint64_t (**)(_QWORD, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyTitle);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (NSString)author
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v5 = ((uint64_t (**)(_QWORD, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyAuthor);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (NSString)publisherLocation
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v5 = ((uint64_t (**)(_QWORD, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyPublisherLocation);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (NSString)publisherName
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v5 = ((uint64_t (**)(_QWORD, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyPublisherName);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (NSString)publisherYear
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v5 = ((uint64_t (**)(_QWORD, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyPublisherYear);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (NSString)genre
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v5 = ((uint64_t (**)(_QWORD, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyGenre);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (BOOL)contentProtected
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;

  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v5 = ((uint64_t (**)(_QWORD, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyIsContentProtected);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v6, "BOOLValue");

  return v7;
}

- (NSString)assetTypeString
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v5 = ((uint64_t (**)(_QWORD, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyAssetType);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastPathComponent"));
  return (NSString *)v7;
}

- (int64_t)assetType
{
  void *v2;
  int64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider assetTypeString](self, "assetTypeString"));
  v3 = BCAssetContentTypeFromAssetTypeString(v2);

  return v3;
}

- (BOOL)isOwned
{
  uint64_t v3;
  uint64_t (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = objc_opt_class(NSNumber);
  v4 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v6 = ((uint64_t (**)(_QWORD, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyIsOwned);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = BUDynamicCast(v3, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  LOBYTE(v5) = objc_msgSend(v9, "BOOLValue");
  return (char)v5;
}

- (BOOL)isStoreAsset
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider storeID](self, "storeID"));
  v3 = objc_msgSend(v2, "longLongValue") != 0;

  return v3;
}

- (NSString)bookDescription
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v5 = ((uint64_t (**)(_QWORD, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyBookDescription);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (NSString)seriesTitle
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v5 = ((uint64_t (**)(_QWORD, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertySeriesTitle);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (NSString)version
{
  uint64_t (**v3)(_QWORD, _QWORD, _QWORD);
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v5 = ((uint64_t (**)(_QWORD, void *, __CFString *))v3)[2](v3, v4, AEAssetActivityItemProviderPropertyVersion);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return (NSString *)v6;
}

- (id)checkOutBookStringWithCharacterLimit:(unint64_t)a3
{
  int64_t v5;
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;

  v5 = -[AEAssetActivityPropertyProvider assetType](self, "assetType");
  v6 = -[AEAssetActivityPropertyProvider isStoreAsset](self, "isStoreAsset");
  v7 = IMCommonCoreBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  v10 = CFSTR("Check out this book on Apple Books:");
  if (v5 == 6)
    v10 = CFSTR("Check out this audiobook on Apple Books:");
  v11 = CFSTR("Check out this audiobook:");
  if (v5 != 6)
    v11 = CFSTR("Check out this book:");
  if (v6)
    v12 = v10;
  else
    v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v12, &stru_296430, CFSTR("BCCommonCoreLocalizable")));

  v14 = IMCommonCoreBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("\\U201C%@\\U201D by %@"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider title](self, "title"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider author](self, "author"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v17, v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v13, v19));
  if ((unint64_t)objc_msgSend(v20, "length") > a3)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider title](self, "title"));
    v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v13, v21));

    v20 = (void *)v22;
  }
  if ((unint64_t)objc_msgSend(v20, "length") > a3)
  {
    v23 = objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider title](self, "title"));

    v20 = (void *)v23;
  }
  if ((unint64_t)objc_msgSend(v20, "length") > a3)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider title](self, "title"));
    v25 = IMCommonCoreBundle();
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("\\U2026"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "stringByTruncatingToLength:options:truncationString:", a3, 3, v27));

    v20 = (void *)v28;
  }

  return v20;
}

- (id)previewAssetCoverItemProvider
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = (id)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider previewAssetCoverFuture](self, "previewAssetCoverFuture"));

  if (v3)
  {
    v3 = objc_alloc_init((Class)NSItemProvider);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypePNG, "identifier"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_75B34;
    v6[3] = &unk_28EE38;
    v6[4] = self;
    objc_msgSend(v3, "registerItemForTypeIdentifier:loadHandler:", v4, v6);

  }
  return v3;
}

- (id)previewAssetCoverFuture
{
  BCFutureValue *previewAssetCoverFuture;
  uint64_t (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  BCFutureValue *v7;
  BCFutureValue *v8;

  previewAssetCoverFuture = self->_previewAssetCoverFuture;
  if (!previewAssetCoverFuture)
  {
    v4 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
    v6 = ((uint64_t (**)(_QWORD, void *, __CFString *))v4)[2](v4, v5, AEAssetActivityItemProviderPropertyPreviewAssetCoverFuture);
    v7 = (BCFutureValue *)objc_claimAutoreleasedReturnValue(v6);
    v8 = self->_previewAssetCoverFuture;
    self->_previewAssetCoverFuture = v7;

    previewAssetCoverFuture = self->_previewAssetCoverFuture;
  }
  return previewAssetCoverFuture;
}

- (id)userPublishing:(id)a3 storeURLForStoreId:(id)a4
{
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v7 = ((uint64_t (**)(_QWORD, void *, __CFString *))v5)[2](v5, v6, AEAssetActivityItemProviderPropertyStoreUrl);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (id)userPublishing:(id)a3 storeShortURLForStoreId:(id)a4
{
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider propertySource](self, "propertySource", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[AEAssetActivityPropertyProvider activityType](self, "activityType"));
  v7 = ((uint64_t (**)(_QWORD, void *, __CFString *))v5)[2](v5, v6, AEAssetActivityItemProviderPropertyStoreShortUrl);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)propertySource
{
  return self->_propertySource;
}

- (void)setPropertySource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_propertySource, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_previewAssetCoverFuture, 0);
  objc_storeStrong((id *)&self->_assetCover, 0);
  objc_storeStrong((id *)&self->_epubID, 0);
  objc_storeStrong((id *)&self->_storeShortURL, 0);
  objc_storeStrong((id *)&self->_storeURL, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_assetID, 0);
}

@end
