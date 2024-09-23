@implementation MTEpisode

- (int64_t)reasonForNotPlayable
{
  return +[MTEpisodeUnavailableUtil unavailableReasonForEpisode:](MTEpisodeUnavailableUtil, "unavailableReasonForEpisode:", self);
}

+ (id)dateLabelDescriptionForEpisode:(id)a3 download:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  int v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;

  v5 = a3;
  v6 = a4;
  if (!v6)
    goto LABEL_14;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
  v8 = (unint64_t)objc_msgSend(v7, "reasonForNoInternet");

  v9 = +[MTEpisode downloadSizeLimitForEpisode:](MTEpisode, "downloadSizeLimitForEpisode:", v5);
  if ((uint64_t)objc_msgSend(v6, "downloadBytes") <= v9)
  {
    v11 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
    v11 = objc_msgSend(v10, "isReachableViaCellular");

  }
  if ((v8 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    if (v8 == 2)
      v14 = 1;
    else
      v14 = v11;
    if (v14 == 1)
    {
      v15 = MGGetBoolAnswer(CFSTR("wapi"));
      v16 = CFSTR("WIFI_CONNECT_RESUME");
      if (v15)
        v16 = CFSTR("WLAN_CONNECT_RESUME");
      v17 = v16;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", v17, &stru_1004C6D40, 0));

      goto LABEL_23;
    }
LABEL_14:
    switch((unint64_t)objc_msgSend(v6, "downloadPhase"))
    {
      case 1uLL:
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v12 = v20;
        v21 = CFSTR("Preparing to download...");
        goto LABEL_21;
      case 2uLL:
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadDescription"));
        goto LABEL_23;
      case 3uLL:
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v12 = v20;
        v21 = CFSTR("TAP_TO_RESUME_DOWNLOAD");
        goto LABEL_21;
      case 4uLL:
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v12 = v20;
        v21 = CFSTR("Waiting");
        goto LABEL_21;
      case 5uLL:
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v12 = v20;
        v21 = CFSTR("DOWNLOAD_ERROR_TAP_TO_RETRY");
LABEL_21:
        v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", v21, &stru_1004C6D40, 0));
        goto LABEL_22;
      default:
        v19 = 0;
        goto LABEL_23;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "reasonTextForNoInternet"));
LABEL_22:
  v19 = (void *)v13;

LABEL_23:
  return v19;
}

+ (int64_t)downloadSizeLimitForEpisode:(id)a3
{
  return (int64_t)_objc_msgSend(a1, "downloadSizeLimitForVideo:", objc_msgSend(a3, "isVideo"));
}

+ (int64_t)downloadSizeLimitForVideo:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  int64_t v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[IMURLBag sharedInstance](IMURLBag, "sharedInstance"));
  v5 = v4;
  if (a3)
    v6 = objc_msgSend(v4, "downloadLimitVideoPodcast");
  else
    v6 = objc_msgSend(v4, "downloadLimitPodcast");
  v7 = (int64_t)v6;

  return v7;
}

- (void)setGuid:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  unint64_t v9;

  v9 = (unint64_t)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[MTEpisode guid](self, "guid"));
  v5 = v9 | v4;

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode guid](self, "guid"));
    v7 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = kEpisodeGuid;
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", kEpisodeGuid);
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", v8);
      -[MTEpisode updateUPPIdentifierIfNeeded](self, "updateUPPIdentifierIfNeeded");
    }
  }

}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v10 = (unint64_t)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[MTEpisode title](self, "title"));
  v5 = v10 | v4;

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](self, "title"));
    v7 = objc_msgSend(v6, "isEqualToString:", v10);

    if ((v7 & 1) == 0)
    {
      v8 = kEpisodeTitle;
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", kEpisodeTitle);
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v10, v8);
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode guid](self, "guid"));

      if (!v9)
        -[MTEpisode updateUPPIdentifierIfNeeded](self, "updateUPPIdentifierIfNeeded");
    }
  }

}

