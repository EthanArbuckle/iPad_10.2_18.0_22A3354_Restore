@implementation MTPlaylistSyncDictionaryMerge

- (MTPlaylistSyncDictionaryMerge)initWithLoggingCategory:(id)a3 dictionariesToMerge:(id)a4
{
  id v7;
  id v8;
  MTPlaylistSyncDictionaryMerge *v9;
  MTPlaylistSyncDictionaryMerge *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MTPlaylistSyncDictionaryMerge;
  v9 = -[MTPlaylistSyncDictionaryMerge init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_loggingCategory, a3);
    objc_storeStrong((id *)&v10->_dictionariesToMerge, a4);
    v10->_syncMergeIsFromCloud = 1;
  }

  return v10;
}

- (void)performAndWaitWithContext:(id)a3 save:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  unsigned int v9;
  _QWORD *v10;
  NSMutableSet *v11;
  id v12;
  NSObject *v13;
  unsigned int v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *i;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  void *context;
  id v27;
  _QWORD *v28;
  NSMutableSet *v29;
  _QWORD *v30;
  uint64_t v31;
  NSMutableSet *obj;
  id v33;
  NSObject *v34;
  id v35;
  MTPlaylistSyncDictionaryMerge *v36;
  _QWORD v37[5];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  MTPlaylistSyncDictionaryMerge *v45;
  id v46;
  NSObject *v47;
  NSMutableSet *v48;
  id v49;
  id v50;
  uint64_t *v51;
  _QWORD v52[4];
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  NSMutableSet *v59;
  _QWORD v60[5];
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];

  v4 = a4;
  v6 = a3;
  v36 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncDictionaryMerge loggingCategory](self, "loggingCategory"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncDictionaryMerge dictionariesToMerge](self, "dictionariesToMerge"));
  v9 = -[MTPlaylistSyncDictionaryMerge refreshContentsOfUpdatedOrInsertedPlaylists](self, "refreshContentsOfUpdatedOrInsertedPlaylists");
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_1001063C0;
  v60[3] = &unk_1004AB4B8;
  v60[4] = self;
  v10 = objc_retainBlock(v60);
  v11 = objc_opt_new(NSMutableSet);
  v12 = objc_alloc_init((Class)NSMutableDictionary);
  v54 = 0;
  v55 = &v54;
  v56 = 0x3032000000;
  v57 = sub_10004685C;
  v58 = sub_100046AA4;
  v59 = objc_opt_new(NSMutableSet);
  v13 = v7;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v8, "count");
    *(_DWORD *)buf = 67109120;
    LODWORD(v62) = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "merging %d playlists", buf, 8u);
  }

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_100106438;
  v52[3] = &unk_1004AB4E0;
  v15 = v6;
  v53 = v15;
  v30 = objc_retainBlock(v52);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100106448;
  v43[3] = &unk_1004AB5F8;
  v33 = v15;
  v44 = v33;
  v45 = v36;
  v27 = v8;
  v46 = v27;
  v34 = v13;
  v47 = v34;
  v51 = &v54;
  v29 = v11;
  v48 = v29;
  v35 = v12;
  v49 = v35;
  v28 = v10;
  v50 = v28;
  ((void (*)(_QWORD *, _BOOL8, _QWORD *))v30[2])(v30, v4, v43);
  if (v9)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[MTBaseProcessor sharedInstance](MTPlaylistQueryManager, "sharedInstance"));
    context = objc_autoreleasePoolPush();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    obj = v29;
    v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v65, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v40;
      v31 = kPlaylistTitle;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "objectForKeyedSubscript:", v20));
          v22 = v34;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "valueForKey:", v31));
            *(_DWORD *)buf = 138543618;
            v62 = v20;
            v63 = 2112;
            v64 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "sync processor is refreshing playlist (uuid=%{public}@ - title='%@')", buf, 0x16u);

          }
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_100107088;
          v37[3] = &unk_1004AB620;
          v37[4] = v36;
          v24 = v21;
          v38 = v24;
          objc_msgSend(v16, "updatePlaylistWithUuid:inContext:applyAdditionalChangesBlock:", v20, v33, v37);

        }
        v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v65, 16);
      }
      while (v17);
    }

    objc_autoreleasePoolPop(context);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightController sharedInstance](MTCoreSpotlightController, "sharedInstance"));
  objc_msgSend(v25, "updateStationsWithUUIDs:", v55[5]);

  _Block_object_dispose(&v54, 8);
}

