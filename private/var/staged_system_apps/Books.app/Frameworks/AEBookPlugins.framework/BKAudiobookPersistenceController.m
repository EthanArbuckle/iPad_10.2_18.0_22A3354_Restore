@implementation BKAudiobookPersistenceController

+ (void)registerAEPersistencePlugins
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedInstance"));
  objc_msgSend(v2, "registerAEPersistencePlugins");

}

- (void)registerAEPersistencePlugins
{
  void *v3;
  id v4;
  AEAudiobookPersistenceFile *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceController stores](self, "stores"));
  v4 = objc_msgSend(v3, "count");

  if (!v4)
  {
    v5 = objc_opt_new(AEAudiobookPersistenceFile);
    -[BKAudiobookPersistenceController addStore:](self, "addStore:", v5);

    v6 = objc_alloc((Class)BKAudiobookPersistenceCloudKit);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetDetailManager"));
    v11 = objc_msgSend(v6, "initWithAssetDetailManager:", v8);

    if (v11)
      -[BKAudiobookPersistenceController addStore:](self, "addStore:", v11);
    v9 = (void *)objc_opt_new(BKAudiobookPersistenceMediaLibraryLocalItems);
    -[BKAudiobookPersistenceController addStore:](self, "addStore:", v9);

    v10 = (void *)objc_opt_new(BKAudiobookPersistenceMediaLibraryDAAPItem);
    -[BKAudiobookPersistenceController addStore:](self, "addStore:", v10);

  }
}

- (double)audiobookTimeForLocation:(id)a3 audiobook:(id)a4
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  double Seconds;
  double v14;
  double v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  const char *v20;
  id v21;
  id v22;
  NSObject *v23;
  double v24;
  double v25;
  CMTime v27;
  CMTime v28;
  CMTime v29;
  CMTime time;
  uint8_t buf[4];
  unint64_t v32;
  __int16 v33;
  id v34;

  v5 = a3;
  v6 = a4;
  v7 = (unint64_t)objc_msgSend(v5, "ordinal");
  if ((v7 & 0x8000000000000000) != 0)
  {
    v16 = _AEBookPluginsAudiobookLog();
    v9 = objc_claimAutoreleasedReturnValue(v16);
    v15 = 0.0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v32 = v7;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "Ordinal %ld < 0, can't convert to audiobook time.", buf, 0xCu);
    }
    goto LABEL_24;
  }
  objc_opt_class(BKAudioTrackNumberLocation);
  if ((objc_opt_isKindOfClass(v5, v8) & 1) != 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tracks"));
    if (v7 < (unint64_t)-[NSObject count](v9, "count"))
    {
      v10 = objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v7));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject chapters](v10, "chapters"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

      if (v12)
      {
        objc_msgSend(v12, "timeRangeInAudiobook");
        time = v29;
        Seconds = CMTimeGetSeconds(&time);
        objc_msgSend(v5, "offset");
        v15 = Seconds + v14;
      }
      else
      {
        v22 = _AEBookPluginsAudiobookLog();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v32 = v7;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_ERROR, "Track with ordinal %ld has no chapters, can't convert to audiobook time", buf, 0xCu);
        }

        v15 = 0.0;
      }

      goto LABEL_23;
    }
    v19 = _AEBookPluginsAudiobookLog();
    v10 = objc_claimAutoreleasedReturnValue(v19);
    v15 = 0.0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v32 = v7;
      v33 = 2048;
      v34 = -[NSObject count](v9, "count");
      v20 = "Ordinal %ld >= %lu (track count), can't convert to audiobook time.";
LABEL_16:
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  objc_opt_class(BKAudioLocation);
  v15 = 0.0;
  if ((objc_opt_isKindOfClass(v5, v17) & 1) != 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chapters"));
    if (v7 < (unint64_t)-[NSObject count](v9, "count"))
    {
      v18 = objc_claimAutoreleasedReturnValue(-[NSObject objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", v7));
      v10 = v18;
      if (v18)
        -[NSObject timeRangeInAudiobook](v18, "timeRangeInAudiobook");
      else
        memset(&v27, 0, sizeof(v27));
      v28 = v27;
      v24 = CMTimeGetSeconds(&v28);
      objc_msgSend(v5, "offset");
      v15 = v24 + v25;
      goto LABEL_23;
    }
    v21 = _AEBookPluginsAudiobookLog();
    v10 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v32 = v7;
      v33 = 2048;
      v34 = -[NSObject count](v9, "count");
      v20 = "Ordinal %ld >= %lu (chapter count), can't convert to audiobook time.";
      goto LABEL_16;
    }
LABEL_23:

LABEL_24:
  }

  return v15;
}

@end
