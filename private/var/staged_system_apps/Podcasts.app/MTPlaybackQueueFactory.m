@implementation MTPlaybackQueueFactory

+ (id)playListenNow
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_1000468E4;
  v18 = sub_100046ADC;
  v19 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForListenNow](MTEpisode, "sortDescriptorsForListenNow"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mainOrPrivateContext"));

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10011B880;
  v10[3] = &unk_1004A6690;
  v6 = v5;
  v11 = v6;
  v7 = v3;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v6, "performBlockAndWait:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "playEpisodeUuid:", v15[5]));

  _Block_object_dispose(&v14, 8);
  return v8;
}

+ (id)playMyPodcastsWithOrder:(int64_t)a3
{
  void *v3;

  if (a3 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_manifestForPlayMyOldestPodcasts"));
  }
  else if (a3 == 1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_manifestForPlayMyLatestPodcasts"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_manifestForPlayMyPodcasts"));
  }
  return v3;
}

+ (id)playPodcastUuid:(id)a3
{
  return _objc_msgSend(a1, "playPodcastUuid:order:", a3, 0);
}

+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4
{
  return _objc_msgSend(a1, "playPodcastUuid:order:limit:", a3, a4, 0);
}

+ (id)playPodcastUuid:(id)a3 limit:(int64_t)a4
{
  return _objc_msgSend(a1, "playPodcastUuid:order:limit:", a3, 0, a4);
}

+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4 limit:(int64_t)a5 error:(int64_t *)a6
{
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  int64_t v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mainOrPrivateContext"));

  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_episodeToPlayForPodcastUuid:playbackOrder:excludeExplicit:ctx:", v10, a4, 0, v12));
  v14 = (void *)v13;
  if (!a4 && !v13)
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_episodeToPlayForPodcastUuid:playbackOrder:excludeExplicit:ctx:", v10, 1, 0, v12));
  if (!v14)
  {
    if (!a6)
      goto LABEL_16;
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    if (objc_msgSend(v10, "length"))
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10011BB98;
      v20[3] = &unk_1004A6690;
      v15 = v12;
      v21 = v15;
      v16 = v10;
      v22 = v16;
      v23 = &v24;
      objc_msgSend(v15, "performBlockAndWait:", v20);

      if (!*((_BYTE *)v25 + 24))
      {
        if ((+[PFRestrictionsUtil isExplicitContentAllowed](PFRestrictionsUtil, "isExplicitContentAllowed") & 1) == 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_episodeToPlayForPodcastUuid:playbackOrder:excludeExplicit:ctx:", v16, a4, 2, v15));
          if (v17)
          {
            *a6 = 3;

LABEL_15:
            _Block_object_dispose(&v24, 8);
            a6 = 0;
            goto LABEL_16;
          }
        }
        v18 = 2;
LABEL_14:
        *a6 = v18;
        goto LABEL_15;
      }
    }
    else
    {
      *((_BYTE *)v25 + 24) = 1;
    }
    v18 = 1;
    goto LABEL_14;
  }
  a6 = (int64_t *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "playEpisodeUuid:limit:", v14, a5));
LABEL_16:

  return a6;
}

+ (id)playPodcastUuid:(id)a3 order:(int64_t)a4 limit:(int64_t)a5
{
  return objc_msgSend(a1, "playPodcastUuid:order:limit:error:", a3, a4, a5, 0);
}

+ (id)playStationUuid:(id)a3
{
  return objc_msgSend(a1, "playStationUuid:episodeUuid:", a3, 0);
}

+ (id)playStationUuid:(id)a3 episodeUuid:(id)a4
{
  return objc_msgSend(a1, "playStationUuid:episodeUuid:limit:", a3, a4, 0);
}

+ (id)playStationUuid:(id)a3 limit:(int64_t)a4
{
  return objc_msgSend(a1, "playStationUuid:episodeUuid:limit:", a3, 0, a4);
}

