@implementation BKMLAudiobookIdentifier

+ (id)identifierFromPersistentID:(id)a3
{
  id v3;
  BKMLAudiobookIdentifier *v4;

  v3 = a3;
  v4 = -[BKMLAudiobookIdentifier initWithPersistentID:]([BKMLAudiobookIdentifier alloc], "initWithPersistentID:", v3);

  return v4;
}

+ (id)identifierFromAlbumPersistentID:(id)a3
{
  id v3;
  BKMLAudiobookIdentifier *v4;

  v3 = a3;
  v4 = -[BKMLAudiobookIdentifier initWithAlbumPersistentID:]([BKMLAudiobookIdentifier alloc], "initWithAlbumPersistentID:", v3);

  return v4;
}

+ (id)identifierFromAssetID:(id)a3 albumTitle:(id)a4
{
  id v5;
  id v6;
  BKMLAudiobookIdentifier *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BKMLAudiobookIdentifier initWithAssetID:albumTitle:]([BKMLAudiobookIdentifier alloc], "initWithAssetID:albumTitle:", v6, v5);

  return v7;
}

+ (id)identifierFromMediaQuery:(id)a3 supplementalAssetIdentifiers:(id)a4
{
  id v5;
  id v6;
  BKMLAudiobookIdentifier *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[BKMLAudiobookIdentifier initWithMediaQuery:supplementalAssetIDs:]([BKMLAudiobookIdentifier alloc], "initWithMediaQuery:supplementalAssetIDs:", v6, v5);

  return v7;
}

- (BKMLAudiobookIdentifier)initWithPersistentID:(id)a3
{
  id v5;
  BKMLAudiobookIdentifier *v6;
  BKMLAudiobookIdentifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKMLAudiobookIdentifier;
  v6 = -[BKMLAudiobookIdentifier init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_persistentID, a3);

  return v7;
}

- (BKMLAudiobookIdentifier)initWithAlbumPersistentID:(id)a3
{
  id v5;
  BKMLAudiobookIdentifier *v6;
  BKMLAudiobookIdentifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKMLAudiobookIdentifier;
  v6 = -[BKMLAudiobookIdentifier init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_albumPersistentID, a3);

  return v7;
}

- (BKMLAudiobookIdentifier)initWithAssetID:(id)a3 albumTitle:(id)a4
{
  id v6;
  id v7;
  BKMLAudiobookIdentifier *v8;
  uint64_t v9;
  uint64_t v10;
  NSNumber *storeID;
  NSString *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKMLAudiobookIdentifier;
  v8 = -[BKMLAudiobookIdentifier init](&v14, "init");
  if (v8)
  {
    v9 = BUStoreIdFromObject(v6);
    if (v9)
    {
      v10 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9));
      storeID = v8->_storeID;
      v8->_storeID = (NSNumber *)v10;
    }
    else
    {
      v12 = (NSString *)objc_msgSend(v7, "copy");
      storeID = (NSNumber *)v8->_albumTitle;
      v8->_albumTitle = v12;
    }

  }
  return v8;
}

- (BKMLAudiobookIdentifier)initWithMediaQuery:(id)a3 supplementalAssetIDs:(id)a4
{
  id v7;
  id v8;
  BKMLAudiobookIdentifier *v9;
  BKMLAudiobookIdentifier *v10;
  NSArray *v11;
  NSArray *supplementalAssetIdentifiers;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BKMLAudiobookIdentifier;
  v9 = -[BKMLAudiobookIdentifier init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_query, a3);
    v11 = (NSArray *)objc_msgSend(v8, "copy");
    supplementalAssetIdentifiers = v10->_supplementalAssetIdentifiers;
    v10->_supplementalAssetIdentifiers = v11;

  }
  return v10;
}

- (BOOL)isValid
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier persistentID](self, "persistentID"));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier storeID](self, "storeID"));
    if (v5)
    {
      v4 = 1;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumPersistentID](self, "albumPersistentID"));
      if (v6)
      {
        v4 = 1;
      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier query](self, "query"));
        if (v7)
        {
          v4 = 1;
        }
        else
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumTitle](self, "albumTitle"));
          v4 = objc_msgSend(v8, "length") != 0;

        }
      }

    }
  }

  return v4;
}

