@implementation BaseEpisodePropertySource

+ (id)defaultSortOrderSortDescriptorsForPodcastUuid:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_10000ADD4;
  v20 = sub_10000ADE4;
  v21 = 0;
  if (+[MTDB canExtensionOpenDatabase](MTDB, "canExtensionOpenDatabase"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10000ADEC;
    v12[3] = &unk_100028C88;
    v6 = v5;
    v13 = v6;
    v14 = v3;
    v15 = &v16;
    objc_msgSend(v6, "performBlockAndWait:", v12);

  }
  v7 = (void *)v17[5];
  if (!v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MTPodcast sortDescriptorsForNewestOnTop](MTPodcast, "sortDescriptorsForNewestOnTop"));
    v9 = (void *)v17[5];
    v17[5] = v8;

    v7 = (void *)v17[5];
  }
  v10 = v7;
  _Block_object_dispose(&v16, 8);

  return v10;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[BaseEpisodePropertySource sortPropertyValues](self, "sortPropertyValues"));
  if (v5
    && (v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast allPossibleEpisodeListSortOrderProperties](MTPodcast, "allPossibleEpisodeListSortOrderProperties")), v8 = objc_msgSend(v7, "containsObject:", v4), v7, v6, v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BaseEpisodePropertySource sortPropertyValues](self, "sortPropertyValues"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v4));

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)BaseEpisodePropertySource;
    v11 = -[BaseEpisodePropertySource valueForUndefinedKey:](&v13, "valueForUndefinedKey:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  return v10;
}

+ (id)defaultCombiningString
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), CFSTR(" "), CFSTR("·"), CFSTR(" "));
}

- (id)_localizedDateStringForDate:(id)a3
{
  if (a3)
    return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "friendlyDisplayString"));
  else
    return &stru_1000292B8;
}

- (id)_localizedStringByCombiningWithString:(id)a3 firstComponent:(id)a4 secondComponent:(id)a5
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "length") && objc_msgSend(v9, "length"))
  {
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@%@"), v8, v7, v9));
  }
  else if (objc_msgSend(v8, "length"))
  {
    v10 = (__CFString *)v8;
  }
  else
  {
    if (!objc_msgSend(v9, "length"))
    {
      v11 = &stru_1000292B8;
      goto LABEL_9;
    }
    v10 = (__CFString *)v9;
  }
  v11 = v10;
LABEL_9:

  return v11;
}

- (id)_localizedStringForDuration:(double)a3
{
  return -[BaseEpisodePropertySource _localizedStringForDuration:podcastTitle:](self, "_localizedStringForDuration:podcastTitle:", 0, a3);
}

- (id)_localizedStringForDuration:(double)a3 podcastTitle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  if (a3 <= 1.0)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString prettyShortStringWithDuration:](NSString, "prettyShortStringWithDuration:", a3));
  v8 = objc_msgSend((id)objc_opt_class(self), "defaultCombiningString");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BaseEpisodePropertySource _localizedStringByCombiningWithString:firstComponent:secondComponent:](self, "_localizedStringByCombiningWithString:firstComponent:secondComponent:", v9, v7, v6));

  return v10;
}

- (id)_openPodcastDetailInAppURLForPodcastUuid:(id)a3 podcastStoreCollectionId:(int64_t)a4
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;

  v7 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v8 = _MTLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class(self);
      v11 = NSStringFromClass(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v20 = 138412546;
      v21 = v12;
      v22 = 2112;
      v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "-[%@ %@] must be used from main thread only", (uint8_t *)&v20, 0x16u);

    }
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BaseEpisodePropertySource __urlIfCanFindDatabasePodcastForUuid:urlBlock:](self, "__urlIfCanFindDatabasePodcastForUuid:urlBlock:", v7, &stru_100028D78));
  v16 = v15;
  if (v15)
    v17 = v15;
  else
    v17 = (id)objc_claimAutoreleasedReturnValue(+[NSURL mt_displayURLForPodcastStoreCollectionId:](NSURL, "mt_displayURLForPodcastStoreCollectionId:", a4));
  v18 = v17;

  return v18;
}

