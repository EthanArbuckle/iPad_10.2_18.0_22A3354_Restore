@implementation MTPlaylistQueryManager

+ (void)_sortUngroupedList:(id)a3 inPlaylist:(id)a4
{
  id v5;
  Block_layout *v6;
  void *v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v5 = a4;
  switch(objc_msgSend(v5, "containerOrder"))
  {
    case 0u:
      v6 = &stru_1004AA638;
      goto LABEL_7;
    case 1u:
      v6 = &stru_1004AA658;
      goto LABEL_7;
    case 2u:
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "episodes"));
      v8 = objc_msgSend(v7, "mutableCopy");

      v9 = objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v9, "minusOrderedSet:", v8);
      objc_msgSend(v8, "intersectOrderedSet:", v10);
      objc_msgSend(v10, "removeAllObjects");
      objc_msgSend(v10, "unionOrderedSet:", v9);
      objc_msgSend(v10, "unionOrderedSet:", v8);

      break;
    case 3u:
      v6 = &stru_1004AA678;
      goto LABEL_7;
    case 4u:
      v6 = &stru_1004AA698;
LABEL_7:
      objc_msgSend(v10, "sortUsingComparator:", v6);
      break;
    default:
      break;
  }

}

- (MTPlaylistQueryManager)init
{
  MTPlaylistQueryManager *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTPlaylistQueryManager;
  v2 = -[MTBaseProcessor init](&v5, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "feedUpdateDidComplete:", CFSTR("MTFeedUpdateDidEndUpdatingAllFeeds"), 0);

  }
  return v2;
}

- (BOOL)updatePlaylistsWithUuids:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mainOrPrivateContext"));

  LOBYTE(self) = -[MTPlaylistQueryManager updatePlaylistsWithUuids:context:applyAdditionalChangesBlock:](self, "updatePlaylistsWithUuids:context:applyAdditionalChangesBlock:", v4, v6, 0);
  return (char)self;
}

- (void)updateAllPlaylistsWithCompletion:(id)a3
{
  id v4;
  MTPlaylistQueryManager *v5;
  uint64_t v6;
  MTCoalescableWorkController *updateAllPlaylistBackgroundWorkController;
  MTCoalescableWorkController *v8;
  _QWORD v9[5];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5->_updateAllPlaylistBackgroundWorkController)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[MTCoalescableWorkController controllerWithQosClass:identifier:](MTCoalescableWorkController, "controllerWithQosClass:identifier:", 21, CFSTR("MTPlaylistQueryManager.updateAllPlaylists")));
    updateAllPlaylistBackgroundWorkController = v5->_updateAllPlaylistBackgroundWorkController;
    v5->_updateAllPlaylistBackgroundWorkController = (MTCoalescableWorkController *)v6;

  }
  objc_sync_exit(v5);

  v8 = v5->_updateAllPlaylistBackgroundWorkController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000D794;
  v9[3] = &unk_1004A6200;
  v9[4] = v5;
  -[MTCoalescableWorkController schedule:completion:](v8, "schedule:completion:", v9, v4);

}

- (BOOL)updatePlaylistsWithUuids:(id)a3 context:(id)a4 applyAdditionalChangesBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100016860;
  v14[3] = &unk_1004AA6E0;
  v10 = v7;
  v15 = v10;
  v18 = &v19;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  objc_msgSend(v11, "performBlockAndWait:", v14);
  LOBYTE(v9) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)v9;
}

