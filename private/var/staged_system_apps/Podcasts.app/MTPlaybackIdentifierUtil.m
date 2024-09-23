@implementation MTPlaybackIdentifierUtil

- (void)fetchPlayerItemsForPlaybackQueueRequestIdentifiers:(id)a3 initiatedByAnotherUser:(BOOL)a4 completion:(id)a5
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  void *j;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  MTPlayerItem *v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id obj;
  uint64_t v52;
  _BOOL4 v53;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  MTPlayerItem *v59;
  id v60;
  uint64_t *v61;
  _QWORD v62[4];
  id v63;
  _BYTE *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char v76;
  uint8_t v77[4];
  id v78;
  __int16 v79;
  uint64_t v80;
  _BYTE buf[24];
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  _BYTE v85[128];
  _BYTE v86[128];

  v53 = a4;
  v6 = a3;
  v48 = a5;
  v73 = 0;
  v74 = &v73;
  v75 = 0x2020000000;
  v76 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v70 != v10)
          objc_enumerationMutation(v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i)));
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString UUID](NSString, "UUID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "pf_URLByAppendingQueryParameterKey:value:", CFSTR("deDupe"), v13));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absoluteString"));

        objc_msgSend(v7, "addObject:", v15);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v86, 16);
    }
    while (v9);
  }

  v16 = v7;
  v18 = _MTLogCategoryMediaRemote(v17);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v16;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Fetch player items for playback queue identifiers: %@", buf, 0xCu);
  }

  v49 = objc_alloc_init((Class)NSMutableDictionary);
  v50 = objc_alloc_init((Class)NSMutableDictionary);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v16;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
  if (v20)
  {
    v52 = *(_QWORD *)v66;
    do
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(_QWORD *)v66 != v52)
          objc_enumerationMutation(obj);
        v22 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)j);
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil episodeUuidForSetPlaybackQueueRequestIdentifier:](self, "episodeUuidForSetPlaybackQueueRequestIdentifier:", v22));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v22));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "pf_queryAsDictionary"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("storeTrackId")));
        v27 = objc_msgSend(v26, "longLongValue");

        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("contentItemId")));
        if (v53)
        {
          if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", v27))
          {
            v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), v27));
            objc_msgSend(v50, "setObject:forKey:", v22, v29);

          }
        }
        else
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v82 = sub_100046644;
          v83 = sub_1000469A4;
          v84 = 0;
          if (+[MTPlayerController hasDefaultInstance](MTPlayerController, "hasDefaultInstance")
            && objc_msgSend(v28, "length"))
          {
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlayerController defaultInstance](MTPlayerController, "defaultInstance"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "compositeManifest"));
            v62[0] = _NSConcreteStackBlock;
            v62[1] = 3221225472;
            v62[2] = sub_10007392C;
            v62[3] = &unk_1004A7A38;
            v63 = v28;
            v64 = buf;
            objc_msgSend(v31, "enumerateObjectsUsingBlock:", v62);

          }
          if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40)
            && (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod") & 1) == 0)
          {
            v32 = objc_claimAutoreleasedReturnValue(+[MTBaseEpisodeListManifest mediaItemForEpisodeWithUUID:](MTBaseEpisodeListManifest, "mediaItemForEpisodeWithUUID:", v23));
            v33 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v32;

          }
          if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            if (objc_msgSend(v28, "length"))
            {
              v34 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v28);
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setInstanceIdentifier:", v34);

            }
            objc_msgSend(v49, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v22);
          }
          else
          {
            if (+[MTStoreIdentifier isNotEmpty:](MTStoreIdentifier, "isNotEmpty:", v27))
            {
              v35 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), v27));
              objc_msgSend(v50, "setObject:forKey:", v22, v35);
            }
            else
            {
              v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "firstObject"));
              v37 = objc_msgSend(v36, "isEqualToString:", v22);

              if (v37)
                *((_BYTE *)v74 + 24) = 1;
              v39 = _MTLogCategoryMediaRemote(v38);
              v35 = objc_claimAutoreleasedReturnValue(v39);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v77 = 134218242;
                v78 = v27;
                v79 = 2112;
                v80 = v22;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Requested to play an item with no database match and no storeId: %lld with identifier: %@.", v77, 0x16u);
              }
            }

          }
          _Block_object_dispose(buf, 8);

        }
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v85, 16);
    }
    while (v20);
  }

  v40 = objc_alloc_init(MTPlayerItem);
  if (objc_msgSend(v50, "count"))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "allKeys"));
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000739C0;
    v55[3] = &unk_1004A7A60;
    v56 = v50;
    v57 = v49;
    v60 = v48;
    v58 = obj;
    v59 = v40;
    v61 = &v73;
    +[MTNetworkMediaManifest fetchPlayerItemsFor:completion:](MTNetworkMediaManifest, "fetchPlayerItemsFor:completion:", v41, v55);

    v42 = v56;
