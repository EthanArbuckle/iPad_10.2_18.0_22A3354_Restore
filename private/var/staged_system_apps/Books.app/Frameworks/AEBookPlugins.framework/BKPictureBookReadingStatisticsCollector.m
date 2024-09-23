@implementation BKPictureBookReadingStatisticsCollector

+ (id)readingStatisticsCollectorWithAssetViewController:(id)a3
{
  id v3;
  BKPictureBookReadingStatisticsCollectorWK2 *v4;

  v3 = a3;
  v4 = -[BKPictureBookReadingStatisticsCollector initWithAssetViewController:]([BKPictureBookReadingStatisticsCollectorWK2 alloc], "initWithAssetViewController:", v3);

  return v4;
}

- (BKPictureBookReadingStatisticsCollector)initWithAssetViewController:(id)a3
{
  id v4;
  BKPictureBookReadingStatisticsCollector *v5;
  BKPictureBookReadingStatisticsCollector *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKPictureBookReadingStatisticsCollector;
  v5 = -[BKPictureBookReadingStatisticsCollector init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_assetViewController, v4);

  return v6;
}

- (void)setupWithBookInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BKPictureBookReadingStatisticsCollector *v35;
  void *v36;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf;
  _BYTE v44[15];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[3];
  _QWORD v50[3];
  _BYTE v51[128];
  _BYTE v52[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "spineIndexInPackage"));
  v35 = self;
  -[BKPictureBookReadingStatisticsCollector setSpineIndexInPackage:](self, "setSpineIndexInPackage:", objc_msgSend(v5, "unsignedIntegerValue"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v36 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "linearDocuments"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "href"));

        if (v13)
        {
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "documentOrdinal"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "href"));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v15);

        }
        else
        {
          v16 = BCReadingStatisticsLog();
          v14 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            sub_11CDA0(&buf, v44, v14);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    }
    while (v9);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "chapters"));
  v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v40;
    v37 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v19; j = (char *)j + 1)
      {
        if (*(_QWORD *)v40 != v20)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)j);
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "baseHref"));

        if (v23)
        {
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "baseHref"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v24));

          if (v25)
          {
            v26 = v6;
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v25));
            v28 = v27;
            if (v27)
              v29 = v27;
            else
              v29 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
            v30 = v29;

            objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, v25);
            v49[0] = CFSTR("fullHref");
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "href"));
            v50[0] = v31;
            v49[1] = CFSTR("href");
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "baseHref"));
            v50[1] = v32;
            v49[2] = CFSTR("name");
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "name"));
            v50[2] = v33;
            v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 3));
            objc_msgSend(v30, "addObject:", v34);

            v6 = v26;
            v20 = v37;
          }

        }
      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v19);
  }

  -[BKPictureBookReadingStatisticsCollector setAllNavigationInfosByOrdinal:](v35, "setAllNavigationInfosByOrdinal:", v17);
}

- (id)navigationInfoHrefsForOrdinal:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookReadingStatisticsCollector allNavigationInfosByOrdinal](self, "allNavigationInfosByOrdinal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bu_arrayByInvokingBlock:", &stru_1C1058));
  return v7;
}

- (void)renderingCacheOperationCompleted:(id)a3 textNodeCharacterCounts:(id)a4 cfisForHrefs:(id)a5
{
  id v8;
  id v9;
  id v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!-[BKPictureBookReadingStatisticsCollector invalidated](self, "invalidated"))
  {
    v11 = (char *)objc_msgSend(v8, "pageNumber") - 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookReadingStatisticsCollector assetViewController](self, "assetViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "assetViewControllerDelegate"));
    if (objc_msgSend(v13, "needTOCEntriesForOrdinal:", v11))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookReadingStatisticsCollector allNavigationInfosByOrdinal](self, "allNavigationInfosByOrdinal"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v15));

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_B42F0;
      v18[3] = &unk_1C09B0;
      v19 = v10;
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bu_arrayByInvokingBlock:", v18));
      objc_msgSend(v13, "addTOCEntries:ordinal:completion:", v17, v11, 0);

    }
    if (objc_msgSend(v13, "needTextNodeCharacterCountsForOrdinal:", v11))
      objc_msgSend(v13, "addTextNodeCharacterCounts:ordinal:completion:", v9, v11, 0);

  }
}

- (BOOL)needPiggyBackOperationForOrdinal:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKPictureBookReadingStatisticsCollector assetViewController](self, "assetViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "assetViewControllerDelegate"));
  LOBYTE(a3) = objc_msgSend(v5, "needTextNodeCharacterCountsForOrdinal:", a3);

  return a3;
}

- (void)invalidate
{
  -[BKPictureBookReadingStatisticsCollector setAssetViewController:](self, "setAssetViewController:", 0);
  -[BKPictureBookReadingStatisticsCollector setAllNavigationInfosByOrdinal:](self, "setAllNavigationInfosByOrdinal:", 0);
  -[BKPictureBookReadingStatisticsCollector setInvalidated:](self, "setInvalidated:", 1);
}

- (unint64_t)spineIndexInPackage
{
  return self->_spineIndexInPackage;
}

- (void)setSpineIndexInPackage:(unint64_t)a3
{
  self->_spineIndexInPackage = a3;
}

- (AEAssetViewController)assetViewController
{
  return (AEAssetViewController *)objc_loadWeakRetained((id *)&self->_assetViewController);
}

- (void)setAssetViewController:(id)a3
{
  objc_storeWeak((id *)&self->_assetViewController, a3);
}

- (NSDictionary)allNavigationInfosByOrdinal
{
  return self->_allNavigationInfosByOrdinal;
}

- (void)setAllNavigationInfosByOrdinal:(id)a3
{
  objc_storeStrong((id *)&self->_allNavigationInfosByOrdinal, a3);
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allNavigationInfosByOrdinal, 0);
  objc_destroyWeak((id *)&self->_assetViewController);
}

@end