- (BOOL)isEqualToIdentifier:(id)a3
{
  BKMLAudiobookIdentifier *v4;
  uint64_t v5;
  BKMLAudiobookIdentifier *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  unsigned __int8 v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;

  v4 = (BKMLAudiobookIdentifier *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    v5 = objc_opt_class(BKMLAudiobookIdentifier);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier persistentID](self, "persistentID"));
      v8 = objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier persistentID](v6, "persistentID"));
      if (v7 == (void *)v8)
      {

      }
      else
      {
        v9 = (void *)v8;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier persistentID](self, "persistentID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier persistentID](v6, "persistentID"));
        v12 = objc_msgSend(v10, "isEqualToNumber:", v11);

        if (!v12)
          goto LABEL_23;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier storeID](self, "storeID"));
      v15 = objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier storeID](v6, "storeID"));
      if (v14 == (void *)v15)
      {

      }
      else
      {
        v16 = (void *)v15;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier storeID](self, "storeID"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier storeID](v6, "storeID"));
        v19 = objc_msgSend(v17, "isEqualToNumber:", v18);

        if (!v19)
          goto LABEL_23;
      }
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumPersistentID](self, "albumPersistentID"));
      v21 = objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumPersistentID](v6, "albumPersistentID"));
      if (v20 == (void *)v21)
      {

      }
      else
      {
        v22 = (void *)v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumPersistentID](self, "albumPersistentID"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumPersistentID](v6, "albumPersistentID"));
        v25 = objc_msgSend(v23, "isEqualToNumber:", v24);

        if (!v25)
          goto LABEL_23;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier query](self, "query"));
      v27 = objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier query](v6, "query"));
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier query](self, "query"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier query](v6, "query"));
        v31 = objc_msgSend(v29, "isEqual:", v30);

        if (!v31)
          goto LABEL_23;
      }
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumTitle](self, "albumTitle"));
      v33 = objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumTitle](v6, "albumTitle"));
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumTitle](self, "albumTitle"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumTitle](v6, "albumTitle"));
        v37 = objc_msgSend(v35, "isEqualToString:", v36);

        if (!v37)
        {
LABEL_23:
          v13 = 0;
LABEL_24:

          goto LABEL_25;
        }
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier supplementalAssetIdentifiers](self, "supplementalAssetIdentifiers"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier supplementalAssetIdentifiers](v6, "supplementalAssetIdentifiers"));
      if (v39 == v40)
      {
        v13 = 1;
      }
      else
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier supplementalAssetIdentifiers](self, "supplementalAssetIdentifiers"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier supplementalAssetIdentifiers](v6, "supplementalAssetIdentifiers"));
        v13 = objc_msgSend(v41, "isEqual:", v42);

      }
      goto LABEL_24;
    }
    v13 = 0;
  }
LABEL_25:

  return v13;
}

- (id)audiobookQuery
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *const *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier query](self, "query"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier query](self, "query"));
    return v4;
  }
  if (-[BKMLAudiobookIdentifier isValid](self, "isValid"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaQuery bk_audiobooksQuery](MPMediaQuery, "bk_audiobooksQuery"));
    objc_msgSend(v4, "setIgnoreSystemFilterPredicates:", 1);
    objc_msgSend(v4, "setGroupingType:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier persistentID](self, "persistentID"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier persistentID](self, "persistentID"));
      v7 = &MPMediaItemPropertyPersistentID;
LABEL_13:
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v6, *v7));
      objc_msgSend(v4, "addFilterPredicate:", v13);

      return v4;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumPersistentID](self, "albumPersistentID"));

    if (v10)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumPersistentID](self, "albumPersistentID"));
      v7 = &MPMediaItemPropertyAlbumPersistentID;
      goto LABEL_13;
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumTitle](self, "albumTitle"));
    v12 = objc_msgSend(v11, "length");

    if (v12)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumTitle](self, "albumTitle"));
      v7 = &MPMediaItemPropertyAlbumTitle;
      goto LABEL_13;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier storeID](self, "storeID"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier storeID](self, "storeID"));
      v17 = MPMediaItemPropertyStorePlaylistID;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[MPMediaPropertyPredicate predicateWithValue:forProperty:](MPMediaPropertyPredicate, "predicateWithValue:forProperty:", v16, MPMediaItemPropertyStorePlaylistID));
      objc_msgSend(v4, "addFilterPredicate:", v18);

      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collections"));
      v20 = objc_msgSend(v19, "count");

      if (!v20)
      {
        objc_msgSend(v4, "removePredicatesForProperty:", v17);
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier storeID](self, "storeID"));
        v7 = (NSString *const *)&MPMediaItemPropertyStoreID;
        goto LABEL_13;
      }
    }
  }
  else
  {
    v8 = BKAudiobooksLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_21C80(v9);

    v4 = 0;
  }
  return v4;
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  __CFString *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier persistentID](self, "persistentID"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier persistentID](self, "persistentID"));
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("persistentID: %@"), v4);
LABEL_9:
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(v5);

    goto LABEL_10;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier storeID](self, "storeID"));

  if (v6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier storeID](self, "storeID"));
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("storeID: %@"), v4);
    goto LABEL_9;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier query](self, "query"));

  if (v7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier query](self, "query"));
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("query: %@"), v4);
    goto LABEL_9;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumTitle](self, "albumTitle"));
  v9 = objc_msgSend(v8, "length");

  if (v9)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMLAudiobookIdentifier albumTitle](self, "albumTitle"));
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("albumTitle: '%@'"), v4);
    goto LABEL_9;
  }
  v10 = CFSTR("no persistentID or assetID set");
LABEL_10:
  v11 = (objc_class *)objc_opt_class(self);
  v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = objc_claimAutoreleasedReturnValue(-[NSArray componentsJoinedByString:](self->_supplementalAssetIdentifiers, "componentsJoinedByString:", CFSTR(",")));
  v15 = (void *)v14;
  v16 = &__NSArray0__struct;
  if (v14)
    v16 = (void *)v14;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@(%p) %@ supplementalAssetIDs=%@>"), v13, self, v10, v16));

  return (NSString *)v17;
}

- (NSNumber)persistentID
{
  return self->_persistentID;
}

- (NSNumber)albumPersistentID
{
  return self->_albumPersistentID;
}

- (NSNumber)storeID
{
  return self->_storeID;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (NSArray)supplementalAssetIdentifiers
{
  return self->_supplementalAssetIdentifiers;
}

- (void)setSupplementalAssetIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (MPMediaQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_supplementalAssetIdentifiers, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_storeID, 0);
  objc_storeStrong((id *)&self->_albumPersistentID, 0);
  objc_storeStrong((id *)&self->_persistentID, 0);
}

@end