LABEL_44:

    goto LABEL_45;
  }
  if (v48)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectsForKeys:notFoundMarker:", obj, v40));
    v42 = objc_msgSend(v43, "mutableCopy");

    v44 = _MTLogCategoryMediaRemote(objc_msgSend(v42, "removeObject:", v40));
    v45 = objc_claimAutoreleasedReturnValue(v44);
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      v46 = objc_msgSend(v42, "count");
      v47 = objc_msgSend(obj, "count");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v46;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v47;
      _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Fetched %lu player items for %lu identifiers", buf, 0x16u);
    }

    (*((void (**)(id, id, _QWORD, _QWORD))v48 + 2))(v48, v42, *((unsigned __int8 *)v74 + 24), 0);
    goto LABEL_44;
  }
LABEL_45:

  _Block_object_dispose(&v73, 8);
}

- (void)fetchPlayerItemsForPlaybackQueueRequestIdentifiers:(id)a3 completion:(id)a4
{
  -[MTPlaybackIdentifierUtil fetchPlayerItemsForPlaybackQueueRequestIdentifiers:initiatedByAnotherUser:completion:](self, "fetchPlayerItemsForPlaybackQueueRequestIdentifiers:initiatedByAnotherUser:completion:", a3, 0, a4);
}

- (id)playbackRequestURLWithPlayReason:(unint64_t)a3 baseRequestURLString:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a4));
  v7 = (void *)objc_opt_class(self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "query"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "__queryStringToQueryDictionary:", v8));

  v10 = NSPersistentStringForMTPlayReason(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("playReason"));

  v12 = objc_alloc_init((Class)NSURLComponents);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "scheme"));
  objc_msgSend(v12, "setScheme:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "host"));
  objc_msgSend(v12, "setHost:", v14);

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100071E6C;
  v19[3] = &unk_1004A79F0;
  v20 = v9;
  v15 = v9;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "mt_compactMap:", v19));
  objc_msgSend(v12, "setQueryItems:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "string"));
  return v17;
}

- (id)playbackRequestURLWithDSID:(id)a3 baseRequestURLString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a4));
  v8 = (void *)objc_opt_class(self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "query"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "__queryStringToQueryDictionary:", v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
    objc_msgSend(v10, "setObject:forKey:", v12, CFSTR("enqueuerDSID"));

  }
  v13 = objc_alloc_init((Class)NSURLComponents);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "scheme"));
  objc_msgSend(v13, "setScheme:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "host"));
  objc_msgSend(v13, "setHost:", v15);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100072080;
  v20[3] = &unk_1004A79F0;
  v21 = v10;
  v16 = v10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mt_compactMap:", v20));
  objc_msgSend(v13, "setQueryItems:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "string"));
  return v18;
}

- (BOOL)isLocalSetPlaybackQueueURLString:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  if (objc_msgSend(v4, "length"))
  {
    if (qword_100567330 != -1)
      dispatch_once(&qword_100567330, &stru_1004A7A10);
    v5 = objc_msgSend((id)qword_100567328, "containsObject:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isSubscribeCommandURLString:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("subscribe"));

  return v5;
}

- (BOOL)isUniversalPlaybackIdentifierURLString:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "host"));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("playItem"));

  return v5;
}

- (id)playbackQueueIdentifierForPlayMyPodcastsWithPlaybackOrder:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (!v4)
    v4 = SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:](self, "_playbackRequestIdentifierWithHost:queryKey:value:", CFSTR("playPodcasts"), CFSTR("playbackOrder"), v4));

  return v5;
}

- (id)playbackQueueIdentifierForEpisodeAdamId:(id)a3
{
  return -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:](self, "_playbackRequestIdentifierWithHost:queryKey:value:", CFSTR("playPodcast"), CFSTR("storeTrackId"), a3);
}

- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 sampPlaybackOrder:(id)a4
{
  return -[MTPlaybackIdentifierUtil localPlaybackQueueIdentifierForPodcastUuid:episodeUuid:sampPlaybackOrder:](self, "localPlaybackQueueIdentifierForPodcastUuid:episodeUuid:sampPlaybackOrder:", a3, 0, a4);
}

- (id)localPlaybackQueueIdentifierForPodcastUuid:(id)a3 episodeUuid:(id)a4 sampPlaybackOrder:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "length") || objc_msgSend(v9, "length"))
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:](self, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:", v8, 0, 0, v9, 0, 0, v10));
  else
    v11 = 0;

  return v11;
}

- (id)universalPlaybackQueueIdentifierForPodcastFeedUrl:(id)a3 podcastStoreId:(int64_t)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 sampPlaybackOrder:(id)a7
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:](self, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:", 0, a3, a4, 0, a5, a6, a7);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:](self, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:", a3, a4, a5, 0, 0, 0, SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 sampPlaybackOrder:(id)a6
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:](self, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:", a3, a4, a5, 0, 0, 0, a6);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 sampPlaybackOrder:(id)a9
{
  return -[MTPlaybackIdentifierUtil _universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:](self, "_universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:", a3, a4, a5, a6, a7, a8, 0, 0, a9);
}

- (id)universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10
{
  return -[MTPlaybackIdentifierUtil _universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:](self, "_universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:", a3, a4, a5, a6, a7, a8, a9, a10, SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue);
}

- (id)_universalPlaybackQueueIdentifierForPodcastUuid:(id)a3 podcastFeedUrl:(id)a4 podcastStoreId:(int64_t)a5 episodeUuid:(id)a6 episodeGuid:(id)a7 episodeStoreId:(int64_t)a8 context:(int64_t)a9 contextSortType:(int64_t)a10 sampPlaybackOrder:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _QWORD v40[4];
  id v41;
  id v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v20 = a11;
  if (!objc_msgSend(v20, "length"))
  {
    v21 = SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;

    v20 = v21;
  }
  v22 = objc_msgSend(v18, "length");
  v23 = objc_msgSend(v16, "length");
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  objc_msgSend(v24, "setObject:forKey:", v20, CFSTR("playbackOrder"));
  if (!v23)
  {
    if (!v22)
      goto LABEL_11;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "mainOrPrivateContext"));

    v44 = 0;
    v45 = &v44;
    v46 = 0x3032000000;
    v47 = sub_100046644;
    v48 = sub_1000469A4;
    v49 = 0;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000728A8;
    v40[3] = &unk_1004A6690;
    v27 = v26;
    v41 = v27;
    v42 = v18;
    v43 = &v44;
    objc_msgSend(v27, "performBlockAndWait:", v40);
    if (objc_msgSend((id)v45[5], "length"))
      objc_msgSend(v24, "setObject:forKey:", v45[5], CFSTR("uuid"));

    _Block_object_dispose(&v44, 8);
    goto LABEL_10;
  }
  objc_msgSend(v24, "setObject:forKey:", v16, CFSTR("uuid"));
  if (v22)
LABEL_10:
    objc_msgSend(v24, "setObject:forKey:", v18, CFSTR("episodeUuid"));
LABEL_11:
  if (objc_msgSend(v17, "length"))
  {
    v28 = objc_msgSend((id)objc_opt_class(self), "__stringWithPercentEscape:", v17);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    objc_msgSend(v24, "setObject:forKey:", v29, CFSTR("podcastFeedUrl"));

  }
  if (objc_msgSend(v19, "length"))
    objc_msgSend(v24, "setObject:forKey:", v19, CFSTR("episodeGuid"));
  v30 = kMTSerpentAdamIdOffset;
  if (a5 && kMTSerpentAdamIdOffset != a5)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a5));
    objc_msgSend(v24, "setObject:forKey:", v31, CFSTR("storeCollectionId"));

  }
  if (a8 && v30 != a8)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a8));
    objc_msgSend(v24, "setObject:forKey:", v32, CFSTR("storeTrackId"));

  }
  v33 = NSPersistentStringForMTEpisodeContext(a9);
  v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
  objc_msgSend(v24, "setObject:forKey:", v34, CFSTR("context"));

  v35 = NSPersistentStringForMTEpisodeContextSortType(a10);
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  objc_msgSend(v24, "setObject:forKey:", v36, CFSTR("contextSortType"));

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:](self, "_playbackRequestIdentifierWithHost:queryComponents:", CFSTR("playPodcast"), v24));
  return v37;
}

