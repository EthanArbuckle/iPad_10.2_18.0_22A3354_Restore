@implementation MTSetPlaybackQueueUtil

+ (BOOL)setPlaybackQueueForRequest:(id)a3 playerController:(id)a4 siriAssetInfo:(id)a5 enqueuer:(id)a6 savePlayHistory:(BOOL)a7 startPlayback:(BOOL)a8 forceLocal:(BOOL)a9 isMagicMoment:(BOOL)a10 completion:(id)a11
{
  _BOOL4 v11;
  _BOOL8 v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  unsigned __int8 v27;
  id v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  void *v54;
  void *v55;
  MTNetworkMediaManifest *v56;
  uint64_t v57;
  MTNetworkMediaManifest *v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  uint64_t v67;
  NSObject *v68;
  uint64_t v69;
  NSObject *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  unsigned int v74;
  char v75;
  void *v76;
  id v77;
  id v78;
  MTNetworkMediaManifest *v79;
  MTNetworkMediaManifest *v80;
  MTNetworkMediaManifest *v81;
  uint64_t v82;
  NSObject *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  void *v87;
  id v88;
  _BOOL4 v89;
  id v91;
  _QWORD v92[4];
  MTNetworkMediaManifest *v93;
  id v94;
  id v95;
  _QWORD v96[4];
  id v97;
  id v98;
  id v99;
  uint64_t v100;
  _QWORD v101[4];
  id v102;
  id v103;
  id v104;
  __int128 *p_buf;
  uint64_t *v106;
  uint64_t *v107;
  uint64_t *v108;
  uint64_t *v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t *v112;
  uint64_t v113;
  char v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, uint64_t);
  void (*v127)(uint64_t);
  id v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t (*v132)(uint64_t, uint64_t);
  void (*v133)(uint64_t);
  id v134;
  uint8_t v135[8];
  __int128 buf;
  uint64_t v137;
  uint64_t (*v138)(uint64_t, uint64_t);
  void (*v139)(uint64_t);
  id v140;

  v11 = a8;
  v12 = a7;
  v16 = a3;
  v17 = a4;
  v91 = a5;
  v18 = a6;
  v19 = a11;
  v20 = objc_msgSend(v16, "playQueueType");
  if (!v16 || !v20)
  {
    if (v19)
      (*((void (**)(id, _QWORD, _QWORD))v19 + 2))(v19, 0, 0);
    goto LABEL_10;
  }
  v89 = v11;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTReachability sharedInstance](MTReachability, "sharedInstance"));
  v22 = objc_msgSend(v21, "isReachable");

  if ((v22 & 1) == 0)
  {
    v23 = +[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod");
    if ((_DWORD)v23)
    {
      v25 = _MTLogCategoryPlayback(v23, v24);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "No network connection for Homepod playback request.", (uint8_t *)&buf, 2u);
      }

      (*((void (**)(id, uint64_t, _QWORD))v19 + 2))(v19, 11, 0);
LABEL_10:
      v27 = 0;
      goto LABEL_11;
    }
  }
  v29 = +[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod");
  if (v18 && (_DWORD)v29)
  {
    v30 = _MTLogCategoryMediaRemote(v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Overriding active account, enqueuer: %@", (uint8_t *)&buf, 0xCu);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
    objc_msgSend(v32, "setAccountOverride:", v18);

  }
  else
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[MTAccountController sharedInstance](MTAccountController, "sharedInstance"));
    objc_msgSend(v33, "setAccountOverride:", 0);

  }
  v88 = objc_msgSend(v16, "playReason");
  if (objc_msgSend(v16, "playQueueType") != (id)1)
  {
    if (objc_msgSend(v16, "playQueueType") != (id)2)
    {
      if (objc_msgSend(v16, "playQueueType") != (id)3)
      {
        if (v19)
        {
          v59 = (*((uint64_t (**)(id, _QWORD, _QWORD))v19 + 2))(v19, 0, 0);
          v60 = _MTLogCategoryMediaRemote(v59);
          v61 = objc_claimAutoreleasedReturnValue(v60);
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
          {
            v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "urlString"));
            LODWORD(buf) = 138412290;
            *(_QWORD *)((char *)&buf + 4) = v62;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Unexpected command: %@", (uint8_t *)&buf, 0xCu);

          }
        }
        goto LABEL_10;
      }
      v52 = _MTLogCategoryPlayback(3, v51);
      v53 = objc_claimAutoreleasedReturnValue(v52);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "setPlaybackQueueForRequest for type MTURLPlayCommandQueueTypeStation", (uint8_t *)&buf, 2u);
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stationUuid"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "episodeUuid"));
      if (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod"))
      {
        v56 = -[MTNetworkMediaManifest initWithStationId:assetInfo:]([MTNetworkMediaManifest alloc], "initWithStationId:assetInfo:", v54, v91);
        -[MTPlayerManifest setNetworkUPPEnabled:](v56, "setNetworkUPPEnabled:", v12);
        v57 = 8;
      }
      else
      {
        if (v55)
          v72 = objc_claimAutoreleasedReturnValue(+[MTPlaybackQueueFactory playStationUuid:episodeUuid:limit:](MTPlaybackQueueFactory, "playStationUuid:episodeUuid:limit:", v54, v55, 0x7FFFFFFFFFFFFFFFLL));
        else
          v72 = objc_claimAutoreleasedReturnValue(+[MTPlaybackQueueFactory playStationUuid:limit:](MTPlaybackQueueFactory, "playStationUuid:limit:", v54, 0x7FFFFFFFFFFFFFFFLL));
        v56 = (MTNetworkMediaManifest *)v72;
        v57 = 4;
      }
      if (a10)
      {
        v92[0] = _NSConcreteStackBlock;
        v92[1] = 3221225472;
        v92[2] = sub_10010BD54;
        v92[3] = &unk_1004AB7A0;
        v93 = v56;
        v94 = v17;
        v95 = v19;
        v79 = v56;
        objc_msgSend(v94, "setManifestAsDryRun:reason:completion:", v79, 9, v92);

        v27 = 1;
      }
      else
      {
        LOBYTE(v84) = 0;
        v27 = objc_msgSend(a1, "_setManifest:playerController:queueType:startPlayback:forceLocal:reason:interactive:completion:", v56, v17, v57, v89, 0, v88, v84, v19);

      }
      goto LABEL_11;
    }
    v38 = _MTLogCategoryPlayback(2, v37);
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "setPlaybackQueueForRequest for type MTURLPlayCommandQueueTypePodcast", (uint8_t *)&buf, 2u);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v137 = 0x3032000000;
    v138 = sub_10004687C;
    v139 = sub_100046AB4;
    v140 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "podcastUuid"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "episodeUuid"));
    v129 = 0;
    v130 = &v129;
    v131 = 0x3032000000;
    v132 = sub_10004687C;
    v133 = sub_100046AB4;
    v134 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "podcastAdamId"));
    v123 = 0;
    v124 = &v123;
    v125 = 0x3032000000;
    v126 = sub_10004687C;
    v127 = sub_100046AB4;
    v128 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "episodeAdamId"));
    v86 = objc_msgSend(v16, "playbackOrder");
    v119 = 0;
    v120 = &v119;
    v121 = 0x2020000000;
    v122 = 0;
    v115 = 0;
    v116 = &v115;
    v117 = 0x2020000000;
    v118 = 0;
    v111 = 0;
    v112 = &v111;
    v113 = 0x2020000000;
    v114 = 0;
    v41 = objc_msgSend((id)v124[5], "length");
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "mainOrPrivateContext"));

    v101[0] = _NSConcreteStackBlock;
    v101[1] = 3221225472;
    v101[2] = sub_10010BAD0;
    v101[3] = &unk_1004AB750;
    v44 = v43;
    v102 = v44;
    v45 = v40;
    v103 = v45;
    p_buf = &buf;
    v106 = &v119;
    v107 = &v115;
    v108 = &v129;
    v109 = &v111;
    v110 = &v123;
    v104 = v16;
    v46 = objc_msgSend(v44, "performBlockAndWait:", v101);
    v87 = v44;
    if (*((_BYTE *)v120 + 24) || v41)
    {
      if (!*((_BYTE *)v120 + 24))
      {
LABEL_31:
        v48 = _MTLogCategoryPlayback(v46, v47);
        v49 = objc_claimAutoreleasedReturnValue(v48);
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v135 = 0;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "setPlaybackQueueForRequest using MAPI to get latest episode", v135, 2u);
        }

        if ((v22 & 1) == 0)
        {
          v69 = _MTLogCategoryPlayback(v46, v47);
          v70 = objc_claimAutoreleasedReturnValue(v69);
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v135 = 0;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_ERROR, "No network connection for playback request that needs the network.", v135, 2u);
          }

          v71 = 11;
          goto LABEL_67;
        }
        v50 = 0;
