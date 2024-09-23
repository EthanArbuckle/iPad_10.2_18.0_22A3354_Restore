@implementation MTPodcast

+ (id)predicateForSyncablePodcastsForSyncType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "predicateForNotHiddenNotImplicitlyFollowedPodcasts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForSubscriptionSyncType:](MTPodcast, "predicateForSubscriptionSyncType:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AND:", v5));

  return v6;
}

+ (id)predicateForSubscriptionSyncType:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = kPodcastDisplayType;
  v5 = NSPersistentStringForMTDisplayType(0, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v8 = NSPersistentStringForMTDisplayType(2, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == %@) || (%K == %@) || (%K == NULL)"), v4, v6, v4, v9, v4));

  if (a3 == 1)
  {
    v12 = NSPersistentStringForMTDisplayType(1, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K == %@"), v4, v13));

  }
  else
  {
    v14 = v10;
  }

  return v14;
}

- (void)markPlaylistsForUpdate
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast playlistSettings](self, "playlistSettings", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v7, "setNeedsUpdate:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "playlist"));
        objc_msgSend(v8, "setNeedsUpdate:", 1);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)setDeletePlayedEpisodes:(int64_t)a3
{
  uint64_t v5;
  void *v6;

  v5 = kPodcastDeletePlayedEpisodes;
  -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastDeletePlayedEpisodes);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
  -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v6, v5);

  -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v5);
  -[MTPodcast markPlaylistsForUpdate](self, "markPlaylistsForUpdate");
}

- (void)setLastImplicitlyFollowedDate:(double)a3
{
  double v5;
  uint64_t v6;
  void *v7;

  -[MTPodcast lastImplicitlyFollowedDate](self, "lastImplicitlyFollowedDate");
  if (v5 < a3)
  {
    v6 = kPodcastLastImplicitlyFollowedDate;
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastLastImplicitlyFollowedDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3));
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, v6);

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v6);
  }
}

- (void)setModifiedDate:(double)a3
{
  void *v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FutureDateChecker lenientSharedInstance](_TtC18PodcastsFoundation17FutureDateChecker, "lenientSharedInstance"));
  objc_msgSend(v5, "timestampBoundByNow:", a3);
  v7 = v6;

  v8 = kPodcastModifiedDate;
  -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastModifiedDate);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v7));
  -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);

  -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v8);
}

- (void)setAuthor:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  unint64_t v9;

  v9 = (unint64_t)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[MTPodcast author](self, "author"));
  v5 = v9 | v4;

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast author](self, "author"));
    v7 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = kPodcastAuthor;
      -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastAuthor);
      -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);
      -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v8);
    }
  }

}

- (void)setItemDescription:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  unint64_t v9;

  v9 = (unint64_t)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[MTPodcast itemDescription](self, "itemDescription"));
  v5 = v9 | v4;

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast itemDescription](self, "itemDescription"));
    v7 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = kPodcastDescription;
      -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastDescription);
      -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);
      -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v8);
    }
  }

}

- (void)setFeedChangedDate:(double)a3
{
  double v5;
  uint64_t v6;
  void *v7;

  -[MTPodcast feedChangedDate](self, "feedChangedDate");
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    v6 = kPodcastFeedChangedDate;
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastFeedChangedDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a3));
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, v6);

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v6);
  }
}

- (void)setUpdateStdDev:(double)a3
{
  double v5;
  uint64_t v6;
  void *v7;

  -[MTPodcast updateStdDev](self, "updateStdDev");
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    v6 = kPodcastUpdateStdDev;
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastUpdateStdDev);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, v6);

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v6);
  }
}

- (void)setUpdateAvg:(double)a3
{
  double v5;
  uint64_t v6;
  void *v7;

  -[MTPodcast updateAvg](self, "updateAvg");
  if (vabdd_f64(v5, a3) > 2.22044605e-16)
  {
    v6 = kPodcastUpdateAvg;
    -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastUpdateAvg);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, v6);

    -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v6);
  }
}

- (void)setImageURL:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  unint64_t v9;

  v9 = (unint64_t)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[MTPodcast imageURL](self, "imageURL"));
  v5 = v9 | v4;

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast imageURL](self, "imageURL"));
    v7 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = kPodcastImageUrl;
      -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastImageUrl);
      -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);
      -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v8);
    }
  }

}

- (void)setShowTypeInFeed:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  unint64_t v9;

  v9 = (unint64_t)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[MTPodcast showTypeInFeed](self, "showTypeInFeed"));
  v5 = v9 | v4;

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast showTypeInFeed](self, "showTypeInFeed"));
    v7 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = kPodcastShowTypeInFeed;
      -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastShowTypeInFeed);
      -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);
      -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v8);
    }
  }

}

