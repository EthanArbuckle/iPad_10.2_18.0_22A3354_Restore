@implementation MTCoreSpotlightUtil

+ (void)prepareSearchableItemForObject:(id)a3 annotator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t isKindOfClass;
  uint64_t v16;
  NSObject *v17;
  int v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = objc_autoreleasePoolPush();
  v12 = objc_opt_class(MTPodcast);
  if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0)
  {
    objc_msgSend(a1, "prepareSearchableItemForPodcast:annotator:completion:", v8, v9, v10);
  }
  else
  {
    v13 = objc_opt_class(MTEpisode);
    if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
    {
      objc_msgSend(a1, "prepareSearchableItemForEpisode:annotator:completion:", v8, v9, v10);
    }
    else
    {
      v14 = objc_opt_class(MTPlaylist);
      isKindOfClass = objc_opt_isKindOfClass(v8, v14);
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(a1, "prepareSearchableItemForStation:annotator:completion:", v8, v9, v10);
      }
      else
      {
        v16 = _MTLogCategorySpotlight(isKindOfClass);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18 = 138412290;
          v19 = v8;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Invalid object, can not index %@", (uint8_t *)&v18, 0xCu);
        }

        v10[2](v10, 0);
      }
    }
  }
  objc_autoreleasePoolPop(v11);

}

+ (void)prepareSearchableItemsForObjectInArray:(id)a3 annotator:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  dispatch_group_t v11;
  id v12;
  NSObject *v13;
  _QWORD *v14;
  _QWORD *v15;
  NSObject *v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  id v19;
  _QWORD block[4];
  id v21;
  id v22;
  _QWORD v23[4];
  dispatch_group_t v24;
  id v25;
  id v26;
  _QWORD v27[4];
  dispatch_queue_t v28;
  id v29;

  v7 = a4;
  v8 = a5;
  if (v8)
  {
    v9 = a3;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v11 = dispatch_group_create();
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000B894;
    v27[3] = &unk_100014B38;
    v28 = dispatch_queue_create(0, 0);
    v12 = v10;
    v29 = v12;
    v13 = v28;
    v14 = objc_retainBlock(v27);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_10000B934;
    v23[3] = &unk_100014B88;
    v24 = v11;
    v25 = v7;
    v26 = v14;
    v15 = v14;
    v16 = v11;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v23);

    global_queue = dispatch_get_global_queue(-32768, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000BA28;
    block[3] = &unk_100014BB0;
    v21 = v12;
    v22 = v8;
    v19 = v12;
    dispatch_group_notify(v16, v18, block);

  }
}

+ (id)uniqueIdentifierForObject:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;

  v4 = a3;
  v5 = objc_opt_class(MTPodcast);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
  {
    v8 = objc_opt_class(MTEpisode);
    if ((objc_opt_isKindOfClass(v4, v8) & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "guid"));
      v10 = v9;
      if (v9)
        v7 = v9;
      else
        v7 = &stru_1000150C8;
      v13 = CFSTR("e");
    }
    else
    {
      v11 = objc_opt_class(MTPlaylist);
      if ((objc_opt_isKindOfClass(v4, v11) & 1) == 0)
      {
        v6 = 0;
        goto LABEL_3;
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "uuid"));
      v10 = v12;
      if (v12)
        v7 = v12;
      else
        v7 = &stru_1000150C8;
      v13 = CFSTR("s");
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v13, "stringByAppendingString:", v7));

    goto LABEL_16;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_uniqueIdentifierForPodcast:", v4));
LABEL_3:
  v7 = &stru_1000150C8;
LABEL_16:

  return v6;
}

+ (id)fetchRequestForIndexType:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fetchRequestForIndexType:additionalPredicate:", v3, v5));

  return v6;
}

+ (void)configureArtworkForSearchableItemAttributeSet:(id)a3 withPodcastUuid:(id)a4 completion:(id)a5
{
  id v6;
  id v7;
  _QWORD *v8;
  void *v9;
  _QWORD v10[4];
  _QWORD *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;

  v6 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000BCEC;
  v13[3] = &unk_100014BD8;
  v7 = a5;
  v14 = v7;
  v8 = objc_retainBlock(v13);
  if (objc_msgSend(v6, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTImageStore defaultStore](MTImageStore, "defaultStore"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000BD00;
    v10[3] = &unk_100014C28;
    v11 = v8;
    v12 = 0x4056800000000000;
    objc_msgSend(v9, "asyncImageURLForKey:squareDimension:cacheKeyModifier:completionHandler:", v6, 0, v10, 90.0);

  }
  else
  {
    ((void (*)(_QWORD *, _QWORD))v8[2])(v8, 0);
  }

}

+ (id)_uniqueIdentifierForPodcast:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentFeedURL"));
  v5 = v4;
  if (v4)
  {
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "absoluteString"));
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
    v8 = v7;
    if (v7)
      v6 = v7;
    else
      v6 = &stru_1000150C8;

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("p"), "stringByAppendingString:", v6));

  return v9;
}

