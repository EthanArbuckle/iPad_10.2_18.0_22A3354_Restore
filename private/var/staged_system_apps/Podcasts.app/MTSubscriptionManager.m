@implementation MTSubscriptionManager

- (MTSubscriptionManager)init
{
  MTSubscriptionManager *v2;
  uint64_t v3;
  MTFeedManager *feedManager;
  _TtC18PodcastsFoundation15FeedURLComposer *v5;
  _TtC18PodcastsFoundation15FeedURLComposer *feedURLComposer;
  NSMutableDictionary *v7;
  NSMutableDictionary *feedUrlsToParams;
  NSMutableSet *v9;
  NSMutableSet *currentlySubscribingStoreCollectionIds;
  _TtC18PodcastsFoundation28AddingPodcastStateDataSource *v11;
  _TtC18PodcastsFoundation28AddingPodcastStateDataSource *podcastStateDataSource;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MTSubscriptionManager;
  v2 = -[MTSubscriptionManager init](&v14, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[MTFeedManager sharedInstance](MTFeedManager, "sharedInstance"));
    feedManager = v2->_feedManager;
    v2->_feedManager = (MTFeedManager *)v3;

    v5 = (_TtC18PodcastsFoundation15FeedURLComposer *)objc_alloc_init((Class)_TtC18PodcastsFoundation15FeedURLComposer);
    feedURLComposer = v2->_feedURLComposer;
    v2->_feedURLComposer = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    feedUrlsToParams = v2->_feedUrlsToParams;
    v2->_feedUrlsToParams = v7;

    v9 = objc_opt_new(NSMutableSet);
    currentlySubscribingStoreCollectionIds = v2->_currentlySubscribingStoreCollectionIds;
    v2->_currentlySubscribingStoreCollectionIds = v9;

    v11 = objc_opt_new(_TtC18PodcastsFoundation28AddingPodcastStateDataSource);
    podcastStateDataSource = v2->_podcastStateDataSource;
    v2->_podcastStateDataSource = v11;

  }
  return v2;
}

- (_TtC18PodcastsFoundation28AddingPodcastStateDataSource)podcastStateDataSource
{
  return self->_podcastStateDataSource;
}

- (id)preProcessFeedHookWithParams:(id)a3 feed:(id)a4 requestUrl:(id)a5 needsUpdate:(BOOL)a6 ctx:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void (**v21)(_QWORD, _QWORD);
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD);
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void (**v36)(_QWORD, _QWORD);
  void **v37;
  uint64_t v38;
  void (*v39)(uint64_t);
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  NSErrorUserInfoKey v52;
  const __CFString *v53;
  NSErrorUserInfoKey v54;
  const __CFString *v55;

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  if ((objc_msgSend(v13, "hasEpisodes") & 1) != 0)
    goto LABEL_5;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "title"));
  if (v16)
  {

    goto LABEL_5;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "author"));

  if (v17)
  {
LABEL_5:
    if (objc_msgSend(v13, "isNotSubscribable"))
    {
      v52 = NSLocalizedDescriptionKey;
      v53 = CFSTR("The feed is not subscribable.");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.podcasts.MTSubscriptionManager"), 103, v18));

      -[MTSubscriptionManager showSubscriptionFailureDialog:error:](self, "showSubscriptionFailureDialog:error:", v12, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completion"));

      if (v20)
      {
        v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completion"));
        v21[2](v21, 0);

      }
      v22 = (id)objc_claimAutoreleasedReturnValue(+[MTFeedUpdatePreProcessResult shouldNotContinueResult](MTFeedUpdatePreProcessResult, "shouldNotContinueResult"));

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "resolvedFeedURL"));
      v24 = v23;
      if (v23)
        v25 = v23;
      else
        v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "absoluteString"));
      v26 = v25;

      v46 = 0;
      v47 = &v46;
      v48 = 0x3032000000;
      v49 = sub_100046924;
      v50 = sub_100046AFC;
      v51 = 0;
      v37 = _NSConcreteStackBlock;
      v38 = 3221225472;
      v39 = sub_100133E18;
      v40 = &unk_1004AC210;
      v41 = v15;
      v27 = v26;
      v42 = v27;
      v43 = v13;
      v28 = v12;
      v44 = v28;
      v45 = &v46;
      objc_msgSend(v41, "performBlockAndWaitWithSave:", &v37);
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "completion", v37, v38, v39, v40));

      if (v29)
      {
        v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "completion"));
        v30[2](v30, 1);

      }
      v31 = objc_alloc((Class)MTFeedUpdatePreProcessResult);
      v22 = objc_msgSend(v31, "initWithShouldContinue:createdPodcastUUID:", 1, v47[5]);

      _Block_object_dispose(&v46, 8);
    }
    goto LABEL_15;
  }
  if (v8)
  {
    v54 = NSLocalizedDescriptionKey;
    v55 = CFSTR("The feed is empty. There are no items in the feed, and the feed has no title and no author.");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1));
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.podcasts.MTSubscriptionManager"), 102, v33));

    -[MTSubscriptionManager showSubscriptionFailureDialog:error:](self, "showSubscriptionFailureDialog:error:", v12, v34);
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completion"));

  if (v35)
  {
    v36 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "completion"));
    ((void (**)(_QWORD, BOOL))v36)[2](v36, !v8);

  }
  v22 = (id)objc_claimAutoreleasedReturnValue(+[MTFeedUpdatePreProcessResult shouldNotContinueResult](MTFeedUpdatePreProcessResult, "shouldNotContinueResult"));