LABEL_51:
        v67 = _MTLogCategoryPlayback(v46, v47);
        v68 = objc_claimAutoreleasedReturnValue(v67);
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v135 = 67109120;
          *(_DWORD *)&v135[4] = v50;
          _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "playUsingDatabaseUuids -- %d", v135, 8u);
        }

        if (v50
          && (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod") & 1) == 0)
        {
          *(_QWORD *)v135 = 0;
          if (*((_BYTE *)v120 + 24)
            && (v76 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackQueueFactory playEpisodeUuid:context:limit:](MTPlaybackQueueFactory, "playEpisodeUuid:context:limit:", v45, 0, 0x7FFFFFFFFFFFFFFFLL))) != 0|| (v76 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackQueueFactory playPodcastUuid:order:limit:error:](MTPlaybackQueueFactory, "playPodcastUuid:order:limit:error:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v86, 0x7FFFFFFFFFFFFFFFLL, v135)), *(_QWORD *)v135 != 3))
          {
            if (a10)
            {
              v96[0] = _NSConcreteStackBlock;
              v96[1] = 3221225472;
              v96[2] = sub_10010BCDC;
              v96[3] = &unk_1004AB778;
              v78 = v76;
              v97 = v78;
              v98 = v17;
              v99 = v19;
              v100 = 2;
              objc_msgSend(v98, "setManifestAsDryRun:reason:completion:", v78, 9, v96);

              v74 = 0;
              v75 = 0;
LABEL_95:
              v27 = 1;
LABEL_96:

              _Block_object_dispose(&v111, 8);
              _Block_object_dispose(&v115, 8);
              _Block_object_dispose(&v119, 8);
              _Block_object_dispose(&v123, 8);

              _Block_object_dispose(&v129, 8);
              _Block_object_dispose(&buf, 8);

              if ((v75 & 1) != 0)
                v27 = v74 != 0;
              goto LABEL_11;
            }
            LOBYTE(v84) = 0;
            v74 = objc_msgSend(a1, "_setManifest:playerController:queueType:startPlayback:forceLocal:reason:interactive:completion:", v76, v17, 2, v89, a9, v88, v84, v19);
          }
          else
          {
            if (v19)
              (*((void (**)(id, uint64_t, uint64_t))v19 + 2))(v19, 4, 2);
            v74 = 0;
          }

        }
        else if (objc_msgSend((id)v124[5], "length"))
        {
          if (a10)
            goto LABEL_65;
          if (v12)
            v77 = +[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod");
          else
            v77 = 0;
          v80 = [MTNetworkMediaManifest alloc];
          v81 = -[MTNetworkMediaManifest initWithEpisodeAdamId:assetInfo:](v80, "initWithEpisodeAdamId:assetInfo:", v124[5], v91);
          -[MTPlayerManifest setNetworkUPPEnabled:](v81, "setNetworkUPPEnabled:", v77);
          LOBYTE(v84) = 0;
          v74 = objc_msgSend(a1, "_setManifest:playerController:queueType:startPlayback:forceLocal:reason:interactive:completion:", v81, v17, 8, v89, a9, v88, v84, v19);

        }
        else if (objc_msgSend((id)v130[5], "length"))
        {
          if (a10)
          {
LABEL_65:
            v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "playbackQueueController"));
            objc_msgSend(v73, "setMagicMomentPlayerItem:", 0);

            if (!v19)
            {
LABEL_68:
              v74 = 0;
              v75 = 0;
              v27 = 0;
              goto LABEL_96;
            }
            v71 = 1;
LABEL_67:
            (*((void (**)(id, uint64_t, _QWORD))v19 + 2))(v19, v71, 0);
            goto LABEL_68;
          }
          LOBYTE(v85) = 0;
          v74 = objc_msgSend(a1, "_setPlaybackQueueFromStoreForPodcastAdamId:playerController:siriAssetInfo:savePlayHistory:playbackOrder:startPlayback:reason:interactive:completion:", v130[5], v17, v91, v12, v86, v89, v88, v85, v19);
        }
        else
        {
          v82 = _MTLogCategoryDefault(0);
          v83 = objc_claimAutoreleasedReturnValue(v82);
          if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v135 = 0;
            _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "Invalid queue component specification.", v135, 2u);
          }

          if (v19)
            (*((void (**)(id, _QWORD, _QWORD))v19 + 2))(v19, 0, 0);
          v74 = 0;
        }
        v75 = 1;
        goto LABEL_95;
      }
    }
    else if (*((_BYTE *)v112 + 24) || !*((_BYTE *)v116 + 24))
    {
      goto LABEL_31;
    }
    v50 = 1;
    goto LABEL_51;
  }
  v35 = _MTLogCategoryPlayback(1, v34);
  v36 = objc_claimAutoreleasedReturnValue(v35);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "setPlaybackQueueForRequest for type MTURLPlayCommandQueueTypePodcasts", (uint8_t *)&buf, 2u);
  }

  if (a10)
  {
    if (v19)
      (*((void (**)(id, _QWORD, _QWORD))v19 + 2))(v19, 0, 0);
    goto LABEL_10;
  }
  if (+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod"))
  {
    v58 = -[MTNetworkMediaManifest initWithAssetInfo:]([MTNetworkMediaManifest alloc], "initWithAssetInfo:", v91);
    -[MTPlayerManifest setNetworkUPPEnabled:](v58, "setNetworkUPPEnabled:", v12);
    LOBYTE(v84) = 0;
    v27 = objc_msgSend(a1, "_setManifest:playerController:queueType:startPlayback:forceLocal:reason:interactive:completion:", v58, v17, 8, v89, a9, v88, v84, v19);

  }
  else
  {
    v63 = objc_msgSend(v16, "playbackOrder");
    v65 = _MTLogCategoryPlayback(v63, v64);
    v66 = objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v63;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "setPlaybackQueueForRequest with playback order: %ld", (uint8_t *)&buf, 0xCu);
    }

    v27 = objc_msgSend(a1, "_setPlaybackQueueForMyPodcastsWithOrder:playerController:startPlayback:forceLocal:reason:interactive:completion:", v63, v17, v89, a9, v88, 0, v19);
  }
