@implementation BSUIItemDescription

- (BSUIItemDescription)initWithAsset:(id)a3
{
  id v4;
  BSUIItemDescription *v5;
  uint64_t v6;
  NSString *storeID;
  uint64_t v8;
  NSString *artworkURLTemplate;
  void *v10;
  float v11;
  void *v12;
  float v13;
  float v14;
  void *v15;
  float v16;
  uint64_t v17;
  NSString *title;
  uint64_t v19;
  NSString *author;
  id v21;
  uint64_t v22;
  BCLazyValue *lazyNotes;
  double v24;
  uint64_t v25;
  NSURL *productURL;
  __CFString *v27;
  uint64_t v28;
  NSURL *sampleDownloadURL;
  uint64_t v30;
  NSString *priceString;
  uint64_t v32;
  NSString *actionString;
  uint64_t v34;
  NSString *buyParameters;
  _QWORD v37[4];
  id v38;
  objc_super v39;

  v4 = a3;
  v39.receiver = self;
  v39.super_class = (Class)BSUIItemDescription;
  v5 = -[BSUIItemDescription init](&v39, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "id"));
    storeID = v5->_storeID;
    v5->_storeID = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artworkURL"));
    artworkURLTemplate = v5->_artworkURLTemplate;
    v5->_artworkURLTemplate = (NSString *)v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "width"));
    objc_msgSend(v10, "floatValue");
    if (v11 <= 0.0)
    {
      v5->_artworkAspect = 1.5;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "height"));
      objc_msgSend(v12, "floatValue");
      v14 = v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "width"));
      objc_msgSend(v15, "floatValue");
      v5->_artworkAspect = (float)(v14 / v16);

    }
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
    title = v5->_title;
    v5->_title = (NSString *)v17;

    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artistName"));
    author = v5->_author;
    v5->_author = (NSString *)v19;

    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_505AC;
    v37[3] = &unk_2E5F68;
    v21 = v4;
    v38 = v21;
    v22 = objc_claimAutoreleasedReturnValue(+[BCLazyValue objectSyncProducer:](BCLazyValue, "objectSyncProducer:", v37));
    lazyNotes = v5->_lazyNotes;
    v5->_lazyNotes = (BCLazyValue *)v22;

    objc_msgSend(v21, "averageRating");
    v5->_averageRating = v24;
    v5->_ratingCount = (unint64_t)objc_msgSend(v21, "ratingCount");
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "url"));
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v25;

    if (objc_msgSend(v21, "isAudiobook"))
      v27 = CFSTR("audiobook");
    else
      v27 = CFSTR("epubBook");
    objc_storeStrong((id *)&v5->_kind, v27);
    v5->_isAudiobook = objc_msgSend(v21, "isAudiobook");
    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bookSampleDownloadURL"));
    sampleDownloadURL = v5->_sampleDownloadURL;
    v5->_sampleDownloadURL = (NSURL *)v28;

    v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "priceFormatted"));
    priceString = v5->_priceString;
    v5->_priceString = (NSString *)v30;

    v32 = objc_claimAutoreleasedReturnValue(+[BCMAssetWrapper actionTextForType:withAsset:](BCMAssetWrapper, "actionTextForType:withAsset:", 1, v21));
    actionString = v5->_actionString;
    v5->_actionString = (NSString *)v32;

    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "buyParams"));
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSString *)v34;

    v5->_fileSize = (int64_t)objc_msgSend(v21, "fileSize");
  }

  return v5;
}

