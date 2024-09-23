@implementation BTAVRCP_GenresFolder

- (BTAVRCP_GenresFolder)initWithName:(id)a3 uid:(unint64_t)a4
{
  return -[BTAVRCP_GenresFolder initWithName:uid:isRecentlyAdded:](self, "initWithName:uid:isRecentlyAdded:", a3, a4, 0);
}

- (BTAVRCP_GenresFolder)initWithName:(id)a3 uid:(unint64_t)a4 isRecentlyAdded:(BOOL)a5
{
  BTAVRCP_GenresFolder *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BTAVRCP_GenresFolder;
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

  if (-[BTAVRCP_GenresFolder isRecentlyAdded](self, "isRecentlyAdded"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collections"));
  v3 = (unint64_t)objc_msgSend(v5, "count") > 1;

  return v3;
}

- (id)baseQuery
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery genresQuery](MPMediaQuery, "genresQuery"));
  if (-[BTAVRCP_GenresFolder isRecentlyAdded](self, "isRecentlyAdded"))
    objc_msgSend(v3, "setGroupingType:", 16);
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

  return (unint64_t)v5 + -[BTAVRCP_GenresFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder");
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  BTAVRCP_GenresFolder *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BTAVRCP_ArtistsFolder *v14;
  void *v15;
  unsigned __int8 v16;

  if (-[BTAVRCP_VFSFolder uid](self, "uid") == a3
    && -[BTAVRCP_GenresFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder"))
  {
    v7 = [BTAVRCP_GenresFolder alloc];
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder recentlyAddedFolderName](self, "recentlyAddedFolderName"));
    *a4 = -[BTAVRCP_GenresFolder initWithName:uid:isRecentlyAdded:](v7, "initWithName:uid:isRecentlyAdded:", v8, a3, 1);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionWithUid:property:", a3, MPMediaItemPropertyGenrePersistentID));

    if (!v8)
    {
      v16 = 9;
      goto LABEL_8;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "representativeItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", MPMediaItemPropertyGenrePersistentID));

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "representativeItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForProperty:", MPMediaItemPropertyGenre));

    v14 = -[BTAVRCP_ArtistsFolder initWithName:uid:]([BTAVRCP_ArtistsFolder alloc], "initWithName:uid:", v13, objc_msgSend(v11, "unsignedLongLongValue"));
    *a4 = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v11, MPMediaItemPropertyGenrePersistentID));
    -[BTAVRCP_VFSFolder storePredicate:](v14, "storePredicate:", v15);

  }
  v16 = 4;
LABEL_8:

  return v16;
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
  void *v12;

  v4 = a3;
  if (-[BTAVRCP_GenresFolder showRecentlyAddedFolder](self, "showRecentlyAddedFolder", a3, a4))
  {
    if (!v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -[BTAVRCP_VFSFolder uid](self, "uid")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder recentlyAddedFolderName](self, "recentlyAddedFolderName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyFolderWithType:uid:name:](self, "replyFolderWithType:uid:name:", 4, v7, v8));
      goto LABEL_8;
    }
    --v4;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionAtIndex:", v4));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "representativeItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForProperty:", MPMediaItemPropertyGenrePersistentID));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "representativeItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", MPMediaItemPropertyGenre));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyFolderWithType:uid:name:](self, "replyFolderWithType:uid:name:", 3, v9, v11));

LABEL_8:
    goto LABEL_9;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

- (id)replyAttributesForUid:(unint64_t)a3 attributeIDs:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query", a3, a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "collectionWithUid:property:", a3, MPMediaItemPropertyGenrePersistentID));

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionWithUid:property:", a3, MPMediaItemPropertyGenrePersistentID));

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