+ (id)fetchRequestForIndexType:(int)a3 additionalPredicate:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  id v23;
  id v24;
  id v25;

  v5 = a4;
  if (a3 == 2)
  {
    v13 = objc_alloc((Class)NSFetchRequest);
    v7 = objc_msgSend(v13, "initWithEntityName:", kMTPlaylistEntityName);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MTPlaylist topLevelPlaylistsPredicate](MTPlaylist, "topLevelPlaylistsPredicate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "AND:", v5));
    objc_msgSend(v7, "setPredicate:", v15);

    v16 = objc_alloc((Class)NSSortDescriptor);
    v11 = objc_msgSend(v16, "initWithKey:ascending:", kPlaylistTitle, 1);
    v23 = v11;
    v12 = &v23;
  }
  else if (a3 == 1)
  {
    v17 = objc_alloc((Class)NSFetchRequest);
    v7 = objc_msgSend(v17, "initWithEntityName:", kMTEpisodeEntityName);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForPodcastIsNotHiddenNotImplicitlyFollowed](MTEpisode, "predicateForPodcastIsNotHiddenNotImplicitlyFollowed"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "AND:", v5));
    objc_msgSend(v7, "setPredicate:", v19);

    v20 = objc_alloc((Class)NSSortDescriptor);
    v11 = objc_msgSend(v20, "initWithKey:ascending:", kEpisodePubDate, 1);
    v24 = v11;
    v12 = &v24;
  }
  else
  {
    if (a3)
    {
      v7 = 0;
      goto LABEL_9;
    }
    v6 = objc_alloc((Class)NSFetchRequest);
    v7 = objc_msgSend(v6, "initWithEntityName:", kMTPodcastEntityName);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForNotHiddenNotImplicitlyFollowedPodcasts](MTPodcast, "predicateForNotHiddenNotImplicitlyFollowedPodcasts"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "AND:", v5));
    objc_msgSend(v7, "setPredicate:", v9);

    v10 = objc_alloc((Class)NSSortDescriptor);
    v11 = objc_msgSend(v10, "initWithKey:ascending:", kPodcastAddedDate, 1);
    v25 = v11;
    v12 = &v25;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 1, v23, v24, v25));
  objc_msgSend(v7, "setSortDescriptors:", v21);

LABEL_9:
  objc_msgSend(v7, "setFetchLimit:", 1);

  return v7;
}

+ (void)prepareSearchableItemForPodcast:(id)a3 annotator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = a4;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    v13 = objc_msgSend(objc_alloc((Class)CSSearchableItemAttributeSet), "initWithItemContentType:", kUTTypeAudiovisualContent);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    objc_msgSend(v13, "setExpirationDate:", v14);

    objc_msgSend(v13, "setDisplayName:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentFeedURL"));
    objc_msgSend(v13, "setContentURL:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bestDescription"));
    objc_msgSend(v13, "setContentDescription:", v16);

    objc_msgSend(v13, "setContentType:", CFSTR("com.apple.podcasts.show"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bestDescription"));
    objc_msgSend(v13, "setInformation:", v17);

    objc_msgSend(v8, "downloadedDate");
    if (v18 != 0.0)
    {
      objc_msgSend(v8, "downloadedDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
      objc_msgSend(v13, "setDownloadedDate:", v19);

    }
    objc_msgSend(v8, "lastTouchDate");
    if (v20 != 0.0)
    {
      objc_msgSend(v8, "lastTouchDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
      objc_msgSend(v13, "setLastUsedDate:", v21);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "author"));

    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "author"));
      v36 = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v36, 1));
      objc_msgSend(v13, "setAuthorNames:", v24);

    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueIdentifierForObject:", v8));
    v26 = objc_alloc_init((Class)CSSearchableItem);
    objc_msgSend(v26, "setUniqueIdentifier:", v25);
    objc_msgSend(v26, "setAttributeSet:", v13);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "annotateItem:withManagedObject:", v26, v8));

    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10000C428;
    v31[3] = &unk_100014C50;
    v32 = v27;
    v33 = v11;
    v34 = v12;
    v35 = v9;
    v28 = v12;
    v29 = v11;
    v30 = v27;
    objc_msgSend(a1, "configureArtworkForSearchableItemAttributeSet:withPodcastUuid:completion:", v13, v29, v31);

  }
}