LABEL_15:

  return v22;
}

- (void)postProcessFeedHookWithParams:(id)a3 podcastUuid:(id)a4 ctx:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  MTSubscriptionManager *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100134130;
  v15[3] = &unk_1004A6C78;
  v16 = a5;
  v10 = v9;
  v17 = v10;
  v18 = self;
  v14 = v8;
  v19 = v14;
  v11 = v16;
  objc_msgSend(v11, "performBlockAndWait:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "processingCompletion"));

  if (v12)
  {
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "processingCompletion"));
    ((void (**)(_QWORD, id))v13)[2](v13, v10);

  }
}

- (void)feedDownloadedWithParams:(id)a3 error:(id)a4 task:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8)
  {
    if (!v9 || (objc_msgSend(v9, "userCanceledAuth") & 1) == 0)
      -[MTSubscriptionManager showSubscriptionFailureDialog:error:](self, "showSubscriptionFailureDialog:error:", v13, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "completion"));

    if (v11)
    {
      v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "completion"));
      v12[2](v12, 0);

    }
  }

}

- (BOOL)_addLatestSeasonToPodcast:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100134424;
    v10[3] = &unk_1004A6CC0;
    v10[4] = self;
    v11 = v5;
    v13 = &v14;
    v7 = v6;
    v12 = v7;
    objc_msgSend(v7, "performBlockAndWait:", v10);
    v8 = *((_BYTE *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_addLatestSeasonForSerialPodcast:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *i;
  unint64_t j;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "episodesInLatestSeasonWithLimit:", 0));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v8 |= -[MTSubscriptionManager _addEpisode:toMyEpisodesInPodcast:persist:](self, "_addEpisode:toMyEpisodesInPodcast:persist:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), v4, 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  for (j = kMaxSubscribeDownloadForSerialWithSeasons; j < (unint64_t)objc_msgSend(v5, "count"); ++j)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", j));
    objc_msgSend(v12, "suppressAutomaticDownloadsIfNeeded");

  }
  return v8 & 1;
}

