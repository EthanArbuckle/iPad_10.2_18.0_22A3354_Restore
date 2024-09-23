@implementation MPMediaItem

- (id)bk_assetURL
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyFilePath));
  if (!objc_msgSend(v3, "length"))
    goto LABEL_24;
  v4 = BKAudiobooksLog();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem bk_effectiveTitle](self, "bk_effectiveTitle"));
    *(_DWORD *)buf = 138412290;
    v25 = v6;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Using file path for %@.", buf, 0xCu);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));
  if (!v7)
  {
LABEL_24:
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyStoreID));
    if (!v8)
      goto LABEL_12;
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NBAssetOverride-%@"), v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringForKey:", v11));

    if (objc_msgSend(v13, "length"))
    {
      v14 = BKAudiobooksLog();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v9;
        v26 = 2112;
        v27 = v13;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Overriding the asset path for %@ to be %@.", buf, 0x16u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v13));
    }
    else
    {
      v7 = 0;
    }

    if (!v7)
    {
LABEL_12:
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyHLSPlaylistURL));
      if (!objc_msgSend(v16, "length"))
      {

LABEL_18:
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyAssetURL));
        v20 = BKAudiobooksLog();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem bk_effectiveTitle](self, "bk_effectiveTitle"));
          *(_DWORD *)buf = 138412290;
          v25 = v22;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "No path available for streaming or local playback. Using the assetURL for %@.", buf, 0xCu);

        }
        goto LABEL_21;
      }
      v17 = BKAudiobooksLog();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem bk_effectiveTitle](self, "bk_effectiveTitle"));
        *(_DWORD *)buf = 138412290;
        v25 = v19;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Using HLS playlist for %@.", buf, 0xCu);

      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v16));

      if (!v7)
        goto LABEL_18;
    }
  }
LABEL_21:

  return v7;
}

- (id)bk_storeDemoAssetURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem bk_storeID](self, "bk_storeID"));
  if (!v3)
    goto LABEL_10;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/var/mobile/Media/Books/%@.m4b"), v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  v9 = BKAudiobooksLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v8)
  {
    if (v11)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
      *(_DWORD *)buf = 138412546;
      v16 = v3;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Failed to override the asset path for %@ to be %@. File does not exist.", buf, 0x16u);

    }
    goto LABEL_10;
  }
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    *(_DWORD *)buf = 138412546;
    v16 = v3;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Overriding the asset path for %@ to be %@.", buf, 0x16u);

  }
  if (!v5)
LABEL_10:
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem bk_assetURL](self, "bk_assetURL"));

  return v5;
}

+ (id)bk_audioBookAssetURLWithAlbumTitle:(id)a3 isCloudItem:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v5 = qword_44EE0;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&qword_44EE0, &stru_39270);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAddingPercentEncodingWithAllowedCharacters:", qword_44ED8));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("audiobook://medialibrary?albumTitle=%@&isCloudItem=%@"), v7, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v9));
  return v10;
}

- (id)bk_storeRedownloadParameters
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = objc_opt_class(NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyStoreRedownloadParameters));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (BOOL)bk_isJaliscoAsset
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyPurchaseHistoryID));
  v3 = objc_msgSend(v2, "unsignedLongLongValue") != 0;

  return v3;
}

- (id)bk_storeID
{
  unsigned int v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = -[MPMediaItem bk_isJaliscoAsset](self, "bk_isJaliscoAsset");
  v4 = objc_opt_class(NSNumber);
  v5 = &MPMediaItemPropertyStoreID;
  if (!v3)
    v5 = &MPMediaItemPropertyStorePlaylistID;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", *v5));
  v7 = BUDynamicCast(v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (objc_msgSend(v8, "longLongValue"))
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  return v10;
}

- (id)bk_storePlaylistID
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = objc_opt_class(NSNumber);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyStorePlaylistID));
  v5 = BUDynamicCast(v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (objc_msgSend(v6, "longLongValue"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)bk_assetID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  MPMediaEntityPersistentID v8;
  id v10;
  NSObject *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem bk_storeID](self, "bk_storeID"));
  if (!BUStoreIdFromObject(v3))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem albumTitle](self, "albumTitle"));
    if (objc_msgSend(v5, "length"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dataUsingEncoding:", 4));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bu_sha1"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("sha1-%@"), v7));

    }
    else
    {
      v8 = -[MPMediaItem persistentID](self, "persistentID");
      if (!v8)
      {
        v10 = BKAudiobooksLog();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_22930((uint64_t)self, v11);

        v4 = 0;
        goto LABEL_8;
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v8));
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("pid-%@"), v6));
    }