+ (void)prepareSearchableItemForEpisode:(id)a3 annotator:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  void *v53;

  v8 = a3;
  v9 = a5;
  if (v9)
  {
    v10 = a4;
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uuid"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "title"));
    v12 = objc_msgSend(objc_alloc((Class)CSSearchableItemAttributeSet), "initWithItemContentType:", kUTTypeAudiovisualContent);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
    objc_msgSend(v12, "setExpirationDate:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bestTitle"));
    objc_msgSend(v12, "setDisplayName:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(v8, "playCount")));
    objc_msgSend(v12, "setPlayCount:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "podcast"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "title"));
    objc_msgSend(v12, "setContainerTitle:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bestSummary"));
    objc_msgSend(v12, "setContentDescription:", v18);

    objc_msgSend(v12, "setContentType:", CFSTR("com.apple.podcasts.episode"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bestSummary"));
    objc_msgSend(v12, "setInformation:", v19);

    objc_msgSend(v8, "duration");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v12, "setDuration:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "isDownloaded")));
    objc_msgSend(v12, "setLocal:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "externalType")));
    objc_msgSend(v12, "setStreamable:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v8, "isExplicit")));
    objc_msgSend(v12, "setContentRating:", v23);

    objc_msgSend(v8, "pubDate");
    if (v24 != 0.0)
    {
      objc_msgSend(v8, "pubDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
      objc_msgSend(v12, "setContentCreationDate:", v25);

    }
    objc_msgSend(v8, "downloadDate");
    if (v26 != 0.0)
    {
      objc_msgSend(v8, "downloadDate");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
      objc_msgSend(v12, "setDownloadedDate:", v27);

    }
    objc_msgSend(v8, "lastDatePlayed");
    if (v28 != 0.0)
    {
      objc_msgSend(v8, "lastDatePlayed");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
      objc_msgSend(v12, "setLastUsedDate:", v29);

    }
    if (!objc_msgSend(v8, "playState"))
    {
      objc_msgSend(v8, "lastDatePlayed");
      if (v30 != 0.0)
      {
        objc_msgSend(v8, "lastDatePlayed");
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
        objc_msgSend(v12, "setCompletionDate:", v31);

      }
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "author"));

    if (v32)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "author"));
      v53 = v33;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v53, 1));
      objc_msgSend(v12, "setAuthorNames:", v34);

    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetURL"));

    if (v35)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetURL"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v36));
      objc_msgSend(v12, "setContentURL:", v37);

    }
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueIdentifierForObject:", v8));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "podcast"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[MTCoreSpotlightUtil uniqueIdentifierForObject:](MTCoreSpotlightUtil, "uniqueIdentifierForObject:", v39));

    objc_msgSend(v12, "setRelatedUniqueIdentifier:", v40);
    objc_msgSend(v12, "setDomainIdentifier:", v40);
    v41 = objc_alloc_init((Class)CSSearchableItem);
    objc_msgSend(v41, "setUniqueIdentifier:", v38);
    objc_msgSend(v41, "setAttributeSet:", v12);
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "annotateItem:withManagedObject:", v41, v8));

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "podcastUuid"));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472;
    v48[2] = sub_10000CA1C;
    v48[3] = &unk_100014C50;
    v49 = v42;
    v50 = v47;
    v51 = v11;
    v52 = v9;
    v44 = v11;
    v45 = v47;
    v46 = v42;
    objc_msgSend(a1, "configureArtworkForSearchableItemAttributeSet:withPodcastUuid:completion:", v12, v43, v48);

  }
}

+ (void)prepareSearchableItemForStation:(id)a3 annotator:(id)a4 completion:(id)a5
{
  void (**v8)(id, void *);
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a3;
  v8 = (void (**)(id, void *))a5;
  v9 = a4;
  v10 = objc_msgSend(objc_alloc((Class)CSSearchableItemAttributeSet), "initWithItemContentType:", kUTTypeAudiovisualContent);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](NSDate, "distantFuture"));
  objc_msgSend(v10, "setExpirationDate:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "title"));
  objc_msgSend(v10, "setDisplayName:", v12);

  objc_msgSend(v10, "setContentType:", CFSTR("com.apple.podcasts.station"));
  objc_msgSend(v18, "generatedDate");
  if (v13 != 0.0)
  {
    objc_msgSend(v18, "generatedDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
    objc_msgSend(v10, "setContentCreationDate:", v14);

  }
  v15 = objc_alloc_init((Class)CSSearchableItem);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueIdentifierForObject:", v18));
  objc_msgSend(v15, "setUniqueIdentifier:", v16);

  objc_msgSend(v15, "setAttributeSet:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "annotateItem:withManagedObject:", v15, v18));

  v8[2](v8, v17);
}

@end