LABEL_11:

  return v27;
}

+ (BOOL)subscribeWithCommandURL:(id)a3 siriAssetInfo:(id)a4 requester:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD, uint64_t);
  id v12;
  MTURLCommandRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  MTAddPodcastParams *v22;
  void *v23;
  void **v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  void (**v29)(id, _QWORD, uint64_t);
  _QWORD v30[4];
  void (**v31)(id, _QWORD, uint64_t);

  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, _QWORD, uint64_t))a6;
  v12 = a3;
  v13 = -[MTURLCommandRequest initWithURLString:]([MTURLCommandRequest alloc], "initWithURLString:", v12);

  if ((id)-[MTURLCommandRequest commandType](v13, "commandType") == (id)1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTURLCommandRequest podcastAdamId](v13, "podcastAdamId"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v14, "longLongValue")));
    if (+[MTStoreIdentifier isEmptyNumber:](MTStoreIdentifier, "isEmptyNumber:", v15))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTURLCommandRequest podcastFeedUrl](v13, "podcastFeedUrl"));
      v17 = objc_msgSend(v16, "length");

      if (!v17)
      {
        if (v11)
          v11[2](v11, 0, 2);
        v19 = 0;
        goto LABEL_18;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTURLCommandRequest podcastFeedUrl](v13, "podcastFeedUrl"));
      +[MTSubscribeUtil subscribeToPodcastWithFeedUrl:completion:](MTSubscribeUtil, "subscribeToPodcastWithFeedUrl:completion:", v18, v11);

    }
    else
    {
      if (!+[PFClientUtil isRunningOnHomepod](PFClientUtil, "isRunningOnHomepod"))
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreManifest podcastStorePlatformDictionaryFromSiriAssetInfo:podcastAdamId:](MTStoreManifest, "podcastStorePlatformDictionaryFromSiriAssetInfo:podcastAdamId:", v9, v15));
        v19 = v21 != 0;
        if (v21)
        {
          +[MTSubscribeUtil subscribeToPodcastWithStorePlatformDictionary:completion:](MTSubscribeUtil, "subscribeToPodcastWithStorePlatformDictionary:completion:", v21, v11);
        }
        else
        {
          v22 = objc_alloc_init(MTAddPodcastParams);
          -[MTAddPodcastParams setStoreCollectionId:](v22, "setStoreCollectionId:", objc_msgSend(v14, "longLongValue"));
          v25 = _NSConcreteStackBlock;
          v26 = 3221225472;
          v27 = sub_10010C218;
          v28 = &unk_1004A66E0;
          v29 = v11;
          -[MTAddPodcastParams setCompletion:](v22, "setCompletion:", &v25);
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[MTSubscriptionManager sharedInstance](MTSubscriptionManager, "sharedInstance", v25, v26, v27, v28));
          objc_msgSend(v23, "subscribeToPodcastWithParams:", v22);

        }
        goto LABEL_18;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTSubscriptionController sharedInstance](MTSubscriptionController, "sharedInstance"));
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10010C0AC;
      v30[3] = &unk_1004A8F60;
      v31 = v11;
      objc_msgSend(v20, "subscribeToShowWithPodcastStoreId:account:completion:", v14, v10, v30);

    }
    v19 = 1;
