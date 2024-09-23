@implementation MTRecencyUtil

+ (id)upNextForPodcastUuid:(id)a3 ctx:(id)a4
{
  return (id)objc_msgSend(a1, "upNextForPodcastUuid:excludeExplicit:ctx:", a3, 0, a4);
}

+ (id)upNextForPodcastUuid:(id)a3 excludeExplicit:(int64_t)a4 ctx:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  id v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "length"))
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__7;
    v22 = __Block_byref_object_dispose__7;
    v23 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __58__MTRecencyUtil_upNextForPodcastUuid_excludeExplicit_ctx___block_invoke;
    v12[3] = &unk_1E54D1970;
    v13 = v9;
    v14 = v8;
    v15 = &v18;
    v16 = a1;
    v17 = a4;
    objc_msgSend(v13, "performBlockAndWait:", v12);
    v10 = (id)v19[5];

    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __58__MTRecencyUtil_upNextForPodcastUuid_excludeExplicit_ctx___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "podcastForUuid:", *(_QWORD *)(a1 + 40));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "hidden") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 56), "_upNextForPodcast:serial:excludeExplicit:ctx:", v5, objc_msgSend(v5, "playbackNewestToOldest") ^ 1, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

+ (id)_upNextForPodcast:(id)a3 serial:(BOOL)a4 excludeExplicit:(int64_t)a5 ctx:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  MTUpNextResult *v12;
  MTUpNextResult *v13;
  void *v14;
  MTUpNextResult *v15;
  int v16;
  MTUpNextResult *v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  BOOL v26;
  double v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  uint64_t v34;
  void *v35;
  double v36;
  _UNKNOWN **v37;
  double v38;
  double v39;
  double v40;
  double v41;
  MTUpNextResult *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  void *v48;
  void *v50;
  int v51;
  void *v52;
  void *v53;

  v8 = a4;
  v10 = a3;
  v11 = a6;
  if ((objc_msgSend(v10, "shouldBeHiddenFromUpNext") & 1) == 0)
  {
    v13 = objc_alloc_init(MTUpNextResult);
    v14 = (void *)objc_opt_new();
    objc_msgSend(v14, "setExcludeExplicit:", a5);
    objc_msgSend(v14, "setExcludeUnentitled:", 1);
    objc_msgSend(v14, "setExcludeGhostEpisodes:", 1);
    if ((objc_msgSend(v10, "subscribed") & 1) != 0)
      goto LABEL_4;
    if (!os_feature_enabled_unfollowed_shows_in_up_next())
    {
      v12 = 0;
LABEL_51:

      goto LABEL_52;
    }
    objc_msgSend(a1, "_upNextResultForUnfollowedPodcast:filter:ctx:", v10, v14, v11);
    v17 = (MTUpNextResult *)objc_claimAutoreleasedReturnValue();
    v15 = v17;
    if (v17)
    {
      v15 = v17;
      v12 = v15;
    }
    else
    {
      objc_msgSend(v10, "lastDatePlayed");
      v39 = v38;
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      if (v39 >= v40 + -7776000.0)
      {
        objc_msgSend(v10, "showTypeInFeed");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = 0;
        if (!v50)
          goto LABEL_50;
        v8 = objc_msgSend(v10, "isSerialShowTypeInFeed");
LABEL_4:
        objc_msgSend(v10, "mostRecentlyPlayedEpisodeWithFilter:", v14);
        v15 = (MTUpNextResult *)objc_claimAutoreleasedReturnValue();
        if ((-[MTUpNextResult isUnplayed](v15, "isUnplayed") & 1) != 0)
          v16 = 1;
        else
          v16 = -[MTUpNextResult isPlayheadPartiallyPlayed](v15, "isPlayheadPartiallyPlayed");
        -[MTUpNextResult lastDatePlayed](v15, "lastDatePlayed");
        if (v18 <= 0.0)
          objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        else
          -[MTUpNextResult lastDatePlayed](v15, "lastDatePlayed");
        v20 = v19;
        +[MTRecencyUtil _nextEpisodeForUnplayedPodcast:serial:filter:ctx:](MTRecencyUtil, "_nextEpisodeForUnplayedPodcast:serial:filter:ctx:", v10, v8, v14, v11);
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = (void *)v21;
        if ((v8 & 1) != 0)
        {
          if (v15)
          {
            v51 = v16;
            v53 = (void *)v21;
            objc_msgSend(v10, "highestNumberedEpisodePublishedBefore:filter:", v14, v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = 0;
LABEL_25:
            objc_msgSend(a1, "caughtUpNextEpisodeForPodcast:nextEpisodeForUnplayedShow:mostRecentlyPlayedLastDatePlayed:serial:filter:", v10, v53, v8, v14, v20);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = v23;
            if (objc_msgSend(v23, "isVisuallyPlayed") && v31)
            {
              -[MTUpNextResult updateFor:](v13, "updateFor:", v31);
              v30 = v24;
              if ((_DWORD)v8)
                v32 = v31;
              else
                v32 = v24;
              objc_msgSend(v32, "pubDate");
              if (v20 >= v41)
                v41 = v20;
              v42 = v13;
            }
            else
            {
              v30 = v24;
              if (!v51 || (v8 & 1) == 0 && (objc_msgSend(v31, "firstTimeAvailable"), v20 < v33))
              {
                objc_msgSend(a1, "nextEpisodeForPodcast:mostRecentlyPlayed:caughtUpNextEpisode:serial:filter:", v10, v15, v31, v8, v14);
                v34 = objc_claimAutoreleasedReturnValue();
                if (!v34)
                {
                  v12 = 0;
                  v48 = v52;
                  v22 = v53;
                  goto LABEL_48;
                }
                v35 = (void *)v34;
                -[MTUpNextResult updateFor:](v13, "updateFor:", v34);
                if ((v8 & 1) == 0)
                {
                  objc_msgSend(v24, "pubDate");
                  if (v36 >= v20)
                    v20 = v36;
                }
                v22 = v53;
                -[MTUpNextResult setModifiedDate:](v13, "setModifiedDate:", v20);
                -[MTUpNextResult modifiedDate](v13, "modifiedDate");
                v37 = &off_1E54CF000;
                +[MTRecencyUtil scoreFromModifiedDate:](MTRecencyUtil, "scoreFromModifiedDate:");
                -[MTUpNextResult setModifiedDateScore:](v13, "setModifiedDateScore:");

LABEL_47:
                v43 = v37[443];
                -[MTUpNextResult modifiedDate](v13, "modifiedDate");
                v45 = v44;
                -[MTUpNextResult lastDatePlayed](v15, "lastDatePlayed");
                objc_msgSend(v43, "_upNextScoreWithLastModifiedDate:lastDatePlayed:filter:podcast:ctx:", v14, v10, v11, v45, v46);
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                -[MTUpNextResult setUpNextScore:](v13, "setUpNextScore:", v47);
                v12 = v13;

                v48 = v52;
LABEL_48:

                goto LABEL_49;
              }
              -[MTUpNextResult updateFor:](v13, "updateFor:", v15);
              v42 = v13;
              v41 = v20;
            }
            -[MTUpNextResult setModifiedDate:](v42, "setModifiedDate:", v41);
            v37 = &off_1E54CF000;
            -[MTUpNextResult modifiedDate](v13, "modifiedDate");
            +[MTRecencyUtil scoreFromModifiedDate:](MTRecencyUtil, "scoreFromModifiedDate:");
            -[MTUpNextResult setModifiedDateScore:](v13, "setModifiedDateScore:");
            v22 = v53;
            goto LABEL_47;
          }
          v30 = 0;
        }
        else
        {
          -[MTUpNextResult lastDatePlayed](v15, "lastDatePlayed");
          v26 = v25 <= 0.0;
          v27 = v20;
          if (v26)
            objc_msgSend(v10, "addedDate", v20);
          v51 = v16;
          objc_msgSend(v10, "episodesPublishedAfter:filter:limit:sortAsc:", v14, 4, 0, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v28, "count") < 4)
          {
            v29 = v22;
          }
          else
          {
            objc_msgSend(v28, "objectAtIndexedSubscript:", 2);
            v29 = (id)objc_claimAutoreleasedReturnValue();
          }
          v30 = v29;

          if (v15)
          {
            v53 = v22;
            v24 = v30;
            objc_msgSend(v10, "episodePublishedBefore:filter:", v14, v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_25;
          }
        }
        objc_msgSend(a1, "_upNextResultForUnplayedFollowedPodcast:nextEpisodeForUnplayedShow:newestEpisodeWithShowBump:mostRecentlyPlayed:filter:serial:ctx:", v10, v22, v30, 0, v14, v8, v11);
        v12 = (MTUpNextResult *)objc_claimAutoreleasedReturnValue();
LABEL_49:

        goto LABEL_50;
      }
      v12 = 0;
    }
LABEL_50:

    goto LABEL_51;
  }
  v12 = 0;
LABEL_52:

  return v12;
}

