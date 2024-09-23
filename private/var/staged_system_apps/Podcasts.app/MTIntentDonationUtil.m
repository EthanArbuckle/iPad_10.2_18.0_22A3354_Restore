@implementation MTIntentDonationUtil

- (BOOL)canContinueIntentWithUserActivityType:(id)a3
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  unsigned __int8 v7;

  v3 = a3;
  v4 = (objc_class *)objc_opt_class(INPlayMediaIntent);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "isEqualToString:", v6);

  return v7;
}

- (MTIntentDonationUtil)init
{
  MTIntentDonationUtil *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *donationQueue;
  uint64_t v9;
  MTImageStore *imageStore;
  uint64_t v11;
  uint64_t v12;
  Class interactionClass;
  uint64_t v14;
  MTPlaybackIdentifierComposing *identifierComposer;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  MTDefaultsChangeNotifier *v20;
  MTDefaultsChangeNotifier *defaultsObserver;
  int v22;
  objc_super v24;
  uint64_t v25;

  v24.receiver = self;
  v24.super_class = (Class)MTIntentDonationUtil;
  v2 = -[MTIntentDonationUtil init](&v24, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, -15);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create("MTIntentDonationUtil.donation_queue", v6);
    donationQueue = v2->_donationQueue;
    v2->_donationQueue = (OS_dispatch_queue *)v7;

    v9 = objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](MTImageStore, "defaultStore"));
    imageStore = v2->_imageStore;
    v2->_imageStore = (MTImageStore *)v9;

    v11 = objc_opt_class(INInteraction);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    interactionClass = v2->_interactionClass;
    v2->_interactionClass = (Class)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[MTPlaybackIdentifierUtil sharedInstance](MTPlaybackIdentifierUtil, "sharedInstance"));
    identifierComposer = v2->_identifierComposer;
    v2->_identifierComposer = (MTPlaybackIdentifierComposing *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults _applePodcastsFoundationSettingsUserDefaults](NSUserDefaults, "_applePodcastsFoundationSettingsUserDefaults"));
    v17 = kMTShowSiriSuggestionsKey;
    v25 = kMTShowSiriSuggestionsKey;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v18));

    v20 = -[MTDefaultsChangeNotifier initWithProperties:defaults:]([MTDefaultsChangeNotifier alloc], "initWithProperties:defaults:", v19, v16);
    defaultsObserver = v2->_defaultsObserver;
    v2->_defaultsObserver = v20;

    -[MTDictionaryDiff addCallback:](v2->_defaultsObserver, "addCallback:", &stru_1004A9040);
    -[MTDefaultsChangeNotifier start](v2->_defaultsObserver, "start");
    v22 = objc_msgSend(v16, "BOOLForKey:", v17);
    sub_10001B7EC(kMTApplicationBundleIdentifier, v22);

  }
  return v2;
}

- (void)donateManifestCurrentItem:(id)a3
{
  -[MTIntentDonationUtil donateManifestCurrentItem:playReason:](self, "donateManifestCurrentItem:playReason:", a3, 0);
}

- (void)donateManifestCurrentItem:(id)a3 playReason:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "episode"));
  v8 = objc_opt_class(MTPlaylistManifest);
  if ((objc_opt_isKindOfClass(v11, v8) & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "playlistUuid"));
    if (!v7)
      goto LABEL_6;
    goto LABEL_5;
  }
  v9 = 0;
  if (v7)
  {
LABEL_5:
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
    -[MTIntentDonationUtil donateEpisodeUuid:stationUuid:isPlaybackFromSiri:completion:](self, "donateEpisodeUuid:stationUuid:isPlaybackFromSiri:completion:", v10, v9, a4 == 9, 0);

  }
LABEL_6:

}

- (void)donateEpisodeUuid:(id)a3
{
  -[MTIntentDonationUtil donateEpisodeUuid:completion:](self, "donateEpisodeUuid:completion:", a3, 0);
}

- (void)donateEpisodeUuid:(id)a3 completion:(id)a4
{
  -[MTIntentDonationUtil donateEpisodeUuid:stationUuid:isPlaybackFromSiri:completion:](self, "donateEpisodeUuid:stationUuid:isPlaybackFromSiri:completion:", a3, 0, 0, a4);
}

- (void)donateEpisodeUuid:(id)a3 stationUuid:(id)a4 isPlaybackFromSiri:(BOOL)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  BOOL v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(v10, "length"))
  {
    v13 = objc_claimAutoreleasedReturnValue(-[MTIntentDonationUtil donationQueue](self, "donationQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009FD0C;
    block[3] = &unk_1004A90B8;
    block[4] = self;
    v15 = v10;
    v16 = v11;
    v17 = v12;
    v18 = a5;
    dispatch_async(v13, block);

  }
  else if (v12)
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
  }

}