- (id)playbackQueueIdentifierForPodcastAdamId:(id)a3 sampPlaybackOrder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[2];

  v6 = a4;
  if (!v6)
    v6 = SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;
  v11[0] = CFSTR("storeCollectionId");
  v11[1] = CFSTR("playbackOrder");
  v12[0] = a3;
  v12[1] = v6;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v12, v11, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:](self, "_playbackRequestIdentifierWithHost:queryComponents:", CFSTR("playPodcast"), v8));

  return v9;
}

- (id)playbackQueueIdentifierForSubscribeToPodcast:(id)a3
{
  return -[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:](self, "_playbackRequestIdentifierWithHost:queryKey:value:", CFSTR("subscribe"), CFSTR("storeCollectionId"), a3);
}

- (id)playbackQueueIdentifierForSubscribeToPodcastFeedUrl:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "__stringWithPercentEscape:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryKey:value:](self, "_playbackRequestIdentifierWithHost:queryKey:value:", CFSTR("subscribe"), CFSTR("podcastFeedUrl"), v6));
  return v7;
}

- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3
{
  return -[MTPlaybackIdentifierUtil localPlaybackQueueIdentifierForStationUuid:episodeUuid:](self, "localPlaybackQueueIdentifierForStationUuid:episodeUuid:", a3, 0);
}

- (id)localPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForStationUuid:episodeUuid:episodeGuid:episodeStoreId:podcastFeedUrl:](self, "universalPlaybackQueueIdentifierForStationUuid:episodeUuid:episodeGuid:episodeStoreId:podcastFeedUrl:", a3, a4, 0, 0, 0);
}

- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeGuid:(id)a4 episodeStoreId:(int64_t)a5 podcastFeedUrl:(id)a6
{
  return -[MTPlaybackIdentifierUtil universalPlaybackQueueIdentifierForStationUuid:episodeUuid:episodeGuid:episodeStoreId:podcastFeedUrl:](self, "universalPlaybackQueueIdentifierForStationUuid:episodeUuid:episodeGuid:episodeStoreId:podcastFeedUrl:", a3, 0, a4, a5, a6);
}

- (id)universalPlaybackQueueIdentifierForStationUuid:(id)a3 episodeUuid:(id)a4 episodeGuid:(id)a5 episodeStoreId:(int64_t)a6 podcastFeedUrl:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = a3;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 5));
  objc_msgSend(v16, "setObject:forKey:", v15, CFSTR("uuid"));

  if (objc_msgSend(v12, "length"))
    objc_msgSend(v16, "setObject:forKey:", v12, CFSTR("episodeUuid"));
  if (objc_msgSend(v13, "length"))
    objc_msgSend(v16, "setObject:forKey:", v13, CFSTR("episodeGuid"));
  if (objc_msgSend(v14, "length"))
  {
    v17 = objc_msgSend((id)objc_opt_class(self), "__stringWithPercentEscape:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("podcastFeedUrl"));

  }
  if ((+[MTStoreIdentifier isEmpty:](MTStoreIdentifier, "isEmpty:", a6) & 1) == 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a6));
    objc_msgSend(v16, "setObject:forKey:", v19, CFSTR("storeTrackId"));

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:](self, "_playbackRequestIdentifierWithHost:queryComponents:", CFSTR("playStation"), v16));

  return v20;
}

