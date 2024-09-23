@implementation BICImageSetStorePersistance

- (BICImageSetStorePersistance)initWithLevelID:(signed __int16)a3 comparator:(id)a4 dataStore:(id)a5
{
  id v9;
  id v10;
  BICImageSetStorePersistance *v11;
  BICImageSetStorePersistance *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)BICImageSetStorePersistance;
  v11 = -[BICImageSetStorePersistance init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_levelID = a3;
    objc_storeStrong((id *)&v11->_dataStore, a5);
    objc_storeStrong((id *)&v12->_comparator, a4);
  }

  return v12;
}

- (BICImageSetStorePersistance)initWithLevelID:(signed __int16)a3 imageSetPersistence:(id)a4 comparator:(id)a5 dataStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  BICImageSetStorePersistance *v14;
  BICImageSetStorePersistance *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BICImageSetStorePersistance;
  v14 = -[BICImageSetStorePersistance init](&v17, "init");
  v15 = v14;
  if (v14)
  {
    v14->_levelID = a3;
    objc_storeStrong((id *)&v14->_imageSetPersistence, a4);
    objc_storeStrong((id *)&v15->_dataStore, a6);
    objc_storeStrong((id *)&v15->_comparator, a5);
  }

  return v15;
}

- (id)imageMatchingDescription:(id)a3 forRequest:(id)a4
{
  return 0;
}

- (BOOL)supportsImageSets
{
  return 1;
}

- (void)withImageSetForDescribedImage:(id)a3 performBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance imageSetPersistence](self, "imageSetPersistence"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1622C4;
  v11[3] = &unk_292B10;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "withExistingImageSetForDescribedImage:performBlock:", v10, v11);

}

- (void)getSortedBestMatchOf:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance imageSetPersistence](self, "imageSetPersistence"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_162564;
  v11[3] = &unk_292B10;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "withExistingImageSetForDescribedImage:performBlock:", v10, v11);

}

- (void)_afterAllStoreOperationsCompletedForDescribedImage:(id)a3 performBlock:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance dataStore](self, "dataStore"));
  objc_msgSend(v6, "afterAllStoreOperationsCompletedPerformBlock:", v5);

}

- (id)fetchEntryFromImageSet:(id)a3 matchingDescription:(id)a4 forRequest:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned int v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  void *v23;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "requestOptions");
  v12 = objc_msgSend(v10, "requestOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "entryLocationForLevelID:", -[BICImageSetStorePersistance levelID](self, "levelID")));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageEntries"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v26 = v8;
    LODWORD(v25) = v12 & 0x30;
    HIDWORD(v25) = v11;
    v17 = *(_QWORD *)v28;
LABEL_3:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v17)
        objc_enumerationMutation(v14);
      v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "entryLocation", v25));
      v21 = objc_msgSend(v20, "isEqualToString:", v13);

      if (v21)
        break;
      if (v16 == (id)++v18)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v16)
          goto LABEL_3;
        goto LABEL_18;
      }
    }
    if (objc_msgSend(v19, "state") != 2)
    {
LABEL_18:
      v22 = 0;
      v8 = v26;
      goto LABEL_20;
    }
    v8 = v26;
    if ((objc_msgSend(v19, "isExpired") & 1) != 0)
      goto LABEL_17;
    if ((v25 & 0x8000000000) != 0 && objc_msgSend(v19, "quality") == 101
      || !(_DWORD)v25 && objc_msgSend(v19, "quality") == 3)
    {
      +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", BICCacheStatsOperationIgnoringLowQualityImageEntry[0], v10);
      goto LABEL_17;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v19, "setLastUsed:", v23);

    v22 = v19;
  }
  else
  {
LABEL_17:
    v22 = 0;
  }
LABEL_20:

  return v22;
}

- (void)fetchImagesFromImageEntry:(id)a3 matchingDescription:(id)a4 forRequest:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance dataStore](self, "dataStore"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_162AD8;
  v14[3] = &unk_28DEF0;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "fetchImagesForEntry:forRequest:completion:", v11, v10, v14);

}

- (void)getPrimaryImageForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance imageSetPersistence](self, "imageSetPersistence"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_162BD8;
  v10[3] = &unk_292B38;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "withExistingImageSetForDescribedImage:performBlock:", v7, v10);

}

- (void)addDescribedImages:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id location;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_new(NSMutableArray);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance dataStore](self, "dataStore"));
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v13);
        v17 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "canStoreDescribedImage:", v17))
          -[NSMutableArray addObject:](v11, "addObject:", v17);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  if (-[NSMutableArray count](v11, "count"))
  {
    objc_initWeak(&location, self);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance imageSetPersistence](self, "imageSetPersistence"));
    v19 = -[BICImageSetStorePersistance levelID](self, "levelID");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_162F9C;
    v22[3] = &unk_28F388;
    objc_copyWeak(&v25, &location);
    v23 = v9;
    v24 = v10;
    objc_msgSend(v18, "addImageEntriesForDescribedImages:inLevelID:addedEntries:", v11, v19, v22);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    v20 = objc_retainBlock(v10);
    v21 = v20;
    if (v20)
      (*((void (**)(id))v20 + 2))(v20);

  }
}