+ (id)playStationUuid:(id)a3 episodeUuid:(id)a4 limit:(int64_t)a5
{
  id v8;
  id v9;
  MTPlaylistManifest *v10;
  MTEpisodeManifest *v11;
  void *v13;
  void *v14;
  id v15;
  MTEpisodeManifest *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "length") && objc_msgSend(a1, "_isContinuousPlaybackEnabledForLimit:", a5))
  {
    v10 = -[MTPlaylistManifest initWithPlaylistUuid:initialEpisodeUuid:]([MTPlaylistManifest alloc], "initWithPlaylistUuid:initialEpisodeUuid:", v8, v9);
LABEL_6:
    v11 = (MTEpisodeManifest *)v10;
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "length"))
  {
    v10 = -[MTEpisodeManifest initWithEpisodeUuid:]([MTEpisodeManifest alloc], "initWithEpisodeUuid:", v9);
    goto LABEL_6;
  }
  if (objc_msgSend(v8, "length"))
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = sub_1000468E4;
    v25 = sub_100046ADC;
    v26 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "mainOrPrivateContext"));

    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10011BDF4;
    v17[3] = &unk_1004A6690;
    v15 = v14;
    v18 = v15;
    v19 = v8;
    v20 = &v21;
    objc_msgSend(v15, "performBlockAndWait:", v17);
    if (objc_msgSend((id)v22[5], "length"))
    {
      v16 = [MTEpisodeManifest alloc];
      v11 = -[MTEpisodeManifest initWithEpisodeUuid:](v16, "initWithEpisodeUuid:", v22[5]);
    }
    else
    {
      v11 = 0;
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v11 = 0;
  }
LABEL_7:

  return v11;
}

+ (id)playEpisodeUuid:(id)a3
{
  return objc_msgSend(a1, "playEpisodeUuid:limit:", a3, 0);
}

+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4
{
  return objc_msgSend(a1, "playEpisodeUuid:context:limit:", a3, a4, 0);
}

+ (id)playEpisodeUuid:(id)a3 limit:(int64_t)a4
{
  return objc_msgSend(a1, "playEpisodeUuid:context:limit:", a3, 0, a4);
}

+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4 limit:(int64_t)a5
{
  return _objc_msgSend(a1, "playEpisodeUuid:context:sortType:limit:pubDateLimit:", a3, a4, 0, a5, 3);
}

+ (id)playEpisodeUuid:(id)a3 context:(int64_t)a4 sortType:(int64_t)a5 limit:(int64_t)a6 pubDateLimit:(int64_t)a7
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  MTEpisodeManifest *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  __objc2_class **v35;
  id v36;
  MTPredicateManifest *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v48[4];
  id v49;
  id v50;
  uint8_t *v51;
  int64_t v52;
  _QWORD v53[4];
  id v54;
  id v55;
  uint8_t *v56;
  uint8_t buf[8];
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t);
  id v62;

  v12 = a3;
  if (objc_msgSend(v12, "length"))
  {
    v13 = objc_msgSend(a1, "_isContinuousPlaybackEnabledForLimit:", a6);
    if ((_DWORD)v13)
    {
      v15 = 0;
      switch(a5)
      {
        case 0:
        case 1:
          goto LABEL_17;
        case 2:
          v16 = 1;
          goto LABEL_18;
        case 3:
          v18 = objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForTitle](MTEpisode, "sortDescriptorsForTitle"));
          goto LABEL_19;
        case 4:
          v19 = 0;
          goto LABEL_10;
        case 5:
          v19 = 1;
LABEL_10:
          v18 = objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForLastBookmarkedDateAscending:](MTEpisode, "sortDescriptorsForLastBookmarkedDateAscending:", v19));
          goto LABEL_19;
        case 7:
          v20 = 1;
          goto LABEL_13;
        case 8:
          v20 = 0;
LABEL_13:
          v18 = objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForDownloadedDateAscending:](MTEpisode, "sortDescriptorsForDownloadedDateAscending:", v20));
          goto LABEL_19;
        case 9:
          v21 = _MTLogCategoryPlayback(v13, v14);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Invalid sort type enum MTEpisodeContextSortType_ENUM_COUNT, using default", buf, 2u);
          }

LABEL_17:
          v16 = 0;
LABEL_18:
          v18 = objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForPubDateAscending:](MTEpisode, "sortDescriptorsForPubDateAscending:", v16));