- (id)episodeUuidForSetPlaybackQueueRequestIdentifier:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pf_queryAsDictionary"));
  v5 = objc_alloc((Class)MTEpisodeLookupRequest);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("storeTrackId")));
  objc_msgSend(v5, "setStoreTrackId:", objc_msgSend(v6, "longLongValue"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("episodeUuid")));
  objc_msgSend(v5, "setUuid:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("episodeGuid")));
  objc_msgSend(v5, "setEpisodeGuid:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("episodeTitle")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByRemovingPercentEscapes"));
  objc_msgSend(v5, "setEpisodeTitle:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("podcastTitle")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByRemovingPercentEscapes"));
  objc_msgSend(v5, "setPodcastTitle:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("podcastFeedUrl")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByRemovingPercentEscapes"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByRemovingPercentEscapes"));
  objc_msgSend(v5, "setPodcastFeedUrl:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("streamUrl")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringByRemovingPercentEscapes"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringByRemovingPercentEscapes"));
  objc_msgSend(v5, "setStreamUrl:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisodeLookupUtil sharedInstance](MTEpisodeLookupUtil, "sharedInstance"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "findEpisodeWithRequest:", v5));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "uuid"));
  return v21;
}

- (id)podcastUuidForSetPlaybackQueueRequestIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint8_t buf[4];
  uint64_t v44;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pf_queryAsDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("podcastFeedUrl")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByRemovingPercentEscapes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByRemovingPercentEscapes"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("storeCollectionId")));
  v10 = objc_msgSend(v9, "longLongValue");

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "mainOrPrivateContext"));

  v14 = objc_msgSend(objc_alloc((Class)MTStoreIdentifier), "initWithFeedUrl:storeIdentifier:", v8, v11);
  v15 = objc_alloc((Class)NSFetchRequest);
  v16 = objc_msgSend(v15, "initWithEntityName:", kMTPodcastEntityName);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForIdentifer:](MTPodcast, "predicateForIdentifer:", v14));
  objc_msgSend(v16, "setPredicate:", v17);

  objc_msgSend(v16, "setFetchLimit:", 1);
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = sub_100046644;
  v41 = sub_1000469A4;
  v42 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = sub_100046644;
  v35 = sub_1000469A4;
  v36 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000731A0;
  v26[3] = &unk_1004A66B8;
  v18 = v13;
  v27 = v18;
  v19 = v16;
  v28 = v19;
  v29 = &v37;
  v30 = &v31;
  v20 = objc_msgSend(v18, "performBlockAndWait:", v26);
  if (v38[5])
  {
    v21 = _MTLogCategoryDatabase(v20);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = v38[5];
      *(_DWORD *)buf = 138412290;
      v44 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Error fetching podcast for playback identifier: %@", buf, 0xCu);
    }

    v24 = 0;
  }
  else
  {
    v24 = (id)v32[5];
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);

  return v24;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _MRSystemAppPlaybackQueue *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeDsid"));
  v7 = -[MTPlaybackIdentifierUtil playbackQueueWithDsid:forIdentifiers:](self, "playbackQueueWithDsid:forIdentifiers:", v6, v4);

  return v7;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithDsid:(id)a3 forIdentifiers:(id)a4
{
  id v5;
  _MRSystemAppPlaybackQueue *v6;
  CFDictionaryRef v7;
  id v9;
  void *keys;

  v5 = a4;
  v6 = (_MRSystemAppPlaybackQueue *)MRSystemAppPlaybackQueueCreate(kCFAllocatorDefault, 5);
  MRSystemAppPlaybackQueueSetGenericTrackIdentifiers(v6, v5);

  if (a3)
  {
    v9 = a3;
    keys = CFSTR("enqueuerDSID");
    v7 = CFDictionaryCreate(0, (const void **)&keys, (const void **)&v9, 1, 0, &kCFTypeDictionaryValueCallBacks);
    MRSystemAppPlaybackQueueSetUserInfo(v6, v7);
    CFRelease(v7);
  }
  return v6;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForManifest:(id)a3 queueStatus:(unint64_t *)a4
{
  void *v5;
  _MRSystemAppPlaybackQueue *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil requestIdentifiersForManifest:queueStatus:](self, "requestIdentifiersForManifest:queueStatus:", a3, a4));
  v6 = -[MTPlaybackIdentifierUtil playbackQueueWithAccountInfoForIdentifiers:](self, "playbackQueueWithAccountInfoForIdentifiers:", v5);

  return v6;
}

