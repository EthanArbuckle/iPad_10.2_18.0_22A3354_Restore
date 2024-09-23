@implementation UGCPlaceDataPhotoListDataProvider

- (id)initWitBatchRequester:(id)a3 initialCount:(unint64_t)a4 batchCount:(unint64_t)a5 totalCount:(unint64_t)a6 albumCategory:(id)a7 delegate:(id)a8
{
  id v15;
  id v16;
  id v17;
  UGCPlaceDataPhotoListDataProvider *v18;
  dispatch_queue_attr_t v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *serialQueue;
  NSMutableArray *v23;
  NSMutableArray *photoList;
  NSMutableDictionary *v25;
  NSMutableDictionary *attributionsByVendorId;
  uint64_t v27;
  geo_isolater *attributionsByVendorIdIsolator;
  uint64_t v29;
  geo_isolater *hasObfuscatedPhotosIsolator;
  objc_super v32;

  v15 = a3;
  v16 = a7;
  v17 = a8;
  v32.receiver = self;
  v32.super_class = (Class)UGCPlaceDataPhotoListDataProvider;
  v18 = -[UGCPlaceDataPhotoListDataProvider init](&v32, "init");
  if (v18)
  {
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue(v19);
    v21 = dispatch_queue_create("com.apple.Maps.UGCPhotoViewerDataProviderQueue", v20);
    serialQueue = v18->_serialQueue;
    v18->_serialQueue = (OS_dispatch_queue *)v21;

    v23 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    photoList = v18->_photoList;
    v18->_photoList = v23;

    objc_storeStrong((id *)&v18->_batchRequester, a3);
    v18->_currentIndex = 0;
    v18->_initialCount = a4;
    v18->_batchCount = a5;
    v18->_totalCount = a6;
    v18->_shouldLoadNextBatch = 1;
    v18->_isLoading = 0;
    v25 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    attributionsByVendorId = v18->_attributionsByVendorId;
    v18->_attributionsByVendorId = v25;

    objc_storeWeak((id *)&v18->_delegate, v17);
    v18->_isLoadingFirstBatch = 1;
    v18->_indexOfTappedPhoto = 0;
    objc_storeStrong((id *)&v18->_albumCategory, a7);
    v27 = geo_isolater_create("com.apple.Maps.UGCAttributionIsolator");
    attributionsByVendorIdIsolator = v18->_attributionsByVendorIdIsolator;
    v18->_attributionsByVendorIdIsolator = (geo_isolater *)v27;

    v29 = geo_isolater_create("com.apple.Maps.UGCObfuscatedPhotosIsolator");
    hasObfuscatedPhotosIsolator = v18->_hasObfuscatedPhotosIsolator;
    v18->_hasObfuscatedPhotosIsolator = (geo_isolater *)v29;

  }
  return v18;
}