LABEL_19:
          v15 = (void *)v18;
          break;
        default:
          break;
      }
      switch(a4)
      {
        case 2:
        case 7:
          v23 = (id)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForPubDateLimit:](MTEpisode, "predicateForPubDateLimit:", a7));
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForListenNowLatestEpisodes](MTEpisode, "predicateForListenNowLatestEpisodes"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 0));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "AND:", v25));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "AND:", v23));

          v28 = objc_alloc((Class)NSFetchRequest);
          v29 = objc_msgSend(v28, "initWithEntityName:", kMTEpisodeEntityName);
          objc_msgSend(v29, "setPredicate:", v27);
          objc_msgSend(v29, "setSortDescriptors:", v15);
          v17 = -[MTPredicateManifest initWithInitialEpisodeUuid:fetchRequest:]([MTPredicateManifest alloc], "initWithInitialEpisodeUuid:fetchRequest:", v12, v29);

          goto LABEL_31;
        case 3:
          v30 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForDownloaded:excludeHidden:](MTEpisode, "predicateForDownloaded:excludeHidden:", 1, 1));
          goto LABEL_27;
        case 8:
          v30 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForBookmarkedEpisodes](MTEpisode, "predicateForBookmarkedEpisodes"));
LABEL_27:
          v23 = (id)v30;
          v37 = -[MTPredicateManifest initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:]([MTPredicateManifest alloc], "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:", v12, v30, v15);
          goto LABEL_29;
        case 9:
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "mainOrPrivateContext"));

          *(_QWORD *)buf = 0;
          v58 = buf;
          v59 = 0x3032000000;
          v60 = (uint64_t)sub_1000468E4;
          v61 = sub_100046ADC;
          v62 = 0;
          v53[0] = _NSConcreteStackBlock;
          v53[1] = 3221225472;
          v53[2] = sub_10011C428;
          v53[3] = &unk_1004A6690;
          v23 = v42;
          v54 = v23;
          v43 = v12;
          v55 = v43;
          v56 = buf;
          objc_msgSend(v23, "performBlockAndWait:", v53);
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAllEpisodesOnPodcastUuid:includeNonAudioEpisodes:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:includeNonAudioEpisodes:", *((_QWORD *)v58 + 5), 1));
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForDownloaded:excludeHidden:](MTEpisode, "predicateForDownloaded:excludeHidden:", 1, 1));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "AND:", v45));

          v17 = -[MTPredicateManifest initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:]([MTPredicateManifest alloc], "initWithInitialEpisodeUuid:predicateToTrack:sortDescriptors:", v43, v46, v15);
          _Block_object_dispose(buf, 8);

          goto LABEL_31;
        case 10:
          v38 = objc_alloc((Class)NSFetchRequest);
          v23 = objc_msgSend(v38, "initWithEntityName:", kMTEpisodeEntityName);
          v39 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForPreviouslyPlayedHidingFutureTimestamps](MTEpisode, "predicateForPreviouslyPlayedHidingFutureTimestamps"));
          objc_msgSend(v23, "setPredicate:", v39);

          v40 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForRecentlyPlayed](MTEpisode, "sortDescriptorsForRecentlyPlayed"));
          objc_msgSend(v23, "setSortDescriptors:", v40);

          v37 = -[MTPredicateManifest initWithInitialEpisodeUuid:fetchRequest:]([MTPredicateManifest alloc], "initWithInitialEpisodeUuid:fetchRequest:", v12, v23);
LABEL_29:
          v17 = (MTEpisodeManifest *)v37;
LABEL_31:

          break;
        default:
          *(_QWORD *)buf = 0;
          v58 = buf;
          v59 = 0x2020000000;
          v60 = 9;
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "mainOrPrivateContext"));

          v48[0] = _NSConcreteStackBlock;
          v48[1] = 3221225472;
          v48[2] = sub_10011C480;
          v48[3] = &unk_1004AA838;
          v33 = v32;
          v49 = v33;
          v34 = v12;
          v50 = v34;
          v51 = buf;
          v52 = a4;
          objc_msgSend(v33, "performBlockAndWait:", v48);
          v35 = off_1004A4460;
          if (a4 != 6)
            v35 = &off_1004A44E0;
          v36 = objc_alloc(*v35);
          v17 = (MTEpisodeManifest *)objc_msgSend(v36, "initWithInitialEpisodeUuid:sectionType:", v34, *((_QWORD *)v58 + 3));

          _Block_object_dispose(buf, 8);
          break;
      }

    }
    else
    {
      v17 = -[MTEpisodeManifest initWithEpisodeUuid:]([MTEpisodeManifest alloc], "initWithEpisodeUuid:", v12);
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)_manifestForPlayMyPodcasts
{
  void *v2;
  void *v3;
  MTUnplayedManifest *v4;
  MTUnplayedManifest *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "playListenNow"));
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    if (!+[MTPodcast totalUnplayedCount](MTPodcast, "totalUnplayedCount"))
    {
      v5 = 0;
      goto LABEL_6;
    }
    v4 = -[MTUnplayedManifest initWithInitialEpisodeUuid:]([MTUnplayedManifest alloc], "initWithInitialEpisodeUuid:", 0);
  }
  v5 = v4;