LABEL_18:

    goto LABEL_19;
  }
  if (v11)
    v11[2](v11, 0, 2);
  v19 = 0;
LABEL_19:

  return v19;
}

+ (BOOL)setAutoResumePlaybackQueueAndStartPlayback:(BOOL)a3 playerController:(id)a4 forceLocal:(BOOL)a5 reason:(unint64_t)a6 interactive:(BOOL)a7 completion:(id)a8
{
  return objc_msgSend(a1, "_setPlaybackQueueForMyPodcastsWithOrder:playerController:startPlayback:forceLocal:reason:interactive:completion:", 0, a4, a3, a5, a6, a7, a8);
}

+ (int64_t)queueCommandStatusForRequestStatus:(int64_t)a3 queueType:(int64_t)a4
{
  if ((unint64_t)a3 > 9)
    return 200;
  else
    return qword_1003C8350[a3];
}

+ (id)queueCommandCustomStatusForRequestStatus:(int64_t)a3 queueType:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a3 == 11)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("MTSetPlaybackQueueUtilErrorDomain"), -433001, 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandStatus statusWithCode:error:](MPRemoteCommandStatus, "statusWithCode:error:", 200, v4));

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPRemoteCommandStatus statusWithCode:](MPRemoteCommandStatus, "statusWithCode:", +[MTSetPlaybackQueueUtil queueCommandStatusForRequestStatus:queueType:](MTSetPlaybackQueueUtil, "queueCommandStatusForRequestStatus:queueType:", a3, a4)));
  }
  return v5;
}