- (void)removeDonationForPodcastUuid:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    -[objc_class deleteInteractionsWithGroupIdentifier:completion:](-[MTIntentDonationUtil interactionClass](self, "interactionClass"), "deleteInteractionsWithGroupIdentifier:completion:", v4, 0);

}

- (void)removeDonationsForPodcastUuids:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[MTIntentDonationUtil removeDonationForPodcastUuid:](self, "removeDonationForPodcastUuid:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeDonationForEpisodeUuid:(id)a3
{
  id v4;
  objc_class *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v5 = -[MTIntentDonationUtil interactionClass](self, "interactionClass");
    v7 = v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
    -[objc_class deleteInteractionsWithIdentifiers:completion:](v5, "deleteInteractionsWithIdentifiers:completion:", v6, 0);

  }
}

- (void)removeDonationsForEpisodeUuids:(id)a3
{
  id v4;

  v4 = a3;
  -[objc_class deleteInteractionsWithIdentifiers:completion:](-[MTIntentDonationUtil interactionClass](self, "interactionClass"), "deleteInteractionsWithIdentifiers:completion:", v4, 0);

}

- (void)removeAllDonations
{
  -[objc_class deleteAllInteractionsWithCompletion:](-[MTIntentDonationUtil interactionClass](self, "interactionClass"), "deleteAllInteractionsWithCompletion:", 0);
}

- (BOOL)continueIntentsUserActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MTURLCommandRequest *v25;
  MTURLCommandRequest *v26;
  MTURLCommandRequest *v27;
  MTURLCommandRequest *v28;
  uint64_t v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  MTURLCommandRequest *v34;
  MTURLCommandRequest *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activityType"));
  LODWORD(self) = -[MTIntentDonationUtil canContinueIntentWithUserActivityType:](self, "canContinueIntentWithUserActivityType:", v5);

  if ((_DWORD)self)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "interaction"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "intent"));

    v8 = objc_opt_class(INPlayMediaIntent);
    v9 = objc_opt_class(v8);
    if ((objc_opt_isKindOfClass(v7, v9) & 1) == 0)
    {
      v19 = 0;
LABEL_16:

      goto LABEL_17;
    }
    v10 = v7;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mainOrPrivateContext"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mediaContainer"));
    v14 = objc_msgSend(v13, "type");

    if (v14 == (id)6)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mediaContainer"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mediaItems"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));

      v25 = -[MTURLCommandRequest initWithURLString:]([MTURLCommandRequest alloc], "initWithURLString:", v21);
      v26 = -[MTURLCommandRequest initWithURLString:]([MTURLCommandRequest alloc], "initWithURLString:", v24);
      v48 = 0;
      v49 = &v48;
      v50 = 0x3032000000;
      v51 = sub_1000466FC;
      v52 = sub_1000469F4;
      v53 = 0;
      v38 = 0;
      v39 = &v38;
      v40 = 0x3032000000;
      v41 = sub_1000466FC;
      v42 = sub_1000469F4;
      v43 = 0;
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_1000A0724;
      v32[3] = &unk_1004A90E0;
      v36 = &v48;
      v33 = v12;
      v27 = v25;
      v34 = v27;
      v37 = &v38;
      v28 = v26;
      v35 = v28;
      objc_msgSend(v33, "performBlockAndWait:", v32);
      v29 = v49[5];
      if (v29)
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](MTApplication, "appController"));
        objc_msgSend(v30, "presentPodcast:episode:podcastTab:startPlayback:animated:", v49[5], v39[5], 0, 0, 0);

      }
      _Block_object_dispose(&v38, 8);

      _Block_object_dispose(&v48, 8);
      if (v29)
        goto LABEL_12;
    }
    else if (v14 == (id)8)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mediaContainer"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "identifier"));

      v48 = 0;
      v49 = &v48;
      v50 = 0x3032000000;
      v51 = sub_1000466FC;
      v52 = sub_1000469F4;
      v53 = 0;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1000A06E8;
      v44[3] = &unk_1004A6F10;
      v47 = &v48;
      v45 = v12;
      v17 = v16;
      v46 = v17;
      objc_msgSend(v45, "performBlockAndWait:", v44);
      if (v49[5])
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTApplication appController](MTApplication, "appController"));
        objc_msgSend(v18, "presentStation:new:", v49[5], 0);

        _Block_object_dispose(&v48, 8);
LABEL_12:
        v19 = 1;
LABEL_15:

        goto LABEL_16;
      }

      _Block_object_dispose(&v48, 8);
    }
    v19 = 0;
    goto LABEL_15;
  }
  v19 = 0;
LABEL_17:

  return v19;
}

