@implementation MPMediaQuery

+ (id)bk_audiobooksQuery
{
  return +[BLMediaQuery audiobooksQuery](BLMediaQuery, "audiobooksQuery");
}

+ (id)bk_audiobooksNonPreordersQuery
{
  return +[BLMediaQuery audiobooksNonPreordersQuery](BLMediaQuery, "audiobooksNonPreordersQuery");
}

+ (id)bk_queryWithStoreID:(id)a3 albumTitle:(id)a4 isCloudItem:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  void *v14;
  void *v15;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "length"))
  {
    v9 = BUStoreIdFromObject(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BLMediaQuery audiobooksQuery](BLMediaQuery, "audiobooksQuery"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v8, MPMediaItemPropertyAlbumTitle));
    objc_msgSend(v10, "addFilterPredicate:", v11);

    if (v9)
    {
      v12 = (id *)&MPMediaItemPropertyStorePlaylistID;
      if (v5)
        v12 = (id *)&MPMediaItemPropertyStoreID;
      v13 = *v12;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v14, v13));
      objc_msgSend(v10, "addFilterPredicate:", v15);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
