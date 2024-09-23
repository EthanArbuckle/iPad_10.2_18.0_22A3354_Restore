@implementation MapsUIImageCache

+ (id)sharedCache
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10079AB60;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D32B8 != -1)
    dispatch_once(&qword_1014D32B8, block);
  return (id)qword_1014D32B0;
}

+ (id)sharedCarCache
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10079AC00;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D32C8 != -1)
    dispatch_once(&qword_1014D32C8, block);
  return (id)qword_1014D32C0;
}

- (MapsUIImageCache)initWithCarPlay:(BOOL)a3
{
  MapsUIImageCache *v4;
  MapsUIImageCache *v5;
  NSCache *v6;
  NSCache *imageCache;
  NSMutableSet *v8;
  NSMutableSet *loadingKeys;
  NSMutableDictionary *v10;
  NSMutableDictionary *fetchBlocks;
  objc_class *v12;
  NSString *v13;
  id v14;
  const char *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *lock;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)MapsUIImageCache;
  v4 = -[MapsUIImageCache init](&v22, "init");
  v5 = v4;
  if (v4)
  {
    v4->_isCarPlay = a3;
    v6 = (NSCache *)objc_alloc_init((Class)NSCache);
    imageCache = v5->_imageCache;
    v5->_imageCache = v6;

    -[NSCache setCountLimit:](v5->_imageCache, "setCountLimit:", 25);
    v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    loadingKeys = v5->_loadingKeys;
    v5->_loadingKeys = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    fetchBlocks = v5->_fetchBlocks;
    v5->_fetchBlocks = v10;

    v12 = (objc_class *)objc_opt_class(v5);
    v13 = NSStringFromClass(v12);
    v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(v13));
    v15 = (const char *)objc_msgSend(v14, "UTF8String");
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v18 = dispatch_queue_create(v15, v17);
    lock = v5->_lock;
    v5->_lock = (OS_dispatch_queue *)v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v20, "addObserver:selector:name:object:", v5, "handleMemoryWarning:", UIApplicationDidReceiveMemoryWarningNotification, 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)MapsUIImageCache;
  -[MapsUIImageCache dealloc](&v4, "dealloc");
}

- (void)handleMemoryWarning:(id)a3
{
  NSObject *lock;
  _QWORD block[5];

  lock = self->_lock;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10079AE1C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(lock, block);
}

- (double)screenScale
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;

  if (-[MapsUIImageCache isCarPlay](self, "isCarPlay"))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "screenTraitCollection"));
    objc_msgSend(v3, "displayScale");
    v5 = v4;

  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[MKSystemController sharedInstance](MKSystemController, "sharedInstance"));
    objc_msgSend(v2, "screenScale");
    v5 = v6;
  }

  return v5;
}

- (UIImage)searchImage
{
  UIImage *searchImage;
  UIImage *v4;
  UIImage *v5;

  searchImage = self->_searchImage;
  if (!searchImage)
  {
    if (-[MapsUIImageCache isCarPlay](self, "isCarPlay"))
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:](UIImage, "_mapsCar_systemImageNamed:", CFSTR("magnifyingglass")));
    else
      v4 = (UIImage *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("search")));
    v5 = self->_searchImage;
    self->_searchImage = v4;

    searchImage = self->_searchImage;
  }
  return searchImage;
}

- (void)getImageForMapItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MapsUIImageGEOFeatureSpec *v9;

  v6 = a4;
  v7 = a3;
  v9 = objc_opt_new(MapsUIImageGEOFeatureSpec);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_styleAttributes"));

  -[MapsUIImageGEOFeatureSpec setStyle:](v9, "setStyle:", v8);
  -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v9, v6);

}

- (void)getImageForSearchResult:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MapsUIImageGEOFeatureSpec *v9;

  v6 = a4;
  v7 = a3;
  v9 = objc_opt_new(MapsUIImageGEOFeatureSpec);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes styleAttributesForSearchResult:](GEOFeatureStyleAttributes, "styleAttributesForSearchResult:", v7));

  -[MapsUIImageGEOFeatureSpec setStyle:](v9, "setStyle:", v8);
  -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v9, v6);

}

- (void)getImageForCategory:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  MapsUIImageGEOFeatureSpec *v9;

  v6 = a4;
  v7 = a3;
  v9 = objc_opt_new(MapsUIImageGEOFeatureSpec);
  -[MapsUIImageGEOFeatureSpec setMarkerFallback:](v9, "setMarkerFallback:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "styleAttributes"));

  -[MapsUIImageGEOFeatureSpec setStyle:](v9, "setStyle:", v8);
  -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v9, v6);

}

- (void)getImageForContact:(id)a3 completion:(id)a4
{
  -[MapsUIImageCache getImageForContact:size:completion:](self, "getImageForContact:size:completion:", a3, a4, 0.0);
}