- (void)setWebpageURL:(id)a3
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  unint64_t v9;

  v9 = (unint64_t)a3;
  v4 = objc_claimAutoreleasedReturnValue(-[MTPodcast webpageURL](self, "webpageURL"));
  v5 = v9 | v4;

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast webpageURL](self, "webpageURL"));
    v7 = objc_msgSend(v6, "isEqualToString:", v9);

    if ((v7 & 1) == 0)
    {
      v8 = kPodcastWebpageURL;
      -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastWebpageURL);
      -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v9, v8);
      -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v8);
    }
  }

}

- (BOOL)isValidShowTypeSetting:(int64_t)a3
{
  return ((unint64_t)a3 < 5) & (0x16u >> a3);
}

- (void)setShowTypeSetting:(int64_t)a3
{
  unsigned __int8 v5;
  uint64_t v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int v15;
  int64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;

  if (-[MTPodcast showTypeSetting](self, "showTypeSetting") != (id)a3)
  {
    v5 = -[MTPodcast isValidShowTypeSetting:](self, "isValidShowTypeSetting:", a3);
    v6 = _MTLogCategoryDatabase();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((v5 & 1) != 0)
    {
      if (v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self, "title"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast feedURL](self, "feedURL"));
        v11 = -[MTPodcast storeCollectionId](self, "storeCollectionId");
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self, "uuid"));
        v15 = 134350083;
        v16 = a3;
        v17 = 2113;
        v18 = v9;
        v19 = 2113;
        v20 = v10;
        v21 = 2049;
        v22 = v11;
        v23 = 2114;
        v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Switching show type setting to %{public}lld, show \"%{private}@\", %{private}@, %{private}lld, %{public}@", (uint8_t *)&v15, 0x34u);

      }
      v13 = kPodcastShowTypeSetting;
      -[MTPodcast willChangeValueForKey:](self, "willChangeValueForKey:", kPodcastShowTypeSetting);
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a3));
      -[MTPodcast setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v14, v13);

      -[MTPodcast didChangeValueForKey:](self, "didChangeValueForKey:", v13);
      -[MTPodcast applyShowTypeSetting:](self, "applyShowTypeSetting:", a3);
    }
    else
    {
      if (v8)
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "WARNING: Ignoring attempt to set an invalid show type", (uint8_t *)&v15, 2u);
      }

    }
  }
}

- (void)applyShowTypeSetting:(int64_t)a3
{
  id v4;
  int v5;

  v4 = +[MTPodcast sortOrderAscForShowType:](MTPodcast, "sortOrderAscForShowType:", a3);
  v5 = (int)v4;
  -[MTPodcast setSortAscending:](self, "setSortAscending:", v4);
  -[MTPodcast setPlaybackNewestToOldest:](self, "setPlaybackNewestToOldest:", v5 ^ 1u);
}

- (void)setSortAscending:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;

  v3 = a3;
  v5 = _MTLogCategoryDatabase(self, a2);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if (v3)
      v7 = CFSTR("true");
    else
      v7 = CFSTR("false");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast title](self, "title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast feedURL](self, "feedURL"));
    v10 = -[MTPodcast storeCollectionId](self, "storeCollectionId");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self, "uuid"));
    v15 = 138544387;
    v16 = v7;
    v17 = 2113;
    v18 = v8;
    v19 = 2113;
    v20 = v9;
    v21 = 2049;
    v22 = v10;
    v23 = 2114;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Switching SortAscendingFlag to %{public}@, show \"%{private}@\", %{private}@, %{private}lld, %{public}@", (uint8_t *)&v15, 0x34u);

  }
  v12 = (unint64_t)-[MTPodcast flags](self, "flags");
  if (((((v12 & 2) == 0) ^ v3) & 1) == 0)
  {
    v13 = 2;
    if (!v3)
      v13 = 0;
    -[MTPodcast setFlags:](self, "setFlags:", v12 & 0xFFFFFFFFFFFFFFFDLL | v13);
    -[MTPodcast markPlaylistsForUpdate](self, "markPlaylistsForUpdate");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    objc_msgSend(v14, "markSubscriptionSyncDirty:for:", 1, -[MTPodcast syncType](self, "syncType"));

  }
}

- (BOOL)sortAscending
{
  return ((unint64_t)-[MTPodcast flags](self, "flags") >> 1) & 1;
}

+ (id)allPossibleEpisodeListSortOrderProperties
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
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
  id v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  _QWORD v23[4];

  v19 = objc_alloc((Class)NSMutableArray);
  v21 = kEpisodePubDate;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:"));
  v23[0] = v2;
  v3 = kEpisodeEpisodeNumber;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeEpisodeNumber, 1));
  v23[1] = v4;
  v5 = kEpisodeLevel;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeLevel, 0));
  v23[2] = v6;
  v7 = kEpisodeTitle;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", kEpisodeTitle, 1, "localizedStandardCompare:"));
  v23[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));
  v20 = objc_msgSend(v19, "initWithArray:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", v21, 0));
  v22[0] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", v3, 0));
  v22[1] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", v5, 1));
  v22[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", v7, 1, "localizedStandardCompare:"));
  v22[3] = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v22, 4));
  objc_msgSend(v20, "addObjectsFromArray:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "mt_compactMap:", &stru_100014610));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allObjects"));

  return v17;
}

