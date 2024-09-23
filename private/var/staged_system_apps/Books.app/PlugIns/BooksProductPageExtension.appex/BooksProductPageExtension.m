void sub_100003964(uint64_t a1)
{
  id v1;
  id v2;

  v1 = objc_retainBlock(*(id *)(a1 + 32));
  if (v1)
  {
    v2 = v1;
    (*((void (**)(id, _QWORD))v1 + 2))(v1, 0);
    v1 = v2;
  }

}

void sub_100003B9C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100003BC0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  int v19;
  void *i;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v6 = a2;
  v7 = a4;
  v11 = v7;
  if (v7)
  {
    v12 = BCProductPageExtensionLog(v7, v8, v9, v10);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10001EA28((uint64_t)v11, v13);
    v14 = 0;
  }
  else
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v15 = v6;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v27;
      v19 = kBKCollectionMinUserCollectionSortOrder;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v18)
            objc_enumerationMutation(v15);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
          if ((int)objc_msgSend(v21, "sortOrder") >= v19)
            -[NSObject addObject:](v13, "addObject:", v21);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v17);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject sortedArrayUsingComparator:](v13, "sortedArrayUsingComparator:", &stru_10002D138));
  }

  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100003E20;
  v23[3] = &unk_10002D160;
  objc_copyWeak(&v25, (id *)(a1 + 32));
  v24 = v14;
  v22 = v14;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);

  objc_destroyWeak(&v25);
}

int64_t sub_100003DCC(id a1, BCMutableCollectionDetail *a2, BCMutableCollectionDetail *a3)
{
  BCMutableCollectionDetail *v4;
  signed int v5;
  signed int v6;
  int64_t v7;

  v4 = a3;
  v5 = -[BCMutableCollectionDetail sortOrder](a2, "sortOrder");
  v6 = -[BCMutableCollectionDetail sortOrder](v4, "sortOrder");

  if (v5 >= v6)
    v7 = 0;
  else
    v7 = -1;
  if (v5 > v6)
    return 1;
  else
    return v7;
}

void sub_100003E20(uint64_t a1)
{
  uint64_t v1;
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCollectionDetailsCache:", v1);

  v4 = objc_opt_class(UITableView);
  v5 = objc_loadWeakRetained(v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  v7 = BUDynamicCast(v4, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue(v7);

  objc_msgSend(v8, "reloadData");
}

void sub_10000414C(uint64_t a1, int a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  if (a2)
  {
    v9 = *(id *)(a1 + 32);
    if (objc_msgSend(*(id *)(a1 + 40), "isAudiobook"))
      v3 = 2;
    else
      v3 = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    v5 = objc_msgSend(v4, "seriesTypeForContentID:", v9);

    v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    objc_msgSend(v7, "emitAddToCollectionEventWithTracker:collectionID:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v9, v6, v3, 0, v5, 0);

    if (objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", kBKCollectionDefaultIDWantToRead))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
      objc_msgSend(v8, "emitWantListAddEventWithTracker:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:", *(_QWORD *)(a1 + 48), v9, v6, v3, 0, v5, 0);
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 56), "isEqualToString:", kBKCollectionDefaultIDFinished))
      {
LABEL_11:

        return;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
      objc_msgSend(v8, "emitMarkAsFinishedEventWithTracker:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:", *(_QWORD *)(a1 + 48), v9, v6, v3, 0, v5, 0);
    }

    goto LABEL_11;
  }
}

void sub_100004D7C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "name"));
    v9 = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
    objc_msgSend(v4, "enqueueValueCall:arguments:file:line:", v5, v8, CFSTR("PPXJSALibraryManager.m"), 129);

  }
  else
  {
    objc_msgSend(v4, "enqueueValueCall:arguments:file:line:", v5, 0, CFSTR("PPXJSALibraryManager.m"), 129);
  }

}

void sub_100005308(uint64_t a1, int a2)
{
  _QWORD v3[4];
  id v4;
  id v5;

  if (a2)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100005394;
    v3[3] = &unk_10002D298;
    v4 = *(id *)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);

  }
}

id sub_100005394(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  objc_msgSend(v2, "emitRemoveFromCollectionEventWithTracker:collectionID:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:", *(_QWORD *)(a1 + 32), kBKCollectionDefaultIDWantToRead, *(_QWORD *)(a1 + 40), 1, 0, 0, 0, 0);

  return +[PPXBookDataStoreServices _analyticsSubmitRemoveFromWantListEventWithTracker:contentID:](PPXBookDataStoreServices, "_analyticsSubmitRemoveFromWantListEventWithTracker:contentID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void sub_1000054C0(uint64_t a1, int a2)
{
  _QWORD block[4];
  id v4;
  id v5;
  uint64_t v6;

  if (a2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005554;
    block[3] = &unk_10002D2E8;
    v6 = *(_QWORD *)(a1 + 48);
    v4 = *(id *)(a1 + 32);
    v5 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
}

void sub_100005554(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_contentDataForContentID:tracker:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  objc_msgSend(v2, "emitAddToCollectionEventWithTracker:collectionID:contentData:", *(_QWORD *)(a1 + 40), kBKCollectionDefaultIDWantToRead, v4);

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  objc_msgSend(v3, "emitWantListAddEventWithTracker:contentData:", *(_QWORD *)(a1 + 40), v4);

}

void sub_100005684(uint64_t a1, uint64_t a2)
{
  id v3;
  id v4;

  v3 = objc_retainBlock(*(id *)(a1 + 32));
  if (v3)
  {
    v4 = v3;
    (*((void (**)(id, uint64_t))v3 + 2))(v3, a2);
    v3 = v4;
  }

}

void sub_1000057D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  char v18;

  if ((a2 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BCCloudAssetManager sharedManager](BCCloudAssetManager, "sharedManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetDetailManager"));

    v7 = *(void **)(a1 + 32);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000058D4;
    v13[3] = &unk_10002D360;
    v8 = v7;
    v18 = *(_BYTE *)(a1 + 56);
    v10 = *(void **)(a1 + 40);
    v9 = *(_QWORD *)(a1 + 48);
    v14 = v8;
    v17 = v9;
    v15 = v10;
    v16 = v6;
    v11 = v6;
    -[NSObject assetDetailForAssetID:completion:](v11, "assetDetailForAssetID:completion:", v8, v13);

  }
  else
  {
    v12 = BCProductPageExtensionLog(a1, a2, a3, a4);
    v11 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10001EA9C(a1, v11);
  }

}

void sub_1000058D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;

  v13 = a2;
  v5 = a3;
  v6 = v13;
  if (!v13)
  {
    v14 = objc_msgSend(objc_alloc((Class)BCMutableAssetDetail), "initWithAssetID:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    objc_msgSend(v14, "setDateFinished:", v7);

    v6 = v14;
  }
  v15 = v6;
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(v6, "setIsFinished:", 1);
    objc_msgSend(v15, "setNotFinished:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "dateFinished"));

    if (!v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "lastOpenDate"));
      if (v9)
      {
        objc_msgSend(v15, "setDateFinished:", v9);
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
        objc_msgSend(v15, "setDateFinished:", v10);

      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "_contentDataForContentID:tracker:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40)));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
    objc_msgSend(v12, "emitMarkAsFinishedEventWithTracker:contentData:markedData:", *(_QWORD *)(a1 + 40), v11, 0);

  }
  else
  {
    objc_msgSend(v6, "setIsFinished:", 0);
    objc_msgSend(v15, "setNotFinished:", 1);
    objc_msgSend(v15, "setDateFinished:", 0);
  }
  objc_msgSend(*(id *)(a1 + 48), "setAssetDetail:completion:", v15, 0);

}

void sub_100005B1C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if (v9)
    v6 = objc_msgSend(v9, "isFinished");
  else
    v6 = 0;
  v7 = objc_retainBlock(*(id *)(a1 + 32));
  v8 = v7;
  if (v7)
    (*((void (**)(id, id))v7 + 2))(v7, v6);

}

void sub_100005E28(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000356C8;
  qword_1000356C8 = (uint64_t)v1;

}

void sub_100005EB8(id a1)
{
  PPXProductPageContext *v1;
  void *v2;

  v1 = objc_alloc_init(PPXProductPageContext);
  v2 = (void *)qword_1000356D0;
  qword_1000356D0 = (uint64_t)v1;

}

void sub_100005F40(id a1)
{
  PPXProductPageActions *v1;
  void *v2;

  v1 = objc_alloc_init(PPXProductPageActions);
  v2 = (void *)qword_1000356E0;
  qword_1000356E0 = (uint64_t)v1;

}

void sub_100006510(id a1, NSString *a2, BLPurchaseResponse *a3, NSError *a4)
{
  uint64_t v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = BCProductPageExtensionLog(a1, a2, a3, a4);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Just purchased or redownloaded a book", v6, 2u);
  }

}

void sub_100006690(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void **v10;
  const __CFString **v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  const __CFString *v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "longLongValue")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BLPurchaseRequest requestWithBuyParameters:storeIdentifier:](BLPurchaseRequest, "requestWithBuyParameters:storeIdentifier:", v2, v3));

  v5 = objc_msgSend(v4, "setAudiobook:", *(unsigned __int8 *)(a1 + 56));
  if (*(_QWORD *)(a1 + 48))
  {
    v24[0] = *(_QWORD *)(a1 + 48);
    v23[0] = CFSTR("BATracker");
    v23[1] = CFSTR("hasRacSupport");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 57)));
    v24[1] = v9;
    v10 = (void **)v24;
    v11 = (const __CFString **)v23;
    v12 = 2;
  }
  else
  {
    v13 = BCProductPageExtensionLog(v5, v6, v7, v8);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10001EBF4(v14);

    v21 = CFSTR("hasRacSupport");
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 57)));
    v22 = v9;
    v10 = &v22;
    v11 = &v21;
    v12 = 1;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v11, v12));
  objc_msgSend(v4, "setAnalyticsInfo:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[JSABridge sharedInstance](JSABridge, "sharedInstance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "windowManager"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000068AC;
  v19[3] = &unk_10002D498;
  v20 = *(id *)(a1 + 40);
  objc_msgSend(v18, "purchaseWithRequest:uiManager:completion:", v4, v17, v19);

}

void sub_1000068AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  id v6;

  if (a4)
  {
    v5 = BSUIGetLibraryItemStateUpdater(a1);
    v6 = (id)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v6, "updateStateToPurchaseFailedForIdentifier:", *(_QWORD *)(a1 + 32));

  }
}

void sub_100006C40(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_100006C5C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100007120(id a1)
{
  PPXBLDownloadController *v1;
  void *v2;

  v1 = objc_alloc_init(PPXBLDownloadController);
  v2 = (void *)qword_1000356F0;
  qword_1000356F0 = (uint64_t)v1;

}

id sub_1000073F4(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_performBlockOnAllAssetsForAssetID:block:", *(_QWORD *)(a1 + 40), &stru_10002D520);
}

void sub_100007408(id a1, PPXBLDownloadAsset *a2)
{
  PPXBLDownloadAsset *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadAsset downloadStatus](v2, "downloadStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "downloadID"));
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BLDownloadQueue sharedInstance](BLDownloadQueue, "sharedInstance"));
    objc_msgSend(v5, "cancelDownloadWithID:withCompletion:", v4, 0);

    v6 = BCBookDownloadLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PPXBLDownloadAsset identifier](v2, "identifier"));
      v9 = 138412546;
      v10 = v8;
      v11 = 2114;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "download canceled %@, downloadID=%{public}@", (uint8_t *)&v9, 0x16u);

    }
  }

}

void sub_100007B30(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_msgSend(*(id *)(a1 + 40), "_updateDownloadingAssets:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), (_QWORD)v8);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void sub_100007D4C(uint64_t a1)
{
  id v2;
  id v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  id v38;
  uint8_t v39;
  _BYTE v40[15];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];

  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v42;
    *(_QWORD *)&v4 = 138543362;
    v37 = v4;
    v38 = v2;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bk_assetIdentifier", v37));
        if (objc_msgSend(v9, "length"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "downloadingAssets"));
          v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v9));

          if (v11)
          {
            -[NSObject setDownloadStatus:](v11, "setDownloadStatus:", v8);
            if (objc_msgSend(v8, "downloadPhase") != (id)3)
            {
              if ((-[NSObject isAudiobook](v11, "isAudiobook") & 1) != 0)
              {
                v13 = objc_claimAutoreleasedReturnValue(-[NSObject parent](v11, "parent"));
                if (!v13)
                  goto LABEL_28;
                v19 = BCBookDownloadLog();
                v20 = objc_claimAutoreleasedReturnValue(v19);
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v11, "identifier"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject downloadID](v11, "downloadID"));
                  *(_DWORD *)buf = 138412546;
                  v46 = v21;
                  v47 = 2114;
                  v48 = v22;
                  _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "download completed audiobook child identifier=%@, downloadID=%{public}@", buf, 0x16u);

                }
                v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "downloadingAssets"));
                v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v11, "identifier"));
                objc_msgSend(v23, "removeObjectForKey:", v24);

                -[NSObject removeFromParent](v11, "removeFromParent");
                v25 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject children](v13, "children"));
                v26 = objc_msgSend(v25, "count");

                if (!v26)
                {
                  v27 = BCBookDownloadLog();
                  v28 = objc_claimAutoreleasedReturnValue(v27);
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                  {
                    v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v13, "identifier"));
                    *(_DWORD *)buf = v37;
                    v46 = v29;
                    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "download completed audiobook parent identifier=%{public}@", buf, 0xCu);

                  }
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "downloadingAssets"));
                  v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v13, "identifier"));
                  objc_msgSend(v30, "removeObjectForKey:", v31);

                }
              }
              else
              {
                v32 = BCBookDownloadLog();
                v33 = objc_claimAutoreleasedReturnValue(v32);
                if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
                {
                  v34 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v11, "identifier"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject downloadID](v11, "downloadID"));
                  *(_DWORD *)buf = 138412546;
                  v46 = v34;
                  v47 = 2114;
                  v48 = v35;
                  _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "download completed identifier=%@, downloadID=%{public}@", buf, 0x16u);

                }
                v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "downloadingAssets"));
                v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject identifier](v11, "identifier"));
                -[NSObject removeObjectForKey:](v13, "removeObjectForKey:", v36);

              }
              v2 = v38;
              goto LABEL_28;
            }
            v12 = BCBookDownloadLog();
            v13 = objc_claimAutoreleasedReturnValue(v12);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downloadID"));
              *(_DWORD *)buf = 138412546;
              v46 = v9;
              v47 = 2114;
              v48 = v14;
              v15 = v13;
              v16 = "completed asset was paused: %@, downloadID:%{public}@";
              goto LABEL_15;
            }
          }
          else
          {
            v18 = BCBookDownloadLog();
            v13 = objc_claimAutoreleasedReturnValue(v18);
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "downloadID"));
              *(_DWORD *)buf = 138412546;
              v46 = v9;
              v47 = 2114;
              v48 = v14;
              v15 = v13;
              v16 = "download completed untracked identifier=%@, downloadID=%{public}@";
LABEL_15:
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v16, buf, 0x16u);

            }
          }
LABEL_28:

          goto LABEL_29;
        }
        v17 = BCBookDownloadLog();
        v11 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_10001EDC8(&v39, v40, v11);
LABEL_29:

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v5);
  }

}

uint64_t sub_10000826C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  __int128 v18[2];
  __int128 v19[2];
  __int128 v20[2];

  sub_100009484((uint64_t)a1, (uint64_t)v20);
  sub_100009484((uint64_t)a2, (uint64_t)v19);
  v10 = sub_100009484((uint64_t)a4, (uint64_t)v18);
  v11 = (id)BSUIGetLibraryItemStateProvider(v10);
  sub_100008DE4(a4);
  sub_100008DE4(a2);
  sub_100008DE4(a1);
  v12 = objc_opt_self(BSUILibraryItemStateProvider);
  v13 = swift_dynamicCastObjCClassUnconditional(v11, v12, 0, 0, 0);
  v14 = (char *)a5 + *(int *)(type metadata accessor for PPXAddToWantToReadActionItem(0) + 36);
  v15 = enum case for ContextActionType.addToWantToRead(_:);
  v16 = type metadata accessor for ContextActionType(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  sub_100009414(v20, (uint64_t)a5);
  sub_100009414(v19, (uint64_t)(a5 + 5));
  a5[10] = a3;
  result = sub_100009414(v18, (uint64_t)(a5 + 11));
  a5[16] = v13;
  a5[17] = &off_10002DE40;
  return result;
}

uint64_t sub_100008390()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter(&v13, v2, v3);
  if ((v16 & 1) == 0)
  {
    sub_100009414(&v13, (uint64_t)v17);
    v5 = v18;
    v6 = v19;
    sub_10000942C(v17, v18);
    v7 = dispatch thunk of ContextAssetInfoProtocol.isInWantToRead.getter(v5, v6);
    if (v7 == 2)
    {
      sub_100009484((uint64_t)v17, (uint64_t)&v13);
    }
    else
    {
      v8 = v7;
      sub_100009484((uint64_t)v17, (uint64_t)&v13);
      if ((v8 & 1) != 0)
      {
        v4 = 0;
LABEL_10:
        sub_100008DE4(&v13);
        sub_100008DE4(v17);
        return v4;
      }
    }
    v9 = v14;
    v10 = v15;
    sub_10000942C(&v13, v14);
    v11 = dispatch thunk of ContextAssetInfoProtocol.isOwned.getter(v9, v10);
    if (v11 == 2)
      v4 = 0;
    else
      v4 = v11 & 1;
    goto LABEL_10;
  }
  sub_100009450((uint64_t)&v13);
  return 0;
}

uint64_t sub_1000084A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v1 + 104) = v0;
  v2 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v1 + 112) = static MainActor.shared.getter();
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000850C, v3, v4);
}

uint64_t sub_10000850C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString v21;

  v1 = *(_QWORD **)(v0 + 104);
  swift_release(*(_QWORD *)(v0 + 112));
  v2 = v1[3];
  v3 = v1[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter((_QWORD *)(v0 + 16), v2, v3);
  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
  {
    sub_100009450(v0 + 16);
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 104);
    sub_100009414((__int128 *)(v0 + 16), v0 + 64);
    v5 = (void *)objc_opt_self(PPXBookDataStoreServices);
    v6 = *(_QWORD *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v6);
    dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v6, v7);
    v9 = v8;
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
    objc_msgSend(v5, "addStoreIDToWantToRead:tracker:", v10, *(_QWORD *)(v4 + 80));

    v11 = *(void **)(v4 + 128);
    v12 = *(_QWORD *)(v0 + 88);
    v13 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v12);
    dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v12, v13);
    v15 = v14;
    v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v15);
    objc_msgSend(v11, "updateWantToReadState:identifier:", 1, v16);

    v17 = *(_QWORD *)(v0 + 88);
    v18 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v17);
    dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v17, v18);
    v20 = v19;
    v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v20);
    objc_msgSend(v11, "updateItemOfInterestForItemIdentifier:", v21);

    sub_100008DE4((_QWORD *)(v0 + 64));
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000086A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 36);
  v5 = type metadata accessor for ContextActionType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_100008700(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to ContextActionItem.asyncSubMenu.getter[1]);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100008760;
  return ContextActionItem.asyncSubMenu.getter(a1, a2);
}

uint64_t sub_100008760(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v6 = *v1;
  v3 = *(_QWORD *)(v6 + 16);
  v4 = *v1;
  v6 = v4;
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_1000087B4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100034684);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000087F8;
  return sub_1000084A0();
}

uint64_t sub_1000087F8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100008840@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100009484(v1 + 40, a1);
}

uint64_t sub_10000885C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100009484(v1, a1);
}

void *sub_100008878()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 80);
  v2 = v1;
  return v1;
}

uint64_t sub_10000889C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100009484(v1 + 88, a1);
}

uint64_t variable initialization expression of PPXContextMenuProvider.swipeActionItems()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ActionItem;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = sub_1000089B0(&qword_1000344C8);
  v1 = swift_allocObject(v0, 96, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100026DD0;
  v2 = type metadata accessor for PPXMarkedAsFinishedActionItem(0);
  v3 = sub_100008C0C(&qword_1000344D0, type metadata accessor for PPXMarkedAsFinishedActionItem, (uint64_t)&unk_100026F98);
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v3;
  v4 = type metadata accessor for PPXMarkedAsStillReadingActionItem(0);
  v5 = sub_100008C0C(&qword_1000344D8, type metadata accessor for PPXMarkedAsStillReadingActionItem, (uint64_t)&unk_100027420);
  *(_QWORD *)(v1 + 48) = v4;
  *(_QWORD *)(v1 + 56) = v5;
  ActionItem = type metadata accessor for PPXAddToWantToReadActionItem(0);
  v7 = sub_100008C0C(&qword_1000344E0, type metadata accessor for PPXAddToWantToReadActionItem, (uint64_t)&unk_100026E78);
  *(_QWORD *)(v1 + 64) = ActionItem;
  *(_QWORD *)(v1 + 72) = v7;
  v8 = type metadata accessor for PPXRemoveFromWantToReadActionItem(0);
  v9 = sub_100008C0C(&qword_1000344E8, type metadata accessor for PPXRemoveFromWantToReadActionItem, (uint64_t)&unk_1000271F0);
  *(_QWORD *)(v1 + 80) = v8;
  *(_QWORD *)(v1 + 88) = v9;
  return v1;
}

uint64_t sub_1000089B0(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for PPXAddToWantToReadActionItem(uint64_t a1)
{
  uint64_t result;

  result = qword_1000345C8;
  if (!qword_1000345C8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PPXAddToWantToReadActionItem);
  return result;
}

uint64_t variable initialization expression of PPXContextMenuProvider.actionItems()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ActionItem;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v0 = sub_1000089B0(&qword_1000344C8);
  v1 = swift_allocObject(v0, 208, 7);
  *(_OWORD *)(v1 + 16) = xmmword_100026DE0;
  v2 = type metadata accessor for PPXAddToCollectionActionItem(0);
  v3 = sub_100008C0C(&qword_1000344F0, type metadata accessor for PPXAddToCollectionActionItem, (uint64_t)&unk_1000277D0);
  *(_QWORD *)(v1 + 32) = v2;
  *(_QWORD *)(v1 + 40) = v3;
  ActionItem = type metadata accessor for PPXAddToWantToReadActionItem(0);
  v5 = sub_100008C0C(&qword_1000344E0, type metadata accessor for PPXAddToWantToReadActionItem, (uint64_t)&unk_100026E78);
  *(_QWORD *)(v1 + 48) = ActionItem;
  *(_QWORD *)(v1 + 56) = v5;
  v6 = type metadata accessor for PPXDownloadActionItem(0);
  v7 = sub_100008C0C(&qword_1000344F8, type metadata accessor for PPXDownloadActionItem, (uint64_t)&unk_1000278B8);
  *(_QWORD *)(v1 + 64) = v6;
  *(_QWORD *)(v1 + 72) = v7;
  v8 = type metadata accessor for PPXDislikeActionItem(0);
  v9 = sub_100008C0C(&qword_100034500, type metadata accessor for PPXDislikeActionItem, (uint64_t)&unk_1000276B8);
  *(_QWORD *)(v1 + 80) = v8;
  *(_QWORD *)(v1 + 88) = v9;
  *(_QWORD *)(v1 + 96) = type metadata accessor for LikeActionItem(0);
  *(_QWORD *)(v1 + 104) = &protocol witness table for LikeActionItem;
  v10 = type metadata accessor for PPXMarkedAsFinishedActionItem(0);
  v11 = sub_100008C0C(&qword_1000344D0, type metadata accessor for PPXMarkedAsFinishedActionItem, (uint64_t)&unk_100026F98);
  *(_QWORD *)(v1 + 112) = v10;
  *(_QWORD *)(v1 + 120) = v11;
  v12 = type metadata accessor for PPXMarkedAsStillReadingActionItem(0);
  v13 = sub_100008C0C(&qword_1000344D8, type metadata accessor for PPXMarkedAsStillReadingActionItem, (uint64_t)&unk_100027420);
  *(_QWORD *)(v1 + 128) = v12;
  *(_QWORD *)(v1 + 136) = v13;
  *(_QWORD *)(v1 + 144) = type metadata accessor for RateAndReviewActionItem(0);
  *(_QWORD *)(v1 + 152) = &protocol witness table for RateAndReviewActionItem;
  v14 = type metadata accessor for PPXRemoveDownloadActionItem(0);
  v15 = sub_100008C0C(&qword_100034508, type metadata accessor for PPXRemoveDownloadActionItem, (uint64_t)&unk_100027580);
  *(_QWORD *)(v1 + 160) = v14;
  *(_QWORD *)(v1 + 168) = v15;
  v16 = type metadata accessor for PPXRemoveFromWantToReadActionItem(0);
  v17 = sub_100008C0C(&qword_1000344E8, type metadata accessor for PPXRemoveFromWantToReadActionItem, (uint64_t)&unk_1000271F0);
  *(_QWORD *)(v1 + 176) = v16;
  *(_QWORD *)(v1 + 184) = v17;
  *(_QWORD *)(v1 + 192) = type metadata accessor for ShareActionItem(0);
  *(_QWORD *)(v1 + 200) = &protocol witness table for ShareActionItem;
  return v1;
}

uint64_t sub_100008C0C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100008C4C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  __int128 v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  __int128 v21;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = v19 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    v8 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(v4 + 64) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(v4 + 40, (uint64_t)(a2 + 5));
    v9 = (void *)a2[10];
    *(_QWORD *)(v4 + 80) = v9;
    v10 = *((_OWORD *)a2 + 7);
    *(_OWORD *)(v4 + 112) = v10;
    v11 = v10;
    v12 = **(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8);
    v13 = v9;
    v12(v4 + 88, (uint64_t)(a2 + 11), v11);
    v21 = *((_OWORD *)a2 + 8);
    *(_OWORD *)(v4 + 128) = v21;
    v14 = *(int *)(a3 + 36);
    v15 = v4 + v14;
    v16 = (uint64_t)a2 + v14;
    v17 = type metadata accessor for ContextActionType(0);
    v18 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16);
    swift_unknownObjectRetain(v21);
    v18(v15, v16, v17);
  }
  return v4;
}

uint64_t sub_100008D80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_100008DE4((_QWORD *)a1);
  sub_100008DE4((_QWORD *)(a1 + 40));

  sub_100008DE4((_QWORD *)(a1 + 88));
  swift_unknownObjectRelease(*(_QWORD *)(a1 + 128));
  v4 = a1 + *(int *)(a2 + 36);
  v5 = type metadata accessor for ContextActionType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_100008DE4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100008E04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t);
  __int128 v19;

  v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, a2 + 40);
  v8 = *(void **)(a2 + 80);
  *(_QWORD *)(a1 + 80) = v8;
  v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 112) = v9;
  v10 = v9;
  v11 = **(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8);
  v12 = v8;
  v11(a1 + 88, a2 + 88, v10);
  v19 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 128) = v19;
  v13 = *(int *)(a3 + 36);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = type metadata accessor for ContextActionType(0);
  v17 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
  swift_unknownObjectRetain(v19);
  v17(v14, v15, v16);
  return a1;
}

_QWORD *sub_100008F04(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  sub_100008FB4(a1, a2);
  sub_100008FB4(a1 + 5, a2 + 5);
  v6 = (void *)a1[10];
  v7 = (void *)a2[10];
  a1[10] = v7;
  v8 = v7;

  sub_100008FB4(a1 + 11, a2 + 11);
  v9 = a2[16];
  v10 = a2[17];
  v11 = a1[16];
  a1[16] = v9;
  swift_unknownObjectRetain(v9);
  swift_unknownObjectRelease(v11);
  a1[17] = v10;
  v12 = *(int *)(a3 + 36);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = type metadata accessor for ContextActionType(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  return a1;
}

_QWORD *sub_100008FB4(_QWORD *result, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v15[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v11 = *result;
        v12 = *a2;
        swift_retain(*a2);
        result = (_QWORD *)swift_release(v11);
        *v3 = v12;
      }
      else
      {
        return (_QWORD *)(*(uint64_t (**)(_QWORD *, _QWORD *, _QWORD))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        v10 = *result;
        if ((v8 & 0x20000) != 0)
        {
          v14 = *a2;
          *v3 = *a2;
          swift_retain(v14);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (_QWORD *)swift_release(v10);
      }
      else
      {
        (*(void (**)(_BYTE *, _QWORD *, uint64_t))(v6 + 32))(v15, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          v13 = *a2;
          *v3 = *a2;
          swift_retain(v13);
        }
        else
        {
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (_QWORD *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v15, v4);
      }
    }
  }
  return result;
}

uint64_t sub_10000911C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v5 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v5;
  v6 = *(_OWORD *)(a2 + 88);
  v7 = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v7;
  *(_OWORD *)(a1 + 88) = v6;
  v8 = *(int *)(a3 + 36);
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  v11 = type metadata accessor for ContextActionType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_1000091B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  sub_100008DE4((_QWORD *)a1);
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  sub_100008DE4((_QWORD *)(a1 + 40));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v7 = *(void **)(a1 + 80);
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;

  sub_100008DE4((_QWORD *)(a1 + 88));
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  v9 = *(_QWORD *)(a2 + 128);
  v10 = *(_QWORD *)(a2 + 136);
  v11 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v9;
  swift_unknownObjectRelease(v11);
  *(_QWORD *)(a1 + 136) = v10;
  v12 = *(int *)(a3 + 36);
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for ContextActionType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_100009280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000928C);
}

uint64_t sub_10000928C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t sub_100009308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100009314);
}

uint64_t sub_100009314(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t sub_100009388(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = "(";
  v4[1] = "(";
  v4[2] = &unk_100026E48;
  v4[3] = "(";
  v4[4] = &unk_100026E60;
  result = type metadata accessor for ContextActionType(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 6, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100009414(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

_QWORD *sub_10000942C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100009450(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for ContextSelectionMode - 1) + 8))();
  return a1;
}

uint64_t sub_100009484(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

__n128 sub_1000094C8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1000094D8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1000094F8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGPoint()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_100034688)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_10002D6C0);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100034688);
  }
}

uint64_t static EventReporter.setupLibraryAnalyticsDataProvider()()
{
  _BYTE v1[24];
  ValueMetadata *v2;
  unint64_t v3;

  type metadata accessor for EventReporter(0);
  v2 = &type metadata for LibraryAnalyticsDataProvider;
  v3 = sub_1000095BC();
  return static EventReporter.libraryAnalyticsDataProvider.setter(v1);
}

unint64_t sub_1000095BC()
{
  unint64_t result;

  result = qword_1000346F0;
  if (!qword_1000346F0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for LibraryAnalyticsDataProvider, &type metadata for LibraryAnalyticsDataProvider);
    atomic_store(result, (unint64_t *)&qword_1000346F0);
  }
  return result;
}

void sub_100009600(id a1, SEL a2)
{
  _BYTE v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  type metadata accessor for EventReporter(0);
  v3 = &type metadata for LibraryAnalyticsDataProvider;
  v4 = sub_1000095BC();
  static EventReporter.libraryAnalyticsDataProvider.setter(v2);
}

uint64_t sub_100009648(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100009654);
}

uint64_t sub_100009654(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t sub_1000096D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000096DC);
}

uint64_t sub_1000096DC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PPXMarkedAsFinishedActionItem(uint64_t a1)
{
  uint64_t result;

  result = qword_100034750;
  if (!qword_100034750)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PPXMarkedAsFinishedActionItem);
  return result;
}

uint64_t sub_10000978C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = "(";
  v4[1] = "(";
  v4[2] = &unk_100026F68;
  v4[3] = "(";
  v4[4] = &unk_100026F80;
  result = type metadata accessor for ContextActionType(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 6, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100009818@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  __int128 v18[2];
  __int128 v19[2];
  __int128 v20[2];

  sub_100009484((uint64_t)a1, (uint64_t)v20);
  sub_100009484((uint64_t)a2, (uint64_t)v19);
  v10 = sub_100009484((uint64_t)a4, (uint64_t)v18);
  v11 = (id)BSUIGetLibraryItemStateProvider(v10);
  sub_100008DE4(a4);
  sub_100008DE4(a2);
  sub_100008DE4(a1);
  v12 = objc_opt_self(BSUILibraryItemStateProvider);
  v13 = swift_dynamicCastObjCClassUnconditional(v11, v12, 0, 0, 0);
  v14 = (char *)a5 + *(int *)(type metadata accessor for PPXMarkedAsFinishedActionItem(0) + 36);
  v15 = enum case for ContextActionType.markAsFinished(_:);
  v16 = type metadata accessor for ContextActionType(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  sub_100009414(v20, (uint64_t)a5);
  sub_100009414(v19, (uint64_t)(a5 + 5));
  a5[10] = a3;
  result = sub_100009414(v18, (uint64_t)(a5 + 11));
  a5[16] = v13;
  a5[17] = &off_10002DE40;
  return result;
}

BOOL sub_10000993C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter(&v13, v2, v3);
  if ((v16 & 1) != 0)
  {
    sub_100009450((uint64_t)&v13);
    return 0;
  }
  else
  {
    sub_100009414(&v13, (uint64_t)v17);
    v5 = v18;
    v6 = v19;
    sub_10000942C(v17, v18);
    v7 = dispatch thunk of ContextAssetInfoProtocol.isOwned.getter(v5, v6);
    if (v7 == 2)
    {
      sub_100009484((uint64_t)v17, (uint64_t)&v13);
      v4 = 0;
    }
    else
    {
      v8 = v7;
      sub_100009484((uint64_t)v17, (uint64_t)&v13);
      if ((v8 & 1) != 0)
      {
        v9 = v14;
        v10 = v15;
        sub_10000942C(&v13, v14);
        v11 = dispatch thunk of ContextAssetInfoProtocol.isMarkedFinished.getter(v9, v10);
        v4 = v11 != 2 && (v11 & 1) == 0;
      }
      else
      {
        v4 = 0;
      }
    }
    sub_100008DE4(&v13);
    sub_100008DE4(v17);
  }
  return v4;
}

uint64_t sub_100009A54()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1[13] = v0;
  v2 = type metadata accessor for ProductionType(0);
  v1[14] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[15] = v3;
  v1[16] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1000089B0((uint64_t *)&unk_1000347B0);
  v1[17] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for ContentType(0);
  v1[18] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v1[19] = v6;
  v1[20] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for ContentAcquisitionType(0);
  v1[21] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v1[22] = v8;
  v1[23] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MainActor(0);
  v1[24] = static MainActor.shared.getter();
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  return swift_task_switch(sub_100009B5C, v10, v11);
}

uint64_t sub_100009B5C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unsigned int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSString v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSString v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int v60;
  uint64_t v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;

  v1 = *(_QWORD **)(v0 + 104);
  swift_release(*(_QWORD *)(v0 + 192));
  v2 = v1[3];
  v3 = v1[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter((_QWORD *)(v0 + 16), v2, v3);
  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
  {
    sub_100009450(v0 + 16);
  }
  else
  {
    v5 = *(_QWORD *)(v0 + 176);
    v4 = *(_QWORD *)(v0 + 184);
    v69 = v4;
    v7 = *(_QWORD *)(v0 + 160);
    v6 = *(_QWORD *)(v0 + 168);
    v65 = v6;
    v66 = v5;
    v8 = *(_QWORD *)(v0 + 144);
    v9 = *(_QWORD *)(v0 + 152);
    v63 = *(_QWORD *)(v0 + 136);
    v10 = *(_QWORD *)(v0 + 120);
    v67 = *(_QWORD *)(v0 + 128);
    v64 = v10;
    v70 = *(_QWORD *)(v0 + 104);
    v71 = *(_QWORD *)(v0 + 112);
    sub_100009414((__int128 *)(v0 + 16), v0 + 64);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v4, enum case for ContentAcquisitionType.storeBought(_:), v6);
    v11 = *(_QWORD *)(v0 + 88);
    v12 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v11);
    v13 = dispatch thunk of ContextAssetInfoProtocol.assetType.getter(v11, v12);
    v14 = static ContextActionAssetType.== infix(_:_:)(v13, 3);
    v15 = (unsigned int *)&enum case for ContentType.audiobook(_:);
    if ((v14 & 1) == 0)
      v15 = (unsigned int *)&enum case for ContentType.book(_:);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 104))(v7, *v15, v8);
    v16 = *(_QWORD *)(v0 + 88);
    v17 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v16);
    v18 = dispatch thunk of ContextAssetInfoProtocol.supplementalContentCount.getter(v16, v17);
    v20 = Optional<A>.int32Value.getter(v18, v19 & 1);
    v62 = v20;
    v68 = HIDWORD(v20) & 1;
    type metadata accessor for EventReporter(0);
    v21 = (void *)((uint64_t (*)(void))static EventReporter.shared.getter)();
    v22 = *(_QWORD *)(v0 + 88);
    v23 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v22);
    v24 = dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v22, v23);
    v26 = v25;
    dispatch thunk of EventReporter.seriesType(for:)(v24);
    swift_bridgeObjectRelease(v26);

    v27 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v10 + 104))(v67, enum case for ProductionType.unknown(_:), v71);
    v28 = (void *)static EventReporter.shared.getter(v27);
    v61 = *(_QWORD *)(v70 + 80);
    v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(kBKCollectionDefaultIDFinished);
    v31 = v30;
    v33 = *(_QWORD *)(v0 + 88);
    v32 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v33);
    v34 = dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v33, v32);
    v36 = v35;
    EventReporter.emitAddToCollectionEvent(using:for:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:)(v61, v29, v31, v34, v35, v4, v7, v62 | ((unint64_t)v68 << 32), v63, v67);
    swift_bridgeObjectRelease(v36);
    swift_bridgeObjectRelease(v31);

    v38 = (void *)static EventReporter.shared.getter(v37);
    v39 = *(_QWORD *)(v0 + 88);
    v40 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v39);
    v41 = dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v39, v40);
    v43 = v42;
    LOBYTE(v60) = 2;
    EventReporter.emitMarkAsFinishedEvent(using:for:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:isFinishedDateSet:)(v61, v41, v42, v4, v7, v62 | ((unint64_t)v68 << 32), v63, v67, v60);
    swift_bridgeObjectRelease(v43);

    v44 = (void *)objc_opt_self(PPXBookDataStoreServices);
    v45 = *(_QWORD *)(v0 + 88);
    v46 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v45);
    dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v45, v46);
    v48 = v47;
    v49 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v48);
    objc_msgSend(v44, "setFinishedState:storeID:tracker:", 1, v49, v61);

    v50 = *(void **)(v70 + 128);
    v51 = *(_QWORD *)(v0 + 88);
    v52 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v51);
    dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v51, v52);
    v54 = v53;
    v55 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v54);
    objc_msgSend(v50, "updateItemOfInterestForItemIdentifier:", v55);

    (*(void (**)(uint64_t, uint64_t))(v64 + 8))(v67, v71);
    sub_10000A010(v63);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    (*(void (**)(uint64_t, uint64_t))(v66 + 8))(v69, v65);
    sub_100008DE4((_QWORD *)(v0 + 64));
  }
  v56 = *(_QWORD *)(v0 + 160);
  v58 = *(_QWORD *)(v0 + 128);
  v57 = *(_QWORD *)(v0 + 136);
  swift_task_dealloc(*(_QWORD *)(v0 + 184));
  swift_task_dealloc(v56);
  swift_task_dealloc(v57);
  swift_task_dealloc(v58);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009FC8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_1000347AC);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000087F8;
  return sub_100009A54();
}