- (id)_openEpisodeDetailInAppURLForEpisodeUuid:(id)a3 episodeStoreTrackId:(int64_t)a4 podcastStoreCollectionId:(int64_t)a5
{
  id v9;
  uint64_t v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  int v22;
  void *v23;
  __int16 v24;
  void *v25;

  v9 = a3;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v10 = _MTLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class(self);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = NSStringFromSelector(a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v22 = 138412546;
      v23 = v14;
      v24 = 2112;
      v25 = v16;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "-[%@ %@] must be used from main thread only", (uint8_t *)&v22, 0x16u);

    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BaseEpisodePropertySource __urlIfCanFindDatabaseEpisodeForUuid:urlBlock:](self, "__urlIfCanFindDatabaseEpisodeForUuid:urlBlock:", v9, &stru_100028DB8));
  v18 = v17;
  if (v17)
    v19 = v17;
  else
    v19 = (id)objc_claimAutoreleasedReturnValue(+[NSURL mt_displayURLForEpisodeStoreTrackId:inPodcastWithStoreCollectionId:](NSURL, "mt_displayURLForEpisodeStoreTrackId:inPodcastWithStoreCollectionId:", a4, a5));
  v20 = v19;

  return v20;
}

- (void)_initiatePlaybackWithDefaultBehaviorForEpisodeUUid:(id)a3 episodeStoreTrackId:(int64_t)a4 podcastUuid:(id)a5 podcastStoreCollectionId:(int64_t)a6 completion:(id)a7
{
  id v11;
  uint64_t v12;
  NSObject *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  NSString *v17;
  void *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;

  v11 = a7;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v12 = _MTLogCategoryDefault();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = (objc_class *)objc_opt_class(self);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 138412546;
      v31 = v16;
      v32 = 2112;
      v33 = v18;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "-[%@ %@] must be used from main thread only", buf, 0x16u);

    }
  }
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10000B5E0;
  v28[3] = &unk_100028DE0;
  v29 = v11;
  v19 = v11;
  v20 = objc_retainBlock(v28);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "universalPlaybackQueueIdentifierForPodcastFeedUrl:podcastStoreId:episodeGuid:episodeStoreId:sampPlaybackOrder:", 0, a6, 0, a4, 0));

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "playbackRequestURLWithPlayReason:baseRequestURLString:", 13, v22));

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000B5F4;
  v26[3] = &unk_100028DE0;
  v27 = v20;
  v25 = v20;
  +[MTExtensionPlaybackController setQueueWithPlaybackRequestIdentifier:completion:](MTExtensionPlaybackController, "setQueueWithPlaybackRequestIdentifier:completion:", v24, v26);

}

- (id)__urlIfCanFindDatabaseEpisodeForUuid:(id)a3 urlBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = sub_10000ADD4;
    v21 = sub_10000ADE4;
    v22 = 0;
    if (objc_msgSend(v5, "length")
      && +[MTDB canExtensionOpenDatabase](MTDB, "canExtensionOpenDatabase"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainOrPrivateContext"));

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000B774;
      v12[3] = &unk_100028E08;
      v9 = v8;
      v13 = v9;
      v14 = v5;
      v16 = &v17;
      v15 = v6;
      objc_msgSend(v9, "performBlockAndWait:", v12);

    }
    v10 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)__urlIfCanFindDatabasePodcastForUuid:(id)a3 urlBlock:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = sub_10000ADD4;
    v21 = sub_10000ADE4;
    v22 = 0;
    if (objc_msgSend(v5, "length")
      && +[MTDB canExtensionOpenDatabase](MTDB, "canExtensionOpenDatabase"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "mainOrPrivateContext"));

      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_10000B978;
      v12[3] = &unk_100028E08;
      v9 = v8;
      v13 = v9;
      v14 = v5;
      v16 = &v17;
      v15 = v6;
      objc_msgSend(v9, "performBlockAndWait:", v12);

    }
    v10 = (id)v18[5];
    _Block_object_dispose(&v17, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSDictionary)sortPropertyValues
{
  return self->_sortPropertyValues;
}

- (void)setSortPropertyValues:(id)a3
{
  objc_storeStrong((id *)&self->_sortPropertyValues, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortPropertyValues, 0);
}

@end
