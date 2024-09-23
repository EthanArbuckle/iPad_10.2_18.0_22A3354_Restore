@implementation BTAVRCP_PodcastsFolder

- (id)unplayedEpisodesFolderName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("UNPLAYED_EPISODES"), CFSTR("Unplayed Episodes"), 0));

  return v3;
}

- (id)baseQuery
{
  return +[MPMediaQuery podcastsQuery](MPMediaQuery, "podcastsQuery");
}

- (unint64_t)childrenCount
{
  void *v2;
  void *v3;
  char *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collections"));
  v4 = (char *)objc_msgSend(v3, "count") + 1;

  return (unint64_t)v4;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  BTAVRCP_PodcastItemsFolder *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BTAVRCP_PodcastItemsFolder *v16;
  void *v17;
  unsigned __int8 v18;

  if (-[BTAVRCP_VFSFolder uid](self, "uid") == a3)
  {
    v7 = [BTAVRCP_PodcastItemsFolder alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_PodcastsFolder unplayedEpisodesFolderName](self, "unplayedEpisodesFolderName"));
    *a4 = -[BTAVRCP_VFSFolder initWithName:uid:](v7, "initWithName:uid:", v8, a3);

    v9 = *a4;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", &__kCFBooleanFalse, MPMediaItemPropertyHasBeenPlayed));
    objc_msgSend(v9, "storePredicate:", v10);
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionWithUid:property:", a3, MPMediaItemPropertyPodcastPersistentID));

    if (!v10)
    {
      v18 = 9;
      goto LABEL_7;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "representativeItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForProperty:", MPMediaItemPropertyPodcastPersistentID));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "representativeItem"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "valueForProperty:", MPMediaItemPropertyPodcastTitle));

    v16 = -[BTAVRCP_VFSFolder initWithName:uid:]([BTAVRCP_PodcastItemsFolder alloc], "initWithName:uid:", v15, objc_msgSend(v13, "unsignedLongLongValue"));
    *a4 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v13, MPMediaItemPropertyPodcastPersistentID));
    -[BTAVRCP_VFSFolder storePredicate:](v16, "storePredicate:", v17);

  }
  v18 = 4;
LABEL_7:

  return v18;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (a3)
  {
    v5 = a3 - 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionAtIndex:", v5));

    if (!v7)
    {
      v12 = 0;
      goto LABEL_7;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "representativeItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForProperty:", MPMediaItemPropertyPodcastPersistentID));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "representativeItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", MPMediaItemPropertyPodcastTitle));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyFolderWithType:uid:name:](self, "replyFolderWithType:uid:name:", 1, v9, v11));

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[BTAVRCP_VFSFolder uid](self, "uid", 0, a4)));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_PodcastsFolder unplayedEpisodesFolderName](self, "unplayedEpisodesFolderName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyFolderWithType:uid:name:](self, "replyFolderWithType:uid:name:", 1, v7, v8));
  }

LABEL_7:
  return v12;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionWithUid:property:", a3, MPMediaItemPropertyPodcastPersistentID));

  if (v6)
    return &__NSDictionary0__struct;
  else
    return 0;
}

- (unsigned)playItemWithUid:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionWithUid:property:", a3, MPMediaItemPropertyPodcastPersistentID));

  if (v5)
    return 12;
  else
    return 9;
}

@end