- (void)getImageForContact:(id)a3 size:(double)a4 completion:(id)a5
{
  -[MapsUIImageCache getImageForContact:style:tintColor:size:completion:](self, "getImageForContact:style:tintColor:size:completion:", a3, 0, 0, a5, a4);
}

- (void)getImageForContact:(id)a3 style:(int64_t)a4 tintColor:(id)a5 size:(double)a6 completion:(id)a7
{
  id v12;
  void (**v13)(id, _QWORD);
  MapsUIImageContactSpec *v14;
  id v15;

  v15 = a3;
  v12 = a5;
  v13 = (void (**)(id, _QWORD))a7;
  if (v15)
  {
    v14 = objc_opt_new(MapsUIImageContactSpec);
    -[MapsUIImageContactSpec setContact:](v14, "setContact:", v15);
    -[MapsUIImageContactSpec setStyle:](v14, "setStyle:", a4);
    -[MapsUIImageContactSpec setTintColor:](v14, "setTintColor:", v12);
    if (a6 > 0.0)
      -[MapsUIImageContactSpec setSize:](v14, "setSize:", a6);
    -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v14, v13);

  }
  else
  {
    v13[2](v13, 0);
  }

}

- (void)getImageForMarkerTransparent:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  MapsUIImageGEOFeatureSpec *v7;

  v4 = a3;
  v6 = a4;
  v7 = objc_opt_new(MapsUIImageGEOFeatureSpec);
  -[MapsUIImageGEOFeatureSpec setTransparent:](v7, "setTransparent:", v4);
  -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v7, v6);

}

- (void)getImageForInvertedStyleAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MapsUIImageGEOFeatureSpec *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(MapsUIImageGEOFeatureSpec);
  -[MapsUIImageGEOFeatureSpec setStyle:](v8, "setStyle:", v7);

  -[MapsUIImageGEOFeatureSpec setInverted:](v8, "setInverted:", 1);
  -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v8, v6);

}

- (void)getImageForStyleAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MapsUIImageGEOFeatureSpec *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(MapsUIImageGEOFeatureSpec);
  -[MapsUIImageGEOFeatureSpec setStyle:](v8, "setStyle:", v7);

  -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v8, v6);
}

- (void)getImageForTransparentStyleAttributes:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MapsUIImageGEOFeatureSpec *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(MapsUIImageGEOFeatureSpec);
  -[MapsUIImageGEOFeatureSpec setStyle:](v8, "setStyle:", v7);

  -[MapsUIImageGEOFeatureSpec setTransparent:](v8, "setTransparent:", 1);
  -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v8, v6);

}

- (void)getImageForSuggestion:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  MapsUIImageSuggestionSpec *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[MapsUIImageSuggestionSpec initWithSuggestion:]([MapsUIImageSuggestionSpec alloc], "initWithSuggestion:", v7);

  -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v8, v6);
}

- (void)getImageForCarSmallWidget:(id)a3 completion:(id)a4
{
  id v6;
  MapsUIImageSuggestionSpec *v7;
  unint64_t v8;
  id v10;

  v10 = a4;
  v6 = a3;
  v7 = -[MapsUIImageSuggestionSpec initWithSuggestion:]([MapsUIImageSuggestionSpec alloc], "initWithSuggestion:", v6);

  v8 = -[MapsUIImageSuggestionSpec suggestionType](v7, "suggestionType");
  if (v8 <= 0xC && ((1 << v8) & 0x1308) != 0)
    -[MapsUIImageSuggestionSpec setIsDashboardWidget:](v7, "setIsDashboardWidget:", 1);
  -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v7, v10);

}

- (void)getImageForRowSuggestion:(id)a3 inverted:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  MapsUIImageSuggestionSpec *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[MapsUIImageSuggestionSpec initWithSuggestion:]([MapsUIImageSuggestionSpec alloc], "initWithSuggestion:", v9);

  -[MapsUIImageSuggestionSpec setInverted:](v10, "setInverted:", v5);
  -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v10, v8);

}

- (void)getImageForRowFavorite:(id)a3 inverted:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  MapsUIImageSuggestionSpec *v10;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = -[MapsUIImageSuggestionSpec initWithFavorite:]([MapsUIImageSuggestionSpec alloc], "initWithFavorite:", v9);

  -[MapsUIImageSuggestionSpec setInverted:](v10, "setInverted:", v5);
  -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v10, v8);

}

- (void)getImageForPublisherWithIconIdentifier:(unsigned int)a3 completion:(id)a4
{
  uint64_t v4;
  id v6;
  MapsUIImagePublisherSpec *v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v7 = -[MapsUIImagePublisherSpec initWithIconIdentifier:]([MapsUIImagePublisherSpec alloc], "initWithIconIdentifier:", v4);
  -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v7, v6);

}