uint64_t sub_10000A010(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000089B0((uint64_t *)&unk_1000347B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_10000A0D0(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  char *v6;
  char *v7;
  char *v8;
  NSString v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  char *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  char *v23;
  uint64_t v25;
  objc_super v26;

  *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager] = 0;
  v6 = &v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyApproveNotification];
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  v7 = &v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyDeclineNotification];
  *(_OWORD *)v7 = 0u;
  *((_OWORD *)v7 + 1) = 0u;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_initialProductPageItem] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_jsaLibraryManager] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__navigationItem] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_ppxNavigationController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_setupData] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__syncLayoutController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_windowProvider] = 0;
  v8 = v3;
  *(_QWORD *)&v8[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_objectGraph] = sub_10000DE30();

  if (a2)
  {
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v9 = 0;
  }
  v26.receiver = v8;
  v26.super_class = (Class)type metadata accessor for ProductPageRootViewController();
  v10 = (char *)objc_msgSendSuper2(&v26, "initWithNibName:bundle:", v9, a3);

  v11 = *(_QWORD *)&v10[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_objectGraph];
  v12 = type metadata accessor for FallbackSceneSessionProvider();
  v13 = v10;
  swift_retain(v11);
  BaseObjectGraph.inject<A>(_:)(&v25, v12, v12);
  swift_release(v11);
  v14 = v25;
  swift_unknownObjectWeakAssign(v25 + 16, v13);
  swift_release(v14);
  v15 = (void *)objc_opt_self(NSNotificationCenter);
  v16 = objc_msgSend(v15, "defaultCenter");
  objc_msgSend(v16, "addObserver:selector:name:object:", v13, "_smartInvertDidChange:", UIAccessibilityInvertColorsStatusDidChangeNotification, 0);

  v17 = v13;
  if (UIAccessibilityIsInvertColorsEnabled())
    v18 = 2;
  else
    v18 = 0;
  objc_msgSend(v17, "setOverrideUserInterfaceStyle:", v18);

  v19 = objc_msgSend(objc_allocWithZone((Class)TUISyncLayoutController), "initWithDelegate:", v17);
  v20 = *(void **)&v17[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__syncLayoutController];
  *(_QWORD *)&v17[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__syncLayoutController] = v19;

  v21 = objc_msgSend(v15, "defaultCenter");
  v22 = JSABridgeDidReloadNotification;
  v23 = v17;
  objc_msgSend(v21, "addObserver:selector:name:object:", v23, "_bridgeDidReload:", v22, 0);

  return v23;
}

id sub_10000A3F4()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  id v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id result;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  objc_super v40;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for ProductPageRootViewController();
  v40.receiver = v1;
  v40.super_class = v6;
  objc_msgSendSuper2(&v40, "viewDidLoad");
  v7 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "bu_groupUserDefaults");
  v8 = String._bridgeToObjectiveC()();
  v9 = objc_msgSend(v7, "stringForKey:", v8);

  if (v9)
  {
    v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v16 = v15;

  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  result = (id)BCProductPageExtensionLog(v10, v11, v12, v13);
  if (result)
  {
    Logger.init(_:)();
    v18 = swift_bridgeObjectRetain(v16);
    v19 = Logger.logObject.getter(v18);
    v20 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v19, v20))
    {
      v37 = v2;
      v21 = swift_slowAlloc(12, -1);
      v36 = v3;
      v22 = (uint8_t *)v21;
      v23 = swift_slowAlloc(32, -1);
      v35 = v5;
      v24 = v23;
      v39 = v23;
      *(_DWORD *)v22 = 136315138;
      swift_bridgeObjectRetain(v16);
      v25 = Optional<A>.description.getter(v14, v16);
      v27 = v26;
      swift_bridgeObjectRelease(v16);
      v38 = sub_100012DF0(v25, v27, &v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v38, &v39, v22 + 4, v22 + 12);
      swift_bridgeObjectRelease_n(v16, 2);
      swift_bridgeObjectRelease(v27);
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "viewDidLoad - bootUrl: %s", v22, 0xCu);
      swift_arrayDestroy(v24, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v24, -1, -1);
      swift_slowDealloc(v22, -1, -1);

      (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v37);
    }
    else
    {

      swift_bridgeObjectRelease_n(v16, 2);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    objc_msgSend((id)type metadata accessor for EventReporter(0), "setupLibraryAnalyticsDataProvider");
    v28 = objc_allocWithZone((Class)type metadata accessor for AppAnalyticsExtensionManager(0));
    v29 = AppAnalyticsExtensionManager.init(uploadsEnabled:)(0);
    v30 = OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager;
    v31 = *(void **)&v1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager];
    *(_QWORD *)&v1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager] = v29;

    v32 = *(void **)&v1[v30];
    if (v32)
    {
      v33 = v32;
      dispatch thunk of AppAnalyticsExtensionManager.setupTracking(for:)(v1);

    }
    return (id)sub_10000E408();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000A7D8(void *a1, uint64_t a2, uint64_t a3, const char **a4, SEL *a5)
{
  const char *v8;
  id v9;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)type metadata accessor for ProductPageRootViewController();
  v8 = *a4;
  v9 = v10.receiver;
  objc_msgSendSuper2(&v10, v8, a3);
  objc_msgSend(v9, *a5, v10.receiver, v10.super_class);

}

void sub_10000A844(char a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  objc_class *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  id v17;
  NSString v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  _QWORD aBlock[5];
  uint64_t v24;
  objc_super v25;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for ProductPageRootViewController();
  v25.receiver = v2;
  v25.super_class = v8;
  v9 = objc_msgSendSuper2(&v25, "viewDidDisappear:", a1 & 1);
  if ((id)BCProductPageExtensionLog(v9, v10, v11, v12))
  {
    v13 = Logger.init(_:)();
    v14 = Logger.logObject.getter(v13);
    v15 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "viewDidDisappear", v16, 2u);
      swift_slowDealloc(v16, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    objc_msgSend(v2, "bc_analyticsVisibilitySubtreeDidDisappear");
    v17 = objc_msgSend((id)objc_opt_self(NSProcessInfo), "processInfo");
    v18 = String._bridgeToObjectiveC()();
    v19 = swift_allocObject(&unk_10002DA00, 24, 7);
    *(_QWORD *)(v19 + 16) = v2;
    aBlock[4] = sub_10000F7CC;
    v24 = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000ABD8;
    aBlock[3] = &unk_10002DA18;
    v20 = _Block_copy(aBlock);
    v21 = v24;
    v22 = v2;
    swift_release(v21);
    objc_msgSend(v17, "performExpiringActivityWithReason:usingBlock:", v18, v20);
    _Block_release(v20);

  }
  else
  {
    __break(1u);
  }
}

void sub_10000AA58(char a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;

  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin();
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a1 & 1) != 0)
  {
    if ((id)BCProductPageExtensionLog(v6, v7, v8, v9))
    {
      v12 = Logger.init(_:)();
      v13 = Logger.logObject.getter(v12);
      v14 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v13, v14))
      {
        v15 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Process is about to be suspended. Upload metrics might have failed.", v15, 2u);
        swift_slowDealloc(v15, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v5 + 8))(v11, v4);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    v16 = OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager;
    v17 = *(void **)(a2 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager);
    if (v17)
    {
      v18 = v17;
      dispatch thunk of AppAnalyticsExtensionManager.endSession()();

    }
    objc_msgSend((id)objc_opt_self(JSAApplication), "willTerminate");
    v19 = *(void **)(a2 + v16);
    if (v19)
    {
      v21 = v19;
      dispatch thunk of AppAnalyticsExtensionManager.waitForSessionEnd(with:)(2.0);

    }
  }
}

uint64_t sub_10000ABD8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

id sub_10000ACB8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id result;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  id v25;
  objc_class *v26;
  objc_super v27;
  char v28[24];
  __int128 v29;
  uint64_t v30;
  char v31[24];
  __int128 v32;
  uint64_t v33;

  v1 = v0;
  v2 = type metadata accessor for Logger(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (id)BCProductPageExtensionLog(v4, v7, v8, v9);
  if (result)
  {
    v11 = Logger.init(_:)();
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "dealloc", v14, 2u);
      swift_slowDealloc(v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    v15 = (uint64_t)&v1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyApproveNotification];
    swift_beginAccess(&v1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyApproveNotification], v31, 0, 0);
    sub_10000F704(v15, (uint64_t)&v29);
    if (v30)
    {
      sub_10000DB08(&v29, &v32);
      v16 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
      v17 = v33;
      v18 = sub_10000942C(&v32, v33);
      v19 = _bridgeAnythingToObjectiveC<A>(_:)(v18, v17);
      objc_msgSend(v16, "removeObserver:", v19);

      swift_unknownObjectRelease(v19);
      sub_100008DE4(&v32);
    }
    else
    {
      sub_10000F74C((uint64_t)&v29, &qword_100034D60);
    }
    v20 = (uint64_t)&v1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyDeclineNotification];
    swift_beginAccess(&v1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyDeclineNotification], v28, 0, 0);
    sub_10000F704(v20, (uint64_t)&v29);
    if (v30)
    {
      sub_10000DB08(&v29, &v32);
      v21 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
      v22 = v33;
      v23 = sub_10000942C(&v32, v33);
      v24 = _bridgeAnythingToObjectiveC<A>(_:)(v23, v22);
      objc_msgSend(v21, "removeObserver:", v24);

      swift_unknownObjectRelease(v24);
      sub_100008DE4(&v32);
    }
    else
    {
      sub_10000F74C((uint64_t)&v29, &qword_100034D60);
    }
    v25 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    objc_msgSend(v25, "removeObserver:name:object:", v1, JSABridgeDidReloadNotification, 0);

    v26 = (objc_class *)type metadata accessor for ProductPageRootViewController();
    v27.receiver = v1;
    v27.super_class = v26;
    return objc_msgSendSuper2(&v27, "dealloc");
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000B094(void *a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;

  v3 = v2;
  v6 = type metadata accessor for Logger(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);

  v10 = objc_msgSend((id)objc_opt_self(PPXJSAWindowProvider), "sharedProvider");
  if (!v10)
  {
    __break(1u);
    goto LABEL_10;
  }
  v11 = v10;
  v12 = objc_msgSend(v3, "view");
  if (!v12)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v13 = v12;
  v14 = objc_msgSend(v12, "window");

  objc_msgSend(v11, "setWindow:", v14);
  v15 = *(void **)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_initialProductPageItem];
  *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_initialProductPageItem] = a1;
  v16 = a1;

  if (!(id)BCProductPageExtensionLog(v17, v18, v19, v20))
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v21 = Logger.init(_:)();
  v22 = Logger.logObject.getter(v21);
  v23 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v22, v23))
  {
    v24 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, v23, "Starting the javaScript", v24, 2u);
    swift_slowDealloc(v24, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v25 = objc_msgSend(v3, "view");
  if (!v25)
    goto LABEL_12;
  v26 = v25;
  v27 = objc_msgSend(v25, "window");

  if (v27)
  {
    sub_10000E724(v16, a2);

    return;
  }
LABEL_13:
  __break(1u);
}

void sub_10000B378(void *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  _BYTE v21[80];

  if (a3)
  {
    v9 = sub_1000089B0(&qword_100034C88);
    inited = swift_initStackObject(v9, &v20);
    *(_OWORD *)(inited + 16) = xmmword_100027050;
    *(_QWORD *)(inited + 32) = 0x7975426F546B7361;
    *(_QWORD *)(inited + 40) = 0xE800000000000000;
    *(_BYTE *)(inited + 48) = a4 & 1;
    *(_QWORD *)(inited + 72) = &type metadata for Bool;
    strcpy((char *)(inited + 80), "promptString");
    *(_QWORD *)(inited + 120) = &type metadata for String;
    *(_BYTE *)(inited + 93) = 0;
    *(_WORD *)(inited + 94) = -5120;
    *(_QWORD *)(inited + 96) = a2;
    *(_QWORD *)(inited + 104) = a3;
    swift_bridgeObjectRetain(a3);
    v11 = inited;
  }
  else
  {
    v12 = sub_1000089B0(&qword_100034C88);
    v11 = swift_initStackObject(v12, v21);
    *(_OWORD *)(v11 + 16) = xmmword_100027060;
    *(_QWORD *)(v11 + 32) = 0x7975426F546B7361;
    *(_QWORD *)(v11 + 40) = 0xE800000000000000;
    *(_QWORD *)(v11 + 72) = &type metadata for Bool;
    *(_BYTE *)(v11 + 48) = a4 & 1;
  }
  v13 = sub_1000163F8(v11);
  v14 = *(_QWORD *)(v4 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_setupData);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_setupData) = v13;
  swift_bridgeObjectRelease(v14);
  v15 = sub_10000F62C(0, &qword_100034C60, UIBarButtonItem_ptr);
  v16 = objc_msgSend((id)swift_getObjCClassFromMetadata(v15), "appearance");
  v17 = objc_msgSend((id)objc_opt_self(UIColor), "bc_booksKeyColor");
  objc_msgSend(v16, "setTintColor:", v17);

  v18 = *(void **)(v4 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__navigationItem);
  *(_QWORD *)(v4 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__navigationItem) = a1;
  v19 = a1;

  if ((a4 & 1) != 0)
    sub_10000B540();
}

uint64_t sub_10000B540()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void **v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void **v16;
  uint64_t v17;
  _BYTE v19[24];
  void **aBlock;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void *ObjectType;
  void (*v24)(uint64_t);
  uint64_t v25;

  v1 = (void *)objc_opt_self(NSNotificationCenter);
  v2 = objc_msgSend(v1, "defaultCenter");
  v3 = (void *)kJSAParentalApprovalApprovedRequestNotificationName;
  v4 = (void *)objc_opt_self(NSOperationQueue);
  v5 = v3;
  v6 = objc_msgSend(v4, "mainQueue");
  v7 = swift_allocObject(&unk_10002D7F8, 24, 7);
  swift_unknownObjectWeakInit(v7 + 16, v0);
  v24 = sub_10000F5AC;
  v25 = v7;
  aBlock = _NSConcreteStackBlock;
  v21 = 1107296256;
  v22 = sub_10000D488;
  ObjectType = &unk_10002D888;
  v8 = _Block_copy(&aBlock);
  swift_release(v25);
  v9 = (void **)objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", v5, 0, v6, v8);
  _Block_release(v8);

  ObjectType = (void *)swift_getObjectType(v9);
  aBlock = v9;
  v10 = v0 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyApproveNotification;
  swift_beginAccess(v0 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyApproveNotification, v19, 33, 0);
  sub_10000F5C8((uint64_t)&aBlock, v10);
  swift_endAccess(v19);
  v11 = objc_msgSend(v1, "defaultCenter");
  v12 = kJSAParentalApprovalDeclinedRequestNotificationName;
  v13 = objc_msgSend(v4, "mainQueue");
  v14 = swift_allocObject(&unk_10002D7F8, 24, 7);
  swift_unknownObjectWeakInit(v14 + 16, v0);
  v24 = sub_10000F610;
  v25 = v14;
  aBlock = _NSConcreteStackBlock;
  v21 = 1107296256;
  v22 = sub_10000D488;
  ObjectType = &unk_10002D8B0;
  v15 = _Block_copy(&aBlock);
  swift_release(v25);
  v16 = (void **)objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", v12, 0, v13, v15);
  _Block_release(v15);

  ObjectType = (void *)swift_getObjectType(v16);
  aBlock = v16;
  v17 = v0 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyDeclineNotification;
  swift_beginAccess(v0 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyDeclineNotification, v19, 33, 0);
  sub_10000F5C8((uint64_t)&aBlock, v17);
  return swift_endAccess(v19);
}

uint64_t type metadata accessor for ProductPageRootViewController()
{
  return objc_opt_self(_TtC25BooksProductPageExtension29ProductPageRootViewController);
}

Swift::Int sub_10000B8BC(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  Swift::Int result;
  int64_t v7;
  __int128 *v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  _OWORD v34[3];
  uint64_t v35;
  _OWORD v36[2];
  __int128 v37;
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];
  _QWORD *v41;
  uint64_t *v42;

  v2 = &_swiftEmptyDictionarySingleton;
  v41 = &_swiftEmptyDictionarySingleton;
  v31 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v30 = (unint64_t)(63 - v3) >> 6;
  v42 = &v35;
  result = swift_bridgeObjectRetain(a1);
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v9 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v10 = v9 | (v7 << 6);
      goto LABEL_25;
    }
    v11 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    if (v11 >= v30)
      goto LABEL_40;
    v12 = *(_QWORD *)(v31 + 8 * v11);
    v13 = v7 + 1;
    if (!v12)
    {
      v13 = v7 + 2;
      if (v7 + 2 >= v30)
        goto LABEL_40;
      v12 = *(_QWORD *)(v31 + 8 * v13);
      if (!v12)
      {
        v13 = v7 + 3;
        if (v7 + 3 >= v30)
          goto LABEL_40;
        v12 = *(_QWORD *)(v31 + 8 * v13);
        if (!v12)
        {
          v13 = v7 + 4;
          if (v7 + 4 >= v30)
            goto LABEL_40;
          v12 = *(_QWORD *)(v31 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_24:
    v5 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
    v7 = v13;
LABEL_25:
    v15 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v10);
    v17 = *v15;
    v16 = v15[1];
    sub_10000F704(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)v40);
    *(_QWORD *)&v39 = v17;
    *((_QWORD *)&v39 + 1) = v16;
    v37 = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    sub_10000F704((uint64_t)v38, (uint64_t)&v32);
    if (v33)
    {
      sub_10000DB08(&v32, v36);
      v18 = v37;
      v34[2] = v37;
      sub_10000F788((uint64_t)v38, (uint64_t)v42, &qword_100034D60);
      sub_10000DB08(v36, v34);
      v19 = v2[2];
      if (v2[3] <= v19)
      {
        v20 = v19 + 1;
        swift_bridgeObjectRetain(v16);
        sub_10001B1C4(v20, 1);
        v2 = v41;
      }
      else
      {
        swift_bridgeObjectRetain(v16);
      }
      Hasher.init(_seed:)(&v32, v2[5]);
      String.hash(into:)(&v32, v18, *((_QWORD *)&v18 + 1));
      result = Hasher._finalize()();
      v21 = (char *)(v2 + 8);
      v22 = -1 << *((_BYTE *)v2 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~v2[(v23 >> 6) + 8]) != 0)
      {
        v25 = __clz(__rbit64((-1 << v23) & ~v2[(v23 >> 6) + 8])) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v28 = v24 == v27;
          if (v24 == v27)
            v24 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)&v21[8 * v24];
        }
        while (v29 == -1);
        v25 = __clz(__rbit64(~v29)) + (v24 << 6);
      }
      *(_QWORD *)&v21[(v25 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v25;
      *(_OWORD *)(v2[6] + 16 * v25) = v18;
      sub_10000DB08(v34, (_OWORD *)(v2[7] + 32 * v25));
      ++v2[2];
      v8 = (__int128 *)v42;
    }
    else
    {
      swift_bridgeObjectRetain(v16);
      sub_10000F74C((uint64_t)&v37, &qword_100034D98);
      v8 = &v32;
    }
    result = sub_10000F74C((uint64_t)v8, &qword_100034D60);
  }
  v14 = v7 + 5;
  if (v7 + 5 >= v30)
  {
LABEL_40:
    sub_10000DB18(a1);
    return (Swift::Int)v2;
  }
  v12 = *(_QWORD *)(v31 + 8 * v14);
  if (v12)
  {
    v13 = v7 + 5;
    goto LABEL_24;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v30)
      goto LABEL_40;
    v12 = *(_QWORD *)(v31 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_24;
  }
LABEL_42:
  __break(1u);
  return result;
}

id sub_10000BC78(void *a1, void *a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id result;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[5];
  uint64_t v27;

  v6 = type metadata accessor for DispatchWorkItemFlags(0);
  v25 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a2, "currentPackage");
  if (result)
  {
    v14 = result;
    objc_msgSend(a1, "registerTemplateBundlesFromPackage:", result);

    sub_10000F62C(0, &qword_100034C30, OS_dispatch_queue_ptr);
    v15 = (void *)static OS_dispatch_queue.main.getter();
    v16 = swift_allocObject(&unk_10002D938, 24, 7);
    *(_QWORD *)(v16 + 16) = a3;
    aBlock[4] = sub_10000F6C8;
    v27 = v16;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000C9D8;
    aBlock[3] = &unk_10002D950;
    v17 = _Block_copy(aBlock);
    v18 = v27;
    v19 = a3;
    v20 = swift_release(v18);
    static DispatchQoS.unspecified.getter(v20);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v21 = sub_100008C0C(&qword_100034C38, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v22 = sub_1000089B0(&qword_100034C40);
    v23 = sub_10000F56C(&qword_100034C48, &qword_100034C40);
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v22, v23, v6, v21);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v8, v17);
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v25 + 8))(v8, v6);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_10000BEC4(char *a1)
{
  Class isa;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  Class v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  Class v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  id v51;
  void *v52;
  id v53;
  void *v54;
  id v55;
  uint64_t v56;
  void **v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  void *v66;
  _QWORD v67[5];
  uint64_t v68;

  isa = *(Class *)&a1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions];
  if (isa)
  {
    v3 = swift_bridgeObjectRetain(*(_QWORD *)&a1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions]);
    v4 = sub_10000C548(v3);
    swift_bridgeObjectRelease(isa);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  v5 = objc_msgSend(objc_allocWithZone((Class)PPXFeedViewController), "initWithOptions:", isa);

  if (!v5)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v6 = objc_msgSend(a1, "navigationItem");
  v7 = objc_msgSend(v6, "leftBarButtonItem");

  if (v7)
  {
    v8 = sub_1000089B0(&qword_100034C50);
    v9 = swift_allocObject(v8, 40, 7);
    *(_OWORD *)(v9 + 16) = xmmword_100027070;
    *(_QWORD *)(v9 + 32) = v7;
    v67[0] = v9;
    specialized Array._endMutation()(v9);
    sub_10000F62C(0, &qword_100034C60, UIBarButtonItem_ptr);
    v10 = v5;
    v11 = v7;
    v12 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v67[0]);
    objc_msgSend(v10, "setExtraLeftItems:", v12);

  }
  v13 = objc_msgSend(a1, "navigationItem", v67[0]);
  v14 = objc_msgSend(v13, "rightBarButtonItem");

  if (v14)
  {
    v15 = sub_1000089B0(&qword_100034C50);
    v16 = swift_allocObject(v15, 40, 7);
    *(_OWORD *)(v16 + 16) = xmmword_100027070;
    *(_QWORD *)(v16 + 32) = v14;
    v67[0] = v16;
    specialized Array._endMutation()(v16);
    sub_10000F62C(0, &qword_100034C60, UIBarButtonItem_ptr);
    v17 = v5;
    v18 = v14;
    v19 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v67[0]);
    objc_msgSend(v17, "setExtraRightItems:", v19);

  }
  v20 = objc_msgSend(objc_allocWithZone((Class)UINavigationController), "initWithRootViewController:", v5);
  v21 = objc_msgSend((id)objc_opt_self(PPXProductPageContext), "sharedContext");
  if (!v21)
    goto LABEL_24;
  v22 = v21;
  objc_msgSend(v21, "setNavigationController:", v20);

  v23 = *(void **)&a1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_ppxNavigationController];
  *(_QWORD *)&a1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_ppxNavigationController] = v20;
  v24 = v20;

  objc_msgSend(a1, "addChildViewController:", v24);
  v25 = objc_msgSend(v5, "view");
  if (!v25)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v26 = v25;
  v27 = objc_msgSend(a1, "view");
  if (!v27)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v28 = v27;
  objc_msgSend(v27, "bounds");
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;

  objc_msgSend(v26, "setFrame:", v30, v32, v34, v36);
  v37 = objc_msgSend(v5, "view");
  if (!v37)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v38 = v37;
  objc_msgSend(v37, "setAutoresizingMask:", 18);

  v39 = objc_msgSend(v24, "view");
  if (!v39)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v40 = v39;
  v41 = objc_msgSend(a1, "view");
  if (!v41)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v42 = v41;
  objc_msgSend(v41, "bounds");
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;

  objc_msgSend(v40, "setFrame:", v44, v46, v48, v50);
  v51 = objc_msgSend(a1, "view");
  if (!v51)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v52 = v51;
  v53 = objc_msgSend(v24, "view");
  if (!v53)
  {
LABEL_31:
    __break(1u);
    return;
  }
  v54 = v53;
  objc_msgSend(v52, "addSubview:", v53);

  objc_msgSend(v24, "didMoveToParentViewController:", a1);
  v55 = objc_msgSend(objc_allocWithZone((Class)PPXWelcomeGDPRItem), "init");
  if (objc_msgSend(v55, "welcomeScreenShouldShow"))
  {
    v56 = swift_allocObject(&unk_10002D988, 24, 7);
    *(_QWORD *)(v56 + 16) = 0;
    v57 = (void **)(v56 + 16);
    v58 = swift_allocObject(&unk_10002D9B0, 32, 7);
    *(_QWORD *)(v58 + 16) = v56;
    *(_QWORD *)(v58 + 24) = v55;
    v67[4] = sub_10000F6FC;
    v68 = v58;
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 1107296256;
    v67[2] = sub_10000C974;
    v67[3] = &unk_10002D9C8;
    v59 = _Block_copy(v67);
    v60 = v68;
    swift_retain(v56);
    v61 = v55;
    swift_release(v60);
    v62 = objc_msgSend(v61, "welcomeScreenViewControllerWithCompletion:", v59);
    _Block_release(v59);
    if (v62)
    {
      swift_beginAccess(v57, v67, 1, 0);
      v63 = *v57;
      *v57 = v62;
      v64 = v62;

      objc_msgSend(v64, "setModalPresentationStyle:", 2);
      objc_msgSend(v64, "setModalTransitionStyle:", 2);
      v65 = objc_msgSend(v64, "presentationController");
      if (v65)
      {
        v66 = v65;
        objc_msgSend(v65, "setDelegate:", a1);

      }
      objc_msgSend(v24, "presentViewController:animated:completion:", v64, 1, 0);
      swift_release(v56);

    }
    else
    {
      swift_release(v56);
    }
  }
  objc_msgSend(a1, "loadDidFinish", v67[0]);

}

uint64_t sub_10000C548(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  int64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  _OWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  _OWORD v38[3];
  _OWORD v39[2];
  __int128 v40;
  _OWORD v41[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_1000089B0(&qword_100034C68);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v29 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v28 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v14 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v14);
    v16 = v9 + 1;
    if (!v15)
    {
      v16 = v9 + 2;
      if (v9 + 2 >= v28)
        goto LABEL_37;
      v15 = *(_QWORD *)(v29 + 8 * v16);
      if (!v15)
      {
        v16 = v9 + 3;
        if (v9 + 3 >= v28)
          goto LABEL_37;
        v15 = *(_QWORD *)(v29 + 8 * v16);
        if (!v15)
        {
          v16 = v9 + 4;
          if (v9 + 4 >= v28)
            goto LABEL_37;
          v15 = *(_QWORD *)(v29 + 8 * v16);
          if (!v15)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v16 << 6);
    v9 = v16;
LABEL_28:
    v18 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v13);
    v20 = *v18;
    v19 = v18[1];
    sub_10000DACC(*(_QWORD *)(a1 + 56) + 32 * v13, (uint64_t)v41);
    *(_QWORD *)&v40 = v20;
    *((_QWORD *)&v40 + 1) = v19;
    v38[2] = v40;
    v39[0] = v41[0];
    v39[1] = v41[1];
    *(_QWORD *)&v38[0] = v20;
    *((_QWORD *)&v38[0] + 1) = v19;
    swift_bridgeObjectRetain(v19);
    swift_dynamicCast(&v30, v38, &type metadata for String, &type metadata for AnyHashable, 7);
    sub_10000DB08(v39, v33);
    v34 = v30;
    v35 = v31;
    v36 = v32;
    sub_10000DB08(v33, v37);
    v30 = v34;
    v31 = v35;
    v32 = v36;
    sub_10000DB08(v37, v38);
    sub_10000DB08(v38, &v34);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v21 = -1 << *((_BYTE *)v3 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)]) != 0)
    {
      v10 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)&v7[8 * (v22 >> 6)])) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v24 = 0;
      v25 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v25 && (v24 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v26 = v23 == v25;
        if (v23 == v25)
          v23 = 0;
        v24 |= v26;
        v27 = *(_QWORD *)&v7[8 * v23];
      }
      while (v27 == -1);
      v10 = __clz(__rbit64(~v27)) + (v23 << 6);
    }
    *(_QWORD *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v30;
    *(_OWORD *)(v11 + 16) = v31;
    *(_QWORD *)(v11 + 32) = v32;
    result = (uint64_t)sub_10000DB08(&v34, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }
  v17 = v9 + 5;
  if (v9 + 5 >= v28)
  {
LABEL_37:
    swift_release(v3);
    sub_10000DB18(a1);
    return (uint64_t)v3;
  }
  v15 = *(_QWORD *)(v29 + 8 * v17);
  if (v15)
  {
    v16 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v28)
      goto LABEL_37;
    v15 = *(_QWORD *)(v29 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_10000C90C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v6;
  _BYTE v8[24];

  swift_beginAccess(a3 + 16, v8, 0, 0);
  v6 = *(void **)(a3 + 16);
  if (v6)
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(a4, "welcomeScreenViewControllerDidDismiss");
}

uint64_t sub_10000C974(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  swift_retain(v2);
  v3(v4, v6);
  swift_release(v2);
  return swift_bridgeObjectRelease(v6);
}

uint64_t sub_10000C9D8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_10000CAAC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[5];
  uint64_t v23;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v21 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v4 = (char *)&v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend((id)objc_opt_self(BRCConfigurationManager), "sharedInstance");
  objc_msgSend(v9, "resetForJavascript");

  sub_10000F62C(0, &qword_100034C30, OS_dispatch_queue_ptr);
  v10 = (void *)static OS_dispatch_queue.main.getter();
  v11 = swift_allocObject(&unk_10002D848, 24, 7);
  *(_QWORD *)(v11 + 16) = v1;
  aBlock[4] = sub_10000DAC4;
  v23 = v11;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000C9D8;
  aBlock[3] = &unk_10002D860;
  v12 = _Block_copy(aBlock);
  v13 = v23;
  v14 = v1;
  v15 = swift_release(v13);
  static DispatchQoS.unspecified.getter(v15);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v16 = sub_100008C0C(&qword_100034C38, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v17 = sub_1000089B0(&qword_100034C40);
  v18 = sub_10000F56C(&qword_100034C48, &qword_100034C40);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v17, v18, v2, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v4, v12);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_10000CCEC(char *a1)
{
  Class isa;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  Class v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  Class v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  Class v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  isa = *(Class *)&a1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions];
  if (isa)
  {
    v3 = swift_bridgeObjectRetain(*(_QWORD *)&a1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions]);
    v4 = sub_10000C548(v3);
    swift_bridgeObjectRelease(isa);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v4);
  }
  v26 = objc_msgSend(objc_allocWithZone((Class)PPXFeedViewController), "initWithOptions:", isa);

  if (v26)
  {
    v5 = objc_msgSend(a1, "navigationItem");
    v6 = objc_msgSend(v5, "leftBarButtonItem");

    if (v6)
    {
      v7 = sub_1000089B0(&qword_100034C50);
      v8 = swift_allocObject(v7, 40, 7);
      *(_OWORD *)(v8 + 16) = xmmword_100027070;
      *(_QWORD *)(v8 + 32) = v6;
      v28 = v8;
      specialized Array._endMutation()(v8);
      sub_10000F62C(0, &qword_100034C60, UIBarButtonItem_ptr);
      v9 = v26;
      v10 = v6;
      v11 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v28);
      objc_msgSend(v9, "setExtraLeftItems:", v11);

    }
    v12 = objc_msgSend(a1, "navigationItem", v26);
    v13 = objc_msgSend(v12, "rightBarButtonItem");

    if (v13)
    {
      v14 = sub_1000089B0(&qword_100034C50);
      v15 = swift_allocObject(v14, 40, 7);
      *(_OWORD *)(v15 + 16) = xmmword_100027070;
      *(_QWORD *)(v15 + 32) = v13;
      v29 = v15;
      specialized Array._endMutation()(v15);
      sub_10000F62C(0, &qword_100034C60, UIBarButtonItem_ptr);
      v16 = v27;
      v17 = v13;
      v18 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v29);
      objc_msgSend(v16, "setExtraRightItems:", v18);

    }
    v19 = *(void **)&a1[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_ppxNavigationController];
    v20 = v27;
    if (v19)
    {
      v21 = sub_1000089B0(&qword_100034C50);
      v22 = swift_allocObject(v21, 40, 7);
      *(_OWORD *)(v22 + 16) = xmmword_100027070;
      *(_QWORD *)(v22 + 32) = v27;
      v30 = v22;
      specialized Array._endMutation()(v22);
      sub_10000F62C(0, &qword_100034C58, UIViewController_ptr);
      v23 = v27;
      v24 = v19;
      v25 = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v30);
      objc_msgSend(v24, "setViewControllers:", v25);

      v20 = v27;
    }

  }
  else
  {
    __break(1u);
  }
}

id sub_10000D110()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD aBlock[5];
  uint64_t v22;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((objc_msgSend((id)objc_opt_self(NSThread), "isMainThread") & 1) != 0)
  {
    if (UIAccessibilityIsInvertColorsEnabled())
      v10 = 2;
    else
      v10 = 0;
    return objc_msgSend(v0, "setOverrideUserInterfaceStyle:", v10);
  }
  else
  {
    sub_10000F62C(0, &qword_100034C30, OS_dispatch_queue_ptr);
    v20 = static OS_dispatch_queue.main.getter();
    v12 = swift_allocObject(&unk_10002D7F8, 24, 7);
    swift_unknownObjectWeakInit(v12 + 16, v1);
    aBlock[4] = sub_10000DA60;
    v22 = v12;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000C9D8;
    aBlock[3] = &unk_10002D810;
    v13 = _Block_copy(aBlock);
    v14 = swift_release(v22);
    static DispatchQoS.unspecified.getter(v14);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v15 = sub_100008C0C(&qword_100034C38, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v16 = sub_1000089B0(&qword_100034C40);
    v17 = sub_10000F56C(&qword_100034C48, &qword_100034C40);
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v16, v17, v2, v15);
    v18 = (void *)v20;
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v9, v5, v13);
    _Block_release(v13);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

void sub_10000D36C(uint64_t a1)
{
  uint64_t v1;
  void *Strong;
  id v3;
  uint64_t v4;
  _BYTE v5[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v5, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = Strong;
    if (UIAccessibilityIsInvertColorsEnabled())
      v4 = 2;
    else
      v4 = 0;
    objc_msgSend(v3, "setOverrideUserInterfaceStyle:", v4);

  }
}

uint64_t sub_10000D3EC(void *a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v13;

  v7 = type metadata accessor for Notification(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = a1;
  a4();

  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_10000D488(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *);
  uint64_t v11;

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *))(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a2);
  swift_retain(v8);
  v9(v7);
  swift_release(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

void sub_10000D52C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *Strong;
  void *v6;
  _BYTE v7[24];

  v4 = a2 + 16;
  swift_beginAccess(a2 + 16, v7, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v4);
  if (Strong)
  {
    v6 = Strong;
    objc_msgSend(Strong, "finishWithResult:completion:", a3, 0);

  }
}

id sub_10000D590@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)BSUIDownloadProgressCenter), "init");
  *a1 = result;
  return result;
}

id sub_10000D5C8@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = (id)BSUIGetLibraryItemStateProvider();
  *a1 = result;
  return result;
}

uint64_t sub_10000D5F4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  type metadata accessor for BaseObjectGraph(0);
  v2 = static BaseObjectGraph.current.getter();
  v3 = type metadata accessor for PPXContextMenuProvider();
  BaseObjectGraph.inject<A>(_:)(&v5, v3, v3);
  result = swift_release(v2);
  *a1 = v5;
  return result;
}

uint64_t sub_10000D650@<X0>(_QWORD *a1@<X8>)
{
  return sub_10000D77C((uint64_t (*)(uint64_t))type metadata accessor for FallbackSceneSessionProvider, (unint64_t *)&unk_100034DD0, (uint64_t)&unk_100027130, a1);
}

uint64_t sub_10000D66C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t result;
  uint64_t v13;

  v2 = type metadata accessor for FigaroProvider(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v13 - v7;
  type metadata accessor for BaseObjectGraph(0);
  v9 = static BaseObjectGraph.current.getter();
  FigaroProvider.init()();
  v10 = (char *)objc_allocWithZone((Class)type metadata accessor for PPXContextMenuProvider());
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  v11 = sub_10000DB20((uint64_t)v6, v9, v10);
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  *a1 = v11;
  return result;
}

uint64_t sub_10000D760@<X0>(_QWORD *a1@<X8>)
{
  return sub_10000D77C((uint64_t (*)(uint64_t))type metadata accessor for PPXContextMenuProvider, (unint64_t *)&unk_100034DC0, (uint64_t)&protocol conformance descriptor for PPXContextMenuProvider, a1);
}

