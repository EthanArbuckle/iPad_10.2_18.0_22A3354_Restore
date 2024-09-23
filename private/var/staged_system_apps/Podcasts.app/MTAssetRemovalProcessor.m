@implementation MTAssetRemovalProcessor

- (id)podcastPredicate
{
  return +[MTPodcast predicateForPodcastToAutoRemove](MTPodcast, "predicateForPodcastToAutoRemove");
}

- (id)episodePredicateForPodcast:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001262DC;
  v10[3] = &unk_1004A70A0;
  v6 = v5;
  v11 = v6;
  v7 = v3;
  v12 = v7;
  v13 = &v20;
  v14 = &v24;
  v15 = &v16;
  objc_msgSend(v6, "performBlockAndWait:", v10);
  if (*((_BYTE *)v17 + 24))
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAutomaticDeletionOnShow:deletePlayedEpisodes:episodeLimit:](MTEpisode, "predicateForAutomaticDeletionOnShow:deletePlayedEpisodes:episodeLimit:", v7, *((unsigned __int8 *)v21 + 24), v25[3]));
  else
    v8 = 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v8;
}

- (void)episodeUuidObserver:(id)a3 resultsChangedForPodcast:(id)a4 withDeletedIds:(id)a5 andInsertIds:(id)a6
{
  id v9;
  id v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = -[MTAssetRemovalProcessor isDisabled](self, "isDisabled");
  if (v12)
  {
    v14 = _MTLogCategoryDownload(v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v19 = v10;
      v20 = 2048;
      v21 = objc_msgSend(v11, "count");
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Asset Removal is temporary disabled skipping removal for: %{public}@, episode uuids: %lu", buf, 0x16u);
    }

  }
  else if (objc_msgSend(v11, "count"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "predicate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("they matched podcast %@'s predicate: %@"), v10, v16));

    -[MTAssetRemovalProcessor _removeDownloadAssetsForEpisodeUuids:reason:](self, "_removeDownloadAssetsForEpisodeUuids:reason:", v11, v17);
  }

}

- (void)enable
{
  uint64_t v3;
  NSObject *v4;
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  _QWORD v13[5];
  uint8_t buf[16];

  v3 = _MTLogCategoryDownload(self, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Re-Enabling Asset Removal...", buf, 2u);
  }

  -[MTAssetRemovalProcessor setDisabled:](self, "setDisabled:", 0);
  v5 = -[MTBaseProcessor isRunning](self, "isRunning");
  if (v5)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001265D8;
    v13[3] = &unk_1004A6200;
    v13[4] = self;
    v7 = -[MTBaseProcessor enqueueWorkBlock:](self, "enqueueWorkBlock:", v13);
    v9 = _MTLogCategoryDownload(v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v11 = "Asset Removal has been re-enabled";
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v11, buf, 2u);
    }
  }
  else
  {
    v12 = _MTLogCategoryDownload(v5, v6);
    v10 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v11 = "Asset Removal has not yet been started.";
      goto LABEL_8;
    }
  }

}

- (void)disable
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = -[MTAssetRemovalProcessor setDisabled:](self, "setDisabled:", 1);
  v4 = _MTLogCategoryDownload(v2, v3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Asset Removal Disabled", v6, 2u);
  }

}

- (void)_removeDownloadAssetsForEpisodeUuids:(id)a3 reason:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;

  v5 = a3;
  v6 = a4;
  v8 = _MTLogCategoryDownload(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138543618;
    v12 = v5;
    v13 = 2114;
    v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting removal of assets for episode uuids: %{public}@, because %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTLibrary sharedInstance](MTLibrary, "sharedInstance"));
  objc_msgSend(v10, "removeDownloadAssetsForEpisodeUuids:shouldKeep:", v5, &stru_1004ABF28);

}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

@end
