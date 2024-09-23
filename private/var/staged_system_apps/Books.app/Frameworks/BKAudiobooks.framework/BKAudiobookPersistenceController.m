@implementation BKAudiobookPersistenceController

- (NSArray)stores
{
  return (NSArray *)-[NSArray copy](self->_stores, "copy");
}

+ (id)sharedInstance
{
  if (qword_44D88 != -1)
    dispatch_once(&qword_44D88, &stru_38AC0);
  return (id)qword_44D80;
}

- (BKAudiobookPersistenceController)init
{
  BKAudiobookPersistenceController *v2;
  dispatch_queue_attr_t v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *accessQueue;
  void *v7;
  NSArray *stores;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKAudiobookPersistenceController;
  v2 = -[BKAudiobookPersistenceController init](&v10, "init");
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    v5 = dispatch_queue_create("AEAudiobooks.Persistence", v4);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKAudiobookPlayer sharedInstance](BKAudiobookPlayer, "sharedInstance"));
    objc_msgSend(v7, "addObserver:", v2);

    stores = v2->_stores;
    v2->_stores = (NSArray *)&__NSArray0__struct;

  }
  return v2;
}

- (void)addStore:(id)a3
{
  id v4;
  NSObject *accessQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_A90C;
  block[3] = &unk_388E0;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(accessQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)bookmarkTimeForAudiobook:(id)a3 completion:(id)a4
{
  -[BKAudiobookPersistenceController bookmarkTimeForAudiobook:localStoresOnly:completion:](self, "bookmarkTimeForAudiobook:localStoresOnly:completion:", a3, 0, a4);
}

- (void)bookmarkTimeForAudiobook:(id)a3 localStoresOnly:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *accessQueue;
  _QWORD v13[4];
  id v14;
  BKAudiobookPersistenceController *v15;
  id v16;
  id v17;
  BOOL v18;
  id location;

  v8 = a3;
  v9 = a5;
  if (objc_msgSend(v8, "isAudiobookPreview"))
  {
    v10 = objc_retainBlock(v9);
    v11 = v10;
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD, double, double))v10 + 2))(v10, 0, 0, 0.0, 0.0);

  }
  else
  {
    objc_initWeak(&location, self);
    accessQueue = self->_accessQueue;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_AAA4;
    v13[3] = &unk_38BE0;
    objc_copyWeak(&v17, &location);
    v18 = a4;
    v14 = v8;
    v15 = self;
    v16 = v9;
    dispatch_async(accessQueue, v13);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

- (void)saveBookmarkTime:(double)a3 audiobook:(id)a4 importance:(int64_t)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *accessQueue;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18[3];
  id location;

  v10 = a4;
  v11 = a6;
  objc_initWeak(&location, self);
  if (objc_msgSend(v10, "isAudiobookPreview"))
  {
    v12 = objc_retainBlock(v11);
    v13 = v12;
    if (v12)
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);

  }
  else
  {
    accessQueue = self->_accessQueue;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_B7A4;
    v15[3] = &unk_38C80;
    objc_copyWeak(v18, &location);
    v18[1] = (id)a5;
    v18[2] = *(id *)&a3;
    v16 = v10;
    v17 = v11;
    dispatch_async(accessQueue, v15);

    objc_destroyWeak(v18);
  }
  objc_destroyWeak(&location);

}

- (void)player:(id)a3 stateDidChangeFrom:(int64_t)a4 to:(int64_t)a5
{
  id v8;
  void *v9;
  double v10;
  id v11;

  v8 = a3;
  if (a4 == 2 && (unint64_t)(a5 - 3) <= 1)
  {
    v11 = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "currentAudiobook"));
    objc_msgSend(v11, "positionInCurrentAudiobook");
    if (a5 == 4 && v10 == 0.0)
    {
      -[BKAudiobookPersistenceController _upgradeLastPeriodicBookmarkTimeWithPlayer:audiobook:](self, "_upgradeLastPeriodicBookmarkTimeWithPlayer:audiobook:", v11, v9);
    }
    else if (objc_msgSend(v11, "isPositionValid"))
    {
      objc_msgSend(v11, "positionInCurrentAudiobook");
      -[BKAudiobookPersistenceController saveBookmarkTime:audiobook:importance:completion:](self, "saveBookmarkTime:audiobook:importance:completion:", v9, 5, 0);
    }

    v8 = v11;
  }

}