+ (int64_t)subscribeCommandStatusForErrorCode:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 100;
  else
    return qword_1003C83A0[a3];
}

+ (BOOL)_setPlaybackQueueForMyPodcastsWithOrder:(int64_t)a3 playerController:(id)a4 startPlayback:(BOOL)a5 forceLocal:(BOOL)a6 reason:(unint64_t)a7 interactive:(BOOL)a8 completion:(id)a9
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  unint64_t v26;
  BOOL v27;
  BOOL v28;
  BOOL v29;

  v11 = a6;
  v12 = a5;
  v15 = a4;
  v16 = a9;
  if (a3)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaybackQueueFactory playMyPodcastsWithOrder:](MTPlaybackQueueFactory, "playMyPodcastsWithOrder:", a3));
    LOBYTE(v20) = a8;
    v18 = objc_msgSend(a1, "_setManifest:playerController:queueType:startPlayback:forceLocal:reason:interactive:completion:", v17, v15, 1, v12, v11, a7, v20, v16);

  }
  else
  {
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10010C47C;
    v21[3] = &unk_1004AB7C8;
    v22 = v15;
    v27 = v12;
    v23 = v16;
    v24 = 0;
    v28 = v11;
    v25 = a1;
    v26 = a7;
    v29 = a8;
    objc_msgSend(v22, "restorePlayerManifestWithCompletion:", v21);

    v18 = 1;
  }

  return v18;
}