- (BSUIItemDescription)initWithProfile:(id)a3
{
  id v4;
  void *v5;
  BSUIItemDescription *v6;
  BSUIItemDescription *v7;
  uint64_t v8;
  NSString *artworkURLTemplate;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *author;
  id v14;
  uint64_t v15;
  BCLazyValue *lazyNotes;
  double v17;
  uint64_t v18;
  NSURL *productURL;
  uint64_t v20;
  NSString *kind;
  uint64_t v22;
  NSURL *sampleDownloadURL;
  uint64_t v24;
  NSString *priceString;
  uint64_t v26;
  NSString *actionString;
  uint64_t v28;
  NSString *buyParameters;
  void **v31;
  uint64_t v32;
  id (*v33)(uint64_t);
  void *v34;
  id v35;
  uint64_t v36;
  objc_super v37;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "adamId"));
  v37.receiver = self;
  v37.super_class = (Class)BSUIItemDescription;
  v6 = -[BSUIItemDescription init](&v37, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_storeID, v5);
    v36 = 0x3FF8000000000000;
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artworkURLTemplateAspect:", &v36));
    artworkURLTemplate = v7->_artworkURLTemplate;
    v7->_artworkURLTemplate = (NSString *)v8;

    *(_QWORD *)&v7->_artworkAspect = v36;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    title = v7->_title;
    v7->_title = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "author"));
    author = v7->_author;
    v7->_author = (NSString *)v12;

    v31 = _NSConcreteStackBlock;
    v32 = 3221225472;
    v33 = sub_50804;
    v34 = &unk_2E5F68;
    v14 = v4;
    v35 = v14;
    v15 = objc_claimAutoreleasedReturnValue(+[BCLazyValue objectSyncProducer:](BCLazyValue, "objectSyncProducer:", &v31));
    lazyNotes = v7->_lazyNotes;
    v7->_lazyNotes = (BCLazyValue *)v15;

    objc_msgSend(v14, "averageRating", v31, v32, v33, v34);
    v7->_averageRating = v17;
    v7->_ratingCount = (unint64_t)objc_msgSend(v14, "ratingCount");
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "productURL"));
    productURL = v7->_productURL;
    v7->_productURL = (NSURL *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "kind"));
    kind = v7->_kind;
    v7->_kind = (NSString *)v20;

    v7->_isAudiobook = objc_msgSend(v14, "isAudiobook");
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bookSampleDownloadURL"));
    sampleDownloadURL = v7->_sampleDownloadURL;
    v7->_sampleDownloadURL = (NSURL *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "priceString"));
    priceString = v7->_priceString;
    v7->_priceString = (NSString *)v24;

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "actionTextWithType:", 1));
    actionString = v7->_actionString;
    v7->_actionString = (NSString *)v26;

    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "buyParameters"));
    buyParameters = v7->_buyParameters;
    v7->_buyParameters = (NSString *)v28;

    v7->_fileSize = (int64_t)objc_msgSend(v14, "fileSize");
  }

  return v7;
}

- (BSUIItemDescription)initWithItemDescription:(id)a3
{
  id v4;
  BSUIItemDescription *v5;
  uint64_t v6;
  NSString *storeID;
  uint64_t v8;
  NSString *artworkURLTemplate;
  double v10;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  NSString *author;
  uint64_t v15;
  BCLazyValue *lazyNotes;
  double v17;
  uint64_t v18;
  NSURL *productURL;
  uint64_t v20;
  NSString *kind;
  uint64_t v22;
  NSURL *sampleDownloadURL;
  uint64_t v24;
  NSString *priceString;
  uint64_t v26;
  NSString *actionString;
  uint64_t v28;
  NSString *buyParameters;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)BSUIItemDescription;
  v5 = -[BSUIItemDescription init](&v31, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "storeID"));
    storeID = v5->_storeID;
    v5->_storeID = (NSString *)v6;

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artworkURLTemplate"));
    artworkURLTemplate = v5->_artworkURLTemplate;
    v5->_artworkURLTemplate = (NSString *)v8;

    objc_msgSend(v4, "artworkAspect");
    v5->_artworkAspect = v10;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "title"));
    title = v5->_title;
    v5->_title = (NSString *)v11;

    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "author"));
    author = v5->_author;
    v5->_author = (NSString *)v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lazyNotes"));
    lazyNotes = v5->_lazyNotes;
    v5->_lazyNotes = (BCLazyValue *)v15;

    objc_msgSend(v4, "averageRating");
    v5->_averageRating = v17;
    v5->_ratingCount = (unint64_t)objc_msgSend(v4, "ratingCount");
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "productURL"));
    productURL = v5->_productURL;
    v5->_productURL = (NSURL *)v18;

    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "kind"));
    kind = v5->_kind;
    v5->_kind = (NSString *)v20;

    v5->_isAudiobook = objc_msgSend(v4, "isAudiobook");
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sampleDownloadURL"));
    sampleDownloadURL = v5->_sampleDownloadURL;
    v5->_sampleDownloadURL = (NSURL *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "priceString"));
    priceString = v5->_priceString;
    v5->_priceString = (NSString *)v24;

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "actionString"));
    actionString = v5->_actionString;
    v5->_actionString = (NSString *)v26;

    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buyParameters"));
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSString *)v28;

    v5->_fileSize = (int64_t)objc_msgSend(v4, "fileSize");
  }

  return v5;
}