- (void)incrementVersionForIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance imageSetPersistence](self, "imageSetPersistence"));
  objc_msgSend(v5, "incrementVersionForIdentifiers:", v4);

}

- (void)incrementVersionForIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance imageSetPersistence](self, "imageSetPersistence"));
  objc_msgSend(v5, "incrementVersionForIdentifier:", v4);

}

- (void)removeDescribedImages:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_new(NSMutableArray);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance dataStore](self, "dataStore"));
        v16 = objc_msgSend(v15, "canStoreDescribedImage:", v14);

        if (v16)
          -[NSMutableArray addObject:](v8, "addObject:", v14);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  if (-[NSMutableArray count](v8, "count"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance imageSetPersistence](self, "imageSetPersistence"));
    v18 = -[BICImageSetStorePersistance levelID](self, "levelID");
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_163420;
    v21[3] = &unk_28C058;
    v21[4] = self;
    v22 = v7;
    objc_msgSend(v17, "removeImageEntriesForDescribedImages:inLevelID:removedEntries:", v8, v18, v21);

  }
  else
  {
    v19 = objc_retainBlock(v7);
    v20 = v19;
    if (v19)
      (*((void (**)(id, _QWORD))v19 + 2))(v19, 0);

  }
}

- (void)gatherPrunableItemsForMedium:(signed __int16)a3 level:(signed __int16)a4 withCompletion:(id)a5
{
  uint64_t v5;
  int v6;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  id v12;

  v5 = a4;
  v6 = a3;
  v12 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance dataStore](self, "dataStore"));
  v9 = objc_msgSend(v8, "storingMedium");

  if (v9 == v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance imageSetPersistence](self, "imageSetPersistence"));
    objc_msgSend(v10, "gatherPrunableItemsForLevel:withCompletion:", v5, v12);
  }
  else
  {
    v11 = objc_retainBlock(v12);
    v10 = v11;
    if (v11)
      (*((void (**)(id, void *))v11 + 2))(v11, &__NSArray0__struct);
  }

}

- (void)gatherPrunableItemsWithIdentifier:(id)a3 forMedium:(signed __int16)a4 level:(signed __int16)a5 withCompletion:(id)a6
{
  uint64_t v7;
  int v8;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  id v14;
  id v15;

  v7 = a5;
  v8 = a4;
  v15 = a3;
  v10 = a6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance dataStore](self, "dataStore"));
  v12 = objc_msgSend(v11, "storingMedium");

  if (v12 == v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance imageSetPersistence](self, "imageSetPersistence"));
    objc_msgSend(v13, "gatherPrunableItemsWithIdentifier:forLevel:withCompletion:", v15, v7, v10);
  }
  else
  {
    v14 = objc_retainBlock(v10);
    v13 = v14;
    if (v14)
      (*((void (**)(id, void *))v14 + 2))(v14, &__NSArray0__struct);
  }

}

- (void)pruneItems:(id)a3 forMedium:(signed __int16)a4 withCompletion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance dataStore](self, "dataStore"));
  v11 = objc_msgSend(v10, "storingMedium");

  if (v11 == (_DWORD)v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance imageSetPersistence](self, "imageSetPersistence"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_163850;
    v15[3] = &unk_28EE60;
    v15[4] = self;
    objc_msgSend(v12, "pruneItems:forMedium:prunedEntry:withCompletion:", v8, v6, v15, v9);

  }
  else
  {
    v13 = objc_retainBlock(v9);
    v14 = v13;
    if (v13)
      (*((void (**)(id, void *))v13 + 2))(v13, &__NSArray0__struct);

  }
}

- (int64_t)costFor:(signed __int16)a3
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance dataStore](self, "dataStore"));
  v5 = objc_msgSend(v4, "costFor:", v3);

  return (int64_t)v5;
}

- (signed)storingMedium
{
  void *v2;
  signed __int16 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance dataStore](self, "dataStore"));
  v3 = (unsigned __int16)objc_msgSend(v2, "storingMedium");

  return v3;
}

- (void)_inventoryLevel:(signed __int16)a3 addLevelID:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance imageSetPersistence](self, "imageSetPersistence"));
  objc_msgSend(v9, "_inventoryLevel:addLevelID:completion:", v6, v5, v8);

}

- (void)_clean:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BICImageSetStorePersistance imageSetPersistence](self, "imageSetPersistence"));
  objc_msgSend(v5, "_clean:", v4);

}

- (NSString)identifier
{
  return self->identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BICDescribedImageComparing)comparator
{
  return self->_comparator;
}

- (void)setComparator:(id)a3
{
  objc_storeStrong((id *)&self->_comparator, a3);
}

- (BICImageSetPersisting)imageSetPersistence
{
  return self->_imageSetPersistence;
}

- (void)setImageSetPersistence:(id)a3
{
  objc_storeStrong((id *)&self->_imageSetPersistence, a3);
}

- (BICDataStoring)dataStore
{
  return self->_dataStore;
}

- (void)setDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_dataStore, a3);
}

- (signed)levelID
{
  return self->_levelID;
}

- (void)setLevelID:(signed __int16)a3
{
  self->_levelID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_imageSetPersistence, 0);
  objc_storeStrong((id *)&self->_comparator, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

@end