LABEL_6:

  return v5;
}

+ (id)_manifestForPlayMyLatestPodcasts
{
  MTUnplayedManifest *v2;

  v2 = (MTUnplayedManifest *)+[MTPodcast totalUnplayedCount](MTPodcast, "totalUnplayedCount");
  if (v2)
    v2 = -[MTUnplayedManifest initWithInitialEpisodeUuid:newestToOldest:]([MTUnplayedManifest alloc], "initWithInitialEpisodeUuid:newestToOldest:", 0, 1);
  return v2;
}

+ (id)_manifestForPlayMyOldestPodcasts
{
  MTUnplayedManifest *v2;

  v2 = (MTUnplayedManifest *)+[MTPodcast totalUnplayedCount](MTPodcast, "totalUnplayedCount");
  if (v2)
    v2 = -[MTUnplayedManifest initWithInitialEpisodeUuid:newestToOldest:]([MTUnplayedManifest alloc], "initWithInitialEpisodeUuid:newestToOldest:", 0, 0);
  return v2;
}

+ (BOOL)_isContinuousPlaybackEnabledForLimit:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 1;
  if (a3 == 1)
    return 0;
  return MTPlaybackContinuousPlaybackEnabled(a1, a2);
}

+ (id)_episodeToPlayForPodcastUuid:(id)a3 playbackOrder:(int64_t)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v10 = a3;
  v11 = a6;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_1000468E4;
  v27 = sub_100046ADC;
  v28 = 0;
  if (a4 == 2)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_oldestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:ctx:", v10, 1, a5, v11));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
  }
  else if (a4 == 1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_latestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:ctx:", v10, 0, a5, v11));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uuid"));
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTRecencyUtil upNextForPodcastUuid:excludeExplicit:ctx:](MTRecencyUtil, "upNextForPodcastUuid:excludeExplicit:ctx:", v10, a5, v11));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "episodeUuid"));
  }
  v14 = (void *)v24[5];
  v24[5] = v13;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10011C83C;
  v19[3] = &unk_1004A6690;
  v15 = v11;
  v20 = v15;
  v16 = v10;
  v21 = v16;
  v22 = &v23;
  objc_msgSend(v15, "performBlockAndWait:", v19);
  v17 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v17;
}

+ (id)_latestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return _objc_msgSend(a1, "_latestOrOldestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:latest:ctx:", a3, a4, a5, 1, a6);
}

+ (id)_oldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  return _objc_msgSend(a1, "_latestOrOldestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:latest:ctx:", a3, a4, a5, 0, a6);
}

+ (id)_latestOrOldestEpisodeForPodcastUuid:(id)a3 restrictToUserEpisodes:(BOOL)a4 excludeExplicit:(int64_t)a5 latest:(BOOL)a6 ctx:(id)a7
{
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  int64_t v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v11 = a3;
  v12 = a7;
  if (objc_msgSend(v11, "length"))
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = sub_1000468E4;
    v26 = sub_100046ADC;
    v27 = 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10011C9F4;
    v15[3] = &unk_1004ABDB0;
    v16 = v12;
    v20 = a4;
    v17 = v11;
    v18 = &v22;
    v21 = a6;
    v19 = a5;
    objc_msgSend(v16, "performBlockAndWait:", v15);
    v13 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_uuidForEpisode:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1000468E4;
  v15 = sub_100046ADC;
  v16 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "managedObjectContext"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10011CBA0;
  v8[3] = &unk_1004A6F38;
  v10 = &v11;
  v5 = v3;
  v9 = v5;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

@end