+ (id)_upNextResultForUnfollowedPodcast:(id)a3 filter:(id)a4 ctx:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  MTUpNextResult *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (os_feature_enabled_unfollowed_shows_in_up_next())
  {
    objc_msgSend(v7, "mostRecentlyPlayedEpisodeWithFilter:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastDatePlayed");
    v12 = v11;
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v14 = v13;
    if (objc_msgSend(v10, "isPlayheadPartiallyPlayed") && v12 > v14 + -7776000.0)
    {
      v15 = objc_alloc_init(MTUpNextResult);
      -[MTUpNextResult updateFor:](v15, "updateFor:", v10);
      objc_msgSend(v10, "lastDatePlayed");
      -[MTUpNextResult setModifiedDate:](v15, "setModifiedDate:");
      -[MTUpNextResult modifiedDate](v15, "modifiedDate");
      +[MTRecencyUtil scoreFromModifiedDate:](MTRecencyUtil, "scoreFromModifiedDate:");
      -[MTUpNextResult setModifiedDateScore:](v15, "setModifiedDateScore:");
LABEL_12:

      goto LABEL_13;
    }
    if (objc_msgSend(v7, "savedEpisodesCount") >= 1)
    {
      +[MTRecencyUtil mostRecentlySavedUnplayedEpisodeForPodcast:filter:ctx:](MTRecencyUtil, "mostRecentlySavedUnplayedEpisodeForPodcast:filter:ctx:", v7, v8, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "lastBookmarkedDate");
        v19 = v18;
        objc_msgSend(v7, "lastDatePlayed");
        if (v19 > v20)
        {
          v15 = objc_alloc_init(MTUpNextResult);
          -[MTUpNextResult updateFor:](v15, "updateFor:", v17);
          objc_msgSend(v17, "lastBookmarkedDate");
          -[MTUpNextResult setModifiedDate:](v15, "setModifiedDate:");
          -[MTUpNextResult modifiedDate](v15, "modifiedDate");
          +[MTRecencyUtil scoreFromModifiedDate:](MTRecencyUtil, "scoreFromModifiedDate:");
          -[MTUpNextResult setModifiedDateScore:](v15, "setModifiedDateScore:");

          goto LABEL_12;
        }
      }

    }
    v15 = 0;
    goto LABEL_12;
  }
  v15 = 0;