LABEL_8:
    goto LABEL_9;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringValue"));
LABEL_9:

  return v4;
}

- (id)bk_effectiveTitle
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem albumTitle](self, "albumTitle"));
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MPMediaItem title](self, "title"));
  v5 = v4;

  return v5;
}

- (id)bk_effectiveAuthor
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem albumArtist](self, "albumArtist"));
  if (objc_msgSend(v3, "length"))
    v4 = v3;
  else
    v4 = (id)objc_claimAutoreleasedReturnValue(-[MPMediaItem artist](self, "artist"));
  v5 = v4;

  return v5;
}

- (void)bk_artworkImageWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double Width;
  double Height;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (**v31)(id, void *);
  CGRect v32;
  CGRect v33;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem artworkCatalog](self, "artworkCatalog"));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v6, "bounds");
    Width = CGRectGetWidth(v32);
    objc_msgSend(v6, "bounds");
    Height = CGRectGetHeight(v33);
    if (Width >= Height)
      Width = Height;
    objc_msgSend(v6, "scale");
    objc_msgSend(v5, "setDestinationScale:");
    objc_msgSend(v5, "setFittingSize:", Width, Width);
    objc_msgSend(v5, "requestImageWithCompletionHandler:", v4);

  }
  else
  {
    v9 = BKAudiobooksLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_229D8(v10, v11, v12, v13, v14, v15, v16, v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem representativeItem](self, "representativeItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "valueForProperty:", MPMediaItemPropertyArtwork));

    if (v6)
    {
      objc_msgSend(v6, "bounds");
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imageWithSize:", v19, v20));
    }
    else
    {
      v22 = BKAudiobooksLog();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_229A4(v23, v24, v25, v26, v27, v28, v29, v30);

      v21 = 0;
    }
    v31 = (void (**)(id, void *))objc_retainBlock(v4);

    if (v31)
      v31[2](v31, v21);

  }
}

- (unint64_t)bk_albumTrackIndex
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem bk_assetID](self, "bk_assetID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem albumTitle](self, "albumTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_queryWithStoreID:albumTitle:isCloudItem:](MPMediaQuery, "bk_queryWithStoreID:albumTitle:isCloudItem:", v3, v4, -[MPMediaItem isCloudItem](self, "isCloudItem")));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collections"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_208C0;
    v11[3] = &unk_39298;
    v11[4] = self;
    v9 = (unint64_t)objc_msgSend(v8, "indexOfObjectPassingTest:", v11);

  }
  else
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v9;
}

- (id)bk_localStoreBookAlbumForItem
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = MPMediaItemPropertyPurchaseHistoryID;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyPurchaseHistoryID));
  if (objc_msgSend(v4, "longLongValue"))
  {
    v5 = 0;
  }
  else
  {
    v6 = MPMediaItemPropertyStorePlaylistID;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItem valueForProperty:](self, "valueForProperty:", MPMediaItemPropertyStorePlaylistID));
    if (objc_msgSend(v7, "longLongValue"))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_audiobooksQuery](MPMediaQuery, "bk_audiobooksQuery"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &off_3A170, v3));
      objc_msgSend(v8, "addFilterPredicate:", v9);

      if (v8)
      {
        objc_msgSend(v8, "setGroupingType:", 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v7, v6));
        objc_msgSend(v8, "addFilterPredicate:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collections"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

+ (BOOL)bk_isItemAudibleAudiobook:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;

  v3 = a3;
  v4 = objc_opt_class(NSString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForProperty:", MPMediaItemPropertyFilePath));

  v6 = BUDynamicCast(v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "pathExtension"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lowercaseString"));

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("aa")) & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("aax"));

  return v10;
}

+ (int)bk_audibleDRMGroupIDForItem:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;

  v4 = a3;
  if (v4 && objc_msgSend(a1, "bk_isItemAudibleAudiobook:", v4))
  {
    v5 = objc_opt_class(NSNumber);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForProperty:", MPMediaItemPropertyStoreAccountID));
    v7 = BUDynamicCast(v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = objc_msgSend(v8, "unsignedLongLongValue");

  }
  else
  {
    v9 = -1;
  }

  return v9;
}

@end