- (BOOL)hasReachedTotalCount
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007E0288;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasDataToShow
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007E0370;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)hasPhotosThatShouldBeObfuscatedWhenInFullScreen
{
  geo_isolater *hasObfuscatedPhotosIsolator;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  hasObfuscatedPhotosIsolator = self->_hasObfuscatedPhotosIsolator;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007E0464;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  geo_isolate_sync(hasObfuscatedPhotosIsolator, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)totalNumberOfPhotos
{
  return self->_totalCount;
}

- (id)attributionNames
{
  geo_isolater *attributionsByVendorIdIsolator;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1007E0584;
  v12 = sub_1007E0594;
  v13 = 0;
  attributionsByVendorIdIsolator = self->_attributionsByVendorIdIsolator;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1007E059C;
  v7[3] = &unk_1011ADF48;
  v7[4] = self;
  v7[5] = &v8;
  geo_isolate_sync(attributionsByVendorIdIsolator, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9[5], "allValues"));
  v4 = sub_10039DCD4(v3, &stru_1011C8EC0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)fetchNextBatchRequestIfNeeded
{
  OS_dispatch_queue *v3;
  _QWORD block[5];
  id v5;
  id location;

  v3 = self->_serialQueue;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1007E06E8;
  block[3] = &unk_1011AEAA0;
  block[4] = self;
  objc_copyWeak(&v5, &location);
  dispatch_async((dispatch_queue_t)v3, block);
  objc_destroyWeak(&v5);

  objc_destroyWeak(&location);
}

- (void)_processResult:(id)a3
{
  id WeakRetained;
  char v5;
  id v6;
  void *v7;
  __CFString *v8;
  id v9;
  __CFString *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  id v17;
  geo_isolater *hasObfuscatedPhotosIsolator;
  id v19;
  unint64_t indexOfTappedPhoto;
  id v21;
  void *v22;
  id v23;
  NSMutableArray *photoList;
  id v25;
  geo_isolater *attributionsByVendorIdIsolator;
  id v27;
  id v28;
  uint64_t v29;
  void *j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  _QWORD v43[5];
  _QWORD v44[6];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[6];
  _QWORD v50[4];
  id v51;
  UGCPlaceDataPhotoListDataProvider *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;

  v42 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector(WeakRetained, "photoViewerDataProviderRequestsMapItem:");

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "photoViewerDataProviderRequestsMapItem:", self));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));

  }
  else
  {
    v8 = &stru_1011EB268;
  }
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "photos"));
  v10 = v8;
  v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v9, "count"));
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, &v58, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(v12);
        v16 = objc_msgSend(objc_alloc((Class)MKMapItemPhoto), "initWithGeoMapItemPhoto:fallbackTitle:", *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i), v10);
        objc_msgSend(v11, "addObject:", v16);

      }
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v53, &v58, 16);
    }
    while (v13);
  }

  v17 = objc_msgSend(v11, "copy");
  hasObfuscatedPhotosIsolator = self->_hasObfuscatedPhotosIsolator;
  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_1007E1058;
  v50[3] = &unk_1011AC8B0;
  v19 = v17;
  v51 = v19;
  v52 = self;
  geo_isolate_sync(hasObfuscatedPhotosIsolator, v50);
  if (self->_isLoadingFirstBatch)
  {
    self->_isLoadingFirstBatch = 0;
    indexOfTappedPhoto = self->_indexOfTappedPhoto;
    if (indexOfTappedPhoto < (unint64_t)objc_msgSend(v19, "count"))
    {
      v21 = objc_msgSend(v19, "mutableCopy");
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", self->_indexOfTappedPhoto));
      objc_msgSend(v21, "removeObjectAtIndex:", self->_indexOfTappedPhoto);
      objc_msgSend(v21, "insertObject:atIndex:", v22, 0);
      v23 = objc_msgSend(v21, "copy");

      v19 = v23;
    }
  }
  photoList = self->_photoList;
  v25 = objc_msgSend(v19, "copy");
  -[NSMutableArray addObjectsFromArray:](photoList, "addObjectsFromArray:", v25);

  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = sub_1007E0584;
  v62 = sub_1007E0594;
  v63 = 0;
  v41 = 72;
  attributionsByVendorIdIsolator = self->_attributionsByVendorIdIsolator;
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1007E1164;
  v49[3] = &unk_1011ADF48;
  v49[4] = self;
  v49[5] = &v58;
  geo_isolate_sync(attributionsByVendorIdIsolator, v49);
  v48 = 0u;
  v46 = 0u;
  v47 = 0u;
  v45 = 0u;
  v27 = v19;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v46;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(_QWORD *)v46 != v29)
          objc_enumerationMutation(v27);
        v31 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)j);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "attribution", v41));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "providerID"));

        if (objc_msgSend(v33, "length"))
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "attribution"));
          if (v34)
          {
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v59[5], "objectForKeyedSubscript:", v33));
            v36 = v35 == 0;

            if (v36)
            {
              v37 = (void *)v59[5];
              v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "attribution"));
              objc_msgSend(v37, "setObject:forKey:", v38, v33);

            }
          }
        }

      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
    }
    while (v28);
  }

  v39 = *(uint64_t *)((char *)&self->super.super.isa + v41);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1007E11A4;
  v44[3] = &unk_1011AD318;
  v44[4] = self;
  v44[5] = &v58;
  geo_isolate_sync(v39, v44);
  v40 = -[NSMutableArray count](self->_photoList, "count");
  self->_currentIndex = (unint64_t)v40;
  if ((unint64_t)v40 >= self->_totalCount)
    self->_shouldLoadNextBatch = 0;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1007E11E4;
  v43[3] = &unk_1011AC860;
  v43[4] = self;
  -[UGCPlaceDataPhotoListDataProvider _performOnCallbackQueue:](self, "_performOnCallbackQueue:", v43, v41);
  _Block_object_dispose(&v58, 8);

}