- (BOOL)_addNewestEpisodeToPodcast:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  MTSubscriptionManager *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "managedObjectContext"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001346BC;
    v9[3] = &unk_1004A7180;
    v11 = self;
    v12 = &v13;
    v10 = v5;
    objc_msgSend(v6, "performBlockAndWait:", v9);
    v7 = *((_BYTE *)v14 + 24) != 0;

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)_addEpisode:(id)a3 toMyEpisodesInPodcast:(id)a4 persist:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  v10 = 0;
  if (v7 && v8)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2020000000;
    v22 = 1;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "managedObjectContext"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100134854;
    v14[3] = &unk_1004AC238;
    v15 = v7;
    v17 = &v19;
    v18 = a5;
    v12 = v11;
    v16 = v12;
    objc_msgSend(v12, "performBlockAndWait:", v14);
    v10 = *((_BYTE *)v20 + 24) != 0;

    _Block_object_dispose(&v19, 8);
  }

  return v10;
}

- (void)subscribeToPodcastWithParams:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  MTSubscriptionManager *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  id v40;
  NSErrorUserInfoKey v41;
  void *v42;
  NSErrorUserInfoKey v43;
  const __CFString *v44;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedManager](self, "feedManager"));
  v6 = objc_msgSend(v5, "abortUpdatesIfNetworkUnreachable:", objc_msgSend(v4, "userInitiated"));

  if (!v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
    v9 = objc_msgSend(v8, "length");

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "url"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v10));

    }
    else
    {
      v11 = 0;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedURLComposer](self, "feedURLComposer"));
    v38 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "feedURLForOptionalURL:adamID:error:", v11, objc_msgSend(v4, "storeCollectionId"), &v38));
    v14 = v38;

    if (v14)
    {
      v15 = objc_msgSend(v14, "code");
      if (v15 == +[FeedURLComposer errorURLDoesNotExist](_TtC18PodcastsFoundation15FeedURLComposer, "errorURLDoesNotExist"))
      {
        v43 = NSLocalizedDescriptionKey;
        v44 = CFSTR("The feed url does not exist.");
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.podcasts.MTSubscriptionManager"), 101, v16));

        -[MTSubscriptionManager showSubscriptionFailureDialog:error:](self, "showSubscriptionFailureDialog:error:", v4, v17);
LABEL_11:

        goto LABEL_22;
      }
      v18 = objc_msgSend(v14, "code");
      if (v18 == +[FeedURLComposer errorURLInvalid](_TtC18PodcastsFoundation15FeedURLComposer, "errorURLInvalid"))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The feed url is invalid: %@"), v13));
        v41 = NSLocalizedDescriptionKey;
        v42 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.podcasts.MTSubscriptionManager"), 100, v19));

        -[MTSubscriptionManager showSubscriptionFailureDialog:error:](self, "showSubscriptionFailureDialog:error:", v4, v20);
        goto LABEL_11;
      }
      v21 = objc_msgSend(v14, "code");
      v22 = +[FeedURLComposer errorCannotGenerateInternalURL](_TtC18PodcastsFoundation15FeedURLComposer, "errorCannotGenerateInternalURL");
      if (v21 == v22)
      {
        v23 = _MTLogCategoryFeedUpdate(v22);
        v24 = objc_claimAutoreleasedReturnValue(v23);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          v25 = objc_msgSend(v4, "storeCollectionId");
          *(_DWORD *)buf = 134217984;
          v40 = v25;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "For some weird reason we cannot generate url of type internal://%lld", buf, 0xCu);
        }

      }
    }
    v26 = objc_msgSend(v4, "storeCollectionId");
    if (!v26)
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
      v28 = +[MTPodcast isRedirectURL:](MTPodcast, "isRedirectURL:", v27);

      if (!v28
        || (v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString")),
            v26 = +[MTPodcast storeCollectionIdForRedirectURL:](MTPodcast, "storeCollectionIdForRedirectURL:", v29), v29, !v26))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[MTSubscriptionController sharedInstance](MTSubscriptionController, "sharedInstance"));
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100134D74;
        v33[3] = &unk_1004AC260;
        v34 = v30;
        v35 = v4;
        v36 = self;
        v37 = v13;
        v32 = v30;
        objc_msgSend(v31, "podcastExistsInStoreWithFeedUrl:completion:", v32, v33);

        goto LABEL_22;
      }
      objc_msgSend(v4, "setStoreCollectionId:", v26);
    }
    -[MTSubscriptionManager _feedUpdateAndSubscribeToPodcast:feedUrl:adamId:](self, "_feedUpdateAndSubscribeToPodcast:feedUrl:adamId:", v4, v13, v26);