- (BSUIItemDescription)initWithDictionary:(id)a3
{
  id v4;
  BSUIItemDescription *v5;
  uint64_t v6;
  NSString *storeID;
  void *v8;
  double v9;
  uint64_t v10;
  NSString *artworkURLTemplate;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSString *author;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  NSURL *v20;
  uint64_t v21;
  NSURL *productURL;
  uint64_t v23;
  NSString *kind;
  void *v25;
  NSURL *v26;
  uint64_t v27;
  NSURL *sampleDownloadURL;
  uint64_t v29;
  NSString *priceString;
  uint64_t v31;
  NSString *actionString;
  uint64_t v33;
  NSString *buyParameters;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)BSUIItemDescription;
  v5 = -[BSUIItemDescription init](&v36, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeID")));
    storeID = v5->_storeID;
    v5->_storeID = (NSString *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("artworkAspect")));
    objc_msgSend(v8, "doubleValue");
    v5->_artworkAspect = v9;

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("artworkURLTemplate")));
    artworkURLTemplate = v5->_artworkURLTemplate;
    v5->_artworkURLTemplate = (NSString *)v10;

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title")));
    title = v5->_title;
    v5->_title = (NSString *)v12;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("author")));
    author = v5->_author;
    v5->_author = (NSString *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("averageRating")));
    objc_msgSend(v16, "doubleValue");
    v5->_averageRating = v17;

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ratingCount")));
    v5->_ratingCount = (unint64_t)objc_msgSend(v18, "integerValue");

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productURL")));
    if (v19)
    {
      v20 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productURL")));
      v21 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v20));
      productURL = v5->_productURL;
      v5->_productURL = (NSURL *)v21;

    }
    else
    {
      v20 = v5->_productURL;
      v5->_productURL = 0;
    }

    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kind")));
    kind = v5->_kind;
    v5->_kind = (NSString *)v23;

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sampleDownloadURL")));
    if (v25)
    {
      v26 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sampleDownloadURL")));
      v27 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v26));
      sampleDownloadURL = v5->_sampleDownloadURL;
      v5->_sampleDownloadURL = (NSURL *)v27;

    }
    else
    {
      v26 = v5->_sampleDownloadURL;
      v5->_sampleDownloadURL = 0;
    }

    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("priceString")));
    priceString = v5->_priceString;
    v5->_priceString = (NSString *)v29;

    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionString")));
    actionString = v5->_actionString;
    v5->_actionString = (NSString *)v31;

    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("buyParameters")));
    buyParameters = v5->_buyParameters;
    v5->_buyParameters = (NSString *)v33;

  }
  return v5;
}

- (BSUIItemDescription)initWithDragInfo:(id)a3
{
  id v4;
  BSUIItemDescription *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *storeID;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  NSString *title;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSString *author;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSURL *productURL;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)BSUIItemDescription;
  v5 = -[BSUIItemDescription init](&v28, "init");
  if (v5)
  {
    v6 = objc_opt_class(NSString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeID")));
    v8 = BUDynamicCast(v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    storeID = v5->_storeID;
    v5->_storeID = (NSString *)v9;

    v11 = objc_opt_class(NSString);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title")));
    v13 = BUDynamicCast(v11, v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    title = v5->_title;
    v5->_title = (NSString *)v14;

    v16 = objc_opt_class(NSString);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("author")));
    v18 = BUDynamicCast(v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    author = v5->_author;
    v5->_author = (NSString *)v19;

    v21 = objc_opt_class(NSString);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeURL")));
    v23 = BUDynamicCast(v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    if (objc_msgSend(v24, "length"))
    {
      v25 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v24));
      productURL = v5->_productURL;
      v5->_productURL = (NSURL *)v25;

    }
  }

  return v5;
}

