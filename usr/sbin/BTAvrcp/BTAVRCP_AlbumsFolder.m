@implementation BTAVRCP_AlbumsFolder

- (BTAVRCP_AlbumsFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  return -[BTAVRCP_AlbumsFolder initWithName:uid:isRecentlyAdded:](self, "initWithName:uid:isRecentlyAdded:", a3, a4, 0);
}

- (BTAVRCP_AlbumsFolder)initWithName:(id)a3 uid:(unint64_t)a4 isRecentlyAdded:(BOOL)a5
{
  BTAVRCP_AlbumsFolder *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BTAVRCP_AlbumsFolder;
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

  if (-[BTAVRCP_AlbumsFolder isRecentlyAdded](self, "isRecentlyAdded"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collections"));
  v3 = (unint64_t)objc_msgSend(v5, "count") > 1;

  return v3;
}

- (id)albumName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "representativeItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForProperty:", MPMediaItemPropertyAlbumTitle));

  if (!objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mobileBluetoothBundle](NSBundle, "mobileBluetoothBundle"));
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("UNKNOWN_ALBUM"), CFSTR("Unknown Album"), 0));

    v4 = (void *)v6;
  }
  return v4;
}

- (id)baseQuery
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery albumsQuery](MPMediaQuery, "albumsQuery"));
  if (-[BTAVRCP_AlbumsFolder isRecentlyAdded](self, "isRecentlyAdded"))
    objc_msgSend(v3, "setGroupingType:", 13);
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

  return (unint64_t)v5 + -[BTAVRCP_AlbumsFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder");
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  BTAVRCP_AlbumsFolder *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BTAVRCP_AlbumItemsFolder *v13;
  void *v14;
  unsigned __int8 v15;

  if (-[BTAVRCP_VFSFolder uid](self, "uid") == a3
    && -[BTAVRCP_AlbumsFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder"))
  {
    v7 = [BTAVRCP_AlbumsFolder alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder recentlyAddedFolderName](self, "recentlyAddedFolderName"));
    *a4 = -[BTAVRCP_AlbumsFolder initWithName:uid:isRecentlyAdded:](v7, "initWithName:uid:isRecentlyAdded:", v8, a3, 1);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionWithUid:property:", a3, MPMediaItemPropertyAlbumPersistentID));

    if (!v8)
    {
      v15 = 9;
      goto LABEL_8;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "representativeItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", MPMediaItemPropertyAlbumPersistentID));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_AlbumsFolder albumName:](self, "albumName:", v8));
    v13 = -[BTAVRCP_VFSFolder initWithName:uid:]([BTAVRCP_AlbumItemsFolder alloc], "initWithName:uid:", v12, objc_msgSend(v11, "unsignedLongLongValue"));
    *a4 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v11, MPMediaItemPropertyAlbumPersistentID));
    -[BTAVRCP_VFSFolder storePredicate:](v13, "storePredicate:", v14);

  }
  v15 = 4;
LABEL_8:

  return v15;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  unint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (-[BTAVRCP_AlbumsFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder", a3, a4))
  {
    if (!v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[BTAVRCP_VFSFolder uid](self, "uid")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder recentlyAddedFolderName](self, "recentlyAddedFolderName"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyFolderWithType:uid:name:](self, "replyFolderWithType:uid:name:", 2, v7, v8));
      goto LABEL_8;
    }
    --v4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionAtIndex:", v4));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "representativeItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForProperty:", MPMediaItemPropertyAlbumPersistentID));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_AlbumsFolder albumName:](self, "albumName:", v7));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyFolderWithType:uid:name:](self, "replyFolderWithType:uid:name:", 1, v9, v10));

LABEL_8:
    goto LABEL_9;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionWithUid:property:", a3, MPMediaItemPropertyAlbumPersistentID));

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionWithUid:property:", a3, MPMediaItemPropertyAlbumPersistentID));

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
