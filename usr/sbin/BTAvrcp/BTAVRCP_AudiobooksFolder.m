@implementation BTAVRCP_AudiobooksFolder

- (id)baseQuery
{
  return +[MPMediaQuery audiobooksQuery](MPMediaQuery, "audiobooksQuery");
}

- (unint64_t)childrenCount
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collections"));
  v4 = objc_msgSend(v3, "count");

  return (unint64_t)v4;
}

- (unsigned)createFolderWithUid:(unint64_t)a3 folder:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BTAVRCP_AudiobookItemsFolder *v12;
  void *v13;
  unsigned __int8 v14;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionWithUid:property:", a3, MPMediaItemPropertyAlbumPersistentID));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "representativeItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForProperty:", MPMediaItemPropertyAlbumPersistentID));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "representativeItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", MPMediaItemPropertyAlbumTitle));

    v12 = -[BTAVRCP_VFSFolder initWithName:uid:]([BTAVRCP_AudiobookItemsFolder alloc], "initWithName:uid:", v11, objc_msgSend(v9, "unsignedLongLongValue"));
    *a4 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v9, MPMediaItemPropertyAlbumPersistentID));
    -[BTAVRCP_VFSFolder storePredicate:](v12, "storePredicate:", v13);

    v14 = 4;
  }
  else
  {
    v14 = 9;
  }

  return v14;
}

- (id)replyItemAtIndex:(unint64_t)a3 attributeIDs:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder query](self, "query", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionAtIndex:", a3));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "representativeItem"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForProperty:", MPMediaItemPropertyAlbumPersistentID));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "representativeItem"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", MPMediaItemPropertyAlbumTitle));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BTAVRCP_VFSFolder replyFolderWithType:uid:name:](self, "replyFolderWithType:uid:name:", 1, v9, v11));

  }
  else
  {
    v12 = 0;
  }

  return v12;
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

@end
