@implementation BTAVRCP_ComposersFolder

- (BTAVRCP_ComposersFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  return -[BTAVRCP_ComposersFolder initWithName:uid:isRecentlyAdded:](self, "initWithName:uid:isRecentlyAdded:", a3, a4, 0);
}

- (BTAVRCP_ComposersFolder)initWithName:(id)a3 uid:(unint64_t)a4 isRecentlyAdded:(BOOL)a5
{
  BTAVRCP_ComposersFolder *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BTAVRCP_ComposersFolder;
  result = -[BTAVRCP_VFSFolder initWithName:uid:](&v7, "initWithName:uid:", a3, a4);
  if (result)
    result->_isRecentlyAdded = a5;
  return result;
}

- (BOOL)showRecentlyAddedFolder
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[BTAVRCP_ComposersFolder isRecentlyAdded](self, "isRecentlyAdded"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collections"));
  v3 = (unint64_t)objc_msgSend(v5, "count") > 1;

  return v3;
}

- (BOOL)composerHasSingleAlbum:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForProperty:", MPMediaItemCollectionPropertyAlbumCount));
  v4 = (unint64_t)objc_msgSend(v3, "unsignedIntegerValue") < 2;

  return v4;
}

- (id)baseQuery
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery composersQuery](MPMediaQuery, "composersQuery"));
  if (-[BTAVRCP_ComposersFolder isRecentlyAdded](self, "isRecentlyAdded"))
    objc_msgSend(v3, "setGroupingType:", 15);
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

  return (unint64_t)v5 + -[BTAVRCP_ComposersFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder");
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  BTAVRCP_ComposersFolder *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BTAVRCP_AlbumItemsFolder *v14;
  void *v15;
  void *v16;
  BTAVRCP_AlbumsFolder *v17;
  unsigned __int8 v18;
  void *v19;

  if (-[BTAVRCP_VFSFolder uid](self, "uid") == a3
    && -[BTAVRCP_ComposersFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder"))
  {
    v7 = [BTAVRCP_ComposersFolder alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder recentlyAddedFolderName](self, "recentlyAddedFolderName"));
    *a4 = -[BTAVRCP_ComposersFolder initWithName:uid:isRecentlyAdded:](v7, "initWithName:uid:isRecentlyAdded:", v8, a3, 1);
LABEL_10:
    v18 = 4;
    goto LABEL_11;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionWithUid:property:", a3, MPMediaItemPropertyComposerPersistentID));

  if (v8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "representativeItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", MPMediaItemPropertyComposerPersistentID));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "representativeItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForProperty:", MPMediaItemPropertyComposer));

    if (-[BTAVRCP_ComposersFolder composerHasSingleAlbum:](self, "composerHasSingleAlbum:", v8))
    {
      v14 = -[BTAVRCP_VFSFolder initWithName:uid:]([BTAVRCP_AlbumItemsFolder alloc], "initWithName:uid:", v13, objc_msgSend(v11, "unsignedLongLongValue"));
      *a4 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "representativeItem"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "predicateForProperty:", MPMediaItemPropertyAlbumPersistentID));
      -[BTAVRCP_VFSFolder storePredicate:](v14, "storePredicate:", v16);

      v17 = (BTAVRCP_AlbumsFolder *)*a4;
    }
    else
    {
      v17 = -[BTAVRCP_AlbumsFolder initWithName:uid:]([BTAVRCP_AlbumsFolder alloc], "initWithName:uid:", v13, objc_msgSend(v11, "unsignedLongLongValue"));
      *a4 = v17;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v11, MPMediaItemPropertyComposerPersistentID));
    -[BTAVRCP_VFSFolder storePredicate:](v17, "storePredicate:", v19);

    goto LABEL_10;
  }
  v18 = 9;
LABEL_11:

  return v18;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  unint64_t v4;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  if (-[BTAVRCP_ComposersFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder", a3, a4))
  {
    if (!v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[BTAVRCP_VFSFolder uid](self, "uid")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder recentlyAddedFolderName](self, "recentlyAddedFolderName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyFolderWithType:uid:name:](self, "replyFolderWithType:uid:name:", 3, v7, v9));
LABEL_11:

      goto LABEL_12;
    }
    --v4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionAtIndex:", v4));

  if (v7)
  {
    v8 = -[BTAVRCP_ComposersFolder composerHasSingleAlbum:](self, "composerHasSingleAlbum:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "representativeItem"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForProperty:", MPMediaItemPropertyComposerPersistentID));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "representativeItem"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "valueForProperty:", MPMediaItemPropertyComposer));
    if (v8)
      v13 = 1;
    else
      v13 = 2;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyFolderWithType:uid:name:](self, "replyFolderWithType:uid:name:", v13, v10, v12));

    goto LABEL_11;
  }
  v14 = 0;
LABEL_12:

  return v14;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionWithUid:property:", a3, MPMediaItemPropertyComposerPersistentID));

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionWithUid:property:", a3, MPMediaItemPropertyComposerPersistentID));

  if (v5)
    return 12;
  else
    return 9;
}

- (BOOL)isRecentlyAdded
{
  return self->_isRecentlyAdded;
}

@end
