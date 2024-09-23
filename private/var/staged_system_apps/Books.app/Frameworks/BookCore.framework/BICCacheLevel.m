@implementation BICCacheLevel

- (BICCacheLevel)initWithLevelID:(signed __int16)a3 highPriorityTargetQueue:(id)a4 backgroundTargetQueue:(id)a5 imageSetStore:(id)a6 comparator:(id)a7 nextCacheLevel:(id)a8
{
  id v15;
  id v16;
  id v17;
  BICCacheLevel *v18;
  BICCacheLevel *v19;
  id v21;
  id v22;
  objc_super v23;

  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)BICCacheLevel;
  v18 = -[BICCacheLevel init](&v23, "init");
  v19 = v18;
  if (v18)
  {
    v18->_levelID = a3;
    objc_storeStrong((id *)&v18->_lowPriorityWorkQ, a5);
    objc_storeStrong((id *)&v19->_highPriorityWorkQ, a4);
    if (objc_msgSend(v15, "conformsToProtocol:", &OBJC_PROTOCOL___BICImageSetStoring, v21, v22))
      objc_storeStrong((id *)&v19->_imageSetStore, a6);
    if (objc_msgSend(v16, "conformsToProtocol:", &OBJC_PROTOCOL___BICDescribedImageComparing))
      objc_storeStrong((id *)&v19->_imageComparator, a7);
    if (objc_msgSend(v17, "conformsToProtocol:", &OBJC_PROTOCOL___BICLevelCaching))
      objc_storeStrong((id *)&v19->_nextCacheLevel, a8);
  }

  return v19;
}

- (id)imageMatchingDescription:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageMatchingDescription:forRequest:", v7, v6));

  return v9;
}

- (void)fetchImagesMatchingDescription:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_186FC;
  v15[3] = &unk_28BF18;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  objc_msgSend(v11, "withImageSetForDescribedImage:performBlock:", v14, v15);

}

- (void)fetchImagesFromImageSet:(id)a3 matchingDescription:(id)a4 forRequest:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  __CFString **v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fetchEntryFromImageSet:matchingDescription:forRequest:", v10, v11, v12));

  if (!v15)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel nextCacheLevel](self, "nextCacheLevel"));

    if (!v18)
    {
      +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", kBICCacheStatsCounterL4Miss[0]);
      v21 = objc_retainBlock(v13);
      v22 = v21;
      if (v21)
        (*((void (**)(id, _QWORD))v21 + 2))(v21, 0);
      goto LABEL_14;
    }
    v19 = -[BICCacheLevel levelID](self, "levelID");
    if (v19 == 1)
    {
      v20 = kBICCacheStatsCounterL2Miss;
    }
    else
    {
      if (v19 != 2)
      {
LABEL_13:
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel nextCacheLevel](self, "nextCacheLevel"));
        objc_msgSend(v22, "fetchImagesFromImageSet:matchingDescription:forRequest:completion:", v10, v11, v12, v13);
LABEL_14:

        goto LABEL_15;
      }
      v20 = kBICCacheStatsCounterL3Miss;
    }
    +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", *v20);
    goto LABEL_13;
  }
  v16 = -[BICCacheLevel levelID](self, "levelID") - 1;
  if (v16 <= 2)
    +[BICCacheStats incrementCounter:](BICCacheStats, "incrementCounter:", *off_28C0A0[v16]);
  objc_initWeak(&location, self);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_18A2C;
  v23[3] = &unk_28BF40;
  objc_copyWeak(&v27, &location);
  v24 = v12;
  v26 = v13;
  v25 = v11;
  objc_msgSend(v17, "fetchImagesFromImageEntry:matchingDescription:forRequest:completion:", v15, v25, v24, v23);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&location);
LABEL_15:

}

- (void)getPrimaryImageForRequest:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id buf;
  __int16 v18;
  id v19;

  v6 = a3;
  v7 = a4;
  v8 = BCImageCacheLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109378;
    HIDWORD(buf) = -[BICCacheLevel levelID](self, "levelID");
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "BICCacheLevel: Getting primary image for level: %hd for request: %@", (uint8_t *)&buf, 0x12u);
  }

  objc_initWeak(&buf, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_18CDC;
  v13[3] = &unk_28BF68;
  objc_copyWeak(&v16, &buf);
  v11 = v7;
  v15 = v11;
  v12 = v6;
  v14 = v12;
  objc_msgSend(v10, "getPrimaryImageForRequest:completion:", v12, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&buf);

}

- (void)addDescribedImages:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  _QWORD block[4];
  id v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD v23[4];
  NSObject *v24;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel nextCacheLevel](self, "nextCacheLevel"));

  if (v12)
    dispatch_group_enter(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_18FD0;
  v23[3] = &unk_28B960;
  v14 = v11;
  v24 = v14;
  objc_msgSend(v13, "addDescribedImages:forRequest:completion:", v10, v9, v23);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel nextCacheLevel](self, "nextCacheLevel"));
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_18FD8;
  v21[3] = &unk_28B960;
  v22 = v14;
  v16 = v14;
  objc_msgSend(v15, "addDescribedImages:forRequest:completion:", v10, v9, v21);

  v17 = objc_claimAutoreleasedReturnValue(-[BICCacheLevel highPriorityWorkQ](self, "highPriorityWorkQ"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_18FE0;
  block[3] = &unk_28BF90;
  v20 = v8;
  v18 = v8;
  dispatch_group_notify(v16, v17, block);

}

- (void)removeDescribedImages:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  objc_msgSend(v11, "removeDescribedImages:completion:", v10, v8);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[BICCacheLevel nextCacheLevel](self, "nextCacheLevel"));
  objc_msgSend(v12, "removeDescribedImages:forRequest:completion:", v10, v9, v8);

}