uint64_t sub_10000D77C@<X0>(uint64_t (*a1)(uint64_t)@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  type metadata accessor for BaseObjectGraph(0);
  v8 = static BaseObjectGraph.current.getter();
  v9 = a1(0);
  a4[3] = v9;
  a4[4] = sub_100008C0C(a2, a1, a3);
  BaseObjectGraph.inject<A>(_:)(a4, v9, v9);
  return swift_release(v8);
}

uint64_t sub_10000D8E4()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for FigaroPageContextProvider()
{
  return objc_opt_self(_TtC25BooksProductPageExtensionP33_AC68F8D98DD61EB0508C63F232C3654325FigaroPageContextProvider);
}

void sub_10000D914()
{
  uint64_t v0;
  void *Strong;
  void *v2;
  id v3;
  id v4;
  id v5;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(v0 + 16);
  v2 = Strong;
  if (Strong)
  {
    v3 = objc_msgSend(Strong, "view");

    if (v3)
    {
      v4 = objc_msgSend(v3, "window");

      if (v4)
      {
        v5 = objc_msgSend(v4, "windowScene");

        if (v5)
        {
          objc_msgSend(v5, "session");

        }
      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_10000D9D8()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for FallbackSceneSessionProvider()
{
  return objc_opt_self(_TtC25BooksProductPageExtensionP33_AC68F8D98DD61EB0508C63F232C3654328FallbackSceneSessionProvider);
}

void sub_10000DA1C()
{
  sub_10000D914();
}

uint64_t sub_10000DA3C()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000DA60()
{
  uint64_t v0;

  sub_10000D36C(v0);
}

uint64_t sub_10000DA68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000DA78(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000DA80(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_10000DAC4()
{
  uint64_t v0;

  sub_10000CCEC(*(char **)(v0 + 16));
}

uint64_t sub_10000DACC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_10000DB08(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000DB18(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

id sub_10000DB20(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ActionItem;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_class *ObjectType;
  objc_super v32;
  _QWORD v33[5];

  ObjectType = (objc_class *)swift_getObjectType(a3);
  v5 = type metadata accessor for FigaroProvider(0);
  v33[3] = v5;
  v33[4] = &protocol witness table for FigaroProvider;
  v6 = sub_10000F7D4(v33);
  (*(void (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v6, a1, v5);
  v27 = OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_swipeActionItems;
  v7 = sub_1000089B0(&qword_1000344C8);
  v8 = swift_allocObject(v7, 96, 7);
  *(_OWORD *)(v8 + 16) = xmmword_100026DD0;
  v29 = type metadata accessor for PPXMarkedAsFinishedActionItem(0);
  v9 = sub_100008C0C(&qword_1000344D0, type metadata accessor for PPXMarkedAsFinishedActionItem, (uint64_t)&unk_100026F98);
  *(_QWORD *)(v8 + 32) = v29;
  *(_QWORD *)(v8 + 40) = v9;
  v10 = type metadata accessor for PPXMarkedAsStillReadingActionItem(0);
  v11 = sub_100008C0C(&qword_1000344D8, type metadata accessor for PPXMarkedAsStillReadingActionItem, (uint64_t)&unk_100027420);
  *(_QWORD *)(v8 + 48) = v10;
  *(_QWORD *)(v8 + 56) = v11;
  ActionItem = type metadata accessor for PPXAddToWantToReadActionItem(0);
  v13 = sub_100008C0C(&qword_1000344E0, type metadata accessor for PPXAddToWantToReadActionItem, (uint64_t)&unk_100026E78);
  *(_QWORD *)(v8 + 64) = ActionItem;
  *(_QWORD *)(v8 + 72) = v13;
  v14 = type metadata accessor for PPXRemoveFromWantToReadActionItem(0);
  v15 = sub_100008C0C(&qword_1000344E8, type metadata accessor for PPXRemoveFromWantToReadActionItem, (uint64_t)&unk_1000271F0);
  *(_QWORD *)(v8 + 80) = v14;
  *(_QWORD *)(v8 + 88) = v15;
  *(_QWORD *)&a3[v27] = v8;
  v28 = OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_actionItems;
  v16 = swift_allocObject(v7, 208, 7);
  *(_OWORD *)(v16 + 16) = xmmword_100026DE0;
  v17 = type metadata accessor for PPXAddToCollectionActionItem(0);
  v18 = sub_100008C0C(&qword_1000344F0, type metadata accessor for PPXAddToCollectionActionItem, (uint64_t)&unk_1000277D0);
  *(_QWORD *)(v16 + 32) = v17;
  *(_QWORD *)(v16 + 40) = v18;
  *(_QWORD *)(v16 + 48) = ActionItem;
  *(_QWORD *)(v16 + 56) = v13;
  v19 = type metadata accessor for PPXDownloadActionItem(0);
  v20 = sub_100008C0C(&qword_1000344F8, type metadata accessor for PPXDownloadActionItem, (uint64_t)&unk_1000278B8);
  *(_QWORD *)(v16 + 64) = v19;
  *(_QWORD *)(v16 + 72) = v20;
  v21 = type metadata accessor for PPXDislikeActionItem(0);
  v22 = sub_100008C0C(&qword_100034500, type metadata accessor for PPXDislikeActionItem, (uint64_t)&unk_1000276B8);
  *(_QWORD *)(v16 + 80) = v21;
  *(_QWORD *)(v16 + 88) = v22;
  *(_QWORD *)(v16 + 96) = type metadata accessor for LikeActionItem(0);
  *(_QWORD *)(v16 + 104) = &protocol witness table for LikeActionItem;
  *(_QWORD *)(v16 + 112) = v29;
  *(_QWORD *)(v16 + 120) = v9;
  *(_QWORD *)(v16 + 128) = v10;
  *(_QWORD *)(v16 + 136) = v11;
  *(_QWORD *)(v16 + 144) = type metadata accessor for RateAndReviewActionItem(0);
  *(_QWORD *)(v16 + 152) = &protocol witness table for RateAndReviewActionItem;
  v23 = type metadata accessor for PPXRemoveDownloadActionItem(0);
  v24 = sub_100008C0C(&qword_100034508, type metadata accessor for PPXRemoveDownloadActionItem, (uint64_t)&unk_100027580);
  *(_QWORD *)(v16 + 160) = v23;
  *(_QWORD *)(v16 + 168) = v24;
  *(_QWORD *)(v16 + 176) = v14;
  *(_QWORD *)(v16 + 184) = v15;
  *(_QWORD *)(v16 + 192) = type metadata accessor for ShareActionItem(0);
  *(_QWORD *)(v16 + 200) = &protocol witness table for ShareActionItem;
  *(_QWORD *)&a3[v28] = v16;
  sub_100009484((uint64_t)v33, (uint64_t)&a3[OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider]);
  *(_QWORD *)&a3[OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_objectGraph] = a2;
  v32.receiver = a3;
  v32.super_class = ObjectType;
  v25 = objc_msgSendSuper2(&v32, "init");
  sub_100008DE4(v33);
  return v25;
}

uint64_t sub_10000DE30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, uint64_t);
  char *v44;
  uint64_t v45;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;

  v54 = type metadata accessor for Dependency(0);
  v56 = *(_QWORD *)(v54 - 8);
  v0 = __chkstk_darwin(v54);
  v55 = (char *)&v47 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __chkstk_darwin(v0);
  v49 = (char *)&v47 - v3;
  v4 = __chkstk_darwin(v2);
  v58 = (char *)&v47 - v5;
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v47 - v7;
  v9 = __chkstk_darwin(v6);
  v11 = (char *)&v47 - v10;
  v12 = __chkstk_darwin(v9);
  v59 = (char *)&v47 - v13;
  v14 = __chkstk_darwin(v12);
  v16 = (char *)&v47 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v47 - v17;
  type metadata accessor for BaseObjectGraph(0);
  v57 = BaseObjectGraph.__allocating_init(name:_:)(0xD000000000000019, 0x8000000100027080, &_swiftEmptyArrayStorage);
  v19 = swift_retain(v57);
  v20 = static PartialObjectGraphProvider.buildPartialObjectGraph()(v19);
  v51 = v20;
  v21 = sub_10000F62C(0, &qword_100034D78, BSUIDownloadProgressCenter_ptr);
  v53 = v18;
  Dependency.init<A>(satisfying:with:)(v21, sub_10000D590, 0, v21);
  v22 = sub_1000089B0(&qword_100034D70);
  v52 = v16;
  Dependency.init<A>(satisfying:with:)(v22, sub_10000D5C8, 0, v22);
  v23 = sub_1000089B0(&qword_100034DA0);
  Dependency.init<A>(satisfying:with:)(v23, sub_10000D5F4, 0, v23);
  v24 = type metadata accessor for FallbackSceneSessionProvider();
  v25 = swift_allocObject(v24, 24, 7);
  swift_unknownObjectWeakInit(v25 + 16, 0);
  v60 = v25;
  v50 = v11;
  Dependency.init<A>(satisfying:with:)(v24, &v60, v24);
  v26 = sub_1000089B0(&qword_100034DA8);
  v27 = v8;
  v48 = v8;
  Dependency.init<A>(satisfying:with:)(v26, sub_10000D650, 0, v26);
  v28 = sub_1000089B0(&qword_100034DB0);
  v29 = type metadata accessor for FigaroPageContextProvider();
  v60 = swift_allocObject(v29, 16, 7);
  Dependency.init<A>(satisfying:with:)(v28, &v60, v28);
  v30 = type metadata accessor for PPXContextMenuProvider();
  Dependency.init<A>(satisfying:with:)(v30, sub_10000D66C, 0, v30);
  v31 = sub_1000089B0(&qword_100034DB8);
  v32 = v55;
  Dependency.init<A>(satisfying:with:)(v31, sub_10000D760, 0, v31);
  v33 = v57;
  swift_retain(v57);
  v34 = dispatch thunk of BaseObjectGraph.adding(allDependenciesOf:)(v20);
  swift_release(v33);
  swift_retain(v34);
  v35 = dispatch thunk of BaseObjectGraph.adding(dependency:)(v18);
  swift_release(v34);
  swift_retain(v35);
  v36 = dispatch thunk of BaseObjectGraph.adding(dependency:)(v16);
  swift_release(v35);
  swift_retain(v36);
  v37 = dispatch thunk of BaseObjectGraph.adding(dependency:)(v59);
  swift_release(v36);
  swift_retain(v37);
  v38 = dispatch thunk of BaseObjectGraph.adding(dependency:)(v11);
  swift_release(v37);
  swift_retain(v38);
  v39 = dispatch thunk of BaseObjectGraph.adding(dependency:)(v27);
  swift_release(v38);
  swift_retain(v39);
  v40 = dispatch thunk of BaseObjectGraph.adding(dependency:)(v58);
  swift_release(v39);
  swift_retain(v40);
  v41 = v49;
  v42 = dispatch thunk of BaseObjectGraph.adding(dependency:)(v49);
  swift_release(v40);
  swift_retain(v42);
  v47 = dispatch thunk of BaseObjectGraph.adding(dependency:)(v32);
  swift_release(v34);
  swift_release(v35);
  swift_release(v36);
  swift_release(v37);
  swift_release(v38);
  swift_release(v39);
  swift_release(v40);
  swift_release_n(v42, 2);
  swift_release_n(v57, 2);
  swift_release(v51);
  v43 = *(void (**)(char *, uint64_t))(v56 + 8);
  v44 = v32;
  v45 = v54;
  v43(v44, v54);
  v43(v41, v45);
  v43(v58, v45);
  v43(v48, v45);
  v43(v50, v45);
  v43(v59, v45);
  v43(v52, v45);
  v43(v53, v45);
  return v47;
}

void sub_10000E31C()
{
  char *v0;
  char *v1;
  char *v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager] = 0;
  v1 = &v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyApproveNotification];
  *(_OWORD *)v1 = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  v2 = &v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_askToBuyDeclineNotification];
  *(_OWORD *)v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_initialProductPageItem] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_jsaLibraryManager] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__navigationItem] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_ppxNavigationController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_setupData] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController__syncLayoutController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_windowProvider] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100028710, "BooksProductPageExtension/ProductPageRootViewController.swift", 61, 2, 51, 0);
  __break(1u);
}

uint64_t sub_10000E408()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t ObjCClassFromMetadata;
  id v16;
  NSString v17;
  NSString v18;
  id v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t result;
  id v22;
  id v23;
  NSURL *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;

  v0 = sub_1000089B0(&qword_100034D68);
  __chkstk_darwin(v0);
  v2 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = __chkstk_darwin(v3);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v27 - v8;
  v28 = (id)objc_opt_self(BRCConfigurationManager);
  v10 = objc_msgSend(v28, "sharedInstance");
  v11 = (void *)objc_opt_self(JSABridge);
  v12 = objc_msgSend(v11, "sharedInstance");
  objc_msgSend(v10, "setJsBridge:", v12);

  type metadata accessor for RCDataContainer(0);
  v13 = (void *)static RCDataContainer.default.getter();
  RCDataContainer.bridge.setter(objc_msgSend(v11, "sharedInstance"));

  v14 = sub_10000F62C(0, &qword_100034D28, BRCConfigurationManager_ptr);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v14);
  v16 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  v17 = String._bridgeToObjectiveC()();
  v18 = String._bridgeToObjectiveC()();
  v19 = objc_msgSend(v16, "URLForResource:withExtension:", v17, v18);

  if (v19)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v19);

    v20 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v20(v2, v7, v3);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v2, 0, 1, v3);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
    if ((_DWORD)result != 1)
    {
      v20(v9, v2, v3);
      v22 = objc_msgSend(v28, "sharedInstance");
      v23 = BRCBooksDefaultsNamespace;
      URL._bridgeToObjectiveC()(v24);
      v26 = v25;
      objc_msgSend(v22, "registerNamespace:withDefaults:forBundleID:", v23, v25, BRCBundleID);

      return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    }
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  }
  __break(1u);
  return result;
}

void sub_10000E724(void *a1, uint64_t a2)
{
  char *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  NSString v20;
  id v21;
  id v22;
  NSString v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t inited;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  Swift::Int v52;
  uint64_t v53;
  id v54;
  _QWORD *v55;
  void *v56;
  _QWORD *v57;
  id v58;
  id v59;
  char *v60;
  id v61;
  void *v62;
  id v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  char v67;
  __int128 v68;
  __int128 v69;
  id (*v70)();
  _QWORD *v71;
  uint64_t v72;

  v3 = v2;
  v65 = a1;
  v66 = a2;
  v4 = sub_1000089B0(&qword_100034D68);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v62 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v62 - v8;
  v10 = objc_msgSend((id)objc_opt_self(BSUIStoreServices), "sharedInstance");
  if (!v10)
  {
    __break(1u);
    goto LABEL_26;
  }
  v11 = v10;
  objc_msgSend(v10, "setDelegate:", v3);

  v12 = *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_objectGraph];
  v13 = sub_1000089B0(&qword_100034D70);
  BaseObjectGraph.inject<A>(_:)(&v68, v13, v13);
  v14 = (void *)v68;
  v15 = sub_10000F62C(0, &qword_100034D78, BSUIDownloadProgressCenter_ptr);
  v64 = v12;
  BaseObjectGraph.inject<A>(_:)(&v68, v15, v15);
  v16 = (void *)v68;
  v17 = objc_msgSend((id)objc_opt_self(BSUITemplate), "manager");
  v18 = objc_msgSend(v17, "dynamicRegistry");
  v62 = v14;
  v19 = objc_msgSend(v14, "stateCenter");
  v20 = String._bridgeToObjectiveC()();
  objc_msgSend(v18, "registerStateProvider:forKind:", v19, v20);

  v21 = objc_msgSend(v17, "dynamicRegistry");
  v22 = v16;
  v23 = String._bridgeToObjectiveC()();
  objc_msgSend(v21, "registerProgressProvider:forKind:", v22, v23);

  v24 = objc_msgSend((id)objc_opt_self(PPXBLDownloadController), "sharedController");
  v63 = v22;
  if (!v24)
  {
LABEL_26:
    __break(1u);
    return;
  }
  v25 = v24;
  objc_msgSend(v24, "startObserving");

  v26 = objc_msgSend((id)objc_opt_self(PPXJSAWindowProvider), "sharedProvider");
  v27 = *(void **)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_windowProvider];
  *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_windowProvider] = v26;

  v28 = objc_msgSend(objc_allocWithZone((Class)PPXJSALibraryManager), "init");
  v29 = *(void **)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_jsaLibraryManager];
  *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_jsaLibraryManager] = v28;

  v30 = OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_setupData;
  v31 = *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_setupData];
  if (!v31 || !*(_QWORD *)(v31 + 16))
  {
    v68 = 0u;
    v69 = 0u;
LABEL_8:
    sub_10000F74C((uint64_t)&v68, &qword_100034D60);
    goto LABEL_9;
  }
  swift_bridgeObjectRetain(*(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_setupData]);
  v32 = sub_10001AF8C(0x7975426F546B7361, 0xE800000000000000);
  if ((v33 & 1) != 0)
  {
    sub_10000DACC(*(_QWORD *)(v31 + 56) + 32 * v32, (uint64_t)&v68);
  }
  else
  {
    v68 = 0u;
    v69 = 0u;
  }
  swift_bridgeObjectRelease(v31);
  if (!*((_QWORD *)&v69 + 1))
    goto LABEL_8;
  if (swift_dynamicCast(&v67, &v68, (char *)&type metadata for Any + 8, &type metadata for Bool, 6)
    && (v67 & 1) != 0)
  {
    v61 = objc_msgSend((id)objc_opt_self(JSAFeedMetadata), "metadataDictionary:variationWithNavigationBarVisibile:", 0, 0);
    v34 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v61, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    goto LABEL_10;
  }
LABEL_9:
  v34 = sub_100016170((uint64_t)&_swiftEmptyArrayStorage);
LABEL_10:
  v35 = sub_1000089B0(&qword_100034D80);
  inited = swift_initStackObject(v35, &v72);
  *(_OWORD *)(inited + 16) = xmmword_100027080;
  *(_QWORD *)(inited + 32) = 7107189;
  *(_QWORD *)(inited + 40) = 0xE300000000000000;
  v37 = objc_msgSend(v65, "productPageURL");
  if (v37)
  {
    v38 = v37;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v37);

    v39 = type metadata accessor for URL(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v7, 0, 1, v39);
  }
  else
  {
    v39 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v7, 1, 1, v39);
  }
  sub_10000F788((uint64_t)v7, (uint64_t)v9, &qword_100034D68);
  type metadata accessor for URL(0);
  v40 = *(_QWORD *)(v39 - 8);
  v41 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v40 + 48))(v9, 1, v39);
  if ((_DWORD)v41 == 1)
  {
    sub_10000F74C((uint64_t)v9, &qword_100034D68);
    *(_OWORD *)(inited + 48) = 0u;
    *(_OWORD *)(inited + 64) = 0u;
  }
  else
  {
    v42 = URL.absoluteString.getter(v41);
    *(_QWORD *)(inited + 72) = &type metadata for String;
    *(_QWORD *)(inited + 48) = v42;
    *(_QWORD *)(inited + 56) = v43;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v9, v39);
  }
  *(_QWORD *)(inited + 80) = 0x6574656D61726170;
  *(_QWORD *)(inited + 88) = 0xEA00000000007372;
  v44 = sub_1000089B0(&qword_100034D88);
  v45 = v66;
  *(_QWORD *)(inited + 96) = v66;
  *(_QWORD *)(inited + 120) = v44;
  strcpy((char *)(inited + 128), "extensionInfo");
  *(_WORD *)(inited + 142) = -4864;
  v46 = *(_QWORD *)&v3[v30];
  if (v46)
  {
    v47 = *(_QWORD *)&v3[v30];
  }
  else
  {
    v47 = 0;
    v44 = 0;
    *(_QWORD *)(inited + 152) = 0;
    *(_QWORD *)(inited + 160) = 0;
  }
  v48 = v62;
  *(_QWORD *)(inited + 144) = v47;
  *(_QWORD *)(inited + 168) = v44;
  *(_QWORD *)(inited + 176) = 0x617461646174656DLL;
  *(_QWORD *)(inited + 184) = 0xE800000000000000;
  *(_QWORD *)(inited + 216) = sub_1000089B0(&qword_100034D90);
  *(_QWORD *)(inited + 192) = v34;
  *(_QWORD *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)(BSUIFeedOptionsKeyContextMenuProvider);
  *(_QWORD *)(inited + 232) = v49;
  v50 = type metadata accessor for PPXContextMenuProvider();
  *(_QWORD *)(inited + 264) = v50;
  swift_bridgeObjectRetain(v46);
  swift_bridgeObjectRetain(v45);
  BaseObjectGraph.inject<A>(_:)((_QWORD *)(inited + 240), v50, v50);
  v51 = sub_1000162B0(inited);
  v52 = sub_10000B8BC(v51);
  swift_bridgeObjectRelease(v51);
  v53 = *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions];
  *(_QWORD *)&v3[OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_rootFeedOptions] = v52;
  swift_bridgeObjectRelease(v53);
  v54 = objc_msgSend((id)objc_opt_self(JSABridge), "sharedInstance");
  v55 = (_QWORD *)swift_allocObject(&unk_10002D8E8, 40, 7);
  v55[2] = v17;
  v55[3] = v54;
  v55[4] = v3;
  v70 = sub_10000F698;
  v71 = v55;
  *(_QWORD *)&v68 = _NSConcreteStackBlock;
  *((_QWORD *)&v68 + 1) = 1107296256;
  *(_QWORD *)&v69 = sub_10000C9D8;
  *((_QWORD *)&v69 + 1) = &unk_10002D900;
  v56 = _Block_copy(&v68);
  v57 = v71;
  v58 = v17;
  v59 = v54;
  v60 = v3;
  swift_release(v57);
  objc_msgSend(v59, "initializeEnvironmentWithDataSource:completion:", v60, v56);
  swift_unknownObjectRelease(v48);

  _Block_release(v56);
}

uint64_t sub_10000EE44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, _QWORD, uint64_t);
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t inited;
  uint64_t result;
  uint64_t v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  _QWORD v61[2];
  uint64_t v62;
  void *v63;

  v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)v61 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v4);
  v6 = (char *)v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v7);
  v9 = (char *)v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61[0] = sub_10000F62C(0, &qword_100034C30, OS_dispatch_queue_ptr);
  static DispatchQoS.userInitiated.getter(v61[0]);
  v63 = &_swiftEmptyArrayStorage;
  v10 = sub_100008C0C(&qword_100034C70, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v11 = sub_1000089B0(&qword_100034C78);
  v12 = sub_10000F56C(&qword_100034C80, &qword_100034C78);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v63, v11, v12, v4, v10);
  v13 = *(void (**)(char *, _QWORD, uint64_t))(v1 + 104);
  v14 = v61[1];
  v13(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v0);
  v15 = (void *)OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000022, 0x8000000100028620, v9, v6, v3, 0);
  v16 = objc_msgSend(objc_allocWithZone((Class)TUITransactionController), "initWithQueue:", v15);
  v17 = sub_1000089B0(&qword_100034C88);
  inited = swift_initStackObject(v17, &v62);
  *(_OWORD *)(inited + 16) = xmmword_100027090;
  result = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("analyticsController"));
  *(_QWORD *)(inited + 32) = result;
  *(_QWORD *)(inited + 40) = v20;
  v21 = *(void **)(v14 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_analyticsManager);
  if (v21)
  {
    v22 = v21;
    v23 = dispatch thunk of AppAnalyticsExtensionManager.analyticsController.getter();

    *(_QWORD *)(inited + 72) = type metadata accessor for AnalyticsController(0);
    *(_QWORD *)(inited + 48) = v23;
    *(_QWORD *)(inited + 80) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("applicationContext"));
    *(_QWORD *)(inited + 88) = v24;
    *(_QWORD *)(inited + 120) = &type metadata for String;
    *(_QWORD *)(inited + 96) = 0x6F69736E65747865;
    *(_QWORD *)(inited + 104) = 0xE90000000000006ELL;
    result = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("libraryInterface"));
    *(_QWORD *)(inited + 128) = result;
    *(_QWORD *)(inited + 136) = v25;
    v26 = *(void **)(v14 + OBJC_IVAR____TtC25BooksProductPageExtension29ProductPageRootViewController_jsaLibraryManager);
    if (v26)
    {
      *(_QWORD *)(inited + 168) = sub_10000F62C(0, &qword_100034C90, &off_10002CBD0);
      *(_QWORD *)(inited + 144) = v26;
      *(_QWORD *)(inited + 176) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("remoteConfigDataContainer"));
      *(_QWORD *)(inited + 184) = v27;
      v28 = type metadata accessor for RCDataContainer(0);
      v29 = static RCDataContainer.default.getter(v26);
      *(_QWORD *)(inited + 216) = v28;
      *(_QWORD *)(inited + 192) = v29;
      *(_QWORD *)(inited + 224) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("transactionController"));
      *(_QWORD *)(inited + 232) = v30;
      *(_QWORD *)(inited + 264) = sub_10000F62C(0, &qword_100034C98, TUITransactionController_ptr);
      *(_QWORD *)(inited + 240) = v16;
      *(_QWORD *)(inited + 272) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("AlertController"));
      *(_QWORD *)(inited + 280) = v31;
      v32 = sub_10000F62C(0, &qword_100034CA0, BSUIAlertController_ptr);
      *(_QWORD *)(inited + 312) = sub_1000089B0(&qword_100034CA8);
      *(_QWORD *)(inited + 288) = v32;
      *(_QWORD *)(inited + 320) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("DynamicArray"));
      *(_QWORD *)(inited + 328) = v33;
      v34 = sub_10000F62C(0, &qword_100034CB0, BSUIDynamicArray_ptr);
      *(_QWORD *)(inited + 360) = sub_1000089B0(&qword_100034CB8);
      *(_QWORD *)(inited + 336) = v34;
      *(_QWORD *)(inited + 368) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("DynamicValue"));
      *(_QWORD *)(inited + 376) = v35;
      v36 = sub_10000F62C(0, &qword_100034CC0, BSUIDynamicValue_ptr);
      *(_QWORD *)(inited + 408) = sub_1000089B0(&qword_100034CC8);
      *(_QWORD *)(inited + 384) = v36;
      *(_QWORD *)(inited + 416) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("CloudRatingsManager"));
      *(_QWORD *)(inited + 424) = v37;
      v38 = sub_10000F62C(0, &qword_100034CD0, BSUICloudAssetRatingsManager_ptr);
      *(_QWORD *)(inited + 456) = sub_1000089B0(&qword_100034CD8);
      *(_QWORD *)(inited + 432) = v38;
      *(_QWORD *)(inited + 464) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("ContextMenuProvider"));
      *(_QWORD *)(inited + 472) = v39;
      v40 = type metadata accessor for PPXContextMenuProvider();
      *(_QWORD *)(inited + 504) = v40;
      v41 = v16;
      BaseObjectGraph.inject<A>(_:)((_QWORD *)(inited + 480), v40, v40);
      *(_QWORD *)(inited + 512) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("FeedDataRequest"));
      *(_QWORD *)(inited + 520) = v42;
      v43 = sub_10000F62C(0, &qword_100034CE0, BSUIFeedDataRequest_ptr);
      *(_QWORD *)(inited + 552) = sub_1000089B0(&qword_100034CE8);
      *(_QWORD *)(inited + 528) = v43;
      *(_QWORD *)(inited + 560) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("FeedViewController"));
      *(_QWORD *)(inited + 568) = v44;
      v45 = sub_10000F62C(0, &qword_100034CF0, off_10002CBC8);
      *(_QWORD *)(inited + 600) = sub_1000089B0(&qword_100034CF8);
      *(_QWORD *)(inited + 576) = v45;
      *(_QWORD *)(inited + 608) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("NoticeViewController"));
      *(_QWORD *)(inited + 616) = v46;
      v47 = sub_10000F62C(0, &qword_100034D00, BSUINoticeViewController_ptr);
      *(_QWORD *)(inited + 648) = sub_1000089B0(&qword_100034D08);
      *(_QWORD *)(inited + 624) = v47;
      *(_QWORD *)(inited + 656) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("OSFeatureFlags"));
      *(_QWORD *)(inited + 664) = v48;
      v49 = type metadata accessor for JSAOSFeatureFlags(0);
      *(_QWORD *)(inited + 696) = sub_1000089B0(&qword_100034D10);
      *(_QWORD *)(inited + 672) = v49;
      *(_QWORD *)(inited + 704) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("PurchaseManager"));
      *(_QWORD *)(inited + 712) = v50;
      v51 = sub_10000F62C(0, &qword_100034D18, BSUIPurchaseManager_ptr);
      *(_QWORD *)(inited + 744) = sub_1000089B0(&qword_100034D20);
      *(_QWORD *)(inited + 720) = v51;
      *(_QWORD *)(inited + 752) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("RemoteConfigurationManager"));
      *(_QWORD *)(inited + 760) = v52;
      v53 = sub_10000F62C(0, &qword_100034D28, BRCConfigurationManager_ptr);
      *(_QWORD *)(inited + 792) = sub_1000089B0(&qword_100034D30);
      *(_QWORD *)(inited + 768) = v53;
      *(_QWORD *)(inited + 800) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("ScreenShotViewController"));
      *(_QWORD *)(inited + 808) = v54;
      v55 = sub_10000F62C(0, &qword_100034D38, BSUIScreenshotViewController_ptr);
      *(_QWORD *)(inited + 840) = sub_1000089B0(&qword_100034D40);
      *(_QWORD *)(inited + 816) = v55;
      *(_QWORD *)(inited + 848) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("Transaction"));
      *(_QWORD *)(inited + 856) = v56;
      v57 = sub_10000F62C(0, &qword_100034D48, TUITransaction_ptr);
      *(_QWORD *)(inited + 888) = sub_1000089B0(&qword_100034D50);
      *(_QWORD *)(inited + 864) = v57;
      *(_QWORD *)(inited + 896) = static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("VCStack"));
      *(_QWORD *)(inited + 904) = v58;
      v59 = type metadata accessor for VCStackManager(0);
      *(_QWORD *)(inited + 936) = sub_1000089B0(&qword_100034D58);
      *(_QWORD *)(inited + 912) = v59;
      v60 = sub_1000163F8(inited);

      return v60;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000F56C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_10000DA80(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

void sub_10000F5AC(uint64_t a1)
{
  uint64_t v1;

  sub_10000D52C(a1, v1, 2);
}

uint64_t sub_10000F5C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000089B0(&qword_100034D60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_10000F610(uint64_t a1)
{
  uint64_t v1;

  sub_10000D52C(a1, v1, 0);
}

uint64_t sub_10000F62C(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10000F664()
{
  id *v0;

  return swift_deallocObject(v0, 40, 7);
}

id sub_10000F698()
{
  void **v0;

  return sub_10000BC78(v0[2], v0[3], v0[4]);
}

uint64_t sub_10000F6A4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10000F6C8()
{
  uint64_t v0;

  sub_10000BEC4(*(char **)(v0 + 16));
}

uint64_t sub_10000F6D0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

id sub_10000F6FC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10000C90C(a1, a2, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24));
}

uint64_t sub_10000F704(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000089B0(&qword_100034D60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F74C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000089B0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000F788(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000089B0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_10000F7CC(char a1)
{
  uint64_t v1;

  sub_10000AA58(a1, *(_QWORD *)(v1 + 16));
}

_QWORD *sub_10000F7D4(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (_QWORD *)v2;
  }
  return v1;
}

uint64_t sub_10000F854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000F860);
}

uint64_t sub_10000F860(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t sub_10000F8DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000F8E8);
}

uint64_t sub_10000F8E8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PPXRemoveFromWantToReadActionItem(uint64_t a1)
{
  uint64_t result;

  result = qword_100034E38;
  if (!qword_100034E38)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PPXRemoveFromWantToReadActionItem);
  return result;
}

uint64_t sub_10000F998(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = "(";
  v4[1] = "(";
  v4[2] = &unk_1000271C0;
  v4[3] = "(";
  v4[4] = &unk_1000271D8;
  result = type metadata accessor for ContextActionType(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 6, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_10000FA24@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  __int128 v18[2];
  __int128 v19[2];
  __int128 v20[2];

  sub_100009484((uint64_t)a1, (uint64_t)v20);
  sub_100009484((uint64_t)a2, (uint64_t)v19);
  v10 = sub_100009484((uint64_t)a4, (uint64_t)v18);
  v11 = (id)BSUIGetLibraryItemStateProvider(v10);
  sub_100008DE4(a4);
  sub_100008DE4(a2);
  sub_100008DE4(a1);
  v12 = objc_opt_self(BSUILibraryItemStateProvider);
  v13 = swift_dynamicCastObjCClassUnconditional(v11, v12, 0, 0, 0);
  v14 = (char *)a5 + *(int *)(type metadata accessor for PPXRemoveFromWantToReadActionItem(0) + 36);
  v15 = enum case for ContextActionType.removeFromWantToRead(_:);
  v16 = type metadata accessor for ContextActionType(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  sub_100009414(v20, (uint64_t)a5);
  sub_100009414(v19, (uint64_t)(a5 + 5));
  a5[10] = a3;
  result = sub_100009414(v18, (uint64_t)(a5 + 11));
  a5[16] = v13;
  a5[17] = &off_10002DE40;
  return result;
}

uint64_t sub_10000FB48()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8[2];
  char v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter(v8, v2, v3);
  if ((v9 & 1) != 0)
  {
    sub_100009450((uint64_t)v8);
    return 0;
  }
  else
  {
    sub_100009414(v8, (uint64_t)v10);
    v5 = v11;
    v6 = v12;
    sub_10000942C(v10, v11);
    v4 = dispatch thunk of ContextAssetInfoProtocol.isInWantToRead.getter(v5, v6) & 1;
    sub_100008DE4(v10);
  }
  return v4;
}

uint64_t sub_10000FBEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v1 + 104) = v0;
  v2 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v1 + 112) = static MainActor.shared.getter();
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000FC58, v3, v4);
}

uint64_t sub_10000FC58()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSString v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString v21;

  v1 = *(_QWORD **)(v0 + 104);
  swift_release(*(_QWORD *)(v0 + 112));
  v2 = v1[3];
  v3 = v1[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter((_QWORD *)(v0 + 16), v2, v3);
  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
  {
    sub_100009450(v0 + 16);
  }
  else
  {
    v4 = *(_QWORD *)(v0 + 104);
    sub_100009414((__int128 *)(v0 + 16), v0 + 64);
    v5 = (void *)objc_opt_self(PPXBookDataStoreServices);
    v6 = *(_QWORD *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v6);
    dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v6, v7);
    v9 = v8;
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v9);
    objc_msgSend(v5, "removeAssetFromWantToRead:tracker:", v10, *(_QWORD *)(v4 + 80));

    v11 = *(void **)(v4 + 128);
    v12 = *(_QWORD *)(v0 + 88);
    v13 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v12);
    dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v12, v13);
    v15 = v14;
    v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v15);
    objc_msgSend(v11, "updateWantToReadState:identifier:", 0, v16);

    v17 = *(_QWORD *)(v0 + 88);
    v18 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v17);
    dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v17, v18);
    v20 = v19;
    v21 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v20);
    objc_msgSend(v11, "updateItemOfInterestForItemIdentifier:", v21);

    sub_100008DE4((_QWORD *)(v0 + 64));
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000FDF4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100034E94);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000087F8;
  return sub_10000FBEC();
}

uint64_t *sub_10000FE3C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  __int128 v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  id v28;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
    swift_retain(v4);
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for ContextActionSource(0);
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain(v4);
    v12(v9, v10, v11);
    v13 = a3[6];
    v14 = a3[7];
    v15 = (char *)v7 + v13;
    v16 = (char *)a2 + v13;
    *(_OWORD *)v15 = *(_OWORD *)v16;
    v15[16] = v16[16];
    v17 = *(uint64_t *)((char *)a2 + v14);
    *(uint64_t *)((char *)v7 + v14) = v17;
    v18 = a3[8];
    v19 = a3[9];
    v20 = *(void **)((char *)a2 + v18);
    *(uint64_t *)((char *)v7 + v18) = (uint64_t)v20;
    v21 = *(uint64_t *)((char *)a2 + v19);
    *(uint64_t *)((char *)v7 + v19) = v21;
    v22 = a3[10];
    v23 = (char *)v7 + v22;
    v24 = (char *)a2 + v22;
    v25 = *(_OWORD *)(v24 + 24);
    *(_OWORD *)((char *)v7 + v22 + 24) = v25;
    v26 = v25;
    v27 = **(void (***)(char *, char *, uint64_t))(v25 - 8);
    swift_unknownObjectRetain(v17);
    v28 = v20;
    swift_unknownObjectRetain(v21);
    v27(v23, v24, v26);
  }
  return v7;
}

uint64_t sub_10000FF5C(_QWORD *a1, int *a2)
{
  char *v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*a1);
  v4 = (char *)a1 + a2[5];
  v5 = type metadata accessor for ContextActionSource(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_unknownObjectRelease(*(_QWORD *)((char *)a1 + a2[7]));

  swift_unknownObjectRelease(*(_QWORD *)((char *)a1 + a2[9]));
  return sub_100008DE4((_QWORD *)((char *)a1 + a2[10]));
}

uint64_t *sub_10000FFDC(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  __int128 v24;
  uint64_t v25;
  void (*v26)(char *, char *, uint64_t);
  id v27;

  v6 = *a2;
  *a1 = *a2;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for ContextActionSource(0);
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain(v6);
  v11(v8, v9, v10);
  v12 = a3[6];
  v13 = a3[7];
  v14 = (char *)a1 + v12;
  v15 = (char *)a2 + v12;
  *(_OWORD *)v14 = *(_OWORD *)v15;
  v14[16] = v15[16];
  v16 = *(uint64_t *)((char *)a2 + v13);
  *(uint64_t *)((char *)a1 + v13) = v16;
  v17 = a3[8];
  v18 = a3[9];
  v19 = *(void **)((char *)a2 + v17);
  *(uint64_t *)((char *)a1 + v17) = (uint64_t)v19;
  v20 = *(uint64_t *)((char *)a2 + v18);
  *(uint64_t *)((char *)a1 + v18) = v20;
  v21 = a3[10];
  v22 = (char *)a1 + v21;
  v23 = (char *)a2 + v21;
  v24 = *(_OWORD *)(v23 + 24);
  *(_OWORD *)((char *)a1 + v21 + 24) = v24;
  v25 = v24;
  v26 = **(void (***)(char *, char *, uint64_t))(v24 - 8);
  swift_unknownObjectRetain(v16);
  v27 = v19;
  swift_unknownObjectRetain(v20);
  v26(v22, v23, v25);
  return a1;
}