- (void)_applyOrderingInSyncDictionary:(id)a3 playlist:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *i;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  __CFString *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  void *v57;
  __int16 v58;
  const __CFString *v59;
  _BYTE v60[128];

  v6 = a3;
  v7 = a4;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncDictionaryMerge loggingCategory](self, "loggingCategory"));
  if (objc_msgSend(v7, "isUngroupedList") && objc_msgSend(v7, "containerOrder") == 2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("episodeSortOrderArray")));
    if (objc_msgSend(v8, "count"))
    {
      v39 = v6;
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v38 = v8;
      v10 = v8;
      v43 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
      if (v43)
      {
        v42 = *(_QWORD *)v51;
        v40 = v10;
        while (2)
        {
          for (i = 0; i != v43; i = (char *)i + 1)
          {
            if (*(_QWORD *)v51 != v42)
              objc_enumerationMutation(v10);
            v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
            v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("mediaItemPersistentID"), v38));
            v14 = objc_msgSend(v13, "longLongValue");
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("sortOrder")));
            v16 = objc_msgSend(v15, "longLongValue");
            if (!v14)
            {
              v35 = v44;
              v8 = v38;
              if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
              {
                v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
                v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
                *(_DWORD *)buf = 138543874;
                v55 = v36;
                v56 = 2112;
                v57 = v37;
                v58 = 2114;
                v59 = CFSTR("mediaItemPersistentID");
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "ERROR: syncInfo ordering can't be be applied to playlist (uuid=%{public}@ - title='%@').  No %{public}@ found in info dictionary", buf, 0x20u);

                v10 = v40;
              }

              v6 = v39;
              goto LABEL_22;
            }
            v17 = v16;
            if (!v15)
            {
              v18 = v44;
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
                v20 = v9;
                v21 = v7;
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
                *(_DWORD *)buf = 138543874;
                v55 = v19;
                v56 = 2112;
                v57 = v22;
                v58 = 2114;
                v59 = CFSTR("sortOrder");
                _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "ERROR: syncInfo ordering can't be be applied to playlist (uuid=%{public}@ - title='%@').  No %{public}@ found in info dictionary", buf, 0x20u);

                v7 = v21;
                v9 = v20;
                v10 = v40;

              }
            }
            v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v17));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v14));
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, v24);

          }
          v43 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v50, v60, 16);
          if (v43)
            continue;
          break;
        }
      }

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "episodes"));
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_1001075EC;
      v48[3] = &unk_1004A8AC0;
      v27 = v25;
      v49 = v27;
      objc_msgSend(v26, "enumerateObjectsUsingBlock:", v48);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_10010768C;
      v45[3] = &unk_1004AB648;
      v46 = v9;
      v47 = v27;
      v13 = v27;
      v41 = v26;
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "sortedArrayUsingComparator:", v45));
      v29 = v44;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
        v31 = v7;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "valueForKey:", CFSTR("persistentID")));
        *(_DWORD *)buf = 138543874;
        v55 = v30;
        v56 = 2112;
        v57 = v32;
        v58 = 2114;
        v59 = v33;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "syncInfo ordering will be applied to playlist (uuid=%{public}@ - title='%@'), episodePIDs = %{public}@", buf, 0x20u);

        v7 = v31;
      }

      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v28));
      objc_msgSend(v7, "setEpisodes:", v34);

      v15 = v49;
      v8 = v38;
      v6 = v39;
      v10 = v41;
LABEL_22:

    }
  }

}

- (void)_addSetting:(id)a3 syncObj:(id)a4 playlist:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a3;
  v7 = a4;
  v8 = a5;
  v9 = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("podcastFeedUrl")));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("podcastFeedUrl")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "podcastForFeedUrl:", v11));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcastPlaylistSettings insertNewSettingsInManagedObjectContext:](MTPodcastPlaylistSettings, "insertNewSettingsInManagedObjectContext:", v19));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kPlaylistSettingUuid));
      objc_msgSend(v13, "setUuid:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("episodesToShowTruth")));
      objc_msgSend(v13, "setEpisodesToShow:", objc_msgSend(v15, "integerValue"));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kPlaylistSettingMediaType));
      objc_msgSend(v13, "setMediaType:", objc_msgSend(v16, "integerValue"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kPlaylistSettingShowPlayedEpisodes));
      objc_msgSend(v13, "setShowPlayedEpisodes:", objc_msgSend(v17, "BOOLValue"));

      objc_msgSend(v13, "setNeedsUpdate:", 1);
      objc_msgSend(v13, "setPlaylist:", v8);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kPlaylistSettingTracksDefault));
      objc_msgSend(v13, "setTracksDefault:", objc_msgSend(v18, "BOOLValue"));

      objc_msgSend(v13, "setPodcast:", v12);
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
      objc_msgSend(v13, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Sync/MTPlaylistSyncDictionaryMerge.m", 268, CFSTR("Trying to add a setting for a non-existent podcast"));
    }

  }
}

