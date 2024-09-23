@implementation BKMLAudiobookHelper

- (BKMLAudiobookHelper)initWithAssetUrl:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  BKMLAudiobookHelper *v9;
  BKMLAudiobookHelper *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKMLAudiobookHelper;
  v9 = -[BKMLAudiobookHelper init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assetUrl, a3);
    objc_storeStrong((id *)&v10->_options, a4);
  }

  return v10;
}

+ (BOOL)_audiobookIsStreamingFromURL:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bu_dictionaryForQueryItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isCloudItem")));
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

+ (id)_audiobookAlbumTitleFromURL:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "bu_dictionaryForQueryItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("albumTitle")));

  return v4;
}

- (BOOL)isStreaming
{
  void *v3;

  v3 = (void *)objc_opt_class(self);
  return _objc_msgSend(v3, "_audiobookIsStreamingFromURL:", self->_assetUrl);
}

- (NSString)albumTitle
{
  void *v3;

  v3 = (void *)objc_opt_class(self);
  return (NSString *)_objc_msgSend(v3, "_audiobookAlbumTitleFromURL:", self->_assetUrl);
}

- (id)assetType
{
  return +[AEAudiobookPlugin associatedAssetType](AEAudiobookPlugin, "associatedAssetType");
}

- (id)assetID
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookHelper options](self, "options"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("assetID")));

  return v3;
}

- (id)url
{
  return self->_assetUrl;
}

- (id)displayTitle
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookHelper helperMetadataForKey:needsCoordination:](self, "helperMetadataForKey:needsCoordination:", AEHelperStringMetadataTitleKey, 1));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  NSURL *assetUrl;
  void *v8;
  void *v9;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookHelper helperMetadataForKey:needsCoordination:](self, "helperMetadataForKey:needsCoordination:", AEHelperStringMetadataTitleKey, 1));
  assetUrl = self->_assetUrl;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookHelper assetID](self, "assetID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> [Title: %@] [URL: %@] [AssetID: %@]"), v5, self, v6, assetUrl, v8));

  return (NSString *)v9;
}

- (id)helperCoverImageOfSize:(CGSize)a3
{
  double height;
  double width;
  void *v5;
  uint64_t (**v6)(_QWORD, double, double);
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;

  height = a3.height;
  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookHelper options](self, "options"));
  v6 = (uint64_t (**)(_QWORD, double, double))objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", AEHelperImageMetadataCoverBlockKey));

  if (v6)
  {
    v7 = v6[2](v6, width, height);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  }
  else
  {
    v9 = sub_1001B6D9C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_1006A21FC(v10);

    v8 = 0;
  }

  return v8;
}

- (id)helperCoverImage
{
  return -[BKMLAudiobookHelper helperCoverImageOfSize:](self, "helperCoverImageOfSize:", CGSizeZero.width, CGSizeZero.height);
}

- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookNowPlayingModuleFactory instantiate](BKAudiobookNowPlayingModuleFactory, "instantiate"));
  v7 = v6;
  if (v6)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100146AB8;
    v14[3] = &unk_1008E8B48;
    v8 = v6;
    v15 = v8;
    v16 = 0;
    v17 = v5;
    v9 = objc_retainBlock(v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookNowPlayingModuleFactory currentMiniPlayer](BKAudiobookNowPlayingModuleFactory, "currentMiniPlayer"));
    v11 = v10;
    if (!v10)
      v10 = v8;
    objc_msgSend(v10, "setHelper:completion:", self, v9);

  }
  else
  {
    v12 = objc_retainBlock(v5);
    v13 = v12;
    if (v12)
      (*((void (**)(id, _QWORD, _QWORD))v12 + 2))(v12, 0, 0);

  }
}

- (id)helperMinifiedController
{
  return -[BKAudiobookMinifiedController initWithHelper:]([BKAudiobookMinifiedController alloc], "initWithHelper:", self);
}

- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4
{
  void *v5;

  if (objc_msgSend(a3, "isEqualToString:", AEHelperStringMetadataAssetIDKey, a4))
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookHelper assetID](self, "assetID"));
  else
    v5 = 0;
  return v5;
}

- (id)sharedAnnotationProvider
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AEPluginRegistry sharedInstance](AEPluginRegistry, "sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pluginForURL:", self->_assetUrl));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sharedAnnotationProvider"));
  return v5;
}

- (NSURL)assetUrl
{
  return self->_assetUrl;
}

- (void)setAssetUrl:(id)a3
{
  objc_storeStrong((id *)&self->_assetUrl, a3);
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_assetUrl, 0);
}

@end