- (void)prepareIntentForEpisodeUuid:(id)a3 stationUuid:(id)a4 includeImage:(BOOL)a5 includeStorePlatformData:(BOOL)a6 completion:(id)a7
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  _BOOL4 v21;
  id v23;
  id v24;
  _QWORD v25[5];
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  BOOL v31;
  _QWORD v32[5];
  id v33;
  _QWORD *v34;
  uint64_t *v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  _QWORD *v39;
  uint64_t *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t *v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t *v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD v61[3];
  char v62;
  _QWORD v63[5];
  id v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  _QWORD v71[5];
  id v72;
  _QWORD v73[5];
  id v74;
  _QWORD v75[5];
  id v76;
  _QWORD v77[4];
  _QWORD v78[5];
  id v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;
  _QWORD v86[4];
  _QWORD v87[5];
  id v88;
  _QWORD v89[5];
  id v90;

  v21 = a5;
  v9 = a3;
  v10 = a4;
  v24 = a7;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mainOrPrivateContext"));

  v89[0] = 0;
  v89[1] = v89;
  v89[2] = 0x3032000000;
  v89[3] = sub_1000466FC;
  v89[4] = sub_1000469F4;
  v90 = 0;
  v87[0] = 0;
  v87[1] = v87;
  v87[2] = 0x3032000000;
  v87[3] = sub_1000466FC;
  v87[4] = sub_1000469F4;
  v88 = 0;
  v86[0] = 0;
  v86[1] = v86;
  v86[2] = 0x2020000000;
  v86[3] = 0;
  v80 = 0;
  v81 = &v80;
  v82 = 0x3032000000;
  v83 = sub_1000466FC;
  v84 = sub_1000469F4;
  v85 = 0;
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = sub_1000466FC;
  v78[4] = sub_1000469F4;
  v79 = 0;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x2020000000;
  v77[3] = 0;
  v75[0] = 0;
  v75[1] = v75;
  v75[2] = 0x3032000000;
  v75[3] = sub_1000466FC;
  v75[4] = sub_1000469F4;
  v76 = 0;
  v73[0] = 0;
  v73[1] = v73;
  v73[2] = 0x3032000000;
  v73[3] = sub_1000466FC;
  v73[4] = sub_1000469F4;
  v74 = 0;
  v71[0] = 0;
  v71[1] = v71;
  v71[2] = 0x3032000000;
  v71[3] = sub_1000466FC;
  v71[4] = sub_1000469F4;
  v72 = 0;
  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = sub_1000466FC;
  v69 = sub_1000469F4;
  v13 = v9;
  v70 = v13;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x3032000000;
  v63[3] = sub_1000466FC;
  v63[4] = sub_1000469F4;
  v23 = v10;
  v64 = v23;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x2020000000;
  v62 = 0;
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_1000A0D40;
  v46[3] = &unk_1004A9108;
  v14 = v12;
  v47 = v14;
  v15 = v13;
  v48 = v15;
  v49 = &v65;
  v50 = v87;
  v51 = v86;
  v52 = v89;
  v53 = &v80;
  v54 = v78;
  v55 = v77;
  v56 = v75;
  v57 = v71;
  v58 = v61;
  v59 = v63;
  v60 = v73;
  objc_msgSend(v14, "performBlockAndWait:", v46);
  if (objc_msgSend((id)v66[5], "length") && objc_msgSend((id)v81[5], "length"))
  {
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000A0F40;
    v32[3] = &unk_1004A9130;
    v34 = v63;
    v32[4] = self;
    v35 = &v65;
    v36 = v87;
    v37 = v86;
    v38 = v78;
    v39 = v73;
    v40 = &v80;
    v41 = v77;
    v42 = v75;
    v43 = v71;
    v44 = v89;
    v45 = v61;
    v33 = v24;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1000A1338;
    v27[3] = &unk_1004A9180;
    v31 = a6;
    v27[4] = self;
    v29 = v86;
    v30 = v77;
    v16 = objc_retainBlock(v32);
    v28 = v16;
    v17 = objc_retainBlock(v27);
    v18 = v17;
    if (v21)
    {
      v19 = v81[5];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_1000A142C;
      v25[3] = &unk_1004A91A8;
      v25[4] = self;
      v26 = v17;
      -[MTIntentDonationUtil prepareImageDataForPodcastUuid:completion:](self, "prepareImageDataForPodcastUuid:completion:", v19, v25);

    }
    else
    {
      ((void (*)(_QWORD *, _QWORD))v17[2])(v17, 0);
    }

  }
  else if (v24)
  {
    (*((void (**)(id, _QWORD))v24 + 2))(v24, 0);
  }

  _Block_object_dispose(v61, 8);
  _Block_object_dispose(v63, 8);

  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(v71, 8);

  _Block_object_dispose(v73, 8);
  _Block_object_dispose(v75, 8);

  _Block_object_dispose(v77, 8);
  _Block_object_dispose(v78, 8);

  _Block_object_dispose(&v80, 8);
  _Block_object_dispose(v86, 8);
  _Block_object_dispose(v87, 8);

  _Block_object_dispose(v89, 8);
}