LABEL_13:

  return v15;
}

+ (id)_upNextResultForUnplayedFollowedPodcast:(id)a3 nextEpisodeForUnplayedShow:(id)a4 newestEpisodeWithShowBump:(id)a5 mostRecentlyPlayed:(id)a6 filter:(id)a7 serial:(BOOL)a8 ctx:(id)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  MTUpNextResult *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;

  v9 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  if (v15)
  {
    v17 = a9;
    v18 = a7;
    v19 = a6;
    v20 = objc_alloc_init(MTUpNextResult);
    -[MTUpNextResult updateFor:](v20, "updateFor:", v15);
    objc_msgSend(v14, "lastDatePlayed");
    if (v21 == 0.0)
    {
      if (v9)
      {
        objc_msgSend(v14, "addedDate");
        v23 = v22;
      }
      else
      {
        objc_msgSend(v16, "pubDate");
        v23 = v26;
        objc_msgSend(v14, "addedDate");
        if (v23 < v27)
          v23 = v27;
      }
    }
    else if (v9)
    {
      objc_msgSend(v15, "pubDate");
      v23 = v24;
      objc_msgSend(v14, "lastDatePlayed");
      if (v23 >= v25)
        v23 = v25;
    }
    else
    {
      objc_msgSend(v14, "lastDatePlayed");
      +[MTRecencyUtil _lastDatePlayedIfNotFutureDate:podcast:](MTRecencyUtil, "_lastDatePlayedIfNotFutureDate:podcast:", v14);
      v29 = v28;
      v23 = v28 + 259200.0;
      objc_msgSend(v15, "pubDate");
      if (v30 <= v23)
      {
        objc_msgSend(v15, "pubDate");
        if (v31 >= v29)
          v23 = v31;
        else
          v23 = v29;
      }
    }
    -[MTUpNextResult setModifiedDate:](v20, "setModifiedDate:", v23);
    -[MTUpNextResult modifiedDate](v20, "modifiedDate");
    v33 = v32;
    objc_msgSend(v19, "lastDatePlayed");
    v35 = v34;

    +[MTRecencyUtil _upNextScoreWithLastModifiedDate:lastDatePlayed:filter:podcast:ctx:](MTRecencyUtil, "_upNextScoreWithLastModifiedDate:lastDatePlayed:filter:podcast:ctx:", v18, v14, v17, v33, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    -[MTUpNextResult setUpNextScore:](v20, "setUpNextScore:", v36);
    -[MTUpNextResult modifiedDate](v20, "modifiedDate");
    +[MTRecencyUtil scoreFromModifiedDate:](MTRecencyUtil, "scoreFromModifiedDate:");
    -[MTUpNextResult setModifiedDateScore:](v20, "setModifiedDateScore:");

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (double)scoreFromModifiedDate:(double)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4 + -7776000.0;
  v6 = a3 - (v4 + -7776000.0);
  if (v6 >= 0.0)
    v7 = v6;
  else
    v7 = 0.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return v7 / (v8 - v5);
}

+ (id)caughtUpNextEpisodeForPodcast:(id)a3 nextEpisodeForUnplayedShow:(id)a4 mostRecentlyPlayedLastDatePlayed:(double)a5 serial:(BOOL)a6 filter:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a7;
  v14 = v13;
  if (v8)
  {
    objc_msgSend(v13, "filterExcludingPlayed");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowestNumberedEpisodePublishedAfter:filter:", v15, a5);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  else if (v12 && (objc_msgSend(v12, "isVisuallyPlayed") & 1) == 0)
  {
    v16 = v12;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)nextEpisodeForPodcast:(id)a3 mostRecentlyPlayed:(id)a4 caughtUpNextEpisode:(id)a5 serial:(BOOL)a6 filter:(id)a7
{
  _BOOL4 v8;
  id v11;
  void *v12;
  id v13;
  void *v14;

  v8 = a6;
  v11 = a5;
  v12 = v11;
  if (v8)
  {
    objc_msgSend(a3, "nextNumberedUnplayedEpisodeAfter:filter:", a4, a7);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = v11;
  }
  v14 = v13;

  return v14;
}

+ (void)unsafeUpdateRelatedFieldsIfUpNextChangedForPodcast:(id)a3 upNextResult:(id)a4 ctx:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "podcastForUuid:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "modifiedDate");
  objc_msgSend(v10, "setModifiedDate:");
  _MTLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "nextEpisodeUuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "episodeUuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v39 = v12;
    v40 = 2114;
    v41 = v13;
    _os_log_impl(&dword_1A904E000, v11, OS_LOG_TYPE_DEFAULT, "UpNext result updating podcast nextEpisodeUuid from %{public}@ to %{public}@", buf, 0x16u);

  }
  objc_msgSend(v10, "nextEpisodeUuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "episodeUuid");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v14 == (void *)v15)
  {

    goto LABEL_8;
  }
  v16 = (void *)v15;
  objc_msgSend(v10, "nextEpisodeUuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "episodeUuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v17, "isEqualToString:", v18);

  if ((v19 & 1) == 0)
  {
    objc_msgSend(v8, "episodeUuid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(v8, "episodeUuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "episodeForUuid:", v21);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "setListenNowEpisode:", 1);
      objc_msgSend(v8, "modifiedDateScore");
      objc_msgSend(v14, "setModifiedDateScore:");
LABEL_8:

    }
  }
  +[MTEpisode predicateForListenNowForPodcastUuid:](MTEpisode, "predicateForListenNowForPodcastUuid:", v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "episodeUuid");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForEpisodeUuid:](MTEpisode, "predicateForEpisodeUuid:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "NOT");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "AND:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v26, 0, 0, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v29; ++i)
      {
        if (*(_QWORD *)v34 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v32, "setListenNowEpisode:", 0);
        objc_msgSend(v32, "setModifiedDateScore:", 0.0);
      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v29);
  }

}