- (void)setAuthor:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  v10 = (unint64_t)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[MTEpisode author](self, "author"));
  v5 = v10 | v4;

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode author](self, "author"));
    v7 = objc_msgSend(v6, "isEqualToString:", v10);

    if ((v7 & 1) == 0)
    {
      v8 = kEpisodeAuthor;
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", kEpisodeAuthor);
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v10, v8);
      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode guid](self, "guid"));

      if (!v9)
        -[MTEpisode updateUPPIdentifierIfNeeded](self, "updateUPPIdentifierIfNeeded");
    }
  }

}

- (BOOL)isPlayable
{
  return -[MTEpisode reasonForNotPlayable](self, "reasonForNotPlayable") == 0;
}

- (void)didChangePersistentID
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode playlists](self, "playlists", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "updateUnplayedCount");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setPlayCount:(int64_t)a3
{
  uint64_t v5;
  void *v6;

  if (-[MTEpisode playCount](self, "playCount") != (id)a3)
  {
    v5 = kEpisodePlayCount;
    -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", kEpisodePlayCount);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
    -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, v5);

    -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", v5);
    -[MTEpisode updateUPPTimestamp](self, "updateUPPTimestamp");
  }
}

- (void)setPlayhead:(float)a3
{
  float v5;
  float v6;
  double v7;
  uint64_t v9;
  double v10;
  void *v11;

  -[MTEpisode playhead](self, "playhead");
  v6 = v5;
  -[MTEpisode playhead](self, "playhead");
  if (*(float *)&v7 != a3)
  {
    *(float *)&v7 = vabds_f32(v6, a3);
    if (a3 == 0.0 || *(float *)&v7 >= 0.5)
    {
      v9 = kEpisodePlayhead;
      -[MTEpisode willChangeValueForKey:](self, "willChangeValueForKey:", kEpisodePlayhead, v7);
      *(float *)&v10 = a3;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v10));
      -[MTEpisode setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v11, v9);

      -[MTEpisode didChangeValueForKey:](self, "didChangeValueForKey:", v9);
      -[MTEpisode updateUPPTimestamp](self, "updateUPPTimestamp");
    }
  }
}

- (BOOL)isCurrentPlayerItem
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode uuid](self, "uuid"));
  v5 = objc_msgSend(v3, "isPlayingEpisodeUuid:", v4);

  return v5;
}