uint64_t *sub_1000100D4(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  v8 = a3[5];
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for ContextActionSource(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  v12 = a3[6];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = v14[16];
  *(_OWORD *)v13 = *(_OWORD *)v14;
  v13[16] = v15;
  v16 = a3[7];
  v17 = *(uint64_t *)((char *)a1 + v16);
  v18 = *(uint64_t *)((char *)a2 + v16);
  *(uint64_t *)((char *)a1 + v16) = v18;
  swift_unknownObjectRetain(v18);
  swift_unknownObjectRelease(v17);
  v19 = a3[8];
  v20 = *(void **)((char *)a2 + v19);
  v21 = *(void **)((char *)a1 + v19);
  *(uint64_t *)((char *)a1 + v19) = (uint64_t)v20;
  v22 = v20;

  v23 = a3[9];
  v24 = *(uint64_t *)((char *)a2 + v23);
  v25 = *(uint64_t *)((char *)a1 + v23);
  *(uint64_t *)((char *)a1 + v23) = v24;
  swift_unknownObjectRetain(v24);
  swift_unknownObjectRelease(v25);
  sub_100008FB4((uint64_t *)((char *)a1 + a3[10]), (uint64_t *)((char *)a2 + a3[10]));
  return a1;
}

_QWORD *sub_1000101CC(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  __int128 v18;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for ContextActionSource(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[6];
  v11 = a3[7];
  v12 = (char *)a1 + v10;
  v13 = (char *)a2 + v10;
  *(_OWORD *)v12 = *(_OWORD *)v13;
  v12[16] = v13[16];
  *(_QWORD *)((char *)a1 + v11) = *(_QWORD *)((char *)a2 + v11);
  v14 = a3[9];
  *(_QWORD *)((char *)a1 + a3[8]) = *(_QWORD *)((char *)a2 + a3[8]);
  *(_QWORD *)((char *)a1 + v14) = *(_QWORD *)((char *)a2 + v14);
  v15 = a3[10];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = *((_OWORD *)v17 + 1);
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *((_OWORD *)v16 + 1) = v18;
  *((_QWORD *)v16 + 4) = *((_QWORD *)v17 + 4);
  return a1;
}

uint64_t *sub_10001028C(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  __int128 v23;

  v6 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRelease(v6);
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for ContextActionSource(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a3[7];
  v13 = (char *)a1 + v11;
  v14 = (char *)a2 + v11;
  *(_OWORD *)v13 = *(_OWORD *)v14;
  v13[16] = v14[16];
  v15 = *(uint64_t *)((char *)a1 + v12);
  *(uint64_t *)((char *)a1 + v12) = *(uint64_t *)((char *)a2 + v12);
  swift_unknownObjectRelease(v15);
  v16 = a3[8];
  v17 = *(void **)((char *)a1 + v16);
  *(uint64_t *)((char *)a1 + v16) = *(uint64_t *)((char *)a2 + v16);

  v18 = a3[9];
  v19 = *(uint64_t *)((char *)a1 + v18);
  *(uint64_t *)((char *)a1 + v18) = *(uint64_t *)((char *)a2 + v18);
  swift_unknownObjectRelease(v19);
  v20 = a3[10];
  v21 = (char *)a1 + v20;
  v22 = (char *)a2 + v20;
  sub_100008DE4((uint64_t *)((char *)a1 + v20));
  v23 = *((_OWORD *)v22 + 1);
  *(_OWORD *)v21 = *(_OWORD *)v22;
  *((_OWORD *)v21 + 1) = v23;
  *((_QWORD *)v21 + 4) = *((_QWORD *)v22 + 4);
  return a1;
}

uint64_t sub_100010378(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100010384);
}

uint64_t sub_100010384(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ContextActionSource(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_100010400(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001040C);
}

char *sub_10001040C(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for ContextActionSource(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PPXContextActionData(uint64_t a1)
{
  uint64_t result;

  result = qword_100034EF8;
  if (!qword_100034EF8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PPXContextActionData);
  return result;
}

uint64_t sub_1000104BC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[7];

  v4[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  result = type metadata accessor for ContextActionSource(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = &unk_1000272A8;
    v4[3] = &unk_1000272C0;
    v4[4] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[5] = &unk_1000272D8;
    v4[6] = &unk_1000272F0;
    swift_initStructMetadata(a1, 256, 7, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100010568(uint64_t a1)
{
  uint64_t v2;
  unint64_t *v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t *v17;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v13 = a1;
    else
      v13 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v13);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (!v2)
    return (uint64_t)v3;
  v17 = (unint64_t *)&_swiftEmptyArrayStorage;
  result = sub_10001C10C(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v3 = v17;
    if ((a1 & 0xC000000000000001) != 0)
    {
      v5 = 0;
      do
      {
        v6 = specialized _ArrayBuffer._getElementSlowPath(_:)(v5, a1);
        v17 = v3;
        v8 = v3[2];
        v7 = v3[3];
        if (v8 >= v7 >> 1)
        {
          sub_10001C10C(v7 > 1, v8 + 1, 1);
          v3 = v17;
        }
        ++v5;
        v15 = type metadata accessor for PPXContextAssetInfo();
        v16 = sub_100010C48();
        *(_QWORD *)&v14 = v6;
        v3[2] = v8 + 1;
        sub_100009414(&v14, (uint64_t)&v3[5 * v8 + 4]);
      }
      while (v2 != v5);
    }
    else
    {
      v9 = (uint64_t *)(a1 + 32);
      do
      {
        v10 = *v9;
        v17 = v3;
        v11 = v3[2];
        v12 = v3[3];
        swift_retain(v10);
        if (v11 >= v12 >> 1)
        {
          sub_10001C10C(v12 > 1, v11 + 1, 1);
          v3 = v17;
        }
        v15 = type metadata accessor for PPXContextAssetInfo();
        v16 = sub_100010C48();
        *(_QWORD *)&v14 = v10;
        v3[2] = v11 + 1;
        sub_100009414(&v14, (uint64_t)&v3[5 * v11 + 4]);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_100010728@<X0>(void *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  int *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  unint64_t v31;

  v8 = (int *)type metadata accessor for PPXContextActionData(0);
  v28 = *((_QWORD *)v8 - 1);
  __chkstk_darwin(v8);
  v10 = (uint64_t *)((char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = sub_100010568((uint64_t)&_swiftEmptyArrayStorage);
  *v10 = v11;
  v12 = (char *)v10 + v8[5];
  v13 = enum case for ContextActionSource.unknown(_:);
  v14 = type metadata accessor for ContextActionSource(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v12, v13, v14);
  v15 = (char *)v10 + v8[6];
  *(_QWORD *)v15 = 0;
  *((_QWORD *)v15 + 1) = 0;
  v15[16] = 1;
  *(uint64_t *)((char *)v10 + v8[7]) = 0;
  *(uint64_t *)((char *)v10 + v8[8]) = (uint64_t)a1;
  *(uint64_t *)((char *)v10 + v8[9]) = a2;
  sub_100009484((uint64_t)a3, (uint64_t)v10 + v8[10]);
  sub_100009484((uint64_t)a3, (uint64_t)&v29);
  v16 = type metadata accessor for PPXContextAssetInfo();
  swift_allocObject(v16, 144, 7);
  v17 = a1;
  swift_unknownObjectRetain_n(a2, 2);
  v18 = v17;
  v19 = sub_100014430(v18, a2, &v29);
  if (v19)
  {
    v20 = v19;
    swift_retain(v19);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v11);
    v27 = a4;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v11 = (uint64_t)sub_10001A8E8(0, *(_QWORD *)(v11 + 16) + 1, 1, (char *)v11);
    v23 = *(_QWORD *)(v11 + 16);
    v22 = *(_QWORD *)(v11 + 24);
    if (v23 >= v22 >> 1)
      v11 = (uint64_t)sub_10001A8E8((char *)(v22 > 1), v23 + 1, 1, (char *)v11);
    v30 = v16;
    v31 = sub_100010C48();
    *(_QWORD *)&v29 = v20;
    *(_QWORD *)(v11 + 16) = v23 + 1;
    sub_100009414(&v29, v11 + 40 * v23 + 32);
    swift_release(v20);

    swift_unknownObjectRelease(a2);
    *v10 = v11;
    sub_100008DE4(a3);
    a4 = v27;
    sub_100010C90((uint64_t)v10, v27);
    v24 = 0;
  }
  else
  {

    swift_unknownObjectRelease(a2);
    sub_100008DE4(a3);
    sub_100010C0C((uint64_t)v10);
    v24 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(v28 + 56))(a4, v24, 1, v8);
}

uint64_t sub_100010990()
{
  _QWORD *v0;

  return swift_bridgeObjectRetain(*v0);
}

uint64_t sub_100010998()
{
  return objc_msgSend((id)objc_opt_self(BKReachability), "isOffline") ^ 1;
}

id sub_1000109C4()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(BURestrictionsProvider), "sharedInstance");
  v1 = objc_msgSend(v0, "isBookStoreAllowed");
  swift_unknownObjectRelease(v0);
  return v1;
}

id sub_100010A1C()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(BUAccountsProvider), "sharedProvider");
  v1 = objc_msgSend(v0, "isStoreAccountManagedAppleID");

  return v1;
}

uint64_t sub_100010A70()
{
  return dispatch thunk of ContextActionDataModel.shouldReportFigaro.getter() & 1;
}

uint64_t sub_100010A98()
{
  return dispatch thunk of ContextActionDataModel.isAnODPRecommendation.getter() & 1;
}

uint64_t sub_100010AC0()
{
  return dispatch thunk of ContextActionDataModel.supportsSuggestionContextMenu.getter() & 1;
}

uint64_t sub_100010AE8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = type metadata accessor for ContextActionSource(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t sub_100010B28()
{
  return dispatch thunk of ContextActionDataModel.sourceBarButtonItem.getter();
}

uint64_t sub_100010B4C(uint64_t a1)
{
  uint64_t v1;

  return *(_QWORD *)(v1 + *(int *)(a1 + 24));
}

void *sub_100010B60()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;

  v0 = (void *)ContextActionDataModel.initType.getter();
  v2 = v1;
  if ((v3 & 1) != 0)
  {
    sub_100010BE0(v0, v1, 1);
    return 0;
  }
  else
  {

  }
  return v2;
}

uint64_t sub_100010BA8(uint64_t a1)
{
  uint64_t v1;

  return swift_unknownObjectRetain(*(_QWORD *)(v1 + *(int *)(a1 + 28)));
}

uint64_t sub_100010BB8()
{
  return dispatch thunk of ContextActionDataModel.actionItemNeedsDifferentiation.getter() & 1;
}

void sub_100010BE0(void *a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)
  {
    swift_bridgeObjectRelease(a1);
  }
  else
  {

  }
}

uint64_t sub_100010C0C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PPXContextActionData(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100010C48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100034F48;
  if (!qword_100034F48)
  {
    v1 = type metadata accessor for PPXContextAssetInfo();
    result = swift_getWitnessTable(&unk_100027A20, v1);
    atomic_store(result, (unint64_t *)&qword_100034F48);
  }
  return result;
}

uint64_t sub_100010C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PPXContextActionData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100010CE0);
}

uint64_t sub_100010CE0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t sub_100010D5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100010D68);
}

uint64_t sub_100010D68(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PPXMarkedAsStillReadingActionItem(uint64_t a1)
{
  uint64_t result;

  result = qword_100034FA8;
  if (!qword_100034FA8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PPXMarkedAsStillReadingActionItem);
  return result;
}

uint64_t sub_100010E18(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = "(";
  v4[1] = "(";
  v4[2] = &unk_1000273F0;
  v4[3] = "(";
  v4[4] = &unk_100027408;
  result = type metadata accessor for ContextActionType(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 6, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100010EA4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  __int128 v18[2];
  __int128 v19[2];
  __int128 v20[2];

  sub_100009484((uint64_t)a1, (uint64_t)v20);
  sub_100009484((uint64_t)a2, (uint64_t)v19);
  v10 = sub_100009484((uint64_t)a4, (uint64_t)v18);
  v11 = (id)BSUIGetLibraryItemStateProvider(v10);
  sub_100008DE4(a4);
  sub_100008DE4(a2);
  sub_100008DE4(a1);
  v12 = objc_opt_self(BSUILibraryItemStateProvider);
  v13 = swift_dynamicCastObjCClassUnconditional(v11, v12, 0, 0, 0);
  v14 = (char *)a5 + *(int *)(type metadata accessor for PPXMarkedAsStillReadingActionItem(0) + 36);
  v15 = enum case for ContextActionType.markAsStillReading(_:);
  v16 = type metadata accessor for ContextActionType(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 104))(v14, v15, v16);
  sub_100009414(v20, (uint64_t)a5);
  sub_100009414(v19, (uint64_t)(a5 + 5));
  a5[10] = a3;
  result = sub_100009414(v18, (uint64_t)(a5 + 11));
  a5[16] = v13;
  a5[17] = &off_10002DE40;
  return result;
}

uint64_t sub_100010FC8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter(&v13, v2, v3);
  if ((v16 & 1) != 0)
  {
    sub_100009450((uint64_t)&v13);
    return 0;
  }
  else
  {
    sub_100009414(&v13, (uint64_t)v17);
    v5 = v18;
    v6 = v19;
    sub_10000942C(v17, v18);
    v7 = dispatch thunk of ContextAssetInfoProtocol.isOwned.getter(v5, v6);
    if (v7 == 2)
    {
      sub_100009484((uint64_t)v17, (uint64_t)&v13);
      v4 = 0;
    }
    else
    {
      v8 = v7;
      sub_100009484((uint64_t)v17, (uint64_t)&v13);
      if ((v8 & 1) != 0)
      {
        v9 = v14;
        v10 = v15;
        sub_10000942C(&v13, v14);
        v11 = dispatch thunk of ContextAssetInfoProtocol.isMarkedFinished.getter(v9, v10);
        if (v11 == 2)
          v4 = 0;
        else
          v4 = v11 & 1;
      }
      else
      {
        v4 = 0;
      }
    }
    sub_100008DE4(&v13);
    sub_100008DE4(v17);
  }
  return v4;
}

uint64_t sub_1000110DC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1[13] = v0;
  v2 = type metadata accessor for ProductionType(0);
  v1[14] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[15] = v3;
  v1[16] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for ContentType(0);
  v1[17] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v1[18] = v5;
  v1[19] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ContentAcquisitionType(0);
  v1[20] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v1[21] = v7;
  v1[22] = swift_task_alloc((*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000089B0((uint64_t *)&unk_1000347B0);
  v1[23] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v8 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for MainActor(0);
  v1[24] = static MainActor.shared.getter();
  v10 = dispatch thunk of Actor.unownedExecutor.getter(v9, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000111E4, v10, v11);
}

uint64_t sub_1000111E4()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  unsigned int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSString v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSString v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v1 = *(_QWORD **)(v0 + 104);
  swift_release(*(_QWORD *)(v0 + 192));
  v2 = v1[3];
  v3 = v1[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter((_QWORD *)(v0 + 16), v2, v3);
  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
  {
    sub_100009450(v0 + 16);
  }
  else
  {
    v60 = *(_QWORD *)(v0 + 184);
    v58 = *(_QWORD *)(v0 + 176);
    v4 = *(_QWORD *)(v0 + 168);
    v59 = *(_QWORD *)(v0 + 160);
    v53 = *(_QWORD *)(v0 + 152);
    v57 = *(_QWORD *)(v0 + 144);
    v52 = *(_QWORD *)(v0 + 136);
    v54 = *(_QWORD *)(v0 + 120);
    v5 = *(_QWORD *)(v0 + 104);
    v55 = *(_QWORD *)(v0 + 112);
    v56 = *(_QWORD *)(v0 + 128);
    sub_100009414((__int128 *)(v0 + 16), v0 + 64);
    v6 = type metadata accessor for EventReporter(0);
    v7 = (void *)static EventReporter.shared.getter(v6);
    v8 = *(_QWORD *)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v8);
    v10 = dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v8, v9);
    v12 = v11;
    dispatch thunk of EventReporter.seriesType(for:)(v10);
    swift_bridgeObjectRelease(v12);

    v51 = (void *)static EventReporter.shared.getter(v13);
    v50 = *(_QWORD *)(v5 + 80);
    v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(kBKCollectionDefaultIDFinished);
    v48 = v15;
    v49 = v14;
    v16 = *(_QWORD *)(v0 + 88);
    v17 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v16);
    v18 = dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v16, v17);
    v47 = v19;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v58, enum case for ContentAcquisitionType.storeBought(_:), v59);
    v20 = *(_QWORD *)(v0 + 88);
    v21 = *(_QWORD *)(v0 + 96);
    v46 = (_QWORD *)(v0 + 64);
    sub_10000942C((_QWORD *)(v0 + 64), v20);
    v22 = dispatch thunk of ContextAssetInfoProtocol.assetType.getter(v20, v21);
    v23 = static ContextActionAssetType.== infix(_:_:)(v22, 3);
    v24 = (unsigned int *)&enum case for ContentType.audiobook(_:);
    if ((v23 & 1) == 0)
      v24 = (unsigned int *)&enum case for ContentType.book(_:);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v57 + 104))(v53, *v24, v52);
    v25 = *(_QWORD *)(v0 + 88);
    v26 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v25);
    v27 = dispatch thunk of ContextAssetInfoProtocol.supplementalContentCount.getter(v25, v26);
    v29 = Optional<A>.int32Value.getter(v27, v28 & 1);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v54 + 104))(v56, enum case for ProductionType.unknown(_:), v55);
    EventReporter.emitRemoveFromCollectionEvent(using:for:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:)(v50, v49, v48, v18, v47, v58, v53, v29 | ((HIDWORD(v29) & 1) << 32), v60, v56);
    swift_bridgeObjectRelease(v47);
    swift_bridgeObjectRelease(v48);

    (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v56, v55);
    (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v53, v52);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v58, v59);
    v30 = (void *)objc_opt_self(PPXBookDataStoreServices);
    v31 = *(_QWORD *)(v0 + 88);
    v32 = *(_QWORD *)(v0 + 96);
    sub_10000942C(v46, v31);
    dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v31, v32);
    v34 = v33;
    v35 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v34);
    objc_msgSend(v30, "setFinishedState:storeID:tracker:", 0, v35, *(_QWORD *)(v5 + 80));

    v36 = *(void **)(v5 + 128);
    v37 = *(_QWORD *)(v0 + 88);
    v38 = *(_QWORD *)(v0 + 96);
    sub_10000942C(v46, v37);
    dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v37, v38);
    v40 = v39;
    v41 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v40);
    objc_msgSend(v36, "updateItemOfInterestForItemIdentifier:", v41);

    sub_10000A010(v60);
    sub_100008DE4(v46);
  }
  v42 = *(_QWORD *)(v0 + 176);
  v43 = *(_QWORD *)(v0 + 152);
  v44 = *(_QWORD *)(v0 + 128);
  swift_task_dealloc(*(_QWORD *)(v0 + 184));
  swift_task_dealloc(v42);
  swift_task_dealloc(v43);
  swift_task_dealloc(v44);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000115C0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100035004);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000087F8;
  return sub_1000110DC();
}

uint64_t type metadata accessor for BundleFinder()
{
  return objc_opt_self(_TtC25BooksProductPageExtensionP33_EEBD9181149D32DDEB242D20E88FA57212BundleFinder);
}

uint64_t LibraryAnalyticsDataProvider.seriesType(for:)@<X0>(uint64_t a1@<X8>)
{
  id v2;
  NSString v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = (id)BSUIGetLibraryItemStateProvider();
  v3 = String._bridgeToObjectiveC()();
  v4 = objc_msgSend(v2, "itemStateWithIdentifier:", v3);

  swift_unknownObjectRelease(v2);
  v5 = objc_msgSend(v4, "seriesType");
  swift_unknownObjectRelease(v4);
  switch((unint64_t)v5)
  {
    case 1uLL:
      v10 = (unsigned int *)&enum case for SeriesType.nonSeries(_:);
      goto LABEL_6;
    case 2uLL:
      v10 = (unsigned int *)&enum case for SeriesType.ordered(_:);
      goto LABEL_6;
    case 3uLL:
      v10 = (unsigned int *)&enum case for SeriesType.unOrdered(_:);
LABEL_6:
      v11 = *v10;
      v12 = type metadata accessor for SeriesType(0);
      v13 = *(_QWORD *)(v12 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 104))(a1, v11, v12);
      v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
      v8 = a1;
      v9 = 0;
      v6 = v12;
      break;
    default:
      v6 = type metadata accessor for SeriesType(0);
      v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56);
      v8 = a1;
      v9 = 1;
      break;
  }
  return v7(v8, v9, 1, v6);
}

ValueMetadata *type metadata accessor for LibraryAnalyticsDataProvider()
{
  return &type metadata for LibraryAnalyticsDataProvider;
}

uint64_t sub_100011780(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  __int128 v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  id v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = v19 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain(v19);
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    v8 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(v4 + 64) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(v4 + 40, (uint64_t)(a2 + 5));
    v9 = (void *)a2[10];
    *(_QWORD *)(v4 + 80) = v9;
    v10 = *((_OWORD *)a2 + 7);
    *(_OWORD *)(v4 + 112) = v10;
    v11 = v10;
    v12 = **(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8);
    v13 = v9;
    v12(v4 + 88, (uint64_t)(a2 + 11), v11);
    v14 = *(_OWORD *)(a2 + 19);
    *(_OWORD *)(v4 + 152) = v14;
    (**(void (***)(uint64_t, uint64_t))(v14 - 8))(v4 + 128, (uint64_t)(a2 + 16));
    v15 = *(int *)(a3 + 36);
    v16 = v4 + v15;
    v17 = (uint64_t)a2 + v15;
    v18 = type metadata accessor for ContextActionType(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  }
  return v4;
}

uint64_t sub_1000118B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_100008DE4((_QWORD *)a1);
  sub_100008DE4((_QWORD *)(a1 + 40));

  sub_100008DE4((_QWORD *)(a1 + 88));
  sub_100008DE4((_QWORD *)(a1 + 128));
  v4 = a1 + *(int *)(a2 + 36);
  v5 = type metadata accessor for ContextActionType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_100011914(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  id v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, a2 + 40);
  v8 = *(void **)(a2 + 80);
  *(_QWORD *)(a1 + 80) = v8;
  v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 112) = v9;
  v10 = v9;
  v11 = **(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8);
  v12 = v8;
  v11(a1 + 88, a2 + 88, v10);
  v13 = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 152) = v13;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 128, a2 + 128);
  v14 = *(int *)(a3 + 36);
  v15 = a1 + v14;
  v16 = a2 + v14;
  v17 = type metadata accessor for ContextActionType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  return a1;
}

_QWORD *sub_100011A10(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  sub_100008FB4(a1, a2);
  sub_100008FB4(a1 + 5, a2 + 5);
  v6 = (void *)a1[10];
  v7 = (void *)a2[10];
  a1[10] = v7;
  v8 = v7;

  sub_100008FB4(a1 + 11, a2 + 11);
  sub_100008FB4(a1 + 16, a2 + 16);
  v9 = *(int *)(a3 + 36);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for ContextActionType(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_100011AA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v5 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v5;
  v6 = *(_OWORD *)(a2 + 88);
  v7 = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v7;
  *(_OWORD *)(a1 + 88) = v6;
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  v8 = *(_OWORD *)(a2 + 144);
  v9 = *(int *)(a3 + 36);
  v10 = a1 + v9;
  v11 = a2 + v9;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  v12 = type metadata accessor for ContextActionType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

uint64_t sub_100011B4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_100008DE4((_QWORD *)a1);
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  sub_100008DE4((_QWORD *)(a1 + 40));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v7 = *(void **)(a1 + 80);
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;

  sub_100008DE4((_QWORD *)(a1 + 88));
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  sub_100008DE4((_QWORD *)(a1 + 128));
  v9 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v9;
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  v10 = *(int *)(a3 + 36);
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = type metadata accessor for ContextActionType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_100011C1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100011C28);
}

uint64_t sub_100011C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t sub_100011CA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100011CB0);
}

uint64_t sub_100011CB0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PPXRemoveDownloadActionItem(uint64_t a1)
{
  uint64_t result;

  result = qword_1000350F8;
  if (!qword_1000350F8)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PPXRemoveDownloadActionItem);
  return result;
}

uint64_t sub_100011D60(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = "(";
  v4[1] = "(";
  v4[2] = &unk_100027568;
  v4[3] = "(";
  v4[4] = "(";
  result = type metadata accessor for ContextActionType(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 6, v4, a1 + 16);
    return 0;
  }
  return result;
}

id sub_100011DE4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X8>)
{
  id result;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  unint64_t v16;
  _UNKNOWN **v17;
  __int128 v18[2];
  __int128 v19[2];
  __int128 v20[2];

  sub_100009484((uint64_t)a1, (uint64_t)v20);
  sub_100009484((uint64_t)a2, (uint64_t)v19);
  sub_100009484((uint64_t)a4, (uint64_t)v18);
  result = objc_msgSend((id)objc_opt_self(PPXProductPageActions), "sharedInstance");
  if (result)
  {
    v11 = result;
    v16 = sub_10001222C();
    v17 = &off_10002DC90;
    *(_QWORD *)&v15 = v11;
    sub_100008DE4(a4);
    sub_100008DE4(a2);
    sub_100008DE4(a1);
    v12 = a5 + *(int *)(type metadata accessor for PPXRemoveDownloadActionItem(0) + 36);
    v13 = enum case for ContextActionType.removeDownload(_:);
    v14 = type metadata accessor for ContextActionType(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v12, v13, v14);
    sub_100009414(v20, a5);
    sub_100009414(v19, a5 + 40);
    *(_QWORD *)(a5 + 80) = a3;
    sub_100009414(v18, a5 + 88);
    return (id)sub_100009414(&v15, a5 + 128);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100011F14()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter(&v12, v2, v3);
  if ((v15 & 1) == 0)
  {
    sub_100009414(&v12, (uint64_t)v16);
    v5 = v17;
    v6 = v18;
    sub_10000942C(v16, v17);
    v7 = dispatch thunk of ContextAssetInfoProtocol.isLocal.getter(v5, v6);
    if (v7 == 2)
    {
      sub_100009484((uint64_t)v16, (uint64_t)&v12);
    }
    else
    {
      v8 = v7;
      sub_100009484((uint64_t)v16, (uint64_t)&v12);
      if ((v8 & 1) != 0)
      {
        v10 = v13;
        v11 = v14;
        sub_10000942C(&v12, v13);
        LOBYTE(v10) = dispatch thunk of ContextAssetInfoProtocol.isDownloading.getter(v10, v11);
        sub_100008DE4(&v12);
        if ((v10 & 1) == 0)
        {
          v4 = objc_msgSend((id)objc_opt_self(UIApplication), "isRunningInStoreDemoMode") ^ 1;
          goto LABEL_8;
        }
LABEL_7:
        v4 = 0;
LABEL_8:
        sub_100008DE4(v16);
        return v4;
      }
    }
    sub_100008DE4(&v12);
    goto LABEL_7;
  }
  sub_100009450((uint64_t)&v12);
  return 0;
}

uint64_t sub_100012040()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v1 + 104) = v0;
  v2 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v1 + 112) = static MainActor.shared.getter();
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000120AC, v3, v4);
}

uint64_t sub_1000120AC()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v1 = *(_QWORD **)(v0 + 104);
  swift_release(*(_QWORD *)(v0 + 112));
  v2 = v1[3];
  v3 = v1[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter((_QWORD *)(v0 + 16), v2, v3);
  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
  {
    sub_100009450(v0 + 16);
  }
  else
  {
    v4 = *(_QWORD **)(v0 + 104);
    sub_100009414((__int128 *)(v0 + 16), v0 + 64);
    v5 = v4[19];
    v6 = v4[20];
    sub_10000942C(v4 + 16, v5);
    v7 = *(_QWORD *)(v0 + 88);
    v8 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v7);
    v9 = dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v7, v8);
    v11 = v10;
    v12 = *(_QWORD *)(v0 + 88);
    v13 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v12);
    v14 = dispatch thunk of ContextAssetInfoProtocol.assetType.getter(v12, v13);
    v15 = static ContextActionAssetType.== infix(_:_:)(v14, 3);
    (*(void (**)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 16))(v9, v11, v15 & 1, v5, v6);
    swift_bridgeObjectRelease(v11);
    sub_100008DE4((_QWORD *)(v0 + 64));
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000121E4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10003515C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000087F8;
  return sub_100012040();
}

unint64_t sub_10001222C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100035150;
  if (!qword_100035150)
  {
    v1 = objc_opt_self(PPXProductPageActions);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, &qword_100035150);
  }
  return result;
}

void sub_100012268(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  Class isa;

  v4 = objc_msgSend((id)objc_opt_self(PPXProductPageActions), "sharedInstance");
  if (v4)
  {
    v5 = v4;
    v6 = sub_1000089B0(&qword_100035160);
    v7 = swift_allocObject(v6, 48, 7);
    *(_OWORD *)(v7 + 16) = xmmword_100027060;
    *(_QWORD *)(v7 + 32) = a1;
    *(_QWORD *)(v7 + 40) = a2;
    swift_bridgeObjectRetain(a2);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7);
    objc_msgSend(v5, "downloadBooks:", isa);

  }
  else
  {
    __break(1u);
  }
}

void sub_100012330(uint64_t a1, uint64_t a2, char a3)
{
  id v4;
  void *v5;
  NSString v6;

  v4 = objc_msgSend((id)objc_opt_self(PPXProductPageActions), "sharedInstance");
  if (v4)
  {
    v5 = v4;
    v6 = String._bridgeToObjectiveC()();
    objc_msgSend(v5, "removeDownload:isAudiobook:", v6, a3 & 1);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1000123C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000123CC);
}

uint64_t sub_1000123CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t sub_100012448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100012454);
}

uint64_t sub_100012454(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PPXDislikeActionItem(uint64_t a1)
{
  uint64_t result;

  result = qword_1000351C0;
  if (!qword_1000351C0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PPXDislikeActionItem);
  return result;
}

uint64_t sub_100012504(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = "(";
  v4[1] = "(";
  v4[2] = &unk_1000276A0;
  v4[3] = "(";
  v4[4] = "(";
  result = type metadata accessor for ContextActionType(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 6, v4, a1 + 16);
    return 0;
  }
  return result;
}

id sub_100012588@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X8>)
{
  id result;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[5];
  __int128 v17;
  uint64_t v18;
  void *v19;
  __int128 v20[2];
  __int128 v21[2];
  __int128 v22[2];

  sub_100009484((uint64_t)a1, (uint64_t)v22);
  sub_100009484((uint64_t)a2, (uint64_t)v21);
  sub_100009484((uint64_t)a4, (uint64_t)v20);
  result = objc_msgSend((id)objc_opt_self(JSAStore), "sharedInstance");
  if (result)
  {
    v11 = result;
    v16[3] = sub_100012DB4();
    v16[4] = &protocol witness table for JSAStore;
    v16[0] = v11;
    v15[3] = type metadata accessor for AccountController(0);
    v15[4] = &protocol witness table for AccountController;
    v15[0] = static AccountController.shared.getter();
    v18 = type metadata accessor for MenuLikeStateController(0);
    v19 = &protocol witness table for MenuLikeStateController;
    sub_10000F7D4(&v17);
    MenuLikeStateController.init(authStatusProvider:authServiceProvider:)(v16, v15);
    sub_100008DE4(a4);
    sub_100008DE4(a2);
    sub_100008DE4(a1);
    v12 = a5 + *(int *)(type metadata accessor for PPXDislikeActionItem(0) + 36);
    v13 = enum case for ContextActionType.dislike(_:);
    v14 = type metadata accessor for ContextActionType(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v12, v13, v14);
    sub_100009414(v22, a5);
    sub_100009414(v21, a5 + 40);
    *(_QWORD *)(a5 + 80) = a3;
    sub_100009414(v20, a5 + 88);
    return (id)sub_100009414(&v17, a5 + 128);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10001270C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  __int128 v21[2];
  char v22;
  _QWORD v23[3];
  uint64_t v24;
  uint64_t v25;

  v1 = v0;
  v2 = v0[3];
  v3 = v1[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter(v21, v2, v3);
  if (v22 == 1)
  {
    sub_100009450((uint64_t)v21);
LABEL_11:
    v19 = 0;
    return v19 & 1;
  }
  sub_100009414(v21, (uint64_t)v23);
  v4 = v24;
  v5 = v25;
  sub_10000942C(v23, v24);
  v6 = dispatch thunk of ContextAssetInfoProtocol.assetType.getter(v4, v5);
  if ((static ContextActionAssetType.== infix(_:_:)(v6, 4) & 1) != 0)
    goto LABEL_10;
  v7 = v24;
  v8 = v25;
  sub_10000942C(v23, v24);
  v9 = dispatch thunk of ContextAssetInfoProtocol.assetType.getter(v7, v8);
  if ((static ContextActionAssetType.== infix(_:_:)(v9, 5) & 1) != 0)
    goto LABEL_10;
  v10 = v24;
  v11 = v25;
  sub_10000942C(v23, v24);
  v12 = dispatch thunk of ContextAssetInfoProtocol.storeId.getter(v10, v11);
  if (!v13)
    goto LABEL_10;
  v14 = v12;
  v15 = v13;
  swift_bridgeObjectRelease(v13);
  v16 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0)
    v16 = v14 & 0xFFFFFFFFFFFFLL;
  if (!v16)
  {
LABEL_10:
    sub_100008DE4(v23);
    goto LABEL_11;
  }
  v17 = v1[3];
  v18 = v1[4];
  sub_10000942C(v1, v17);
  v19 = dispatch thunk of ContextActionDataProtocol.isOnline.getter(v17, v18);
  sub_100008DE4(v23);
  return v19 & 1;
}

uint64_t sub_100012864()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[18] = v0;
  v2 = type metadata accessor for Logger(0);
  v1[19] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[20] = v3;
  v1[21] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for MainActor(0);
  v1[22] = static MainActor.shared.getter();
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v4, &protocol witness table for MainActor);
  v1[23] = v5;
  v1[24] = v6;
  return swift_task_switch(sub_1000128F8, v5, v6);
}

uint64_t sub_1000128F8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = *(_QWORD **)(v0 + 144);
  v2 = v1[3];
  v3 = v1[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter((_QWORD *)(v0 + 16), v2, v3);
  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
  {
    swift_release(*(_QWORD *)(v0 + 176));
    sub_100009450(v0 + 16);
    swift_task_dealloc(*(_QWORD *)(v0 + 168));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v5 = *(_QWORD **)(v0 + 144);
    sub_100009414((__int128 *)(v0 + 16), v0 + 64);
    v6 = v5[19];
    v7 = v5[20];
    sub_10000942C(v5 + 16, v6);
    v8 = v5 + 5;
    v9 = v5[10];
    v10 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of LikeStateController.authAndsubmitLikeState(liked:context:data:assetInfo:tracker:)[1]);
    *(_QWORD *)(v0 + 200) = v10;
    *v10 = v0;
    v10[1] = sub_100012A08;
    return dispatch thunk of LikeStateController.authAndsubmitLikeState(liked:context:data:assetInfo:tracker:)(0, v8, *(_QWORD *)(v0 + 144), v0 + 64, v9, v6, v7);
  }
}

uint64_t sub_100012A08(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();

  v4 = *(_QWORD **)v2;
  v5 = *(_QWORD *)(*(_QWORD *)v2 + 200);
  *(_QWORD *)(*(_QWORD *)v2 + 208) = v1;
  swift_task_dealloc(v5);
  if (v1)
  {
    v6 = v4[23];
    v7 = v4[24];
    v8 = sub_100012B50;
  }
  else
  {
    v4[27] = a1;
    v6 = v4[23];
    v7 = v4[24];
    v8 = sub_100012A7C;
  }
  return swift_task_switch(v8, v6, v7);
}

uint64_t sub_100012A7C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Class isa;

  v1 = *(_QWORD *)(v0 + 216);
  swift_release(*(_QWORD *)(v0 + 176));
  if (v1)
  {
    v2 = *(_QWORD **)(v0 + 144);
    v3 = v2 + 5;
    v4 = (void *)objc_opt_self(BSUINoticeViewController);
    v5 = v2[8];
    v6 = v2[9];
    sub_10000942C(v3, v5);
    v7 = ContextMenuPresentationContextProtocol.newOptionsForShowingHUD.getter(v5, v6);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v7);
    objc_msgSend(v4, "presentNoticeForBookLoved:options:", 0, isa);

  }
  sub_100008DE4((_QWORD *)(v0 + 64));
  swift_task_dealloc(*(_QWORD *)(v0 + 168));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012B50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = *(_QWORD *)(v0 + 208);
  v2 = swift_release(*(_QWORD *)(v0 + 176));
  static Logger.contextActionItem.getter(v2);
  swift_errorRetain(v1);
  v3 = swift_errorRetain(v1);
  v4 = Logger.logObject.getter(v3);
  v5 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 208);
    v17 = *(_QWORD *)(v0 + 160);
    v18 = *(_QWORD *)(v0 + 152);
    v19 = *(_QWORD *)(v0 + 168);
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    v8 = swift_slowAlloc(32, -1);
    v20 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue(v6, v0 + 128, v0 + 104);
    v9 = Error.localizedDescription.getter(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 120));
    v11 = v10;
    *(_QWORD *)(v0 + 136) = sub_100012DF0(v9, v10, &v20);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 136, v0 + 144, v7 + 4, v7 + 12);
    swift_bridgeObjectRelease(v11);
    swift_errorRelease(v6);
    swift_errorRelease(v6);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "error while trying to submide dislike preference with : %s", v7, 0xCu);
    swift_arrayDestroy(v8, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v8, -1, -1);
    swift_slowDealloc(v7, -1, -1);

    swift_errorRelease(v6);
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v19, v18);
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 208);
    v14 = *(_QWORD *)(v0 + 160);
    v13 = *(_QWORD *)(v0 + 168);
    v15 = *(_QWORD *)(v0 + 152);

    swift_errorRelease(v12);
    swift_errorRelease(v12);
    swift_errorRelease(v12);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  sub_100008DE4((_QWORD *)(v0 + 64));
  swift_task_dealloc(*(_QWORD *)(v0 + 168));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100012D6C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_100035224);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000087F8;
  return sub_100012864();
}