- (void)_failWithError:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  NSUInteger v11;
  NSUInteger v12;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialQueue);
  self->_shouldLoadNextBatch = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1007E1300;
  v9[3] = &unk_1011B15D8;
  v9[4] = self;
  v10 = v7;
  v11 = location;
  v12 = length;
  v8 = v7;
  -[UGCPlaceDataPhotoListDataProvider _performOnCallbackQueue:](self, "_performOnCallbackQueue:", v9);

}

- (void)_performOnCallbackQueue:(id)a3
{
  id v3;
  void *v4;
  _QWORD block[4];
  id v6;
  uint8_t buf[16];

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1007E140C;
    block[3] = &unk_1011ADA00;
    v6 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Assertion failed: completion != ((void *)0)", buf, 2u);
  }

}

- (id)photoList
{
  NSObject *serialQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_1007E0584;
  v10 = sub_1007E0594;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1007E14EC;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = objc_msgSend((id)v7[5], "copy");
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (BOOL)isAllowedToShowAddPhotoCallToAction
{
  void *v3;
  char v4;
  geo_isolater *attributionsByVendorIdIsolator;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPlaceDataPhotoListDataProvider delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "photoViewerDataProviderRequestsMapItem:");

  if ((v4 & 1) == 0)
    return 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1007E0584;
  v15 = sub_1007E0594;
  v16 = 0;
  attributionsByVendorIdIsolator = self->_attributionsByVendorIdIsolator;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1007E1684;
  v10[3] = &unk_1011ADF48;
  v10[4] = self;
  v10[5] = &v11;
  geo_isolate_sync(attributionsByVendorIdIsolator, v10);
  if (objc_msgSend((id)v12[5], "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UGCPlaceDataPhotoListDataProvider delegate](self, "delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "photoViewerDataProviderRequestsMapItem:", self));

    v8 = +[MKPOIEnrichmentAvailibility shouldShowAddPhotoButtonOnMorePhotosGalleryForMapItem:usingAttributionsByProviderIds:](MKPOIEnrichmentAvailibility, "shouldShowAddPhotoButtonOnMorePhotosGalleryForMapItem:usingAttributionsByProviderIds:", v7, v12[5]);
  }
  else
  {
    v8 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (unint64_t)indexOfTappedPhoto
{
  return self->_indexOfTappedPhoto;
}

- (void)setIndexOfTappedPhoto:(unint64_t)a3
{
  self->_indexOfTappedPhoto = a3;
}

- (id)albumCategory
{
  return self->_albumCategory;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isLoading
{
  return self->_isLoading;
}

- (unint64_t)shouldLoadNextBatch
{
  return self->_shouldLoadNextBatch;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_albumCategory, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_batchRequester, 0);
  objc_storeStrong((id *)&self->_hasObfuscatedPhotosIsolator, 0);
  objc_storeStrong((id *)&self->_attributionsByVendorIdIsolator, 0);
  objc_storeStrong((id *)&self->_attributionsByVendorId, 0);
  objc_storeStrong((id *)&self->_photoList, 0);
}

@end
