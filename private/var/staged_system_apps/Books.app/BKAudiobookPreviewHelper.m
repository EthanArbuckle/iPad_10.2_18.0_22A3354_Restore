@implementation BKAudiobookPreviewHelper

- (BOOL)isStreaming
{
  return 1;
}

- (BKAudiobookPreviewHelper)initWithMAsset:(id)a3 lockupProfile:(id)a4
{
  id v7;
  id v8;
  BKAudiobookPreviewHelper *v9;
  BKAudiobookPreviewHelper *v10;
  id v11;
  NSObject *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKAudiobookPreviewHelper;
  v9 = -[BKAudiobookPreviewHelper init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mAsset, a3);
    objc_storeStrong((id *)&v10->__lockupProfile, a4);
  }
  if (!-[BKAudiobookPreviewHelper _valid](v10, "_valid"))
  {
    v11 = sub_1001B6D9C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_1006A092C(v12);

    v10 = 0;
  }

  return v10;
}

- (NSURL)previewURL
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper mAsset](self, "mAsset"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "previewURL"));

  return (NSURL *)v3;
}

- (double)previewDuration
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper _previewDictionary](self, "_previewDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("duration")));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  return v9;
}

- (NSDictionary)lockupProfileDictionary
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_opt_class(NSDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper _lockupProfile](self, "_lockupProfile"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "profileDictionary"));
  v6 = BUDynamicCast(v3, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return (NSDictionary *)v7;
}

- (NSString)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper helperMetadataForKey:needsCoordination:](self, "helperMetadataForKey:needsCoordination:", AEHelperStringMetadataTitleKey, 0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper previewURL](self, "previewURL"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper mAsset](self, "mAsset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "id"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> [Title: %@] [URL: %@] [AssetID: %@]"), v5, self, v6, v7, v9));

  return (NSString *)v10;
}

- (id)helperCoverImage
{
  NSObject *v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v7[4];
  NSObject *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = sub_10004E3A0;
  v14 = sub_10004E250;
  v15 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100102CB0;
  v7[3] = &unk_1008EAE48;
  v9 = &v10;
  v3 = dispatch_semaphore_create(0);
  v8 = v3;
  -[BKAudiobookPreviewHelper helperCoverImageWithCompletion:](self, "helperCoverImageWithCompletion:", v7);
  v4 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v3, v4);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

- (void)helperCoverImageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper mAsset](self, "mAsset"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artworkURL"));

  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "jsa_normalizedArtworkURLOfSize:withFormat:", CFSTR("jpg"), 1500.0, 1500.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v7));

    objc_initWeak(&location, self);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sharedSession](NSURLSession, "sharedSession"));
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100102EB8;
      v12[3] = &unk_1008EAE98;
      objc_copyWeak(&v14, &location);
      v13 = v4;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dataTaskWithURL:completionHandler:", v8, v12));

      objc_msgSend(v10, "resume");
      objc_destroyWeak(&v14);
      goto LABEL_7;
    }
  }
  else
  {
    objc_initWeak(&location, self);
  }
  v11 = objc_retainBlock(v4);
  v8 = v11;
  if (v11)
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
LABEL_7:

  objc_destroyWeak(&location);
}

- (void)helperViewControllerWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookNowPlayingModuleFactory instantiate](BKAudiobookNowPlayingModuleFactory, "instantiate"));
  if (v8)
  {
    objc_initWeak(&location, v8);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100103204;
    v11[3] = &unk_1008EAEC0;
    objc_copyWeak(&v14, &location);
    v12 = 0;
    v13 = v7;
    objc_msgSend(v8, "setHelper:completion:", self, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = objc_retainBlock(v7);
    v10 = v9;
    if (v9)
      (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, 0, 0);

  }
}

- (id)helperMetadataForKey:(id)a3 needsCoordination:(BOOL)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  if (objc_msgSend(v5, "isEqualToString:", AEHelperStringMetadataAssetIDKey))
    goto LABEL_5;
  if (objc_msgSend(v5, "isEqualToString:", AEHelperStringMetadataAuthorKey))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper mAsset](self, "mAsset"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "artistName"));
    goto LABEL_6;
  }
  if (objc_msgSend(v5, "isEqualToString:", AEHelperStringMetadataStoreIDKey))
  {
LABEL_5:
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper mAsset](self, "mAsset"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "id"));
    goto LABEL_6;
  }
  if (!objc_msgSend(v5, "isEqualToString:", AEHelperStringMetadataTitleKey))
  {
    v8 = 0;
    goto LABEL_7;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper mAsset](self, "mAsset"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "name"));
LABEL_6:
  v8 = (void *)v7;

LABEL_7:
  return v8;
}

- (id)helperMinifiedController
{
  return -[BKAudiobookMinifiedController initWithHelper:]([BKAudiobookMinifiedController alloc], "initWithHelper:", self);
}

- (id)sharedAnnotationProvider
{
  return 0;
}

- (id)_previewDictionary
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = objc_opt_class(NSDictionary);
  v4 = objc_opt_class(NSDictionary);
  v5 = objc_opt_class(NSArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper _lockupProfile](self, "_lockupProfile"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "offer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("assets")));
  v9 = BUDynamicCast(v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  v12 = BUDynamicCast(v4, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("preview")));
  v15 = BUDynamicCast(v3, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

  return v16;
}

- (BOOL)_valid
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  BOOL v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper _lockupProfile](self, "_lockupProfile"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper mAsset](self, "mAsset"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "id"));
    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPreviewHelper previewURL](self, "previewURL"));
      if (v6)
      {
        -[BKAudiobookPreviewHelper previewDuration](self, "previewDuration");
        v8 = v7 > 0.0;
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

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BFMAsset)mAsset
{
  return self->_mAsset;
}

- (AEUserPublishingProductProfile)_lockupProfile
{
  return self->__lockupProfile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__lockupProfile, 0);
  objc_storeStrong((id *)&self->_mAsset, 0);
}

@end