unint64_t sub_100012DB4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100035218;
  if (!qword_100035218)
  {
    v1 = objc_opt_self(JSAStore);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, &qword_100035218);
  }
  return result;
}

uint64_t sub_100012DF0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100012EC0(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000DACC((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_10000DACC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100008DE4(v12);
  return v7;
}

uint64_t sub_100012EC0(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_100013078(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_100013078(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10001310C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1000132E4(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000132E4(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10001310C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100013280(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100013280(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_1000089B0(&qword_100035228);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000132E4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_1000089B0(&qword_100035228);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100013434()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v1 + 104) = v0;
  v2 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v1 + 112) = static MainActor.shared.getter();
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000134A0, v3, v4);
}

uint64_t sub_1000134A0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  id v14;
  NSString v15;
  id v16;
  _QWORD *v17;
  id v18;
  id v19;
  id v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  v1 = *(_QWORD **)(v0 + 104);
  swift_release(*(_QWORD *)(v0 + 112));
  v2 = v1[3];
  v3 = v1[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter((_QWORD *)(v0 + 16), v2, v3);
  if (*(_BYTE *)(v0 + 56) == 1)
  {
    sub_100009450(v0 + 16);
  }
  else
  {
    sub_100009414((__int128 *)(v0 + 16), v0 + 64);
    v4 = *(_QWORD *)(v0 + 88);
    v5 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v4);
    dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v4, v5);
    v7 = v6;
    v8 = *(_QWORD *)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v8);
    LOBYTE(v8) = dispatch thunk of ContextAssetInfoProtocol.isOwned.getter(v8, v9);
    v10 = *(_QWORD *)(v0 + 88);
    v11 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v10);
    v12 = dispatch thunk of ContextAssetInfoProtocol.assetType.getter(v10, v11);
    v13 = static ContextActionAssetType.== infix(_:_:)(v12, 3);
    v14 = objc_allocWithZone((Class)PPXCollectionListViewController);
    v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
    v16 = objc_msgSend(v14, "initWithAssetID:isPurchased:isAudiobook:", v15, v8 & 1, v13 & 1);

    if (v16)
    {
      v17 = *(_QWORD **)(v0 + 104);
      v18 = objc_msgSend(objc_allocWithZone((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v16, "doneButtonPressed");
      v19 = objc_msgSend(v16, "navigationItem");
      objc_msgSend(v19, "setRightBarButtonItem:animated:", v18, 0);

      v20 = objc_msgSend(objc_allocWithZone((Class)UINavigationController), "initWithRootViewController:", v16);
      v21 = v17 + 5;
      v22 = v17[8];
      v23 = v17[9];
      sub_10000942C(v21, v22);
      dispatch thunk of ContextMenuPresentationContextProtocol.present(_:animated:)(v20, 1, v22, v23);

    }
    sub_100008DE4((_QWORD *)(v0 + 64));
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000136C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 32);
  v5 = type metadata accessor for ContextActionType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

BOOL sub_100013704()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[5];
  char v6;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter(v5, v2, v3);
  LOBYTE(v2) = v6;
  sub_100009450((uint64_t)v5);
  return (v2 & 1) == 0;
}

uint64_t sub_100013760()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_1000352E4);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000087F8;
  return sub_100013434();
}

uint64_t sub_1000137A4@<X0>(__int128 *a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X2>, __int128 *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  sub_100009414(a1, a6);
  sub_100009414(a2, a6 + 40);
  *(_QWORD *)(a6 + 80) = a3;
  sub_100009414(a4, a6 + 88);
  v11 = a6 + *(int *)(a5 + 32);
  v12 = enum case for ContextActionType.addToCollection(_:);
  v13 = type metadata accessor for ContextActionType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 104))(v11, v12, v13);
}

uint64_t sub_100013848(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  __int128 v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = v18 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain(v18);
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 3);
    *(_OWORD *)(a1 + 24) = v7;
    (**(void (***)(uint64_t, uint64_t *))(v7 - 8))(a1, a2);
    v8 = *((_OWORD *)a2 + 4);
    *(_OWORD *)(v4 + 64) = v8;
    (**(void (***)(uint64_t, uint64_t))(v8 - 8))(v4 + 40, (uint64_t)(a2 + 5));
    v9 = (void *)a2[10];
    *(_QWORD *)(v4 + 80) = v9;
    v10 = *((_OWORD *)a2 + 7);
    *(_OWORD *)(v4 + 112) = v10;
    v11 = v10;
    v12 = **(void (***)(uint64_t, uint64_t, uint64_t))(v10 - 8);
    v13 = v9;
    v12(v4 + 88, (uint64_t)(a2 + 11), v11);
    v14 = *(int *)(a3 + 32);
    v15 = v4 + v14;
    v16 = (uint64_t)a2 + v14;
    v17 = type metadata accessor for ContextActionType(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  }
  return v4;
}

uint64_t sub_100013958(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_100008DE4((_QWORD *)a1);
  sub_100008DE4((_QWORD *)(a1 + 40));

  sub_100008DE4((_QWORD *)(a1 + 88));
  v4 = a1 + *(int *)(a2 + 32);
  v5 = type metadata accessor for ContextActionType(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

uint64_t sub_1000139B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v6;
  (**(void (***)(void))(v6 - 8))();
  v7 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v7;
  (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 40, a2 + 40);
  v8 = *(void **)(a2 + 80);
  *(_QWORD *)(a1 + 80) = v8;
  v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 112) = v9;
  v10 = v9;
  v11 = **(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8);
  v12 = v8;
  v11(a1 + 88, a2 + 88, v10);
  v13 = *(int *)(a3 + 32);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = type metadata accessor for ContextActionType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  return a1;
}

_QWORD *sub_100013A90(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  sub_100008FB4(a1, a2);
  sub_100008FB4(a1 + 5, a2 + 5);
  v6 = (void *)a1[10];
  v7 = (void *)a2[10];
  a1[10] = v7;
  v8 = v7;

  sub_100008FB4(a1 + 11, a2 + 11);
  v9 = *(int *)(a3 + 32);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for ContextActionType(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  return a1;
}

uint64_t sub_100013B1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v5 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v5;
  v6 = *(_OWORD *)(a2 + 88);
  v7 = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_OWORD *)(a1 + 104) = v7;
  v8 = *(int *)(a3 + 32);
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_OWORD *)(a1 + 88) = v6;
  v11 = type metadata accessor for ContextActionType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_100013BB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_100008DE4((_QWORD *)a1);
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  sub_100008DE4((_QWORD *)(a1 + 40));
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  v7 = *(void **)(a1 + 80);
  v8 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v8;

  sub_100008DE4((_QWORD *)(a1 + 88));
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  v9 = *(int *)(a3 + 32);
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = type metadata accessor for ContextActionType(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  return a1;
}

uint64_t sub_100013C68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100013C74);
}

uint64_t sub_100013C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t sub_100013CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100013CFC);
}

uint64_t sub_100013CFC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PPXAddToCollectionActionItem(uint64_t a1)
{
  uint64_t result;

  result = qword_100035288;
  if (!qword_100035288)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PPXAddToCollectionActionItem);
  return result;
}

uint64_t sub_100013DAC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[5];

  v4[0] = "(";
  v4[1] = "(";
  v4[2] = &unk_1000277B8;
  v4[3] = "(";
  result = type metadata accessor for ContextActionType(319);
  if (v3 <= 0x3F)
  {
    v4[4] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 5, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100013E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100013E38);
}

uint64_t sub_100013E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 24);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t sub_100013EB4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100013EC0);
}

uint64_t sub_100013EC0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 24) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for ContextActionType(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PPXDownloadActionItem(uint64_t a1)
{
  uint64_t result;

  result = qword_100035340;
  if (!qword_100035340)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PPXDownloadActionItem);
  return result;
}

uint64_t sub_100013F70(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = "(";
  v4[1] = "(";
  v4[2] = &unk_1000278A0;
  v4[3] = "(";
  v4[4] = "(";
  result = type metadata accessor for ContextActionType(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 6, v4, a1 + 16);
    return 0;
  }
  return result;
}

id sub_100013FF4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X3>, uint64_t a5@<X8>)
{
  id result;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  unint64_t v16;
  _UNKNOWN **v17;
  __int128 v18[2];
  __int128 v19[2];
  __int128 v20[2];

  sub_100009484((uint64_t)a1, (uint64_t)v20);
  sub_100009484((uint64_t)a2, (uint64_t)v19);
  sub_100009484((uint64_t)a4, (uint64_t)v18);
  result = objc_msgSend((id)objc_opt_self(PPXProductPageActions), "sharedInstance");
  if (result)
  {
    v11 = result;
    v16 = sub_10001222C();
    v17 = &off_10002DC90;
    *(_QWORD *)&v15 = v11;
    sub_100008DE4(a4);
    sub_100008DE4(a2);
    sub_100008DE4(a1);
    v12 = a5 + *(int *)(type metadata accessor for PPXDownloadActionItem(0) + 36);
    v13 = enum case for ContextActionType.download(_:);
    v14 = type metadata accessor for ContextActionType(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 104))(v12, v13, v14);
    sub_100009414(v20, a5);
    sub_100009414(v19, a5 + 40);
    *(_QWORD *)(a5 + 80) = a3;
    sub_100009414(v18, a5 + 88);
    return (id)sub_100009414(&v15, a5 + 128);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100014124()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  _QWORD v15[3];
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;

  v1 = v0;
  v2 = v0[3];
  v3 = v0[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter(&v18, v2, v3);
  if ((v21 & 1) == 0)
  {
    sub_100009414(&v18, (uint64_t)v22);
    v5 = v23;
    v6 = v24;
    sub_10000942C(v22, v23);
    v7 = dispatch thunk of ContextAssetInfoProtocol.isLocal.getter(v5, v6);
    if (v7 == 2)
    {
      sub_100009484((uint64_t)v22, (uint64_t)&v18);
    }
    else
    {
      v8 = v7;
      sub_100009484((uint64_t)v22, (uint64_t)&v18);
      if ((v8 & 1) == 0)
      {
        v9 = v19;
        v10 = v20;
        sub_10000942C(&v18, v19);
        LOBYTE(v9) = dispatch thunk of ContextAssetInfoProtocol.isDownloading.getter(v9, v10);
        sub_100008DE4(&v18);
        sub_100009484((uint64_t)v22, (uint64_t)v15);
        if ((v9 & 1) == 0)
        {
          v11 = v16;
          v12 = v17;
          sub_10000942C(v15, v16);
          v13 = dispatch thunk of ContextAssetInfoProtocol.isOwned.getter(v11, v12);
          if (v13 == 2)
            v4 = 0;
          else
            v4 = v13 & 1;
          goto LABEL_12;
        }
LABEL_11:
        v4 = 0;
LABEL_12:
        sub_100008DE4(v15);
        sub_100008DE4(v22);
        return v4;
      }
    }
    sub_100008DE4(&v18);
    sub_100009484((uint64_t)v22, (uint64_t)v15);
    goto LABEL_11;
  }
  sub_100009450((uint64_t)&v18);
  return 0;
}

uint64_t sub_100014284()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v1 + 104) = v0;
  v2 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v1 + 112) = static MainActor.shared.getter();
  v3 = dispatch thunk of Actor.unownedExecutor.getter(v2, &protocol witness table for MainActor);
  return swift_task_switch(sub_1000142F0, v3, v4);
}

uint64_t sub_1000142F0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD **)(v0 + 104);
  swift_release(*(_QWORD *)(v0 + 112));
  v2 = v1[3];
  v3 = v1[4];
  sub_10000942C(v1, v2);
  ContextActionDataProtocol.selectionMode.getter((_QWORD *)(v0 + 16), v2, v3);
  if ((*(_BYTE *)(v0 + 56) & 1) != 0)
  {
    sub_100009450(v0 + 16);
  }
  else
  {
    v4 = *(_QWORD **)(v0 + 104);
    sub_100009414((__int128 *)(v0 + 16), v0 + 64);
    v5 = v4[20];
    sub_10000942C(v4 + 16, v4[19]);
    v6 = *(_QWORD *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 96);
    sub_10000942C((_QWORD *)(v0 + 64), v6);
    v8 = dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v6, v7);
    v10 = v9;
    (*(void (**)(uint64_t))(v5 + 8))(v8);
    swift_bridgeObjectRelease(v10);
    sub_100008DE4((_QWORD *)(v0 + 64));
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000143E8()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10003539C);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1000087F8;
  return sub_100014284();
}

uint64_t *sub_100014430(void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v23[5];
  char v24;

  v4 = v3;
  v8 = *v3;
  v3[11] = 0;
  v3[12] = 0;
  v3[13] = 0;
  v3[14] = (uint64_t)&_swiftEmptyArrayStorage;
  *((_BYTE *)v3 + 120) = 0;
  v9 = v3 + 4;
  v3[16] = 0;
  v3[17] = 0;
  sub_100009484((uint64_t)a3, (uint64_t)(v3 + 4));
  v3[2] = a2;
  v10 = swift_unknownObjectRetain(a2);
  v12 = (void *)ContextActionDataModel.initType.getter(v10);
  v13 = v11;
  if ((v14 & 1) != 0)
  {

    swift_unknownObjectRelease(a2);
    sub_100010BE0(v12, v13, 1);
LABEL_6:
    sub_100008DE4(a3);
LABEL_8:
    swift_unknownObjectRelease(v4[2]);
    sub_100008DE4(v9);

    swift_bridgeObjectRelease(v4[13]);
    swift_bridgeObjectRelease(v4[14]);
    swift_bridgeObjectRelease(v4[17]);
    swift_deallocPartialClassInstance(v4, v8, 144, 7);
    return 0;
  }

  ContextActionDataModel.Asset.initType.getter(v23);
  if (v24 != 2)
  {

    swift_unknownObjectRelease(a2);
    sub_100008DE4(a3);
    sub_100015EBC((uint64_t)v23);
    goto LABEL_8;
  }
  v15 = (void *)v23[0];
  v16 = type metadata accessor for MAsset(0);
  v17 = swift_dynamicCastClass(v15, v16);
  if (!v17)
  {

    swift_unknownObjectRelease(a2);
    goto LABEL_6;
  }
  v4[3] = v17;
  v18 = v15;
  v19 = MResource.id.getter();
  v21 = v20;

  swift_unknownObjectRelease(a2);
  sub_100008DE4(a3);
  v4[9] = v19;
  v4[10] = v21;
  return v4;
}

uint64_t sub_100014604()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
  uint64_t v9;

  v1 = type metadata accessor for MResourceType(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin();
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType(*(_QWORD *)(v0 + 24));
  dispatch thunk of static MResource.type.getter();
  v5 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v4, v1);
  if (v5 == enum case for MResourceType.audiobooks(_:))
    return 0x6F6F626F69647561;
  if (v5 == enum case for MResourceType.audiobookSeries(_:) || v5 == enum case for MResourceType.authors(_:))
    return 0;
  if (v5 != enum case for MResourceType.books(_:))
  {
    if (v5 != enum case for MResourceType.bookSeries(_:) && v5 != enum case for MResourceType.genres(_:))
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return 0;
  }
  if ((MAsset.isIBook.getter() & 1) != 0)
    return 0xD000000000000012;
  else
    return 0xD000000000000010;
}

uint64_t sub_100014778()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[7] = v0;
  v2 = type metadata accessor for MenuCoverImageSource(0);
  v1[8] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[9] = v3;
  v1[10] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000147D8, 0, 0);
}

uint64_t sub_1000147D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  _QWORD *v10;

  v2 = v0[9];
  v1 = v0[10];
  v4 = v0[7];
  v3 = v0[8];
  sub_100009484(v4 + 32, (uint64_t)(v0 + 2));
  v5 = v0[5];
  v6 = v0[6];
  sub_10000942C(v0 + 2, v5);
  v7 = *(_QWORD *)(v4 + 24);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, enum case for MenuCoverImageSource.network(_:), v3);
  v8 = kAEAssetActivityItemProviderDefaultCoverSize[0];
  v9 = kAEAssetActivityItemProviderDefaultCoverSize[1];
  v10 = (_QWORD *)swift_task_alloc(async function pointer to dispatch thunk of MenuCoverImageProviding.image(for:from:size:includeSpine:)[1]);
  v0[11] = v10;
  *v10 = v0;
  v10[1] = sub_1000148B4;
  return dispatch thunk of MenuCoverImageProviding.image(for:from:size:includeSpine:)(v7, v0[10], 1, v5, v6, v8, v9);
}

uint64_t sub_1000148B4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 72);
  *(_QWORD *)(*(_QWORD *)v1 + 96) = a1;
  swift_task_dealloc(v2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  return swift_task_switch(sub_10001492C, 0, 0);
}

uint64_t sub_10001492C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  sub_100008DE4((_QWORD *)(v0 + 16));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 96));
}

uint64_t sub_10001496C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  _BYTE *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t ObjCClassFromMetadata;
  id v22;
  const char *v23;
  _BYTE *v24;
  id v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  _BYTE v33[16];

  v1 = type metadata accessor for Locale(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = &v33[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  v7 = &v33[-v6];
  v8 = type metadata accessor for String.LocalizationValue(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  v14 = &v33[-v13];
  v15 = objc_msgSend(*(id *)(v0 + 24), "editionKind");
  if (v15)
  {
    v16 = v15;
    v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);

    return v17;
  }
  else
  {
    if ((dispatch thunk of MAsset.isBook.getter() & 1) != 0)
    {
      v19 = String.LocalizationValue.init(stringLiteral:)(1802465090, 0xE400000000000000);
      static Locale.current.getter(v19);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 16))(v12, v14, v8);
      v20 = type metadata accessor for BundleFinder();
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v20);
      v22 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v2 + 16))(v5, v7, v1);
      v23 = "Context Menu: book edition kind";
      v24 = v12;
      v25 = v22;
      v26 = v5;
      v27 = 31;
    }
    else
    {
      v28 = String.LocalizationValue.init(stringLiteral:)(0x6F6F626F69647541, 0xE90000000000006BLL);
      static Locale.current.getter(v28);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v9 + 16))(v12, v14, v8);
      v29 = type metadata accessor for BundleFinder();
      v30 = swift_getObjCClassFromMetadata(v29);
      v31 = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", v30);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v2 + 16))(v5, v7, v1);
      v23 = "Context Menu: audiobook edition kind";
      v24 = v12;
      v25 = v31;
      v26 = v5;
      v27 = 36;
    }
    v32 = String.init(localized:table:bundle:locale:comment:)(v24, 0, 0, v25, v26, v23, v27, 2);
    (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v7, v1);
    (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v14, v8);
    return v32;
  }
}

uint64_t sub_100014C18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  dispatch_semaphore_t v6;
  uint64_t v7;
  void *v8;
  NSString v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void (*v14)(char *, uint64_t);
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[5];
  uint64_t v20;

  v0 = type metadata accessor for DispatchTime(0);
  v18 = *(_QWORD *)(v0 - 8);
  v1 = __chkstk_darwin(v0);
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  v5 = (char *)&v17 - v4;
  v6 = dispatch_semaphore_create(0);
  v7 = swift_allocObject(&unk_10002DE58, 17, 7);
  *(_BYTE *)(v7 + 16) = 0;
  v8 = (void *)objc_opt_self(PPXBookDataStoreServices);
  v9 = String._bridgeToObjectiveC()();
  v10 = swift_allocObject(&unk_10002DE80, 32, 7);
  *(_QWORD *)(v10 + 16) = v7;
  *(_QWORD *)(v10 + 24) = v6;
  aBlock[4] = sub_100015E58;
  v20 = v10;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000ABD8;
  aBlock[3] = &unk_10002DE98;
  v11 = _Block_copy(aBlock);
  v12 = v20;
  swift_retain(v7);
  v13 = v6;
  swift_release(v12);
  objc_msgSend(v8, "fetchIsAssetID:inFinishedCollectionWithCompletion:", v9, v11);
  _Block_release(v11);

  static DispatchTime.now()();
  + infix(_:_:)(v3, 0.3);
  v14 = *(void (**)(char *, uint64_t))(v18 + 8);
  v14(v3, v0);
  OS_dispatch_semaphore.wait(timeout:)(v5);

  v14(v5, v0);
  swift_beginAccess(v7 + 16, aBlock, 0, 0);
  v15 = *(unsigned __int8 *)(v7 + 16);
  swift_release(v7);
  return v15;
}

uint64_t sub_100014E08()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSLocale v8;
  NSString v9;
  id v10;
  uint64_t v12;

  v0 = type metadata accessor for Locale(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin();
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MAsset.locale.getter(v2);
  if (v5)
  {
    v7 = v5;
    static Locale.current.getter();
    v8.super.isa = Locale._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
    v10 = -[objc_class displayNameForKey:value:](v8.super.isa, "displayNameForKey:value:", NSLocaleLanguageCode, v9);

    if (v10)
    {
      v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);

    }
    else
    {

      return 0;
    }
  }
  return v6;
}

uint64_t sub_100014F2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  void *v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v33 = a1;
  v32 = type metadata accessor for Calendar.Component(0);
  v2 = *(_QWORD *)(v32 - 8);
  __chkstk_darwin(v32);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for Calendar(0);
  v30 = *(_QWORD *)(v5 - 8);
  v31 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000089B0(&qword_1000354F0);
  __chkstk_darwin(v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v17 = (char *)&v29 - v16;
  v18 = objc_msgSend(*(id *)(v1 + 24), "releaseDate");
  if (!v18)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v10, 1, 1, v11);
    goto LABEL_5;
  }
  v19 = v18;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v20 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v20(v10, v15, v11);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v10, 0, 1, v11);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
LABEL_5:
    v24 = sub_10000F74C((uint64_t)v10, &qword_1000354F0);
    goto LABEL_6;
  }
  v21 = ((uint64_t (*)(char *, char *, uint64_t))v20)(v17, v10, v11);
  static Calendar.current.getter(v21);
  v22 = v32;
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, enum case for Calendar.Component.year(_:), v32);
  v23 = Calendar.component(_:from:)(v4, v17);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v22);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v31);
  v34 = v23;
  dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  v24 = (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v11);
LABEL_6:
  v25 = MAsset.publisherName.getter(v24);
  v26 = v33;
  ContextActionPublisherInfo.init(name:year:)(v25);
  v27 = type metadata accessor for ContextActionPublisherInfo(0);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v26, 0, 1, v27);
}

uint64_t sub_1000151F8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;

  v3 = sub_1000089B0(&qword_100034D68);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v4);
  v9 = (char *)&v26 - v8;
  v10 = __chkstk_darwin(v7);
  v12 = (char *)&v26 - v11;
  v13 = *(void **)(v1 + 24);
  if ((dispatch thunk of MAsset.isBook.getter(v10) & 1) != 0)
  {
    v14 = objc_msgSend(v13, "bookSampleDownloadURL");
    if (v14)
    {
      v15 = v14;
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v14);

      v16 = type metadata accessor for URL(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v9, 0, 1, v16);
    }
    else
    {
      v20 = type metadata accessor for URL(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v9, 1, 1, v20);
    }
  }
  else
  {
    v17 = objc_msgSend(v13, "previewURL");
    if (v17)
    {
      v18 = v17;
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v17);

      v19 = type metadata accessor for URL(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v6, 0, 1, v19);
    }
    else
    {
      v21 = type metadata accessor for URL(0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v6, 1, 1, v21);
    }
    v9 = v6;
  }
  sub_100015DD4((uint64_t)v9, (uint64_t)v12);
  v22 = type metadata accessor for URL(0);
  v23 = *(_QWORD *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v12, 1, v22) == 1)
  {
    sub_10000F74C((uint64_t)v12, &qword_100034D68);
    v24 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v12, v22);
    v24 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(a1, v24, 1, v22);
}

uint64_t sub_100015400()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  _QWORD v5[2];
  _QWORD v6[5];
  __int128 v7;
  __int128 v8;

  result = MAsset.versionHistory.getter();
  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 16))
    {
      v2 = *(_QWORD *)(result + 32);
      swift_bridgeObjectRetain(v2);
      swift_bridgeObjectRelease(v1);
      strcpy((char *)v5, "versionString");
      HIWORD(v5[1]) = -4864;
      AnyHashable.init<A>(_:)(v6, v5, &type metadata for String, &protocol witness table for String);
      if (*(_QWORD *)(v2 + 16) && (v3 = sub_10001AFF0((uint64_t)v6), (v4 & 1) != 0))
      {
        sub_10000DACC(*(_QWORD *)(v2 + 56) + 32 * v3, (uint64_t)&v7);
      }
      else
      {
        v7 = 0u;
        v8 = 0u;
      }
      swift_bridgeObjectRelease(v2);
      sub_100015DA0((uint64_t)v6);
      if (*((_QWORD *)&v8 + 1))
      {
        if ((swift_dynamicCast(v5, &v7, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
          return v5[0];
      }
      else
      {
        sub_10000F74C((uint64_t)&v7, &qword_100034D60);
      }
    }
    else
    {
      swift_bridgeObjectRelease(result);
    }
    return 0;
  }
  return result;
}

uint64_t sub_100015528()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  sub_100008DE4((_QWORD *)(v0 + 32));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 80));

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 104));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 112));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 136));
  return v0;
}

uint64_t sub_10001557C()
{
  uint64_t v0;

  sub_100015528();
  return swift_deallocClassInstance(v0, 144, 7);
}

uint64_t type metadata accessor for PPXContextAssetInfo()
{
  return objc_opt_self(_TtC25BooksProductPageExtension19PPXContextAssetInfo);
}

uint64_t sub_1000155BC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 72);
  swift_bridgeObjectRetain(*(_QWORD *)(*(_QWORD *)v0 + 80));
  return v1;
}

uint64_t sub_1000155EC()
{
  if ((dispatch thunk of MAsset.isBook.getter() & 1) != 0)
    return 2;
  else
    return 3;
}

uint64_t sub_10001561C()
{
  return sub_100014604();
}

uint64_t sub_10001563C(uint64_t a1, uint64_t a2)
{
  return sub_100015D28(a1, a2, (uint64_t (*)(void))&MAsset.artistName.getter);
}

uint64_t sub_100015648()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_1000354FC);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_100008760;
  return sub_100014778();
}

void *sub_100015690()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)v0 + 88);
  v2 = v1;
  return v1;
}

uint64_t sub_1000156B8()
{
  return sub_10001496C();
}

uint64_t sub_1000156D8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 96);
  swift_bridgeObjectRetain(*(_QWORD *)(*(_QWORD *)v0 + 104));
  return v1;
}

uint64_t sub_100015708()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(*(_QWORD *)(*(_QWORD *)v0 + 112));
}

uint64_t sub_100015714(uint64_t a1, uint64_t a2)
{
  return sub_100015ACC(a1, a2, (SEL *)&selRef_genreName);
}

uint64_t sub_100015720()
{
  return 2;
}

BOOL sub_100015728()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  id v5;
  id v6;

  v1 = *(void **)(*(_QWORD *)v0 + 16);
  MResource.id.getter();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v5 = objc_msgSend(v1, "itemStateWithIdentifier:", v4);

  v6 = objc_msgSend(v5, "download");
  swift_unknownObjectRelease(v5);
  return v6 == (id)1;
}

id sub_1000157B0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)v0 + 24), "isExplicit");
}

id sub_1000157D4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  id v5;
  id v6;

  v1 = *(void **)(*(_QWORD *)v0 + 16);
  MResource.id.getter();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v5 = objc_msgSend(v1, "itemStateWithIdentifier:", v4);

  v6 = objc_msgSend(v5, "wantToRead");
  swift_unknownObjectRelease(v5);
  return v6;
}

BOOL sub_100015858()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  id v5;
  id v6;

  v1 = *(void **)(*(_QWORD *)v0 + 16);
  MResource.id.getter();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v5 = objc_msgSend(v1, "itemStateWithIdentifier:", v4);

  v6 = objc_msgSend(v5, "download");
  swift_unknownObjectRelease(v5);
  return v6 == (id)2;
}

uint64_t sub_1000158E0()
{
  uint64_t v0;

  return *(unsigned __int8 *)(*(_QWORD *)v0 + 120);
}

uint64_t sub_1000158EC()
{
  return sub_100014C18();
}

BOOL sub_10001590C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  id v5;
  id v6;

  v1 = *(void **)(*(_QWORD *)v0 + 16);
  MResource.id.getter();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v5 = objc_msgSend(v1, "itemStateWithIdentifier:", v4);

  v6 = objc_msgSend(v5, "library");
  swift_unknownObjectRelease(v5);
  return v6 == (id)4;
}

uint64_t sub_100015994()
{
  return 0;
}

uint64_t sub_10001599C()
{
  return sub_100014E08();
}

uint64_t sub_1000159BC()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)v0 + 24), "offer");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v1, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  return v3;
}

uint64_t sub_100015A2C()
{
  return MAsset.offerType.getter();
}

uint64_t sub_100015A50()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 128);
  swift_bridgeObjectRetain(*(_QWORD *)(*(_QWORD *)v0 + 136));
  return v1;
}

uint64_t sub_100015A80@<X0>(uint64_t a1@<X8>)
{
  return sub_100014F2C(a1);
}

uint64_t sub_100015AA0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000151F8(a1);
}

uint64_t sub_100015AC0(uint64_t a1, uint64_t a2)
{
  return sub_100015ACC(a1, a2, (SEL *)&selRef_seriesName);
}

uint64_t sub_100015ACC(uint64_t a1, uint64_t a2, SEL *a3)
{
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(*(id *)(*(_QWORD *)v3 + 24), *a3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);

  return v6;
}

uint64_t sub_100015B30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = type metadata accessor for URL(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin();
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = MAsset.url.getter(v2);
  v6 = URL.absoluteString.getter(v5);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v4, v0);
  return v6;
}

uint64_t sub_100015BCC(uint64_t a1, uint64_t a2)
{
  return swift_bridgeObjectRelease(a2);
}

void (*sub_100015BD4(uint64_t *a1))(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = malloc(*(_QWORD *)(v3 + 64));
  a1[2] = (uint64_t)v4;
  v5 = MAsset.url.getter(v4);
  v6 = URL.absoluteString.getter(v5);
  v8 = v7;
  (*(void (**)(void *, uint64_t))(v3 + 8))(v4, v2);
  *a1 = v6;
  a1[1] = v8;
  return sub_100015C60;
}

void sub_100015C60(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 16);
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  free(v1);
}

uint64_t sub_100015C84()
{
  return dispatch thunk of MResource.socialHighlightID.getter();
}

uint64_t sub_100015CA8()
{
  return MAsset.htmlStrippedStandardDescription.getter();
}

id sub_100015CCC()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(*(_QWORD *)v0 + 24), "supportsUnifiedProductPage");
}

uint64_t sub_100015CF0()
{
  uint64_t v0;

  objc_msgSend(*(id *)(*(_QWORD *)v0 + 24), "hasSupplementalContent");
  return 0;
}

uint64_t sub_100015D1C(uint64_t a1, uint64_t a2)
{
  return sub_100015D28(a1, a2, (uint64_t (*)(void))&MAsset.name.getter);
}

uint64_t sub_100015D28(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  return a3();
}

uint64_t sub_100015D4C()
{
  return sub_100015400();
}

uint64_t sub_100015D6C()
{
  uint64_t v0;

  return sub_100015D90(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 0);
}

uint64_t sub_100015D7C()
{
  return 0;
}

uint64_t sub_100015D84()
{
  uint64_t v0;

  return static ContentInfoUtilities.assetInfo(storeAsset:)(*(_QWORD *)(*(_QWORD *)v0 + 24));
}

uint64_t sub_100015D90(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_100015DA0(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100015DD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000089B0(&qword_100034D68);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100015E1C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100015E2C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_100015E58(char a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v5[24];

  v3 = *(_QWORD *)(v1 + 16);
  swift_beginAccess(v3 + 16, v5, 1, 0);
  *(_BYTE *)(v3 + 16) = a1;
  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_100015EA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100015EB4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100015EBC(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for ContextActionDataModel.Asset.InitType - 1) + 8))();
  return a1;
}

uint64_t initializeBufferWithCopyOfBuffer for PPXContextMenuPresentationContext(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for PPXContextMenuPresentationContext(uint64_t a1)
{
  swift_unknownObjectWeakDestroy(a1);

  return swift_release(*(_QWORD *)(a1 + 16));
}

uint64_t initializeWithCopy for PPXContextMenuPresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = swift_unknownObjectWeakCopyInit();
  v5 = *(void **)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(v4 + 8) = v5;
  *(_QWORD *)(v4 + 16) = v6;
  v7 = v5;
  swift_retain(v6);
  return a1;
}

uint64_t assignWithCopy for PPXContextMenuPresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v4 = swift_unknownObjectWeakCopyAssign();
  v5 = *(void **)(a2 + 8);
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;
  v7 = v5;

  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v8;
  swift_retain(v8);
  swift_release(v9);
  return a1;
}

__n128 initializeWithTake for PPXContextMenuPresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;

  v3 = swift_unknownObjectWeakTakeInit();
  result = *(__n128 *)(a2 + 8);
  *(__n128 *)(v3 + 8) = result;
  return result;
}