- (id)requestIdentifiersForManifest:(id)a3 queueStatus:(unint64_t *)a4
{
  id v6;
  uint64_t v7;
  id v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  _UNKNOWN **v16;
  void *v17;
  unsigned int v18;
  id *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  uint64_t v26;
  void *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  void *v31;
  _UNKNOWN **v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  id obj;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  void *v48;

  v6 = a3;
  v7 = objc_opt_class(MTStoreManifest);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = v6;
    if (!objc_msgSend(v8, "loadStatus"))
    {
      v16 = CPInterfaceController_ptr;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "podcastAdamId"));
      v18 = +[MTStoreIdentifier isNotEmptyNumber:](MTStoreIdentifier, "isNotEmptyNumber:", v17);

      if (v18)
      {
        if (objc_msgSend(v8, "playbackOrder") == (id)1)
        {
          v19 = (id *)&SAMPEpisodePlaybackOrderNEWEST_FIRSTValue;
        }
        else
        {
          v34 = objc_msgSend(v8, "playbackOrder");
          v19 = (id *)&SAMPEpisodePlaybackOrderAPPLICATION_DEFAULTValue;
          if (v34 == (id)2)
            v19 = (id *)&SAMPEpisodePlaybackOrderOLDEST_FIRSTValue;
        }
        v35 = *v19;
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "podcastAdamId"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "stringValue"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil playbackQueueIdentifierForPodcastAdamId:sampPlaybackOrder:](self, "playbackQueueIdentifierForPodcastAdamId:sampPlaybackOrder:", v37, v35));
        v48 = v38;
        v42 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));

      }
      else
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "episodeAdamIds"));
        v21 = objc_msgSend(v20, "count");

        if (v21)
        {
          v42 = objc_alloc_init((Class)NSMutableArray);
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          v40 = v8;
          obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "episodeAdamIds"));
          v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
          if (v22)
          {
            v23 = v22;
            v24 = *(_QWORD *)v44;
            do
            {
              for (i = 0; i != v23; i = (char *)i + 1)
              {
                if (*(_QWORD *)v44 != v24)
                  objc_enumerationMutation(obj);
                v26 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)i);
                if (objc_msgSend(v16[171], "isNotEmptyNumber:", v26))
                {
                  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("podcasts://%@"), CFSTR("playItem")));
                  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v27));
                  v29 = objc_opt_new(NSMutableDictionary);
                  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), v26));
                  -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v30, CFSTR("storeTrackId"));

                  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "pf_URLByAppendingQueryParameters:", v29));
                  v32 = v16;
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "absoluteString"));

                  objc_msgSend(v42, "addObject:", v33);
                  v16 = v32;

                }
              }
              v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
            }
            while (v23);
          }

          goto LABEL_40;
        }
        v42 = &__NSArray0__struct;
      }

      goto LABEL_40;
    }

  }
  v42 = objc_alloc_init((Class)NSMutableArray);
  v9 = (char *)objc_msgSend(v6, "currentIndex");
  if (v9 >= objc_msgSend(v6, "count"))
  {
    v11 = 0;
LABEL_15:
    if (a4)
      goto LABEL_23;
    goto LABEL_40;
  }
  v10 = 0;
  v11 = 0;
  while (1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v9));
    if ((objc_msgSend(v12, "isStreamable") & 1) == 0)
      break;
LABEL_10:
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil requestIdentifierForPlayerItem:](self, "requestIdentifierForPlayerItem:", v12));
    if (objc_msgSend(v15, "length"))
      objc_msgSend(v42, "addObject:", v15);

    if (++v9 >= objc_msgSend(v6, "count"))
      goto LABEL_15;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentItem"));
  v14 = objc_msgSend(v13, "isEqual:", v12);

  if ((v14 & 1) != 0)
  {
    v11 = 1;
    goto LABEL_22;
  }
  if ((unint64_t)++v10 <= 1)
  {
    v11 = 2;
    goto LABEL_10;
  }
  v11 = 3;
LABEL_22:

  if (a4)
LABEL_23:
    *a4 = v11;
LABEL_40:

  return v42;
}

- (_MRSystemAppPlaybackQueue)playbackQueueWithAccountInfoForPlayerItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _MRSystemAppPlaybackQueue *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v4, "count")));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil requestIdentifierForPlayerItem:](self, "requestIdentifierForPlayerItem:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v10), (_QWORD)v14));
        if (objc_msgSend(v11, "length"))
          objc_msgSend(v5, "addObject:", v11);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = -[MTPlaybackIdentifierUtil playbackQueueWithAccountInfoForIdentifiers:](self, "playbackQueueWithAccountInfoForIdentifiers:", v5);
  return v12;
}

