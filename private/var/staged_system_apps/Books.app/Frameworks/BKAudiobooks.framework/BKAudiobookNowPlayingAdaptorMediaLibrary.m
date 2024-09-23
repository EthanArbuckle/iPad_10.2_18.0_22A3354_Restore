@implementation BKAudiobookNowPlayingAdaptorMediaLibrary

- (void)dealloc
{
  objc_super v3;

  -[BKAudiobookNowPlayingAdaptorMediaLibrary _fireAndFreeArtworkCompletionBlocksWithImage:error:](self, "_fireAndFreeArtworkCompletionBlocksWithImage:error:", 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)BKAudiobookNowPlayingAdaptorMediaLibrary;
  -[BKAudiobookNowPlayingAdaptorMediaLibrary dealloc](&v3, "dealloc");
}

- (void)setSessionID:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BKAudiobookNowPlayingAdaptorMediaLibrary;
  -[BKAudiobookNowPlayingAdaptor setSessionID:](&v4, "setSessionID:", a3);
  -[BKAudiobookNowPlayingAdaptor invalidatePlaybackQueue](self, "invalidatePlaybackQueue");
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemIDForOffset:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char *v17;
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;

  if (!-[BKAudiobookNowPlayingAdaptor audiobookPlayerActiveOutput](self, "audiobookPlayerActiveOutput", a3))
    return 0;
  v6 = objc_opt_class(BKMLAudiobook);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "currentAudiobook"));
  v9 = BUDynamicCast(v6, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v11 = objc_opt_class(BKMLAudiobookChapter);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currentChapter"));
    v14 = BUDynamicCast(v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
      v17 = (char *)objc_msgSend(v16, "currentChapterIndex");

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chapters"));
      v19 = (char *)objc_msgSend(v18, "count");

      if (&v17[a4] >= v19)
      {
        v21 = 0;
        v23 = 0;
      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chapters"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", &v17[a4]));

        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "contentItem"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));

      }
      v30 = BKAudiobooksNowPlayingAdaptorLog();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "contentItem"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "identifier"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v17));
        v36 = 138412802;
        v37 = v32;
        v38 = 2112;
        v39 = v34;
        v40 = 2112;
        v41 = v35;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, "contentItemIDForOffset[%@]=%@ chapter=%@", (uint8_t *)&v36, 0x20u);

      }
    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "currentAudiobook"));
    v27 = objc_msgSend(v26, "isAudiobookPreview");

    v23 = 0;
    if (v27 && !a4)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "currentAudiobook"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "assetID"));

    }
  }

  return v23;
}

- (id)nowPlayingInfoCenter:(id)a3 contentItemForID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  id v38;
  void *v39;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[3];
  _QWORD v47[3];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  id v51;
  _BYTE v52[128];

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentAudiobook"));

  if (-[BKAudiobookNowPlayingAdaptor audiobookPlayerActiveOutput](self, "audiobookPlayerActiveOutput"))
  {
    v8 = objc_opt_class(BKMLAudiobook);
    v9 = BUDynamicCast(v8, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if (v10)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentAudiobook"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "chapters"));

      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      if (v14)
      {
        v41 = v7;
        v15 = *(_QWORD *)v43;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v43 != v15)
              objc_enumerationMutation(v13);
            v17 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
            v18 = objc_opt_class(BKMLAudiobookChapter);
            v19 = BUDynamicCast(v18, v17);
            v20 = objc_claimAutoreleasedReturnValue(v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject contentItem](v20, "contentItem"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));
            v23 = objc_msgSend(v22, "isEqualToString:", v5);

            if (v23)
            {
              v14 = v21;
              v24 = BKAudiobooksNowPlayingAdaptorLog();
              v25 = objc_claimAutoreleasedReturnValue(v24);
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
              {
                v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
                *(_DWORD *)buf = 138412546;
                v49 = v26;
                v50 = 2112;
                v51 = v14;
                _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "contentItemForID[%@]=%@", buf, 0x16u);

              }
              v7 = v41;
              goto LABEL_16;
            }

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          if (v14)
            continue;
          break;
        }
        v7 = v41;
      }
    }
    else
    {
      if (!objc_msgSend(v7, "isAudiobookPreview")
        || (v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID")),
            v28 = objc_msgSend(v5, "isEqual:", v27),
            v27,
            !v28))
      {
        v14 = 0;
        goto LABEL_23;
      }
      v29 = objc_alloc((Class)MPNowPlayingContentItem);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
      v14 = objc_msgSend(v29, "initWithIdentifier:", v30);

      objc_msgSend(v14, "setMediaType:", 4);
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "author"));
      objc_msgSend(v14, "setTrackArtistName:", v31);

      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "author"));
      objc_msgSend(v14, "setAlbumArtistName:", v32);

      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
      objc_msgSend(v14, "setTitle:", v33);

      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
      objc_msgSend(v14, "setAlbumName:", v34);

      objc_msgSend(v7, "duration");
      objc_msgSend(v14, "setDuration:");
      objc_msgSend(v14, "setElapsedTime:", 0.0);
      LODWORD(v35) = 0;
      objc_msgSend(v14, "setPlaybackRate:", v35);
      LODWORD(v36) = 1.0;
      objc_msgSend(v14, "setDefaultPlaybackRate:", v36);
      objc_msgSend(v14, "setNumberOfChildren:", 0);
      objc_msgSend(v14, "setContainer:", 0);
      objc_msgSend(v14, "setHasArtwork:", 1);
      objc_msgSend(v14, "setPlayable:", 1);
      v46[0] = kMRMediaRemoteNowPlayingInfoChapterNumber;
      v46[1] = kMRMediaRemoteNowPlayingInfoTotalChapterCount;
      v47[0] = &off_3A0C8;
      v47[1] = &off_3A0E0;
      v46[2] = kMRMediaRemoteNowPlayingInfoUniqueIdentifier;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
      v47[2] = v37;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 3));

      objc_msgSend(v14, "setNowPlayingInfo:", v13);
      -[BKAudiobookNowPlayingAdaptorMediaLibrary setContentItemForPreviews:](self, "setContentItemForPreviews:", v14);
      v38 = BKAudiobooksNowPlayingAdaptorLog();
      v20 = objc_claimAutoreleasedReturnValue(v38);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        *(_DWORD *)buf = 138412546;
        v49 = v39;
        v50 = 2112;
        v51 = 0;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "contentItemForID[%@]=%@", buf, 0x16u);

      }