+ (id)mostRecentlySavedUnplayedEpisodeForPodcast:(id)a3 filter:(id)a4 ctx:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "predicateForPodcast:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "AND:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForBookmarkedEpisodesOnPodcastUuid:](MTEpisode, "predicateForBookmarkedEpisodesOnPodcastUuid:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "AND:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode sortDescriptorsForLastBookmarkedDateAscending:](MTEpisode, "sortDescriptorsForLastBookmarkedDateAscending:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v14, v15, 0, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)_nextEpisodeForUnplayedPodcast:(id)a3 serial:(BOOL)a4 filter:(id)a5 ctx:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v8 = a5;
  v9 = a3;
  v10 = objc_msgSend(v8, "episodeTypeFilter");
  if (a4)
  {
    objc_msgSend(v8, "setEpisodeTypeFilter:", 1);
    objc_msgSend(v9, "oldestEpisodeInLatestSeasonOrShowWithFilter:", v8);
  }
  else
  {
    objc_msgSend(v8, "setEpisodeTypeFilter:", 5);
    objc_msgSend(v9, "newestEpisodeWithFilter:", v8);
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setEpisodeTypeFilter:", v10);
  return v11;
}

+ (double)_lastDatePlayedIfNotFutureDate:(double)a3 podcast:(id)a4
{
  id v5;
  void *v6;
  int v7;
  double v8;
  double v9;

  v5 = a4;
  +[FutureDateChecker sharedInstance](_TtC18PodcastsFoundation17FutureDateChecker, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFutureWithTimestamp:", a3);

  if (v7)
  {
    objc_msgSend(v5, "lastDatePlayed");
    if (v8 <= 0.0)
      objc_msgSend(v5, "addedDate");
    else
      objc_msgSend(v5, "modifiedDate");
    a3 = v9;
  }

  return a3;
}

+ (void)setModifiedDateValuesOnScore:(id)a3 modifiedDate:(double)a4 modifiedDateWeight:(double)a5 total:(double)a6
{
  id v9;

  v9 = a3;
  +[MTRecencyUtil scoreFromModifiedDate:](MTRecencyUtil, "scoreFromModifiedDate:", a4);
  objc_msgSend(v9, "setModifiedDateScore:");
  objc_msgSend(v9, "setModifiedWeight:", a5 / a6);

}

+ (void)setPercentOfEpsFromShowPlayedValuesOnScore:(id)a3 podcast:(id)a4 ctx:(id)a5 percentEpsFromShowPlayedWeight:(double)a6 total:(double)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  id v33;

  v33 = a4;
  v11 = a5;
  v12 = a3;
  objc_msgSend(v33, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForHasAnyVisualPlayState](MTEpisode, "predicateForHasAnyVisualPlayState");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "AND:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "uuid");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v33, "isSerialShowTypeInFeed"))
  {
    v19 = objc_msgSend(v11, "countOfObjectsInEntity:predicate:", CFSTR("MTEpisode"), v16);
    v20 = objc_msgSend(v11, "countOfObjectsInEntity:predicate:", CFSTR("MTEpisode"), v18);
  }
  else
  {
    v21 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v33, "addedDate");
    objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTEpisode predicateForEpisodesPublishedAfterDate:](MTEpisode, "predicateForEpisodesPublishedAfterDate:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "AND:", v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v25 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v33, "addedDate");
    objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTEpisode predicateForEpisodesPublishedAfterDate:](MTEpisode, "predicateForEpisodesPublishedAfterDate:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "AND:", v27);
    v28 = objc_claimAutoreleasedReturnValue();

    +[MTEpisode sortDescriptorsForPubDateAscending:](MTEpisode, "sortDescriptorsForPubDateAscending:", 0);
    v29 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v28, v29, 0, 50);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v30, "count");
    objc_msgSend(v30, "filteredArrayUsingPredicate:", v24);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v31, "count");

    v11 = (id)v29;
    v18 = (void *)v28;
    v16 = (void *)v24;
  }

  if (v20)
    v32 = (double)v19 / (double)v20 * 100.0;
  else
    v32 = 0.0;
  objc_msgSend(v12, "setEpisodesFromShowTotalCount:");
  objc_msgSend(v12, "setEpisodesFromShowPlayedCount:", (double)v19);
  objc_msgSend(v12, "setEpisodesFromShowPlayedPercent:", v32);
  objc_msgSend(v12, "setEpisodesFromShowWeight:", a6 / a7);

}