uint64_t assignWithTake for PPXContextMenuPresentationContext(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = swift_unknownObjectWeakTakeAssign();
  v5 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = *(_QWORD *)(a2 + 8);

  v6 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release(v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PPXContextMenuPresentationContext(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PPXContextMenuPresentationContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PPXContextMenuPresentationContext()
{
  return &type metadata for PPXContextMenuPresentationContext;
}

uint64_t sub_1000160EC()
{
  uint64_t v0;

  return swift_unknownObjectWeakLoadStrong(v0);
}

id sub_1000160F4()
{
  uint64_t v0;

  return *(id *)(v0 + 8);
}

uint64_t sub_1000160FC()
{
  uint64_t v0;

  return swift_retain(*(_QWORD *)(v0 + 16));
}

void sub_100016104(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  void *Strong;
  id v7;

  v3 = v2;
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v7 = Strong;
    objc_msgSend(Strong, "presentViewController:animated:completion:", a1, a2 & 1, 0);

  }
}

unint64_t sub_100016170(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000089B0(&qword_100034C68);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10001E698(v7, (uint64_t)v16, &qword_100035600);
    result = sub_10001AFF0((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_10000DB08(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 72;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000162B0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
LABEL_9:
    v16 = a1;
LABEL_10:
    swift_bridgeObjectRelease(v16);
    return (unint64_t)v4;
  }
  sub_1000089B0(&qword_1000355F0);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
    goto LABEL_9;
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10001E698(v7, (uint64_t)&v17, &qword_1000355F8);
    v8 = v17;
    v9 = v18;
    result = sub_10001AF8C(v17, v18);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = sub_10000F788((uint64_t)&v19, v4[7] + 32 * result, &qword_100034D60);
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_12;
    v4[2] = v15;
    v7 += 48;
    if (!--v5)
    {
      swift_release(v4);
      v16 = a1;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_12:
  __break(1u);
  return result;
}

unint64_t sub_1000163F8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000089B0(&qword_1000355E0);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10001E698(v7, (uint64_t)&v16, &qword_1000355E8);
    v8 = v16;
    v9 = v17;
    result = sub_10001AF8C(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_10000DB08(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_10001652C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000089B0(&qword_100035550);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v7 = *(v6 - 2);
    v8 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    result = sub_10001AF8C(v7, v8);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v7;
    v12[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v9;
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v6 += 3;
    v4[2] = v15;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10001663C()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10001E8D0(v0, qword_100035500);
  sub_10001E368(v0, (uint64_t)qword_100035500);
  return Logger.init(subsystem:category:)(0xD000000000000024, 0x8000000100028D30, 0xD000000000000016, 0x8000000100027C20);
}

id PPXContextMenuProvider.getInstance()()
{
  void *v0;

  return v0;
}

void *PPXContextMenuProvider.menuElements(for:with:)(void *a1, void *a2)
{
  return sub_1000166D8(a2, a1);
}

void *sub_1000166D8(void *a1, void *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  unsigned __int8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  _QWORD *v48;
  uint64_t isUniquelyReferenced_nonNull_native;
  char v50;
  unint64_t v51;
  uint64_t v52;
  _BOOL8 v53;
  uint64_t v54;
  char v55;
  unint64_t v56;
  char v57;
  _QWORD *v58;
  uint64_t *v59;
  uint64_t v60;
  BOOL v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  unint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  void *v82;
  _QWORD *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *result;
  unint64_t v90;
  char *v91;
  id v92;
  unint64_t v93;
  uint64_t v94;
  char *v95;
  _QWORD *v96;
  _QWORD *v97;
  __int128 v98;
  uint64_t v99;
  void *v100;
  char v101;
  _QWORD v102[3];
  uint64_t v103;
  uint64_t v104;
  char v105[8];
  id v106;
  uint64_t v107;

  v3 = v2;
  v6 = sub_1000089B0(&qword_100035520);
  __chkstk_darwin(v6);
  v8 = (char *)&v90 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PPXContextActionData(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v90 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1;
  v14 = (id)BSUIGetLibraryItemStateProvider(v13);
  v99 = type metadata accessor for MenuCoverImageProvider(0);
  v100 = &protocol witness table for MenuCoverImageProvider;
  sub_10000F7D4(&v98);
  MenuCoverImageProvider.init()();
  sub_100010728(v13, (uint64_t)v14, &v98, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10000F74C((uint64_t)v8, &qword_100035520);
    if (qword_1000344C0 != -1)
LABEL_46:
      swift_once(&qword_1000344C0, sub_10001663C);
    v15 = type metadata accessor for Logger(0);
    v16 = sub_10001E368(v15, (uint64_t)qword_100035500);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Unable to instantiate PPXContextActionData", v19, 2u);
      swift_slowDealloc(v19, -1, -1);
    }

    return &_swiftEmptyArrayStorage;
  }
  sub_100010C90((uint64_t)v8, (uint64_t)v12);
  v21 = *(_QWORD *)(v3 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_objectGraph);
  swift_unknownObjectWeakInit(v105, a2);
  v106 = v13;
  v107 = v21;
  v22 = v13;
  swift_retain(v21);
  v94 = (uint64_t)a2;
  v23 = objc_msgSend(a2, "ba_analyticsTracker");
  v24 = *(_QWORD *)(v3 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_actionItems);
  v25 = __chkstk_darwin(v23);
  *(&v90 - 4) = (unint64_t)v12;
  *(&v90 - 3) = (unint64_t)v105;
  *(&v90 - 2) = v25;
  *(&v90 - 1) = v3;
  swift_bridgeObjectRetain(v24);
  v26 = 0;
  v95 = sub_100017354((void (*)(__int128 *__return_ptr, __int128 *))sub_10001E910, (uint64_t)(&v90 - 6), v24);
  swift_bridgeObjectRelease(v24);
  v27 = sub_100008C0C(&qword_100035658, type metadata accessor for PPXContextActionData, (uint64_t)&unk_100027318);
  ContextActionDataProtocol.selectionMode.getter(&v98, v9, v27);
  if (v101 == 1)
  {
    v92 = v23;
    v93 = v3;
    sub_100009450((uint64_t)&v98);
  }
  else
  {
    sub_100009414(&v98, (uint64_t)v102);
    v28 = v103;
    v29 = v104;
    sub_10000942C(v102, v103);
    if ((dispatch thunk of ContextAssetInfoProtocol.isExplicit.getter(v28, v29) & 1) != 0)
    {
      v30 = objc_msgSend((id)objc_opt_self(BURestrictionsProvider), "sharedInstance");
      v31 = objc_msgSend(v30, "isExplicitContentAllowed");
      swift_unknownObjectRelease(v30);
      if ((v31 & 1) == 0)
      {

        swift_bridgeObjectRelease(v95);
        sub_10001E954((uint64_t)v105);
        sub_100010C0C((uint64_t)v12);
        sub_100008DE4(v102);
        return &_swiftEmptyArrayStorage;
      }
    }
    v92 = v23;
    v93 = v3;
    sub_100008DE4(v102);
  }
  v102[0] = &_swiftEmptyArrayStorage;
  v97 = &_swiftEmptyDictionarySingleton;
  v32 = *((_QWORD *)v95 + 2);
  if (v32)
  {
    v90 = 0;
    v91 = v12;
    v33 = (uint64_t)(v95 + 32);
    v26 = 0x8000000000000000;
    while (1)
    {
      sub_100009484(v33, (uint64_t)&v98);
      v36 = v99;
      v37 = v100;
      sub_10000942C(&v98, v99);
      v38 = (void *)ContextActionItem.uiAction.getter(v36, v37);
      if (!v38)
        goto LABEL_16;
      v39 = v38;
      specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v39);
      v41 = *(_QWORD *)((v102[0] & 0xFFFFFFFFFFFFFF8) + 0x10);
      v40 = *(_QWORD *)((v102[0] & 0xFFFFFFFFFFFFFF8) + 0x18);
      if (v41 >= v40 >> 1)
        specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v40 > 1, v41 + 1, 1);
      v42 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v41, v39);
      specialized Array._endMutation()(v42);
      v43 = objc_msgSend(v39, "identifier");
      v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(v43);
      v46 = v45;

      v47 = v39;
      v48 = v97;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v97);
      v96 = v48;
      v97 = (_QWORD *)0x8000000000000000;
      v51 = sub_10001AF8C(v44, v46);
      v52 = v48[2];
      v53 = (v50 & 1) == 0;
      v54 = v52 + v53;
      if (__OFADD__(v52, v53))
      {
        __break(1u);
LABEL_45:
        __break(1u);
        goto LABEL_46;
      }
      v55 = v50;
      if (v48[3] >= v54)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          v58 = v96;
          if ((v50 & 1) == 0)
            goto LABEL_27;
        }
        else
        {
          sub_10001CB60();
          v58 = v96;
          if ((v55 & 1) == 0)
            goto LABEL_27;
        }
      }
      else
      {
        sub_10001B7C8(v54, isUniquelyReferenced_nonNull_native);
        v56 = sub_10001AF8C(v44, v46);
        if ((v55 & 1) != (v57 & 1))
        {
          KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
          __break(1u);
          goto LABEL_48;
        }
        v51 = v56;
        v58 = v96;
        if ((v55 & 1) == 0)
        {
LABEL_27:
          v58[(v51 >> 6) + 8] |= 1 << v51;
          v59 = (uint64_t *)(v58[6] + 16 * v51);
          *v59 = v44;
          v59[1] = v46;
          *(_QWORD *)(v58[7] + 8 * v51) = v47;
          v60 = v58[2];
          v61 = __OFADD__(v60, 1);
          v62 = v60 + 1;
          if (v61)
            goto LABEL_45;
          v58[2] = v62;
          swift_bridgeObjectRetain(v46);
          goto LABEL_15;
        }
      }
      v34 = v58[7];

      *(_QWORD *)(v34 + 8 * v51) = v47;
LABEL_15:
      v35 = v97;
      v97 = v58;

      swift_bridgeObjectRelease(v46);
      swift_bridgeObjectRelease(v35);
LABEL_16:
      sub_100008DE4(&v98);
      v33 += 40;
      if (!--v32)
      {
        swift_bridgeObjectRelease(v95);
        v63 = v97;
        v12 = v91;
        v26 = v90;
        goto LABEL_33;
      }
    }
  }
  swift_bridgeObjectRelease(v95);
  v63 = &_swiftEmptyDictionarySingleton;
LABEL_33:
  v64 = sub_1000183BC();
  v66 = v65;
  v67 = sub_10001D9BC(v64, v65, v94);
  swift_bridgeObjectRelease(v66);
  v68 = swift_bridgeObjectRetain(v63);
  v69 = sub_1000174EC(v68);
  swift_bridgeObjectRelease(v63);
  v70 = static ContextActionType.orderActionItems(_:)(v69);
  v71 = swift_bridgeObjectRelease(v69);
  __chkstk_darwin(v71);
  *(&v90 - 2) = (unint64_t)v12;
  *(&v90 - 1) = (unint64_t)&v97;
  v72 = sub_1000176E4((void (*)(uint64_t *__return_ptr, uint64_t))sub_10001E92C, (uint64_t)(&v90 - 4), v70);
  v73 = swift_bridgeObjectRelease(v70);
  v96 = 0;
  v74 = &_swiftEmptyArrayStorage;
  *(_QWORD *)&v98 = &_swiftEmptyArrayStorage;
  v75 = *((_QWORD *)v72 + 2);
  v77 = v92;
  v76 = v93;
  if (v75)
  {
    swift_bridgeObjectRetain(v72);
    v78 = 48;
    do
    {
      v79 = swift_bridgeObjectRetain(*(_QWORD *)&v72[v78]);
      sub_10001C308(v79);
      v78 += 24;
      --v75;
    }
    while (v75);
    v73 = swift_bridgeObjectRelease(v72);
    v74 = (void *)v98;
  }
  __chkstk_darwin(v73);
  *(&v90 - 2) = v67;
  *(&v90 - 1) = (unint64_t)&v96;
  v80 = sub_10001DEE0((unint64_t)v74, (uint64_t (*)(uint64_t, id))sub_10001E944);
  swift_bridgeObjectRelease(v74);
  v81 = *((_QWORD *)v80 + 2);
  if (v81)
  {
    sub_1000089B0(&qword_100035550);
    v82 = (void *)static _DictionaryStorage.allocate(capacity:)(v81);
  }
  else
  {
    v82 = &_swiftEmptyDictionarySingleton;
  }
  *(_QWORD *)&v98 = v82;
  v83 = (_QWORD *)swift_bridgeObjectRetain(v80);
  sub_10001C638(v83, 1, &v98);
  if (!v26)
  {
    swift_bridgeObjectRelease(v80);
    v84 = v98;
    v85 = v76 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider;
    swift_beginAccess(v76 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider, &v98, 33, 0);
    v86 = *(_QWORD *)(v85 + 24);
    v87 = *(_QWORD *)(v85 + 32);
    sub_10001E39C(v85, v86);
    dispatch thunk of FigaroProviding.contextMenuActionTypeToIndexDict.setter(v84, v86, v87);
    v88 = swift_endAccess(&v98);
    __chkstk_darwin(v88);
    *(&v90 - 2) = v67;
    v20 = sub_10001E07C((uint64_t)v72, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_10001E94C);

    swift_bridgeObjectRelease(v102[0]);
    sub_10001E954((uint64_t)v105);
    sub_100010C0C((uint64_t)v12);
    swift_bridgeObjectRelease(v72);
    swift_bridgeObjectRelease(v67);
    swift_bridgeObjectRelease(v97);
    return v20;
  }
LABEL_48:
  result = (void *)swift_unexpectedError(v26, "Swift/Dictionary.swift", 22, 1, 489);
  __break(1u);
  return result;
}

char *sub_100017020(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  unsigned __int8 v26;
  uint64_t v27;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  void *v32;
  char v33;
  _QWORD v34[3];
  uint64_t v35;
  uint64_t v36;

  v3 = v2;
  v6 = sub_1000089B0(&qword_100035520);
  __chkstk_darwin(v6);
  v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for PPXContextActionData(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1;
  v14 = (id)BSUIGetLibraryItemStateProvider(v13);
  v31 = type metadata accessor for MenuCoverImageProvider(0);
  v32 = &protocol witness table for MenuCoverImageProvider;
  sub_10000F7D4(&v30);
  MenuCoverImageProvider.init()();
  sub_100010728(v13, (uint64_t)v14, &v30, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10000F74C((uint64_t)v8, &qword_100035520);
    if (qword_1000344C0 != -1)
      swift_once(&qword_1000344C0, sub_10001663C);
    v15 = type metadata accessor for Logger(0);
    v16 = sub_10001E368(v15, (uint64_t)qword_100035500);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Unable to instantiate ContextActionData", v19, 2u);
      swift_slowDealloc(v19, -1, -1);
    }

    return (char *)&_swiftEmptyArrayStorage;
  }
  sub_100010C90((uint64_t)v8, (uint64_t)v12);
  v21 = sub_100008C0C(&qword_100035658, type metadata accessor for PPXContextActionData, (uint64_t)&unk_100027318);
  ContextActionDataProtocol.selectionMode.getter(&v30, v9, v21);
  if (v33 == 1)
  {
    v22 = sub_100009450((uint64_t)&v30);
LABEL_13:
    v27 = *(_QWORD *)(v3 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_actionItems);
    __chkstk_darwin(v22);
    *(&v29 - 4) = (uint64_t)v12;
    *(&v29 - 3) = a2;
    *(&v29 - 2) = (uint64_t)v13;
    *(&v29 - 1) = v3;
    swift_bridgeObjectRetain(v27);
    v20 = sub_100017354((void (*)(__int128 *__return_ptr, __int128 *))sub_10001E7F8, (uint64_t)(&v29 - 6), v27);
    swift_bridgeObjectRelease(v27);
    sub_100010C0C((uint64_t)v12);
    return v20;
  }
  sub_100009414(&v30, (uint64_t)v34);
  v23 = v35;
  v24 = v36;
  sub_10000942C(v34, v35);
  if ((dispatch thunk of ContextAssetInfoProtocol.isExplicit.getter(v23, v24) & 1) == 0
    || (v25 = objc_msgSend((id)objc_opt_self(BURestrictionsProvider), "sharedInstance"),
        v26 = objc_msgSend(v25, "isExplicitContentAllowed"),
        swift_unknownObjectRelease(v25),
        (v26 & 1) != 0))
  {
    v22 = sub_100008DE4(v34);
    goto LABEL_13;
  }
  sub_100010C0C((uint64_t)v12);
  sub_100008DE4(v34);
  return (char *)&_swiftEmptyArrayStorage;
}

char *sub_100017354(void (*a1)(__int128 *__return_ptr, __int128 *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  __int128 v12;
  uint64_t v13;
  __int128 v14[2];
  __int128 v15;

  v4 = *(_QWORD *)(a3 + 16);
  if (!v4)
    return (char *)&_swiftEmptyArrayStorage;
  swift_bridgeObjectRetain(a3);
  v7 = 0;
  v8 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    v15 = *(_OWORD *)(a3 + 16 * v7 + 32);
    a1(&v12, &v15);
    if (v3)
    {
      swift_bridgeObjectRelease(v8);
      swift_bridgeObjectRelease(a3);
      return v8;
    }
    if (v13)
    {
      sub_100009414(&v12, (uint64_t)v14);
      sub_100009414(v14, (uint64_t)&v12);
      if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0)
        v8 = sub_10001AC50(0, *((_QWORD *)v8 + 2) + 1, 1, v8, &qword_100035630, &qword_100035628);
      v10 = *((_QWORD *)v8 + 2);
      v9 = *((_QWORD *)v8 + 3);
      if (v10 >= v9 >> 1)
        v8 = sub_10001AC50((char *)(v9 > 1), v10 + 1, 1, v8, &qword_100035630, &qword_100035628);
      *((_QWORD *)v8 + 2) = v10 + 1;
      sub_100009414(&v12, (uint64_t)&v8[40 * v10 + 32]);
    }
    else
    {
      sub_10000F74C((uint64_t)&v12, &qword_100035648);
    }
    ++v7;
  }
  while (v4 != v7);
  swift_bridgeObjectRelease(a3);
  return v8;
}

uint64_t sub_1000174EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  uint64_t result;
  int64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;

  v20 = a1 + 64;
  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v5 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain(a1);
  v7 = 0;
  v8 = (char *)&_swiftEmptyArrayStorage;
  if (!v4)
    goto LABEL_5;
LABEL_4:
  v9 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  for (i = v9 | (v7 << 6); ; i = __clz(__rbit64(v12)) + (v7 << 6))
  {
    v14 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v15 = *v14;
    v16 = v14[1];
    swift_bridgeObjectRetain(v16);
    result = swift_isUniquelyReferenced_nonNull_native(v8);
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_10001AB44(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
      v8 = (char *)result;
    }
    v18 = *((_QWORD *)v8 + 2);
    v17 = *((_QWORD *)v8 + 3);
    if (v18 >= v17 >> 1)
    {
      result = (uint64_t)sub_10001AB44((char *)(v17 > 1), v18 + 1, 1, v8);
      v8 = (char *)result;
    }
    *((_QWORD *)v8 + 2) = v18 + 1;
    v19 = &v8[16 * v18];
    *((_QWORD *)v19 + 4) = v15;
    *((_QWORD *)v19 + 5) = v16;
    if (v4)
      goto LABEL_4;
LABEL_5:
    v11 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v11 >= v5)
      goto LABEL_27;
    v12 = *(_QWORD *)(v20 + 8 * v11);
    ++v7;
    if (!v12)
    {
      v7 = v11 + 1;
      if (v11 + 1 >= v5)
        goto LABEL_27;
      v12 = *(_QWORD *)(v20 + 8 * v7);
      if (!v12)
      {
        v7 = v11 + 2;
        if (v11 + 2 >= v5)
          goto LABEL_27;
        v12 = *(_QWORD *)(v20 + 8 * v7);
        if (!v12)
        {
          v7 = v11 + 3;
          if (v11 + 3 >= v5)
            goto LABEL_27;
          v12 = *(_QWORD *)(v20 + 8 * v7);
          if (!v12)
            break;
        }
      }
    }
LABEL_20:
    v4 = (v12 - 1) & v12;
  }
  v13 = v11 + 4;
  if (v13 >= v5)
  {
LABEL_27:
    swift_release(a1);
    return (uint64_t)v8;
  }
  v12 = *(_QWORD *)(v20 + 8 * v13);
  if (v12)
  {
    v7 = v13;
    goto LABEL_20;
  }
  while (1)
  {
    v7 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v7 >= v5)
      goto LABEL_27;
    v12 = *(_QWORD *)(v20 + 8 * v7);
    ++v13;
    if (v12)
      goto LABEL_20;
  }
LABEL_29:
  __break(1u);
  return result;
}

char *sub_1000176E4(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;
  char *v15;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  void (*v21)(uint64_t *__return_ptr, uint64_t);

  v21 = a1;
  v4 = *(_QWORD *)(a3 + 16);
  if (!v4)
    return (char *)&_swiftEmptyArrayStorage;
  v6 = *(_QWORD *)(sub_1000089B0(&qword_100035638) - 8);
  v7 = a3 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
  v8 = *(_QWORD *)(v6 + 72);
  v17 = a3;
  swift_bridgeObjectRetain(a3);
  v9 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    v21(&v19, v7);
    if (v3)
    {
      swift_bridgeObjectRelease(v9);
      swift_bridgeObjectRelease(v17);
      return v9;
    }
    if ((_QWORD)v20)
    {
      v18 = v20;
      v11 = v19;
      if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0)
        v9 = sub_10001AA20(0, *((_QWORD *)v9 + 2) + 1, 1, v9);
      v13 = *((_QWORD *)v9 + 2);
      v12 = *((_QWORD *)v9 + 3);
      v14 = v18;
      if (v13 >= v12 >> 1)
      {
        v15 = sub_10001AA20((char *)(v12 > 1), v13 + 1, 1, v9);
        v14 = v18;
        v9 = v15;
      }
      *((_QWORD *)v9 + 2) = v13 + 1;
      v10 = &v9[24 * v13];
      *((_QWORD *)v10 + 4) = v11;
      *(_OWORD *)(v10 + 40) = v14;
    }
    v7 += v8;
    --v4;
  }
  while (v4);
  swift_bridgeObjectRelease(v17);
  return v9;
}

void *sub_100017858(uint64_t a1, uint64_t *a2)
{
  void *result;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;

  result = &_swiftEmptyArrayStorage;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    v6 = *(_QWORD *)(type metadata accessor for ContextActionType(0) - 8);
    v7 = a1 + ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80));
    v8 = *(_QWORD *)(v6 + 72);
    v9 = swift_bridgeObjectRetain(a1);
    do
    {
      v10 = ContextActionType.identifier.getter(v9);
      v12 = v11;
      v13 = *a2;
      if (*(_QWORD *)(*a2 + 16) && (v14 = sub_10001AF8C(v10, v11), (v15 & 1) != 0))
      {
        v16 = *(id *)(*(_QWORD *)(v13 + 56) + 8 * v14);
        v17 = swift_bridgeObjectRelease(v12);
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v17);
        v19 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
        v18 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v19 >= v18 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v18 > 1, v19 + 1, 1);
        v20 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v19, v16);
        v9 = specialized Array._endMutation()(v20);
      }
      else
      {
        v9 = swift_bridgeObjectRelease(v12);
      }
      v7 += v8;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease(a1);
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_100017990(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  int64_t v6;
  char *v7;
  unint64_t v8;
  unint64_t i;
  int64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int64_t v20;
  _QWORD v21[5];
  __int128 v22;
  _OWORD v23[2];
  uint64_t v24;
  __int128 v25;
  _OWORD v26[2];
  uint64_t v27;
  _OWORD *v28;

  v2 = 1 << *(_BYTE *)(a1 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a1 + 64);
  v20 = (unint64_t)(v2 + 63) >> 6;
  v28 = v26;
  result = swift_bridgeObjectRetain(a1);
  v6 = 0;
  v7 = (char *)&_swiftEmptyArrayStorage;
  if (!v4)
    goto LABEL_5;
LABEL_4:
  v8 = __clz(__rbit64(v4));
  v4 &= v4 - 1;
  for (i = v8 | (v6 << 6); ; i = __clz(__rbit64(v11)) + (v6 << 6))
  {
    v13 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v14 = *v13;
    v15 = v13[1];
    sub_100009484(*(_QWORD *)(a1 + 56) + 40 * i, (uint64_t)v28);
    *(_QWORD *)&v25 = v14;
    *((_QWORD *)&v25 + 1) = v15;
    v22 = v25;
    v23[0] = v26[0];
    v23[1] = v26[1];
    v24 = v27;
    v16 = v25;
    sub_100009484((uint64_t)v23, (uint64_t)v21);
    swift_bridgeObjectRetain(v15);
    swift_bridgeObjectRetain(*((_QWORD *)&v16 + 1));
    sub_100008DE4(v21);
    sub_10000F74C((uint64_t)&v22, &qword_100035650);
    result = swift_isUniquelyReferenced_nonNull_native(v7);
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_10001AB44(0, *((_QWORD *)v7 + 2) + 1, 1, v7);
      v7 = (char *)result;
    }
    v18 = *((_QWORD *)v7 + 2);
    v17 = *((_QWORD *)v7 + 3);
    if (v18 >= v17 >> 1)
    {
      result = (uint64_t)sub_10001AB44((char *)(v17 > 1), v18 + 1, 1, v7);
      v7 = (char *)result;
    }
    *((_QWORD *)v7 + 2) = v18 + 1;
    *(_OWORD *)&v7[16 * v18 + 32] = v16;
    if (v4)
      goto LABEL_4;
LABEL_5:
    v10 = v6 + 1;
    if (__OFADD__(v6, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v10 >= v20)
      goto LABEL_27;
    v11 = *(_QWORD *)(v19 + 8 * v10);
    ++v6;
    if (!v11)
    {
      v6 = v10 + 1;
      if (v10 + 1 >= v20)
        goto LABEL_27;
      v11 = *(_QWORD *)(v19 + 8 * v6);
      if (!v11)
      {
        v6 = v10 + 2;
        if (v10 + 2 >= v20)
          goto LABEL_27;
        v11 = *(_QWORD *)(v19 + 8 * v6);
        if (!v11)
        {
          v6 = v10 + 3;
          if (v10 + 3 >= v20)
            goto LABEL_27;
          v11 = *(_QWORD *)(v19 + 8 * v6);
          if (!v11)
            break;
        }
      }
    }
LABEL_20:
    v4 = (v11 - 1) & v11;
  }
  v12 = v10 + 4;
  if (v12 >= v20)
  {
LABEL_27:
    swift_release(a1);
    return (uint64_t)v7;
  }
  v11 = *(_QWORD *)(v19 + 8 * v12);
  if (v11)
  {
    v6 = v12;
    goto LABEL_20;
  }
  while (1)
  {
    v6 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v6 >= v20)
      goto LABEL_27;
    v11 = *(_QWORD *)(v19 + 8 * v6);
    ++v12;
    if (v11)
      goto LABEL_20;
  }
LABEL_29:
  __break(1u);
  return result;
}

_QWORD *sub_100017C28(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t);
  _QWORD *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;

  v41 = a2;
  v40 = sub_1000089B0(&qword_100035638);
  v4 = *(_QWORD *)(v40 - 8);
  __chkstk_darwin(v40);
  v39 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000089B0(&qword_100035548);
  v37 = *(_QWORD *)(v6 - 8);
  v38 = v6;
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __chkstk_darwin(v7);
  v35 = (char *)&v30 - v11;
  __chkstk_darwin(v10);
  v36 = (uint64_t)&v30 - v12;
  v13 = *(_QWORD *)(a1 + 16);
  if (!v13)
    return &_swiftEmptyArrayStorage;
  v42 = v2;
  v14 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v34 = *(_QWORD *)(v4 + 72);
  v15 = type metadata accessor for ContextActionType.ContextActionGroup(0);
  v33 = *(_QWORD *)(v15 - 8);
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v33 + 16);
  v31 = v15;
  v32 = v16;
  v30 = a1;
  swift_bridgeObjectRetain(a1);
  v17 = &_swiftEmptyArrayStorage;
  v18 = v39;
  v19 = v31;
  v20 = (uint64_t)v35;
  do
  {
    v21 = *(int *)(v38 + 48);
    v22 = *(int *)(v40 + 48);
    v32(v18, v14, v19);
    v23 = *(_QWORD *)(v14 + v22);
    (*(void (**)(uint64_t, char *, uint64_t))(v33 + 32))(v20, v18, v19);
    v24 = v42;
    v25 = sub_1000180BC(v23, v41);
    v42 = v24;
    *(_QWORD *)(v20 + v21) = v25;
    v26 = v36;
    sub_10000F788(v20, v36, &qword_100035548);
    sub_10000F788(v26, (uint64_t)v9, &qword_100035548);
    if ((swift_isUniquelyReferenced_nonNull_native(v17) & 1) == 0)
      v17 = (_QWORD *)sub_10001AD7C(0, v17[2] + 1, 1, (unint64_t)v17);
    v28 = v17[2];
    v27 = v17[3];
    if (v28 >= v27 >> 1)
      v17 = (_QWORD *)sub_10001AD7C(v27 > 1, v28 + 1, 1, (unint64_t)v17);
    v17[2] = v28 + 1;
    sub_10000F788((uint64_t)v9, (uint64_t)v17+ ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80))+ *(_QWORD *)(v37 + 72) * v28, &qword_100035548);
    v14 += v34;
    --v13;
  }
  while (v13);
  swift_bridgeObjectRelease(v30);
  return v17;
}

char *sub_100017ED4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD v23[3];
  _OWORD v24[2];
  __int128 v25;
  uint64_t v26;

  v2 = type metadata accessor for ContextActionType(0);
  v21 = *(_QWORD *)(v2 - 8);
  v22 = v2;
  __chkstk_darwin(v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain(a1);
  v20 = v5;
  v18 = a1;
  if (v5)
  {
    v6 = 0;
    v7 = a1 + 32;
    v19 = (uint64_t)v24 + 8;
    v8 = (char *)&_swiftEmptyArrayStorage;
    do
    {
      sub_100009484(v7, (uint64_t)v23 + 8);
      *(_QWORD *)&v24[0] = v6;
      sub_100009414((_OWORD *)((char *)v23 + 8), v19);
      v23[1] = v24[1];
      v23[2] = v25;
      v23[0] = v24[0];
      v26 = *(_QWORD *)&v24[0];
      v9 = v25;
      sub_10000942C((_QWORD *)v23 + 1, v25);
      v10 = dispatch thunk of ContextActionItem.type.getter(v9, *((_QWORD *)&v9 + 1));
      v11 = ContextActionType.identifier.getter(v10);
      v13 = v12;
      (*(void (**)(char *, uint64_t))(v21 + 8))(v4, v22);
      sub_10000F74C((uint64_t)v23, &qword_100035618);
      if ((swift_isUniquelyReferenced_nonNull_native(v8) & 1) == 0)
        v8 = sub_10001A8FC(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
      v15 = *((_QWORD *)v8 + 2);
      v14 = *((_QWORD *)v8 + 3);
      if (v15 >= v14 >> 1)
        v8 = sub_10001A8FC((char *)(v14 > 1), v15 + 1, 1, v8);
      ++v6;
      *((_QWORD *)v8 + 2) = v15 + 1;
      v16 = &v8[24 * v15];
      *((_QWORD *)v16 + 4) = v11;
      *((_QWORD *)v16 + 5) = v13;
      *((_QWORD *)v16 + 6) = v26;
      v7 += 40;
    }
    while (v20 != v6);
  }
  else
  {
    v8 = (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRelease(v18);
  return v8;
}

char *sub_1000180BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return (char *)&_swiftEmptyArrayStorage;
  v5 = *(_QWORD *)(type metadata accessor for ContextActionType(0) - 8);
  v6 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  v7 = *(_QWORD *)(v5 + 72);
  v19 = a1;
  v8 = swift_bridgeObjectRetain(a1);
  v9 = (char *)&_swiftEmptyArrayStorage;
  do
  {
    v10 = ContextActionType.identifier.getter(v8);
    v12 = v11;
    v13 = *a2;
    if (*(_QWORD *)(*a2 + 16) && (v14 = sub_10001AF8C(v10, v11), (v15 & 1) != 0))
    {
      sub_100009484(*(_QWORD *)(v13 + 56) + 40 * v14, (uint64_t)&v20);
    }
    else
    {
      v22 = 0;
      v20 = 0u;
      v21 = 0u;
    }
    swift_bridgeObjectRelease(v12);
    if (*((_QWORD *)&v21 + 1))
    {
      sub_100009414(&v20, (uint64_t)v23);
      sub_100009414(v23, (uint64_t)&v20);
      if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0)
        v9 = sub_10001AC50(0, *((_QWORD *)v9 + 2) + 1, 1, v9, &qword_100035630, &qword_100035628);
      v17 = *((_QWORD *)v9 + 2);
      v16 = *((_QWORD *)v9 + 3);
      if (v17 >= v16 >> 1)
        v9 = sub_10001AC50((char *)(v16 > 1), v17 + 1, 1, v9, &qword_100035630, &qword_100035628);
      *((_QWORD *)v9 + 2) = v17 + 1;
      v8 = sub_100009414(&v20, (uint64_t)&v9[40 * v17 + 32]);
    }
    else
    {
      v8 = sub_10000F74C((uint64_t)&v20, &qword_100035648);
    }
    v6 += v7;
    --v2;
  }
  while (v2);
  swift_bridgeObjectRelease(v19);
  return v9;
}

uint64_t sub_100018288@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;
  _BYTE v17[40];
  _BYTE v18[24];
  _QWORD v19[5];
  _QWORD v20[5];

  v11 = *a1;
  v12 = a1[1];
  v20[3] = type metadata accessor for PPXContextActionData(0);
  v20[4] = sub_100008C0C(&qword_100035658, type metadata accessor for PPXContextActionData, (uint64_t)&unk_100027318);
  v13 = sub_10000F7D4(v20);
  sub_10001E814(a2, (uint64_t)v13);
  v19[3] = &type metadata for PPXContextMenuPresentationContext;
  v19[4] = sub_10001E858();
  v19[0] = swift_allocObject(&unk_10002E188, 40, 7);
  sub_10001E9D4(a3, v19[0] + 16);
  v14 = a5 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider;
  swift_beginAccess(v14, v18, 0, 0);
  sub_100009484(v14, (uint64_t)v17);
  a6[3] = v11;
  a6[4] = v12;
  sub_10000F7D4(a6);
  v15 = a4;
  return dispatch thunk of ContextActionItem.init(data:context:tracker:figaroProvider:)(v20, v19, a4, v17, v11, v12);
}

uint64_t sub_1000183BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  _QWORD v18[3];
  uint64_t v19;
  uint64_t v20;

  v0 = type metadata accessor for PPXContextActionData(0);
  v1 = sub_100008C0C(&qword_100035658, type metadata accessor for PPXContextActionData, (uint64_t)&unk_100027318);
  ContextActionDataProtocol.selectionMode.getter(&v14, v0, v1);
  if (v17 == 1)
  {
    sub_100009450((uint64_t)&v14);
    return 0;
  }
  else
  {
    sub_100009414(&v14, (uint64_t)v18);
    v3 = v19;
    v4 = v20;
    sub_10000942C(v18, v19);
    v2 = dispatch thunk of ContextAssetInfoProtocol.socialHighlightID.getter(v3, v4);
    v6 = v5;
    sub_100009484((uint64_t)v18, (uint64_t)&v14);
    if (!v6)
    {
      type metadata accessor for BSUISharedWithYouController(0);
      v7 = (void *)static BSUISharedWithYouController.shared.getter();
      v8 = v15;
      v9 = v16;
      sub_10000942C(&v14, v15);
      v10 = dispatch thunk of ContextAssetInfoProtocol.assetId.getter(v8, v9);
      v12 = v11;
      v2 = dispatch thunk of BSUISharedWithYouController.highlightIdentifier(for:)(v10);

      swift_bridgeObjectRelease(v12);
    }
    sub_100008DE4(&v14);
    sub_100008DE4(v18);
  }
  return v2;
}

void *sub_1000184EC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X2>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t *v26;
  uint64_t *v27;
  char *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *result;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v42 = a2;
  v43 = a3;
  v44 = a1;
  v3 = type metadata accessor for Locale(0);
  __chkstk_darwin(v3);
  v40 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = type metadata accessor for String.LocalizationValue(0);
  v41 = *(_QWORD *)(v39 - 8);
  v5 = __chkstk_darwin(v39);
  v38 = (char *)&v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v8 = (char *)&v37 - v7;
  v9 = type metadata accessor for ContextActionType.ContextActionGroup(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1000089B0(&qword_100035638);
  __chkstk_darwin(v13);
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PPXContextActionData(0);
  v16 = dispatch thunk of ContextActionDataModel.supportsSuggestionContextMenu.getter();
  v17 = *(int *)(v13 + 48);
  v18 = v44;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v15, v44, v9);
  v19 = *(_QWORD *)(v18 + v17);
  v45 = v17;
  *(_QWORD *)&v15[v17] = v19;
  if ((v16 & 1) != 0)
  {
    v37 = v8;
    v20 = v41;
    (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, enum case for ContextActionType.ContextActionGroup.improveSuggestions(_:), v9);
    v21 = v18;
    v22 = sub_100008C0C(&qword_1000356B8, (uint64_t (*)(uint64_t))&type metadata accessor for ContextActionType.ContextActionGroup, (uint64_t)&protocol conformance descriptor for ContextActionType.ContextActionGroup);
    swift_bridgeObjectRetain(v19);
    dispatch thunk of RawRepresentable.rawValue.getter(&v47, v9, v22);
    dispatch thunk of RawRepresentable.rawValue.getter(&v46, v9, v22);
    v23 = v47;
    v24 = v46;
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    sub_10000F74C((uint64_t)v15, &qword_100035638);
    v25 = v23 == v24;
    v18 = v21;
    v26 = v43;
    v27 = v42;
    if (v25)
    {
      v28 = v37;
      String.LocalizationValue.init(stringLiteral:)(0xD000000000000013, 0x8000000100028D80);
      v29 = v38;
      v30 = v39;
      v31 = (*(uint64_t (**)(char *, char *, uint64_t))(v20 + 16))(v38, v28, v39);
      v32 = v40;
      static Locale.current.getter(v31);
      v34 = String.init(localized:defaultValue:table:bundle:locale:comment:)("TopPicksMenuFeedbackTitle", 25, 2, v29, 0, 0, 0, v32, "Title of the feedback sub-menu item in context menu", 51, 2);
      v35 = v33;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v28, v30);
    }
    else
    {
      v34 = 0;
      v35 = 0xE000000000000000;
    }
  }
  else
  {
    swift_bridgeObjectRetain(v19);
    sub_10000F74C((uint64_t)v15, &qword_100035638);
    v34 = 0;
    v35 = 0xE000000000000000;
    v26 = v43;
    v27 = v42;
  }
  result = sub_100017858(*(_QWORD *)(v18 + v45), v27);
  *v26 = v34;
  v26[1] = v35;
  v26[2] = (uint64_t)result;
  return result;
}

void sub_100018834(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v30 = a1;
  v7 = type metadata accessor for ContextActionType(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(a2, "identifier");
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v14 = v13;

  v15 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for ContextActionType.sharedWithYou(_:), v7);
  v16 = (void *)ContextActionType.actionIdentifier.getter(v15);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  v19 = v18;

  if (v12 == v17 && v14 == v19)
  {
    swift_bridgeObjectRelease_n(v14, 2);
    if (a3)
      goto LABEL_7;
  }
  else
  {
    v21 = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v14, v17, v19, 0);
    swift_bridgeObjectRelease(v19);
    swift_bridgeObjectRelease(v14);
    if ((v21 & 1) != 0 && a3)
    {
LABEL_7:
      if ((unint64_t)a3 >> 62)
      {
        if (a3 >= 0)
          v27 = a3 & 0xFFFFFFFFFFFFFF8;
        else
          v27 = a3;
        swift_bridgeObjectRetain(a3);
        v28 = _CocoaArrayWrapper.endIndex.getter(v27);
        swift_bridgeObjectRelease(a3);
        v23 = v28 - 1;
        if (!__OFSUB__(v28, 1))
        {
LABEL_9:
          v24 = __OFADD__(*a4, v23);
          v25 = *a4 + v23;
          if (!v24)
          {
            *a4 = v25;
            return;
          }
          goto LABEL_20;
        }
      }
      else
      {
        v22 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
        v23 = v22 - 1;
        if (!__OFSUB__(v22, 1))
          goto LABEL_9;
      }
      __break(1u);
LABEL_20:
      __break(1u);
      goto LABEL_21;
    }
  }
  v26 = objc_msgSend(a2, "identifier");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v26);

  if (__OFADD__(v30, *a4))
LABEL_21:
    __break(1u);
}