LABEL_16:

    }
LABEL_23:

    goto LABEL_24;
  }
  v14 = 0;
LABEL_24:

  return v14;
}

- (id)nowPlayingInfoCenter:(id)a3 artworkForContentItem:(id)a4 size:(CGSize)a5 completion:(id)a6
{
  CGFloat height;
  CGFloat width;
  id v11;
  id v12;
  id v13;
  unsigned int v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  BKAudiobookNowPlayingAdaptorMediaLibrary *v24;
  id v25;
  id v26[3];
  id buf[2];

  height = a5.height;
  width = a5.width;
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = -[BKAudiobookNowPlayingAdaptor audiobookPlayerActiveOutput](self, "audiobookPlayerActiveOutput");
  v15 = BKAudiobooksNowPlayingAdaptorLog();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Attempting to fetch artwork for active audiobook.", (uint8_t *)buf, 2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "currentAudiobook"));

    objc_initWeak(buf, self);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_DF58;
    v22[3] = &unk_38D68;
    objc_copyWeak(v26, buf);
    v20 = v19;
    v23 = v20;
    v24 = self;
    v25 = v13;
    v26[1] = *(id *)&width;
    v26[2] = *(id *)&height;
    objc_msgSend(v20, "artworkWithCompletion:", v22);

    objc_destroyWeak(v26);
    objc_destroyWeak(buf);

  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_21920(v17);

    (*((void (**)(id, _QWORD, _QWORD))v13 + 2))(v13, 0, 0);
  }

  return 0;
}

- (id)playbackQueueIdentifierForNowPlayingInfoCenter:(id)a3
{
  return -[BKAudiobookNowPlayingAdaptor sessionID](self, "sessionID", a3);
}