+ (void)setPercentOfTotalListeningValuesOnScore:(id)a3 podcast:(id)a4 ctx:(id)a5 percentEpsTotalPlayedWeight:(double)a6 total:(double)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;

  v24 = a3;
  v11 = a5;
  v12 = a4;
  +[MTEpisode predicateForVisuallyPlayed:](MTEpisode, "predicateForVisuallyPlayed:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTEpisode sortDescriptorsForRecentlyPlayed](MTEpisode, "sortDescriptorsForRecentlyPlayed");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v13, v14, 0, 100);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setAllPlayedEpisodesCount:", (double)(unint64_t)objc_msgSend(v15, "count"));
  objc_msgSend(v12, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEpisode predicateForAllEpisodesOnPodcastUuid:](MTEpisode, "predicateForAllEpisodesOnPodcastUuid:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "filteredArrayUsingPredicate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "setAllPlayedEpisodesFromThisShowCount:", (double)(unint64_t)objc_msgSend(v18, "count"));
  objc_msgSend(v24, "allPlayedEpisodesCount");
  v19 = 0.0;
  if (v20 != 0.0)
  {
    objc_msgSend(v24, "allPlayedEpisodesFromThisShowCount");
    v22 = v21;
    objc_msgSend(v24, "allPlayedEpisodesCount");
    v19 = v22 / v23 * 100.0;
  }
  objc_msgSend(v24, "setAllPlayedEpsWeight:", a6 / a7);
  objc_msgSend(v24, "setAllPlayedEpsPercent:", v19);

}