+ (BOOL)_setManifest:(id)a3 playerController:(id)a4 queueType:(int64_t)a5 startPlayback:(BOOL)a6 forceLocal:(BOOL)a7 reason:(unint64_t)a8 interactive:(BOOL)a9 completion:(id)a10
{
  _BOOL8 v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  int64_t v21;

  v11 = a6;
  v14 = a3;
  v15 = a4;
  v16 = a10;
  v17 = v16;
  if (v14)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10010C754;
    v19[3] = &unk_1004A9F98;
    v20 = v16;
    v21 = a5;
    objc_msgSend(v15, "setManifest:startPlayback:forceLocal:reason:interactive:completion:", v14, v11, 0, a8, a9, v19);

  }
  else if (v16)
  {
    (*((void (**)(id, uint64_t, int64_t))v16 + 2))(v16, 3, a5);
  }

  return v14 != 0;
}

+ (BOOL)_setPlaybackQueueFromStoreForPodcastAdamId:(id)a3 playerController:(id)a4 siriAssetInfo:(id)a5 savePlayHistory:(BOOL)a6 playbackOrder:(int64_t)a7 startPlayback:(BOOL)a8 reason:(unint64_t)a9 interactive:(BOOL)a10 completion:(id)a11
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  MTStoreManifest *v21;
  void *v22;
  MTNetworkMediaManifest *v23;
  uint64_t v24;
  unsigned __int8 v25;
  uint64_t v27;
  _BOOL4 v28;
  _BOOL4 v30;

  v30 = a8;
  v28 = a6;
  v14 = a3;
  v15 = a5;
  v16 = a11;
  v17 = a4;
  v18 = objc_msgSend(v14, "longLongValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[MTStoreManifest podcastStorePlatformDictionaryFromSiriAssetInfo:podcastAdamId:](MTStoreManifest, "podcastStorePlatformDictionaryFromSiriAssetInfo:podcastAdamId:", v15, v19));

  if (v20)
  {
    v21 = [MTStoreManifest alloc];
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v18));
    v23 = -[MTStoreManifest initWithPodcastAdamId:siriAssetInfo:oldestEpisode:initiatedByAnotherUser:](v21, "initWithPodcastAdamId:siriAssetInfo:oldestEpisode:initiatedByAnotherUser:", v22, v15, a7 == 2, 0);

    v24 = 3;
  }
  else
  {
    v23 = -[MTNetworkMediaManifest initWithPodcastAdamId:assetInfo:]([MTNetworkMediaManifest alloc], "initWithPodcastAdamId:assetInfo:", v14, v15);
    -[MTPlayerManifest setNetworkUPPEnabled:](v23, "setNetworkUPPEnabled:", v28);
    v24 = 8;
  }
  LOBYTE(v27) = a10;
  v25 = objc_msgSend(a1, "_setManifest:playerController:queueType:startPlayback:forceLocal:reason:interactive:completion:", v23, v17, v24, v30, 0, a9, v27, v16);

  return v25;
}

+ (int64_t)_automaticCommandStatusForRequestStatus:(int64_t)a3
{
  if (a3 == 4)
    return 110;
  else
    return -1;
}

@end