LABEL_22:

    goto LABEL_23;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
  objc_msgSend(v7, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Feed/MTSubscriptionManager.m", 281, CFSTR("Skipping subscibe to podcasts due to network not being reachable"));

LABEL_23:
}

- (void)_feedUpdateAndSubscribeToPodcast:(id)a3 feedUrl:(id)a4 adamId:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_id_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  os_signpost_id_t v44;
  void *v45;
  MTSubscriptionManager *v46;
  _QWORD v47[5];
  id v48;
  os_signpost_id_t v49;
  _QWORD v50[5];
  id v51;
  os_signpost_id_t v52;
  _QWORD v53[5];
  id v54;
  id v55;
  os_signpost_id_t v56;
  _QWORD v57[5];
  id v58;
  _QWORD v59[5];
  _QWORD v60[5];
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  int64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  id v68;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
  v46 = self;
  -[MTSubscriptionManager addSubscribeParams:forFeedUrl:](self, "addSubscribeParams:forFeedUrl:", v8, v10);

  v12 = _MTLogCategoryFeedUpdate(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = os_signpost_id_generate(v13);

  v16 = _MTLogCategoryFollowing(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  v18 = v17;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 141558786;
    v62 = 1752392040;
    v63 = 2048;
    v64 = a5;
    v65 = 2160;
    v66 = 1752392040;
    v67 = 2112;
    v68 = v9;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, v14, "MTSubscriptionManager subscribe", "adamID hash: %{mask.hash}lli, url hash: %{mask.hash}@", buf, 0x2Au);
  }
  v44 = v14;
  v45 = v9;

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PodcastsApplicationStateMonitor shared](PodcastsApplicationStateMonitor, "shared"));
  v20 = objc_msgSend(v19, "isActive");

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey userInitiated](MTFeedUpdateMetricsDataKey, "userInitiated"));
  v59[0] = v21;
  v22 = a5;
  v43 = v8;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "userInitiated")));
  v60[0] = v23;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey foreground](MTFeedUpdateMetricsDataKey, "foreground"));
  v59[1] = v24;
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v20));
  v60[1] = v25;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey backgroundFetch](MTFeedUpdateMetricsDataKey, "backgroundFetch"));
  v59[2] = v26;
  v60[2] = &__kCFBooleanFalse;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey podcastStoreId](MTFeedUpdateMetricsDataKey, "podcastStoreId"));
  v59[3] = v27;
  v28 = v22;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v22));
  v60[3] = v29;
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsDataKey source](MTFeedUpdateMetricsDataKey, "source"));
  v59[4] = v30;
  v60[4] = &off_1004D6748;
  v31 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v60, v59, 5));

  v33 = _MTLogCategoryFeedUpdate(v32);
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v62 = v31;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Updating podcast %@", buf, 0xCu);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(+[MTFeedUpdateMetricsAction podcastDataSource](MTFeedUpdateMetricsAction, "podcastDataSource"));
  +[IMMetrics recordEvent:dataSource:data:](IMMetrics, "recordEvent:dataSource:data:", v35, 0, v31);

  v36 = (void *)v31;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedManager](v46, "feedManager"));
  v38 = objc_msgSend(v43, "userInitiated");
  v57[0] = _NSConcreteStackBlock;
  v57[1] = 3221225472;
  v57[2] = sub_100135330;
  v57[3] = &unk_1004AC288;
  v57[4] = v46;
  v58 = v43;
  v53[0] = _NSConcreteStackBlock;
  v53[1] = 3221225472;
  v53[2] = sub_100135344;
  v53[3] = &unk_1004AC2B0;
  v53[4] = v46;
  v54 = v58;
  v55 = v45;
  v56 = v44;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1001353F4;
  v50[3] = &unk_1004AC2D8;
  v50[4] = v46;
  v51 = v54;
  v52 = v44;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10013548C;
  v47[3] = &unk_1004AC300;
  v47[4] = v46;
  v48 = v55;
  v49 = v44;
  v39 = v55;
  v40 = v54;
  LOBYTE(v42) = 1;
  LOBYTE(v41) = 0;
  objc_msgSend(v37, "updateFeedForFeedUrl:cloudSyncFeedUrl:podcastStoreId:triggerBy:userInitiated:forceBootstrap:useBackgroundFetch:source:isSubscribing:feedDownloadedHook:preProcessFeedHook:postProcessFeedHook:completion:", v39, v39, v28, 0, v38, 0, v41, 16, v42, v57, v53, v50, v47);

}