+ (void)setCombinedScoreOnScore:(id)a3 total:(double)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v16 = a3;
  objc_msgSend(v16, "modifiedDateScore");
  v6 = v5;
  if (a4 > 0.0)
  {
    objc_msgSend(v16, "modifiedWeight");
    v8 = v6 * v7;
    objc_msgSend(v16, "episodesFromShowPlayedPercent");
    v10 = v9;
    objc_msgSend(v16, "episodesFromShowWeight");
    v12 = v8 + v10 * v11;
    objc_msgSend(v16, "allPlayedEpsPercent");
    v14 = v13;
    objc_msgSend(v16, "allPlayedEpsWeight");
    v6 = v12 + v14 * v15;
  }
  objc_msgSend(v16, "setCombinedScore:", v6);

}

+ (id)_upNextScoreWithLastModifiedDate:(double)a3 lastDatePlayed:(double)a4 filter:(id)a5 podcast:(id)a6 ctx:(id)a7
{
  id v10;
  id v11;
  MTUpNextScorePrototype *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;

  v10 = a6;
  v11 = a7;
  if (os_feature_enabled_prototype_up_next())
  {
    v12 = objc_alloc_init(MTUpNextScorePrototype);
    objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSettingsUserDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleForKey:", CFSTR("MTUpNextScoreModifiedDateWeight"));
    v15 = v14;

    objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSettingsUserDefaults");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleForKey:", CFSTR("MTUpNextScorePercentEpsFromShowPlayedWeight"));
    v18 = v17;

    objc_msgSend(MEMORY[0x1E0C99EA0], "_applePodcastsFoundationSettingsUserDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleForKey:", CFSTR("MTUpNextScorePercentEpsTotalPlayedWeight"));
    v21 = v20;

    objc_msgSend(a1, "setModifiedDateValuesOnScore:modifiedDate:modifiedDateWeight:total:", v12, a3, v15, v15 + v18 + v21);
    objc_msgSend(a1, "setPercentOfEpsFromShowPlayedValuesOnScore:podcast:ctx:percentEpsFromShowPlayedWeight:total:", v12, v10, v11, v18, v15 + v18 + v21);
    objc_msgSend(a1, "setPercentOfTotalListeningValuesOnScore:podcast:ctx:percentEpsTotalPlayedWeight:total:", v12, v10, v11, v21, v15 + v18 + v21);
    objc_msgSend(a1, "setCombinedScoreOnScore:total:", v12, v15 + v18 + v21);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)episodesForListenNowWithContext:(id)a3 limit:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__7;
  v17 = __Block_byref_object_dispose__7;
  v18 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__MTRecencyUtil_episodesForListenNowWithContext_limit___block_invoke;
  v9[3] = &unk_1E54D1998;
  v11 = &v13;
  v6 = v5;
  v10 = v6;
  v12 = a4;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __55__MTRecencyUtil_episodesForListenNowWithContext_limit___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)a1[4];
  +[MTEpisode predicateForListenNow](MTEpisode, "predicateForListenNow");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[MTEpisode sortDescriptorsForListenNow](MTEpisode, "sortDescriptorsForListenNow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", CFSTR("MTEpisode"), v7, v3, 0, a1[6]);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

@end
