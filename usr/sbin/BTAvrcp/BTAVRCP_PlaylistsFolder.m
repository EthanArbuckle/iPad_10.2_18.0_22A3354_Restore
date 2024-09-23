@implementation BTAVRCP_PlaylistsFolder

- (BTAVRCP_PlaylistsFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  return -[BTAVRCP_PlaylistsFolder initWithName:uid:parentPlaylistID:isRecentlyAdded:](self, "initWithName:uid:parentPlaylistID:isRecentlyAdded:", a3, a4, &off_100019B08, 0);
}

- (BTAVRCP_PlaylistsFolder)initWithName:(id)a3 uid:(unint64_t)a4 parentPlaylistID:(id)a5 isRecentlyAdded:(BOOL)a6
{
  id v11;
  BTAVRCP_PlaylistsFolder *v12;
  BTAVRCP_PlaylistsFolder *v13;
  objc_super v15;

  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BTAVRCP_PlaylistsFolder;
  v12 = -[BTAVRCP_VFSFolder initWithName:uid:](&v15, "initWithName:uid:", a3, a4);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_parentPlaylistID, a5);
    v13->_isRecentlyAdded = a6;
  }

  return v13;
}

- (BOOL)showRecentlyAddedFolder
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[BTAVRCP_PlaylistsFolder isRecentlyAdded](self, "isRecentlyAdded"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_PlaylistsFolder parentPlaylistID](self, "parentPlaylistID"));
  if (objc_msgSend(v4, "isEqualToNumber:", &off_100019B08))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collections"));
    v3 = (unint64_t)objc_msgSend(v6, "count") > 1;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)playlistIsFolder:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForProperty:", MPMediaPlaylistPropertyIsFolder));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)baseQuery
{
  void *v3;
  void *v4;
  void *v5;

  if (-[BTAVRCP_PlaylistsFolder isRecentlyAdded](self, "isRecentlyAdded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery playlistsRecentlyAddedQuery](MPMediaQuery, "playlistsRecentlyAddedQuery"));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery playlistsQuery](MPMediaQuery, "playlistsQuery"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_PlaylistsFolder parentPlaylistID](self, "parentPlaylistID"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v4, MPMediaPlaylistPropertyParentPersistentID));
    objc_msgSend(v3, "addFilterPredicate:", v5);

  }
  return v3;
}

- (unint64_t)childrenCount
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collections"));
  v5 = objc_msgSend(v4, "count");

  return (unint64_t)v5 + -[BTAVRCP_PlaylistsFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder");
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  BTAVRCP_PlaylistsFolder *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BTAVRCP_PlaylistItemsFolder *v13;
  void *v14;

  if (-[BTAVRCP_VFSFolder uid](self, "uid") == a3
    && -[BTAVRCP_PlaylistsFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder"))
  {
    v7 = [BTAVRCP_PlaylistsFolder alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder recentlyAddedFolderName](self, "recentlyAddedFolderName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_PlaylistsFolder parentPlaylistID](self, "parentPlaylistID"));
    *a4 = -[BTAVRCP_PlaylistsFolder initWithName:uid:parentPlaylistID:isRecentlyAdded:](v7, "initWithName:uid:parentPlaylistID:isRecentlyAdded:", v8, a3, v9, 1);
LABEL_10:

    v12 = 4;
    goto LABEL_11;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionWithUid:property:", a3, MPMediaPlaylistPropertyPersistentID));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForProperty:", MPMediaPlaylistPropertyPersistentID));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForProperty:", MPMediaPlaylistPropertyName));
    if (-[BTAVRCP_PlaylistsFolder playlistIsFolder:](self, "playlistIsFolder:", v8))
    {
      *a4 = -[BTAVRCP_PlaylistsFolder initWithName:uid:parentPlaylistID:isRecentlyAdded:]([BTAVRCP_PlaylistsFolder alloc], "initWithName:uid:parentPlaylistID:isRecentlyAdded:", v11, objc_msgSend(v9, "unsignedLongLongValue"), v9, 0);
    }
    else
    {
      v13 = -[BTAVRCP_VFSFolder initWithName:uid:]([BTAVRCP_PlaylistItemsFolder alloc], "initWithName:uid:", v11, objc_msgSend(v9, "unsignedLongLongValue"));
      *a4 = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v9, MPMediaPlaylistPropertyPersistentID));
      -[BTAVRCP_VFSFolder storePredicate:](v13, "storePredicate:", v14);

    }
    goto LABEL_10;
  }
  v12 = 9;
LABEL_11:

  return v12;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  unint64_t v4;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v4 = a3;
  if (-[BTAVRCP_PlaylistsFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder", a3, a4))
  {
    if (!v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[BTAVRCP_VFSFolder uid](self, "uid")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder recentlyAddedFolderName](self, "recentlyAddedFolderName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyFolderWithType:uid:name:](self, "replyFolderWithType:uid:name:", 5, v7, v9));
LABEL_11:

      goto LABEL_12;
    }
    --v4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionAtIndex:", v4));

  if (v7)
  {
    v8 = -[BTAVRCP_PlaylistsFolder playlistIsFolder:](self, "playlistIsFolder:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForProperty:", MPMediaPlaylistPropertyPersistentID));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "valueForProperty:", MPMediaPlaylistPropertyName));
    if (v8)
      v11 = 5;
    else
      v11 = 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyFolderWithType:uid:name:](self, "replyFolderWithType:uid:name:", v11, v9, v10));

    goto LABEL_11;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionWithUid:property:", a3, MPMediaPlaylistPropertyPersistentID));

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionWithUid:property:", a3, MPMediaPlaylistPropertyPersistentID));

  if (v5)
    return 12;
  else
    return 9;
}

- (NSNumber)parentPlaylistID
{
  return self->_parentPlaylistID;
}

- (BOOL)isRecentlyAdded
{
  return self->_isRecentlyAdded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentPlaylistID, 0);
}

@end