+ (BOOL)updatePlaylist:(id)a3 inContext:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSMutableOrderedSet *v28;
  id v29;
  id v30;
  uint64_t v31;
  void *j;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  unsigned __int8 v38;
  void *v39;
  void *v40;
  void *v41;
  unsigned __int8 v42;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  void *v47;
  _BOOL4 v48;
  BOOL v50;
  void *v51;
  void *v52;
  unsigned int v53;
  uint64_t v54;
  id v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[16];
  _BYTE v67[128];
  _BYTE v68[128];

  v5 = a3;
  v56 = a4;
  v52 = v5;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "playlistForUuid:", v5));
  v57 = (void *)v6;
  if (!v6)
  {
    LOBYTE(v53) = 0;
    goto LABEL_60;
  }
  v8 = _MTLogCategoryDatabase(v6, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Calling refreshObject:mergeChanges: for playlist.", buf, 2u);
  }

  objc_msgSend(v56, "refreshObject:mergeChanges:", v57, 1);
  v53 = objc_msgSend(v57, "needsUpdate");
  if (v53)
    objc_msgSend(v57, "setNeedsUpdate:", 0);
  if ((objc_msgSend(v57, "hidden") & 1) == 0)
  {
    if (objc_msgSend(v57, "isItunesPlaylist"))
    {
      if ((v53 & 1) != 0)
        LOBYTE(v53) = 1;
      else
        LOBYTE(v53) = objc_msgSend(v57, "updateUnplayedCount");
      goto LABEL_60;
    }
    if (objc_msgSend(v57, "includesAllPodcasts"))
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_allEligiblePodcastsForPlaylistInCtx:", v56));
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "podcasts"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "array"));

    }
    if (objc_msgSend(v51, "count"))
    {
      buf[0] = 0;
      if (!v53)
      {
LABEL_56:
        objc_msgSend(0, "report");
        v46 = v53;
        if (buf[0])
          v46 = 1;
        goto LABEL_58;
      }
      objc_msgSend(0, "reportWithMarker:", CFSTR("*** Update start ***"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "settings"));
      v12 = objc_msgSend(v11, "copy");

      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v63;
        v54 = kEpisodeTitle;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v63 != v15)
              objc_enumerationMutation(v13);
            v17 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "podcast"));
            if (v18)
            {
              if (objc_msgSend(v17, "needsUpdate"))
              {
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "podcast"));
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "title"));
                v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Settings needs update: %@"), v20));
                objc_msgSend(0, "reportWithMarker:", v21);

                objc_msgSend(a1, "updateEpisodesForSettings:ctx:", v17, v56);
                objc_msgSend(v17, "setNeedsUpdate:", 0);
                v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "episodes"));
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "valueForKey:", v54));
                v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\n%@"), v23));
                objc_msgSend(0, "reportWithMarker:", v24);

              }
            }
            else
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(+[IMLogger sharedLogger](IMLogger, "sharedLogger"));
              objc_msgSend(v25, "logFile:lineNumber:format:", "/Library/Caches/com.apple.xbs/Sources/Marmoset/Source/Library/Playlists/MTPlaylistQueryManager.m", 225, CFSTR("Settings object with no podcast set"));

              objc_msgSend(v56, "deleteObject:", v17);
              v18 = 0;
            }

          }
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
        }
        while (v14);
      }

      objc_msgSend(a1, "_fixSortOrder:generated_p:", v57, buf);
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "settings"));
      v27 = objc_msgSend(v26, "copy");

      v28 = objc_opt_new(NSMutableOrderedSet);
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v29 = v27;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v59;
        do
        {
          for (j = 0; j != v30; j = (char *)j + 1)
          {
            if (*(_QWORD *)v59 != v31)
              objc_enumerationMutation(v29);
            v33 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)j);
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "episodes"));
            v35 = objc_msgSend(v34, "mutableCopy");

            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "deletedEpisodes"));
            objc_msgSend(v35, "minusSet:", v36);

            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "episodes"));
            v38 = objc_msgSend(v35, "isEqualToOrderedSet:", v37);

            if ((v38 & 1) == 0)
            {
              objc_msgSend(v33, "setEpisodes:", v35);
              buf[0] = 1;
            }
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "episodes"));
            -[NSMutableOrderedSet unionOrderedSet:](v28, "unionOrderedSet:", v39);

            objc_msgSend(v33, "setEpisodeCount:", objc_msgSend(v35, "count"));
          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v58, v67, 16);
        }
        while (v30);
      }

      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "deletedEpisodes"));
      -[NSMutableOrderedSet minusSet:](v28, "minusSet:", v40);

      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "episodes"));
      if (-[NSMutableOrderedSet isEqualToOrderedSet:](v28, "isEqualToOrderedSet:", v41))
      {
        v42 = objc_msgSend(v57, "isUngroupedList");

        if ((v42 & 1) == 0)
        {
LABEL_51:
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "episodes"));
          if (objc_msgSend(v47, "count"))
          {

          }
          else
          {
            v48 = -[NSMutableOrderedSet count](v28, "count") == 0;

            if (v48)
              buf[0] = 1;
          }
          +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
          objc_msgSend(v57, "setUpdatedDate:");

          goto LABEL_56;
        }
      }
      else
      {

      }
      if (objc_msgSend(v57, "isUngroupedList"))
        objc_msgSend(a1, "_sortUngroupedList:inPlaylist:", v28, v57);
      objc_msgSend(v57, "setEpisodes:", v28);
      objc_msgSend(v57, "updateUnplayedCount");
      buf[0] = 1;
      objc_msgSend(0, "reportWithMarker:", CFSTR("Playlist generated"));
      goto LABEL_51;
    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "podcasts"));
    if (!objc_msgSend(v43, "count"))
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "deletedEpisodes"));
      if (!objc_msgSend(v44, "count"))
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "episodes"));
        if (!objc_msgSend(v45, "count"))
        {
          v50 = objc_msgSend(v57, "unplayedCount") == 0;

          if (v50)
            goto LABEL_59;
          goto LABEL_46;
        }

      }
    }

LABEL_46:
    objc_msgSend(v57, "setPodcasts:", 0);
    objc_msgSend(v57, "setDeletedEpisodes:", 0);
    objc_msgSend(v57, "setEpisodes:", 0);
    objc_msgSend(v57, "setUnplayedCount:", 0);
    v46 = 1;
LABEL_58:
    LOBYTE(v53) = v46;
LABEL_59:

  }
LABEL_60:

  return v53;
}