Class sub_100018A34(uint64_t a1, void *a2, UIMenuElementSize a3, UIMenuElementSize a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  Class result;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  void *v33;
  void *v34;
  Swift::String v35;
  UIMenu v36;
  uint64_t v37;
  uint64_t v38;
  Swift::String v39;
  Swift::OpaquePointer v40;
  uint64_t v41;
  void *v42;
  UIImage_optional v43;
  UIImage_optional v44;

  v8 = type metadata accessor for ContextActionType(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = (unint64_t)a3 >> 62;
  if (!((unint64_t)a3 >> 62))
  {
    v13 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = (Class)swift_bridgeObjectRetain(a3);
    if (v13)
      goto LABEL_3;
LABEL_24:
    swift_bridgeObjectRelease(a3);
    if (v12)
      goto LABEL_12;
    goto LABEL_25;
  }
  if (a3 < UIMenuElementSizeSmall)
    v37 = a3;
  else
    v37 = a3 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(a3);
  result = (Class)_CocoaArrayWrapper.endIndex.getter(v37);
  if (!result)
    goto LABEL_24;
LABEL_3:
  v41 = a1;
  v42 = a2;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v15 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, a3);
LABEL_6:
    v16 = v15;
    swift_bridgeObjectRelease(a3);
    v17 = objc_msgSend(v16, "identifier");
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v17);
    v20 = v19;

    v21 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for ContextActionType.sharedWithYou(_:), v8);
    v22 = (void *)ContextActionType.actionIdentifier.getter(v21);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v23 = static String._unconditionallyBridgeFromObjectiveC(_:)(v22);
    v25 = v24;

    if (v18 == v23 && v20 == v25)
    {
      swift_bridgeObjectRelease_n(v20, 2);
    }
    else
    {
      v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v18, v20, v23, v25, 0);
      swift_bridgeObjectRelease(v25);
      swift_bridgeObjectRelease(v20);
      if ((v27 & 1) == 0)
      {

        a1 = v41;
        a2 = v42;
        if (v12)
        {
LABEL_12:
          if (a3 < UIMenuElementSizeSmall)
            v28 = a3;
          else
            v28 = a3 & 0xFFFFFFFFFFFFFF8;
          v29 = sub_10000F62C(0, &qword_100035688, UIMenuElement_ptr);
          swift_bridgeObjectRetain(a3);
          swift_bridgeObjectRetain(a2);
          v30 = _bridgeCocoaArray<A>(_:)(v28, v29);
          swift_bridgeObjectRelease(a3);
          a3 = v30;
          goto LABEL_26;
        }
LABEL_25:
        swift_bridgeObjectRetain(a3);
        v38 = swift_bridgeObjectRetain(a2);
        dispatch thunk of __ContiguousArrayStorageBase.staticElementType.getter(v38);
        sub_10000F62C(0, &qword_100035688, UIMenuElement_ptr);
LABEL_26:
        sub_10000F62C(0, &qword_1000355D8, UIMenu_ptr);
        v39._countAndFlagsBits = a1;
        v39._object = a2;
        v44.value.super.isa = 0;
        v44.is_nil = 0;
        return (Class)UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(v39, (Swift::String_optional)0, v44, (UIMenuIdentifier_optional)1, 0xFFFFFFFFFFFFFFFFLL, a3, v40);
      }
    }
    if (a4)
    {
      sub_10000F62C(0, &qword_1000355D8, UIMenu_ptr);
      swift_bridgeObjectRetain(a4);
      v31 = objc_msgSend(v16, "title");
      v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
      v34 = v33;

      v43.value.super.isa = (Class)objc_msgSend(v16, "image");
      v35._countAndFlagsBits = v32;
      v35._object = v34;
      v43.is_nil = 0;
      v36.super.super.isa = UIMenu.init(title:subtitle:image:identifier:options:preferredElementSize:children:)(v35, (Swift::String_optional)0, v43, 0, 0xFFFFFFFFFFFFFFFFLL, a4, v40).super.super.isa;

    }
    else
    {

      return 0;
    }
    return v36.super.super.isa;
  }
  if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v15 = *(id *)(a3 + 32);
    goto LABEL_6;
  }
  __break(1u);
  return result;
}

uint64_t PPXContextMenuProvider.showShareSheet(with:for:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 16) = static MainActor.shared.getter();
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100018E00, v2, v3);
}

uint64_t sub_100018E00()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100018F68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  v5 = type metadata accessor for MainActor(0);
  v4[6] = v5;
  v4[7] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_100018FDC, v6, v7);
}

uint64_t sub_100018FDC()
{
  _QWORD *v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;

  v1 = v0[6];
  v2 = (const void *)v0[4];
  v3 = (void *)v0[5];
  v5 = (void *)v0[2];
  v4 = (void *)v0[3];
  swift_release(v0[7]);
  v0[8] = _Block_copy(v2);
  v6 = v5;
  v7 = v4;
  v0[9] = static MainActor.shared.getter(v3);
  v8 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100019070, v8, v9);
}

uint64_t sub_100019070()
{
  uint64_t v0;
  void (**v1)(_QWORD);
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void (***)(_QWORD))(v0 + 64);
  v2 = *(void **)(v0 + 40);
  v4 = *(void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  swift_release(*(_QWORD *)(v0 + 72));

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id PPXContextMenuProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

void PPXContextMenuProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer("BooksProductPageExtension.PPXContextMenuProvider", 48, "init()", 6, 0);
  __break(1u);
}

id PPXContextMenuProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

void *PPXContextMenuProvider.computeSwipeActionItems(with:for:swipeActionType:assetID:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(char *, _QWORD);
  void (*v50)(_QWORD *);
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t isUniquelyReferenced_nonNull_native;
  _QWORD *v61;
  char v62;
  unint64_t v63;
  uint64_t v64;
  _BOOL8 v65;
  uint64_t v66;
  char v67;
  unint64_t v68;
  char v69;
  _QWORD *v70;
  uint64_t v71;
  uint64_t inited;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, _QWORD);
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  unint64_t v89;
  uint64_t v90;
  _BOOL8 v91;
  uint64_t v92;
  char v93;
  unint64_t v94;
  char v95;
  _QWORD *v96;
  _QWORD *v97;
  uint64_t v98;
  BOOL v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *result;
  uint64_t v106;
  char *v107;
  void (*v108)(_QWORD *, _QWORD);
  void (*v109)(char *, _QWORD);
  uint64_t v110;
  __int128 *v111;
  uint64_t v112;
  uint64_t v113;
  __int128 v114;
  char *v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  __int128 *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  _QWORD *v124;
  _QWORD v125[4];
  _QWORD v126[3];
  uint64_t v127;
  char v128[8];
  uint64_t v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  uint64_t v133;
  _QWORD v134[3];
  void *v135;

  v121 = a4;
  v123 = a3;
  v9 = type metadata accessor for ContextActionType(0);
  v118 = *(_QWORD *)(v9 - 8);
  v119 = v9;
  v10 = __chkstk_darwin(v9);
  v107 = (char *)&v106 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v115 = (char *)&v106 - v12;
  v13 = sub_1000089B0(&qword_100035520);
  __chkstk_darwin(v13);
  v15 = (char *)&v106 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for PPXContextActionData(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (char *)&v106 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a1;
  v21 = (id)BSUIGetLibraryItemStateProvider(v20);
  v134[2] = type metadata accessor for MenuCoverImageProvider(0);
  v135 = &protocol witness table for MenuCoverImageProvider;
  sub_10000F7D4(&v133);
  MenuCoverImageProvider.init()();
  sub_100010728(v20, (uint64_t)v21, &v133, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) != 1)
  {
    v28 = sub_100010C90((uint64_t)v15, (uint64_t)v19);
    v29 = *(_QWORD *)(v5 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_swipeActionItems);
    __chkstk_darwin(v28);
    *(&v106 - 4) = (uint64_t)v19;
    *(&v106 - 3) = a2;
    *(&v106 - 2) = (uint64_t)v20;
    *(&v106 - 1) = v5;
    swift_bridgeObjectRetain(v29);
    v30 = sub_100017354((void (*)(__int128 *__return_ptr, __int128 *))sub_10001EA10, (uint64_t)(&v106 - 6), v29);
    v31 = swift_bridgeObjectRelease(v29);
    __chkstk_darwin(v31);
    *(&v106 - 2) = v123;
    v32 = sub_100019D9C((uint64_t)sub_10001E380, (uint64_t)(&v106 - 4), (uint64_t)v30);
    v33 = *(_QWORD *)(v32 + 16);
    v34 = (_QWORD *)(v5 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider);
    v111 = (__int128 *)&v129;
    v112 = v32 + 32;
    v110 = (uint64_t)&v130 + 8;
    v120 = (__int128 *)v134;
    v113 = v32;
    swift_bridgeObjectRetain(v32);
    v35 = 0;
    v114 = xmmword_100027060;
    v36 = v121;
    v37 = (uint64_t)v19;
    v116 = v33;
    v117 = v19;
    while (1)
    {
      if (v35 == v33)
      {
        v131 = 0u;
        v132 = 0u;
        v41 = v33;
        v130 = 0u;
      }
      else
      {
        if (v35 >= *(_QWORD *)(v113 + 16))
          goto LABEL_46;
        v41 = v35 + 1;
        v42 = v111;
        sub_100009484(v112 + 40 * v35, (uint64_t)v111);
        *(_QWORD *)&v130 = v35;
        sub_100009414(v42, v110);
      }
      sub_10000F788((uint64_t)&v130, (uint64_t)&v133, &qword_100035538);
      if (!v135)
      {
        v27 = v113;
        swift_bridgeObjectRelease(v113);
        sub_100010C0C(v37);
        return (void *)v27;
      }
      v122 = v133;
      v123 = v41;
      sub_100009414(v120, (uint64_t)&v130);
      swift_beginAccess(v34, v128, 32, 0);
      v43 = v34[3];
      v44 = v34[4];
      sub_10000942C(v34, v43);
      swift_bridgeObjectRetain(a5);
      v45 = dispatch thunk of FigaroProviding.swipeActionTypeToIndexDict.getter(v43, v44);
      if (!*(_QWORD *)(v45 + 16))
        break;
      sub_10001AF8C(v36, a5);
      if ((v46 & 1) == 0)
        break;
      swift_endAccess(v128);
      swift_bridgeObjectRelease(v45);
      swift_bridgeObjectRelease(a5);
      swift_beginAccess(v34, v126, 33, 0);
      v47 = v34[3];
      v48 = v34[4];
      sub_10001E39C((uint64_t)v34, v47);
      swift_bridgeObjectRetain(a5);
      v49 = (void (*)(char *, _QWORD))dispatch thunk of FigaroProviding.swipeActionTypeToIndexDict.modify(v128, v47, v48);
      v50 = sub_100019F20(v125, v36, a5);
      if (*v51)
      {
        v52 = v51;
        v108 = (void (*)(_QWORD *, _QWORD))v50;
        v109 = v49;
        v53 = *((_QWORD *)&v131 + 1);
        v54 = v132;
        sub_10000942C(&v130, *((uint64_t *)&v131 + 1));
        v55 = v107;
        v56 = dispatch thunk of ContextActionItem.type.getter(v53, v54);
        v57 = ContextActionType.identifier.getter(v56);
        v59 = v58;
        (*(void (**)(char *, uint64_t))(v118 + 8))(v55, v119);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v52);
        v124 = (_QWORD *)*v52;
        v61 = v124;
        *v52 = 0x8000000000000000;
        v63 = sub_10001AF8C(v57, v59);
        v64 = v61[2];
        v65 = (v62 & 1) == 0;
        v66 = v64 + v65;
        if (__OFADD__(v64, v65))
          goto LABEL_48;
        v67 = v62;
        if (v61[3] >= v66)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          {
            v70 = v124;
            if ((v62 & 1) == 0)
              goto LABEL_40;
          }
          else
          {
            sub_10001C9B4();
            v70 = v124;
            if ((v67 & 1) == 0)
              goto LABEL_40;
          }
        }
        else
        {
          sub_10001B4C0(v66, isUniquelyReferenced_nonNull_native);
          v68 = sub_10001AF8C(v57, v59);
          if ((v67 & 1) != (v69 & 1))
            goto LABEL_51;
          v63 = v68;
          v70 = v124;
          if ((v67 & 1) == 0)
          {
LABEL_40:
            v70[(v63 >> 6) + 8] |= 1 << v63;
            v101 = (uint64_t *)(v70[6] + 16 * v63);
            *v101 = v57;
            v101[1] = v59;
            *(_QWORD *)(v70[7] + 8 * v63) = v122;
            v102 = v70[2];
            v99 = __OFADD__(v102, 1);
            v103 = v102 + 1;
            if (v99)
              goto LABEL_49;
            v70[2] = v103;
            swift_bridgeObjectRetain(v59);
LABEL_42:
            v104 = *v52;
            *v52 = v70;
            swift_bridgeObjectRelease(v59);
            swift_bridgeObjectRelease(v104);
            v108(v125, 0);
            v109(v128, 0);
            swift_endAccess(v126);
            swift_bridgeObjectRelease(a5);
            v36 = v121;
LABEL_9:
            v33 = v116;
            v37 = (uint64_t)v117;
            goto LABEL_10;
          }
        }
        *(_QWORD *)(v70[7] + 8 * v63) = v122;
        goto LABEL_42;
      }
      ((void (*)(_QWORD *, _QWORD))v50)(v125, 0);
      v49(v128, 0);
      swift_endAccess(v126);
      swift_bridgeObjectRelease(a5);
LABEL_10:
      v35 = v123;
      sub_100008DE4(&v130);
    }
    swift_bridgeObjectRelease(a5);
    swift_endAccess(v128);
    swift_bridgeObjectRelease(v45);
    v71 = sub_1000089B0(&qword_100035540);
    inited = swift_initStackObject(v71, &v127);
    *(_OWORD *)(inited + 16) = v114;
    v73 = *((_QWORD *)&v131 + 1);
    v74 = v132;
    sub_10000942C(&v130, *((uint64_t *)&v131 + 1));
    swift_bridgeObjectRetain(a5);
    v75 = v115;
    v76 = dispatch thunk of ContextActionItem.type.getter(v73, v74);
    v77 = ContextActionType.identifier.getter(v76);
    v79 = v78;
    (*(void (**)(char *, uint64_t))(v118 + 8))(v75, v119);
    *(_QWORD *)(inited + 32) = v77;
    *(_QWORD *)(inited + 40) = v79;
    *(_QWORD *)(inited + 48) = v122;
    v80 = sub_10001652C(inited);
    swift_beginAccess(v34, v125, 33, 0);
    v81 = v34[3];
    v82 = v34[4];
    sub_10001E39C((uint64_t)v34, v81);
    v83 = (void (*)(char *, _QWORD))dispatch thunk of FigaroProviding.swipeActionTypeToIndexDict.modify(v128, v81, v82);
    v85 = v84;
    v86 = swift_isUniquelyReferenced_nonNull_native(*v84);
    v126[0] = *v85;
    v87 = v126[0];
    *v85 = 0x8000000000000000;
    v89 = sub_10001AF8C(v36, a5);
    v90 = *(_QWORD *)(v87 + 16);
    v91 = (v88 & 1) == 0;
    v92 = v90 + v91;
    if (__OFADD__(v90, v91))
    {
      __break(1u);
LABEL_46:
      __break(1u);
LABEL_47:
      __break(1u);
LABEL_48:
      __break(1u);
LABEL_49:
      __break(1u);
      goto LABEL_50;
    }
    v93 = v88;
    if (*(_QWORD *)(v87 + 24) < v92)
    {
      sub_10001BAD4(v92, v86);
      v94 = sub_10001AF8C(v121, a5);
      if ((v93 & 1) != (v95 & 1))
      {
LABEL_51:
        result = (void *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
        __break(1u);
        return result;
      }
      v89 = v94;
      v96 = (_QWORD *)v126[0];
      if ((v93 & 1) == 0)
        goto LABEL_31;
LABEL_7:
      v38 = v96[7];
      v39 = 8 * v89;
      swift_bridgeObjectRelease(*(_QWORD *)(v38 + v39));
      *(_QWORD *)(v38 + v39) = v80;
      v36 = v121;
LABEL_8:
      v40 = *v85;
      *v85 = v96;
      swift_bridgeObjectRelease(a5);
      swift_bridgeObjectRelease(v40);
      v83(v128, 0);
      swift_endAccess(v125);
      goto LABEL_9;
    }
    if ((v86 & 1) != 0)
    {
      v96 = (_QWORD *)v126[0];
      if ((v88 & 1) != 0)
        goto LABEL_7;
    }
    else
    {
      sub_10001CD10();
      v96 = (_QWORD *)v126[0];
      if ((v93 & 1) != 0)
        goto LABEL_7;
    }
LABEL_31:
    v96[(v89 >> 6) + 8] |= 1 << v89;
    v97 = (_QWORD *)(v96[6] + 16 * v89);
    v36 = v121;
    *v97 = v121;
    v97[1] = a5;
    *(_QWORD *)(v96[7] + 8 * v89) = v80;
    v98 = v96[2];
    v99 = __OFADD__(v98, 1);
    v100 = v98 + 1;
    if (v99)
      goto LABEL_47;
    v96[2] = v100;
    swift_bridgeObjectRetain(a5);
    goto LABEL_8;
  }
  sub_10000F74C((uint64_t)v15, &qword_100035520);
  if (qword_1000344C0 != -1)
LABEL_50:
    swift_once(&qword_1000344C0, sub_10001663C);
  v22 = type metadata accessor for Logger(0);
  v23 = sub_10001E368(v22, (uint64_t)qword_100035500);
  v24 = Logger.logObject.getter(v23);
  v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v26 = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Unable to instantiate ContextActionData", v26, 2u);
    swift_slowDealloc(v26, -1, -1);
  }

  return &_swiftEmptyArrayStorage;
}

uint64_t sub_100019AD0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  _BYTE v20[40];
  _BYTE v21[24];
  _QWORD v22[5];
  _QWORD v23[5];

  v11 = *a1;
  v12 = a1[1];
  v23[3] = type metadata accessor for PPXContextActionData(0);
  v23[4] = sub_100008C0C(&qword_100035658, type metadata accessor for PPXContextActionData, (uint64_t)&unk_100027318);
  v13 = sub_10000F7D4(v23);
  sub_10001E814(a2, (uint64_t)v13);
  v14 = *(_QWORD *)(a5 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_objectGraph);
  v22[3] = &type metadata for PPXContextMenuPresentationContext;
  v22[4] = sub_10001E858();
  v15 = swift_allocObject(&unk_10002E188, 40, 7);
  v22[0] = v15;
  swift_unknownObjectWeakInit(v15 + 16, a3);
  *(_QWORD *)(v15 + 24) = a4;
  *(_QWORD *)(v15 + 32) = v14;
  v16 = a4;
  swift_retain(v14);
  v17 = objc_msgSend(a3, "ba_effectiveAnalyticsTracker");
  v18 = a5 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider;
  swift_beginAccess(v18, v21, 0, 0);
  sub_100009484(v18, (uint64_t)v20);
  a6[3] = v11;
  a6[4] = v12;
  sub_10000F7D4(a6);
  return dispatch thunk of ContextActionItem.init(data:context:tracker:figaroProvider:)(v23, v22, v17, v20, v11, v12);
}

uint64_t sub_100019C34(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[3];
  uint64_t v21;
  uint64_t v22;

  v19 = a2;
  v18 = type metadata accessor for ContextActionType.SwipeActionType(0);
  v3 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for ContextActionType(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a1[3];
  v10 = a1[4];
  sub_10000942C(a1, v11);
  v12 = dispatch thunk of ContextActionItem.type.getter(v11, v10);
  ContextActionType.swipeActionType.getter(v12);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  LOBYTE(v10) = static ContextActionType.SwipeActionType.== infix(_:_:)(v5, v19);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v18);
  sub_100009484((uint64_t)a1, (uint64_t)v20);
  if ((v10 & 1) != 0)
  {
    v13 = v21;
    v14 = v22;
    sub_10000942C(v20, v21);
    v15 = dispatch thunk of ContextActionItem.isSupported.getter(v13, v14);
  }
  else
  {
    v15 = 0;
  }
  sub_100008DE4(v20);
  return v15 & 1;
}

uint64_t sub_100019D9C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  unint64_t *v5;
  unint64_t *v6;
  uint64_t (*v7)(__int128 *);
  uint64_t v8;
  unint64_t *v9;
  char v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  uint64_t (*v14)(__int128 *);
  __int128 v15[2];
  __int128 v16[2];
  unint64_t *v17;

  v5 = (unint64_t *)&_swiftEmptyArrayStorage;
  v17 = (unint64_t *)&_swiftEmptyArrayStorage;
  v6 = *(unint64_t **)(a3 + 16);
  if (v6)
  {
    v7 = (uint64_t (*)(__int128 *))result;
    v5 = 0;
    v8 = a3 + 32;
    v9 = (unint64_t *)&_swiftEmptyArrayStorage;
    v13 = *(unint64_t **)(a3 + 16);
    v14 = (uint64_t (*)(__int128 *))result;
    while ((unint64_t)v5 < *(_QWORD *)(a3 + 16))
    {
      sub_100009484(v8, (uint64_t)v16);
      v10 = v7(v16);
      if (v3)
      {
        sub_100008DE4(v16);
        swift_release(v9);
        swift_bridgeObjectRelease(a3);
        return (uint64_t)v5;
      }
      if ((v10 & 1) != 0)
      {
        sub_100009414(v16, (uint64_t)v15);
        if ((swift_isUniquelyReferenced_nonNull_native(v9) & 1) == 0)
          sub_10001C138(0, v9[2] + 1, 1);
        v9 = v17;
        v12 = v17[2];
        v11 = v17[3];
        if (v12 >= v11 >> 1)
        {
          sub_10001C138(v11 > 1, v12 + 1, 1);
          v9 = v17;
        }
        v9[2] = v12 + 1;
        result = sub_100009414(v15, (uint64_t)&v9[5 * v12 + 4]);
        v6 = v13;
        v7 = v14;
      }
      else
      {
        result = sub_100008DE4(v16);
      }
      v5 = (unint64_t *)((char *)v5 + 1);
      v8 += 40;
      if (v6 == v5)
      {
        v5 = v17;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease(a3);
    return (uint64_t)v5;
  }
  return result;
}

void (*sub_100019F20(_QWORD *a1, uint64_t a2, uint64_t a3))(_QWORD *a1)
{
  _QWORD *v6;

  v6 = malloc(0x30uLL);
  *a1 = v6;
  v6[4] = a3;
  swift_bridgeObjectRetain(a3);
  v6[5] = sub_10001D280(v6, a2, a3);
  return sub_100019F8C;
}

void sub_100019F8C(_QWORD *a1)
{
  void *v1;
  uint64_t v2;

  v1 = (void *)*a1;
  v2 = *(_QWORD *)(*a1 + 32);
  (*(void (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  swift_bridgeObjectRelease(v2);
  free(v1);
}

uint64_t PPXContextMenuProvider.contextMenuActionItems(with:for:)(uint64_t isUniquelyReferenced_nonNull_native, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  unint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t *v34;
  char v35;
  unint64_t v36;
  unint64_t v37;
  _BOOL8 v38;
  uint64_t v39;
  char v40;
  unint64_t v41;
  char v42;
  uint64_t *v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v46;
  unint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(char *, uint64_t);
  uint64_t v62;
  char *v63;
  uint64_t v64;
  void *v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t result;
  uint64_t v72;
  unint64_t *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81[2];
  __int128 v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t *v85;

  v5 = sub_1000089B0(&qword_100035548);
  v74 = *(_QWORD *)(v5 - 8);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v72 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v79 = (uint64_t)&v72 - v9;
  v77 = type metadata accessor for ContextActionType(0);
  v10 = *(_QWORD *)(v77 - 8);
  __chkstk_darwin(v77);
  v12 = (char *)&v72 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = v2;
  v13 = sub_100017020((void *)isUniquelyReferenced_nonNull_native, a2);
  v14 = v13;
  v15 = &_swiftEmptyArrayStorage;
  v85 = (unint64_t *)&_swiftEmptyArrayStorage;
  v16 = *((_QWORD *)v13 + 2);
  v78 = v5;
  v76 = v8;
  if (!v16)
  {
    v23 = (unint64_t *)&_swiftEmptyArrayStorage;
LABEL_14:
    swift_bridgeObjectRelease(v14);
    v85 = (unint64_t *)&_swiftEmptyDictionarySingleton;
    v24 = v23[2];
    if (!v24)
    {
      swift_release(v23);
      v47 = (unint64_t *)&_swiftEmptyDictionarySingleton;
LABEL_31:
      v48 = swift_bridgeObjectRetain(v47);
      v49 = sub_100017990(v48);
      swift_bridgeObjectRelease(v47);
      v50 = static ContextActionType.orderActionItems(_:)(v49);
      swift_bridgeObjectRelease(v49);
      v51 = sub_100017C28(v50, (uint64_t *)&v85);
      swift_bridgeObjectRelease(v50);
      *(_QWORD *)&v82 = &_swiftEmptyArrayStorage;
      v52 = v51[2];
      v53 = v79;
      if (v52)
      {
        v54 = (uint64_t)v51
            + ((*(unsigned __int8 *)(v74 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80));
        v55 = v8;
        v56 = *(_QWORD *)(v74 + 72);
        v77 = (uint64_t)v51;
        swift_bridgeObjectRetain(v51);
        do
        {
          sub_10001E698(v54, v53, &qword_100035548);
          v57 = *(int *)(v5 + 48);
          v58 = type metadata accessor for ContextActionType.ContextActionGroup(0);
          v59 = *(_QWORD *)(v58 - 8);
          (*(void (**)(char *, uint64_t, uint64_t))(v59 + 16))(v55, v79, v58);
          v60 = *(_QWORD *)(v79 + v57);
          *(_QWORD *)&v55[v57] = v60;
          v61 = *(void (**)(char *, uint64_t))(v59 + 8);
          swift_bridgeObjectRetain(v60);
          v61(v55, v58);
          v53 = v79;
          sub_10000F74C(v79, &qword_100035548);
          v62 = v60;
          v5 = v78;
          sub_10001C4C0(v62);
          v54 += v56;
          --v52;
        }
        while (v52);
        v51 = (_QWORD *)v77;
        swift_bridgeObjectRelease(v77);
        v15 = (void *)v82;
      }
      v63 = sub_100017ED4((uint64_t)v15);
      swift_bridgeObjectRelease(v15);
      v64 = *((_QWORD *)v63 + 2);
      if (v64)
      {
        sub_1000089B0(&qword_100035550);
        v65 = (void *)static _DictionaryStorage.allocate(capacity:)(v64);
      }
      else
      {
        v65 = &_swiftEmptyDictionarySingleton;
      }
      *(_QWORD *)&v82 = v65;
      v66 = (_QWORD *)swift_bridgeObjectRetain(v63);
      sub_10001C638(v66, 1, &v82);
      swift_bridgeObjectRelease(v63);
      v67 = v82;
      v68 = v75 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider;
      swift_beginAccess(v75 + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider, &v82, 33, 0);
      v69 = *(_QWORD *)(v68 + 24);
      v70 = *(_QWORD *)(v68 + 32);
      sub_10001E39C(v68, v69);
      dispatch thunk of FigaroProviding.contextMenuActionTypeToIndexDict.setter(v67, v69, v70);
      swift_endAccess(&v82);
      swift_bridgeObjectRelease(v85);
      return (uint64_t)v51;
    }
    v73 = v23;
    v25 = (uint64_t)(v23 + 4);
    while (1)
    {
      sub_100009484(v25, (uint64_t)&v82);
      v28 = v83;
      v29 = v84;
      sub_10000942C(&v82, v83);
      v30 = dispatch thunk of ContextActionItem.type.getter(v28, v29);
      v31 = ContextActionType.identifier.getter(v30);
      v33 = v32;
      (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v77);
      sub_100009484((uint64_t)&v82, (uint64_t)v81);
      v34 = v85;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v85);
      v80 = (uint64_t)v34;
      v85 = (unint64_t *)0x8000000000000000;
      v36 = sub_10001AF8C(v31, v33);
      v37 = v34[2];
      v38 = (v35 & 1) == 0;
      v39 = v37 + v38;
      if (__OFADD__(v37, v38))
        goto LABEL_40;
      v40 = v35;
      if ((uint64_t)v34[3] >= v39)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          isUniquelyReferenced_nonNull_native = v80;
          if ((v35 & 1) == 0)
            goto LABEL_25;
        }
        else
        {
          sub_10001CEC4();
          isUniquelyReferenced_nonNull_native = v80;
          if ((v40 & 1) == 0)
            goto LABEL_25;
        }
      }
      else
      {
        sub_10001BDE8(v39, isUniquelyReferenced_nonNull_native);
        v41 = sub_10001AF8C(v31, v33);
        if ((v40 & 1) != (v42 & 1))
          goto LABEL_42;
        v36 = v41;
        isUniquelyReferenced_nonNull_native = v80;
        if ((v40 & 1) == 0)
        {
LABEL_25:
          *(_QWORD *)(isUniquelyReferenced_nonNull_native + 8 * (v36 >> 6) + 64) |= 1 << v36;
          v43 = (uint64_t *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 48) + 16 * v36);
          *v43 = v31;
          v43[1] = v33;
          sub_100009414(v81, *(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 40 * v36);
          v44 = *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16);
          v45 = __OFADD__(v44, 1);
          v46 = v44 + 1;
          if (v45)
            goto LABEL_41;
          *(_QWORD *)(isUniquelyReferenced_nonNull_native + 16) = v46;
          swift_bridgeObjectRetain(v33);
          goto LABEL_17;
        }
      }
      v26 = (_QWORD *)(*(_QWORD *)(isUniquelyReferenced_nonNull_native + 56) + 40 * v36);
      sub_100008DE4(v26);
      sub_100009414(v81, (uint64_t)v26);
LABEL_17:
      v27 = v85;
      v85 = (unint64_t *)isUniquelyReferenced_nonNull_native;
      swift_bridgeObjectRelease(v33);
      swift_bridgeObjectRelease(v27);
      sub_100008DE4(&v82);
      v25 += 40;
      if (!--v24)
      {
        swift_release(v73);
        v47 = v85;
        v5 = v78;
        v8 = v76;
        v15 = &_swiftEmptyArrayStorage;
        goto LABEL_31;
      }
    }
  }
  v17 = 0;
  v18 = (uint64_t)(v13 + 32);
  v19 = (unint64_t *)&_swiftEmptyArrayStorage;
  while (v17 < *((_QWORD *)v14 + 2))
  {
    sub_100009484(v18, (uint64_t)&v82);
    isUniquelyReferenced_nonNull_native = v83;
    v20 = v84;
    sub_10000942C(&v82, v83);
    if ((dispatch thunk of ContextActionItem.isSupported.getter(isUniquelyReferenced_nonNull_native, v20) & 1) != 0)
    {
      sub_100009414(&v82, (uint64_t)v81);
      if ((swift_isUniquelyReferenced_nonNull_native(v19) & 1) == 0)
        sub_10001C138(0, v19[2] + 1, 1);
      v19 = v85;
      v22 = v85[2];
      v21 = v85[3];
      isUniquelyReferenced_nonNull_native = v22 + 1;
      if (v22 >= v21 >> 1)
      {
        sub_10001C138(v21 > 1, v22 + 1, 1);
        v19 = v85;
      }
      v19[2] = isUniquelyReferenced_nonNull_native;
      sub_100009414(v81, (uint64_t)&v19[5 * v22 + 4]);
    }
    else
    {
      sub_100008DE4(&v82);
    }
    ++v17;
    v18 += 40;
    if (v16 == v17)
    {
      v23 = v85;
      v5 = v78;
      v8 = v76;
      v15 = &_swiftEmptyArrayStorage;
      goto LABEL_14;
    }
  }
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  result = swift_unexpectedError(isUniquelyReferenced_nonNull_native, "Swift/Dictionary.swift", 22, 1, 489);
  __break(1u);
  return result;
}

uint64_t sub_10001A604(uint64_t a1, uint64_t a2)
{
  return PPXContextMenuProvider.contextMenuActionItems(with:for:)(a1, a2);
}

void *sub_10001A624(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return PPXContextMenuProvider.computeSwipeActionItems(with:for:swipeActionType:assetID:)(a1, a2, a3, a4, a5);
}

uint64_t sub_10001A644(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_10001EA24;
  return v6();
}

uint64_t sub_10001A698(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_10001EA24;
  return v7();
}

uint64_t sub_10001A6EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10000F74C(a1, &qword_100035590);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_10002E160, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_1000355D0, v16);
}

uint64_t sub_10001A838(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10001A89C;
  return v6(a1);
}

uint64_t sub_10001A89C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

char *sub_10001A8E8(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_10001AC50(a1, a2, a3, a4, &qword_100035670, &qword_100035678);
}