- (void)updateUPPIdentifierIfNeeded
{
  uint64_t v3;
  NSObject *v4;
  os_signpost_id_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const char *v21;
  id v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL4 v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  void *v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  int v45;
  void *v46;
  __int16 v47;
  NSObject *v48;
  __int16 v49;
  void *v50;

  v3 = _MTLogCategoryUPPSync(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  v5 = os_signpost_id_generate(v4);

  v8 = _MTLogCategoryUPPSync(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(v45) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, v5, "updateUPPIdentifierIfNeeded", ", (uint8_t *)&v45, 2u);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTUniversalPlaybackPositionDataSource mediaItemIdentifierForEpisode:](MTUniversalPlaybackPositionDataSource, "mediaItemIdentifierForEpisode:", self));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode metadataIdentifier](self, "metadataIdentifier"));
  v13 = objc_msgSend(v11, "isEqualToString:", v12);

  if ((v13 & 1) != 0)
  {
    v16 = _MTLogCategoryUPPSync(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](self, "title"));
      v19 = objc_claimAutoreleasedReturnValue(-[MTEpisode uuid](self, "uuid"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode metadataIdentifier](self, "metadataIdentifier"));
      v45 = 138543874;
      v46 = v18;
      v47 = 2114;
      v48 = v19;
      v49 = 2114;
      v50 = v20;
      v21 = "[UpdateUPPID] Skipping, equal metadata identifier: %{public}@, %{public}@, %{public}@";
LABEL_16:
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v45, 0x20u);

      goto LABEL_17;
    }
  }
  else
  {
    -[MTEpisode setMetadataIdentifier:](self, "setMetadataIdentifier:", v11);
    v22 = -[MTEpisode metadataTimestamp](self, "metadataTimestamp");
    v24 = v23;
    v26 = _MTLogCategoryUPPSync(v22, v25);
    v17 = objc_claimAutoreleasedReturnValue(v26);
    v27 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if (v24 == 0.0)
    {
      if (v27)
      {
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](self, "title"));
        v29 = objc_claimAutoreleasedReturnValue(-[MTEpisode uuid](self, "uuid"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode metadataIdentifier](self, "metadataIdentifier"));
        v45 = 138543874;
        v46 = v28;
        v47 = 2114;
        v48 = v29;
        v49 = 2114;
        v50 = v30;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[UpdateUPPID] Looking up UPP data for: %{public}@, %{public}@, %{public}@", (uint8_t *)&v45, 0x20u);

      }
      v17 = objc_claimAutoreleasedReturnValue(-[MTEpisode managedObjectContext](self, "managedObjectContext"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject uppMetadataForMetadataIdentifier:](v17, "uppMetadataForMetadataIdentifier:", v11));
      v32 = _MTLogCategoryUPPSync(v18, v31);
      v19 = objc_claimAutoreleasedReturnValue(v32);
      v33 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v33)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](self, "title"));
          v35 = objc_claimAutoreleasedReturnValue(-[MTEpisode uuid](self, "uuid"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode metadataIdentifier](self, "metadataIdentifier"));
          v45 = 138543874;
          v46 = v34;
          v47 = 2114;
          v48 = v35;
          v49 = 2114;
          v50 = v36;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[UpdateUPPID] Setting UPP data for: %{public}@, %{public}@, %{public}@", (uint8_t *)&v45, 0x20u);

        }
        +[MTUniversalPlaybackPositionDataSource updateEpisode:withUPPMetadata:](MTUniversalPlaybackPositionDataSource, "updateEpisode:withUPPMetadata:", self, v18);
        goto LABEL_18;
      }
      if (v33)
      {
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](self, "title"));
        v43 = objc_claimAutoreleasedReturnValue(-[MTEpisode uuid](self, "uuid"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode metadataIdentifier](self, "metadataIdentifier"));
        v45 = 138543874;
        v46 = v42;
        v47 = 2114;
        v48 = v43;
        v49 = 2114;
        v50 = v44;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "[UpdateUPPID] Skipping, no UPP metadata: %{public}@, %{public}@, %{public}@", (uint8_t *)&v45, 0x20u);

      }
LABEL_17:

LABEL_18:
      goto LABEL_19;
    }
    if (v27)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode title](self, "title"));
      v19 = objc_claimAutoreleasedReturnValue(-[MTEpisode uuid](self, "uuid"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisode metadataIdentifier](self, "metadataIdentifier"));
      v45 = 138543874;
      v46 = v18;
      v47 = 2114;
      v48 = v19;
      v49 = 2114;
      v50 = v20;
      v21 = "[UpdateUPPID] Skipping, timestamp >0: %{public}@, %{public}@, %{public}@";
      goto LABEL_16;
    }
  }
LABEL_19:

  v39 = _MTLogCategoryUPPSync(v37, v38);
  v40 = objc_claimAutoreleasedReturnValue(v39);
  v41 = v40;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    LOWORD(v45) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v41, OS_SIGNPOST_INTERVAL_END, v5, "updateUPPIdentifierIfNeeded", ", (uint8_t *)&v45, 2u);
  }

}

- (MTEpisodeIdentifier)episodeIdentifier
{
  return +[MTEpisodeIdentifier identifierWithEpisode:](MTEpisodeIdentifier, "identifierWithEpisode:", self);
}

- (BOOL)isEpisodeVisited
{
  void *v3;
  unsigned __int8 v4;

  if (!-[MTEpisode isNew](self, "isNew"))
    return 1;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTVisitedEpisodeManager sharedInstance](MTVisitedEpisodeManager, "sharedInstance"));
  v4 = objc_msgSend(v3, "hasEndedVisitingEpisode:", self);

  return v4;
}

@end