- (BSUIItemDescription)initWithCachedItemDescription:(id)a3 lazyNotes:(id)a4
{
  id v6;
  id v7;
  BSUIItemDescription *v8;
  void *v9;
  NSString *v10;
  NSString *storeID;
  void *v12;
  double v13;
  uint64_t v14;
  NSString *artworkURLTemplate;
  uint64_t v16;
  NSString *title;
  uint64_t v18;
  NSString *author;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  NSURL *v24;
  uint64_t v25;
  NSURL *productURL;
  uint64_t v27;
  NSString *kind;
  void *v29;
  NSURL *v30;
  uint64_t v31;
  NSURL *sampleDownloadURL;
  uint64_t v33;
  NSString *priceString;
  uint64_t v35;
  NSString *actionString;
  uint64_t v37;
  NSString *buyParameters;
  void *v39;
  objc_super v41;

  v6 = a3;
  v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)BSUIItemDescription;
  v8 = -[BSUIItemDescription init](&v41, "init");
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "storeID"));
    v10 = (NSString *)objc_msgSend(v9, "copy");
    storeID = v8->_storeID;
    v8->_storeID = v10;

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artworkAspect"));
    objc_msgSend(v12, "doubleValue");
    v8->_artworkAspect = v13;

    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artworkURLTemplate"));
    artworkURLTemplate = v8->_artworkURLTemplate;
    v8->_artworkURLTemplate = (NSString *)v14;

    objc_storeStrong((id *)&v8->_lazyNotes, a4);
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    title = v8->_title;
    v8->_title = (NSString *)v16;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "author"));
    author = v8->_author;
    v8->_author = (NSString *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "averageRating"));
    objc_msgSend(v20, "doubleValue");
    v8->_averageRating = v21;

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ratingCount"));
    v8->_ratingCount = (unint64_t)objc_msgSend(v22, "integerValue");

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "productURL"));
    if (v23)
    {
      v24 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "productURL"));
      v25 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v24));
      productURL = v8->_productURL;
      v8->_productURL = (NSURL *)v25;

    }
    else
    {
      v24 = v8->_productURL;
      v8->_productURL = 0;
    }

    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "kind"));
    kind = v8->_kind;
    v8->_kind = (NSString *)v27;

    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sampleDownloadURL"));
    if (v29)
    {
      v30 = (NSURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sampleDownloadURL"));
      v31 = objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v30));
      sampleDownloadURL = v8->_sampleDownloadURL;
      v8->_sampleDownloadURL = (NSURL *)v31;

    }
    else
    {
      v30 = v8->_sampleDownloadURL;
      v8->_sampleDownloadURL = 0;
    }

    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "priceString"));
    priceString = v8->_priceString;
    v8->_priceString = (NSString *)v33;

    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "actionString"));
    actionString = v8->_actionString;
    v8->_actionString = (NSString *)v35;

    v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buyParameters"));
    buyParameters = v8->_buyParameters;
    v8->_buyParameters = (NSString *)v37;

    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileSize"));
    v8->_fileSize = (int64_t)objc_msgSend(v39, "integerValue");

  }
  return v8;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithFormat:](NSMutableString, "stringWithFormat:", CFSTR("<%@: %p"), v5, self));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription storeID](self, "storeID"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  storeID=%@ "), v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription artworkURLTemplate](self, "artworkURLTemplate"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  artworkURLTemplate=%@ "), v8);

  -[BSUIItemDescription artworkAspect](self, "artworkAspect");
  *(float *)&v9 = v9;
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  artworkAspect=%f "), *(float *)&v9);
  v10 = (objc_class *)objc_opt_class(self->_lazyNotes);
  v11 = NSStringFromClass(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  _lazyNotes=<%@:%p> "), v12, self->_lazyNotes);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription title](self, "title"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  title=%@ "), v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription author](self, "author"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  author=%@ "), v14);

  -[BSUIItemDescription averageRating](self, "averageRating");
  *(float *)&v15 = v15;
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  averageRating=%f "), *(float *)&v15);
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  ratingCount=%d "), -[BSUIItemDescription ratingCount](self, "ratingCount"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription metrics](self, "metrics"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  metrics=%@ "), v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription kind](self, "kind"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  kind=%@"), v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription productURL](self, "productURL"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  productURL=%@"), v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription sampleDownloadURL](self, "sampleDownloadURL"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  sampleDownloadURL=%@"), v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription priceString](self, "priceString"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  priceString=%@"), v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription actionString](self, "actionString"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  actionString=%@"), v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIItemDescription buyParameters](self, "buyParameters"));
  objc_msgSend(v6, "appendFormat:", CFSTR("\n  buyParameters=%@"), v22);

  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  return v6;
}