- (void)prepareImageDataForPodcastUuid:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PUIObjCArtworkProvider shared](PUIObjCArtworkProvider, "shared"));
  v9 = kMTIntentsArtworkSize;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000A15F8;
  v11[3] = &unk_1004A91D0;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "artworkPathForShow:size:completionHandler:", v7, v11, v9, v9);

}

- (void)fetchMediaDataForEpisodeStoreId:(int64_t)a3 podcastStoreId:(int64_t)a4 completion:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreIdentifier validatedIdNumberFromStoreId:](MTStoreIdentifier, "validatedIdNumberFromStoreId:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));

  if (objc_msgSend(v10, "length"))
    objc_msgSend(v8, "addObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a4));
  if (objc_msgSend(v11, "length"))
    objc_msgSend(v8, "addObject:", v11);
  v12 = objc_msgSend(objc_alloc((Class)IMContentLookupService), "initWithIds:", v8);
  objc_msgSend(v12, "setProfile:", kProductProfile);
  objc_msgSend(v12, "setVersion:", 2);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000A17EC;
  v16[3] = &unk_1004A91F8;
  v17 = v10;
  v18 = v11;
  v19 = v7;
  v13 = v7;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v12, "request:", v16);

}

- (id)peopleScoresFromMediaData:(id)a3 keyedOnQid:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a4;
  v5 = a3;
  if (objc_msgSend(v5, "count")
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("credits"))),
        v7 = objc_opt_class(NSArray),
        isKindOfClass = objc_opt_isKindOfClass(v6, v7),
        v6,
        (isKindOfClass & 1) != 0))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("credits")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v9, "count")));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      if (v4)
        v15 = CFSTR("wikiQid");
      else
        v15 = CFSTR("name");
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v16), "objectForKey:", v15, (_QWORD)v20));
          v18 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0 && objc_msgSend(v17, "length"))
            objc_msgSend(v10, "setObject:forKey:", &off_1004D5D10, v17);

          v16 = (char *)v16 + 1;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

  }
  else
  {
    v10 = &__NSDictionary0__struct;
  }

  return v10;
}

- (id)topicScoresFromMediaData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char isKindOfClass;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  int v15;
  int v16;
  double v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("topics")));
  v5 = objc_opt_class(NSArray);
  isKindOfClass = objc_opt_isKindOfClass(v4, v5);

  if ((isKindOfClass & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("topics")));
    v22 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v7, "count")));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("relevance")));
          objc_msgSend(v14, "floatValue");
          v16 = v15;

          LODWORD(v17) = v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v17));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", CFSTR("wikiQid")));
          v20 = objc_opt_class(NSString);
          if ((objc_opt_isKindOfClass(v19, v20) & 1) != 0 && objc_msgSend(v19, "length"))
            objc_msgSend(v22, "setObject:forKey:", v18, v19);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

  }
  else
  {
    v22 = &__NSDictionary0__struct;
  }

  return v22;
}

- (id)defaultPodcastArtworkData
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if (qword_100567380 != -1)
    dispatch_once(&qword_100567380, &stru_1004A9218);
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_1000466FC;
  v9 = sub_1000469F4;
  v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A1E4C;
  block[3] = &unk_1004A6530;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)qword_100567388, block);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (MTImageStore)imageStore
{
  return self->_imageStore;
}

- (void)setImageStore:(id)a3
{
  objc_storeStrong((id *)&self->_imageStore, a3);
}

- (Class)interactionClass
{
  return self->_interactionClass;
}

- (void)setInteractionClass:(Class)a3
{
  objc_storeStrong((id *)&self->_interactionClass, a3);
}

- (MTPlaybackIdentifierComposing)identifierComposer
{
  return self->_identifierComposer;
}

- (void)setIdentifierComposer:(id)a3
{
  objc_storeStrong((id *)&self->_identifierComposer, a3);
}

- (OS_dispatch_queue)donationQueue
{
  return self->_donationQueue;
}

- (void)setDonationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_donationQueue, a3);
}

- (MTDefaultsChangeNotifier)defaultsObserver
{
  return self->_defaultsObserver;
}

- (void)setDefaultsObserver:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsObserver, a3);
}

- (NSMutableDictionary)cachedScores
{
  return self->_cachedScores;
}

- (void)setCachedScores:(id)a3
{
  objc_storeStrong((id *)&self->_cachedScores, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedScores, 0);
  objc_storeStrong((id *)&self->_defaultsObserver, 0);
  objc_storeStrong((id *)&self->_donationQueue, 0);
  objc_storeStrong((id *)&self->_identifierComposer, 0);
  objc_storeStrong((id *)&self->_interactionClass, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
}

@end