- (BOOL)isSubscribingToPodcastWithStoreCollectionID:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager currentlySubscribingStoreCollectionIds](self, "currentlySubscribingStoreCollectionIds"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
  LOBYTE(a3) = objc_msgSend(v6, "containsObject:", v7);

  objc_sync_exit(v5);
  return a3;
}

- (id)subscribeParamsForFeedUrl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

  objc_sync_exit(v5);
  return v7;
}

- (void)addSubscribeParams:(id)a3 forFeedUrl:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  objc_msgSend(v8, "setObject:forKey:", v13, v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager currentlySubscribingStoreCollectionIds](self, "currentlySubscribingStoreCollectionIds"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v13, "storeCollectionId")));
  objc_msgSend(v9, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager podcastStateDataSource](self, "podcastStateDataSource"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager currentlySubscribingStoreCollectionIds](self, "currentlySubscribingStoreCollectionIds"));
  objc_msgSend(v11, "updateAddingShowsWithStoreCollectionIds:", v12);

  objc_sync_exit(v7);
}

- (void)removeSubscribeParamsForFeedUrl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v4));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager feedUrlsToParams](self, "feedUrlsToParams"));
  objc_msgSend(v8, "removeObjectForKey:", v4);

  v9 = objc_msgSend(v7, "storeCollectionId");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager currentlySubscribingStoreCollectionIds](self, "currentlySubscribingStoreCollectionIds"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v9));
  objc_msgSend(v10, "removeObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager podcastStateDataSource](self, "podcastStateDataSource"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionManager currentlySubscribingStoreCollectionIds](self, "currentlySubscribingStoreCollectionIds"));
  objc_msgSend(v12, "updateAddingShowsWithStoreCollectionIds:", v13);

  objc_sync_exit(v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v17 = CFSTR("com.apple.podcasts.MTSubscriptionManager.StoreCollectionID");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v9));
  v18 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("com.apple.podcasts.MTSubscriptionManager.DidFinishSubscribingNotification"), self, v16);

}

- (void)showSubscriptionFailureDialog:(id)a3 error:(id)a4
{
  id v5;
  _QWORD block[4];
  id v7;

  v5 = a4;
  if (objc_msgSend(a3, "userInitiated"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100135A50;
    block[3] = &unk_1004A6200;
    v7 = v5;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

- (MTFeedManager)feedManager
{
  return self->_feedManager;
}

- (_TtC18PodcastsFoundation15FeedURLComposer)feedURLComposer
{
  return self->_feedURLComposer;
}

- (NSMutableDictionary)feedUrlsToParams
{
  return self->_feedUrlsToParams;
}

- (NSMutableSet)currentlySubscribingStoreCollectionIds
{
  return self->_currentlySubscribingStoreCollectionIds;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlySubscribingStoreCollectionIds, 0);
  objc_storeStrong((id *)&self->_feedUrlsToParams, 0);
  objc_storeStrong((id *)&self->_feedURLComposer, 0);
  objc_storeStrong((id *)&self->_feedManager, 0);
  objc_storeStrong((id *)&self->_podcastStateDataSource, 0);
}

@end