- (id)requestIdentifierForPlayerItem:(id)a3
{
  id v3;
  NSMutableDictionary *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  if (a3)
  {
    v3 = a3;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("podcasts://%@"), CFSTR("playItem")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:"));
    v4 = objc_opt_new(NSMutableDictionary);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));

    v7 = (uint64_t)objc_msgSend(v3, "episodeStoreId");
    v8 = (uint64_t)objc_msgSend(v3, "podcastStoreId");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeUuid"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeGuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "podcastFeedUrl"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "pf_stringWithPercentEscape"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "author"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "streamUrl"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "pf_stringWithPercentEscape"));

    objc_msgSend(v3, "playhead");
    v16 = v15;

    if (objc_msgSend(v6, "length"))
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v6, CFSTR("contentItemId"));
    if (v7 >= 1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), v7));
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v17, CFSTR("storeTrackId"));

    }
    if (v8 >= 1)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), v8));
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v18, CFSTR("storeCollectionId"));

    }
    if (objc_msgSend(v9, "length"))
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v9, CFSTR("episodeUuid"));
    if (objc_msgSend(v10, "length"))
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, CFSTR("episodeGuid"));
    if (objc_msgSend(v24, "length"))
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v24, CFSTR("podcastFeedUrl"));
    if (objc_msgSend(v12, "length"))
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v12, CFSTR("episodeTitle"));
    if (objc_msgSend(v23, "length"))
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v23, CFSTR("podcastTitle"));
    if (objc_msgSend(v27, "length"))
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v27, CFSTR("streamUrl"));
    if (v16 > 0.0)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&v16));
      -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v19, CFSTR("playhead"));

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "pf_URLByAppendingQueryParameters:", v4));

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "absoluteString"));
  }
  else
  {
    v21 = 0;
  }
  return v21;
}

- (unint64_t)_playQueueTypeForRequestURL:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _UNKNOWN **v9;
  _UNKNOWN **v10;
  id v11;

  v3 = qword_100567338;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_100567338, &stru_1004A7A80);
  v5 = (void *)qword_100567340;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "host"));

  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  v8 = (void *)v7;
  v9 = &off_1004D5C08;
  if (v7)
    v9 = (_UNKNOWN **)v7;
  v10 = v9;

  v11 = objc_msgSend(v10, "unsignedIntegerValue");
  return (unint64_t)v11;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryKey:(id)a4 value:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v14;
  id v15;

  v14 = a4;
  v15 = a5;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaybackIdentifierUtil _playbackRequestIdentifierWithHost:queryComponents:](self, "_playbackRequestIdentifierWithHost:queryComponents:", v10, v11));
  return v12;
}

- (id)_playbackRequestIdentifierWithHost:(id)a3 queryComponents:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init((Class)NSURLComponents);
  objc_msgSend(v7, "setScheme:", CFSTR("podcasts"));
  v20 = v5;
  objc_msgSend(v7, "setHost:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v13);
        v15 = objc_alloc((Class)NSURLQueryItem);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v14));
        v17 = objc_msgSend(v15, "initWithName:value:", v14, v16);

        objc_msgSend(v8, "addObject:", v17);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  objc_msgSend(v7, "setQueryItems:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "string"));

  return v18;
}

- (int64_t)_episodeOrderFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", SAMPEpisodePlaybackOrderNEWEST_FIRSTValue) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", SAMPEpisodePlaybackOrderOLDEST_FIRSTValue))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (unint64_t)_playReasonFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = MTPlayReasonFromPersistentString(v3);
  else
    v4 = 0;

  return v4;
}

- (int64_t)_episodeContextFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = MTEpisodeContextFromPersistentString(v3);
  else
    v4 = 0;

  return v4;
}

- (int64_t)_episodeContextSortFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
    v4 = MTEpisodeContextSortTypeFromPersistentString(v3);
  else
    v4 = 0;

  return v4;
}

+ (id)__stringWithPercentEscape:(id)a3
{
  return (id)objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes(0, (CFStringRef)a3, 0, CFSTR("\uFFFC!$&'()+,/:;=?@"),
                                               0x8000100u));
}

+ (id)__stringByRemovingPercentEscapes:(id)a3
{
  return (id)(id)CFURLCreateStringByReplacingPercentEscapes(kCFAllocatorDefault, (CFStringRef)a3, &stru_1004C6D40);
}

+ (id)__queryStringToQueryDictionary:(id)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("&")));
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v8), "componentsSeparatedByString:", CFSTR("=")));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 0));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        if ((unint64_t)objc_msgSend(v9, "count") >= 2)
        {
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", 1));

          v11 = (void *)v12;
        }
        objc_msgSend(v4, "setObject:forKey:", v11, v10);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v4;
}

@end