- (id)sortDescriptorsForSortOrder
{
  unsigned __int8 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  _QWORD v14[4];

  if (-[MTPodcast isSerialShowTypeInFeed](self, "isSerialShowTypeInFeed"))
    return (id)objc_claimAutoreleasedReturnValue(-[MTPodcast seasonSortDescriptorsForSortOrder](self, "seasonSortDescriptorsForSortOrder"));
  v4 = -[MTPodcast sortAscending](self, "sortAscending");
  v5 = objc_alloc((Class)NSMutableArray);
  if ((v4 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodePubDate, 1));
    v14[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeEpisodeNumber, 1));
    v14[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeLevel, 0));
    v14[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", kEpisodeTitle, 1, "localizedStandardCompare:"));
    v14[3] = v9;
    v10 = v14;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodePubDate, 0));
    v13[0] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeEpisodeNumber, 0));
    v13[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeLevel, 1));
    v13[2] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", kEpisodeTitle, 1, "localizedStandardCompare:"));
    v13[3] = v9;
    v10 = v13;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v10, 4));
  v12 = objc_msgSend(v5, "initWithArray:", v11);

  return v12;
}

- (id)seasonSortDescriptorsForSortOrder
{
  return +[MTEpisode seasonSortDescriptors:](MTEpisode, "seasonSortDescriptors:", -[MTPodcast showTypeSetting](self, "showTypeSetting"));
}

+ (id)sortDescriptorsForOldestOnTop
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodePubDate, 1));
  v8[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeEpisodeNumber, 1));
  v8[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeLevel, 0));
  v8[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", kEpisodeTitle, 1, "localizedStandardCompare:"));
  v8[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 4));

  return v6;
}

+ (id)sortDescriptorsForNewestOnTop
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodePubDate, 0));
  v8[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeEpisodeNumber, 0));
  v8[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeLevel, 1));
  v8[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:selector:](NSSortDescriptor, "sortDescriptorWithKey:ascending:selector:", kEpisodeTitle, 1, "localizedStandardCompare:"));
  v8[3] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 4));

  return v6;
}

- (id)sortDescriptorsForPlayOrder
{
  void *v3;

  if ((-[MTPodcast isSerialShowTypeInFeed](self, "isSerialShowTypeInFeed") & 1) != 0)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast sortDescriptorsForPlayOrderByEpisodeNumber](self, "sortDescriptorsForPlayOrderByEpisodeNumber"));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast sortDescriptorsForPlayOrderByPubDate](self, "sortDescriptorsForPlayOrderByPubDate"));
  return v3;
}

- (id)sortDescriptorsForPlayOrderByPubDate
{
  id v3;
  void *v4;

  v3 = -[MTPodcast playbackNewestToOldest](self, "playbackNewestToOldest");
  v4 = (void *)objc_opt_class(self);
  return _objc_msgSend(v4, "sortDescriptorsForNewestToOldest:", v3);
}

- (id)sortDescriptorsForPlayOrderByEpisodeNumber
{
  return +[MTEpisode seasonSortDescriptors:](MTEpisode, "seasonSortDescriptors:", -[MTPodcast showTypeSetting](self, "showTypeSetting"));
}

- (void)setPlaybackNewestToOldest:(BOOL)a3
{
  int v3;
  unsigned int v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = a3;
  v5 = -[MTPodcast playbackNewestToOldest](self, "playbackNewestToOldest");
  v6 = (unint64_t)-[MTPodcast flags](self, "flags");
  if (((((v6 & 8) == 0) ^ v3) & 1) == 0)
  {
    v7 = 8;
    if (!v3)
      v7 = 0;
    -[MTPodcast setFlags:](self, "setFlags:", v6 & 0xFFFFFFFFFFFFFFF7 | v7);
    -[MTPodcast markPlaylistsForUpdate](self, "markPlaylistsForUpdate");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[SyncKeysRepository shared](_TtC18PodcastsFoundation18SyncKeysRepository, "shared"));
    objc_msgSend(v8, "markSubscriptionSyncDirty:for:", 1, -[MTPodcast syncType](self, "syncType"));

    if (v5 != v3)
      -[MTPodcast updateCursorPosition:](self, "updateCursorPosition:", 0);
  }
}