- (void)_mergeSetting:(id)a3 syncObj:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unsigned int v30;
  void *v31;
  unsigned int v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;

  v41 = a3;
  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("episodesToShowTruth")));
  if (v6
    && (v7 = (void *)v6,
        v8 = objc_msgSend(v41, "episodesToShow"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("episodesToShowTruth"))),
        v10 = objc_msgSend(v9, "integerValue"),
        v9,
        v7,
        v8 != v10))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("episodesToShowTruth")));
    objc_msgSend(v41, "setEpisodesToShow:", objc_msgSend(v12, "integerValue"));

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }
  v13 = kPlaylistSettingTracksDefault;
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kPlaylistSettingTracksDefault));
  if (v14)
  {
    v15 = (void *)v14;
    v16 = objc_msgSend(v41, "tracksDefault");
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v13));
    v18 = objc_msgSend(v17, "BOOLValue");

    if (v16 != v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v13));
      objc_msgSend(v41, "setTracksDefault:", objc_msgSend(v19, "BOOLValue"));

      v11 = 1;
    }
  }
  v20 = kPlaylistSettingMediaType;
  v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kPlaylistSettingMediaType));
  if (v21)
  {
    v22 = (void *)v21;
    v23 = objc_msgSend(v41, "mediaType");
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v20));
    v25 = objc_msgSend(v24, "integerValue");

    if (v23 != v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v20));
      objc_msgSend(v41, "setMediaType:", objc_msgSend(v26, "integerValue"));

      v11 = 1;
    }
  }
  v27 = kPlaylistSettingShowPlayedEpisodes;
  v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kPlaylistSettingShowPlayedEpisodes));
  if (v28)
  {
    v29 = (void *)v28;
    v30 = objc_msgSend(v41, "showPlayedEpisodes");
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v27));
    v32 = objc_msgSend(v31, "BOOLValue");

    if (v30 != v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v27));
      objc_msgSend(v41, "setShowPlayedEpisodes:", objc_msgSend(v33, "BOOLValue"));

      v11 = 1;
    }
  }
  v34 = kPlaylistSettingSortOrder;
  v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", kPlaylistSettingSortOrder));
  if (v35)
  {
    v36 = (void *)v35;
    v37 = objc_msgSend(v41, "sortOrder");
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v34));
    v39 = objc_msgSend(v38, "integerValue");

    if (v37 != v39)
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v34));
      objc_msgSend(v41, "setSortOrder:", objc_msgSend(v40, "longLongValue"));

      v11 = 1;
    }
  }
  objc_msgSend(v41, "setNeedsUpdate:", v11);

}

+ (void)mergeArray:(id)a3 fromArray:(id)a4 lookupKey:(id)a5 updateBlock:(id)a6 insertBlock:(id)a7 deleteBlock:(id)a8
{
  id v13;
  id v14;
  id v15;
  void (**v16)(id, void *, void *);
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void (**v29)(id, void *);
  _QWORD v30[4];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = (void (**)(id, void *, void *))a6;
  v29 = (void (**)(id, void *))a7;
  v27 = a8;
  v28 = v13;
  if (v13)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "valueForKey:", v15));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithObjects:forKeys:](NSMutableDictionary, "dictionaryWithObjects:forKeys:", v13, v17));

  }
  else
  {
    v18 = 0;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v19 = v14;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "valueForKey:", v15, v27, v28));
        if (v25)
        {
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v25));
          if (v26)
          {
            if (v16)
              v16[2](v16, v26, v24);
          }
          else if (v29)
          {
            v29[2](v29, v24);
          }
          objc_msgSend(v18, "removeObjectForKey:", v25);

        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v21);
  }

  if (v27 && objc_msgSend(v18, "count"))
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100107FBC;
    v30[3] = &unk_1004AB670;
    v31 = v27;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v30);

  }
}

- (OS_os_log)loggingCategory
{
  return self->_loggingCategory;
}

- (NSArray)dictionariesToMerge
{
  return self->_dictionariesToMerge;
}

- (id)canDeletePlaylistUUIDBlock
{
  return self->_canDeletePlaylistUUIDBlock;
}

- (void)setCanDeletePlaylistUUIDBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)refreshContentsOfUpdatedOrInsertedPlaylists
{
  return self->_refreshContentsOfUpdatedOrInsertedPlaylists;
}

- (void)setRefreshContentsOfUpdatedOrInsertedPlaylists:(BOOL)a3
{
  self->_refreshContentsOfUpdatedOrInsertedPlaylists = a3;
}

- (BOOL)syncMergeIsFromCloud
{
  return self->_syncMergeIsFromCloud;
}

- (void)setSyncMergeIsFromCloud:(BOOL)a3
{
  self->_syncMergeIsFromCloud = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canDeletePlaylistUUIDBlock, 0);
  objc_storeStrong((id *)&self->_dictionariesToMerge, 0);
  objc_storeStrong((id *)&self->_loggingCategory, 0);
}

@end