- (void)nowPlayingInfoChanged:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  unsigned int v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  double v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  unsigned int v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  float v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  void *v46;
  void *v47;
  double v48;
  int v49;
  void *v50;
  __int16 v51;
  double v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;

  v3 = a3;
  v5 = objc_opt_class(BKMLAudiobookChapter);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentChapter"));
  v8 = BUDynamicCast(v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
  objc_msgSend(v10, "playbackRate");
  v12 = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
  objc_msgSend(v13, "positionInCurrentChapter");
  v15 = v14;

  if (v3)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
    v17 = objc_msgSend(v16, "isPlaying");

    if (!v17)
      v12 = 0.0;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentItem"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "currentAudiobook"));
  v21 = objc_msgSend(v20, "isAudiobookPreview");

  if (v21)
  {
    v23 = objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptorMediaLibrary contentItemForPreviews](self, "contentItemForPreviews"));

    v18 = (void *)v23;
  }
  if (v18)
  {
    *(float *)&v22 = v12;
    objc_msgSend(v18, "setElapsedTime:playbackRate:", v15, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
    objc_msgSend(v24, "playbackRate");
    objc_msgSend(v18, "setDefaultPlaybackRate:");

    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "userInfo"));
    if (!v25)
      v25 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionary](NSDictionary, "dictionary"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
    if ((objc_msgSend(v26, "isStalling") & 1) != 0)
    {
      v27 = &dword_0 + 1;
    }
    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
      v27 = objc_msgSend(v29, "isLoadingResources");

    }
    v30 = MPNowPlayingContentItemUserInfoKeyIsLoading;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject objectForKey:](v25, "objectForKey:", MPNowPlayingContentItemUserInfoKeyIsLoading));
    v32 = objc_msgSend(v31, "BOOLValue");

    if ((_DWORD)v27 != v32)
    {
      v33 = -[NSObject mutableCopy](v25, "mutableCopy");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v27));
      objc_msgSend(v33, "setObject:forKey:", v34, v30);

      objc_msgSend(v18, "setUserInfo:", v33);
    }
    v35 = BKAudiobooksNowPlayingAdaptorLog();
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
      objc_msgSend(v18, "playbackRate");
      v39 = v38;
      objc_msgSend(v18, "elapsedTime");
      v41 = v40;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v27));
      v49 = 138413058;
      v50 = v37;
      v51 = 2048;
      v52 = v39;
      v53 = 2048;
      v54 = v41;
      v55 = 2112;
      v56 = v42;
      _os_log_impl(&dword_0, v36, OS_LOG_TYPE_DEFAULT, "nowPlayingInfoChanged identifier=%@ rate=%f elapsedTime=%f isLoading=%@", (uint8_t *)&v49, 0x2Au);

    }
  }
  else
  {
    v28 = BKAudiobooksNowPlayingAdaptorLog();
    v25 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v49) = 0;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, "nowPlayingInfoChanged no contentItem available", (uint8_t *)&v49, 2u);
    }
  }

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptor player](self, "player"));
  objc_msgSend(v43, "playbackRate");
  v45 = v44;
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandCenter sharedCommandCenter](MPRemoteCommandCenter, "sharedCommandCenter"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "changePlaybackRateCommand"));
  LODWORD(v48) = v45;
  objc_msgSend(v47, "setPreferredRate:", v48);

}

- (void)player:(id)a3 audiobookDidChange:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKAudiobookNowPlayingAdaptorMediaLibrary;
  -[BKAudiobookNowPlayingAdaptor player:audiobookDidChange:](&v5, "player:audiobookDidChange:", a3, a4);
  -[BKAudiobookNowPlayingAdaptorMediaLibrary _fireAndFreeArtworkCompletionBlocksWithImage:error:](self, "_fireAndFreeArtworkCompletionBlocksWithImage:error:", 0, 0);
  -[BKAudiobookNowPlayingAdaptorMediaLibrary setNowPlayingAudiobookArtworkForPreviews:](self, "setNowPlayingAudiobookArtworkForPreviews:", 0);
  -[BKAudiobookNowPlayingAdaptorMediaLibrary setContentItemForPreviews:](self, "setContentItemForPreviews:", 0);
}

- (void)coverWillChangeTo:(CGImage *)a3
{
  void *v4;
  id v5;

  if (a3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:"));
    -[BKAudiobookNowPlayingAdaptorMediaLibrary setNowPlayingAudiobookArtworkForPreviews:](self, "setNowPlayingAudiobookArtworkForPreviews:", v4);

    v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptorMediaLibrary nowPlayingAudiobookArtworkForPreviews](self, "nowPlayingAudiobookArtworkForPreviews"));
    -[BKAudiobookNowPlayingAdaptorMediaLibrary _fireAndFreeArtworkCompletionBlocksWithImage:error:](self, "_fireAndFreeArtworkCompletionBlocksWithImage:error:", v5, 0);

  }
}

- (void)_fireAndFreeArtworkCompletionBlocksWithImage:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSString *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  void *v25;
  CGSize v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookNowPlayingAdaptorMediaLibrary artworkCompletionBlocks](self, "artworkCompletionBlocks"));
  v9 = objc_msgSend(v8, "copy");

  -[BKAudiobookNowPlayingAdaptorMediaLibrary setArtworkCompletionBlocks:](self, "setArtworkCompletionBlocks:", 0);
  v10 = BKAudiobooksNowPlayingAdaptorLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "size");
    v12 = NSStringFromCGSize(v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    *(_DWORD *)buf = 138543362;
    v25 = v13;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Finished generating artwork for active preview audiobook (%{public}@)", buf, 0xCu);

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v9;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v18) + 16))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v18));
        v18 = (char *)v18 + 1;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (UIImage)nowPlayingAudiobookArtworkForPreviews
{
  return self->_nowPlayingAudiobookArtworkForPreviews;
}

- (void)setNowPlayingAudiobookArtworkForPreviews:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingAudiobookArtworkForPreviews, a3);
}

- (MPNowPlayingContentItem)contentItemForPreviews
{
  return self->_contentItemForPreviews;
}

- (void)setContentItemForPreviews:(id)a3
{
  objc_storeStrong((id *)&self->_contentItemForPreviews, a3);
}

- (NSMutableArray)artworkCompletionBlocks
{
  return self->_artworkCompletionBlocks;
}

- (void)setArtworkCompletionBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_artworkCompletionBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_contentItemForPreviews, 0);
  objc_storeStrong((id *)&self->_nowPlayingAudiobookArtworkForPreviews, 0);
}

@end