- (BOOL)updateCursorPosition:(BOOL)a3
{
  id v4;
  char v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  BOOL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100006E1C;
  v7[3] = &unk_100014638;
  v7[4] = self;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcast managedObjectContext](self, "managedObjectContext"));
  v8 = v4;
  v9 = &v11;
  v10 = a3;
  objc_msgSend(v4, "performBlockAndWait:", v7);
  v5 = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v5;
}

+ (id)podcastUuidForFeedUrlString:(id)a3 ctx:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = sub_1000071E4;
    v17 = sub_1000071F4;
    v18 = 0;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000071FC;
    v9[3] = &unk_100014660;
    v10 = v6;
    v11 = v5;
    v12 = &v13;
    objc_msgSend(v10, "performBlockAndWait:", v9);
    v7 = (id)v14[5];

    _Block_object_dispose(&v13, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)podcastUuidForFeedUrl:(id)a3 ctx:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "absoluteString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "podcastUuidForFeedUrlString:ctx:", v7, v6));

  return v8;
}

- (id)smartPlayEpisode
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if ((-[MTPodcast subscribed](self, "subscribed") & 1) != 0
    || !-[MTPodcast isSerialShowTypeInFeed](self, "isSerialShowTypeInFeed")
    || (uint64_t)-[MTPodcast latestSeasonNumber](self, "latestSeasonNumber") < 1
    || (-[MTPodcast lastDatePlayed](self, "lastDatePlayed"), v3 != 0.0)
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast seasonTrailerInSeason:](self, "seasonTrailerInSeason:", -[MTPodcast latestSeasonNumber](self, "latestSeasonNumber")))) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast nextEpisodeUuid](self, "nextEpisodeUuid"));

    if (!v5
      || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast managedObjectContext](self, "managedObjectContext")),
          v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast nextEpisodeUuid](self, "nextEpisodeUuid")),
          v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "episodeForUuid:", v7)),
          v7,
          v6,
          !v4))
    {
      v8 = (void *)objc_opt_new(MTPodcastEpisodeFilter);
      objc_msgSend(v8, "setExcludeUnentitled:", 1);
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast newestEpisodeWithFilter:](self, "newestEpisodeWithFilter:", v8));

    }
  }
  return v4;
}

- (id)_fetchRequestForDistinctSeasons
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  uint64_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast uuid](self, "uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodesWithSeasonNumbersOnPodcastUuid:](MTEpisode, "predicateForEpisodesWithSeasonNumbersOnPodcastUuid:", v2));

  v4 = kEpisodeSeasonNumber;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kEpisodeSeasonNumber, 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", kMTEpisodeEntityName));
  objc_msgSend(v6, "setResultType:", 2);
  v11 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  objc_msgSend(v6, "setPropertiesToFetch:", v7);

  objc_msgSend(v6, "setReturnsDistinctResults:", 1);
  objc_msgSend(v6, "setPredicate:", v3);
  v10 = v5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  objc_msgSend(v6, "setSortDescriptors:", v8);

  return v6;
}

- (BOOL)hasAtLeastOneSeason
{
  id v2;
  char v3;
  _QWORD v5[5];
  id v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000075DC;
  v5[3] = &unk_100014688;
  v5[4] = self;
  v7 = &v8;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcast managedObjectContext](self, "managedObjectContext"));
  v6 = v2;
  objc_msgSend(v2, "performBlockAndWait:", v5);
  v3 = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return v3;
}

- (BOOL)hasMultipleSeasons
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast seasonNumbers](self, "seasonNumbers"));
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (id)seasonNumbers
{
  id v3;
  id v4;
  _QWORD v6[5];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = sub_1000071E4;
  v13 = sub_1000071F4;
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSArray array](NSArray, "array"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007804;
  v6[3] = &unk_100014660;
  v6[4] = self;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[MTPodcast managedObjectContext](self, "managedObjectContext"));
  v7 = v3;
  v8 = &v9;
  objc_msgSend(v3, "performBlockAndWait:", v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

- (id)seasonTrailerInSeason:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  MTPodcast *v14;
  id v15;
  uint64_t *v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = (void *)objc_opt_new(MTPodcastEpisodeFilter);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = sub_1000071E4;
  v22 = sub_1000071F4;
  v23 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast managedObjectContext](self, "managedObjectContext"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000079E4;
  v12[3] = &unk_1000146B0;
  v7 = v5;
  v13 = v7;
  v14 = self;
  v16 = &v18;
  v17 = a3;
  v8 = v6;
  v15 = v8;
  objc_msgSend(v8, "performBlockAndWait:", v12);
  v9 = (void *)v19[5];
  if (v9)
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  else
    v10 = 0;

  _Block_object_dispose(&v18, 8);
  return v10;
}

- (id)bestDescription
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPodcast itemDescription](self, "itemDescription"));
  if (objc_msgSend(v2, "hasHTML"))
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringBySmartlyStrippingHTML"));

    v2 = (void *)v3;
  }
  return v2;
}

@end