char *sub_10001A8FC(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_1000089B0(&qword_100035540);
      v11 = (char *)swift_allocObject(v10, 24 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
      v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[24 * v8 + 32])
          memmove(v13, a4 + 32, 24 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_10001DDD4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_10001AA20(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_1000089B0(&qword_1000356A8);
      v11 = (char *)swift_allocObject(v10, 24 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
      v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[24 * v8 + 32])
          memmove(v13, a4 + 32, 24 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_10001DCC8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_10001AB44(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_1000089B0(&qword_100035160);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10001DBD8(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_10001AC50(char *result, int64_t a2, char a3, char *a4, uint64_t *a5, uint64_t *a6)
{
  char v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  size_t v15;
  char *v16;

  v8 = (char)result;
  if ((a3 & 1) == 0)
  {
    v10 = a2;
    goto LABEL_8;
  }
  v9 = *((_QWORD *)a4 + 3);
  v10 = v9 >> 1;
  if ((uint64_t)(v9 >> 1) >= a2)
    goto LABEL_8;
  if (v10 + 0x4000000000000000 >= 0)
  {
    v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v10 = a2;
LABEL_8:
    v11 = *((_QWORD *)a4 + 2);
    if (v10 <= v11)
      v12 = *((_QWORD *)a4 + 2);
    else
      v12 = v10;
    if (v12)
    {
      v13 = sub_1000089B0(a5);
      v14 = (char *)swift_allocObject(v13, 40 * v12 + 32, 7);
      v15 = j__malloc_size(v14);
      *((_QWORD *)v14 + 2) = v11;
      *((_QWORD *)v14 + 3) = 2 * ((uint64_t)(v15 - 32) / 40);
      v16 = v14 + 32;
      if ((v8 & 1) != 0)
      {
LABEL_13:
        if (v14 != a4 || v16 >= &a4[40 * v11 + 32])
          memmove(v16, a4 + 32, 40 * v11);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v14 = (char *)&_swiftEmptyArrayStorage;
      v16 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_10001D8B4(0, v11, (unint64_t)v16, (uint64_t)a4, a6);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v14;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001AD7C(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_1000089B0(&qword_100035640);
  v11 = *(_QWORD *)(sub_1000089B0(&qword_100035548) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = sub_1000089B0(&qword_100035548);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001E6DC(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

unint64_t sub_10001AF8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10001B020(a1, a2, v5);
}

unint64_t sub_10001AFF0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_10001B100(a1, v4);
}

unint64_t sub_10001B020(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10001B100(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_10001E3E4(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100015DA0((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10001B1C4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  _QWORD *v36;
  _QWORD v37[9];
  _OWORD v38[2];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000089B0(&qword_1000355E0);
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (*(_QWORD *)(v5 + 16))
  {
    v34 = v3;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v36 = (_QWORD *)(v5 + 64);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v35 = (unint64_t)(v9 + 63) >> 6;
    v12 = v7 + 64;
    result = swift_retain(v5);
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v17 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v18 = v17 | (v14 << 6);
      }
      else
      {
        v19 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_43:
          __break(1u);
LABEL_44:
          __break(1u);
          return result;
        }
        if (v19 >= v35)
          goto LABEL_37;
        v20 = v36[v19];
        ++v14;
        if (!v20)
        {
          v14 = v19 + 1;
          if (v19 + 1 >= v35)
            goto LABEL_37;
          v20 = v36[v14];
          if (!v20)
          {
            v21 = v19 + 2;
            if (v21 >= v35)
            {
LABEL_37:
              swift_release(v5);
              v3 = v34;
              if ((a2 & 1) != 0)
              {
                v33 = 1 << *(_BYTE *)(v5 + 32);
                if (v33 >= 64)
                  bzero(v36, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v36 = -1 << v33;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v20 = v36[v21];
            if (!v20)
            {
              while (1)
              {
                v14 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_44;
                if (v14 >= v35)
                  goto LABEL_37;
                v20 = v36[v14];
                ++v21;
                if (v20)
                  goto LABEL_24;
              }
            }
            v14 = v21;
          }
        }
LABEL_24:
        v11 = (v20 - 1) & v20;
        v18 = __clz(__rbit64(v20)) + (v14 << 6);
      }
      v22 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v18);
      v24 = *v22;
      v23 = v22[1];
      v25 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v18);
      if ((a2 & 1) != 0)
      {
        sub_10000DB08(v25, v38);
      }
      else
      {
        sub_10000DACC((uint64_t)v25, (uint64_t)v38);
        swift_bridgeObjectRetain(v23);
      }
      Hasher.init(_seed:)(v37, *(_QWORD *)(v8 + 40));
      String.hash(into:)(v37, v24, v23);
      result = Hasher._finalize()();
      v26 = -1 << *(_BYTE *)(v8 + 32);
      v27 = result & ~v26;
      v28 = v27 >> 6;
      if (((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v12 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v26) >> 6;
        do
        {
          if (++v28 == v30 && (v29 & 1) != 0)
          {
            __break(1u);
            goto LABEL_43;
          }
          v31 = v28 == v30;
          if (v28 == v30)
            v28 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v12 + 8 * v28);
        }
        while (v32 == -1);
        v15 = __clz(__rbit64(~v32)) + (v28 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      v16 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v15);
      *v16 = v24;
      v16[1] = v23;
      result = (uint64_t)sub_10000DB08(v38, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v15));
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_10001B4C0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;
  _QWORD v39[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000089B0(&qword_100035550);
  v38 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = v3;
  v36 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v36)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v36)
        goto LABEL_36;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v36)
        {
LABEL_36:
          swift_release(v5);
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v36)
              goto LABEL_36;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v38 & 1) == 0)
      swift_bridgeObjectRetain(v30[1]);
    Hasher.init(_seed:)(v39, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v39, v32, v31);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_10001B7C8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;
  _QWORD v40[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000089B0(&qword_100035680);
  v39 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v36 = v3;
  v37 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_36;
      v24 = *(_QWORD *)(v38 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_36:
          swift_release(v5);
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v37)
              goto LABEL_36;
            v24 = *(_QWORD *)(v38 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      v34 = v33;
    }
    Hasher.init(_seed:)(v40, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v40, v32, v31);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_10001BAD4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  _QWORD v38[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000089B0(&qword_100035668);
  v37 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v35)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v35)
        goto LABEL_36;
      v24 = *(_QWORD *)(v36 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v35)
        {
LABEL_36:
          swift_release(v5);
          if ((v37 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v36 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v35)
              goto LABEL_36;
            v24 = *(_QWORD *)(v36 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain(v30[1]);
      swift_bridgeObjectRetain(v33);
    }
    Hasher.init(_seed:)(v38, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v38, v32, v31);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_10001BDE8(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  unint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  unint64_t v21;
  int64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;
  _QWORD v39[9];
  __int128 v40[2];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_1000089B0(&qword_100035608);
  v38 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_44;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = v3;
  v36 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v17 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v18 = v17 | (v14 << 6);
      goto LABEL_25;
    }
    v19 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }
    if (v19 >= v36)
      break;
    v20 = (_QWORD *)(v5 + 64);
    v21 = *(_QWORD *)(v37 + 8 * v19);
    ++v14;
    if (!v21)
    {
      v14 = v19 + 1;
      if (v19 + 1 >= v36)
        goto LABEL_37;
      v21 = *(_QWORD *)(v37 + 8 * v14);
      if (!v21)
      {
        v22 = v19 + 2;
        if (v22 >= v36)
        {
LABEL_37:
          swift_release(v5);
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_44;
          goto LABEL_40;
        }
        v21 = *(_QWORD *)(v37 + 8 * v22);
        if (!v21)
        {
          while (1)
          {
            v14 = v22 + 1;
            if (__OFADD__(v22, 1))
              goto LABEL_46;
            if (v14 >= v36)
              goto LABEL_37;
            v21 = *(_QWORD *)(v37 + 8 * v14);
            ++v22;
            if (v21)
              goto LABEL_24;
          }
        }
        v14 = v22;
      }
    }
LABEL_24:
    v11 = (v21 - 1) & v21;
    v18 = __clz(__rbit64(v21)) + (v14 << 6);
LABEL_25:
    v23 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v18);
    v25 = *v23;
    v24 = v23[1];
    v26 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v18);
    if ((v38 & 1) != 0)
    {
      sub_100009414(v26, (uint64_t)v40);
    }
    else
    {
      sub_100009484((uint64_t)v26, (uint64_t)v40);
      swift_bridgeObjectRetain(v24);
    }
    Hasher.init(_seed:)(v39, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v39, v25, v24);
    result = Hasher._finalize()();
    v27 = -1 << *(_BYTE *)(v8 + 32);
    v28 = result & ~v27;
    v29 = v28 >> 6;
    if (((-1 << v28) & ~*(_QWORD *)(v12 + 8 * (v28 >> 6))) != 0)
    {
      v15 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v12 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v27) >> 6;
      do
      {
        if (++v29 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }
        v32 = v29 == v31;
        if (v29 == v31)
          v29 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v12 + 8 * v29);
      }
      while (v33 == -1);
      v15 = __clz(__rbit64(~v33)) + (v29 << 6);
    }
    *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
    v16 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v15);
    *v16 = v25;
    v16[1] = v24;
    result = sub_100009414(v40, *(_QWORD *)(v8 + 56) + 40 * v15);
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v35;
  v20 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_44;
LABEL_40:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v20, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v20 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_44:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_10001C10C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_10001C164(a1, a2, a3, (_QWORD *)*v3, &qword_100035670, &qword_100035678);
  *v3 = result;
  return result;
}

uint64_t sub_10001C138(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_10001C164(a1, a2, a3, (_QWORD *)*v3, &qword_100035630, &qword_100035628);
  *v3 = result;
  return result;
}

uint64_t sub_10001C164(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  size_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    v13 = sub_1000089B0(a5);
    v14 = (_QWORD *)swift_allocObject(v13, 40 * v12 + 32, 7);
    v15 = j__malloc_size(v14);
    v14[2] = v11;
    v14[3] = 2 * ((uint64_t)(v15 - 32) / 40);
  }
  else
  {
    v14 = &_swiftEmptyArrayStorage;
  }
  v16 = (unint64_t)(v14 + 4);
  v17 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v14 != a4 || v16 >= v17 + 40 * v11)
      memmove(v14 + 4, a4 + 4, 40 * v11);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v17 >= v16 + 40 * v11 || v16 >= v17 + 40 * v11)
  {
    sub_1000089B0(a6);
    swift_arrayInitWithCopy(v14 + 4);
LABEL_28:
    swift_release(a4);
    return (uint64_t)v14;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001C308(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v16 = a1;
    else
      v16 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (!((unint64_t)*v1 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (v4 < 0)
    v17 = *v1;
  else
    v17 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v1);
  v5 = _CocoaArrayWrapper.endIndex.getter(v17);
  swift_bridgeObjectRelease(v4);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_29;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v1);
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if ((unint64_t)v4 >> 62)
    goto LABEL_31;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain(v4);
    v4 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v5, v9, 1, v4);
    swift_bridgeObjectRelease(*v1);
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_10001D5B8(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_30:
    __break(1u);
LABEL_31:
    if (v4 < 0)
      v18 = v4;
    else
      v18 = v4 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v4);
    v9 = _CocoaArrayWrapper.endIndex.getter(v18);
    swift_bridgeObjectRelease(v4);
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    v15 = swift_bridgeObjectRelease(result);
    return specialized Array._endMutation()(v15);
  }
  __break(1u);
  return result;
}

uint64_t sub_10001C4C0(uint64_t a1)
{
  char **v1;
  uint64_t v2;
  char *v3;
  int64_t v4;
  int64_t v5;
  char *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;
  char v16;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *((_QWORD *)*v1 + 2);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native(*v1);
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= *((_QWORD *)v3 + 3) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_10001AC50(isUniquelyReferenced_nonNull_native, v14, 1, v3, &qword_100035630, &qword_100035628);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *((_QWORD *)v3 + 2);
  if ((*((_QWORD *)v3 + 3) >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[40 * v8 + 32];
  if (a1 + 32 < v9 + 40 * v2 && v9 < a1 + 32 + 40 * v2)
    goto LABEL_24;
  sub_1000089B0(&qword_100035628);
  swift_arrayInitWithCopy(v9);
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease(a1);
    *v1 = v3;
    return result;
  }
  v11 = *((_QWORD *)v3 + 2);
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    *((_QWORD *)v3 + 2) = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  v16 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, v16, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10001C638(_QWORD *a1, char a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  char v15;
  unint64_t v16;
  char v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *i;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  char v36;
  char v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  Swift::String v42;
  Swift::String v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v4 = a1[2];
  if (!v4)
    return swift_bridgeObjectRelease(a1);
  v8 = a1[4];
  v7 = a1[5];
  v44 = a1[6];
  swift_bridgeObjectRetain(a1);
  v47 = v8;
  v48 = v7;
  v9 = (_QWORD *)*a3;
  swift_bridgeObjectRetain(v7);
  v11 = sub_10001AF8C(v8, v7);
  v12 = v9[2];
  v13 = (v10 & 1) == 0;
  v14 = v12 + v13;
  if (__OFADD__(v12, v13))
    goto LABEL_23;
  v15 = v10;
  if (v9[3] >= v14)
  {
    if ((a2 & 1) != 0)
    {
      if ((v10 & 1) != 0)
        goto LABEL_10;
    }
    else
    {
      sub_10001C9B4();
      if ((v15 & 1) != 0)
        goto LABEL_10;
    }
LABEL_13:
    v21 = (_QWORD *)*a3;
    *(_QWORD *)(*a3 + 8 * (v11 >> 6) + 64) |= 1 << v11;
    v22 = (uint64_t *)(v21[6] + 16 * v11);
    *v22 = v8;
    v22[1] = v7;
    *(_QWORD *)(v21[7] + 8 * v11) = v44;
    v23 = v21[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v21[2] = v25;
    v26 = v4 - 1;
    if (v4 == 1)
      return swift_bridgeObjectRelease_n(a1, 2);
    for (i = a1 + 9; ; i += 3)
    {
      v7 = *(i - 1);
      v29 = *i;
      v47 = *(i - 2);
      v28 = v47;
      v48 = v7;
      v30 = (_QWORD *)*a3;
      swift_bridgeObjectRetain(v7);
      v31 = sub_10001AF8C(v47, v7);
      v33 = v30[2];
      v34 = (v32 & 1) == 0;
      v24 = __OFADD__(v33, v34);
      v35 = v33 + v34;
      if (v24)
        break;
      v36 = v32;
      if (v30[3] < v35)
      {
        sub_10001B4C0(v35, 1);
        v31 = sub_10001AF8C(v47, v7);
        if ((v36 & 1) != (v37 & 1))
          goto LABEL_25;
      }
      if ((v36 & 1) != 0)
        goto LABEL_10;
      v38 = (_QWORD *)*a3;
      *(_QWORD *)(*a3 + 8 * (v31 >> 6) + 64) |= 1 << v31;
      v39 = (uint64_t *)(v38[6] + 16 * v31);
      *v39 = v28;
      v39[1] = v7;
      *(_QWORD *)(v38[7] + 8 * v31) = v29;
      v40 = v38[2];
      v24 = __OFADD__(v40, 1);
      v41 = v40 + 1;
      if (v24)
        goto LABEL_24;
      v38[2] = v41;
      if (!--v26)
        return swift_bridgeObjectRelease_n(a1, 2);
    }
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  sub_10001B4C0(v14, a2 & 1);
  v16 = sub_10001AF8C(v8, v7);
  if ((v15 & 1) == (v17 & 1))
  {
    v11 = v16;
    if ((v15 & 1) == 0)
      goto LABEL_13;
LABEL_10:
    v19 = swift_allocError(&type metadata for _MergeError, &protocol witness table for _MergeError, 0, 0);
    swift_willThrow();
    v49 = v19;
    swift_errorRetain(v19);
    v20 = sub_1000089B0(&qword_100035610);
    if ((swift_dynamicCast(v20, &v49, v20, &type metadata for _MergeError, 0) & 1) == 0)
    {
      swift_bridgeObjectRelease(v7);
      swift_bridgeObjectRelease_n(a1, 2);
      return swift_errorRelease(v49);
    }
    goto LABEL_26;
  }
LABEL_25:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
LABEL_26:
  v45 = 0;
  v46 = 0xE000000000000000;
  _StringGuts.grow(_:)(30);
  v42._object = (void *)0x8000000100028C50;
  v42._countAndFlagsBits = 0xD00000000000001BLL;
  String.append(_:)(v42);
  _print_unlocked<A, B>(_:_:)(&v47, &v45, &type metadata for String, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v43._countAndFlagsBits = 39;
  v43._object = (void *)0xE100000000000000;
  String.append(_:)(v43);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v45, v46, "Swift/NativeDictionary.swift", 28, 2, 783, 0);
  __break(1u);
  return result;
}

void *sub_10001C9B4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  sub_1000089B0(&qword_100035550);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v19;
    v22[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_10001CB60()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_1000089B0(&qword_100035680);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10001CD10()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  sub_1000089B0(&qword_100035668);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_bridgeObjectRetain(v20);
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_10001CEC4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  __int128 v26[2];

  v1 = v0;
  sub_1000089B0(&qword_100035608);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release(v2);
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 40 * v15;
    sub_100009484(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_100009414(v26, *(_QWORD *)(v4 + 56) + v20);
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release(v2);
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

unint64_t sub_10001D0AC(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  unint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  _QWORD v26[9];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = _HashTable.previousHole(before:)(result, a2 + 64, ~v5);
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = (uint64_t *)(*(_QWORD *)(a2 + 48) + 16 * v6);
        v10 = *v9;
        v11 = v9[1];
        Hasher.init(_seed:)(v26, *(_QWORD *)(a2 + 40));
        swift_bridgeObjectRetain(v11);
        String.hash(into:)(v26, v10, v11);
        v12 = Hasher._finalize()();
        result = swift_bridgeObjectRelease(v11);
        v13 = v12 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v13 < v8)
            goto LABEL_5;
        }
        else if (v13 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v13)
        {
LABEL_11:
          v14 = *(_QWORD *)(a2 + 48);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || v15 >= v16 + 1)
            *v15 = *v16;
          v17 = *(_QWORD *)(a2 + 56);
          v18 = (_QWORD *)(v17 + 8 * v3);
          v19 = (_QWORD *)(v17 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v18 >= v19 + 1))
          {
            *v18 = *v19;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void (*sub_10001D280(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  _QWORD *v3;
  _QWORD *v7;
  char isUniquelyReferenced_nonNull_native;

  v7 = malloc(0x58uLL);
  *a1 = v7;
  v7[8] = a3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  swift_bridgeObjectRetain(a3);
  v7[9] = sub_10001D4C8(v7);
  v7[10] = sub_10001D360(v7 + 4, a2, a3, isUniquelyReferenced_nonNull_native);
  return sub_10001D310;
}

void sub_10001D310(uint64_t a1)
{
  void *v1;
  void (*v2)(void *, _QWORD);
  uint64_t v3;

  v1 = *(void **)a1;
  v2 = *(void (**)(void *, _QWORD))(*(_QWORD *)a1 + 72);
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 64);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 80))(*(_QWORD *)a1 + 32, 0);
  swift_bridgeObjectRelease(v3);
  v2(v1, 0);
  free(v1);
}

void (*sub_10001D360(_QWORD *a1, uint64_t a2, uint64_t a3, char a4))(uint64_t **a1)
{
  uint64_t *v4;
  uint64_t *v5;
  _QWORD *v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  void (*result)(uint64_t **);

  v5 = v4;
  v10 = malloc(0x30uLL);
  *a1 = v10;
  v10[2] = a3;
  v10[3] = v5;
  v10[1] = a2;
  v11 = *v5;
  v13 = sub_10001AF8C(a2, a3);
  *((_BYTE *)v10 + 40) = v12 & 1;
  v14 = *(_QWORD *)(v11 + 16);
  v15 = (v12 & 1) == 0;
  v16 = v14 + v15;
  if (__OFADD__(v14, v15))
  {
    __break(1u);
  }
  else
  {
    v17 = v12;
    v18 = *(_QWORD *)(v11 + 24);
    if (v18 >= v16 && (a4 & 1) != 0)
    {
LABEL_7:
      v10[4] = v13;
      if ((v17 & 1) != 0)
      {
LABEL_8:
        v19 = *(_QWORD *)(*(_QWORD *)(*v5 + 56) + 8 * v13);
LABEL_12:
        *v10 = v19;
        return sub_10001D48C;
      }
LABEL_11:
      v19 = 0;
      goto LABEL_12;
    }
    if (v18 >= v16 && (a4 & 1) == 0)
    {
      sub_10001CD10();
      goto LABEL_7;
    }
    sub_10001BAD4(v16, a4 & 1);
    v20 = sub_10001AF8C(a2, a3);
    if ((v17 & 1) == (v21 & 1))
    {
      v13 = v20;
      v10[4] = v20;
      if ((v17 & 1) != 0)
        goto LABEL_8;
      goto LABEL_11;
    }
  }
  result = (void (*)(uint64_t **))KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

void sub_10001D48C(uint64_t **a1)
{
  uint64_t *v1;

  v1 = *a1;
  sub_10001D4F4(*a1, *((_BYTE *)*a1 + 40), (uint64_t *)(*a1)[3], (*a1)[4], (*a1)[1], (*a1)[2]);
  swift_bridgeObjectRelease(*v1);
  free(v1);
}

uint64_t (*sub_10001D4C8(_QWORD *a1))(uint64_t result)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = v1;
  *v1 = 0x8000000000000000;
  return sub_10001D4E8;
}

uint64_t sub_10001D4E8(uint64_t result)
{
  **(_QWORD **)(result + 8) = *(_QWORD *)result;
  return result;
}

uint64_t *sub_10001D4F4(uint64_t *result, char a2, uint64_t *a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v8 = *result;
  if (!*result)
  {
    if ((a2 & 1) != 0)
    {
      swift_arrayDestroy(*(_QWORD *)(*a3 + 48) + 16 * a4, 1, &type metadata for String);
      sub_10001D0AC(a4, *a3);
    }
    return (uint64_t *)swift_bridgeObjectRetain(v8);
  }
  v9 = (_QWORD *)*a3;
  if ((a2 & 1) != 0)
  {
    *(_QWORD *)(v9[7] + 8 * a4) = v8;
    return (uint64_t *)swift_bridgeObjectRetain(v8);
  }
  v9[(a4 >> 6) + 8] |= 1 << a4;
  v10 = (_QWORD *)(v9[6] + 16 * a4);
  *v10 = a5;
  v10[1] = a6;
  *(_QWORD *)(v9[7] + 8 * a4) = v8;
  v11 = v9[2];
  v12 = __OFADD__(v11, 1);
  v13 = v11 + 1;
  if (!v12)
  {
    v9[2] = v13;
    swift_bridgeObjectRetain(a6);
    return (uint64_t *)swift_bridgeObjectRetain(v8);
  }
  __break(1u);
  return result;
}

uint64_t sub_10001D5B8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t i;
  void (*v13)(_QWORD *);
  id *v14;
  id v15;
  uint64_t v16;
  uint64_t result;
  void (*v18[4])(id *);

  v6 = (unint64_t)a3 >> 62;
  if ((unint64_t)a3 >> 62)
  {
    if (a3 < 0)
      v16 = a3;
    else
      v16 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v7 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(a3);
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_25;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    if (a3 < 0)
      v10 = a3;
    else
      v10 = a3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a3);
    v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    swift_bridgeObjectRelease(a3);
    if (v11 <= a2)
    {
      if (v7 >= 1)
      {
        sub_10001E988();
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_1000089B0(&qword_100035698);
          v13 = sub_10001D7C0(v18, i, a3);
          v15 = *v14;
          ((void (*)(void (**)(id *), _QWORD))v13)(v18, 0);
          *(_QWORD *)(a1 + 8 * i) = v15;
        }
        swift_bridgeObjectRelease(a3);
        return a3;
      }
      goto LABEL_24;
    }
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_10000F62C(0, &qword_100035690, UIAction_ptr);
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void (*sub_10001D7C0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_10001D840(v6, a2, a3);
  return sub_10001D814;
}

void sub_10001D814(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_10001D840(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_10001D8AC;
  }
  __break(1u);
  return result;
}

void sub_10001D8AC(id *a1)
{

}

uint64_t sub_10001D8B4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v7 = a4 + 40 * a1 + 32;
  v8 = a3 + 40 * v5;
  if (v7 >= v8 || v7 + 40 * v5 <= a3)
  {
    sub_1000089B0(a5);
    swift_arrayInitWithCopy(a3);
    return v8;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10001D9BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v22;

  if (!a2)
    return 0;
  type metadata accessor for BSUISharedWithYouController(0);
  v6 = (void *)static BSUISharedWithYouController.shared.getter();
  v7 = (void *)dispatch thunk of BSUISharedWithYouController.highlightAttributionView(for:viewController:)(a1, a2, a3);

  if (!v7)
    return 0;
  v8 = objc_msgSend(v7, "highlightMenu");
  v9 = objc_msgSend(v8, "children");

  v10 = sub_10000F62C(0, &qword_100035688, UIMenuElement_ptr);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v9, v10);

  if ((unint64_t)v11 >> 62)
  {
    if (v11 < 0)
      v22 = v11;
    else
      v22 = v11 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v11);
    v12 = _CocoaArrayWrapper.endIndex.getter(v22);
    swift_bridgeObjectRelease(v11);
  }
  else
  {
    v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease(v11);
  if (!v12)
  {
    if (qword_1000344C0 != -1)
      swift_once(&qword_1000344C0, sub_10001663C);
    v16 = type metadata accessor for Logger(0);
    v17 = sub_10001E368(v16, (uint64_t)qword_100035500);
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "highlightMenu empty for highlight", v20, 2u);
      swift_slowDealloc(v20, -1, -1);
    }

    return 0;
  }
  v13 = objc_msgSend(v7, "highlightMenu");
  v14 = objc_msgSend(v13, "children");

  v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v14, v10);
  return v15;
}

uint64_t sub_10001DBD8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

uint64_t sub_10001DCC8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v6 = a4 + 24 * a1 + 32;
  v7 = a3 + 24 * v4;
  if (v6 >= v7 || v6 + 24 * v4 <= a3)
  {
    sub_1000089B0(&qword_1000356B0);
    swift_arrayInitWithCopy(a3);
    return v7;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10001DDD4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v6 = a4 + 24 * a1 + 32;
  v7 = a3 + 24 * v4;
  if (v6 >= v7 || v6 + 24 * v4 <= a3)
  {
    sub_1000089B0(&qword_100035620);
    swift_arrayInitWithCopy(a3);
    return v7;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

char *sub_10001DEE0(unint64_t a1, uint64_t (*a2)(uint64_t, id))
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;

  v2 = a1;
  if (a1 >> 62)
    goto LABEL_16;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  for (; v3; v3 = _CocoaArrayWrapper.endIndex.getter(v17))
  {
    v20 = v2 & 0xC000000000000001;
    v4 = (char *)&_swiftEmptyArrayStorage;
    v5 = 4;
    v19 = v2;
    while (1)
    {
      v7 = v20 ? (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v5 - 4, v2) : *(id *)(v2 + 8 * v5);
      v8 = v7;
      v9 = v5 - 3;
      if (__OFADD__(v5 - 4, 1))
        break;
      v10 = a2(v5 - 4, v7);
      v12 = v11;
      v14 = v13;

      if (v12)
      {
        if ((swift_isUniquelyReferenced_nonNull_native(v4) & 1) == 0)
          v4 = sub_10001A8FC(0, *((_QWORD *)v4 + 2) + 1, 1, v4);
        v16 = *((_QWORD *)v4 + 2);
        v15 = *((_QWORD *)v4 + 3);
        if (v16 >= v15 >> 1)
          v4 = sub_10001A8FC((char *)(v15 > 1), v16 + 1, 1, v4);
        *((_QWORD *)v4 + 2) = v16 + 1;
        v6 = &v4[24 * v16];
        *((_QWORD *)v6 + 4) = v10;
        *((_QWORD *)v6 + 5) = v12;
        *((_QWORD *)v6 + 6) = v14;
        v2 = v19;
      }
      ++v5;
      if (v9 == v3)
        goto LABEL_21;
    }
    __break(1u);
LABEL_16:
    if (v2 < 0)
      v17 = v2;
    else
      v17 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
  }
  v4 = (char *)&_swiftEmptyArrayStorage;
LABEL_21:
  swift_bridgeObjectRelease(v2);
  return v4;
}

void *sub_10001E07C(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t, uint64_t))
{
  void *result;
  uint64_t v4;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  result = &_swiftEmptyArrayStorage;
  v4 = *(_QWORD *)(a1 + 16);
  if (v4)
  {
    swift_bridgeObjectRetain(a1);
    v6 = (uint64_t *)(a1 + 48);
    do
    {
      v9 = *(v6 - 1);
      v8 = *v6;
      v10 = *(v6 - 2);
      swift_bridgeObjectRetain(v9);
      swift_bridgeObjectRetain(v8);
      v11 = a2(v10, v9, v8);
      swift_bridgeObjectRelease(v8);
      v12 = swift_bridgeObjectRelease(v9);
      if (v11)
      {
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()(v12);
        v14 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
        v13 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v14 >= v13 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v13 > 1, v14 + 1, 1);
        v7 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v14, v11);
        specialized Array._endMutation()(v7);
      }
      v6 += 3;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease(a1);
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t _s25BooksProductPageExtension22PPXContextMenuProviderC022analyticsAssetPropertyG03forSo07BAAssetjG0_pSg11BookStoreUI22ContextActionDataModelC_tF_0(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _BYTE v15[40];
  _QWORD v16[5];
  __int128 v17;
  uint64_t v18;
  void *v19;
  char v20;

  v2 = sub_1000089B0(&qword_100035520);
  __chkstk_darwin(v2);
  v4 = &v15[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = type metadata accessor for PPXContextActionData(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = a1;
  v10 = (id)BSUIGetLibraryItemStateProvider(v9);
  v18 = type metadata accessor for MenuCoverImageProvider(0);
  v19 = &protocol witness table for MenuCoverImageProvider;
  sub_10000F7D4(&v17);
  MenuCoverImageProvider.init()();
  sub_100010728(v9, (uint64_t)v10, &v17, (uint64_t)v4);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_10000F74C((uint64_t)v4, &qword_100035520);
  }
  else
  {
    sub_100010C90((uint64_t)v4, (uint64_t)v8);
    v11 = sub_100008C0C(&qword_100035658, type metadata accessor for PPXContextActionData, (uint64_t)&unk_100027318);
    ContextActionDataProtocol.selectionMode.getter(&v17, v5, v11);
    if ((v20 & 1) == 0)
    {
      sub_100009414(&v17, (uint64_t)v16);
      sub_100009484((uint64_t)v16, (uint64_t)v15);
      v13 = objc_allocWithZone((Class)type metadata accessor for ContextMenuAssetPropertyProvider(0));
      v12 = ContextMenuAssetPropertyProvider.init(assetInfo:)(v15);
      sub_100008DE4(v16);
      sub_100010C0C((uint64_t)v8);
      return v12;
    }
    sub_100010C0C((uint64_t)v8);
    swift_bridgeObjectRelease(v17);
  }
  return 0;
}

uint64_t sub_10001E368(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_10001E380(_QWORD *a1)
{
  uint64_t v1;

  return sub_100019C34(a1, *(_QWORD *)(v1 + 16)) & 1;
}

uint64_t sub_10001E39C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t type metadata accessor for PPXContextMenuProvider()
{
  return objc_opt_self(_TtC25BooksProductPageExtension22PPXContextMenuProvider);
}

uint64_t sub_10001E3E4(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_10001E420()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001E45C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v5 = v0[4];
  v4 = v0[5];
  v6 = (_QWORD *)swift_task_alloc(dword_10003559C);
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1000087F8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))((char *)&dword_100035598 + dword_100035598))(v2, v3, v5, v4);
}

uint64_t sub_10001E4D8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_1000355AC);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10001EA24;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1000355A8 + dword_1000355A8))(v2, v3, v4);
}

uint64_t sub_10001E554()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001E580(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc(dword_1000355BC);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10001EA24;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1000355B8 + dword_1000355B8))(a1, v4, v5, v6);
}

uint64_t sub_10001E604()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10001E628(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000355CC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1000087F8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000355C8 + dword_1000355C8))(a1, v4);
}

uint64_t sub_10001E698(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000089B0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001E6DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(sub_1000089B0(&qword_100035548) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10001E7F8@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_100019AD0(a1, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), *(void **)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

uint64_t sub_10001E814(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PPXContextActionData(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001E858()
{
  unint64_t result;

  result = qword_100035660;
  if (!qword_100035660)
  {
    result = swift_getWitnessTable(&unk_100027BC4, &type metadata for PPXContextMenuPresentationContext);
    atomic_store(result, (unint64_t *)&qword_100035660);
  }
  return result;
}

uint64_t sub_10001E89C()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t *sub_10001E8D0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_10001E910@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  return sub_100018288(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(void **)(v2 + 32), *(_QWORD *)(v2 + 40), a2);
}

void *sub_10001E92C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_1000184EC(a1, *(uint64_t **)(v2 + 24), a2);
}

void sub_10001E944(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_100018834(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD **)(v2 + 24));
}

Class sub_10001E94C(uint64_t a1, void *a2, UIMenuElementSize a3)
{
  uint64_t v3;

  return sub_100018A34(a1, a2, a3, *(UIMenuElementSize *)(v3 + 16));
}

uint64_t sub_10001E954(uint64_t a1)
{
  destroy for PPXContextMenuPresentationContext(a1);
  return a1;
}

unint64_t sub_10001E988()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000356A0;
  if (!qword_1000356A0)
  {
    v1 = sub_10000DA80(&qword_100035698);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000356A0);
  }
  return result;
}

uint64_t sub_10001E9D4(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for PPXContextMenuPresentationContext(a2, a1);
  return a2;
}

uint64_t sub_10001EA10@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return sub_10001E7F8(a1, a2);
}

void sub_10001EA28(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error <BCCloudCollectionDetailManager fetchCollectionDetailsIncludingDeleted:completion:> {%@}", (uint8_t *)&v2, 0xCu);
}

void sub_10001EA9C(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error adding storeItem for storeID: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10001EB14(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C5C((void *)&_mh_execute_header, a2, a3, "Deleting audiobook. Succeeded: %@", a5, a6, a7, a8, 2u);
  sub_100006C54();
}

void sub_10001EB90(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006C5C((void *)&_mh_execute_header, a2, a3, "Delete book error %@", a5, a6, a7, a8, 2u);
  sub_100006C54();
}

void sub_10001EBF4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No AppAnalytics Tracker provided for purchaseBook. Analytics event will be missing tracker.", v1, 2u);
}

void sub_10001EC34()
{
  uint64_t v0;
  os_log_t v1;

  sub_100006C24();
  sub_100006C40((void *)&_mh_execute_header, v0, v1, "Open book error: %@, opened: %d");
  sub_100006C54();
}

void sub_10001EC94()
{
  uint64_t v0;
  os_log_t v1;

  sub_100006C24();
  sub_100006C40((void *)&_mh_execute_header, v0, v1, "Open sample book error: %@, opened: %d");
  sub_100006C54();
}

void sub_10001ECF4()
{
  uint64_t v0;
  os_log_t v1;

  sub_100006C24();
  sub_100006C40((void *)&_mh_execute_header, v0, v1, "Preview audiobook error: %@, opened: %d");
  sub_100006C54();
}

void sub_10001ED54(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "downloadQueue:downloadStatesDidChange: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001EDC8(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "got a nil assetIdentifier while trying to create a BKLibraryDownloadStatus", buf, 2u);
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__contentDataForContentID_tracker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentDataForContentID:tracker:");
}

id objc_msgSend__isOwned_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isOwned:");
}

id objc_msgSend__updateCollections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCollections");
}

id objc_msgSend__updateDownloadingAssets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateDownloadingAssets:");
}

id objc_msgSend_activeStoreAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeStoreAccount");
}

id objc_msgSend_addChild_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChild:");
}

id objc_msgSend_addFilterPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFilterPredicate:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addStoreID_toCollectionID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStoreID:toCollectionID:completion:");
}

id objc_msgSend_addStoreIDToWantToRead_tracker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStoreIDToWantToRead:tracker:");
}

id objc_msgSend_addStoreItem_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addStoreItem:completion:");
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetDetailForAssetID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetDetailForAssetID:completion:");
}

id objc_msgSend_assetDetailManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetDetailManager");
}

id objc_msgSend_assetID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetID");
}

id objc_msgSend_audiobooksQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audiobooksQuery");
}

id objc_msgSend_ba_effectiveAnalyticsTracker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ba_effectiveAnalyticsTracker");
}

id objc_msgSend_ba_setAnalyticsTracker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ba_setAnalyticsTracker:");
}

id objc_msgSend_bc_firstVisibleChildViewControllerOfClass_includePresented_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bc_firstVisibleChildViewControllerOfClass:includePresented:");
}

id objc_msgSend_bk_assetIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bk_assetIdentifier");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_cancelDownloadForAssetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelDownloadForAssetID:");
}

id objc_msgSend_cancelDownloadForBook_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelDownloadForBook:");
}

id objc_msgSend_cancelDownloadWithID_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelDownloadWithID:withCompletion:");
}

id objc_msgSend_chainWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chainWithName:");
}

id objc_msgSend_childAssets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "childAssets");
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "children");
}

id objc_msgSend_collectionDetailForCollectionID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionDetailForCollectionID:completion:");
}

id objc_msgSend_collectionDetailManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionDetailManager");
}

id objc_msgSend_collectionDetailsCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionDetailsCache");
}

id objc_msgSend_collectionID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionID");
}

id objc_msgSend_collectionMemberIDWithCollectionID_assetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionMemberIDWithCollectionID:assetID:");
}

id objc_msgSend_collectionMemberManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionMemberManager");
}

id objc_msgSend_contentPrivateIDForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentPrivateIDForContentID:");
}

id objc_msgSend_contentUserIDForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentUserIDForContentID:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateFinished(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFinished");
}

id objc_msgSend_defaultBookLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultBookLibrary");
}

id objc_msgSend_defaultMediaLibrary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultMediaLibrary");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_deleteCollectionMemberForCollectionMemberID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteCollectionMemberForCollectionMemberID:completion:");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchQueue");
}

id objc_msgSend_downloadBookWithRedownloadParameters_isAudiobook_hasRacSupport_uiManager_tracker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadBookWithRedownloadParameters:isAudiobook:hasRacSupport:uiManager:tracker:");
}

id objc_msgSend_downloadBooks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadBooks:");
}

id objc_msgSend_downloadID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadID");
}

id objc_msgSend_downloadPhase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadPhase");
}

id objc_msgSend_downloadStatus(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadStatus");
}

id objc_msgSend_downloadingAssets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadingAssets");
}

id objc_msgSend_emitAddToCollectionEventWithTracker_collectionID_contentData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitAddToCollectionEventWithTracker:collectionID:contentData:");
}

id objc_msgSend_emitAddToCollectionEventWithTracker_collectionID_contentID_contentAcquisitionType_contentType_supplementalContentCount_seriesType_productionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitAddToCollectionEventWithTracker:collectionID:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:");
}

id objc_msgSend_emitMarkAsFinishedEventWithTracker_contentData_markedData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitMarkAsFinishedEventWithTracker:contentData:markedData:");
}

id objc_msgSend_emitMarkAsFinishedEventWithTracker_contentID_contentAcquisitionType_contentType_supplementalContentCount_seriesType_productionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitMarkAsFinishedEventWithTracker:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:");
}

id objc_msgSend_emitRemoveFromCollectionEventWithTracker_collectionID_contentID_contentAcquisitionType_contentType_supplementalContentCount_seriesType_productionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitRemoveFromCollectionEventWithTracker:collectionID:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:");
}

id objc_msgSend_emitRemoveFromWantListEventWithTracker_contentID_contentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitRemoveFromWantListEventWithTracker:contentID:contentType:");
}

id objc_msgSend_emitWantListAddEventWithTracker_contentData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitWantListAddEventWithTracker:contentData:");
}

id objc_msgSend_emitWantListAddEventWithTracker_contentID_contentAcquisitionType_contentType_supplementalContentCount_seriesType_productionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitWantListAddEventWithTracker:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:");
}

id objc_msgSend_enqueueValueCall_arguments_file_line_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueueValueCall:arguments:file:line:");
}

id objc_msgSend_fetchCollectionDetailsIncludingDeleted_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCollectionDetailsIncludingDeleted:completion:");
}

id objc_msgSend_fetchIsAssetID_inCollectionID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchIsAssetID:inCollectionID:completion:");
}

id objc_msgSend_fetchServerItemsForStoreIDs_andDSIDS_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchServerItemsForStoreIDs:andDSIDS:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifierFromPermlink(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifierFromPermlink");
}

id objc_msgSend_initWithAssetID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAssetID:");
}

id objc_msgSend_initWithBLDownloadStatus_isParent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBLDownloadStatus:isParent:");
}

id objc_msgSend_initWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCompletion:");
}

id objc_msgSend_initWithContentID_contentType_contentPrivateID_contentUserID_contentAcquisitionType_contentSubType_contentLength_supplementalContentCount_seriesType_productionType_isUnified_contentKind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContentID:contentType:contentPrivateID:contentUserID:contentAcquisitionType:contentSubType:contentLength:supplementalContentCount:seriesType:productionType:isUnified:contentKind:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithStoreID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStoreID:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_isArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isArray");
}

id objc_msgSend_isAudiobook(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAudiobook");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFinished(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFinished");
}

id objc_msgSend_isObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isObject");
}

id objc_msgSend_itemStateWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemStateWithIdentifier:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "items");
}

id objc_msgSend_lastOpenDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastOpenDate");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "library");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_metadataDictionary_variationWithNavigationBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metadataDictionary:variationWithNavigationBarStyle:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_networkMonitor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkMonitor");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openBook_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openBook:options:");
}

id objc_msgSend_openSampleBook_withSampleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSampleBook:withSampleURL:");
}

id objc_msgSend_openSensitiveURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:error:");
}

id objc_msgSend_parent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parent");
}

id objc_msgSend_permLink(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "permLink");
}

id objc_msgSend_predicateWithValue_forProperty_comparisonType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithValue:forProperty:comparisonType:");
}

id objc_msgSend_previewAudiobook_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previewAudiobook:");
}

id objc_msgSend_purchaseWithRequest_uiManager_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purchaseWithRequest:uiManager:completion:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadData");
}

id objc_msgSend_removeAssetFromWantToRead_tracker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAssetFromWantToRead:tracker:");
}

id objc_msgSend_removeAssetID_fromCollectionID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAssetID:fromCollectionID:completion:");
}

id objc_msgSend_removeBookFromLibraryWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeBookFromLibraryWithIdentifier:error:");
}

id objc_msgSend_removeFromParent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromParent");
}

id objc_msgSend_removeItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItems:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_requestWithBuyParameters_storeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithBuyParameters:storeIdentifier:");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "row");
}

id objc_msgSend_seriesTypeForContentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "seriesTypeForContentID:");
}

id objc_msgSend_setAnalyticsInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnalyticsInfo:");
}

id objc_msgSend_setAssetDetail_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAssetDetail:completion:");
}

id objc_msgSend_setAudiobook_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudiobook:");
}

id objc_msgSend_setCollectionDetailsCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollectionDetailsCache:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDateFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateFinished:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDownloadStatus_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDownloadStatus:");
}

id objc_msgSend_setFinishedState_storeID_tracker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFinishedState:storeID:tracker:");
}

id objc_msgSend_setIsFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFinished:");
}

id objc_msgSend_setNetworkMonitor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkMonitor:");
}

id objc_msgSend_setNotFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotFinished:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setParent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParent:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_sharedClient(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedClient");
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedController");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedProvider");
}

id objc_msgSend_sharedReporter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedReporter");
}

id objc_msgSend_sortOrder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortOrder");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stop");
}

id objc_msgSend_stopObserving(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopObserving");
}

id objc_msgSend_storeAssetManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeAssetManager");
}

id objc_msgSend_storeDownloadParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeDownloadParameters");
}

id objc_msgSend_storeID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeID");
}

id objc_msgSend_storeIDFromBuyParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storeIDFromBuyParameters:");
}

id objc_msgSend_storePlaylistID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storePlaylistID");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_suspendAndTeardownForReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "suspendAndTeardownForReason:");
}

id objc_msgSend_temporaryAssetID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "temporaryAssetID");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textLabel");
}

id objc_msgSend_titleForDefaultCollectionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleForDefaultCollectionID:");
}

id objc_msgSend_toArray(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toArray");
}

id objc_msgSend_updateFinishedState_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateFinishedState:identifier:");
}

id objc_msgSend_updateItemOfInterestForItemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateItemOfInterestForItemIdentifier:");
}

id objc_msgSend_updateStateToDeletedForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateToDeletedForIdentifier:");
}

id objc_msgSend_updateStateToPurchaseFailedForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateToPurchaseFailedForIdentifier:");
}

id objc_msgSend_updateStateToPurchasingForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateToPurchasingForIdentifier:");
}

id objc_msgSend_updateWantToReadState_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWantToReadState:identifier:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}

id objc_msgSend_windowManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowManager");
}