- (void)getSortedBestMatchesOf:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  __CFString *v8;
  id v9;
  id v10;
  id v11;

  v8 = BICCacheStatsOperationAsyncFetchBestAttempt[0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[BICCacheStats logOperation:forRequest:](BICCacheStats, "logOperation:forRequest:", v8, v10);
  -[BICCacheLevel _getSortedBestMatchesOf:forRequest:completion:](self, "_getSortedBestMatchesOf:forRequest:completion:", v11, v10, v9);

}

- (void)_getSortedBestMatchesOf:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v12 = objc_msgSend(v11, "supportsImageSets");

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v14 = v13;
  if ((v12 & 1) != 0)
  {
    objc_msgSend(v13, "getSortedBestMatchOf:completion:", v8, v10);

  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_19270;
    v15[3] = &unk_28BFB8;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    v18 = v10;
    objc_msgSend(v14, "getSortedBestMatchOf:completion:", v16, v15);

  }
}

- (void)incrementVersionForIdentifiers:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  objc_msgSend(v5, "incrementVersionForIdentifiers:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BICCacheLevel nextCacheLevel](self, "nextCacheLevel"));
  objc_msgSend(v6, "incrementVersionForIdentifiers:", v4);

}

- (void)incrementVersionForIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  objc_msgSend(v5, "incrementVersionForIdentifier:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BICCacheLevel nextCacheLevel](self, "nextCacheLevel"));
  objc_msgSend(v6, "incrementVersionForIdentifier:", v4);

}

- (int64_t)costFor:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  char *v6;
  void *v7;
  char *v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel nextCacheLevel](self, "nextCacheLevel"));
  v6 = (char *)objc_msgSend(v5, "costFor:", v3);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v8 = &v6[(_QWORD)objc_msgSend(v7, "costFor:", v3)];

  return (int64_t)v8;
}

- (void)gatherPrunableItemsForMedium:(signed __int16)a3 withCompletion:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  __int16 v12;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v8 = -[BICCacheLevel levelID](self, "levelID");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_19618;
  v10[3] = &unk_28C008;
  v12 = v4;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v7, "gatherPrunableItemsForMedium:level:withCompletion:", v4, v8, v10);

}

- (void)gatherPrunableItemsWithIdentifier:(id)a3 forMedium:(signed __int16)a4 withCompletion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  __int16 v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v11 = -[BICCacheLevel levelID](self, "levelID");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_19910;
  v14[3] = &unk_28C030;
  v14[4] = self;
  v15 = v8;
  v17 = v6;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v10, "gatherPrunableItemsWithIdentifier:forMedium:level:withCompletion:", v13, v6, v11, v14);

}

- (void)pruneItems:(id)a3 forMedium:(signed __int16)a4 withCompletion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  __int16 v16;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_19C04;
  v13[3] = &unk_28C030;
  v13[4] = self;
  v14 = v8;
  v16 = v6;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "pruneItems:forMedium:withCompletion:", v12, v6, v13);

}

- (void)_inventoryLevelOnly:(BOOL)a3 addLevelID:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;
  BOOL v15;

  v5 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v10 = -[BICCacheLevel levelID](self, "levelID");
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_19EE8;
  v12[3] = &unk_28C008;
  v14 = a3;
  v15 = v5;
  v12[4] = self;
  v13 = v8;
  v11 = v8;
  objc_msgSend(v9, "_inventoryLevel:addLevelID:completion:", v10, v5, v12);

}

- (void)_clean:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICCacheLevel imageSetStore](self, "imageSetStore"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1A100;
  v7[3] = &unk_28C080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "_clean:", v7);

}

- (BICDescribedImageComparing)imageComparator
{
  return self->_imageComparator;
}

- (void)setImageComparator:(id)a3
{
  objc_storeStrong((id *)&self->_imageComparator, a3);
}

- (OS_dispatch_queue)lowPriorityWorkQ
{
  return self->_lowPriorityWorkQ;
}

- (void)setLowPriorityWorkQ:(id)a3
{
  objc_storeStrong((id *)&self->_lowPriorityWorkQ, a3);
}

- (OS_dispatch_queue)highPriorityWorkQ
{
  return self->_highPriorityWorkQ;
}

- (void)setHighPriorityWorkQ:(id)a3
{
  objc_storeStrong((id *)&self->_highPriorityWorkQ, a3);
}

- (signed)levelID
{
  return self->_levelID;
}

- (BICImageSetStoring)imageSetStore
{
  return self->_imageSetStore;
}

- (BICLevelCaching)nextCacheLevel
{
  return self->_nextCacheLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextCacheLevel, 0);
  objc_storeStrong((id *)&self->_imageSetStore, 0);
  objc_storeStrong((id *)&self->_highPriorityWorkQ, 0);
  objc_storeStrong((id *)&self->_lowPriorityWorkQ, 0);
  objc_storeStrong((id *)&self->_imageComparator, 0);
}

@end