- (void)player:(id)a3 currentPositionDidChange:(double)a4 inChapter:(unint64_t)a5 absolutePosition:(double)a6
{
  void *v9;
  char *v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;

  v16 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentAudiobook"));
  v10 = (char *)objc_msgSend(v16, "state");
  if (v10 == (_BYTE *)&dword_0 + 3
    || v10 == (_BYTE *)&dword_0 + 2
    && (v11 = a4, __ROR8__(0xEEEEEEEEEEEEEEEFLL * llroundf(v11) + 0x888888888888888, 2) <= 0x444444444444444uLL))
  {
    if ((objc_msgSend(v16, "isScrubbing") & 1) == 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "currentAudiobook"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetID"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceController cachedAssetID](self, "cachedAssetID"));
      v15 = objc_msgSend(v13, "isEqualToString:", v14);

      if (v15)
        -[BKAudiobookPersistenceController saveBookmarkTime:audiobook:importance:completion:](self, "saveBookmarkTime:audiobook:importance:completion:", v9, 1, 0, a6);
    }
  }

}

- (void)player:(id)a3 audiobookWillChange:(id)a4
{
  id v6;
  double v7;
  double v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v6)
  {
    objc_msgSend(v9, "positionInCurrentAudiobook");
    if (v7 == 0.0)
    {
      -[BKAudiobookPersistenceController _upgradeLastPeriodicBookmarkTimeWithPlayer:audiobook:](self, "_upgradeLastPeriodicBookmarkTimeWithPlayer:audiobook:", v9, v6);
    }
    else
    {
      v8 = v7;
      if (objc_msgSend(v9, "isPositionValid"))
        -[BKAudiobookPersistenceController saveBookmarkTime:audiobook:importance:completion:](self, "saveBookmarkTime:audiobook:importance:completion:", v6, 5, 0, v8);
    }
  }

}

- (void)_upgradeLastPeriodicBookmarkTimeWithPlayer:(id)a3 audiobook:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentAudiobook"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_BF04;
  v10[3] = &unk_38CA8;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  -[BKAudiobookPersistenceController bookmarkTimeForAudiobook:completion:](self, "bookmarkTimeForAudiobook:completion:", v8, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)player:(id)a3 audiobookDidChange:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;

  v5 = a4;
  if (v5)
  {
    v6 = BKAudiobooksPersistenceLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
      v10 = 138477827;
      v11 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "BKAsssetAudiobookPersistenceController changed cached assetID to %{private}@", (uint8_t *)&v10, 0xCu);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetID"));
    -[BKAudiobookPersistenceController setCachedAssetID:](self, "setCachedAssetID:", v9);

  }
}

- (void)player:(id)a3 chapterDidChange:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentAudiobook"));
  if (objc_msgSend(v6, "isPositionValid") && objc_msgSend(v6, "state") != &dword_4)
  {
    objc_msgSend(v6, "positionInCurrentAudiobook");
    -[BKAudiobookPersistenceController saveBookmarkTime:audiobook:importance:completion:](self, "saveBookmarkTime:audiobook:importance:completion:", v5, 5, 0);
  }

}

- (void)player:(id)a3 isScrubbing:(BOOL)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;

  v11 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentAudiobook"));
  if (((unint64_t)objc_msgSend(v11, "state") & 0xFFFFFFFFFFFFFFFELL) == 2 && !a4)
  {
    if (objc_msgSend(v11, "isPositionValid"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentAudiobook"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookPersistenceController cachedAssetID](self, "cachedAssetID"));
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

      if (v10)
      {
        objc_msgSend(v11, "positionInCurrentAudiobook");
        -[BKAudiobookPersistenceController saveBookmarkTime:audiobook:importance:completion:](self, "saveBookmarkTime:audiobook:importance:completion:", v6, 1, 0);
      }
    }
  }

}

- (double)_rollbackAmountForLastPlayedDate:(id)a3
{
  double v3;
  double v4;
  double result;

  objc_msgSend(a3, "timeIntervalSinceNow");
  v4 = fabs(v3);
  result = 10.0;
  if (v4 <= 3600.0)
  {
    result = 8.0;
    if (v4 <= 1800.0)
    {
      result = 0.0;
      if (v4 > 600.0)
        return 5.0;
    }
  }
  return result;
}

- (void)setStores:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)cachedAssetID
{
  return self->_cachedAssetID;
}

- (void)setCachedAssetID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedAssetID, 0);
  objc_storeStrong((id *)&self->_stores, 0);
  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end