+ (void)updateEpisodesForSettings:(id)a3 ctx:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "predicateForSettings"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "podcast"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sortDescriptorsForPlayOrderByPubDate"));

  v10 = objc_msgSend(v5, "integerForEpisodesToShow");
  v30 = v6;
  if (v10)
  {
    v11 = v10;
    v12 = kEpisodeLevel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K < %ld"), kEpisodeLevel, v10));
    v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "AND:", v13));

    v14 = kMTEpisodeEntityName;
    v15 = v9;
    v16 = v6;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodePubDate, 0));
    v31[0] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeEpisodeNumber, 0));
    v31[1] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", v12, 1));
    v31[2] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", kEpisodeTitle, 1, "localizedStandardCompare:"));
    v31[3] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 4));
    v22 = v16;
    v9 = v15;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", v14, v29, v21, 1, v11));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sortedArrayUsingDescriptors:", v15));
    v7 = (void *)v29;
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", kMTEpisodeEntityName, v7, v9, 1, 0));
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v24));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "episodes"));
  v27 = objc_msgSend(v25, "isEqualToOrderedSet:", v26);

  if ((v27 & 1) == 0)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSOrderedSet orderedSetWithArray:](NSOrderedSet, "orderedSetWithArray:", v24));
    objc_msgSend(v5, "setEpisodes:", v28);

  }
  objc_msgSend(v5, "setVisible:", objc_msgSend(v24, "count") != 0);
  objc_msgSend(v5, "latestEpisodeDate");
  objc_msgSend(v5, "setLatestEpisodeAvailabilityDate:");
  objc_msgSend(v5, "oldestEpisodeDate");
  objc_msgSend(v5, "setEarliestEpisodeAvailabilityDate:");

}

+ (void)_fixSortOrder:(id)a3 generated_p:(BOOL *)a4
{
  id v5;
  void *v6;
  Block_layout *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mutableOrderedSetValueForKey:", kPlaylistSettings));
  switch(objc_msgSend(v5, "containerOrder"))
  {
    case 0u:
      v7 = &stru_1004AA578;
      goto LABEL_15;
    case 1u:
      v7 = &stru_1004AA598;
      goto LABEL_15;
    case 3u:
      v7 = &stru_1004AA5B8;
      goto LABEL_15;
    case 4u:
      v7 = &stru_1004AA5D8;
      goto LABEL_15;
    case 5u:
      v7 = &stru_1004AA5F8;
LABEL_15:
      objc_msgSend(v6, "sortUsingComparator:", v7);
      break;
    default:
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v8 = v6;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
      {
        v10 = v9;
        v11 = 0;
        v12 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v15 != v12)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "setSortOrder:", (char *)i + v11, (_QWORD)v14);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
          v11 += (uint64_t)i;
        }
        while (v10);
      }

      *a4 = 1;
      break;
  }

}

+ (id)_allEligiblePodcastsForPlaylistInCtx:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = kMTPodcastEntityName;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts](MTPodcast, "predicateForNotHiddenNotImplicitlyFollowedPodcasts"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast sortDescriptorsForAllPodcasts](MTPodcast, "sortDescriptorsForAllPodcasts"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectsInEntity:predicate:sortDescriptors:", v3, v5, v6));

  return v7;
}

- (id)entityName
{
  return kMTPlaylistEntityName;
}

- (void)feedUpdateDidComplete:(id)a3
{
  -[MTPlaylistQueryManager updateAllPlaylistsWithCompletion:](self, "updateAllPlaylistsWithCompletion:", 0);
}

- (id)predicate
{
  return +[MTPlaylist predicateForFlag:isTrue:](MTPlaylist, "predicateForFlag:isTrue:", 5, 1);
}

- (void)resultsChangedWithDeletedIds:(id)a3 insertIds:(id)a4 updatedIds:(id)a5
{
  id v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  if (objc_msgSend(v6, "count"))
  {
    global_queue = dispatch_get_global_queue(-2, 0);
    v8 = objc_claimAutoreleasedReturnValue(global_queue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000E3A40;
    v9[3] = &unk_1004A6640;
    v9[4] = self;
    v10 = v6;
    dispatch_async(v8, v9);

  }
}

- (BOOL)updatePlaylistWithUuid:(id)a3 inContext:(id)a4
{
  return -[MTPlaylistQueryManager updatePlaylistWithUuid:inContext:applyAdditionalChangesBlock:](self, "updatePlaylistWithUuid:inContext:applyAdditionalChangesBlock:", a3, a4, 0);
}

- (BOOL)updatePlaylistWithUuid:(id)a3 inContext:(id)a4 applyAdditionalChangesBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", a3));
  LOBYTE(self) = -[MTPlaylistQueryManager updatePlaylistsWithUuids:context:applyAdditionalChangesBlock:](self, "updatePlaylistsWithUuids:context:applyAdditionalChangesBlock:", v10, v9, v8);

  return (char)self;
}

- (void)createDefaultPlaylists
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOrPrivateContext"));

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000E3F38;
  v5[3] = &unk_1004A6200;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "performBlockAndWait:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateAllPlaylistBackgroundWorkController, 0);
}

@end