- (NSString)notes
{
  return (NSString *)-[BCLazyValue value](self->_lazyNotes, "value");
}

- (unint64_t)coverEffectStyle
{
  if (-[BSUIItemDescription bookCoverIsAudiobook](self, "bookCoverIsAudiobook"))
    return 2;
  else
    return 1;
}

- (BOOL)coverEffectRTL
{
  return -[BSUIItemDescription bookCoverIsRightToLeft](self, "bookCoverIsRightToLeft");
}

- (id)bookCoverIdentifier
{
  return self->_storeID;
}

- (id)bookCoverTitle
{
  return self->_title;
}

- (id)bookCoverAuthor
{
  return self->_author;
}

- (id)bookCoverArtworkURLTemplate
{
  return self->_artworkURLTemplate;
}

- (BOOL)bookCoverIsLocal
{
  return 0;
}

- (BOOL)bookCoverIsRightToLeft
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_51494;
  v4[3] = &unk_2E5F90;
  v4[4] = &v5;
  objc_msgSend(v2, "enqueueBlockPrefersSync:file:line:", v4, CFSTR("BSUIItemDescription.m"), 264);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

- (id)bookCoverLanguage
{
  return 0;
}

- (id)bookCoverWritingMode
{
  return 0;
}

- (BOOL)bookCoverIsDownloading
{
  return 0;
}

- (BOOL)bookCoverIsAudiobook
{
  return self->_isAudiobook;
}

- (BOOL)bookCoverIsPreorder
{
  return 0;
}

- (NSString)storeID
{
  return self->_storeID;
}

- (double)artworkAspect
{
  return self->_artworkAspect;
}

- (NSString)artworkURLTemplate
{
  return self->_artworkURLTemplate;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)author
{
  return self->_author;
}

- (double)averageRating
{
  return self->_averageRating;
}

- (unint64_t)ratingCount
{
  return self->_ratingCount;
}

- (NSDictionary)metrics
{
  return self->_metrics;
}

- (NSURL)productURL
{
  return self->_productURL;
}

- (NSString)kind
{
  return self->_kind;
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (NSURL)sampleDownloadURL
{
  return self->_sampleDownloadURL;
}

- (NSString)priceString
{
  return self->_priceString;
}

- (NSString)actionString
{
  return self->_actionString;
}

- (NSString)buyParameters
{
  return self->_buyParameters;
}

- (BKBookCoverInfo)bookCoverInfo
{
  return self->_bookCoverInfo;
}

- (int64_t)fileSize
{
  return self->_fileSize;
}

- (BCLazyValue)lazyNotes
{
  return self->_lazyNotes;
}

- (void)setLazyNotes:(id)a3
{
  objc_storeStrong((id *)&self->_lazyNotes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lazyNotes, 0);
  objc_storeStrong((id *)&self->_bookCoverInfo, 0);
  objc_storeStrong((id *)&self->_buyParameters, 0);
  objc_storeStrong((id *)&self->_actionString, 0);
  objc_storeStrong((id *)&self->_priceString, 0);
  objc_storeStrong((id *)&self->_sampleDownloadURL, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_productURL, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_author, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artworkURLTemplate, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
}

@end