- (void)getImageForAppIcon:(id)a3 format:(int)a4 completion:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  MapsUIImageAppIconSpec *v10;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  v9 = a3;
  v10 = -[MapsUIImageAppIconSpec initWithBundleIdentifier:format:]([MapsUIImageAppIconSpec alloc], "initWithBundleIdentifier:format:", v9, v5);

  -[MapsUIImageCache getImageForSpec:completion:](self, "getImageForSpec:completion:", v10, v8);
}

- (void)getImageForSpec:(id)a3 completion:(id)a4
{
  -[MapsUIImageCache getImageForSpec:loadImageOnBackgroundQueue:completion:](self, "getImageForSpec:loadImageOnBackgroundQueue:completion:", a3, 1, a4);
}

- (void)getImageForSpec:(id)a3 loadImageOnBackgroundQueue:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  MapsUIImageCache *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  MapsUIImageCache *v21;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
  objc_msgSend(v8, "setNightMode:", objc_msgSend(WeakRetained, "isNightMode"));

  objc_msgSend(v8, "setIsRTL:", MKApplicationLayoutDirectionIsRightToLeft(v11));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10079B860;
  v19[3] = &unk_1011AC8B0;
  v12 = v8;
  v20 = v12;
  v21 = self;
  -[MapsUIImageCache loadImageForKey:loadImageOnBackgroundQueue:withBlock:](self, "loadImageForKey:loadImageOnBackgroundQueue:withBlock:", v12, v6, v19);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10079B8C8;
  v15[3] = &unk_1011C6850;
  v16 = v12;
  v17 = self;
  v18 = v9;
  v13 = v9;
  v14 = v12;
  -[MapsUIImageCache fetchImageForKey:completion:](self, "fetchImageForKey:completion:", v14, v15);

}

- (void)loadImageForKey:(id)a3 loadImageOnBackgroundQueue:(BOOL)a4 withBlock:(id)a5
{
  id v8;
  NSObject *lock;
  void (**v10)(_QWORD);
  id v11;
  _QWORD block[5];
  id v13;
  id v14;
  BOOL v15;

  v11 = a3;
  v8 = a5;
  if (v11 && v8)
  {
    lock = self->_lock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10079BA08;
    block[3] = &unk_1011BE4E8;
    block[4] = self;
    v13 = v11;
    v15 = a4;
    v10 = (void (**)(_QWORD))v8;
    v14 = v10;
    dispatch_sync(lock, block);
    if (!a4)
      v10[2](v10);

  }
}

- (void)setImage:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *lock;
  id v9;
  void ***v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  _QWORD *v16;
  _QWORD block[4];
  id v18;
  MapsUIImageCache *v19;
  id v20;
  _QWORD *v21;
  _QWORD v22[5];
  id v23;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = sub_10079BC90;
    v22[4] = sub_10079BCA0;
    v23 = 0;
    lock = self->_lock;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10079BCA8;
    block[3] = &unk_1011C6878;
    v9 = v6;
    v18 = v9;
    v19 = self;
    v20 = v7;
    v21 = v22;
    dispatch_sync(lock, block);
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_10079BD28;
    v14 = &unk_1011ADF48;
    v16 = v22;
    v15 = v9;
    v10 = objc_retainBlock(&v11);
    if (+[NSThread isMainThread](NSThread, "isMainThread", v11, v12, v13, v14))
      ((void (*)(void ***))v10[2])(v10);
    else
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);

    _Block_object_dispose(v22, 8);
  }

}

- (void)fetchImageForKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *lock;
  void (**v10)(_QWORD);
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_10079BC90;
    v19 = sub_10079BCA0;
    v20 = 0;
    lock = self->_lock;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10079BF5C;
    v11[3] = &unk_1011C68A0;
    v14 = &v15;
    v11[4] = self;
    v12 = v6;
    v10 = v8;
    v13 = v10;
    dispatch_sync(lock, v11);
    if (v16[5])
      v10[2](v10);

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
  }

}

- (MapsUIImageCacheUserInterfaceDelegate)userInterfaceDelegate
{
  return (MapsUIImageCacheUserInterfaceDelegate *)objc_loadWeakRetained((id *)&self->_userInterfaceDelegate);
}

- (void)setUserInterfaceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_userInterfaceDelegate, a3);
}

- (BOOL)isCarPlay
{
  return self->_isCarPlay;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_userInterfaceDelegate);
  objc_storeStrong((id *)&self->_searchImage, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_fetchBlocks, 0);
  objc_storeStrong((id *)&self->_loadingKeys, 0);
  objc_storeStrong((id *)&self->_imageCache, 0);
}

@end
