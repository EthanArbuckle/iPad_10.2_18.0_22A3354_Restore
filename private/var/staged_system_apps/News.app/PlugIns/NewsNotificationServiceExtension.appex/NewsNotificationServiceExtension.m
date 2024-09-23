void sub_10000385C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003880(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003890(uint64_t a1)
{

}

void sub_100003898(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000038D4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100003908(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  int8x16_t v16;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "derivedPersonalizationData"));
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = objc_msgSend(objc_alloc((Class)FCDerivedPersonalizationData), "initWithAggregates:scoringType:decayRate:", &__NSDictionary0__struct, 0, 0.0);
  v5 = v4;

  v6 = objc_msgSend(objc_alloc((Class)FCReadonlyPersonalizationAggregateStore), "initWithGenerator:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "feedPersonalizerFactory"));
  v8 = objc_msgSend(v7, "newFeedPersonalizerWithAggregateStore:appConfigurationManager:todayPrivateData:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100003A68;
  v11[3] = &unk_100024B28;
  v12 = v8;
  v13 = *(id *)(a1 + 48);
  v14 = v6;
  v16 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
  v15 = *(id *)(a1 + 56);
  v9 = v6;
  v10 = v8;
  objc_msgSend(v10, "prepareForUseWithCompletionHandler:", v11);

}

void sub_100003A68(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  FRArticleNotificationPersonalizerResult *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sortItems:options:configurationSet:", *(_QWORD *)(a1 + 40), 1, 18));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "personalizationTreatment"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "baselineAggregateWithConfigurableValues:", v2));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "notificationScoringConfig"));
  objc_msgSend(v4, "decayFactor");
  objc_msgSend(v3, "personalizationValueWithBaseline:decayRate:", 0);
  v6 = v5;

  v7 = -[FRArticleNotificationPersonalizerResult initWithItems:baselineClickThroughRate:todayData:]([FRArticleNotificationPersonalizerResult alloc], "initWithItems:baselineClickThroughRate:todayData:", v8, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

void sub_100003B94(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

void sub_100004084(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000040A0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100004174;
  v11[3] = &unk_100024BC8;
  v12 = v6;
  v8 = *(id *)(a1 + 32);
  v13 = v5;
  v14 = v8;
  v9 = v5;
  v10 = v6;
  FCPerformIfNonNil(WeakRetained, v11);

}

void sub_100004174(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD block[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[5];
  id v46;
  _QWORD v47[5];
  id v48;

  v3 = a2;
  if (!*(_QWORD *)(a1 + 32))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "headline"));
    v47[0] = 0;
    v47[1] = v47;
    v47[2] = 0x3032000000;
    v47[3] = sub_10000457C;
    v47[4] = sub_10000458C;
    v48 = 0;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = sub_10000457C;
    v45[4] = sub_10000458C;
    v46 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = sub_10000457C;
    v43[4] = sub_10000458C;
    v44 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "thumbnailHQ"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "thumbnailAssetHandle"));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceChannel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "theme"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bannerImageForWhiteBackground"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bannerImageForMask"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "assetHandle"));
    v32 = v10;
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "assetHandle"));
    v13 = (void *)v12;
    v29 = v9;
    v30 = v7;
    v31 = v3;
    if (!v33 && !v11 && !v12)
    {
      v14 = objc_alloc((Class)NSSArticleInternal);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "shortExcerpt"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "publishDate"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sourceName"));
      v19 = objc_msgSend(v14, "initWithThumbnailImage:title:shortExcerpt:publishDate:publisherName:publisherLogoImage:publisherLogoMaskImage:", 0, v15, v16, v17, v18, 0, 0);

      v20 = *(_QWORD *)(a1 + 48);
      if (v20)
        (*(void (**)(uint64_t, NSObject *))(v20 + 16))(v20, v19);
      goto LABEL_17;
    }
    v19 = dispatch_group_create();
    if (v33)
      v21 = objc_msgSend(v33, "downloadIfNeededWithGroup:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "traitCollection"));
    v24 = objc_msgSend(v23, "userInterfaceStyle");

    if (v24 == (id)2)
    {
      v25 = v11;
      if (!v11)
        goto LABEL_16;
    }
    else
    {
      v25 = v13;
      if (!v13)
      {
LABEL_16:
        v27 = FCDispatchQueueForQualityOfService(25);
        v28 = objc_claimAutoreleasedReturnValue(v27);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100004594;
        block[3] = &unk_100024BA0;
        v35 = v33;
        v40 = v47;
        v36 = v11;
        v41 = v45;
        v37 = v13;
        v42 = v43;
        v38 = v5;
        v39 = *(id *)(a1 + 48);
        dispatch_group_notify(v19, v28, block);

LABEL_17:
        _Block_object_dispose(v43, 8);

        _Block_object_dispose(v45, 8);
        _Block_object_dispose(v47, 8);

        v3 = v31;
        goto LABEL_18;
      }
    }
    v26 = objc_msgSend(v25, "downloadIfNeededWithGroup:", v19);
    goto LABEL_16;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
LABEL_18:

}

void sub_10000452C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 184), 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000457C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000458C(uint64_t a1)
{

}

void sub_100004594(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint64_t v18;
  __int128 v19;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "filePath"));
  if (objc_msgSend(v2, "length"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v2));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "filePath"));
  if (objc_msgSend(v6, "length"))
  {
    v7 = objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v6));
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "filePath"));
  if (objc_msgSend(v10, "length"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithContentsOfFile:](UIImage, "imageWithContentsOfFile:", v10));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageWithRenderingMode:", 2));
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100004714;
  block[3] = &unk_100024B78;
  v18 = *(_QWORD *)(a1 + 72);
  v16 = *(id *)(a1 + 56);
  v19 = *(_OWORD *)(a1 + 80);
  v17 = *(id *)(a1 + 64);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100004714(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  v2 = objc_alloc((Class)NSSArticleInternal);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "shortExcerpt"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "publishDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sourceName"));
  v9 = objc_msgSend(v2, "initWithThumbnailImage:title:shortExcerpt:publishDate:publisherName:publisherLogoImage:publisherLogoMaskImage:", v3, v4, v5, v6, v7, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);

}

void sub_100005388(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = FRArticleNotificationServiceSharedLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Aborting prefetch since kettle prefetching is disabled per the notification behavior flags", v6, 2u);
  }

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bestAttemptContent"));
  objc_msgSend(v4, "finalizeContent:", v5);

}

void sub_100005414(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = FRArticleNotificationServiceSharedLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Aborting prefetch because notification interruption level + device settings will bypass digest", v6, 2u);
  }

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bestAttemptContent"));
  objc_msgSend(v4, "finalizeContent:", v5);

}

void sub_1000054A0(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = FRArticleNotificationServiceSharedLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Aborting prefetch since prefetching is disabled", v6, 2u);
  }

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bestAttemptContent"));
  objc_msgSend(v4, "finalizeContent:", v5);

}

void sub_10000552C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = FRArticleNotificationServiceSharedLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Aborting prefetch since device does not have watch paired", v6, 2u);
  }

  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bestAttemptContent"));
  objc_msgSend(v4, "finalizeContent:", v5);

}

void sub_1000055B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7)
{
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  id v29;

  v13 = a6;
  v14 = a7;
  if (v14)
  {
    v15 = FRArticleNotificationServiceSharedLog();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v28 = 138412290;
      v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Fetch thumbnailURL and publisherLogoURL failed with error: %@", (uint8_t *)&v28, 0xCu);
    }
  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "notificationAttachmentsWithThumbnailFileURL:publisherLogoFileURL:publisherLogoMaskFileURL:publisherLogoCompactFileURL:isKettleDigestEnabled:", a2, a3, a4, a5, *(unsigned __int8 *)(a1 + 56)));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bestAttemptContent"));
    objc_msgSend(v18, "setAttachments:", v17);

    if (v13)
    {
      v19 = objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:](NSData, "dataWithContentsOfURL:", v13));
      objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, FCNotificationPayloadFlintDocumentAssetDataKey);

      v21 = objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
      objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, FCNotificationPayloadNewsKey);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bestAttemptContent"));
      objc_msgSend(v22, "setUserInfo:", v21);

    }
    v23 = FRArticleNotificationServiceSharedLog();
    v16 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bestAttemptContent"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "attachments"));
      v28 = 134217984;
      v29 = objc_msgSend(v25, "count");
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Attached %lu attachments to notification.", (uint8_t *)&v28, 0xCu);

    }
  }

  v26 = *(void **)(a1 + 32);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bestAttemptContent"));
  objc_msgSend(v26, "finalizeContent:", v27);

}

void sub_100006024(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void (**v4)(_QWORD, _QWORD);
  uint8_t v5[16];

  v2 = FRArticleNotificationServiceSharedLog();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Unable to create FCNotificationArticleHeadline from userInfo, skipping personalization.", v5, 2u);
  }

  v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentHandler"));
  v4[2](v4, *(_QWORD *)(a1 + 40));

}

void sub_1000060AC(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006108;
  block[3] = &unk_100024C18;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100006108(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *);

  v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentHandler"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bestAttemptContent"));
  v3[2](v3, v2);

}

void sub_100006164(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  uint64_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "items"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "scoreProfiles"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", *(_QWORD *)(a1 + 32)));

  objc_msgSend(v5, "personalizationScore");
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bestAttemptContent"));
  objc_msgSend(v8, "setRelevanceScore:", v7);

  v9 = FRArticleNotificationServiceSharedLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bestAttemptContent"));
    objc_msgSend(v11, "relevanceScore");
    *(_DWORD *)buf = 134217984;
    v17 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Post processing notification with relevanceScore: %f", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "postProcessCoordinator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "bestAttemptContent"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000062F8;
  v15[3] = &unk_100024C18;
  v15[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v13, "notificationArrived:completionHandler:", v14, v15);

}

void sub_1000062F8(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006354;
  block[3] = &unk_100024C18;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100006354(uint64_t a1)
{
  void *v2;
  void (**v3)(id, void *);

  v3 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentHandler"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "bestAttemptContent"));
  v3[2](v3, v2);

}

id FRArticleNotificationServiceSharedLog()
{
  if (qword_10002A390 != -1)
    dispatch_once(&qword_10002A390, &stru_100024CD0);
  return (id)qword_10002A398;
}

void sub_1000064A4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.news.newsnotificationserviceextension", "General");
  v2 = (void *)qword_10002A398;
  qword_10002A398 = (uint64_t)v1;

}

void sub_100006BB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006C2C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100006C3C(uint64_t a1)
{

}

void sub_100006C44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Thumb DONE: %@ - %@", (uint8_t *)&v15, 0x16u);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v10 + 40);
  v11 = (id *)(v10 + 40);
  v12 = v13;
  if (v13)
    v14 = v12;
  else
    v14 = v6;
  objc_storeStrong(v11, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100006D4C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Dark Style Logo DONE: %@ - %@", (uint8_t *)&v15, 0x16u);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v10 + 40);
  v11 = (id *)(v10 + 40);
  v12 = v13;
  if (v13)
    v14 = v12;
  else
    v14 = v6;
  objc_storeStrong(v11, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100006E54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Logo DONE: %@ - %@", (uint8_t *)&v15, 0x16u);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v10 + 40);
  v11 = (id *)(v10 + 40);
  v12 = v13;
  if (v13)
    v14 = v12;
  else
    v14 = v6;
  objc_storeStrong(v11, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100006F5C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Compact logo DONE: %@ - %@", (uint8_t *)&v15, 0x16u);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v10 + 40);
  v11 = (id *)(v10 + 40);
  v12 = v13;
  if (v13)
    v14 = v12;
  else
    v14 = v6;
  objc_storeStrong(v11, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_100007064(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v15 = 138412546;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Flint document DONE: %@ - %@", (uint8_t *)&v15, 0x16u);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v9 = v5;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v10 + 40);
  v11 = (id *)(v10 + 40);
  v12 = v13;
  if (v13)
    v14 = v12;
  else
    v14 = v6;
  objc_storeStrong(v11, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void sub_10000716C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_cleanupFilesInDirectory:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t sub_100007198(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    v3 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
    v5 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40);
    v6 = *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40);
    v9 = 138413570;
    v10 = v2;
    v11 = 2112;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v5;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Group done with URLs %@, %@, %@, %@, %@ and Error: %@", (uint8_t *)&v9, 0x3Eu);
  }
  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[10] + 8) + 40));
  return result;
}

void sub_100007904(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  _BOOL4 v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138413058;
    v29 = v10;
    v30 = 2112;
    v31 = v7;
    v32 = 2112;
    v33 = v8;
    v34 = 2112;
    v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Download of %@. DONE: %@ - %@ - %@", buf, 0x2Au);
  }
  if (v7)
  {
    v11 = objc_autoreleasePoolPush();
    v12 = *(void **)(a1 + 40);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastPathComponent"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "URLByAppendingPathComponent:", v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v27 = 0;
    v16 = objc_msgSend(v15, "copyItemAtURL:toURL:error:", v7, v14, &v27);
    v17 = v27;

    v18 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v18)
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412802;
        v29 = v19;
        v30 = 2112;
        v31 = v7;
        v32 = 2112;
        v33 = v14;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: COPIED download of %@ from %@ to %@", buf, 0x20u);
      }
      v20 = v14;
    }
    else
    {
      if (v18)
      {
        v21 = *(_QWORD *)(a1 + 32);
        v22 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138412802;
        v29 = v21;
        v30 = 2112;
        v31 = v22;
        v32 = 2112;
        v33 = v17;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_INFO, "ArticleSource: Couldn't copy download of %@ to %@ - %@", buf, 0x20u);
      }
      v20 = 0;
    }

    objc_autoreleasePoolPop(v11);
    if (*(_QWORD *)(a1 + 48))
    {
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100007BD8;
      v23[3] = &unk_100024D70;
      v26 = *(id *)(a1 + 48);
      v24 = v20;
      v25 = v9;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v23);

    }
  }

}

uint64_t sub_100007BD8(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_100007C44(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  objc_class *v8;
  id v9;
  objc_class *v10;
  char *v11;
  uint64_t v12;
  uint64_t *v13;
  id v14;
  uint64_t v15;
  _QWORD v17[5];
  objc_super v18;

  v4 = v3;
  v8 = (objc_class *)type metadata accessor for ArticleNotificationPersonalizationConfigurationManager();
  v9 = objc_allocWithZone(v8);
  v10 = (objc_class *)type metadata accessor for NewsAppConfigurationManager(0);
  objc_allocWithZone(v10);
  swift_unknownObjectRetain(a2);
  v11 = (char *)v9;
  v12 = NewsAppConfigurationManager.init(appConfigurationManager:transform:)(a2, sub_10000808C, 0);
  v13 = (uint64_t *)&v11[OBJC_IVAR____TtC32NewsNotificationServiceExtension54ArticleNotificationPersonalizationConfigurationManager_configurationManager];
  v13[3] = (uint64_t)v10;
  v13[4] = (uint64_t)&protocol witness table for NewsAppConfigurationManager;
  *v13 = v12;

  v18.receiver = v11;
  v18.super_class = v8;
  v14 = objc_msgSendSuper2(&v18, "init");
  type metadata accessor for XavierScoringService(0);
  v17[3] = v8;
  v17[4] = sub_100007E78();
  v17[0] = v14;
  v15 = *(_QWORD *)(v4 + OBJC_IVAR___FRArticleNotificationFeedPersonalizerFactory_translationProvider);
  swift_unknownObjectRetain(v15);
  swift_unknownObjectRetain(a3);
  return XavierScoringService.__allocating_init(aggregateStore:configurationManager:translationProvider:todayPrivateData:)(a1, v17, v15, a3);
}

id sub_100007E14(uint64_t a1, uint64_t a2)
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)swift_getObjectType(v2, a2);
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t type metadata accessor for ArticleNotificationFeedPersonalizerFactory()
{
  return objc_opt_self(FRArticleNotificationFeedPersonalizerFactory);
}

unint64_t sub_100007E78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100029CA0;
  if (!qword_100029CA0)
  {
    v1 = type metadata accessor for ArticleNotificationPersonalizationConfigurationManager();
    result = swift_getWitnessTable("A^", v1);
    atomic_store(result, (unint64_t *)&qword_100029CA0);
  }
  return result;
}

unint64_t sub_100007EC0()
{
  unint64_t result;

  result = sub_100011684((uint64_t)&_swiftEmptyArrayStorage);
  qword_10002B320 = (uint64_t)&_swiftEmptyArrayStorage;
  *(_QWORD *)algn_10002B328 = result;
  return result;
}

uint64_t destroy for PostProcessingRequest(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return swift_bridgeObjectRelease(a1[1]);
}

_QWORD *_s32NewsNotificationServiceExtension21PostProcessingRequestVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t *assignWithCopy for PostProcessingRequest(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for PostProcessingRequest(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for PostProcessingRequest(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_bridgeObjectRelease(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for PostProcessingRequest(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PostProcessingRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PostProcessingRequest()
{
  return &type metadata for PostProcessingRequest;
}

uint64_t sub_10000808C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(void);
  void (*v17)(char *, uint64_t, uint64_t);
  id v18;
  unint64_t v19;
  id v20;
  Class isa;
  id v22;
  unint64_t v23;
  id v24;
  Class v25;
  char *v26;
  char *v27;
  id v28;
  Class v29;
  id v30;
  uint64_t v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  id v37;
  unsigned int v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v44 = a2;
  v3 = sub_100008628(&qword_100029D40);
  v42 = *(_QWORD *)(v3 - 8);
  v43 = v3;
  __chkstk_darwin(v3);
  v36 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100008628(&qword_100029D48);
  v40 = *(_QWORD *)(v5 - 8);
  v41 = v5;
  __chkstk_darwin(v5);
  v35 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100008628(&qword_100029D50);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100008628(&qword_100029D58);
  __chkstk_darwin(v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = enum case for FeatureState.disabled<A>(_:);
  v16 = *(void (**)(void))(v15 + 104);
  v33 = v13;
  v16();
  if ((objc_msgSend(a1, "respondsToSelector:", "clientSideEngagementBoostEnabled") & 1) != 0)
    v39 = objc_msgSend(a1, "clientSideEngagementBoostEnabled");
  else
    v39 = 0;
  if ((objc_msgSend(a1, "respondsToSelector:", "fallbackToReverseChronSorting") & 1) != 0)
    v38 = objc_msgSend(a1, "fallbackToReverseChronSorting");
  else
    v38 = 0;
  v37 = objc_msgSend(a1, "personalizationTreatment");
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 104);
  v34 = v10;
  v17(v10, v14, v7);
  if ((objc_msgSend(a1, "respondsToSelector:", "publisherDampeningConfig") & 1) != 0)
  {
    v18 = objc_msgSend(a1, "publisherDampeningConfig");
  }
  else
  {
    v19 = sub_10001179C((uint64_t)&_swiftEmptyArrayStorage);
    v20 = objc_allocWithZone((Class)FCPersonalizationPublisherDampeningConfig);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v19);
    v18 = objc_msgSend(v20, "initWithConfig:", isa);

  }
  if ((objc_msgSend(a1, "respondsToSelector:", "shadowPublisherDampeningConfig") & 1) != 0)
  {
    v22 = objc_msgSend(a1, "shadowPublisherDampeningConfig");
  }
  else
  {
    v23 = sub_10001179C((uint64_t)&_swiftEmptyArrayStorage);
    v24 = objc_allocWithZone((Class)FCPersonalizationPublisherDampeningConfig);
    v25 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v23);
    v22 = objc_msgSend(v24, "initWithConfig:", v25);

  }
  v26 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 104))(v35, v14, v41);
  v27 = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v42 + 104))(v36, v14, v43);
  v28 = objc_allocWithZone((Class)FCStatelessPersonalizationPublisherFavorability);
  sub_100008628(&qword_100029D60);
  v29 = Array._bridgeToObjectiveC()().super.isa;
  v30 = objc_msgSend(v28, "initWithArray:", v29);

  return Configuration.init(articleEmbeddingsScoringState:clientSideEngagementBoostEnabled:fallbackToReverseChronSorting:newsTabiPersonalizationState:personalizationTreatment:statelessPersonalizationState:extensionStatelessPersonalizationState:publisherDampeningConfig:shadowPublisherDampeningConfig:statelessPersonalizationPublisherFavorability:personalizationAnalyticsEnabled:tabiTagScoringEnabled:tabiCohortMembershipsEnabled:aggregatesInXavierEnabled:)(v33, v39, v38, v26, v37, v34, v27, v18, v22, v30, 0x1000000);
}

uint64_t type metadata accessor for ArticleNotificationPersonalizationConfigurationManager()
{
  return objc_opt_self(_TtC32NewsNotificationServiceExtension54ArticleNotificationPersonalizationConfigurationManager);
}

uint64_t sub_1000084D4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = (_QWORD *)(*v0
                + OBJC_IVAR____TtC32NewsNotificationServiceExtension54ArticleNotificationPersonalizationConfigurationManager_configurationManager);
  v2 = v1[3];
  v3 = v1[4];
  sub_1000085E4(v1, v2);
  return dispatch thunk of ConfigurationManagerType.configuration.getter(v2, v3);
}

uint64_t sub_10000852C(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = (_QWORD *)(*v1
                + OBJC_IVAR____TtC32NewsNotificationServiceExtension54ArticleNotificationPersonalizationConfigurationManager_configurationManager);
  v4 = v3[3];
  v5 = v3[4];
  sub_1000085E4(v3, v4);
  return dispatch thunk of ConfigurationManagerType.fetchConfigurationIfNeeded(cachedOnly:)(a1, v4, v5);
}

uint64_t sub_100008580(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = (_QWORD *)(*v2
                + OBJC_IVAR____TtC32NewsNotificationServiceExtension54ArticleNotificationPersonalizationConfigurationManager_configurationManager);
  v6 = v5[3];
  v7 = v5[4];
  sub_1000085E4(v5, v6);
  return dispatch thunk of ConfigurationManagerType.onChangeOfConfiguration(perform:)(a1, a2, v6, v7);
}

_QWORD *sub_1000085E4(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100008608(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100008628(uint64_t *a1)
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

id sub_100008668()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  id v16;
  objc_super v18;

  v1 = type metadata accessor for ArticleNotificationDeduper();
  v2 = swift_allocObject(v1, 24, 7);
  v3 = type metadata accessor for JSONDecoder(0);
  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  v4 = v0;
  *(_QWORD *)(v2 + 16) = JSONDecoder.init()();
  v5 = type metadata accessor for ArticleNotificationClusterIdDeduper();
  v6 = swift_allocObject(v5, 16, 7);
  v7 = type metadata accessor for UnwantedNotificationReporter(0);
  v8 = swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  swift_allocObject(v3, *(unsigned int *)(v3 + 48), *(unsigned __int16 *)(v3 + 52));
  *(_QWORD *)(v8 + 16) = JSONDecoder.init()();
  v9 = OBJC_IVAR____TtC32NewsNotificationServiceExtension28UnwantedNotificationReporter_logger;
  if (qword_100029BA0 != -1)
    swift_once(&qword_100029BA0, sub_10001AE14);
  v10 = type metadata accessor for Logger(0);
  v11 = sub_10000A404(v10, (uint64_t)qword_10002B348);
  v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8 + v9, v11, v10);
  v13 = OBJC_IVAR____TtC32NewsNotificationServiceExtension28UnwantedNotificationReporter_sharedDefaults;
  *(_QWORD *)(v8 + v13) = (id)NewsCoreUserDefaults(v12);
  v14 = sub_100008628(&qword_100029E70);
  v15 = swift_allocObject(v14, 152, 7);
  *(_OWORD *)(v15 + 16) = xmmword_10001F230;
  *(_QWORD *)(v15 + 56) = v1;
  *(_QWORD *)(v15 + 64) = &off_100025530;
  *(_QWORD *)(v15 + 32) = v2;
  *(_QWORD *)(v15 + 96) = v5;
  *(_QWORD *)(v15 + 104) = &off_100025518;
  *(_QWORD *)(v15 + 72) = v6;
  *(_QWORD *)(v15 + 136) = v7;
  *(_QWORD *)(v15 + 144) = &off_100025598;
  *(_QWORD *)(v15 + 112) = v8;
  *(_QWORD *)&v4[OBJC_IVAR___FRArticleNotificationPostProcessingCoordinator_processors] = v15;
  swift_retain(v2);
  swift_retain(v6);
  swift_retain(v8);

  v18.receiver = v4;
  v18.super_class = (Class)type metadata accessor for PostProcessingCoordinator();
  v16 = objc_msgSendSuper2(&v18, "init");
  swift_release(v8);
  swift_release(v6);
  swift_release(v2);
  return v16;
}

uint64_t sub_100008898(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 248) = a1;
  *(_QWORD *)(v2 + 256) = v1;
  return swift_task_switch(sub_1000088B0, 0, 0);
}

uint64_t sub_1000088B0()
{
  _QWORD *v0;
  _QWORD *v1;
  id v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0 + 2;
  v2 = objc_msgSend((id)objc_opt_self(UNUserNotificationCenter), "currentNotificationCenter");
  v0[33] = v2;
  v0[7] = v0 + 29;
  v0[2] = v0;
  v0[3] = sub_100008970;
  v3 = swift_continuation_init(v0 + 2, 0);
  v0[23] = _NSConcreteStackBlock;
  v4 = v0 + 23;
  v4[1] = 0x40000000;
  v4[2] = sub_10000906C;
  v4[3] = &unk_100025050;
  v4[4] = v3;
  objc_msgSend(v2, "getNotificationSettingsWithCompletionHandler:", v4);
  return swift_continuation_await(v1);
}

uint64_t sub_100008970()
{
  return swift_task_switch(sub_1000089BC, 0, 0);
}

uint64_t sub_1000089BC()
{
  _QWORD *v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0 + 10;
  v2 = (void *)v0[33];
  v0[34] = v0[29];
  v0[15] = v0 + 28;
  v0[10] = v0;
  v0[11] = sub_100008A58;
  v3 = swift_continuation_init(v0 + 10, 0);
  v0[18] = _NSConcreteStackBlock;
  v4 = v0 + 18;
  v4[1] = 0x40000000;
  v4[2] = sub_10000909C;
  v4[3] = &unk_100025068;
  v4[4] = v3;
  objc_msgSend(v2, "getDeliveredNotificationsWithCompletionHandler:", v4);
  return swift_continuation_await(v1);
}

uint64_t sub_100008A58()
{
  return swift_task_switch(sub_100008AA4, 0, 0);
}

uint64_t sub_100008AA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int8x16_t *v3;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 272);
  v2 = *(_QWORD *)(v0 + 224);
  *(_QWORD *)(v0 + 280) = v2;
  *(_QWORD *)(v0 + 240) = &_swiftEmptyArrayStorage;
  v3 = (int8x16_t *)swift_task_alloc(64);
  *(_QWORD *)(v0 + 288) = v3;
  v3[1] = vextq_s8(*(int8x16_t *)(v0 + 248), *(int8x16_t *)(v0 + 248), 8uLL);
  v3[2].i64[0] = v2;
  v3[2].i64[1] = v1;
  v3[3].i64[0] = v0 + 240;
  v4 = (_QWORD *)swift_task_alloc(async function pointer to withTaskGroup<A, B>(of:returning:isolation:body:)[1]);
  *(_QWORD *)(v0 + 296) = v4;
  *v4 = v0;
  v4[1] = sub_100008B64;
  return withTaskGroup<A, B>(of:returning:isolation:body:)();
}

uint64_t sub_100008B64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 288);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 280);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 296));
  swift_bridgeObjectRelease(v2);
  swift_task_dealloc(v1);
  return swift_task_switch(sub_100008BCC, 0, 0);
}

uint64_t sub_100008BCC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t i;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  Class isa;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37[15];

  v1 = v0[30];
  v33 = *(_QWORD *)(v1 + 16);
  if (v33)
  {
    v32 = v1 + 32;
    v30 = v0[30];
    swift_bridgeObjectRetain(v1);
    for (i = 0; i != v33; ++i)
    {
      v3 = (_QWORD *)(v32 + 16 * i);
      v4 = *v3;
      v5 = *(_QWORD *)(*v3 + 16);
      if (v5)
      {
        v36 = i;
        v6 = v3[1];
        v7 = qword_100029BA0;
        swift_bridgeObjectRetain(v4);
        v34 = v6;
        swift_bridgeObjectRetain(v6);
        if (v7 != -1)
          swift_once(&qword_100029BA0, sub_10001AE14);
        v8 = type metadata accessor for Logger(0);
        v35 = v4;
        v9 = (unint64_t *)(v4 + 40);
        do
        {
          v10 = *(v9 - 1);
          v11 = *v9;
          sub_10000A404(v8, (uint64_t)qword_10002B348);
          v12 = swift_bridgeObjectRetain_n(v11, 2);
          v13 = Logger.logObject.getter(v12);
          v14 = static os_log_type_t.default.getter();
          if (os_log_type_enabled(v13, v14))
          {
            v15 = swift_slowAlloc(12, -1);
            v16 = swift_slowAlloc(32, -1);
            v37[0] = v16;
            *(_DWORD *)v15 = 136315138;
            swift_bridgeObjectRetain(v11);
            *(_QWORD *)(v15 + 4) = sub_1000160F4(v10, v11, v37);
            swift_bridgeObjectRelease_n(v11, 3);
            _os_log_impl((void *)&_mh_execute_header, v13, v14, "Requested to remove notificationID, %s", (uint8_t *)v15, 0xCu);
            swift_arrayDestroy(v16, 1, (char *)&type metadata for Any + 8);
            swift_slowDealloc(v16, -1, -1);
            swift_slowDealloc(v15, -1, -1);
          }
          else
          {
            swift_bridgeObjectRelease_n(v11, 2);
          }

          swift_bridgeObjectRetain(v11);
          sub_10000A258(v37, v10, v11);
          swift_bridgeObjectRelease(v37[1]);
          v9 += 2;
          --v5;
        }
        while (v5);
        swift_bridgeObjectRelease(v35);
        swift_bridgeObjectRelease(v34);
        i = v36;
      }
    }
    v1 = v30;
    swift_bridgeObjectRelease(v30);
    v0 = v31;
  }
  v17 = (void *)v0[33];
  swift_bridgeObjectRetain(&_swiftEmptySetSingleton);
  v0[38] = sub_100013018(v18);
  swift_bridgeObjectRelease_n(&_swiftEmptySetSingleton, 2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v17, "removeDeliveredNotificationsWithIdentifiers:", isa);

  v20 = *(_QWORD *)(v1 + 16);
  if (v20)
  {
    swift_bridgeObjectRetain_n(v1, 2);
    v21 = v1;
    v22 = (uint64_t *)(v1 + 40);
    v23 = &_swiftEmptyDictionarySingleton;
    do
    {
      v25 = *(v22 - 1);
      v24 = *v22;
      v37[0] = (uint64_t)v23;
      swift_bridgeObjectRetain_n(v25, 2);
      swift_bridgeObjectRetain_n(v24, 2);
      swift_bridgeObjectRetain(v23);
      sub_10000ADA4(v24, v24, v37);
      swift_bridgeObjectRelease_n(v25, 2);
      swift_bridgeObjectRelease_n(v24, 2);
      swift_bridgeObjectRelease(v23);
      v23 = (void *)v37[0];
      v22 += 2;
      --v20;
    }
    while (v20);
    swift_bridgeObjectRelease_n(v21, 2);
  }
  else
  {
    v23 = &_swiftEmptyDictionarySingleton;
  }
  v0[39] = v23;
  v26 = v0[33];
  v27 = swift_task_alloc(32);
  v0[40] = v27;
  *(_QWORD *)(v27 + 16) = v23;
  *(_QWORD *)(v27 + 24) = v26;
  v28 = (_QWORD *)swift_task_alloc(async function pointer to withTaskGroup<A, B>(of:returning:isolation:body:)[1]);
  v0[41] = v28;
  *v28 = v0;
  v28[1] = sub_100008FA4;
  v37[13] = (uint64_t)&type metadata for () + 8;
  return withTaskGroup<A, B>(of:returning:isolation:body:)();
}

uint64_t sub_100008FA4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 320);
  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 328));
  swift_task_dealloc(v1);
  return swift_task_switch(sub_100009000, 0, 0);
}

uint64_t sub_100009000()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(v0 + 312);
  v2 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRelease(v1);
  v3 = *(_QWORD *)(v0 + 304);
  if (v2)
  {
    v4 = *(_QWORD *)(v3 + 16);
    swift_release(v3);
    if (!v4)
      goto LABEL_6;
  }
  else
  {
    swift_release(v3);
  }
  sleep(1u);
LABEL_6:
  v5 = *(void **)(v0 + 264);

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 240));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000906C(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  **(_QWORD **)(*(_QWORD *)(v2 + 64) + 40) = a2;
  v3 = a2;
  return swift_continuation_resume(v2);
}

uint64_t sub_10000909C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = sub_10000B854();
  **(_QWORD **)(*(_QWORD *)(v3 + 64) + 40) = static Array._unconditionallyBridgeFromObjectiveC(_:)(a2, v4);
  return swift_continuation_resume(v3);
}

uint64_t sub_1000090E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7[25] = a6;
  v7[26] = a7;
  v7[23] = a4;
  v7[24] = a5;
  v7[21] = a2;
  v7[22] = a3;
  v8 = (*(_QWORD *)(*(_QWORD *)(sub_100008628(&qword_100029DC0) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7[27] = swift_task_alloc(v8);
  v7[28] = swift_task_alloc(v8);
  v9 = sub_100008628(&qword_100029E00);
  v7[29] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v7[30] = v10;
  v7[31] = swift_task_alloc((*(_QWORD *)(v10 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100009180, 0, 0);
}

uint64_t sub_100009180()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t ObjectType;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v32;
  __int128 *v33;
  uint64_t v34;
  void *v35;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 176) + OBJC_IVAR___FRArticleNotificationPostProcessingCoordinator_processors);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = v0 + 16;
    v32 = *(_QWORD *)(*(_QWORD *)(v0 + 176) + OBJC_IVAR___FRArticleNotificationPostProcessingCoordinator_processors);
    v33 = (__int128 *)(v0 + 56);
    v4 = v1 + 32;
    swift_bridgeObjectRetain_n(v1, 2);
    do
    {
      v7 = *(_QWORD *)(v0 + 216);
      v8 = *(_QWORD *)(v0 + 224);
      v9 = *(_QWORD *)(v0 + 192);
      v34 = v2;
      v35 = *(void **)(v0 + 200);
      v10 = *(void **)(v0 + 184);
      sub_10000B6A4(v4, v3);
      v11 = type metadata accessor for TaskPriority(0);
      v12 = *(_QWORD *)(v11 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(v8, 1, 1, v11);
      sub_10000B6A4(v3, (uint64_t)v33);
      v13 = (_QWORD *)swift_allocObject(&unk_1000250F8, 96, 7);
      v13[2] = 0;
      v14 = v13 + 2;
      v13[3] = 0;
      sub_10000B72C(v33, (uint64_t)(v13 + 4));
      v13[9] = v10;
      v13[10] = v9;
      v13[11] = v35;
      sub_10000B5AC(v8, v7);
      LODWORD(v7) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11);
      v15 = v10;
      swift_bridgeObjectRetain(v9);
      v16 = v35;
      v17 = *(_QWORD *)(v0 + 216);
      if ((_DWORD)v7 == 1)
      {
        sub_10000B5F4(*(_QWORD *)(v0 + 216));
        v19 = 0;
      }
      else
      {
        v20 = TaskPriority.rawValue.getter(v16);
        (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v17, v11);
        v19 = v20;
      }
      v21 = *v14;
      if (*v14)
      {
        v22 = v13[3];
        ObjectType = swift_getObjectType(*v14, v18);
        swift_unknownObjectRetain(v21);
        v24 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v22);
        v26 = v25;
        swift_unknownObjectRelease(v21, v25);
      }
      else
      {
        v24 = 0;
        v26 = 0;
      }
      v27 = **(_QWORD **)(v0 + 168);
      v28 = swift_allocObject(&unk_100025120, 32, 7);
      *(_QWORD *)(v28 + 16) = &unk_100029E18;
      *(_QWORD *)(v28 + 24) = v13;
      v29 = v26 | v24;
      if (v26 | v24)
      {
        v29 = v0 + 96;
        *(_QWORD *)(v0 + 96) = 0;
        *(_QWORD *)(v0 + 104) = 0;
        *(_QWORD *)(v0 + 112) = v24;
        *(_QWORD *)(v0 + 120) = v26;
      }
      v3 = v0 + 16;
      v5 = *(_QWORD *)(v0 + 224);
      *(_QWORD *)(v0 + 128) = 1;
      *(_QWORD *)(v0 + 136) = v29;
      *(_QWORD *)(v0 + 144) = v27;
      v6 = swift_task_create(v19 | 0x3100, v0 + 128, &type metadata for PostProcessingRequest, &unk_100029E20, v28);
      swift_release(v6);
      sub_10000B5F4(v5);
      sub_100008608((_QWORD *)(v0 + 16));
      v4 += 40;
      v2 = v34 - 1;
    }
    while (v34 != 1);
    swift_bridgeObjectRelease_n(v32, 2);
  }
  TaskGroup.makeAsyncIterator()(**(_QWORD **)(v0 + 168), &type metadata for PostProcessingRequest);
  v30 = (_QWORD *)swift_task_alloc(async function pointer to TaskGroup.Iterator.next(isolation:)[1]);
  *(_QWORD *)(v0 + 256) = v30;
  *v30 = v0;
  v30[1] = sub_100009450;
  return TaskGroup.Iterator.next(isolation:)(v0 + 152, 0, 0, *(_QWORD *)(v0 + 232));
}

uint64_t sub_100009450()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 256));
  return swift_task_switch(sub_1000094A4, 0, 0);
}

uint64_t sub_1000094A4()
{
  uint64_t v0;
  char **v1;
  char *v2;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v4;
  unint64_t v5;
  __int128 v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char **v12;
  char **v13;
  char *v14;
  __int128 v15;

  if (*(_QWORD *)(v0 + 152))
  {
    v15 = *(_OWORD *)(v0 + 152);
    v1 = *(char ***)(v0 + 208);
    v2 = *v1;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v1);
    *v1 = v2;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v12 = *(char ***)(v0 + 208);
      v2 = sub_1000119C8(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
      *v12 = v2;
    }
    v5 = *((_QWORD *)v2 + 2);
    v4 = *((_QWORD *)v2 + 3);
    v6 = v15;
    if (v5 >= v4 >> 1)
    {
      v13 = *(char ***)(v0 + 208);
      v14 = sub_1000119C8((char *)(v4 > 1), v5 + 1, 1, v2);
      v6 = v15;
      v2 = v14;
      *v13 = v14;
    }
    *((_QWORD *)v2 + 2) = v5 + 1;
    *(_OWORD *)&v2[16 * v5 + 32] = v6;
    v7 = (_QWORD *)swift_task_alloc(async function pointer to TaskGroup.Iterator.next(isolation:)[1]);
    *(_QWORD *)(v0 + 256) = v7;
    *v7 = v0;
    v7[1] = sub_100009450;
    return TaskGroup.Iterator.next(isolation:)(v0 + 152, 0, 0, *(_QWORD *)(v0 + 232));
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 248);
    v10 = *(_QWORD *)(v0 + 224);
    v11 = *(_QWORD *)(v0 + 216);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 240) + 8))(v9, *(_QWORD *)(v0 + 232));
    swift_task_dealloc(v9);
    swift_task_dealloc(v10);
    swift_task_dealloc(v11);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_100009600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  return swift_task_switch(sub_100009620, 0, 0);
}

uint64_t sub_100009620()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;
  int *v7;

  v1 = (_QWORD *)v0[3];
  v2 = v1[3];
  v3 = v1[4];
  sub_1000085E4(v1, v2);
  v4 = *(int **)(v3 + 8);
  v7 = (int *)((char *)v4 + *v4);
  v5 = (_QWORD *)swift_task_alloc(v4[1]);
  v0[7] = v5;
  *v5 = v0;
  v5[1] = sub_1000096A4;
  return ((uint64_t (*)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))v7)(v0[4], v0[5], v0[6], v2, v3);
}

uint64_t sub_1000096A4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 56);
  *(_QWORD *)(v3 + 64) = a1;
  *(_QWORD *)(v3 + 72) = a2;
  swift_task_dealloc(v4);
  return swift_task_switch(sub_100009700, 0, 0);
}

uint64_t sub_100009700()
{
  uint64_t v0;

  *(_OWORD *)*(_QWORD *)(v0 + 16) = *(_OWORD *)(v0 + 64);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[3] = a3;
  v4[4] = a4;
  v4[2] = a2;
  return swift_task_switch(sub_100009730, 0, 0);
}

uint64_t sub_100009730()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t *v3;
  id v4;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(void **)(v0 + 32);
  v3 = *(uint64_t **)(v0 + 16);
  swift_bridgeObjectRetain(v1);
  v4 = v2;
  sub_10000B130(v1, v1, v3, v4);

  swift_bridgeObjectRelease(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000097A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[17] = a6;
  v7[18] = a7;
  v7[15] = a4;
  v7[16] = a5;
  return swift_task_switch(sub_1000097C0, 0, 0);
}

uint64_t sub_1000097C0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  NSString v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = v0 + 2;
  v2 = v0[18];
  v3 = (void *)v0[15];
  v4 = String._bridgeToObjectiveC()();
  v0[19] = v4;
  v0[2] = v0;
  v0[3] = sub_10000986C;
  v5 = swift_continuation_init(v0 + 2, 1);
  v0[10] = _NSConcreteStackBlock;
  v6 = v0 + 10;
  v6[1] = 0x40000000;
  v6[2] = sub_100009B7C;
  v6[3] = &unk_1000250D0;
  v6[4] = v5;
  objc_msgSend(v3, "replaceContentForRequestWithIdentifier:replacementContent:completionHandler:", v4, v2, v6);
  return swift_continuation_await(v1);
}

uint64_t sub_10000986C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)();

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 48);
  *(_QWORD *)(*(_QWORD *)v0 + 160) = v1;
  if (v1)
    v2 = sub_1000098FC;
  else
    v2 = sub_1000098CC;
  return swift_task_switch(v2, 0, 0);
}

uint64_t sub_1000098CC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000098FC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __n128 v5;
  __n128 v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  __n128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v1 = *(void **)(v0 + 152);
  swift_willThrow();

  if (qword_100029BA0 != -1)
    swift_once(&qword_100029BA0, sub_10001AE14);
  v2 = *(_QWORD *)(v0 + 160);
  v3 = *(_QWORD *)(v0 + 136);
  v4 = type metadata accessor for Logger(0);
  sub_10000A404(v4, (uint64_t)qword_10002B348);
  v5 = swift_bridgeObjectRetain(v3);
  swift_errorRetain(v2, v5);
  v6 = swift_bridgeObjectRetain(v3);
  v7 = swift_errorRetain(v2, v6);
  v8 = Logger.logObject.getter(v7);
  v9 = static os_log_type_t.error.getter();
  v10 = os_log_type_enabled(v8, v9);
  v11 = *(_QWORD *)(v0 + 160);
  v12 = *(_QWORD *)(v0 + 136);
  if (v10)
  {
    v13 = *(_QWORD *)(v0 + 128);
    v14 = swift_slowAlloc(22, -1);
    v15 = (uint64_t *)swift_slowAlloc(8, -1);
    v20 = swift_slowAlloc(32, -1);
    v21 = v20;
    *(_DWORD *)v14 = 136446466;
    swift_bridgeObjectRetain(v12);
    *(_QWORD *)(v0 + 80) = sub_1000160F4(v13, v12, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease_n(v12, 3);
    *(_WORD *)(v14 + 12) = 2114;
    swift_errorRetain(v11, v16);
    v17 = _swift_stdlib_bridgeErrorToNSError(v11);
    *(_QWORD *)(v0 + 80) = v17;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 80, v0 + 88, v14 + 14, v14 + 22);
    *v15 = v17;
    swift_errorRelease(v11);
    swift_errorRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "Error replacing content for notificationID (key: %{public}s), error: %{public}@", (uint8_t *)v14, 0x16u);
    v18 = sub_100008628(&qword_100029DE8);
    swift_arrayDestroy(v15, 1, v18);
    swift_slowDealloc(v15, -1, -1);
    swift_arrayDestroy(v20, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    swift_errorRelease(v11);
  }
  else
  {
    swift_errorRelease(*(_QWORD *)(v0 + 160));
    swift_bridgeObjectRelease_n(v12, 2);
    swift_errorRelease(v11);
    swift_errorRelease(v11);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009B7C(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (!a2)
    return swift_continuation_throwingResume(*(_QWORD *)(a1 + 32));
  v4 = sub_100008628(&qword_100029DF0);
  v5 = swift_allocError(v4, &protocol self-conformance witness table for Error, 0, 0);
  *v6 = a2;
  v7 = a2;
  return swift_continuation_throwingResumeWithError(v2, v5);
}

uint64_t sub_100009D20(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD *v9;

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v6 = dword_100029D9C;
  v7 = a1;
  v8 = a3;
  v9 = (_QWORD *)swift_task_alloc(v6);
  v3[5] = v9;
  *v9 = v3;
  v9[1] = sub_100009DB0;
  v9[31] = v7;
  v9[32] = v8;
  return swift_task_switch(sub_1000088B0, 0, 0);
}

uint64_t sub_100009DB0()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  void *v3;
  uint64_t v5;

  v1 = *(void (***)(_QWORD))(*v0 + 32);
  v3 = *(void **)(*v0 + 16);
  v2 = *(void **)(*v0 + 24);
  v5 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 40));

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v5 + 8))();
}

id sub_100009E20()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PostProcessingCoordinator();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PostProcessingCoordinator()
{
  return objc_opt_self(FRArticleNotificationPostProcessingCoordinator);
}

uint64_t sub_100009E80(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v6 = v2[2];
  v7 = v2[3];
  v8 = v2[4];
  v9 = v2[5];
  v10 = v2[6];
  v11 = (_QWORD *)swift_task_alloc(dword_100029DA4);
  *(_QWORD *)(v3 + 16) = v11;
  *v11 = v3;
  v11[1] = sub_100009F10;
  return sub_1000090E0(a1, a2, v6, v7, v8, v9, v10);
}

uint64_t sub_100009F10()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100009F58(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_100009FBC;
  return v6(a1);
}

uint64_t sub_100009FBC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000A008(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc(a3[1]);
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_10000BAD0;
  return v6();
}

uint64_t sub_10000A05C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc(a4[1]);
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_10000BAD0;
  return v7();
}

uint64_t sub_10000A0B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD v21[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_10000B5F4(a1);
    v10 = 7168;
    v11 = *(_QWORD *)(a3 + 16);
    if (v11)
    {
LABEL_3:
      v12 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v11, v9);
      swift_unknownObjectRetain(v11);
      v14 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v12);
      v16 = v15;
      swift_unknownObjectRelease(v11, v15);
      goto LABEL_6;
    }
  }
  else
  {
    v17 = TaskPriority.rawValue.getter(v8);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v10 = v17 | 0x1C00;
    v11 = *(_QWORD *)(a3 + 16);
    if (v11)
      goto LABEL_3;
  }
  v14 = 0;
  v16 = 0;
LABEL_6:
  v18 = swift_allocObject(&unk_1000251C0, 32, 7);
  *(_QWORD *)(v18 + 16) = a2;
  *(_QWORD *)(v18 + 24) = a3;
  if (v16 | v14)
  {
    v21[0] = 0;
    v21[1] = 0;
    v19 = v21;
    v21[2] = v14;
    v21[3] = v16;
  }
  else
  {
    v19 = 0;
  }
  return swift_task_create(v10, v19, (char *)&type metadata for () + 8, &unk_100029E68, v18);
}

uint64_t sub_10000A1F4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000BAD4;
  return v6(a1);
}

uint64_t sub_10000A258(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  _QWORD v24[9];

  v7 = *v3;
  Hasher.init(_seed:)(v24, *(_QWORD *)(*v3 + 40));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = v12[1];
    v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v19 = (_QWORD *)(v11 + 16 * v10);
      v20 = v19[1];
      v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0) & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain(a3);
  sub_10000A6F8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10000A404(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

Swift::Int sub_10000A41C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100008628(&qword_100029DF8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v32 = v2;
    v33 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v3 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = v5 + 56;
    result = swift_retain(v3);
    v13 = 0;
    while (1)
    {
      if (v9)
      {
        v16 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v18 >= v10)
          goto LABEL_36;
        v19 = v33[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v10)
            goto LABEL_36;
          v19 = v33[v13];
          if (!v19)
          {
            v13 = v18 + 2;
            if (v18 + 2 >= v10)
              goto LABEL_36;
            v19 = v33[v13];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v10)
              {
LABEL_36:
                swift_release(v3);
                v2 = v32;
                v31 = 1 << *(_BYTE *)(v3 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v19 = v33[v20];
              if (!v19)
              {
                while (1)
                {
                  v13 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_42;
                  if (v13 >= v10)
                    goto LABEL_36;
                  v19 = v33[v13];
                  ++v20;
                  if (v19)
                    goto LABEL_26;
                }
              }
              v13 = v20;
            }
          }
        }
LABEL_26:
        v9 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
      v22 = *v21;
      v23 = v21[1];
      Hasher.init(_seed:)(v34, *(_QWORD *)(v6 + 40));
      String.hash(into:)(v34, v22, v23);
      result = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        v14 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
      *v15 = v22;
      v15[1] = v23;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  result = swift_release(v3);
  *v2 = v6;
  return result;
}

uint64_t sub_10000A6F8(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _QWORD v28[9];

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_10000A41C(v11);
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_10000A890();
      goto LABEL_22;
    }
    sub_10000AA40(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v28, *(_QWORD *)(*v4 + 40));
  String.hash(into:)(v28, v8, a2);
  result = Hasher._finalize()();
  v13 = -1 << *(_BYTE *)(v12 + 32);
  a3 = result & ~v13;
  v14 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v15 = *(_QWORD *)(v12 + 48);
    v16 = (_QWORD *)(v15 + 16 * a3);
    v17 = v16[1];
    v18 = *v16 == v8 && v17 == a2;
    if (v18 || (result = _stringCompareWithSmolCheck(_:_:expecting:)(*v16, v17, v8, a2, 0), (result & 1) != 0))
    {
LABEL_21:
      result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v19 = ~v13;
      while (1)
      {
        a3 = (a3 + 1) & v19;
        if (((*(_QWORD *)(v14 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v20 = (_QWORD *)(v15 + 16 * a3);
        v21 = v20[1];
        if (*v20 != v8 || v21 != a2)
        {
          result = _stringCompareWithSmolCheck(_:_:expecting:)(*v20, v21, v8, a2, 0);
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v23 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v24 = (uint64_t *)(*(_QWORD *)(v23 + 48) + 16 * a3);
  *v24 = v8;
  v24[1] = a2;
  v25 = *(_QWORD *)(v23 + 16);
  v26 = __OFADD__(v25, 1);
  v27 = v25 + 1;
  if (v26)
    __break(1u);
  else
    *(_QWORD *)(v23 + 16) = v27;
  return result;
}

void *sub_10000A890()
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
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100008628(&qword_100029DF8);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain(v18);
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

Swift::Int sub_10000AA40(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  Swift::Int result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  int64_t v32;
  _QWORD v33[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_100008628(&qword_100029DF8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    result = swift_release(v3);
LABEL_38:
    *v2 = v6;
    return result;
  }
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v31 = v2;
  v32 = (unint64_t)(v7 + 63) >> 6;
  v11 = v5 + 56;
  result = swift_retain(v3);
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_27;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v18 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v18);
    ++v13;
    if (!v19)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v32)
        goto LABEL_36;
      v19 = *(_QWORD *)(v8 + 8 * v13);
      if (!v19)
      {
        v13 = v18 + 2;
        if (v18 + 2 >= v32)
          goto LABEL_36;
        v19 = *(_QWORD *)(v8 + 8 * v13);
        if (!v19)
          break;
      }
    }
LABEL_26:
    v10 = (v19 - 1) & v19;
    v17 = __clz(__rbit64(v19)) + (v13 << 6);
LABEL_27:
    v21 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v17);
    v22 = *v21;
    v23 = v21[1];
    Hasher.init(_seed:)(v33, *(_QWORD *)(v6 + 40));
    swift_bridgeObjectRetain(v23);
    String.hash(into:)(v33, v22, v23);
    result = Hasher._finalize()();
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v26);
      }
      while (v30 == -1);
      v14 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v14);
    *v15 = v22;
    v15[1] = v23;
    ++*(_QWORD *)(v6 + 16);
  }
  v20 = v18 + 3;
  if (v20 >= v32)
  {
LABEL_36:
    result = swift_release_n(v3, 2);
    v2 = v31;
    goto LABEL_38;
  }
  v19 = *(_QWORD *)(v8 + 8 * v20);
  if (v19)
  {
    v13 = v20;
    goto LABEL_26;
  }
  while (1)
  {
    v13 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v13 >= v32)
      goto LABEL_36;
    v19 = *(_QWORD *)(v8 + 8 * v13);
    ++v20;
    if (v19)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10000ACEC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 32) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 40) = v3;
  *v3 = v2;
  v3[1] = sub_10000AD54;
  return v5(v2 + 16);
}

uint64_t sub_10000AD54()
{
  uint64_t *v0;
  uint64_t v1;
  _OWORD *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_OWORD **)(*v0 + 32);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 40));
  *v2 = *(_OWORD *)(v1 + 16);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_10000ADA4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  id v22;
  id v23;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  char v26;
  unint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  char v33;
  _QWORD *v34;
  uint64_t v35;
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  BOOL v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t result;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  _QWORD *v48;

  v3 = a3;
  v5 = a1;
  v6 = a1 + 64;
  v7 = 1 << *(_BYTE *)(a1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a1 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  v11 = 0;
  v47 = swift_bridgeObjectRetain(a1);
  v44 = v6;
  v45 = a2;
  v43 = v10;
  while (1)
  {
    while (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v11 << 6);
      if (*(_QWORD *)(a2 + 16))
      {
LABEL_24:
        v17 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v13);
        v19 = *v17;
        v18 = v17[1];
        swift_bridgeObjectRetain_n(v18, 2);
        v20 = sub_100011BE0(v19, v18);
        if ((v21 & 1) != 0)
        {
          v22 = *(id *)(*(_QWORD *)(a2 + 56) + 8 * v20);
          swift_bridgeObjectRelease(v18);
          v23 = v22;
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
          v25 = *v3;
          v48 = (_QWORD *)*v3;
          *v3 = 0x8000000000000000;
          v27 = sub_100011BE0(v19, v18);
          v28 = *(_QWORD *)(v25 + 16);
          v29 = (v26 & 1) == 0;
          v30 = v28 + v29;
          if (__OFADD__(v28, v29))
            goto LABEL_39;
          v31 = v26;
          if (*(_QWORD *)(v25 + 24) >= v30)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) != 0)
            {
              v34 = v48;
              if ((v26 & 1) != 0)
                goto LABEL_32;
            }
            else
            {
              sub_1000127C4();
              v34 = v48;
              if ((v31 & 1) != 0)
                goto LABEL_32;
            }
          }
          else
          {
            sub_100011E18(v30, isUniquelyReferenced_nonNull_native);
            v32 = sub_100011BE0(v19, v18);
            if ((v31 & 1) != (v33 & 1))
              goto LABEL_42;
            v27 = v32;
            v34 = v48;
            if ((v31 & 1) != 0)
            {
LABEL_32:
              v35 = v34[7];
              v36 = *(void **)(v35 + 8 * v27);
              *(_QWORD *)(v35 + 8 * v27) = v23;
              goto LABEL_36;
            }
          }
          v34[(v27 >> 6) + 8] |= 1 << v27;
          v37 = (uint64_t *)(v34[6] + 16 * v27);
          *v37 = v19;
          v37[1] = v18;
          *(_QWORD *)(v34[7] + 8 * v27) = v23;
          v38 = v34[2];
          v39 = __OFADD__(v38, 1);
          v40 = v38 + 1;
          if (v39)
            goto LABEL_40;
          v34[2] = v40;
          swift_bridgeObjectRetain(v18);
          v36 = 0;
LABEL_36:
          v3 = a3;
          v41 = *a3;
          *a3 = v34;
          swift_bridgeObjectRelease(v18);

          swift_bridgeObjectRelease(v41);
          v5 = v47;
          v6 = v44;
          a2 = v45;
          v10 = v43;
        }
        else
        {
          swift_bridgeObjectRelease_n(v18, 2);
        }
      }
    }
    v14 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
LABEL_39:
      __break(1u);
LABEL_40:
      __break(1u);
      goto LABEL_41;
    }
    if (v14 >= v10)
      return swift_release(v5);
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v11;
    if (!v15)
    {
      v11 = v14 + 1;
      if (v14 + 1 >= v10)
        return swift_release(v5);
      v15 = *(_QWORD *)(v6 + 8 * v11);
      if (!v15)
      {
        v11 = v14 + 2;
        if (v14 + 2 >= v10)
          return swift_release(v5);
        v15 = *(_QWORD *)(v6 + 8 * v11);
        if (!v15)
        {
          v11 = v14 + 3;
          if (v14 + 3 >= v10)
            return swift_release(v5);
          v15 = *(_QWORD *)(v6 + 8 * v11);
          if (!v15)
            break;
        }
      }
    }
LABEL_23:
    v9 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v11 << 6);
    if (*(_QWORD *)(a2 + 16))
      goto LABEL_24;
  }
  v16 = v14 + 4;
  if (v16 >= v10)
    return swift_release(v5);
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v11 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v11 >= v10)
      return swift_release(v5);
    v15 = *(_QWORD *)(v6 + 8 * v11);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_41:
  __break(1u);
LABEL_42:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_10000B0C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  __int128 v6;

  v5 = swift_task_alloc(dword_100029DB4);
  v6 = *(_OWORD *)(v2 + 16);
  *(_QWORD *)(v3 + 16) = v5;
  *(_QWORD *)v5 = v3;
  *(_QWORD *)(v5 + 8) = sub_10000BAD0;
  *(_OWORD *)(v5 + 24) = v6;
  *(_QWORD *)(v5 + 16) = a2;
  return swift_task_switch(sub_100009730, 0, 0);
}

void sub_10000B130(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  id v33;
  void *v34;
  int v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  unsigned __int8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t ObjectType;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  uint64_t *v57;
  void *v58;
  id v59;
  unint64_t v60;
  int64_t v61;
  _QWORD v62[3];
  _QWORD v63[4];
  uint64_t v64;

  v57 = a3;
  v58 = a4;
  v6 = sub_100008628(&qword_100029DC0);
  v7 = __chkstk_darwin(v6);
  v9 = (char *)&v50 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v64 = (uint64_t)&v50 - v10;
  v11 = a1 + 64;
  v12 = 1 << *(_BYTE *)(a1 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(a1 + 64);
  v15 = (unint64_t)(v12 + 63) >> 6;
  swift_bridgeObjectRetain(a1);
  v16 = 0;
  v55 = a2;
  v56 = (char *)&type metadata for () + 8;
  v53 = v15;
  v54 = v9;
  v51 = a1 + 64;
  v52 = a1;
  while (1)
  {
    while (v14)
    {
      v17 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v18 = v17 | (v16 << 6);
      if (*(_QWORD *)(a2 + 16))
        goto LABEL_25;
    }
    v19 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v15)
      goto LABEL_35;
    v20 = *(_QWORD *)(v11 + 8 * v19);
    ++v16;
    if (!v20)
    {
      v16 = v19 + 1;
      if (v19 + 1 >= v15)
        goto LABEL_35;
      v20 = *(_QWORD *)(v11 + 8 * v16);
      if (!v20)
      {
        v16 = v19 + 2;
        if (v19 + 2 >= v15)
          goto LABEL_35;
        v20 = *(_QWORD *)(v11 + 8 * v16);
        if (!v20)
        {
          v16 = v19 + 3;
          if (v19 + 3 >= v15)
            goto LABEL_35;
          v20 = *(_QWORD *)(v11 + 8 * v16);
          if (!v20)
            break;
        }
      }
    }
LABEL_24:
    v14 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v16 << 6);
    if (*(_QWORD *)(a2 + 16))
    {
LABEL_25:
      v22 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v18);
      v24 = *v22;
      v23 = v22[1];
      swift_bridgeObjectRetain_n(v23, 2);
      v25 = sub_100011BE0(v24, v23);
      if ((v26 & 1) != 0)
      {
        v60 = v14;
        v61 = v16;
        v59 = *(id *)(*(_QWORD *)(a2 + 56) + 8 * v25);
        swift_bridgeObjectRelease(v23);
        v27 = type metadata accessor for TaskPriority(0);
        v28 = *(_QWORD *)(v27 - 8);
        v29 = v64;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v28 + 56))(v64, 1, 1, v27);
        v30 = (uint64_t)v9;
        v31 = (_QWORD *)swift_allocObject(&unk_100025090, 64, 7);
        v31[2] = 0;
        v32 = v31 + 2;
        v34 = v58;
        v33 = v59;
        v31[3] = 0;
        v31[4] = v34;
        v31[5] = v24;
        v31[6] = v23;
        v31[7] = v33;
        sub_10000B5AC(v29, v30);
        v35 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v28 + 48))(v30, 1, v27);
        swift_bridgeObjectRetain(v23);
        v36 = v34;
        if (v35 == 1)
        {
          sub_10000B5F4(v30);
          v38 = 0;
        }
        else
        {
          v39 = TaskPriority.rawValue.getter(v36);
          (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v30, v27);
          v38 = v39;
        }
        v11 = v51;
        a1 = v52;
        v40 = *v32;
        if (*v32)
        {
          v41 = v31[3];
          ObjectType = swift_getObjectType(*v32, v37);
          swift_unknownObjectRetain(v40);
          v43 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v41);
          v45 = v44;
          swift_unknownObjectRelease(v40, v44);
        }
        else
        {
          v43 = 0;
          v45 = 0;
        }
        v15 = v53;
        v46 = *v57;
        v47 = swift_allocObject(&unk_1000250B8, 32, 7);
        *(_QWORD *)(v47 + 16) = &unk_100029DD0;
        *(_QWORD *)(v47 + 24) = v31;
        v48 = (_QWORD *)(v45 | v43);
        if (v45 | v43)
        {
          v63[0] = 0;
          v63[1] = 0;
          v48 = v63;
          v63[2] = v43;
          v63[3] = v45;
        }
        v9 = v54;
        a2 = v55;
        v62[0] = 1;
        v62[1] = v48;
        v62[2] = v46;
        v49 = swift_task_create(v38 | 0x3100, v62, v56, &unk_100029DE0, v47);
        swift_release(v49);
        sub_10000B5F4(v64);
        v14 = v60;
        v16 = v61;
      }
      else
      {
        swift_bridgeObjectRelease(v23);
      }
      swift_bridgeObjectRelease(v23);
    }
  }
  v21 = v19 + 4;
  if (v21 >= v15)
  {
LABEL_35:
    swift_release(a1);
    return;
  }
  v20 = *(_QWORD *)(v11 + 8 * v21);
  if (v20)
  {
    v16 = v21;
    goto LABEL_24;
  }
  while (1)
  {
    v16 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v16 >= v15)
      goto LABEL_35;
    v20 = *(_QWORD *)(v11 + 8 * v16);
    ++v21;
    if (v20)
      goto LABEL_24;
  }
LABEL_37:
  __break(1u);
}

uint64_t sub_10000B500(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectRelease(*(_QWORD *)(v2 + 16), a2);

  swift_bridgeObjectRelease(*(_QWORD *)(v2 + 48));
  return swift_deallocObject(v2, 64, 7);
}

uint64_t sub_10000B53C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = swift_task_alloc(dword_100029DCC);
  v5 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_10000BAD0;
  *(_OWORD *)(v4 + 136) = v5;
  *(_QWORD *)(v4 + 120) = v2;
  *(_QWORD *)(v4 + 128) = v3;
  return swift_task_switch(sub_1000097C0, 0, 0);
}

uint64_t sub_10000B5AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100008628(&qword_100029DC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B5F4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100008628(&qword_100029DC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000B634(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100029DDC);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000BAD0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100029DD8 + dword_100029DD8))(a1, v4);
}

uint64_t sub_10000B6A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B6E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectRelease(*(_QWORD *)(v2 + 16), a2);
  sub_100008608((_QWORD *)(v2 + 32));

  swift_bridgeObjectRelease(*(_QWORD *)(v2 + 80));
  return swift_deallocObject(v2, 96, 7);
}

uint64_t sub_10000B72C(__int128 *a1, uint64_t a2)
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

uint64_t sub_10000B744(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v4 = *(_QWORD *)(v1 + 88);
  v5 = swift_task_alloc(dword_100029E0C);
  v6 = *(_OWORD *)(v1 + 72);
  *(_QWORD *)(v2 + 16) = v5;
  *(_QWORD *)v5 = v2;
  *(_QWORD *)(v5 + 8) = sub_10000BAD0;
  *(_QWORD *)(v5 + 48) = v4;
  *(_OWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = v1 + 32;
  return swift_task_switch(sub_100009620, 0, 0);
}

uint64_t sub_10000B7C0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000B7E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100029E14);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100009F10;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100029E10 + dword_100029E10))(a1, v4);
}

unint64_t sub_10000B854()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100029E28;
  if (!qword_100029E28)
  {
    v1 = objc_opt_self(UNNotification);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100029E28);
  }
  return result;
}

uint64_t sub_10000B890()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000B8C4()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc(dword_100029E34);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10000BAD0;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_100029E30 + dword_100029E30))(v2, v3, v4);
}

uint64_t sub_10000B934()
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
  v5 = (_QWORD *)swift_task_alloc(dword_100029E44);
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_10000BAD0;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_100029E40 + dword_100029E40))(v2, v3, v4);
}

uint64_t sub_10000B9B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectRelease(*(_QWORD *)(v2 + 16), a2);
  swift_release(*(_QWORD *)(v2 + 40));
  return swift_deallocObject(v2, 48, 7);
}

uint64_t sub_10000B9DC(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_100029E54);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000BAD0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_100029E50 + dword_100029E50))(a1, v4, v5, v6);
}

uint64_t sub_10000BA60(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100029E64);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000BAD0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100029E60 + dword_100029E60))(a1, v4);
}

uint64_t sub_10000BAE0(char a1)
{
  if ((a1 & 1) != 0)
    return 1937204590;
  else
    return 7565409;
}

BOOL sub_10000BB08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10000BB20()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000BB64()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000BB8C(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_10000BBCC()
{
  char *v0;

  return sub_10000BAE0(*v0);
}

uint64_t sub_10000BBD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10000DF08(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10000BBF8()
{
  return 0;
}

void sub_10000BC04(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000BC10(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000E340();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000BC38(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000E340();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000BC60(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;
  unint64_t v14;
  unint64_t v15;
  _OWORD v17[20];
  char v18;

  v3 = v1;
  v5 = sub_100008628(&qword_100029EC0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_1000085E4(a1, v9);
  v11 = sub_10000E340();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for UserInfoArticle.CodingKeys, &type metadata for UserInfoArticle.CodingKeys, v11, v9, v10);
  v12 = *(_OWORD *)(v3 + 48);
  v17[2] = *(_OWORD *)(v3 + 32);
  v17[3] = v12;
  v17[4] = *(_OWORD *)(v3 + 64);
  *(_QWORD *)&v17[5] = *(_QWORD *)(v3 + 80);
  v13 = *(_OWORD *)(v3 + 16);
  v17[0] = *(_OWORD *)v3;
  v17[1] = v13;
  v18 = 0;
  v14 = sub_10000E67C();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v17, &v18, v5, &type metadata for APS, v14);
  if (!v2)
  {
    memcpy(v17, (const void *)(v3 + 88), 0x131uLL);
    v18 = 1;
    v15 = sub_10000E6C0();
    KeyedEncodingContainer.encode<A>(_:forKey:)(v17, &v18, v5, &type metadata for NewsSingleArticle, v15);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void *sub_10000BDD0@<X0>(_QWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  void *result;
  _BYTE v5[400];

  result = sub_10000DFD0(a1, v5);
  if (!v2)
    return memcpy(a2, v5, 0x189uLL);
  return result;
}

uint64_t sub_10000BE20(_QWORD *a1)
{
  return sub_10000BC60(a1);
}

uint64_t sub_10000BE34(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
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
  uint64_t v41;
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
  uint64_t v54;
  char v55[8];
  _BYTE v56[8];
  _BYTE v57[8];

  v3 = v1;
  v5 = sub_100008628(&qword_100029F20);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v55[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v9 = a1[3];
  v10 = a1[4];
  sub_1000085E4(a1, v9);
  v11 = sub_100010080();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for NewsSingleArticle.CodingKeys, &type metadata for NewsSingleArticle.CodingKeys, v11, v9, v10);
  v12 = *v3;
  v13 = v3[1];
  v55[0] = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v12, v13, v55, v5);
  if (!v2)
  {
    v14 = v3[2];
    v15 = v3[3];
    v55[0] = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v14, v15, v55, v5);
    v16 = v3[4];
    v17 = v3[5];
    v55[0] = 2;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v16, v17, v55, v5);
    v18 = v3[6];
    v19 = *((unsigned __int8 *)v3 + 56);
    v55[0] = 3;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v18, v19, v55, v5);
    v20 = v3[8];
    v21 = *((unsigned __int8 *)v3 + 72);
    v55[0] = 4;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v20, v21, v55, v5);
    v22 = v3[10];
    v23 = *((unsigned __int8 *)v3 + 88);
    v55[0] = 5;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v22, v23, v55, v5);
    v24 = v3[12];
    v25 = *((unsigned __int8 *)v3 + 104);
    v55[0] = 6;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v24, v25, v55, v5);
    v26 = v3[14];
    v27 = *((unsigned __int8 *)v3 + 120);
    v55[0] = 7;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v26, v27, v55, v5);
    sub_1000102E8((uint64_t)(v3 + 16), (uint64_t)v57, &qword_100029F28);
    sub_1000102E8((uint64_t)v57, (uint64_t)v55, &qword_100029F28);
    HIBYTE(v54) = 8;
    v28 = sub_100008628(&qword_100029F00);
    v29 = sub_10001032C(&qword_100029F30, &qword_100029F00, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v55, (char *)&v54 + 7, v5, v28, v29);
    sub_1000102E8((uint64_t)(v3 + 17), (uint64_t)v56, &qword_100029F38);
    sub_1000102E8((uint64_t)v56, (uint64_t)v55, &qword_100029F38);
    HIBYTE(v54) = 9;
    v30 = sub_100008628(&qword_100029F10);
    v31 = sub_10001032C(&qword_100029F40, &qword_100029F10, (uint64_t)&protocol witness table for Double, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)(v55, (char *)&v54 + 7, v5, v30, v31);
    v32 = v3[18];
    v33 = v3[19];
    v55[0] = 10;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v32, v33, v55, v5);
    v34 = v3[20];
    v35 = *((unsigned __int8 *)v3 + 168);
    v55[0] = 11;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v34, v35, v55, v5);
    v36 = v3[22];
    v37 = v3[23];
    v55[0] = 12;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v36, v37, v55, v5);
    v38 = v3[24];
    v39 = v3[25];
    v55[0] = 13;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v38, v39, v55, v5);
    v40 = v3[26];
    v41 = v3[27];
    v55[0] = 14;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v40, v41, v55, v5);
    v42 = v3[28];
    v43 = v3[29];
    v55[0] = 15;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v42, v43, v55, v5);
    v44 = v3[30];
    v45 = v3[31];
    v55[0] = 16;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v44, v45, v55, v5);
    v46 = v3[32];
    v47 = v3[33];
    v55[0] = 17;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v46, v47, v55, v5);
    v48 = v3[34];
    v49 = v3[35];
    v55[0] = 18;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v48, v49, v55, v5);
    v50 = v3[36];
    v51 = v3[37];
    v55[0] = 19;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v50, v51, v55, v5);
    v52 = *((unsigned __int8 *)v3 + 304);
    v55[0] = 20;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v52, v55, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

void sub_10000C320(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_10000C364()
{
  return ((uint64_t (*)(_QWORD))static String._unconditionallyBridgeFromObjectiveC(_:))(FCNotificationPayloadArticleIDKey);
}

uint64_t sub_10000C460(char *a1, char *a2)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  char v11;

  v2 = *a2;
  sub_10000C320(*a1);
  v4 = v3;
  v6 = v5;
  sub_10000C320(v2);
  if (v4 == v7 && v6 == v8)
  {
    v11 = 1;
    v10 = v6;
  }
  else
  {
    v10 = v8;
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v6, v7, v8, 0);
  }
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v10);
  return v11 & 1;
}

Swift::Int sub_10000C4E8()
{
  char *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  v1 = *v0;
  Hasher.init(_seed:)(v6, 0);
  sub_10000C320(v1);
  v3 = v2;
  String.hash(into:)(v6, v4, v2);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_10000C548(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_10000C320(*v1);
  v4 = v3;
  String.hash(into:)(a1, v5, v3);
  return swift_bridgeObjectRelease(v4);
}

Swift::Int sub_10000C588(uint64_t a1)
{
  char *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v2 = *v1;
  Hasher.init(_seed:)(v7, a1);
  sub_10000C320(v2);
  v4 = v3;
  String.hash(into:)(v7, v5, v3);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_10000C5E4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t result;

  result = sub_1000105C4(*a1, a1[1]);
  *a2 = result;
  return result;
}

void sub_10000C610(_QWORD *a1@<X8>)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;

  sub_10000C320(*v1);
  *a1 = v3;
  a1[1] = v4;
}

void sub_10000C638()
{
  char *v0;

  sub_10000C320(*v0);
}

uint64_t sub_10000C640@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100010E7C(a1, a2);
  *a3 = result;
  return result;
}

void sub_10000C664(_BYTE *a1@<X8>)
{
  *a1 = 21;
}

uint64_t sub_10000C670(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100010080();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000C698(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100010080();
  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10000C6C0@<X0>(_QWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  void *result;
  _BYTE __src[312];

  result = sub_10000F044(a1, __src);
  if (!v2)
    return memcpy(a2, __src, 0x131uLL);
  return result;
}

uint64_t sub_10000C710(_QWORD *a1)
{
  const void *v1;
  _BYTE __dst[305];

  memcpy(__dst, v1, sizeof(__dst));
  return sub_10000BE34(a1);
}

void sub_10000C760(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t inited;
  unint64_t v10;
  Class isa;
  _QWORD v12[4];
  _BYTE v13[40];
  _BYTE v14[104];

  sub_10000D5EC(a2, (uint64_t)v13);
  v4 = sub_100008628(&qword_100029D60);
  if ((swift_dynamicCast(v12, v13, (char *)&type metadata for Any + 8, v4, 6) & 1) != 0)
  {
    v5 = v12[0];
    v6 = sub_10000D5B0(a1, (uint64_t)v13);
    v12[0] = &_swiftEmptyDictionarySingleton;
    __chkstk_darwin(v6);
    sub_10000CC8C(v5, (void (*)(_BYTE *, _BYTE *))sub_10001167C);
    swift_bridgeObjectRelease(v5);
    v12[3] = v4;
  }
  else
  {
    v7 = objc_opt_self(NSJSONSerialization);
    v8 = sub_100008628(&qword_100029E90);
    inited = swift_initStackObject(v8, v14);
    *(_OWORD *)(inited + 16) = xmmword_10001F5D0;
    sub_10000D5B0(a1, inited + 32);
    sub_10000D5EC(a2, inited + 72);
    v10 = sub_10001179C(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v10);
    LOBYTE(v7) = objc_msgSend((id)v7, "isValidJSONObject:", isa);

    if ((v7 & 1) == 0)
      return;
    sub_10000D5B0(a1, (uint64_t)v13);
    sub_10000D5EC(a2, (uint64_t)v12);
  }
  sub_10000C920((uint64_t)v12, (uint64_t)v13);
}

uint64_t sub_10000C920(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v7;
  _OWORD v8[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_10000D698((_OWORD *)a1, v8);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v2);
    v7 = *v2;
    *v2 = 0x8000000000000000;
    sub_100012D0C(v8, a2, isUniquelyReferenced_nonNull_native);
    v5 = *v2;
    *v2 = v7;
    swift_bridgeObjectRelease(v5);
    return sub_10000D664(a2);
  }
  else
  {
    sub_10000D628(a1, &qword_100029E98);
    sub_10000C9DC(a2, v8);
    sub_10000D664(a2);
    return sub_10000D628((uint64_t)v8, &qword_100029E98);
  }
}

double sub_10000C9DC@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  unint64_t v7;
  char v8;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  uint64_t v11;
  double result;
  uint64_t v13;

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain(*v3);
  v7 = sub_100011C44(a1);
  LOBYTE(a1) = v8;
  swift_bridgeObjectRelease(v6);
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
    v10 = *v3;
    v13 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_100012974();
      v10 = v13;
    }
    sub_10000D664(*(_QWORD *)(v10 + 48) + 40 * v7);
    sub_10000D698((_OWORD *)(*(_QWORD *)(v10 + 56) + 32 * v7), a2);
    sub_10000CAC4(v7, v10);
    v11 = *v3;
    *v3 = v10;
    swift_bridgeObjectRelease(v11);
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

unint64_t sub_10000CAC4(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  Swift::Int v10;
  Swift::Int v11;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE v28[40];

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
        sub_10000D5B0(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(a2 + 40));
        result = sub_10000D664((uint64_t)v28);
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= v11)
          {
LABEL_16:
            v14 = *(_QWORD *)(a2 + 48);
            v15 = v14 + 40 * v3;
            v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              v17 = *v16;
              v18 = v16[1];
              *(_QWORD *)(v15 + 32) = *((_QWORD *)v16 + 4);
              *(_OWORD *)v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_OWORD *)(v19 + 32 * v3);
            v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 2))
            {
              v9 = v21[1];
              *v20 = *v21;
              v20[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_10000CC8C(uint64_t a1, void (*a2)(_BYTE *, _BYTE *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  _BYTE v15[40];
  _BYTE v16[32];

  v4 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a1 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  swift_bridgeObjectRetain(a1);
  v9 = 0;
  while (1)
  {
    if (v7)
    {
      v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v12 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v12 >= v8)
      goto LABEL_23;
    v13 = *(_QWORD *)(v4 + 8 * v12);
    ++v9;
    if (!v13)
    {
      v9 = v12 + 1;
      if (v12 + 1 >= v8)
        goto LABEL_23;
      v13 = *(_QWORD *)(v4 + 8 * v9);
      if (!v13)
      {
        v9 = v12 + 2;
        if (v12 + 2 >= v8)
          goto LABEL_23;
        v13 = *(_QWORD *)(v4 + 8 * v9);
        if (!v13)
        {
          v9 = v12 + 3;
          if (v12 + 3 >= v8)
            goto LABEL_23;
          v13 = *(_QWORD *)(v4 + 8 * v9);
          if (!v13)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v13 - 1) & v13;
    v11 = __clz(__rbit64(v13)) + (v9 << 6);
LABEL_5:
    sub_10000D5B0(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v15);
    sub_10000D5EC(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v16);
    a2(v15, v16);
    sub_10000D628((uint64_t)v15, &qword_100029E88);
  }
  v14 = v12 + 4;
  if (v14 >= v8)
  {
LABEL_23:
    swift_release(a1);
    return;
  }
  v13 = *(_QWORD *)(v4 + 8 * v14);
  if (v13)
  {
    v9 = v14;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v9 >= v8)
      goto LABEL_23;
    v13 = *(_QWORD *)(v4 + 8 * v9);
    ++v14;
    if (v13)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_10000CE34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v3;
  Class isa;
  unsigned int v5;
  Class v6;
  id v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  void *v20;
  __n128 v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __n128 v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  _BYTE *v36;
  uint64_t v38;
  _BYTE __dst[400];
  _OWORD __src[25];
  id v41[50];

  v41[0] = &_swiftEmptyDictionarySingleton;
  sub_10000CC8C(a1, (void (*)(_BYTE *, _BYTE *))sub_10000D4DC);
  v3 = (void *)objc_opt_self(NSJSONSerialization);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v5 = objc_msgSend(v3, "isValidJSONObject:", isa);

  if (!v5)
  {
    if (qword_100029BA0 != -1)
      swift_once(&qword_100029BA0, sub_10001AE14);
    v15 = type metadata accessor for Logger(0);
    sub_10000A404(v15, (uint64_t)qword_10002B348);
    swift_bridgeObjectRetain(&_swiftEmptyDictionarySingleton);
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc(12, -1);
      v20 = (void *)swift_slowAlloc(32, -1);
      v41[0] = v20;
      *(_DWORD *)v19 = 136446210;
      v21 = swift_bridgeObjectRetain(&_swiftEmptyDictionarySingleton);
      v22 = (char *)&type metadata for Any + 8;
      v23 = Dictionary.description.getter(v21);
      v25 = v24;
      swift_bridgeObjectRelease(&_swiftEmptyDictionarySingleton);
      *(_QWORD *)&__src[0] = sub_1000160F4(v23, v25, (uint64_t *)v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(__src, (char *)__src + 8, v19 + 4, v19 + 12);
      swift_bridgeObjectRelease_n(&_swiftEmptyDictionarySingleton, 2);
      swift_bridgeObjectRelease(v25);
      v26 = "Unable to create UserInfoArticle from non-serializable user info payload: %{public}s";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v26, v19, 0xCu);
      swift_arrayDestroy(v20, 1, v22);
      swift_slowDealloc(v20, -1, -1);
      swift_slowDealloc(v19, -1, -1);

LABEL_14:
      sub_10000D4E4(__src);
      v36 = __src;
      goto LABEL_15;
    }
LABEL_13:

    swift_bridgeObjectRelease_n(&_swiftEmptyDictionarySingleton, 2);
    goto LABEL_14;
  }
  v6 = Dictionary._bridgeToObjectiveC()().super.isa;
  v41[0] = 0;
  v7 = objc_msgSend(v3, "dataWithJSONObject:options:error:", v6, 0, v41);

  v8 = v41[0];
  if (!v7)
  {
    v27 = v8;
    v28 = _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease(v28);
    if (qword_100029BA0 != -1)
      swift_once(&qword_100029BA0, sub_10001AE14);
    v29 = type metadata accessor for Logger(0);
    sub_10000A404(v29, (uint64_t)qword_10002B348);
    swift_bridgeObjectRetain(&_swiftEmptyDictionarySingleton);
    v17 = Logger.logObject.getter(v30);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v38 = a2;
      v19 = (uint8_t *)swift_slowAlloc(12, -1);
      v20 = (void *)swift_slowAlloc(32, -1);
      v41[0] = v20;
      *(_DWORD *)v19 = 136446210;
      v31 = swift_bridgeObjectRetain(&_swiftEmptyDictionarySingleton);
      v22 = (char *)&type metadata for Any + 8;
      v32 = Dictionary.description.getter(v31);
      v34 = v33;
      swift_bridgeObjectRelease(&_swiftEmptyDictionarySingleton);
      *(_QWORD *)&__src[0] = sub_1000160F4(v32, v34, (uint64_t *)v41);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(__src, (char *)__src + 8, v19 + 4, v19 + 12);
      swift_bridgeObjectRelease_n(&_swiftEmptyDictionarySingleton, 2);
      v35 = v34;
      a2 = v38;
      swift_bridgeObjectRelease(v35);
      v26 = "Unable to create JSON data from user info payload: %{public}s";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  swift_bridgeObjectRelease(&_swiftEmptyDictionarySingleton);
  v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v11 = v10;

  v12 = type metadata accessor for JSONDecoder(0);
  swift_allocObject(v12, *(unsigned int *)(v12 + 48), *(unsigned __int16 *)(v12 + 52));
  v13 = JSONDecoder.init()();
  v14 = sub_10000D524();
  dispatch thunk of JSONDecoder.decode<A>(_:from:)(__src, &type metadata for UserInfoArticle, v9, v11, &type metadata for UserInfoArticle, v14);
  sub_10000D568(v9, v11);
  swift_release(v13);
  memcpy(__dst, __src, 0x189uLL);
  nullsub_1(__dst);
  v36 = __dst;
LABEL_15:
  sub_1000102E8((uint64_t)v36, (uint64_t)v41, &qword_100029E78);
  return sub_1000102E8((uint64_t)v41, a2, &qword_100029E78);
}

void sub_10000D4DC(uint64_t a1, uint64_t a2)
{
  sub_10000C760(a1, a2);
}

double sub_10000D4E4(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[22] = 0u;
  a1[23] = 0u;
  a1[20] = 0u;
  a1[21] = 0u;
  a1[18] = 0u;
  a1[19] = 0u;
  a1[16] = 0u;
  a1[17] = 0u;
  a1[14] = 0u;
  a1[15] = 0u;
  a1[12] = 0u;
  a1[13] = 0u;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  *(_OWORD *)((char *)a1 + 377) = 0u;
  return result;
}

unint64_t sub_10000D524()
{
  unint64_t result;

  result = qword_100029E80;
  if (!qword_100029E80)
  {
    result = swift_getWitnessTable(&unk_10001F2EC, &type metadata for UserInfoArticle);
    atomic_store(result, (unint64_t *)&qword_100029E80);
  }
  return result;
}

uint64_t sub_10000D568(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000D5B0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_10000D5EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000D628(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100008628(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000D664(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

_OWORD *sub_10000D698(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t destroy for UserInfoArticle(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(a1[7]);
  swift_bridgeObjectRelease(a1[10]);
  swift_bridgeObjectRelease(a1[12]);
  swift_bridgeObjectRelease(a1[14]);
  swift_bridgeObjectRelease(a1[16]);
  swift_bridgeObjectRelease(a1[27]);
  swift_bridgeObjectRelease(a1[28]);
  swift_bridgeObjectRelease(a1[30]);
  swift_bridgeObjectRelease(a1[34]);
  swift_bridgeObjectRelease(a1[36]);
  swift_bridgeObjectRelease(a1[38]);
  swift_bridgeObjectRelease(a1[40]);
  swift_bridgeObjectRelease(a1[42]);
  swift_bridgeObjectRelease(a1[44]);
  swift_bridgeObjectRelease(a1[46]);
  return swift_bridgeObjectRelease(a1[48]);
}

uint64_t initializeWithCopy for UserInfoArticle(uint64_t a1, uint64_t a2)
{
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v28 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v28;
  v27 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v27;
  v26 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v26;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v4 = *(_QWORD *)(a2 + 88);
  v25 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 80) = v25;
  *(_QWORD *)(a1 + 88) = v4;
  v5 = *(_QWORD *)(a2 + 104);
  v24 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 96) = v24;
  *(_QWORD *)(a1 + 104) = v5;
  v6 = *(_QWORD *)(a2 + 120);
  v23 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 112) = v23;
  *(_QWORD *)(a1 + 120) = v6;
  v7 = *(_QWORD *)(a2 + 136);
  v22 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 128) = v22;
  *(_QWORD *)(a1 + 136) = v7;
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  v8 = *(_QWORD *)(a2 + 152);
  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = v8;
  *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  v9 = *(_QWORD *)(a2 + 216);
  v21 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 216) = v9;
  *(_QWORD *)(a1 + 224) = v21;
  v20 = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = v20;
  v10 = *(_QWORD *)(a2 + 248);
  *(_BYTE *)(a1 + 256) = *(_BYTE *)(a2 + 256);
  *(_QWORD *)(a1 + 248) = v10;
  v11 = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = v11;
  v12 = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 288) = v12;
  v13 = *(_QWORD *)(a2 + 304);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 304) = v13;
  v14 = *(_QWORD *)(a2 + 320);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 320) = v14;
  v15 = *(_QWORD *)(a2 + 336);
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 336) = v15;
  v16 = *(_QWORD *)(a2 + 352);
  *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
  *(_QWORD *)(a1 + 352) = v16;
  v17 = *(_QWORD *)(a2 + 368);
  *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
  *(_QWORD *)(a1 + 368) = v17;
  v18 = *(_QWORD *)(a2 + 384);
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  *(_QWORD *)(a1 + 384) = v18;
  *(_BYTE *)(a1 + 392) = *(_BYTE *)(a2 + 392);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRetain(v27);
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRetain(v25);
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v21);
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v18);
  return a1;
}

uint64_t assignWithCopy for UserInfoArticle(uint64_t a1, uint64_t a2)
{
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
  uint64_t v25;
  uint64_t v26;
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
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  v12 = *(_QWORD *)(a2 + 80);
  v13 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v14 = *(_QWORD *)(a2 + 96);
  v15 = *(_QWORD *)(a1 + 96);
  *(_QWORD *)(a1 + 96) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  v16 = *(_QWORD *)(a2 + 112);
  v17 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 112) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v17);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  v18 = *(_QWORD *)(a2 + 128);
  v19 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 128) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v19);
  v20 = *(_QWORD *)(a2 + 136);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_QWORD *)(a1 + 136) = v20;
  v21 = *(_QWORD *)(a2 + 152);
  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  *(_QWORD *)(a1 + 152) = v21;
  v22 = *(_QWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
  *(_QWORD *)(a1 + 168) = v22;
  v23 = *(_QWORD *)(a2 + 184);
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  *(_QWORD *)(a1 + 184) = v23;
  v24 = *(_QWORD *)(a2 + 200);
  *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
  *(_QWORD *)(a1 + 200) = v24;
  v25 = *(_QWORD *)(a1 + 216);
  v26 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 216) = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v25);
  v27 = *(_QWORD *)(a1 + 224);
  v28 = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 224) = v28;
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRelease(v27);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  v29 = *(_QWORD *)(a2 + 240);
  v30 = *(_QWORD *)(a1 + 240);
  *(_QWORD *)(a1 + 240) = v29;
  swift_bridgeObjectRetain(v29);
  swift_bridgeObjectRelease(v30);
  v31 = *(_QWORD *)(a2 + 248);
  *(_BYTE *)(a1 + 256) = *(_BYTE *)(a2 + 256);
  *(_QWORD *)(a1 + 248) = v31;
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  v32 = *(_QWORD *)(a2 + 272);
  v33 = *(_QWORD *)(a1 + 272);
  *(_QWORD *)(a1 + 272) = v32;
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRelease(v33);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  v34 = *(_QWORD *)(a2 + 288);
  v35 = *(_QWORD *)(a1 + 288);
  *(_QWORD *)(a1 + 288) = v34;
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRelease(v35);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  v36 = *(_QWORD *)(a2 + 304);
  v37 = *(_QWORD *)(a1 + 304);
  *(_QWORD *)(a1 + 304) = v36;
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRelease(v37);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  v38 = *(_QWORD *)(a2 + 320);
  v39 = *(_QWORD *)(a1 + 320);
  *(_QWORD *)(a1 + 320) = v38;
  swift_bridgeObjectRetain(v38);
  swift_bridgeObjectRelease(v39);
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  v40 = *(_QWORD *)(a2 + 336);
  v41 = *(_QWORD *)(a1 + 336);
  *(_QWORD *)(a1 + 336) = v40;
  swift_bridgeObjectRetain(v40);
  swift_bridgeObjectRelease(v41);
  *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
  v42 = *(_QWORD *)(a2 + 352);
  v43 = *(_QWORD *)(a1 + 352);
  *(_QWORD *)(a1 + 352) = v42;
  swift_bridgeObjectRetain(v42);
  swift_bridgeObjectRelease(v43);
  *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
  v44 = *(_QWORD *)(a2 + 368);
  v45 = *(_QWORD *)(a1 + 368);
  *(_QWORD *)(a1 + 368) = v44;
  swift_bridgeObjectRetain(v44);
  swift_bridgeObjectRelease(v45);
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  v46 = *(_QWORD *)(a2 + 384);
  v47 = *(_QWORD *)(a1 + 384);
  *(_QWORD *)(a1 + 384) = v46;
  swift_bridgeObjectRetain(v46);
  swift_bridgeObjectRelease(v47);
  *(_BYTE *)(a1 + 392) = *(_BYTE *)(a2 + 392);
  return a1;
}

void *initializeWithTake for UserInfoArticle(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x189uLL);
}

uint64_t assignWithTake for UserInfoArticle(uint64_t a1, uint64_t a2)
{
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
  uint64_t v25;
  uint64_t v26;
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

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v10;
  swift_bridgeObjectRelease(v11);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v12 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease(v12);
  v13 = *(_QWORD *)(a2 + 96);
  v14 = *(_QWORD *)(a1 + 96);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = v13;
  swift_bridgeObjectRelease(v14);
  v15 = *(_QWORD *)(a2 + 112);
  v16 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v15;
  swift_bridgeObjectRelease(v16);
  v17 = *(_QWORD *)(a2 + 128);
  v18 = *(_QWORD *)(a1 + 128);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = v17;
  swift_bridgeObjectRelease(v18);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_BYTE *)(a1 + 160) = *(_BYTE *)(a2 + 160);
  *(_QWORD *)(a1 + 168) = *(_QWORD *)(a2 + 168);
  *(_BYTE *)(a1 + 176) = *(_BYTE *)(a2 + 176);
  *(_BYTE *)(a1 + 192) = *(_BYTE *)(a2 + 192);
  *(_QWORD *)(a1 + 184) = *(_QWORD *)(a2 + 184);
  v19 = *(_QWORD *)(a2 + 200);
  *(_BYTE *)(a1 + 208) = *(_BYTE *)(a2 + 208);
  *(_QWORD *)(a1 + 200) = v19;
  v20 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  swift_bridgeObjectRelease(v20);
  v21 = *(_QWORD *)(a1 + 224);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  swift_bridgeObjectRelease(v21);
  v22 = *(_QWORD *)(a2 + 240);
  v23 = *(_QWORD *)(a1 + 240);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = v22;
  swift_bridgeObjectRelease(v23);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_BYTE *)(a1 + 256) = *(_BYTE *)(a2 + 256);
  v24 = *(_QWORD *)(a2 + 272);
  v25 = *(_QWORD *)(a1 + 272);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = v24;
  swift_bridgeObjectRelease(v25);
  v26 = *(_QWORD *)(a2 + 288);
  v27 = *(_QWORD *)(a1 + 288);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 288) = v26;
  swift_bridgeObjectRelease(v27);
  v28 = *(_QWORD *)(a2 + 304);
  v29 = *(_QWORD *)(a1 + 304);
  *(_QWORD *)(a1 + 296) = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 304) = v28;
  swift_bridgeObjectRelease(v29);
  v30 = *(_QWORD *)(a2 + 320);
  v31 = *(_QWORD *)(a1 + 320);
  *(_QWORD *)(a1 + 312) = *(_QWORD *)(a2 + 312);
  *(_QWORD *)(a1 + 320) = v30;
  swift_bridgeObjectRelease(v31);
  v32 = *(_QWORD *)(a2 + 336);
  v33 = *(_QWORD *)(a1 + 336);
  *(_QWORD *)(a1 + 328) = *(_QWORD *)(a2 + 328);
  *(_QWORD *)(a1 + 336) = v32;
  swift_bridgeObjectRelease(v33);
  v34 = *(_QWORD *)(a2 + 352);
  v35 = *(_QWORD *)(a1 + 352);
  *(_QWORD *)(a1 + 344) = *(_QWORD *)(a2 + 344);
  *(_QWORD *)(a1 + 352) = v34;
  swift_bridgeObjectRelease(v35);
  v36 = *(_QWORD *)(a2 + 368);
  v37 = *(_QWORD *)(a1 + 368);
  *(_QWORD *)(a1 + 360) = *(_QWORD *)(a2 + 360);
  *(_QWORD *)(a1 + 368) = v36;
  swift_bridgeObjectRelease(v37);
  v38 = *(_QWORD *)(a2 + 384);
  v39 = *(_QWORD *)(a1 + 384);
  *(_QWORD *)(a1 + 376) = *(_QWORD *)(a2 + 376);
  *(_QWORD *)(a1 + 384) = v38;
  swift_bridgeObjectRelease(v39);
  *(_BYTE *)(a1 + 392) = *(_BYTE *)(a2 + 392);
  return a1;
}

uint64_t getEnumTagSinglePayload for UserInfoArticle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 393))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UserInfoArticle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 392) = 0;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 393) = 1;
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
    *(_BYTE *)(result + 393) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UserInfoArticle()
{
  return &type metadata for UserInfoArticle;
}

uint64_t sub_10000DF08(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 7565409 && a2 == 0xE300000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(7565409, 0xE300000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  else if (a1 == 1937204590 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease(0xE400000000000000);
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(1937204590, 0xE400000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

void *sub_10000DFD0@<X0>(_QWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[50];
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BYTE v50[305];
  _QWORD v51[39];
  _BYTE v52[305];
  char v53;

  v37 = sub_100008628(&qword_100029EA0);
  v5 = *(_QWORD *)(v37 - 8);
  __chkstk_darwin(v37);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_1000085E4(a1, v8);
  v10 = sub_10000E340();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for UserInfoArticle.CodingKeys, &type metadata for UserInfoArticle.CodingKeys, v10, v8, v9);
  if (v2)
    return (void *)sub_100008608(a1);
  v35 = a2;
  v36 = v5;
  LOBYTE(v38[0]) = 0;
  v11 = sub_10000E384();
  v12 = v37;
  KeyedDecodingContainer.decode<A>(_:forKey:)(&v39, &type metadata for APS, v38, v37, &type metadata for APS, v11);
  v13 = v40;
  v14 = v42;
  v29 = v43;
  v30 = v41;
  v15 = v44;
  v31 = v46;
  v27 = v47;
  v28 = v45;
  v25 = v39;
  v26 = v48;
  v16 = v49;
  v53 = 1;
  v17 = sub_10000E3C8();
  v32 = v13;
  v18 = v13;
  v19 = v31;
  swift_bridgeObjectRetain(v18);
  v34 = v14;
  swift_bridgeObjectRetain(v14);
  v33 = v15;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v16);
  KeyedDecodingContainer.decode<A>(_:forKey:)(v51, &type metadata for NewsSingleArticle, &v53, v12, &type metadata for NewsSingleArticle, v17);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v12);
  memcpy(&v38[11], v51, 0x131uLL);
  memcpy(v52, v51, sizeof(v52));
  v20 = v25;
  v22 = v32;
  v21 = v33;
  v38[0] = v25;
  v38[1] = v32;
  v23 = v34;
  v38[2] = v30;
  v38[3] = v34;
  v38[4] = v29;
  v38[5] = v33;
  v38[6] = v28;
  v38[7] = v19;
  v38[8] = v27;
  v38[9] = v26;
  v38[10] = v16;
  sub_10000E40C(v38);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v21);
  swift_bridgeObjectRelease(v23);
  swift_bridgeObjectRelease(v22);
  sub_100008608(a1);
  v39 = v20;
  v40 = v22;
  v41 = v30;
  v42 = v23;
  v43 = v29;
  v44 = v21;
  v45 = v28;
  v46 = v19;
  v47 = v27;
  v48 = v26;
  v49 = v16;
  memcpy(v50, v52, sizeof(v50));
  sub_10000E544(&v39);
  return memcpy(v35, v38, 0x189uLL);
}

unint64_t sub_10000E340()
{
  unint64_t result;

  result = qword_100029EA8;
  if (!qword_100029EA8)
  {
    result = swift_getWitnessTable(&unk_10001F43C, &type metadata for UserInfoArticle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100029EA8);
  }
  return result;
}

unint64_t sub_10000E384()
{
  unint64_t result;

  result = qword_100029EB0;
  if (!qword_100029EB0)
  {
    result = swift_getWitnessTable(&unk_10001F7B0, &type metadata for APS);
    atomic_store(result, (unint64_t *)&qword_100029EB0);
  }
  return result;
}

unint64_t sub_10000E3C8()
{
  unint64_t result;

  result = qword_100029EB8;
  if (!qword_100029EB8)
  {
    result = swift_getWitnessTable(&unk_10001F414, &type metadata for NewsSingleArticle);
    atomic_store(result, (unint64_t *)&qword_100029EB8);
  }
  return result;
}

_QWORD *sub_10000E40C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = a1[1];
  v3 = a1[3];
  v4 = a1[5];
  v5 = a1[7];
  v6 = a1[10];
  v7 = a1[12];
  v8 = a1[14];
  v9 = a1[16];
  v10 = a1[27];
  v12 = a1[28];
  v13 = a1[30];
  v14 = a1[34];
  v15 = a1[36];
  v16 = a1[38];
  v17 = a1[40];
  v18 = a1[42];
  v19 = a1[44];
  v20 = a1[46];
  swift_bridgeObjectRetain(a1[48]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRetain(v20);
  return a1;
}

_QWORD *sub_10000E544(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = a1[1];
  v3 = a1[3];
  v4 = a1[5];
  v5 = a1[7];
  v6 = a1[10];
  v7 = a1[12];
  v8 = a1[16];
  v9 = a1[27];
  v10 = a1[28];
  v12 = a1[30];
  v13 = a1[34];
  v14 = a1[36];
  v15 = a1[38];
  v16 = a1[40];
  v17 = a1[42];
  v18 = a1[44];
  v19 = a1[46];
  v20 = a1[48];
  swift_bridgeObjectRelease(a1[14]);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v18);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v20);
  return a1;
}

unint64_t sub_10000E67C()
{
  unint64_t result;

  result = qword_100029EC8;
  if (!qword_100029EC8)
  {
    result = swift_getWitnessTable(&unk_10001F788, &type metadata for APS);
    atomic_store(result, (unint64_t *)&qword_100029EC8);
  }
  return result;
}

unint64_t sub_10000E6C0()
{
  unint64_t result;

  result = qword_100029ED0;
  if (!qword_100029ED0)
  {
    result = swift_getWitnessTable(&unk_10001F3EC, &type metadata for NewsSingleArticle);
    atomic_store(result, (unint64_t *)&qword_100029ED0);
  }
  return result;
}

_BYTE *initializeBufferWithCopyOfBuffer for UserInfoArticle.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UserInfoArticle.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for UserInfoArticle.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_10000E7F0 + 4 * byte_10001F29A[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000E824 + 4 * byte_10001F295[v4]))();
}

uint64_t sub_10000E824(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E82C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000E834);
  return result;
}

uint64_t sub_10000E840(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000E848);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000E84C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E854(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E860(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000E868(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UserInfoArticle.CodingKeys()
{
  return &type metadata for UserInfoArticle.CodingKeys;
}

uint64_t initializeBufferWithCopyOfBuffer for APS.Alert(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for NewsSingleArticle(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(a1[16]);
  swift_bridgeObjectRelease(a1[17]);
  swift_bridgeObjectRelease(a1[19]);
  swift_bridgeObjectRelease(a1[23]);
  swift_bridgeObjectRelease(a1[25]);
  swift_bridgeObjectRelease(a1[27]);
  swift_bridgeObjectRelease(a1[29]);
  swift_bridgeObjectRelease(a1[31]);
  swift_bridgeObjectRelease(a1[33]);
  swift_bridgeObjectRelease(a1[35]);
  return swift_bridgeObjectRelease(a1[37]);
}

uint64_t initializeWithCopy for NewsSingleArticle(uint64_t a1, uint64_t a2)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v18 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v18;
  v17 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v17;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v4 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v4;
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  v5 = *(_QWORD *)(a2 + 128);
  v16 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = v5;
  *(_QWORD *)(a1 + 136) = v16;
  v15 = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v15;
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  v6 = *(_QWORD *)(a2 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v6;
  v7 = *(_QWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v7;
  v8 = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v8;
  v9 = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v9;
  v10 = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v10;
  v11 = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v11;
  v12 = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = v12;
  v13 = *(_QWORD *)(a2 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v13;
  *(_BYTE *)(a1 + 304) = *(_BYTE *)(a2 + 304);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  return a1;
}

uint64_t assignWithCopy for NewsSingleArticle(uint64_t a1, uint64_t a2)
{
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
  uint64_t v25;
  uint64_t v26;
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

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v10;
  v11 = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v11;
  v12 = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = v12;
  v13 = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v13;
  v14 = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v14;
  v15 = *(_QWORD *)(a1 + 128);
  v16 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 128) = v16;
  swift_bridgeObjectRetain(v16);
  swift_bridgeObjectRelease(v15);
  v17 = *(_QWORD *)(a1 + 136);
  v18 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 136) = v18;
  swift_bridgeObjectRetain(v18);
  swift_bridgeObjectRelease(v17);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  v19 = *(_QWORD *)(a2 + 152);
  v20 = *(_QWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 152) = v19;
  swift_bridgeObjectRetain(v19);
  swift_bridgeObjectRelease(v20);
  v21 = *(_QWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  *(_QWORD *)(a1 + 160) = v21;
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  v22 = *(_QWORD *)(a2 + 184);
  v23 = *(_QWORD *)(a1 + 184);
  *(_QWORD *)(a1 + 184) = v22;
  swift_bridgeObjectRetain(v22);
  swift_bridgeObjectRelease(v23);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  v24 = *(_QWORD *)(a2 + 200);
  v25 = *(_QWORD *)(a1 + 200);
  *(_QWORD *)(a1 + 200) = v24;
  swift_bridgeObjectRetain(v24);
  swift_bridgeObjectRelease(v25);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  v26 = *(_QWORD *)(a2 + 216);
  v27 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 216) = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v27);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  v28 = *(_QWORD *)(a2 + 232);
  v29 = *(_QWORD *)(a1 + 232);
  *(_QWORD *)(a1 + 232) = v28;
  swift_bridgeObjectRetain(v28);
  swift_bridgeObjectRelease(v29);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  v30 = *(_QWORD *)(a2 + 248);
  v31 = *(_QWORD *)(a1 + 248);
  *(_QWORD *)(a1 + 248) = v30;
  swift_bridgeObjectRetain(v30);
  swift_bridgeObjectRelease(v31);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  v32 = *(_QWORD *)(a2 + 264);
  v33 = *(_QWORD *)(a1 + 264);
  *(_QWORD *)(a1 + 264) = v32;
  swift_bridgeObjectRetain(v32);
  swift_bridgeObjectRelease(v33);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  v34 = *(_QWORD *)(a2 + 280);
  v35 = *(_QWORD *)(a1 + 280);
  *(_QWORD *)(a1 + 280) = v34;
  swift_bridgeObjectRetain(v34);
  swift_bridgeObjectRelease(v35);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  v36 = *(_QWORD *)(a2 + 296);
  v37 = *(_QWORD *)(a1 + 296);
  *(_QWORD *)(a1 + 296) = v36;
  swift_bridgeObjectRetain(v36);
  swift_bridgeObjectRelease(v37);
  *(_BYTE *)(a1 + 304) = *(_BYTE *)(a2 + 304);
  return a1;
}

void *initializeWithTake for NewsSingleArticle(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x131uLL);
}

uint64_t assignWithTake for NewsSingleArticle(uint64_t a1, uint64_t a2)
{
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 72) = *(_BYTE *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_BYTE *)(a1 + 88) = *(_BYTE *)(a2 + 88);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v10 = *(_QWORD *)(a2 + 112);
  *(_BYTE *)(a1 + 120) = *(_BYTE *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = v10;
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 128));
  v11 = *(_QWORD *)(a1 + 136);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  swift_bridgeObjectRelease(v11);
  v12 = *(_QWORD *)(a2 + 152);
  v13 = *(_QWORD *)(a1 + 152);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = v12;
  swift_bridgeObjectRelease(v13);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  v14 = *(_QWORD *)(a2 + 184);
  v15 = *(_QWORD *)(a1 + 184);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 184) = v14;
  swift_bridgeObjectRelease(v15);
  v16 = *(_QWORD *)(a2 + 200);
  v17 = *(_QWORD *)(a1 + 200);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = v16;
  swift_bridgeObjectRelease(v17);
  v18 = *(_QWORD *)(a2 + 216);
  v19 = *(_QWORD *)(a1 + 216);
  *(_QWORD *)(a1 + 208) = *(_QWORD *)(a2 + 208);
  *(_QWORD *)(a1 + 216) = v18;
  swift_bridgeObjectRelease(v19);
  v20 = *(_QWORD *)(a2 + 232);
  v21 = *(_QWORD *)(a1 + 232);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = v20;
  swift_bridgeObjectRelease(v21);
  v22 = *(_QWORD *)(a2 + 248);
  v23 = *(_QWORD *)(a1 + 248);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = v22;
  swift_bridgeObjectRelease(v23);
  v24 = *(_QWORD *)(a2 + 264);
  v25 = *(_QWORD *)(a1 + 264);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = v24;
  swift_bridgeObjectRelease(v25);
  v26 = *(_QWORD *)(a2 + 280);
  v27 = *(_QWORD *)(a1 + 280);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = v26;
  swift_bridgeObjectRelease(v27);
  v28 = *(_QWORD *)(a2 + 296);
  v29 = *(_QWORD *)(a1 + 296);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_QWORD *)(a1 + 296) = v28;
  swift_bridgeObjectRelease(v29);
  *(_BYTE *)(a1 + 304) = *(_BYTE *)(a2 + 304);
  return a1;
}

uint64_t getEnumTagSinglePayload for NewsSingleArticle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 305))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for NewsSingleArticle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 296) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 304) = 0;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 305) = 1;
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
    *(_BYTE *)(result + 305) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for NewsSingleArticle()
{
  return &type metadata for NewsSingleArticle;
}

unint64_t sub_10000EF70()
{
  unint64_t result;

  result = qword_100029ED8;
  if (!qword_100029ED8)
  {
    result = swift_getWitnessTable(&unk_10001F3C4, &type metadata for UserInfoArticle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100029ED8);
  }
  return result;
}

unint64_t sub_10000EFB8()
{
  unint64_t result;

  result = qword_100029EE0;
  if (!qword_100029EE0)
  {
    result = swift_getWitnessTable("5a", &type metadata for UserInfoArticle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100029EE0);
  }
  return result;
}

unint64_t sub_10000F000()
{
  unint64_t result;

  result = qword_100029EE8;
  if (!qword_100029EE8)
  {
    result = swift_getWitnessTable(&unk_10001F35C, &type metadata for UserInfoArticle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100029EE8);
  }
  return result;
}

void *sub_10000F044@<X0>(_QWORD *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __n128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __n128 v21;
  uint64_t v22;
  int v23;
  __n128 v24;
  uint64_t v25;
  int v26;
  __n128 v27;
  uint64_t v28;
  int v29;
  __n128 v30;
  int v31;
  __n128 v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __n128 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __n128 v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  __n128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __n128 v53;
  uint64_t v54;
  __n128 v55;
  uint64_t v56;
  __n128 v57;
  uint64_t v58;
  __n128 v59;
  uint64_t v60;
  __n128 v61;
  uint64_t v62;
  __n128 v63;
  uint64_t v64;
  uint64_t v65;
  __n128 v66;
  uint64_t v67;
  uint64_t v68;
  __n128 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  uint64_t v96;
  int v97;
  int v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  _QWORD v119[39];
  _QWORD v120[7];
  char v121;
  _BYTE v122[7];
  uint64_t v123;
  char v124;
  _BYTE v125[7];
  uint64_t v126;
  char v127;
  _BYTE v128[7];
  uint64_t v129;
  char v130;
  _BYTE v131[7];
  uint64_t v132;
  char v133;
  _BYTE v134[7];
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  char v140;
  _BYTE v141[7];
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  char v158;
  char v159;
  _BYTE v160[7];
  char v161;
  _BYTE v162[7];
  char v163;
  _BYTE v164[7];
  char v165;
  _BYTE v166[7];
  char v167;
  _BYTE v168[7];
  char v169;
  _BYTE v170[7];
  char v171;
  uint64_t v172;

  v116 = sub_100008628(&qword_100029EF0);
  v5 = *(_QWORD *)(v116 - 8);
  __chkstk_darwin(v116);
  v7 = (char *)&v78 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v167 = 1;
  v8 = a1[3];
  v9 = a1[4];
  sub_1000085E4(a1, v8);
  v10 = sub_100010080();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for NewsSingleArticle.CodingKeys, &type metadata for NewsSingleArticle.CodingKeys, v10, v8, v9);
  if (v2)
  {
    v117 = 0;
    v118 = 0;
    v172 = 0;
    sub_100008608(a1);
    swift_bridgeObjectRelease(v172);
    swift_bridgeObjectRelease(v118);
    swift_bridgeObjectRelease(v117);
    swift_bridgeObjectRelease(0);
    swift_bridgeObjectRelease(0);
    swift_bridgeObjectRelease(0);
    return (void *)swift_bridgeObjectRelease(0);
  }
  else
  {
    v115 = v5;
    v111 = a2;
    LOBYTE(v120[0]) = 0;
    v11 = v116;
    v12 = KeyedDecodingContainer.decode(_:forKey:)(v120, v116);
    v14 = v13;
    LOBYTE(v120[0]) = 1;
    swift_bridgeObjectRetain(v13);
    v109 = KeyedDecodingContainer.decode(_:forKey:)(v120, v11);
    v110 = v12;
    LOBYTE(v120[0]) = 2;
    v16 = v15;
    v17 = swift_bridgeObjectRetain(v15);
    v18 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v11, v17);
    v114 = v16;
    v108 = v18;
    LOBYTE(v120[0]) = 3;
    v20 = v19;
    v21 = swift_bridgeObjectRetain(v19);
    v22 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v11, v21);
    v113 = v20;
    v106 = v22;
    v107 = v14;
    v171 = v23 & 1;
    LOBYTE(v120[0]) = 4;
    LODWORD(v20) = v23;
    v25 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v11, v24);
    v104 = v20;
    v105 = v25;
    v169 = v26 & 1;
    LOBYTE(v120[0]) = 4;
    LODWORD(v14) = v26;
    v28 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v11, v27);
    LODWORD(v20) = v29;
    v102 = v14;
    v103 = v28;
    v167 = v29 & 1;
    LOBYTE(v120[0]) = 6;
    v101 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v11, v30);
    v100 = v31;
    v165 = v31 & 1;
    LOBYTE(v120[0]) = 7;
    v33 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v11, v32);
    v97 = v34;
    v98 = v20;
    v99 = v33;
    v163 = v34 & 1;
    v35 = sub_100008628(&qword_100029F00);
    LOBYTE(v119[0]) = 8;
    v36 = sub_10001032C(&qword_100029F08, &qword_100029F00, (uint64_t)&protocol witness table for String, (uint64_t)&protocol conformance descriptor for <A> [A]);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v120, v35, v119, v11, v35, v36);
    v95 = a1;
    v37 = v120[0];
    v38 = sub_100008628(&qword_100029F10);
    LOBYTE(v119[0]) = 9;
    v39 = sub_10001032C(&qword_100029F18, &qword_100029F10, (uint64_t)&protocol witness table for Double, (uint64_t)&protocol conformance descriptor for <A> [A]);
    v96 = v37;
    swift_bridgeObjectRetain(v37);
    KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)(v120, v38, v119, v11, v38, v39);
    v40 = v120[0];
    LOBYTE(v120[0]) = 10;
    v94 = v40;
    v41 = swift_bridgeObjectRetain(v40);
    v42 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v116, v41);
    v93 = v43;
    v44 = v42;
    LOBYTE(v120[0]) = 11;
    v45 = swift_bridgeObjectRetain(v43);
    v46 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v116, v45);
    v92 = v47;
    v48 = v46;
    v161 = v47 & 1;
    LOBYTE(v120[0]) = 12;
    v50 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v116, v49);
    v112 = v51;
    v52 = v50;
    LOBYTE(v120[0]) = 13;
    v53 = swift_bridgeObjectRetain(v51);
    v91 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v116, v53);
    v172 = v54;
    LOBYTE(v120[0]) = 14;
    v55 = swift_bridgeObjectRetain(v54);
    v90 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v116, v55);
    v118 = v56;
    LOBYTE(v120[0]) = 15;
    v57 = swift_bridgeObjectRetain(v56);
    v89 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v116, v57);
    v117 = v58;
    LOBYTE(v120[0]) = 16;
    v59 = swift_bridgeObjectRetain(v58);
    v86 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v116, v59);
    v88 = v60;
    LOBYTE(v120[0]) = 17;
    v61 = swift_bridgeObjectRetain(v60);
    v85 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v116, v61);
    v87 = v62;
    LOBYTE(v120[0]) = 18;
    v63 = swift_bridgeObjectRetain(v62);
    v84 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v116, v63);
    v65 = v64;
    LOBYTE(v120[0]) = 19;
    v66 = swift_bridgeObjectRetain(v64);
    v83 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(v120, v116, v66);
    v68 = v67;
    v159 = 20;
    v69 = swift_bridgeObjectRetain(v67);
    v82 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v159, v116, v69);
    (*(void (**)(char *, uint64_t))(v115 + 8))(v7, v116);
    LOBYTE(v119[7]) = v104 & 1;
    LOBYTE(v119[9]) = v102 & 1;
    LOBYTE(v119[11]) = v98 & 1;
    LOBYTE(v119[13]) = v100 & 1;
    LOBYTE(v119[15]) = v97 & 1;
    LOBYTE(v119[21]) = v92 & 1;
    v119[0] = v110;
    v119[1] = v107;
    v70 = v114;
    v119[2] = v109;
    v119[3] = v114;
    v119[4] = v108;
    v119[5] = v113;
    v119[6] = v106;
    v119[8] = v105;
    v119[10] = v103;
    v119[12] = v101;
    v119[14] = v99;
    v119[16] = v96;
    v119[17] = v94;
    v79 = v48;
    v80 = v44;
    v119[18] = v44;
    v119[19] = v93;
    v119[20] = v48;
    v81 = v52;
    v119[22] = v52;
    v71 = v112;
    v119[23] = v112;
    v119[24] = v91;
    v72 = v172;
    v119[25] = v172;
    v119[26] = v90;
    v119[27] = v118;
    v73 = v88;
    v119[28] = v89;
    v119[29] = v117;
    v119[30] = v86;
    v119[31] = v88;
    v119[32] = v85;
    v119[33] = v87;
    v119[34] = v84;
    v119[35] = v65;
    v119[36] = v83;
    v119[37] = v68;
    LOBYTE(v119[38]) = v82;
    sub_100010108(v119);
    v74 = v107;
    swift_bridgeObjectRelease(v107);
    swift_bridgeObjectRelease(v70);
    v75 = v113;
    swift_bridgeObjectRelease(v113);
    swift_bridgeObjectRelease(v96);
    swift_bridgeObjectRelease(v94);
    swift_bridgeObjectRelease(v93);
    swift_bridgeObjectRelease(v71);
    swift_bridgeObjectRelease(v72);
    swift_bridgeObjectRelease(v118);
    swift_bridgeObjectRelease(v117);
    swift_bridgeObjectRelease(v73);
    v76 = v87;
    swift_bridgeObjectRelease(v87);
    swift_bridgeObjectRelease(v65);
    swift_bridgeObjectRelease(v68);
    sub_100008608(v95);
    v120[0] = v110;
    v120[1] = v74;
    v120[2] = v109;
    v120[3] = v114;
    v120[4] = v108;
    v120[5] = v75;
    v120[6] = v106;
    v121 = v171;
    *(_DWORD *)v122 = *(_DWORD *)v170;
    *(_DWORD *)&v122[3] = *(_DWORD *)&v170[3];
    v123 = v105;
    v124 = v169;
    *(_DWORD *)v125 = *(_DWORD *)v168;
    *(_DWORD *)&v125[3] = *(_DWORD *)&v168[3];
    v126 = v103;
    v127 = v167;
    *(_DWORD *)v128 = *(_DWORD *)v166;
    *(_DWORD *)&v128[3] = *(_DWORD *)&v166[3];
    v129 = v101;
    v130 = v165;
    *(_DWORD *)v131 = *(_DWORD *)v164;
    *(_DWORD *)&v131[3] = *(_DWORD *)&v164[3];
    v132 = v99;
    v133 = v163;
    *(_DWORD *)&v134[3] = *(_DWORD *)&v162[3];
    *(_DWORD *)v134 = *(_DWORD *)v162;
    v135 = v96;
    v136 = v94;
    v137 = v80;
    v138 = v93;
    v139 = v79;
    v140 = v161;
    *(_DWORD *)&v141[3] = *(_DWORD *)&v160[3];
    *(_DWORD *)v141 = *(_DWORD *)v160;
    v142 = v81;
    v143 = v112;
    v144 = v91;
    v145 = v72;
    v146 = v90;
    v147 = v118;
    v148 = v89;
    v149 = v117;
    v150 = v86;
    v151 = v73;
    v152 = v85;
    v153 = v76;
    v154 = v84;
    v155 = v65;
    v156 = v83;
    v157 = v68;
    v158 = v82;
    sub_1000101F8(v120);
    return memcpy(v111, v119, 0x131uLL);
  }
}

unint64_t sub_100010080()
{
  unint64_t result;

  result = qword_100029EF8;
  if (!qword_100029EF8)
  {
    result = swift_getWitnessTable(&unk_10001F57C, &type metadata for NewsSingleArticle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100029EF8);
  }
  return result;
}

uint64_t sub_1000100C4(uint64_t *a1)
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

_QWORD *sub_100010108(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = a1[1];
  v3 = a1[3];
  v4 = a1[5];
  v5 = a1[16];
  v6 = a1[17];
  v7 = a1[19];
  v8 = a1[23];
  v9 = a1[25];
  v10 = a1[27];
  v12 = a1[29];
  v13 = a1[31];
  v14 = a1[33];
  v15 = a1[35];
  swift_bridgeObjectRetain(a1[37]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRetain(v9);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRetain(v15);
  return a1;
}

_QWORD *sub_1000101F8(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v2 = a1[1];
  v3 = a1[5];
  v4 = a1[16];
  v5 = a1[17];
  v6 = a1[19];
  v7 = a1[23];
  v8 = a1[25];
  v9 = a1[27];
  v10 = a1[29];
  v12 = a1[31];
  v13 = a1[33];
  v14 = a1[35];
  v15 = a1[37];
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v15);
  return a1;
}

uint64_t sub_1000102E8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100008628(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001032C(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_1000100C4(a2);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NewsSingleArticle.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEC)
    goto LABEL_17;
  if (a2 + 20 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 20) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 20;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 20;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 20;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x15;
  v8 = v6 - 21;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NewsSingleArticle.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 20 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 20) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xEB)
    return ((uint64_t (*)(void))((char *)&loc_100010464 + 4 * byte_10001F2A4[v4]))();
  *a1 = a2 + 20;
  return ((uint64_t (*)(void))((char *)sub_100010498 + 4 * byte_10001F29F[v4]))();
}

uint64_t sub_100010498(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000104A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000104A8);
  return result;
}

uint64_t sub_1000104B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1000104BCLL);
  *(_BYTE *)result = a2 + 20;
  return result;
}

uint64_t sub_1000104C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000104C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1000104D4(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for NewsSingleArticle.CodingKeys()
{
  return &type metadata for NewsSingleArticle.CodingKeys;
}

unint64_t sub_1000104F0()
{
  unint64_t result;

  result = qword_100029F48;
  if (!qword_100029F48)
  {
    result = swift_getWitnessTable(&unk_10001F554, &type metadata for NewsSingleArticle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100029F48);
  }
  return result;
}

unint64_t sub_100010538()
{
  unint64_t result;

  result = qword_100029F50;
  if (!qword_100029F50)
  {
    result = swift_getWitnessTable(&unk_10001F48C, &type metadata for NewsSingleArticle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100029F50);
  }
  return result;
}

unint64_t sub_100010580()
{
  unint64_t result;

  result = qword_100029F58;
  if (!qword_100029F58)
  {
    result = swift_getWitnessTable(&unk_10001F4B4, &type metadata for NewsSingleArticle.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100029F58);
  }
  return result;
}

uint64_t sub_1000105C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  char v89;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadArticleIDKey);
  if (v4 == a1 && v5 == a2)
    goto LABEL_58;
  v7 = v5;
  v8 = _stringCompareWithSmolCheck(_:_:expecting:)(v4, v5, a1, a2, 0);
  swift_bridgeObjectRelease(v7);
  if ((v8 & 1) != 0)
  {
LABEL_6:
    swift_bridgeObjectRelease(a2);
    return 10;
  }
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadSourceChannelIDKey);
  if (v9 == a1 && v10 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 1;
  }
  v12 = v10;
  v13 = _stringCompareWithSmolCheck(_:_:expecting:)(v9, v10, a1, a2, 0);
  swift_bridgeObjectRelease(v12);
  if ((v13 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 1;
  }
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadBodyKey);
  if (v15 == a1 && v16 == a2)
  {
    v14 = 2;
    swift_bridgeObjectRelease_n(a2, 2);
    return v14;
  }
  v18 = v16;
  v19 = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, a1, a2, 0);
  swift_bridgeObjectRelease(v18);
  if ((v19 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 2;
  }
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadPublishDateKey);
  v22 = v21;
  if (v20 == a1 && v21 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 3;
  }
  v23 = _stringCompareWithSmolCheck(_:_:expecting:)(v20, v21, a1, a2, 0);
  swift_bridgeObjectRelease(v22);
  if ((v23 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 3;
  }
  v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadIsPaidKey);
  v26 = v25;
  if (v24 == a1 && v25 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 4;
  }
  v27 = _stringCompareWithSmolCheck(_:_:expecting:)(v24, v25, a1, a2, 0);
  swift_bridgeObjectRelease(v26);
  if ((v27 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 4;
  }
  v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadIsBundlePaidKey);
  v30 = v29;
  if (v28 == a1 && v29 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 5;
  }
  v31 = _stringCompareWithSmolCheck(_:_:expecting:)(v28, v29, a1, a2, 0);
  swift_bridgeObjectRelease(v30);
  if ((v31 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 5;
  }
  v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadGlobalCohortScoresCTRKey);
  v34 = v33;
  if (v32 == a1 && v33 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 6;
  }
  v35 = _stringCompareWithSmolCheck(_:_:expecting:)(v32, v33, a1, a2, 0);
  swift_bridgeObjectRelease(v34);
  if ((v35 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 6;
  }
  v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadChannelCohortScoresCTRKey);
  v38 = v37;
  if (v36 == a1 && v37 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 7;
  }
  v39 = _stringCompareWithSmolCheck(_:_:expecting:)(v36, v37, a1, a2, 0);
  swift_bridgeObjectRelease(v38);
  if ((v39 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 7;
  }
  v40 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadTopicTagIDsKey);
  v42 = v41;
  if (v40 == a1 && v41 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 8;
  }
  v43 = _stringCompareWithSmolCheck(_:_:expecting:)(v40, v41, a1, a2, 0);
  swift_bridgeObjectRelease(v42);
  if ((v43 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 8;
  }
  v44 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadTopicCohortScoresCTRsKey);
  v46 = v45;
  if (v44 == a1 && v45 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 9;
  }
  v47 = _stringCompareWithSmolCheck(_:_:expecting:)(v44, v45, a1, a2, 0);
  swift_bridgeObjectRelease(v46);
  if ((v47 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 9;
  }
  v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadNotificationIDKey);
  v50 = v49;
  if (v48 == a1 && v49 == a2)
    goto LABEL_58;
  v52 = _stringCompareWithSmolCheck(_:_:expecting:)(v48, v49, a1, a2, 0);
  swift_bridgeObjectRelease(v50);
  if ((v52 & 1) != 0)
    goto LABEL_6;
  v53 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadNotificationBehaviorFlagsKey);
  v55 = v54;
  if (v53 == a1 && v54 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 11;
  }
  v56 = _stringCompareWithSmolCheck(_:_:expecting:)(v53, v54, a1, a2, 0);
  swift_bridgeObjectRelease(v55);
  if ((v56 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 11;
  }
  v57 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadClusterIDKey);
  v59 = v58;
  if (v57 == a1 && v58 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 12;
  }
  v60 = _stringCompareWithSmolCheck(_:_:expecting:)(v57, v58, a1, a2, 0);
  swift_bridgeObjectRelease(v59);
  if ((v60 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 12;
  }
  v61 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadThumbnailURLKey);
  v63 = v62;
  if (v61 == a1 && v62 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 13;
  }
  v64 = _stringCompareWithSmolCheck(_:_:expecting:)(v61, v62, a1, a2, 0);
  swift_bridgeObjectRelease(v63);
  if ((v64 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 13;
  }
  v65 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadPublisherLogoURLKey);
  v67 = v66;
  if (v65 == a1 && v66 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 14;
  }
  v68 = _stringCompareWithSmolCheck(_:_:expecting:)(v65, v66, a1, a2, 0);
  swift_bridgeObjectRelease(v67);
  if ((v68 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 14;
  }
  v69 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadPublisherLogoMaskURLKey);
  v71 = v70;
  if (v69 == a1 && v70 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 15;
  }
  v72 = _stringCompareWithSmolCheck(_:_:expecting:)(v69, v70, a1, a2, 0);
  swift_bridgeObjectRelease(v71);
  if ((v72 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 15;
  }
  v73 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadPublisherLogoCompactURLKey);
  v75 = v74;
  if (v73 == a1 && v74 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 16;
  }
  v76 = _stringCompareWithSmolCheck(_:_:expecting:)(v73, v74, a1, a2, 0);
  swift_bridgeObjectRelease(v75);
  if ((v76 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 16;
  }
  v77 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadPublisherNameKey);
  v79 = v78;
  if (v77 == a1 && v78 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 17;
  }
  v80 = _stringCompareWithSmolCheck(_:_:expecting:)(v77, v78, a1, a2, 0);
  swift_bridgeObjectRelease(v79);
  if ((v80 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 17;
  }
  v81 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadTitleKey);
  v83 = v82;
  if (v81 == a1 && v82 == a2)
  {
    swift_bridgeObjectRelease_n(a2, 2);
    return 18;
  }
  v84 = _stringCompareWithSmolCheck(_:_:expecting:)(v81, v82, a1, a2, 0);
  swift_bridgeObjectRelease(v83);
  if ((v84 & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 18;
  }
  v85 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadExcerptKey);
  v87 = v86;
  if (v85 == a1 && v86 == a2)
  {
LABEL_58:
    swift_bridgeObjectRelease_n(a2, 2);
    return 10;
  }
  v88 = _stringCompareWithSmolCheck(_:_:expecting:)(v85, v86, a1, a2, 0);
  swift_bridgeObjectRelease(v87);
  if ((v88 & 1) != 0)
    goto LABEL_6;
  if (a1 == 0x6E4F6B6369507369 && a2 == 0xEC0000004E664F65)
  {
    swift_bridgeObjectRelease(0xEC0000004E664F65);
    return 20;
  }
  else
  {
    v89 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E4F6B6369507369, 0xEC0000004E664F65, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v89 & 1) != 0)
      return 20;
    else
      return 21;
  }
}

uint64_t sub_100010E7C(uint64_t a1, unint64_t a2)
{
  BOOL v3;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v11;

  v3 = a1 == 0x49656C6369747261 && a2 == 0xE900000000000044;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x49656C6369747261, 0xE900000000000044, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  if (a1 == 0x496C656E6E616863 && a2 == 0xE900000000000044
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x496C656E6E616863, 0xE900000000000044, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 1;
  }
  if (a1 == 2036625250 && a2 == 0xE400000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(2036625250, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 2;
  }
  if (a1 == 0x446873696C627570 && a2 == 0xEB00000000657461
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x446873696C627570, 0xEB00000000657461, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 3;
  }
  if (a1 == 0x646961507369 && a2 == 0xE600000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x646961507369, 0xE600000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 4;
  }
  if (a1 == 0x656C646E75427369 && a2 == 0xEC00000064696150
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656C646E75427369, 0xEC00000064696150, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 5;
  }
  if (a1 == 0xD000000000000011)
  {
    v6 = 0x8000000100021440;
    if (a2 == 0x8000000100021440)
      goto LABEL_31;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011, 0x8000000100021440, a1, a2, 0) & 1) != 0)
  {
    v6 = a2;
LABEL_31:
    swift_bridgeObjectRelease(v6);
    return 6;
  }
  if (a1 == 0xD000000000000012 && a2 == 0x8000000100021460)
  {
    v7 = 0x8000000100021460;
LABEL_37:
    swift_bridgeObjectRelease(v7);
    return 7;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000012, 0x8000000100021460, a1, a2, 0) & 1) != 0)
  {
    v7 = a2;
    goto LABEL_37;
  }
  if (a1 == 0x73694C6369706F74 && a2 == 0xE900000000000074
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x73694C6369706F74, 0xE900000000000074, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 8;
  }
  if (a1 == 0xD000000000000010 && a2 == 0x8000000100021480)
  {
    v8 = 0x8000000100021480;
LABEL_47:
    swift_bridgeObjectRelease(v8);
    return 9;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000010, 0x8000000100021480, a1, a2, 0) & 1) != 0)
  {
    v8 = a2;
    goto LABEL_47;
  }
  if (a1 == 25705 && a2 == 0xE200000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(25705, 0xE200000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 10;
  }
  if (a1 == 0x726F697661686562 && a2 == 0xED00007367616C46
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x726F697661686562, 0xED00007367616C46, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 11;
  }
  if (a1 == 0x4972657473756C63 && a2 == 0xE900000000000044
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x4972657473756C63, 0xE900000000000044, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 12;
  }
  if (a1 == 0x69616E626D756874 && a2 == 0xE90000000000006CLL
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x69616E626D756874, 0xE90000000000006CLL, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 13;
  }
  if (a1 == 0x656873696C627570 && a2 == 0xED00006F676F4C72
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656873696C627570, 0xED00006F676F4C72, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 14;
  }
  if (a1 == 0xD000000000000011)
  {
    v9 = 0x80000001000214A0;
    if (a2 == 0x80000001000214A0)
      goto LABEL_72;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000011, 0x80000001000214A0, a1, a2, 0) & 1) != 0)
  {
    v9 = a2;
LABEL_72:
    swift_bridgeObjectRelease(v9);
    return 15;
  }
  if (a1 == 0xD000000000000014 && a2 == 0x80000001000214C0)
  {
    v10 = 0x80000001000214C0;
LABEL_78:
    swift_bridgeObjectRelease(v10);
    return 16;
  }
  if ((_stringCompareWithSmolCheck(_:_:expecting:)(0xD000000000000014, 0x80000001000214C0, a1, a2, 0) & 1) != 0)
  {
    v10 = a2;
    goto LABEL_78;
  }
  if (a1 == 0x656873696C627570 && a2 == 0xED0000656D614E72
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656873696C627570, 0xED0000656D614E72, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 17;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656C746974, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 18;
  }
  else if (a1 == 0x74707265637865 && a2 == 0xE700000000000000
         || (_stringCompareWithSmolCheck(_:_:expecting:)(0x74707265637865, 0xE700000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 19;
  }
  else if (a1 == 0x6E4F6B6369507369 && a2 == 0xEC0000004E664F65)
  {
    swift_bridgeObjectRelease(0xEC0000004E664F65);
    return 20;
  }
  else
  {
    v11 = _stringCompareWithSmolCheck(_:_:expecting:)(0x6E4F6B6369507369, 0xEC0000004E664F65, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v11 & 1) != 0)
      return 20;
    else
      return 21;
  }
}

unint64_t sub_100011684(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008628(&qword_10002A008);
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
  v6 = (void **)(a1 + 48);
  while (1)
  {
    v7 = (uint64_t)*(v6 - 2);
    v8 = (uint64_t)*(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    v10 = v9;
    result = sub_100011BE0(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v10;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4[2] = v16;
    v6 += 3;
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

unint64_t sub_10001179C(uint64_t a1)
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
  sub_100008628(&qword_10002A040);
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
    sub_100015998(v7, (uint64_t)v16);
    result = sub_100011C44((uint64_t)v16);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v10 = v4[6] + 40 * result;
    v11 = v16[0];
    v12 = v16[1];
    *(_QWORD *)(v10 + 32) = v17;
    *(_OWORD *)v10 = v11;
    *(_OWORD *)(v10 + 16) = v12;
    result = (unint64_t)sub_10000D698(&v18, (_OWORD *)(v4[7] + 32 * result));
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

uint64_t sub_1000118C8()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ArticleNotificationClusterIdDeduper()
{
  return objc_opt_self(_TtC32NewsNotificationServiceExtension35ArticleNotificationClusterIdDeduper);
}

uint64_t sub_1000118F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_10002A000 + dword_10002A000);
  v7 = (_QWORD *)swift_task_alloc(unk_10002A004);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100011970;
  return v9(a1, a2, a3);
}

uint64_t sub_100011970(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc(*(_QWORD *)(*v2 + 16));
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

char *sub_1000119C8(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_100008628(&qword_10002A050);
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
    sub_1000146F8(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_100011AD4(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_100008628(&qword_10002A028);
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
    sub_100014A50(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

unint64_t sub_100011BE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100011C74(a1, a2, v5);
}

unint64_t sub_100011C44(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100011D54(a1, v4);
}

unint64_t sub_100011C74(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_100011D54(uint64_t a1, uint64_t a2)
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
      sub_10000D5B0(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_10000D664((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

Swift::Int sub_100011E18(uint64_t a1, uint64_t a2)
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
  sub_100008628(&qword_10002A008);
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

uint64_t sub_100012124(uint64_t a1, uint64_t a2)
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
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char v32;
  unint64_t v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD v38[2];
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100008628(&qword_10002A040);
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
  v12 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 64;
  result = swift_retain(v5);
  v15 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v15 << 6);
      goto LABEL_25;
    }
    v22 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_45:
      __break(1u);
LABEL_46:
      __break(1u);
      return result;
    }
    if (v22 >= v12)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v15;
    if (!v24)
    {
      v15 = v22 + 1;
      if (v22 + 1 >= v12)
        goto LABEL_37;
      v24 = *(_QWORD *)(v37 + 8 * v15);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v12)
        {
LABEL_37:
          swift_release(v5);
          if ((a2 & 1) == 0)
            goto LABEL_44;
          goto LABEL_40;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v15 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_46;
            if (v15 >= v12)
              goto LABEL_37;
            v24 = *(_QWORD *)(v37 + 8 * v15);
            ++v25;
            if (v24)
              goto LABEL_24;
          }
        }
        v15 = v25;
      }
    }
LABEL_24:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v15 << 6);
LABEL_25:
    v26 = *(_QWORD *)(v5 + 48) + 40 * v21;
    if ((a2 & 1) != 0)
    {
      v27 = *(_OWORD *)v26;
      v28 = *(_OWORD *)(v26 + 16);
      v41 = *(_QWORD *)(v26 + 32);
      v39 = v27;
      v40 = v28;
      sub_10000D698((_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v21), v38);
    }
    else
    {
      sub_10000D5B0(v26, (uint64_t)&v39);
      sub_10000D5EC(*(_QWORD *)(v5 + 56) + 32 * v21, (uint64_t)v38);
    }
    result = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v8 + 40));
    v29 = -1 << *(_BYTE *)(v8 + 32);
    v30 = result & ~v29;
    v31 = v30 >> 6;
    if (((-1 << v30) & ~*(_QWORD *)(v13 + 8 * (v30 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v30) & ~*(_QWORD *)(v13 + 8 * (v30 >> 6)))) | v30 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v32 = 0;
      v33 = (unint64_t)(63 - v29) >> 6;
      do
      {
        if (++v31 == v33 && (v32 & 1) != 0)
        {
          __break(1u);
          goto LABEL_45;
        }
        v34 = v31 == v33;
        if (v31 == v33)
          v31 = 0;
        v32 |= v34;
        v35 = *(_QWORD *)(v13 + 8 * v31);
      }
      while (v35 == -1);
      v16 = __clz(__rbit64(~v35)) + (v31 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    v17 = *(_QWORD *)(v8 + 48) + 40 * v16;
    v18 = v39;
    v19 = v40;
    *(_QWORD *)(v17 + 32) = v41;
    *(_OWORD *)v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
    result = (uint64_t)sub_10000D698(v38, (_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v16));
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_44;
LABEL_40:
  v36 = 1 << *(_BYTE *)(v5 + 32);
  if (v36 >= 64)
    bzero(v23, ((unint64_t)(v36 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v36;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_44:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_100012438(uint64_t a1, uint64_t a2)
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
  sub_100008628(&qword_10002A038);
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

_OWORD *sub_10001274C(unint64_t a1, uint64_t a2, _OWORD *a3, _QWORD *a4)
{
  uint64_t v5;
  __int128 v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a4[(a1 >> 6) + 8] |= 1 << a1;
  v5 = a4[6] + 40 * a1;
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)v5 = *(_OWORD *)a2;
  *(_OWORD *)(v5 + 16) = v6;
  *(_QWORD *)(v5 + 32) = *(_QWORD *)(a2 + 32);
  result = sub_10000D698(a3, (_OWORD *)(a4[7] + 32 * a1));
  v8 = a4[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a4[2] = v10;
  return result;
}

id sub_1000127C4()
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
  sub_100008628(&qword_10002A008);
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

void *sub_100012974()
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
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  sub_100008628(&qword_10002A040);
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
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_10000D5B0(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_10000D5EC(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_10000D698(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_100012B58()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
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
  sub_100008628(&qword_10002A038);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    swift_release(v2);
    *v1 = v4;
    return;
  }
  v5 = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)v5 >= v2 + 64 + 8 * v7)
    memmove(v5, (const void *)(v2 + 64), 8 * v7);
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
    swift_bridgeObjectRetain(v20);
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
}

_OWORD *sub_100012D0C(_OWORD *a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _OWORD *result;
  unint64_t v19;
  char v20;
  _BYTE v21[40];

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v10 = sub_100011C44(a2);
  v11 = v8[2];
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    v15 = v8[3];
    if (v15 >= v13 && (a3 & 1) != 0)
    {
LABEL_7:
      v16 = *v4;
      if ((v14 & 1) != 0)
      {
LABEL_8:
        v17 = (_QWORD *)(v16[7] + 32 * v10);
        sub_100008608(v17);
        return sub_10000D698(a1, v17);
      }
      goto LABEL_11;
    }
    if (v15 >= v13 && (a3 & 1) == 0)
    {
      sub_100012974();
      goto LABEL_7;
    }
    sub_100012124(v13, a3 & 1);
    v19 = sub_100011C44(a2);
    if ((v14 & 1) == (v20 & 1))
    {
      v10 = v19;
      v16 = *v4;
      if ((v14 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_10000D5B0(a2, (uint64_t)v21);
      return sub_10001274C(v10, (uint64_t)v21, a1, v16);
    }
  }
  result = (_OWORD *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for AnyHashable);
  __break(1u);
  return result;
}

void sub_100012E44(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_100011BE0(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100012B58();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      swift_bridgeObjectRelease(*(_QWORD *)(v19 + 8 * v12));
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain(a3);
      return;
    }
    goto LABEL_14;
  }
  sub_100012438(v15, a4 & 1);
  v20 = sub_100011BE0(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
}

uint64_t sub_100012FA0(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v2 = sub_1000146E4(v2);
    *a1 = v2;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1000131F0(v6);
  return specialized ContiguousArray._endMutation()();
}

_QWORD *sub_100013018(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return &_swiftEmptyArrayStorage;
  v3 = sub_100008628(&qword_10002A028);
  v4 = (_QWORD *)swift_allocObject(v3, 16 * v1 + 32, 7);
  v5 = j__malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 17;
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 4);
  v7 = sub_1000141FC((uint64_t)&v10, v4 + 4, v1, a1);
  v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_1000159E0(v8);
  if (v7 != v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v4;
}

_QWORD *sub_1000130FC(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return _swiftEmptyArrayStorage;
  while (1)
  {
    if (v2 <= 0)
    {
      v4 = _swiftEmptyArrayStorage;
    }
    else
    {
      v3 = sub_100008628(&qword_10002A010);
      v4 = (_QWORD *)swift_allocObject(v3, 8 * v2 + 32, 7);
      v5 = j__malloc_size(v4);
      v6 = v5 - 32;
      if (v5 < 32)
        v6 = v5 - 25;
      v4[2] = v2;
      v4[3] = (2 * (v6 >> 3)) | 1;
    }
    swift_bridgeObjectRetain(v1);
    v7 = sub_1000143F8((unint64_t)(v4 + 4), v2, v1);
    v1 = v8;
    swift_bridgeObjectRelease(v7);
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    if (v1 < 0)
      v9 = v1;
    else
      v9 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v9);
    swift_bridgeObjectRelease(v1);
    if (!v2)
      return _swiftEmptyArrayStorage;
  }
  return v4;
}

void sub_1000131F0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;
  Swift::Int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char *v10;
  Swift::Int v11;
  uint64_t v12;
  unint64_t v13;
  Swift::Int v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  double v20;
  double v21;
  id v22;
  id v23;
  double v24;
  double v25;
  id *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  double v32;
  double v33;
  id v34;
  id v35;
  double v36;
  double v37;
  uint64_t *v38;
  Swift::Int v39;
  Swift::Int v40;
  uint64_t *v41;
  uint64_t v42;
  Swift::Int v43;
  uint64_t v44;
  void *v45;
  Swift::Int v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  double v52;
  double v53;
  id v54;
  id v55;
  double v56;
  double v57;
  void *v58;
  unint64_t v59;
  unint64_t v60;
  char *v61;
  char *v62;
  unint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  unint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  BOOL v84;
  uint64_t v85;
  char v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  BOOL v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  char *v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  unint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t *v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  Swift::Int v123;
  Swift::Int v124;
  Swift::Int v125;
  Swift::Int v126;
  uint64_t v127;
  void **v128;
  uint64_t v129;
  uint64_t v130;

  v2 = v1;
  v4 = a1[1];
  v5 = _minimumMergeRunLength(_:)(v4);
  if (v5 >= v4)
  {
    if (v4 < 0)
      goto LABEL_134;
    if (v4)
      sub_100013AB8(0, v4, 1, a1);
    return;
  }
  if (v4 >= 0)
    v6 = v4;
  else
    v6 = v4 + 1;
  if (v4 < -1)
    goto LABEL_142;
  v123 = v5;
  v119 = a1;
  if (v4 < 2)
  {
    v10 = (char *)&_swiftEmptyArrayStorage;
    v130 = (uint64_t)&_swiftEmptyArrayStorage;
    v128 = (void **)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v4 != 1)
    {
      v13 = *((_QWORD *)&_swiftEmptyArrayStorage + 2);
      if (v13 >= 2)
        goto LABEL_98;
LABEL_110:
      v110 = v10;
LABEL_111:
      v118 = swift_bridgeObjectRelease(v110);
      *(_QWORD *)((v130 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()(v118);
      swift_bridgeObjectRelease(v130);
      return;
    }
  }
  else
  {
    v7 = v6 >> 1;
    v8 = sub_10000B854();
    v9 = static Array._allocateBufferUninitialized(minimumCapacity:)(v7, v8);
    *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10) = v7;
    v128 = (void **)((v9 & 0xFFFFFFFFFFFFFF8) + 32);
    v130 = v9;
  }
  v11 = 0;
  v12 = *a1;
  v120 = *a1 - 8;
  v121 = *a1 + 16;
  v10 = (char *)&_swiftEmptyArrayStorage;
  v125 = v4;
  v129 = *a1;
  while (1)
  {
    v14 = v11++;
    v126 = v14;
    if (v11 < v4)
    {
      v15 = *(void **)(v12 + 8 * v14);
      v16 = *(id *)(v12 + 8 * v11);
      v17 = v15;
      v18 = objc_msgSend(v16, "request");
      v19 = objc_msgSend(v18, "content");

      objc_msgSend(v19, "relevanceScore");
      v21 = v20;

      v22 = objc_msgSend(v17, "request");
      v23 = objc_msgSend(v22, "content");

      v4 = v125;
      objc_msgSend(v23, "relevanceScore");
      v25 = v24;

      v11 = v14 + 2;
      if (v14 + 2 < v125)
      {
        v26 = (id *)(v121 + 8 * v14);
        while (1)
        {
          v27 = *(v26 - 1);
          v28 = *v26;
          v29 = v27;
          v30 = objc_msgSend(v28, "request");
          v31 = objc_msgSend(v30, "content");

          objc_msgSend(v31, "relevanceScore");
          v33 = v32;

          v34 = objc_msgSend(v29, "request");
          v35 = objc_msgSend(v34, "content");

          objc_msgSend(v35, "relevanceScore");
          v37 = v36;

          if (v25 < v21 == v37 >= v33)
            break;
          ++v11;
          ++v26;
          v4 = v125;
          if (v125 == v11)
          {
            v11 = v125;
            goto LABEL_22;
          }
        }
        v4 = v125;
      }
LABEL_22:
      v12 = v129;
      if (v25 < v21)
      {
        if (v11 < v14)
          goto LABEL_135;
        if (v14 < v11)
        {
          v38 = (uint64_t *)(v120 + 8 * v11);
          v39 = v11;
          v40 = v14;
          v41 = (uint64_t *)(v129 + 8 * v14);
          do
          {
            if (v40 != --v39)
            {
              if (!v129)
                goto LABEL_140;
              v42 = *v41;
              *v41 = *v38;
              *v38 = v42;
            }
            ++v40;
            --v38;
            ++v41;
          }
          while (v40 < v39);
        }
      }
    }
    if (v11 >= v4)
      goto LABEL_49;
    if (__OFSUB__(v11, v14))
      goto LABEL_133;
    if (v11 - v14 >= v123)
      goto LABEL_49;
    if (__OFADD__(v14, v123))
      goto LABEL_136;
    v43 = v14 + v123 >= v4 ? v4 : v14 + v123;
    if (v43 < v14)
      break;
    if (v11 != v43)
    {
      v122 = v10;
      v44 = v120 + 8 * v11;
      v124 = v43;
      do
      {
        v45 = *(void **)(v12 + 8 * v11);
        v46 = v14;
        v127 = v44;
        while (1)
        {
          v47 = *(void **)v44;
          v48 = v45;
          v49 = v47;
          v50 = objc_msgSend(v48, "request");
          v51 = objc_msgSend(v50, "content");

          objc_msgSend(v51, "relevanceScore");
          v53 = v52;

          v54 = objc_msgSend(v49, "request");
          v55 = objc_msgSend(v54, "content");

          objc_msgSend(v55, "relevanceScore");
          v57 = v56;

          if (v57 >= v53)
            break;
          v12 = v129;
          if (!v129)
            goto LABEL_138;
          v58 = *(void **)v44;
          v45 = *(void **)(v44 + 8);
          *(_QWORD *)v44 = v45;
          *(_QWORD *)(v44 + 8) = v58;
          v44 -= 8;
          if (v11 == ++v46)
            goto LABEL_42;
        }
        v12 = v129;
LABEL_42:
        ++v11;
        v14 = v126;
        v44 = v127 + 8;
      }
      while (v11 != v124);
      v11 = v124;
      v10 = v122;
    }
LABEL_49:
    if (v11 < v14)
      goto LABEL_128;
    if ((swift_isUniquelyReferenced_nonNull_native(v10) & 1) == 0)
      v10 = sub_100014048(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
    v60 = *((_QWORD *)v10 + 2);
    v59 = *((_QWORD *)v10 + 3);
    v13 = v60 + 1;
    v12 = v129;
    if (v60 >= v59 >> 1)
    {
      v109 = sub_100014048((char *)(v59 > 1), v60 + 1, 1, v10);
      v12 = v129;
      v10 = v109;
    }
    *((_QWORD *)v10 + 2) = v13;
    v61 = v10 + 32;
    v62 = &v10[16 * v60 + 32];
    *(_QWORD *)v62 = v14;
    *((_QWORD *)v62 + 1) = v11;
    if (v60)
    {
      while (1)
      {
        v63 = v13 - 1;
        if (v13 >= 4)
        {
          v68 = &v61[16 * v13];
          v69 = *((_QWORD *)v68 - 8);
          v70 = *((_QWORD *)v68 - 7);
          v74 = __OFSUB__(v70, v69);
          v71 = v70 - v69;
          if (v74)
            goto LABEL_117;
          v73 = *((_QWORD *)v68 - 6);
          v72 = *((_QWORD *)v68 - 5);
          v74 = __OFSUB__(v72, v73);
          v66 = v72 - v73;
          v67 = v74;
          if (v74)
            goto LABEL_118;
          v75 = v13 - 2;
          v76 = &v61[16 * v13 - 32];
          v78 = *(_QWORD *)v76;
          v77 = *((_QWORD *)v76 + 1);
          v74 = __OFSUB__(v77, v78);
          v79 = v77 - v78;
          if (v74)
            goto LABEL_120;
          v74 = __OFADD__(v66, v79);
          v80 = v66 + v79;
          if (v74)
            goto LABEL_123;
          if (v80 >= v71)
          {
            v98 = &v61[16 * v63];
            v100 = *(_QWORD *)v98;
            v99 = *((_QWORD *)v98 + 1);
            v74 = __OFSUB__(v99, v100);
            v101 = v99 - v100;
            if (v74)
              goto LABEL_127;
            v91 = v66 < v101;
            goto LABEL_86;
          }
        }
        else
        {
          if (v13 != 3)
          {
            v92 = *((_QWORD *)v10 + 4);
            v93 = *((_QWORD *)v10 + 5);
            v74 = __OFSUB__(v93, v92);
            v85 = v93 - v92;
            v86 = v74;
            goto LABEL_80;
          }
          v65 = *((_QWORD *)v10 + 4);
          v64 = *((_QWORD *)v10 + 5);
          v74 = __OFSUB__(v64, v65);
          v66 = v64 - v65;
          v67 = v74;
        }
        if ((v67 & 1) != 0)
          goto LABEL_119;
        v75 = v13 - 2;
        v81 = &v61[16 * v13 - 32];
        v83 = *(_QWORD *)v81;
        v82 = *((_QWORD *)v81 + 1);
        v84 = __OFSUB__(v82, v83);
        v85 = v82 - v83;
        v86 = v84;
        if (v84)
          goto LABEL_122;
        v87 = &v61[16 * v63];
        v89 = *(_QWORD *)v87;
        v88 = *((_QWORD *)v87 + 1);
        v74 = __OFSUB__(v88, v89);
        v90 = v88 - v89;
        if (v74)
          goto LABEL_125;
        if (__OFADD__(v85, v90))
          goto LABEL_126;
        if (v85 + v90 >= v66)
        {
          v91 = v66 < v90;
LABEL_86:
          if (v91)
            v63 = v75;
          goto LABEL_88;
        }
LABEL_80:
        if ((v86 & 1) != 0)
          goto LABEL_121;
        v94 = &v61[16 * v63];
        v96 = *(_QWORD *)v94;
        v95 = *((_QWORD *)v94 + 1);
        v74 = __OFSUB__(v95, v96);
        v97 = v95 - v96;
        if (v74)
          goto LABEL_124;
        if (v97 < v85)
          goto LABEL_14;
LABEL_88:
        v102 = v63 - 1;
        if (v63 - 1 >= v13)
        {
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
          goto LABEL_137;
        }
        if (!v12)
          goto LABEL_139;
        v103 = v10;
        v104 = &v61[16 * v102];
        v105 = *(_QWORD *)v104;
        v106 = &v61[16 * v63];
        v107 = *((_QWORD *)v106 + 1);
        sub_100013C34((void **)(v12 + 8 * *(_QWORD *)v104), (id *)(v12 + 8 * *(_QWORD *)v106), v12 + 8 * v107, v128);
        if (v1)
        {
LABEL_96:
          v110 = v103;
          goto LABEL_111;
        }
        if (v107 < v105)
          goto LABEL_114;
        if (v63 > *((_QWORD *)v103 + 2))
          goto LABEL_115;
        *(_QWORD *)v104 = v105;
        *(_QWORD *)&v61[16 * v102 + 8] = v107;
        v108 = *((_QWORD *)v103 + 2);
        if (v63 >= v108)
          goto LABEL_116;
        v10 = v103;
        v13 = v108 - 1;
        memmove(&v61[16 * v63], v106 + 16, 16 * (v108 - 1 - v63));
        *((_QWORD *)v103 + 2) = v108 - 1;
        v12 = v129;
        if (v108 <= 2)
          goto LABEL_14;
      }
    }
    v13 = 1;
LABEL_14:
    v4 = v125;
    if (v11 >= v125)
    {
      v2 = v1;
      if (v13 < 2)
        goto LABEL_110;
LABEL_98:
      v111 = *v119;
      while (1)
      {
        v112 = v13 - 2;
        if (v13 < 2)
          goto LABEL_129;
        if (!v111)
          goto LABEL_141;
        v103 = v10;
        v113 = v10 + 32;
        v114 = *(_QWORD *)&v10[16 * v112 + 32];
        v115 = *(_QWORD *)&v10[16 * v13 + 24];
        sub_100013C34((void **)(v111 + 8 * v114), (id *)(v111 + 8 * *(_QWORD *)&v113[16 * v13 - 16]), v111 + 8 * v115, v128);
        if (v2)
          goto LABEL_96;
        if (v115 < v114)
          goto LABEL_130;
        if ((swift_isUniquelyReferenced_nonNull_native(v103) & 1) == 0)
          v103 = sub_1000141E8((uint64_t)v103);
        if (v112 >= *((_QWORD *)v103 + 2))
          goto LABEL_131;
        v116 = &v103[16 * v112 + 32];
        *(_QWORD *)v116 = v114;
        *((_QWORD *)v116 + 1) = v115;
        v117 = *((_QWORD *)v103 + 2);
        if (v13 > v117)
          goto LABEL_132;
        v10 = v103;
        memmove(&v103[16 * v13 + 16], &v103[16 * v13 + 32], 16 * (v117 - v13));
        *((_QWORD *)v103 + 2) = v117 - 1;
        v13 = v117 - 1;
        if (v117 <= 2)
          goto LABEL_110;
      }
    }
  }
LABEL_137:
  __break(1u);
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
}

void sub_100013AB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  double v12;
  double v13;
  id v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (a3 != a2)
  {
    v22 = *a4;
    v4 = *a4 + 8 * a3 - 8;
LABEL_5:
    v5 = *(void **)(v22 + 8 * a3);
    v6 = a1;
    v21 = v4;
    v23 = a3;
    while (1)
    {
      v7 = *(void **)v4;
      v8 = v5;
      v9 = v7;
      v10 = objc_msgSend(v8, "request");
      v11 = objc_msgSend(v10, "content");

      objc_msgSend(v11, "relevanceScore");
      v13 = v12;

      v14 = objc_msgSend(v9, "request");
      v15 = objc_msgSend(v14, "content");

      objc_msgSend(v15, "relevanceScore");
      v17 = v16;

      if (v17 >= v13)
      {
LABEL_4:
        a3 = v23 + 1;
        v4 = v21 + 8;
        if (v23 + 1 == a2)
          return;
        goto LABEL_5;
      }
      if (!v22)
        break;
      v18 = *(void **)v4;
      v5 = *(void **)(v4 + 8);
      *(_QWORD *)v4 = v5;
      *(_QWORD *)(v4 + 8) = v18;
      v4 -= 8;
      if (v23 == ++v6)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_100013C34(void **__src, id *a2, unint64_t a3, void **a4)
{
  id *v4;
  void **v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  double v19;
  id v20;
  id v21;
  double v22;
  double v23;
  id *v24;
  char *v25;
  id *v26;
  id *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  double v35;
  double v36;
  id v37;
  id v38;
  double v39;
  double v40;
  uint64_t result;
  id *v43;
  char *v44;
  id *v45;
  void **v47;
  char *v48;
  void **v49;
  id *v50;

  v4 = a2;
  v5 = __src;
  v6 = (char *)a2 - (char *)__src;
  v7 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v7 = (char *)a2 - (char *)__src;
  v8 = v7 >> 3;
  v9 = a3 - (_QWORD)a2;
  v10 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v10 = a3 - (_QWORD)a2;
  v11 = v10 >> 3;
  v50 = __src;
  v49 = a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != a2 || &a2[v11] <= a4)
        memmove(a4, a2, 8 * v11);
      v25 = (char *)&a4[v11];
      v48 = v25;
      v50 = v4;
      if (v5 < v4 && v9 >= 8)
      {
        v26 = (id *)(a3 - 8);
        v27 = v4;
        v47 = v5;
        do
        {
          v43 = (id *)v25;
          v45 = v26 + 1;
          v29 = (void *)*((_QWORD *)v25 - 1);
          v25 -= 8;
          v28 = v29;
          v30 = *--v27;
          v31 = v28;
          v32 = v30;
          v33 = objc_msgSend(v31, "request");
          v34 = objc_msgSend(v33, "content");

          objc_msgSend(v34, "relevanceScore");
          v36 = v35;

          v37 = objc_msgSend(v32, "request");
          v38 = objc_msgSend(v37, "content");

          objc_msgSend(v38, "relevanceScore");
          v40 = v39;

          if (v40 >= v36)
          {
            v48 = v25;
            v27 = v4;
            if (v45 < v43 || v26 >= v43 || v45 != v43)
              *v26 = *(id *)v25;
          }
          else
          {
            v25 = (char *)v43;
            if (v45 != v4 || v26 >= v4)
              *v26 = *v27;
            v50 = v27;
          }
          if (v27 <= v47)
            break;
          --v26;
          v4 = v27;
        }
        while (v25 > (char *)a4);
      }
      goto LABEL_42;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != __src || &__src[v8] <= a4)
      memmove(a4, __src, 8 * v8);
    v44 = (char *)&a4[v8];
    v48 = v44;
    if ((unint64_t)v4 < a3 && v6 >= 8)
    {
      v12 = a4;
      do
      {
        v13 = *v12;
        v14 = *v4;
        v15 = v13;
        v16 = objc_msgSend(v14, "request");
        v17 = objc_msgSend(v16, "content");

        objc_msgSend(v17, "relevanceScore");
        v19 = v18;

        v20 = objc_msgSend(v15, "request");
        v21 = objc_msgSend(v20, "content");

        objc_msgSend(v21, "relevanceScore");
        v23 = v22;

        if (v23 >= v19)
        {
          if (v5 != v12)
            *v5 = *v12;
          v49 = ++v12;
          v24 = v4;
        }
        else
        {
          v24 = v4 + 1;
          if (v5 < v4 || v5 >= v24 || v5 != v4)
            *v5 = *v4;
        }
        ++v5;
        if (v12 >= (void **)v44)
          break;
        v4 = v24;
      }
      while ((unint64_t)v24 < a3);
      v50 = v5;
    }
LABEL_42:
    sub_100014140((void **)&v50, (const void **)&v49, &v48);
    return 1;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

char *sub_100014048(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_100008628(&qword_10002A030);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 16 * v8);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

char *sub_100014140(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;
  char v9;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    v9 = 2;
    result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v9, 1046, 0);
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_1000141E8(uint64_t a1)
{
  return sub_100014048(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1000141FC(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain(v21);
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1000143F8(unint64_t a1, uint64_t a2, uint64_t a3)
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
        sub_10001590C();
        swift_bridgeObjectRetain(a3);
        for (i = 0; i != v7; ++i)
        {
          sub_100008628(&qword_10002A018);
          v13 = sub_1000145F0(v18, i, a3);
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
    sub_10000B854();
    swift_arrayInitWithCopy(a1);
    return a3;
  }
LABEL_26:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

void (*sub_1000145F0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_100014670(v6, a2, a3);
  return sub_100014644;
}

void sub_100014644(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_100014670(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
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
    return sub_1000146DC;
  }
  __break(1u);
  return result;
}

void sub_1000146DC(id *a1)
{

}

uint64_t sub_1000146E4(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_1000146F8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

uint64_t sub_1000147E8(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;

  v2 = objc_msgSend(a1, "categoryIdentifier");
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
  v5 = v4;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationArticleCategory);
  if (v3 == v6 && v5 == v7)
  {
    swift_bridgeObjectRelease_n(v5, 2);
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
    swift_bridgeObjectRelease(v5);
    swift_bridgeObjectRelease(v9);
    if ((v10 & 1) == 0)
      return 0;
  }
  v11 = objc_msgSend(a1, "userInfo");
  v12 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadNewsKey);
  v23 = v13;
  AnyHashable.init<A>(_:)(&v24, &v22, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v12 + 16) && (v14 = sub_100011C44((uint64_t)&v24), (v15 & 1) != 0))
  {
    sub_10000D5EC(*(_QWORD *)(v12 + 56) + 32 * v14, (uint64_t)&v25);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  swift_bridgeObjectRelease(v12);
  sub_10000D664((uint64_t)&v24);
  if (!*((_QWORD *)&v26 + 1))
  {
    sub_100015958((uint64_t)&v25);
LABEL_19:
    v25 = 0u;
    v26 = 0u;
LABEL_20:
    sub_100015958((uint64_t)&v25);
    return 0;
  }
  v16 = sub_100008628(&qword_100029D60);
  if ((swift_dynamicCast(&v22, &v25, (char *)&type metadata for Any + 8, v16, 6) & 1) == 0)
    goto LABEL_19;
  v17 = v22;
  if (!v22)
    goto LABEL_19;
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationPayloadClusterIDKey);
  v23 = v18;
  AnyHashable.init<A>(_:)(&v24, &v22, &type metadata for String, &protocol witness table for String);
  if (*(_QWORD *)(v17 + 16) && (v19 = sub_100011C44((uint64_t)&v24), (v20 & 1) != 0))
  {
    sub_10000D5EC(*(_QWORD *)(v17 + 56) + 32 * v19, (uint64_t)&v25);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  swift_bridgeObjectRelease(v17);
  sub_10000D664((uint64_t)&v24);
  if (!*((_QWORD *)&v26 + 1))
    goto LABEL_20;
  if (swift_dynamicCast(&v24, &v25, (char *)&type metadata for Any + 8, &type metadata for String, 6))
    return v24;
  else
    return 0;
}

uint64_t sub_100014A50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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

void sub_100014B40(id *a1, uint64_t a2, uint64_t a3, void *a4, char **a5, _QWORD *a6)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  char v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  id v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  char v54;
  uint64_t v55;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v9 = *a1;
  v10 = objc_msgSend(*a1, "request");
  v11 = objc_msgSend(v10, "content");

  v12 = objc_msgSend(v11, "categoryIdentifier");
  v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
  v15 = v14;

  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationArticleCategory);
  if (v13 == v16 && v15 == v17)
  {
    swift_bridgeObjectRelease_n(v15, 2);
LABEL_8:
    v21 = objc_msgSend(v9, "request");
    v22 = objc_msgSend(v21, "content");

    v58 = sub_1000147E8(v22);
    v24 = v23;

    if (!v24)
      return;
    if (a3 && (v58 == a2 && v24 == a3 || (_stringCompareWithSmolCheck(_:_:expecting:)(a2, a3, v58, v24, 0) & 1) != 0))
    {
      v25 = objc_msgSend(v9, "request");
      v26 = objc_msgSend(v25, "content");

      objc_msgSend(v26, "relevanceScore");
      v28 = v27;

      objc_msgSend(a4, "relevanceScore");
      if (v28 < v29)
      {
        v30 = objc_msgSend(v9, "request");
        v31 = objc_msgSend(v30, "identifier");

        v32 = static String._unconditionallyBridgeFromObjectiveC(_:)(v31);
        v34 = v33;

        v35 = *a5;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a5);
        *a5 = v35;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v35 = sub_100011AD4(0, *((_QWORD *)v35 + 2) + 1, 1, v35);
          *a5 = v35;
        }
        v38 = *((_QWORD *)v35 + 2);
        v37 = *((_QWORD *)v35 + 3);
        if (v38 >= v37 >> 1)
        {
          v35 = sub_100011AD4((char *)(v37 > 1), v38 + 1, 1, v35);
          *a5 = v35;
        }
        *((_QWORD *)v35 + 2) = v38 + 1;
        v39 = &v35[16 * v38];
        *((_QWORD *)v39 + 4) = v32;
        *((_QWORD *)v39 + 5) = v34;
      }
    }
    v40 = *a6;
    if (*(_QWORD *)(*a6 + 16))
    {
      swift_bridgeObjectRetain(v24);
      v41 = sub_100011BE0(v58, v24);
      if ((v42 & 1) != 0)
      {
        v43 = *(_QWORD *)(*(_QWORD *)(v40 + 56) + 8 * v41);
        swift_bridgeObjectRetain(v43);
        swift_bridgeObjectRelease(v24);
        v44 = v9;
        specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
        v46 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x10);
        v45 = *(_QWORD *)((v43 & 0xFFFFFFFFFFFFFF8) + 0x18);
        if (v46 >= v45 >> 1)
          specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v45 > 1, v46 + 1, 1);
        v47 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v46, v44);
        specialized Array._endMutation()(v47);
        v48 = swift_isUniquelyReferenced_nonNull_native(*a6);
        v59 = *a6;
        *a6 = 0x8000000000000000;
        sub_100012E44(v43, v58, v24, v48);
        v49 = v59;
        goto LABEL_26;
      }
      swift_bridgeObjectRelease(v24);
    }
    v50 = sub_100008628(&qword_10002A010);
    v51 = swift_allocObject(v50, 40, 7);
    *(_OWORD *)(v51 + 16) = xmmword_10001F5F0;
    *(_QWORD *)(v51 + 32) = v9;
    v60 = v51;
    specialized Array._endMutation()(v51);
    v52 = v60;
    v53 = v9;
    v54 = swift_isUniquelyReferenced_nonNull_native(*a6);
    v61 = *a6;
    *a6 = 0x8000000000000000;
    sub_100012E44(v52, v58, v24, v54);
    v49 = v61;
LABEL_26:
    v55 = *a6;
    *a6 = v49;
    swift_bridgeObjectRelease(v24);
    swift_bridgeObjectRelease(v55);
    return;
  }
  v19 = v17;
  v20 = _stringCompareWithSmolCheck(_:_:expecting:)(v13, v15, v16, v17, 0);
  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v19);
  if ((v20 & 1) != 0)
    goto LABEL_8;
}

uint64_t sub_100014F78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v4 = a1;
    v5 = *v3;
    if (!((unint64_t)*v3 >> 62))
    {
      v7 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v7 >= a2)
        goto LABEL_4;
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
  }
  if (v5 < 0)
    v27 = v5;
  else
    v27 = v5 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v5);
  v7 = _CocoaArrayWrapper.endIndex.getter(v27);
  swift_bridgeObjectRelease(v5);
  if (v7 < v2)
    goto LABEL_34;
LABEL_4:
  v5 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v6 = v4 - v2;
  if (__OFSUB__(0, v5))
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v7 = *v3;
  if (!((unint64_t)*v3 >> 62))
  {
    v8 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
    v9 = v8 - v5;
    if (!__OFADD__(v8, v6))
      goto LABEL_8;
LABEL_42:
    __break(1u);
LABEL_43:
    if (v7 < 0)
      v29 = v7;
    else
      v29 = v7 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v7);
    v12 = _CocoaArrayWrapper.endIndex.getter(v29);
    swift_bridgeObjectRelease(v7);
    v7 = *v3;
    goto LABEL_15;
  }
LABEL_37:
  if (v7 < 0)
    v28 = v7;
  else
    v28 = v7 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v7);
  v8 = _CocoaArrayWrapper.endIndex.getter(v28);
  swift_bridgeObjectRelease(v7);
  v9 = v8 + v6;
  if (__OFADD__(v8, v6))
    goto LABEL_42;
LABEL_8:
  v7 = *v3;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject(*v3);
  *v3 = v7;
  v8 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v7 & 0x8000000000000000) == 0 && (v7 & 0x4000000000000000) == 0)
  {
    v11 = v7 & 0xFFFFFFFFFFFFFF8;
    if (v9 <= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_18;
    v8 = 1;
  }
  if ((unint64_t)v7 >> 62)
    goto LABEL_43;
  v12 = *(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_15:
  if (v12 <= v9)
    v12 = v9;
  v13 = swift_bridgeObjectRetain(v7);
  v14 = specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(v8, v12, 1, v7, v13);
  v15 = *v3;
  *v3 = v14;
  swift_bridgeObjectRelease(v15);
  v11 = *v3 & 0xFFFFFFFFFFFFFF8;
LABEL_18:
  v16 = v11 + 32;
  v17 = (char *)(v11 + 32 + 8 * v4);
  v18 = sub_10000B854();
  v19 = (void *)swift_arrayDestroy(v17, v5, v18);
  if (!v6)
    return specialized Array._endMutation()(v19);
  v20 = *v3;
  if (!((unint64_t)*v3 >> 62))
  {
    v21 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
    v22 = v21 - v2;
    if (!__OFSUB__(v21, v2))
      goto LABEL_21;
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  if (v20 < 0)
    v30 = *v3;
  else
    v30 = v20 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(*v3);
  v31 = _CocoaArrayWrapper.endIndex.getter(v30);
  v19 = (void *)swift_bridgeObjectRelease(v20);
  v22 = v31 - v2;
  if (__OFSUB__(v31, v2))
    goto LABEL_52;
LABEL_21:
  if ((v22 & 0x8000000000000000) == 0)
  {
    v23 = (char *)(v16 + 8 * v2);
    if (v4 != v2 || v17 >= &v23[8 * v22])
      v19 = memmove(v17, v23, 8 * v22);
    v2 = *v3;
    if (!((unint64_t)*v3 >> 62))
    {
      v24 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
      v25 = v24 + v6;
      if (!__OFADD__(v24, v6))
      {
LABEL_27:
        *(_QWORD *)((*v3 & 0xFFFFFFFFFFFFF8) + 0x10) = v25;
        return specialized Array._endMutation()(v19);
      }
      goto LABEL_58;
    }
LABEL_53:
    if (v2 < 0)
      v32 = v2;
    else
      v32 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
    v33 = _CocoaArrayWrapper.endIndex.getter(v32);
    v19 = (void *)swift_bridgeObjectRelease(v2);
    v25 = v33 + v6;
    if (!__OFADD__(v33, v6))
      goto LABEL_27;
LABEL_58:
    __break(1u);
  }
  v34 = 2;
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v34, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_100015270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch(sub_10001528C, 0, 0);
}

void sub_10001528C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  char *v14;
  unint64_t v15;
  __n128 v16;
  _BYTE *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  int64_t v23;
  int64_t v24;
  unint64_t v25;
  unint64_t i;
  unint64_t v28;
  int64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  unint64_t v33;
  _BOOL4 v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  _BYTE *v64;
  int64_t v65;
  uint64_t v66;
  unint64_t v67;
  int64_t v68;
  char *v69;
  _BYTE *v70;
  uint64_t v71;
  id v72[2];

  v66 = v0;
  if (objc_msgSend(*(id *)(v0 + 32), "scheduledDeliverySetting") != (id)2)
  {
    if (qword_100029B90 != -1)
LABEL_91:
      swift_once(&qword_100029B90, sub_100007EC0);
    v14 = (char *)qword_10002B320;
    v15 = *(_QWORD *)algn_10002B328;
    swift_bridgeObjectRetain(qword_10002B320);
    v16 = swift_bridgeObjectRetain(v15);
LABEL_85:
    (*(void (**)(char *, unint64_t, __n128))(v66 + 8))(v14, v15, v16);
    return;
  }
  v1 = *(_QWORD *)(v0 + 24);
  v2 = sub_1000147E8(*(void **)(v0 + 16));
  v4 = v3;
  v69 = (char *)_swiftEmptyArrayStorage;
  v70 = &_swiftEmptyDictionarySingleton;
  v5 = *(_QWORD *)(v0 + 24);
  if (v1 >> 62)
  {
    if (v5 < 0)
      v18 = *(_QWORD *)(v0 + 24);
    else
      v18 = v1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v5);
    v6 = _CocoaArrayWrapper.endIndex.getter(v18);
    if (v6)
      goto LABEL_4;
  }
  else
  {
    v6 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain(v5);
    if (v6)
    {
LABEL_4:
      if (v6 < 1)
        goto LABEL_94;
      v7 = 0;
      v8 = *(_QWORD *)(v0 + 24);
      v9 = v1 & 0xC000000000000001;
      v10 = v8 + 32;
      do
      {
        if (v9)
        {
          v11 = v66;
          v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v7, *(_QWORD *)(v66 + 24));
        }
        else
        {
          v12 = *(id *)(v10 + 8 * v7);
          v11 = v66;
        }
        v13 = *(void **)(v11 + 16);
        ++v7;
        v72[0] = v12;
        sub_100014B40(v72, v2, v4, v13, &v69, &v70);

      }
      while (v6 != v7);
      swift_bridgeObjectRelease(*(_QWORD *)(v66 + 24));
      swift_bridgeObjectRelease(v4);
      v17 = v70;
      goto LABEL_18;
    }
  }
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease(v4);
  v17 = &_swiftEmptyDictionarySingleton;
LABEL_18:
  v19 = v17 + 64;
  v20 = -1;
  v21 = -1 << v17[32];
  if (-v21 < 64)
    v20 = ~(-1 << -(char)v21);
  v22 = v20 & *((_QWORD *)v17 + 8);
  v23 = (unint64_t)(63 - v21) >> 6;
  swift_bridgeObjectRetain(v17);
  v24 = 0;
  v65 = v23;
  if (!v22)
    goto LABEL_22;
LABEL_21:
  v25 = __clz(__rbit64(v22));
  v22 &= v22 - 1;
  for (i = v25 | (v24 << 6); ; i = __clz(__rbit64(v28)) + (v24 << 6))
  {
    v30 = *(_QWORD *)(*((_QWORD *)v17 + 7) + 8 * i);
    if ((unint64_t)v30 >> 62)
    {
      if (v30 < 0)
        v38 = *(_QWORD *)(*((_QWORD *)v17 + 7) + 8 * i);
      else
        v38 = v30 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain_n(v30, 2);
      v39 = _CocoaArrayWrapper.endIndex.getter(v38);
      swift_bridgeObjectRelease(v30);
      if (v39 < 2)
      {
LABEL_37:
        swift_bridgeObjectRelease(v30);
        if (v22)
          goto LABEL_21;
        goto LABEL_22;
      }
      swift_bridgeObjectRetain(v30);
      v31 = sub_1000130FC(v40);
      swift_bridgeObjectRelease(v30);
    }
    else
    {
      v31 = (void *)(v30 & 0xFFFFFFFFFFFFFF8);
      v32 = *(_QWORD *)((v30 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v30);
      if (v32 <= 1)
        goto LABEL_37;
      swift_bridgeObjectRetain(v30);
    }
    v72[0] = v31;
    sub_100012FA0((uint64_t *)v72);
    swift_bridgeObjectRelease(v30);
    v33 = (unint64_t)v72[0];
    v71 = (uint64_t)v72[0];
    v34 = (uint64_t)v72[0] < 0 || ((unint64_t)v72[0] & 0x4000000000000000) != 0;
    if (v34)
    {
      swift_bridgeObjectRetain(v72[0]);
      v42 = _CocoaArrayWrapper.endIndex.getter(v41);
      swift_release(v33);
      if (!v42)
        goto LABEL_95;
      swift_bridgeObjectRetain(v33);
      v44 = _CocoaArrayWrapper.endIndex.getter(v43);
      swift_release(v33);
      if (!v44)
        goto LABEL_89;
    }
    else if (!*((_QWORD *)v72[0] + 2))
    {
      goto LABEL_88;
    }
    if ((v33 & 0xC000000000000001) != 0)
    {
      v35 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(0, v33);
      if (v34)
        goto LABEL_52;
    }
    else
    {
      if (!*(_QWORD *)(v33 + 16))
        goto LABEL_90;
      v35 = *(id *)(v33 + 32);
      if (v34)
      {
LABEL_52:
        swift_bridgeObjectRetain(v33);
        v37 = _CocoaArrayWrapper.endIndex.getter(v36);
        swift_release(v33);
        if (!v37)
          goto LABEL_93;
        goto LABEL_64;
      }
    }
    if (!*(_QWORD *)(v33 + 16))
      goto LABEL_93;
LABEL_64:
    sub_100014F78(0, 1);

    v45 = v71;
    if ((unint64_t)v71 >> 62)
    {
      if (v71 < 0)
        v62 = v71;
      else
        v62 = v71 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain_n(v71, 2);
      v46 = _CocoaArrayWrapper.endIndex.getter(v62);
      if (!v46)
      {
LABEL_81:
        swift_bridgeObjectRelease_n(v45, 3);
        goto LABEL_82;
      }
    }
    else
    {
      v46 = *(_QWORD *)((v71 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain_n(v71, 2);
      if (!v46)
        goto LABEL_81;
    }
    if (v46 < 1)
      break;
    v63 = v19;
    v64 = v17;
    v47 = 0;
    v48 = v69;
    v67 = v45 & 0xC000000000000001;
    v68 = v24;
    v49 = v22;
    v50 = v45;
    v51 = v46;
    do
    {
      if (v67)
        v52 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v47, v45);
      else
        v52 = *(id *)(v45 + 8 * v47 + 32);
      v53 = v52;
      v54 = objc_msgSend(v52, "request");
      v55 = objc_msgSend(v54, "identifier");

      v56 = static String._unconditionallyBridgeFromObjectiveC(_:)(v55);
      v58 = v57;

      if ((swift_isUniquelyReferenced_nonNull_native(v48) & 1) == 0)
        v48 = sub_100011AD4(0, *((_QWORD *)v48 + 2) + 1, 1, v48);
      v60 = *((_QWORD *)v48 + 2);
      v59 = *((_QWORD *)v48 + 3);
      if (v60 >= v59 >> 1)
        v48 = sub_100011AD4((char *)(v59 > 1), v60 + 1, 1, v48);
      ++v47;
      *((_QWORD *)v48 + 2) = v60 + 1;
      v61 = &v48[16 * v60];
      *((_QWORD *)v61 + 4) = v56;
      *((_QWORD *)v61 + 5) = v58;

      v24 = v68;
      v45 = v50;
    }
    while (v51 != v47);
    v22 = v49;
    swift_bridgeObjectRelease_n(v50, 3);
    v69 = v48;
    v19 = v63;
    v17 = v64;
LABEL_82:
    v23 = v65;
    if (v22)
      goto LABEL_21;
LABEL_22:
    if (__OFADD__(v24++, 1))
    {
      __break(1u);
      goto LABEL_87;
    }
    if (v24 >= v23)
      goto LABEL_84;
    v28 = *(_QWORD *)&v19[8 * v24];
    if (!v28)
    {
      v29 = v24 + 1;
      if (v24 + 1 >= v23)
        goto LABEL_84;
      v28 = *(_QWORD *)&v19[8 * v29];
      if (!v28)
      {
        v29 = v24 + 2;
        if (v24 + 2 >= v23)
          goto LABEL_84;
        v28 = *(_QWORD *)&v19[8 * v29];
        if (!v28)
        {
          v29 = v24 + 3;
          if (v24 + 3 >= v23)
            goto LABEL_84;
          v28 = *(_QWORD *)&v19[8 * v29];
          if (!v28)
          {
            v29 = v24 + 4;
            if (v24 + 4 >= v23)
            {
LABEL_84:
              swift_release(v17);
              v14 = v69;
              swift_bridgeObjectRetain(v69);
              v15 = sub_100011684((uint64_t)_swiftEmptyArrayStorage);
              swift_bridgeObjectRelease(v17);
              swift_bridgeObjectRelease(v14);
              goto LABEL_85;
            }
            v28 = *(_QWORD *)&v19[8 * v29];
            if (!v28)
            {
              while (1)
              {
                v24 = v29 + 1;
                if (__OFADD__(v29, 1))
                  break;
                if (v24 >= v23)
                  goto LABEL_84;
                v28 = *(_QWORD *)&v19[8 * v24];
                ++v29;
                if (v28)
                  goto LABEL_34;
              }
LABEL_87:
              __break(1u);
LABEL_88:
              __break(1u);
LABEL_89:
              __break(1u);
LABEL_90:
              __break(1u);
              goto LABEL_91;
            }
          }
        }
      }
      v24 = v29;
    }
LABEL_34:
    v22 = (v28 - 1) & v28;
  }
  __break(1u);
LABEL_93:
  __break(1u);
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
}

unint64_t sub_10001590C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002A020;
  if (!qword_10002A020)
  {
    v1 = sub_1000100C4(&qword_10002A018);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_10002A020);
  }
  return result;
}

uint64_t sub_100015958(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100008628(&qword_100029E98);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100015998(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100008628(&qword_10002A048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000159E0(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

void sub_1000159E8(id *a1, uint64_t a2, _QWORD *a3, char **a4)
{
  uint64_t v4;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  char v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  Class isa;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  Class v29;
  id v30;
  id v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  unint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  _QWORD *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v53;
  unint64_t v54;
  char *v55;
  uint64_t v56;
  char **v57;
  _QWORD *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD __dst[50];
  id __src[50];

  v7 = *a1;
  v8 = objc_msgSend(*a1, "request");
  v9 = objc_msgSend(v8, "content");

  v10 = objc_msgSend(v9, "categoryIdentifier");
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v13 = v12;

  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(FCNotificationArticleCategory);
  if (v11 == v14 && v13 == v15)
  {
    swift_bridgeObjectRelease_n(v13, 2);
  }
  else
  {
    v17 = v15;
    v18 = _stringCompareWithSmolCheck(_:_:expecting:)(v11, v13, v14, v15, 0);
    swift_bridgeObjectRelease(v13);
    swift_bridgeObjectRelease(v17);
    if ((v18 & 1) == 0)
      return;
  }
  v58 = a3;
  v57 = a4;
  v19 = (void *)objc_opt_self(NSJSONSerialization);
  v20 = objc_msgSend(v7, "request");
  v21 = objc_msgSend(v20, "content");

  v22 = objc_msgSend(v21, "userInfo");
  v23 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v22, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v23);
  LODWORD(v23) = objc_msgSend(v19, "isValidJSONObject:", isa);

  if ((_DWORD)v23)
  {
    v25 = objc_msgSend(v7, "request");
    v26 = objc_msgSend(v25, "content");

    v27 = objc_msgSend(v26, "userInfo");
    v28 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v27, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

    v29 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v28);
    __src[0] = 0;
    v30 = objc_msgSend(v19, "dataWithJSONObject:options:error:", v29, 0, __src);

    v31 = __src[0];
    if (!v30)
    {
      v37 = v31;
      v36 = _convertNSErrorToError(_:)();

      swift_willThrow();
      goto LABEL_14;
    }
    v32 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v30);
    v34 = v33;

    v35 = sub_10000D524();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)(__src, &type metadata for UserInfoArticle, v32, v34, &type metadata for UserInfoArticle, v35);
    v36 = v4;
    if (v4)
    {
      sub_10000D568(v32, v34);
LABEL_14:
      swift_errorRelease(v36);
      return;
    }
    memcpy(__dst, __src, 0x189uLL);
    v39 = a3[11];
    v38 = a3[12];
    if (__dst[11] == v39 && __dst[12] == v38)
    {
      sub_10000E544(__dst);
    }
    else
    {
      v40 = _stringCompareWithSmolCheck(_:_:expecting:)(__dst[11], __dst[12], a3[11], a3[12], 0);
      sub_10000E544(__dst);
      if ((v40 & 1) == 0)
      {
        sub_10000D568(v32, v34);
        return;
      }
    }
    if (qword_100029BA0 != -1)
      swift_once(&qword_100029BA0, sub_10001AE14);
    v41 = type metadata accessor for Logger(0);
    sub_10000A404(v41, (uint64_t)qword_10002B348);
    v42 = sub_10000E40C(v58);
    v43 = Logger.logObject.getter(v42);
    v44 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc(12, -1);
      v56 = swift_slowAlloc(32, -1);
      v60 = v56;
      *(_DWORD *)v45 = 136315138;
      swift_bridgeObjectRetain(v38);
      v59 = sub_1000160F4(v39, v38, &v60);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v59, &v60, v45 + 4, v45 + 12);
      swift_bridgeObjectRelease(v38);
      sub_10000E544(v58);
      _os_log_impl((void *)&_mh_execute_header, v43, v44, "Removing delivered notification for articleID: %s", v45, 0xCu);
      swift_arrayDestroy(v56, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v56, -1, -1);
      swift_slowDealloc(v45, -1, -1);
    }
    else
    {
      sub_10000E544(v58);
    }

    v46 = objc_msgSend(v7, "request");
    v47 = objc_msgSend(v46, "identifier");

    v48 = static String._unconditionallyBridgeFromObjectiveC(_:)(v47);
    v50 = v49;

    v51 = *v57;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v57);
    *v57 = v51;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v51 = sub_100011AD4(0, *((_QWORD *)v51 + 2) + 1, 1, v51);
      *v57 = v51;
    }
    v54 = *((_QWORD *)v51 + 2);
    v53 = *((_QWORD *)v51 + 3);
    if (v54 >= v53 >> 1)
    {
      v51 = sub_100011AD4((char *)(v53 > 1), v54 + 1, 1, v51);
      *v57 = v51;
    }
    *((_QWORD *)v51 + 2) = v54 + 1;
    v55 = &v51[16 * v54];
    *((_QWORD *)v55 + 4) = v48;
    *((_QWORD *)v55 + 5) = v50;
    sub_10000D568(v32, v34);
  }
}

uint64_t sub_10001603C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for ArticleNotificationDeduper()
{
  return objc_opt_self(_TtC32NewsNotificationServiceExtension26ArticleNotificationDeduper);
}

uint64_t sub_100016080(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_10002A100 + dword_10002A100);
  v5 = (_QWORD *)swift_task_alloc(unk_10002A104);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100011970;
  return v7(a1, a2);
}

uint64_t sub_1000160F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13[3];
  void *ObjectType;

  v6 = sub_1000161C4(v13, 0, 0, 1, a1, a2);
  v8 = v13[0];
  if (v6)
  {
    v9 = v6;
    ObjectType = (void *)swift_getObjectType(v6, v7);
    v13[0] = v9;
    v10 = *a3;
    if (*a3)
    {
      sub_10000D5EC((uint64_t)v13, *a3);
      *a3 = v10 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v13[0] = a1;
    v13[1] = a2;
    v11 = *a3;
    if (*a3)
    {
      sub_10000D5EC((uint64_t)v13, *a3);
      *a3 = v11 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100008608(v13);
  return v8;
}

uint64_t sub_1000161C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10001637C(a5, a6);
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

uint64_t sub_10001637C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100016410(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native(v2) & 1) == 0)
    v2 = sub_1000165E8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1000165E8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100016410(uint64_t a1, unint64_t a2)
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
      v5 = sub_100016584(v4, 0);
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

_QWORD *sub_100016584(uint64_t a1, uint64_t a2)
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
  v4 = sub_100008628(&qword_10002A108);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_1000165E8(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_100008628(&qword_10002A108);
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

uint64_t sub_100016734(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a1);
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v2 = sub_1000146E4(v2);
    *a1 = v2;
  }
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1000167AC(v6);
  return specialized ContiguousArray._endMutation()();
}

void sub_1000167AC(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  Swift::Int v6;
  Swift::Int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  char *v12;
  Swift::Int v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  Swift::Int v17;
  char *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  char *v24;
  void (*v25)(char *, uint64_t);
  char *v26;
  uint64_t v27;
  id *v28;
  Swift::Int v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t *v38;
  Swift::Int v39;
  Swift::Int v40;
  uint64_t *v41;
  uint64_t v42;
  Swift::Int v43;
  uint64_t v44;
  Swift::Int v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  char *v52;
  void (*v53)(char *, uint64_t);
  char *v54;
  uint64_t v55;
  void *v56;
  char *v57;
  unint64_t v58;
  unint64_t v59;
  char *v60;
  char *v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  unint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  uint64_t v84;
  char v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  uint64_t v91;
  uint64_t v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  unint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t *v121;
  uint64_t v122;
  uint64_t v123;
  Swift::Int v124;
  Swift::Int v125;
  Swift::Int v126;
  Swift::Int v127;
  Swift::Int v128;
  id *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;

  v133 = type metadata accessor for Date(0);
  v131 = *(_QWORD *)(v133 - 8);
  v2 = __chkstk_darwin(v133);
  v132 = (char *)&v119 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v5 = (char *)&v119 - v4;
  v6 = a1[1];
  v7 = _minimumMergeRunLength(_:)(v6);
  if (v7 >= v6)
  {
    if (v6 < 0)
      goto LABEL_135;
    if (v6)
      sub_100017088(0, v6, 1, a1);
    return;
  }
  if (v6 >= 0)
    v8 = v6;
  else
    v8 = v6 + 1;
  if (v6 < -1)
    goto LABEL_143;
  v124 = v7;
  v121 = a1;
  if (v6 < 2)
  {
    v12 = (char *)_swiftEmptyArrayStorage;
    v135 = (uint64_t)_swiftEmptyArrayStorage;
    v129 = (id *)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
    if (v6 != 1)
    {
      v16 = _swiftEmptyArrayStorage[2];
LABEL_101:
      v111 = v130;
      if (v16 >= 2)
      {
        v112 = *v121;
        do
        {
          v113 = v16 - 2;
          if (v16 < 2)
            goto LABEL_130;
          if (!v112)
            goto LABEL_142;
          v102 = v12;
          v114 = *(_QWORD *)&v12[16 * v113 + 32];
          v115 = *(_QWORD *)&v12[16 * v16 + 24];
          sub_100017250((void **)(v112 + 8 * v114), (id *)(v112 + 8 * *(_QWORD *)&v12[16 * v16 + 16]), (id *)(v112 + 8 * v115), v129);
          if (v111)
            goto LABEL_98;
          if (v115 < v114)
            goto LABEL_131;
          if ((swift_isUniquelyReferenced_nonNull_native(v102) & 1) == 0)
            v102 = sub_1000141E8((uint64_t)v102);
          if (v113 >= *((_QWORD *)v102 + 2))
            goto LABEL_132;
          v116 = &v102[16 * v113 + 32];
          *(_QWORD *)v116 = v114;
          *((_QWORD *)v116 + 1) = v115;
          v117 = *((_QWORD *)v102 + 2);
          if (v16 > v117)
            goto LABEL_133;
          memmove(&v102[16 * v16 + 16], &v102[16 * v16 + 32], 16 * (v117 - v16));
          v12 = v102;
          *((_QWORD *)v102 + 2) = v117 - 1;
          v16 = v117 - 1;
        }
        while (v117 > 2);
      }
      v110 = v12;
LABEL_113:
      v118 = swift_bridgeObjectRelease(v110);
      *(_QWORD *)((v135 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      specialized Array._endMutation()(v118);
      swift_bridgeObjectRelease(v135);
      return;
    }
  }
  else
  {
    v9 = v8 >> 1;
    v10 = sub_10000B854();
    v11 = static Array._allocateBufferUninitialized(minimumCapacity:)(v9, v10);
    *(_QWORD *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10) = v9;
    v129 = (id *)((v11 & 0xFFFFFFFFFFFFFF8) + 32);
    v135 = v11;
  }
  v13 = 0;
  v14 = *a1;
  v15 = *a1 + 16;
  v122 = *a1 - 8;
  v123 = v15;
  v12 = (char *)_swiftEmptyArrayStorage;
  v127 = v6;
  v134 = v14;
  while (1)
  {
    v17 = v13 + 1;
    v126 = v13;
    if (v13 + 1 < v6)
    {
      v18 = v12;
      v19 = *(void **)(v14 + 8 * v13);
      v20 = *(id *)(v14 + 8 * v17);
      v21 = v19;
      v22 = objc_msgSend(v20, "date");
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      v23 = objc_msgSend(v21, "date");
      v24 = v132;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      LODWORD(v128) = static Date.< infix(_:_:)(v5, v24);
      v25 = *(void (**)(char *, uint64_t))(v131 + 8);
      v26 = v24;
      v27 = v133;
      v25(v26, v133);
      v25(v5, v27);

      v6 = v127;
      v17 = v13 + 2;
      if (v13 + 2 < v6)
      {
        v28 = (id *)(v123 + 8 * v13);
        while (1)
        {
          v29 = v17;
          v30 = *(v28 - 1);
          v31 = *v28;
          v32 = v30;
          v33 = objc_msgSend(v31, "date");
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          v34 = objc_msgSend(v32, "date");
          v35 = v132;
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          LODWORD(v34) = static Date.< infix(_:_:)(v5, v35);
          v36 = v35;
          v37 = v133;
          v25(v36, v133);
          v25(v5, v37);

          if (((v128 ^ v34) & 1) != 0)
            break;
          v17 = v29 + 1;
          ++v28;
          v6 = v127;
          if (v127 == v29 + 1)
          {
            v17 = v127;
            goto LABEL_22;
          }
        }
        v6 = v127;
        v17 = v29;
LABEL_22:
        v13 = v126;
      }
      v12 = v18;
      v14 = v134;
      if ((v128 & 1) != 0)
      {
        if (v17 < v13)
          goto LABEL_136;
        if (v13 < v17)
        {
          v38 = (uint64_t *)(v122 + 8 * v17);
          v39 = v17;
          v40 = v13;
          v41 = (uint64_t *)(v134 + 8 * v13);
          do
          {
            if (v40 != --v39)
            {
              if (!v14)
                goto LABEL_141;
              v42 = *v41;
              *v41 = *v38;
              *v38 = v42;
            }
            ++v40;
            --v38;
            ++v41;
          }
          while (v40 < v39);
        }
      }
    }
    if (v17 < v6)
    {
      if (__OFSUB__(v17, v13))
        goto LABEL_134;
      if (v17 - v13 < v124)
        break;
    }
LABEL_50:
    if (v17 < v13)
      goto LABEL_129;
    v57 = v12;
    if ((swift_isUniquelyReferenced_nonNull_native(v12) & 1) != 0)
      v12 = v57;
    else
      v12 = sub_100014048(0, *((_QWORD *)v57 + 2) + 1, 1, v57);
    v59 = *((_QWORD *)v12 + 2);
    v58 = *((_QWORD *)v12 + 3);
    v16 = v59 + 1;
    v14 = v134;
    if (v59 >= v58 >> 1)
    {
      v109 = sub_100014048((char *)(v58 > 1), v59 + 1, 1, v12);
      v14 = v134;
      v12 = v109;
    }
    *((_QWORD *)v12 + 2) = v16;
    v60 = v12 + 32;
    v61 = &v12[16 * v59 + 32];
    *(_QWORD *)v61 = v13;
    *((_QWORD *)v61 + 1) = v17;
    v128 = v17;
    if (v59)
    {
      while (1)
      {
        v62 = v16 - 1;
        if (v16 >= 4)
        {
          v67 = &v60[16 * v16];
          v68 = *((_QWORD *)v67 - 8);
          v69 = *((_QWORD *)v67 - 7);
          v73 = __OFSUB__(v69, v68);
          v70 = v69 - v68;
          if (v73)
            goto LABEL_118;
          v72 = *((_QWORD *)v67 - 6);
          v71 = *((_QWORD *)v67 - 5);
          v73 = __OFSUB__(v71, v72);
          v65 = v71 - v72;
          v66 = v73;
          if (v73)
            goto LABEL_119;
          v74 = v16 - 2;
          v75 = &v60[16 * v16 - 32];
          v77 = *(_QWORD *)v75;
          v76 = *((_QWORD *)v75 + 1);
          v73 = __OFSUB__(v76, v77);
          v78 = v76 - v77;
          if (v73)
            goto LABEL_121;
          v73 = __OFADD__(v65, v78);
          v79 = v65 + v78;
          if (v73)
            goto LABEL_124;
          if (v79 >= v70)
          {
            v97 = &v60[16 * v62];
            v99 = *(_QWORD *)v97;
            v98 = *((_QWORD *)v97 + 1);
            v73 = __OFSUB__(v98, v99);
            v100 = v98 - v99;
            if (v73)
              goto LABEL_128;
            v90 = v65 < v100;
            goto LABEL_87;
          }
        }
        else
        {
          if (v16 != 3)
          {
            v91 = *((_QWORD *)v12 + 4);
            v92 = *((_QWORD *)v12 + 5);
            v73 = __OFSUB__(v92, v91);
            v84 = v92 - v91;
            v85 = v73;
            goto LABEL_81;
          }
          v64 = *((_QWORD *)v12 + 4);
          v63 = *((_QWORD *)v12 + 5);
          v73 = __OFSUB__(v63, v64);
          v65 = v63 - v64;
          v66 = v73;
        }
        if ((v66 & 1) != 0)
          goto LABEL_120;
        v74 = v16 - 2;
        v80 = &v60[16 * v16 - 32];
        v82 = *(_QWORD *)v80;
        v81 = *((_QWORD *)v80 + 1);
        v83 = __OFSUB__(v81, v82);
        v84 = v81 - v82;
        v85 = v83;
        if (v83)
          goto LABEL_123;
        v86 = &v60[16 * v62];
        v88 = *(_QWORD *)v86;
        v87 = *((_QWORD *)v86 + 1);
        v73 = __OFSUB__(v87, v88);
        v89 = v87 - v88;
        if (v73)
          goto LABEL_126;
        if (__OFADD__(v84, v89))
          goto LABEL_127;
        if (v84 + v89 >= v65)
        {
          v90 = v65 < v89;
LABEL_87:
          if (v90)
            v62 = v74;
          goto LABEL_89;
        }
LABEL_81:
        if ((v85 & 1) != 0)
          goto LABEL_122;
        v93 = &v60[16 * v62];
        v95 = *(_QWORD *)v93;
        v94 = *((_QWORD *)v93 + 1);
        v73 = __OFSUB__(v94, v95);
        v96 = v94 - v95;
        if (v73)
          goto LABEL_125;
        if (v96 < v84)
          goto LABEL_14;
LABEL_89:
        v101 = v62 - 1;
        if (v62 - 1 >= v16)
        {
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
          goto LABEL_138;
        }
        if (!v14)
          goto LABEL_140;
        v102 = v12;
        v103 = &v60[16 * v101];
        v104 = *(_QWORD *)v103;
        v105 = &v60[16 * v62];
        v106 = *((_QWORD *)v105 + 1);
        v107 = v130;
        sub_100017250((void **)(v14 + 8 * *(_QWORD *)v103), (id *)(v14 + 8 * *(_QWORD *)v105), (id *)(v14 + 8 * v106), v129);
        v130 = v107;
        if (v107)
        {
LABEL_98:
          v110 = v102;
          goto LABEL_113;
        }
        if (v106 < v104)
          goto LABEL_115;
        if (v62 > *((_QWORD *)v102 + 2))
          goto LABEL_116;
        *(_QWORD *)v103 = v104;
        *(_QWORD *)&v60[16 * v101 + 8] = v106;
        v108 = *((_QWORD *)v102 + 2);
        if (v62 >= v108)
          goto LABEL_117;
        v16 = v108 - 1;
        memmove(&v60[16 * v62], v105 + 16, 16 * (v108 - 1 - v62));
        v12 = v102;
        *((_QWORD *)v102 + 2) = v108 - 1;
        v14 = v134;
        if (v108 <= 2)
          goto LABEL_14;
      }
    }
    v16 = 1;
LABEL_14:
    v6 = v127;
    v13 = v128;
    if (v128 >= v127)
      goto LABEL_101;
  }
  if (__OFADD__(v13, v124))
    goto LABEL_137;
  if (v13 + v124 >= v6)
    v43 = v6;
  else
    v43 = v13 + v124;
  if (v43 >= v13)
  {
    if (v17 != v43)
    {
      v120 = v12;
      v44 = v122 + 8 * v17;
      v125 = v43;
      do
      {
        v45 = v17;
        v46 = *(void **)(v14 + 8 * v17);
        v128 = v44;
        while (1)
        {
          v47 = *(void **)v44;
          v48 = v46;
          v49 = v47;
          v50 = objc_msgSend(v48, "date");
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          v51 = objc_msgSend(v49, "date");
          v52 = v132;
          static Date._unconditionallyBridgeFromObjectiveC(_:)();

          LOBYTE(v51) = static Date.< infix(_:_:)(v5, v52);
          v53 = *(void (**)(char *, uint64_t))(v131 + 8);
          v54 = v52;
          v55 = v133;
          v53(v54, v133);
          v53(v5, v55);

          if ((v51 & 1) == 0)
            break;
          v14 = v134;
          if (!v134)
            goto LABEL_139;
          v56 = *(void **)v44;
          v46 = *(void **)(v44 + 8);
          *(_QWORD *)v44 = v46;
          *(_QWORD *)(v44 + 8) = v56;
          v44 -= 8;
          if (v45 == ++v13)
            goto LABEL_43;
        }
        v14 = v134;
LABEL_43:
        v17 = v45 + 1;
        v44 = v128 + 8;
        v13 = v126;
      }
      while (v45 + 1 != v125);
      v17 = v125;
      v12 = v120;
    }
    goto LABEL_50;
  }
LABEL_138:
  __break(1u);
LABEL_139:
  __break(1u);
LABEL_140:
  __break(1u);
LABEL_141:
  __break(1u);
LABEL_142:
  __break(1u);
LABEL_143:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
  __break(1u);
}

void sub_100017088(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  char *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v28 = a1;
  v7 = type metadata accessor for Date(0);
  v31 = *(_QWORD *)(v7 - 8);
  v32 = v7;
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v30 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v11 = (char *)&v26 - v10;
  v27 = a2;
  if (a3 != a2)
  {
    v33 = *a4;
    v12 = v33 + 8 * a3 - 8;
LABEL_5:
    v13 = *(void **)(v33 + 8 * a3);
    v14 = v28;
    v29 = v12;
    while (1)
    {
      v15 = *(void **)v12;
      v16 = v13;
      v17 = v15;
      v18 = objc_msgSend(v16, "date");
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      v19 = objc_msgSend(v17, "date");
      v20 = v30;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      LOBYTE(v19) = static Date.< infix(_:_:)(v11, v20);
      v21 = a3;
      v22 = *(void (**)(char *, uint64_t))(v31 + 8);
      v23 = v20;
      v24 = v32;
      v22(v23, v32);
      v22(v11, v24);
      a3 = v21;

      if ((v19 & 1) == 0)
      {
LABEL_4:
        a3 = v21 + 1;
        v12 = v29 + 8;
        if (v21 + 1 == v27)
          return;
        goto LABEL_5;
      }
      if (!v33)
        break;
      v25 = *(void **)v12;
      v13 = *(void **)(v12 + 8);
      *(_QWORD *)v12 = v13;
      *(_QWORD *)(v12 + 8) = v25;
      v12 -= 8;
      if (v21 == ++v14)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_100017250(void **a1, id *a2, id *a3, id *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  char *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  char *v24;
  void (*v25)(char *, uint64_t);
  char *v26;
  uint64_t v27;
  id *v28;
  id *v29;
  unint64_t v30;
  id *v31;
  id *v32;
  unint64_t v33;
  id *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  char *v39;
  id v40;
  char *v41;
  void (*v42)(char *, uint64_t);
  char *v43;
  uint64_t v44;
  id *v45;
  uint64_t result;
  uint64_t v47;
  void **v48;
  id *v49;
  unint64_t v50;
  void **v51;
  id *v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  void **v58;
  id *v59;

  v8 = type metadata accessor for Date(0);
  v55 = *(_QWORD *)(v8 - 8);
  v56 = v8;
  v9 = __chkstk_darwin(v8);
  v54 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v52 = a3;
  v53 = (char *)&v47 - v11;
  v12 = (char *)a2 - (char *)a1;
  v13 = (char *)a2 - (char *)a1 + 7;
  if ((char *)a2 - (char *)a1 >= 0)
    v13 = (char *)a2 - (char *)a1;
  v14 = v13 >> 3;
  v15 = (char *)a3 - (char *)a2;
  v16 = v15 / 8;
  v59 = a1;
  v49 = a4;
  v58 = a4;
  if (v13 >> 3 >= v15 / 8)
  {
    if (v15 < -7)
      goto LABEL_43;
    v29 = v49;
    if (v49 != a2 || &a2[v16] <= v49)
      memmove(v49, a2, 8 * v16);
    v30 = (unint64_t)&v29[v16];
    v57 = (_QWORD *)v30;
    v59 = a2;
    if (v15 < 8 || a1 >= a2)
      goto LABEL_42;
    v31 = v52 - 1;
    v32 = a2;
    v48 = a1;
    while (1)
    {
      v52 = a2;
      v50 = v30;
      v51 = v31 + 1;
      v34 = (id *)(v30 - 8);
      v35 = *--v32;
      v36 = *(id *)(v30 - 8);
      v37 = v35;
      v38 = objc_msgSend(v36, "date");
      v39 = v53;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      v40 = objc_msgSend(v37, "date");
      v41 = v54;
      static Date._unconditionallyBridgeFromObjectiveC(_:)();

      LOBYTE(v40) = static Date.< infix(_:_:)(v39, v41);
      v42 = *(void (**)(char *, uint64_t))(v55 + 8);
      v43 = v41;
      v44 = v56;
      v42(v43, v56);
      v42(v39, v44);

      if ((v40 & 1) != 0)
        break;
      v57 = v34;
      v32 = v52;
      if ((unint64_t)v51 < v50 || (unint64_t)v31 >= v50)
      {
        *v31 = *v34;
        v30 = (unint64_t)v34;
        goto LABEL_30;
      }
      v33 = (unint64_t)v48;
      v45 = v49;
      if (v51 != (void **)v50)
        *v31 = *v34;
      v30 = (unint64_t)v34;
      if (v34 <= v45)
        goto LABEL_42;
LABEL_31:
      --v31;
      a2 = v32;
      if ((unint64_t)v32 <= v33)
        goto LABEL_42;
    }
    v30 = v50;
    if (v51 != v52 || v31 >= v52)
      *v31 = *v32;
    v59 = v32;
LABEL_30:
    v33 = (unint64_t)v48;
    if (v30 <= (unint64_t)v49)
      goto LABEL_42;
    goto LABEL_31;
  }
  if (v12 >= -7)
  {
    v17 = v49;
    if (v49 != a1 || &a1[v14] <= v49)
      memmove(v49, a1, 8 * v14);
    v51 = &v17[v14];
    v57 = v51;
    if (v12 >= 8 && a2 < v52)
    {
      v18 = v53;
      do
      {
        v19 = *v17;
        v20 = *a2;
        v21 = v19;
        v22 = objc_msgSend(v20, "date");
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        v23 = objc_msgSend(v21, "date");
        v24 = v54;
        static Date._unconditionallyBridgeFromObjectiveC(_:)();

        LOBYTE(v23) = static Date.< infix(_:_:)(v18, v24);
        v25 = *(void (**)(char *, uint64_t))(v55 + 8);
        v26 = v24;
        v27 = v56;
        v25(v26, v56);
        v25(v18, v27);

        if ((v23 & 1) != 0)
        {
          v28 = a2 + 1;
          if (a1 < a2 || a1 >= v28 || a1 != a2)
            *a1 = *a2;
        }
        else
        {
          if (a1 != v17)
            *a1 = *v17;
          v58 = ++v17;
          v28 = a2;
        }
        v59 = ++a1;
        if (v17 >= v51)
          break;
        a2 = v28;
      }
      while (v28 < v52);
    }
LABEL_42:
    sub_100014140((void **)&v59, (const void **)&v58, &v57);
    return 1;
  }
LABEL_43:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, 2, 1046, 0);
  __break(1u);
  return result;
}

uint64_t sub_1000176B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[154] = v2;
  v3[153] = a2;
  v3[152] = a1;
  return swift_task_switch(sub_1000176D8, 0, 0);
}

uint64_t sub_1000176D8()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  __n128 v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char *v17;
  id v18[2];

  v1 = objc_msgSend(*(id *)(v0 + 1216), "userInfo");
  v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v1, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  sub_10000CE34(v2, v0 + 816);
  swift_bridgeObjectRelease(v2);
  sub_100017950(v0 + 816, v0 + 416);
  if (sub_100017998(v0 + 416) == 1)
  {
    if (qword_100029B90 != -1)
      swift_once(&qword_100029B90, sub_100007EC0);
    v3 = (char *)qword_10002B320;
    v4 = *(_QWORD *)algn_10002B328;
    swift_bridgeObjectRetain(qword_10002B320);
    v5 = swift_bridgeObjectRetain(v4);
    return (*(uint64_t (**)(char *, unint64_t, __n128))(v0 + 8))(v3, v4, v5);
  }
  v6 = *(_QWORD *)(v0 + 1224);
  memcpy((void *)(v0 + 16), (const void *)(v0 + 416), 0x189uLL);
  v17 = (char *)_swiftEmptyArrayStorage;
  if (v6 < 0 || (v6 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain(v6);
    v7 = sub_1000130FC(v15);
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v7 = (void *)(v6 & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain(v6);
  }
  v18[0] = v7;
  sub_100016734((uint64_t *)v18);
  v8 = (unint64_t)v18[0];
  if (((unint64_t)v18[0] & 0x8000000000000000) == 0 && ((unint64_t)v18[0] & 0x4000000000000000) == 0)
  {
    v9 = *((_QWORD *)v18[0] + 2);
    result = swift_retain(v18[0]);
    if (v9)
      goto LABEL_11;
LABEL_20:
    swift_release_n(v8, 2);
    v3 = (char *)_swiftEmptyArrayStorage;
LABEL_21:
    sub_1000179B0(v0 + 816);
    v4 = sub_100011684((uint64_t)_swiftEmptyArrayStorage);
    return (*(uint64_t (**)(char *, unint64_t, __n128))(v0 + 8))(v3, v4, v5);
  }
  v16 = swift_retain(v18[0]);
  result = _CocoaArrayWrapper.endIndex.getter(v16);
  v9 = result;
  if (!result)
    goto LABEL_20;
LABEL_11:
  if (v9 >= 1)
  {
    v11 = 0;
    do
    {
      if ((v8 & 0xC000000000000001) != 0)
        v12 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v11, v8);
      else
        v12 = *(id *)(v8 + 8 * v11 + 32);
      v13 = v12;
      v14 = *(_QWORD *)(v0 + 1232);
      ++v11;
      v18[0] = v12;
      sub_1000159E8(v18, v14, (_QWORD *)(v0 + 16), &v17);

    }
    while (v9 != v11);
    swift_release_n(v8, 2);
    v3 = v17;
    goto LABEL_21;
  }
  __break(1u);
  return result;
}

uint64_t sub_100017950(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100008628(&qword_100029E78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100017998(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

uint64_t sub_1000179B0(uint64_t a1)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = *(_OWORD *)(a1 + 352);
  v11 = *(_OWORD *)(a1 + 368);
  v8 = *(_OWORD *)(a1 + 320);
  v9 = *(_OWORD *)(a1 + 336);
  v6 = *(_OWORD *)(a1 + 288);
  v7 = *(_OWORD *)(a1 + 304);
  v4 = *(_OWORD *)(a1 + 256);
  v5 = *(_OWORD *)(a1 + 272);
  v3 = *(_OWORD *)(a1 + 224);
  sub_100017A50(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    v3,
    *((uint64_t *)&v3 + 1),
    *(_QWORD *)(a1 + 240),
    *(_QWORD *)(a1 + 248),
    v4,
    *((uint64_t *)&v4 + 1),
    v5,
    *((uint64_t *)&v5 + 1),
    v6,
    *((uint64_t *)&v6 + 1),
    v7,
    *((uint64_t *)&v7 + 1),
    v8,
    *((uint64_t *)&v8 + 1),
    v9,
    *((uint64_t *)&v9 + 1),
    v10,
    *((uint64_t *)&v10 + 1),
    v11,
    *((uint64_t *)&v11 + 1),
    *(_QWORD *)(a1 + 384));
  return a1;
}

uint64_t sub_100017A50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a6);
    swift_bridgeObjectRelease(a8);
    swift_bridgeObjectRelease(a11);
    swift_bridgeObjectRelease(a13);
    swift_bridgeObjectRelease(a15);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a17);
    swift_bridgeObjectRelease(a28);
    swift_bridgeObjectRelease(a29);
    swift_bridgeObjectRelease(a31);
    swift_bridgeObjectRelease(a35);
    swift_bridgeObjectRelease(a37);
    swift_bridgeObjectRelease(a39);
    swift_bridgeObjectRelease(a41);
    swift_bridgeObjectRelease(a43);
    swift_bridgeObjectRelease(a45);
    swift_bridgeObjectRelease(a47);
    return swift_bridgeObjectRelease(a49);
  }
  return result;
}

void sub_100017C34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  void (*v7)(void);
  void *v8;
  uint64_t v9;
  id v10;

  v2 = v1;
  v3 = Logger.logObject.getter(a1);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "MarketingNotificationService serviceExtensionTimeWillExpire called.", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  v6 = v2 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_contentHandler;
  v7 = *(void (**)(void))(v2
                        + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_contentHandler);
  if (v7)
  {
    v8 = *(void **)(v2
                  + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_bestAttemptContent);
    if (v8)
    {
      v9 = *(_QWORD *)(v6 + 8);
      sub_100017E8C((uint64_t)v7, v9);
      v10 = v8;
      v7();

      sub_100017E9C((uint64_t)v7, v9);
    }
  }
}

uint64_t sub_100017D54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_logger;
  v2 = type metadata accessor for Logger(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  sub_100017E9C(*(_QWORD *)(v0 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_contentHandler), *(_QWORD *)(v0 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_contentHandler + 8));
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_bestAttemptContent));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100017DC8()
{
  return type metadata accessor for MarketingNotificationService(0);
}

uint64_t type metadata accessor for MarketingNotificationService(uint64_t a1)
{
  uint64_t result;

  result = qword_10002A150;
  if (!qword_10002A150)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MarketingNotificationService);
  return result;
}

uint64_t sub_100017E0C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_10001F6B0;
    v4[2] = &unk_10001F6C8;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100017E8C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100017E9C(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

void sub_100017EAC(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t (**v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void (**v25)(_QWORD, _QWORD);
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint8_t *v29;
  void *v30;
  id v31;
  int v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  Class isa;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  os_log_type_t v45;
  uint8_t *v46;
  id v47;
  uint64_t v48;
  uint64_t aBlock[5];
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v6 = swift_allocObject(&unk_100025558, 24, 7);
  *(_QWORD *)(v6 + 16) = a3;
  v7 = (uint64_t (**)(uint64_t))(a2
                                        + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_contentHandler);
  v8 = *(_QWORD *)(a2 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_contentHandler);
  v9 = *(_QWORD *)(a2
                 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_contentHandler
                 + 8);
  *v7 = sub_100018404;
  v7[1] = (uint64_t (*)(uint64_t))v6;
  _Block_copy(a3);
  sub_100017E9C(v8, v9);
  swift_retain(v6);
  v10 = objc_msgSend(a1, "content");
  v11 = objc_msgSend(v10, "mutableCopy");

  _bridgeAnyObjectToAny(_:)(aBlock, v11);
  swift_unknownObjectRelease(v11, v12);
  v13 = sub_10001840C();
  v14 = swift_dynamicCast(&v51, aBlock, (char *)&type metadata for Any + 8, v13, 6);
  v15 = v51;
  if (!v14)
    v15 = 0;
  v16 = *(void **)(a2
                 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_bestAttemptContent);
  *(_QWORD *)(a2 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_bestAttemptContent) = v15;

  v17 = a1;
  v18 = Logger.logObject.getter(v17);
  v19 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v18, v19))
  {
    v48 = v6;
    v20 = (uint8_t *)swift_slowAlloc(12, -1);
    v21 = swift_slowAlloc(32, -1);
    aBlock[0] = v21;
    *(_DWORD *)v20 = 136315138;
    v22 = objc_msgSend(v17, "content");
    v23 = objc_msgSend(v22, "title");

    v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
    v25 = a3;
    v27 = v26;

    v51 = sub_1000160F4(v24, v27, aBlock);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v20 + 4, v20 + 12);

    v28 = v27;
    a3 = v25;
    swift_bridgeObjectRelease(v28);
    _os_log_impl((void *)&_mh_execute_header, v18, v19, "MarketingNotificationService didReceive request with title: %s", v20, 0xCu);
    swift_arrayDestroy(v21, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v21, -1, -1);
    v29 = v20;
    v6 = v48;
    swift_slowDealloc(v29, -1, -1);
  }
  else
  {

  }
  v30 = (void *)objc_opt_self(AMSUserNotification);
  v31 = objc_msgSend(v30, "shouldHandleServiceExtensionNotificationRequest:", v17);
  v32 = (int)v31;
  v33 = Logger.logObject.getter(v31);
  if (v32)
  {
    v34 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v35 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, v34, "MarketingNotificationService removing any scheduled paid bundle local notifications", v35, 2u);
      swift_slowDealloc(v35, -1, -1);
    }

    v36 = objc_msgSend((id)objc_opt_self(UNUserNotificationCenter), "currentNotificationCenter");
    v37 = sub_100008628(&qword_10002A028);
    v38 = swift_allocObject(v37, 48, 7);
    *(_OWORD *)(v38 + 16) = xmmword_10001F5D0;
    *(_QWORD *)(v38 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(FCPaidBundleViaOfferLocalNotificationID);
    *(_QWORD *)(v38 + 40) = v39;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v38);
    objc_msgSend(v36, "removePendingNotificationRequestsWithIdentifiers:", isa);

    v41 = objc_msgSend((id)objc_opt_self(FCAMSBag), "bag");
    aBlock[4] = (uint64_t)sub_100018404;
    v50 = v6;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100018E8C;
    aBlock[3] = (uint64_t)&unk_100025570;
    v42 = _Block_copy(aBlock);
    v43 = v50;
    swift_retain(v6);
    swift_release(v43);
    objc_msgSend(v30, "handleServiceExtensionNotificationRequest:bag:withContentHandler:", v17, v41, v42);
    _Block_release(v42);
    swift_release(v6);
    swift_unknownObjectRelease(v41, v44);
  }
  else
  {
    v45 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v33, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v46 = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, v45, "MarketingNotificationService didReceive request that AMSUserNotification should not handle.", v46, 2u);
      swift_slowDealloc(v46, -1, -1);
    }

    v47 = objc_msgSend(v17, "content");
    ((void (**)(_QWORD, id))a3)[2](a3, v47);
    swift_release(v6);

  }
}

uint64_t sub_1000183E0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100018404(uint64_t a1)
{
  uint64_t v1;

  return sub_100018EDC(a1, *(_QWORD *)(v1 + 16));
}

unint64_t sub_10001840C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002A1E8;
  if (!qword_10002A1E8)
  {
    v1 = objc_opt_self(UNMutableNotificationContent);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10002A1E8);
  }
  return result;
}

uint64_t sub_100018448(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100018458(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100018460@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  void *v8;
  NSString v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v20;

  v4 = type metadata accessor for NotificationSettingsData(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (uint64_t *)((char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(void **)(a1 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28UnwantedNotificationReporter_sharedDefaults);
  v9 = String._bridgeToObjectiveC()();
  v10 = objc_msgSend(v8, "dataForKey:", v9);

  if (v10)
  {
    v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v10);
    v14 = v13;

    v15 = sub_100018E44();
    dispatch thunk of JSONDecoder.decode<A>(_:from:)(v7, v4, v12, v14, v4, v15);
    sub_10000D568(v12, v14);
    (*(void (**)(uint64_t, _QWORD *, uint64_t))(v5 + 32))(a2, v7, v4);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, v4);
  }
  else
  {
    v16 = Logger.logObject.getter(v11);
    v17 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "Could not find notification settings data in defaults", v18, 2u);
      swift_slowDealloc(v18, -1, -1);
    }

    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, v4);
  }
}

uint64_t sub_1000187D8()
{
  _QWORD *v0;
  char *v1;
  uint64_t v2;

  swift_release(v0[2]);
  v1 = (char *)v0 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28UnwantedNotificationReporter_logger;
  v2 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  objc_release(*(id *)((char *)v0
                     + OBJC_IVAR____TtC32NewsNotificationServiceExtension28UnwantedNotificationReporter_sharedDefaults));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*v0 + 48), *(unsigned __int16 *)(*v0 + 52));
}

uint64_t sub_100018840()
{
  return type metadata accessor for UnwantedNotificationReporter(0);
}

uint64_t type metadata accessor for UnwantedNotificationReporter(uint64_t a1)
{
  uint64_t result;

  result = qword_10002A228;
  if (!qword_10002A228)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for UnwantedNotificationReporter);
  return result;
}

uint64_t sub_100018884(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = (char *)&value witness table for Builtin.NativeObject + 64;
  result = type metadata accessor for Logger(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    result = swift_updateClassMetadata2(a1, 256, 3, v4, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10001890C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_10002A2C8 + dword_10002A2C8);
  v3 = (_QWORD *)swift_task_alloc(unk_10002A2CC);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_100011970;
  return v5(a1);
}

uint64_t sub_100018974(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[204] = v1;
  v2[203] = a1;
  v3 = sub_100008628(&qword_10002A2D0);
  v2[205] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v3 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for NotificationSettingsData(0);
  v2[206] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v2[207] = v5;
  v2[208] = swift_task_alloc((*(_QWORD *)(v5 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_1000189FC, 0, 0);
}

uint64_t sub_1000189FC()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  unint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t, __n128);
  __n128 v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  if (!NFInternalBuild())
    goto LABEL_5;
  v1 = objc_msgSend(*(id *)(v0 + 1624), "userInfo");
  v2 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v1, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

  sub_10000CE34(v2, v0 + 416);
  sub_100017950(v0 + 416, v0 + 816);
  swift_bridgeObjectRelease(v2);
  sub_100017950(v0 + 416, v0 + 16);
  if (sub_100017998(v0 + 16) == 1)
    goto LABEL_5;
  v3 = *(_QWORD *)(v0 + 1656);
  v4 = *(_QWORD *)(v0 + 1648);
  v5 = *(_QWORD *)(v0 + 1640);
  v7 = *(_QWORD *)(v0 + 248);
  v6 = *(_QWORD *)(v0 + 256);
  sub_100018460(*(_QWORD *)(v0 + 1632), v5);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v5, 1, v4) == 1)
  {
    v8 = *(_QWORD *)(v0 + 1640);
    sub_1000179B0(v0 + 416);
    sub_100018E04(v8);
LABEL_5:
    if (qword_100029B90 != -1)
      swift_once(&qword_100029B90, sub_100007EC0);
    v10 = qword_10002B320;
    v9 = *(_QWORD *)algn_10002B328;
    swift_bridgeObjectRetain(qword_10002B320);
    swift_bridgeObjectRetain(v9);
    goto LABEL_8;
  }
  v13 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 1656) + 32))(*(_QWORD *)(v0 + 1664), *(_QWORD *)(v0 + 1640), *(_QWORD *)(v0 + 1648));
  v14 = NotificationSettingsData.tagIDs.getter(v13);
  v15 = *(_QWORD *)(v14 + 16);
  swift_bridgeObjectRelease(v14);
  if (v15)
  {
    sub_1000179B0(v0 + 416);
  }
  else
  {
    sub_100017950(v0 + 816, v0 + 1216);
    v16 = sub_10000E40C((_QWORD *)(v0 + 1216));
    v17 = Logger.logObject.getter(v16);
    v18 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v17, v18))
    {
      v29 = (uint64_t *)(v0 + 1616);
      v19 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = swift_slowAlloc(32, -1);
      v31 = v30;
      *(_DWORD *)v19 = 136446210;
      if (v6)
      {
        v20 = v6;
      }
      else
      {
        v7 = 0x6E776F6E6B6E75;
        v20 = 0xE700000000000000;
      }
      swift_bridgeObjectRetain(v6);
      *v29 = sub_1000160F4(v7, v20, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v29, v0 + 1624, v19 + 4, v19 + 12);
      swift_bridgeObjectRelease(v20);
      sub_1000179B0(v0 + 416);
      sub_1000179B0(v0 + 416);
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "User not expecting this notification identifier=%{public}s", v19, 0xCu);
      swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v19, -1, -1);

    }
    else
    {

      sub_1000179B0(v0 + 416);
      v21 = sub_1000179B0(v0 + 416);
    }
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v24 = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "User not expecting to receive notifications", v24, 2u);
      swift_slowDealloc(v24, -1, -1);
    }

  }
  if (qword_100029B90 != -1)
    swift_once(&qword_100029B90, sub_100007EC0);
  v25 = *(_QWORD *)(v0 + 1664);
  v26 = *(_QWORD *)(v0 + 1648);
  v10 = qword_10002B320;
  v9 = *(_QWORD *)algn_10002B328;
  v27 = *(void (**)(uint64_t, uint64_t, __n128))(*(_QWORD *)(v0 + 1656) + 8);
  swift_bridgeObjectRetain(qword_10002B320);
  v28 = swift_bridgeObjectRetain(v9);
  v27(v25, v26, v28);
LABEL_8:
  v11 = *(_QWORD *)(v0 + 1640);
  swift_task_dealloc(*(_QWORD *)(v0 + 1664));
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v10, v9);
}

uint64_t sub_100018E04(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100008628(&qword_10002A2D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100018E44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002A2D8;
  if (!qword_10002A2D8)
  {
    v1 = type metadata accessor for NotificationSettingsData(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for NotificationSettingsData, v1);
    atomic_store(result, (unint64_t *)&qword_10002A2D8);
  }
  return result;
}

void sub_100018E8C(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

uint64_t sub_100018EDC(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, a1);
}

uint64_t sub_100018EF0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v5;
  char *Strong;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[24];

  v5 = a2 + 16;
  swift_beginAccess(a2 + 16, v10, 0, 0);
  Strong = (char *)swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = *(_QWORD *)&Strong[OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService];
    *(_QWORD *)&Strong[OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService] = 0;

    swift_unknownObjectRelease(v7, v8);
  }
  return a3(a1);
}

id sub_100019004(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  objc_class *ObjectType;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  objc_super v18;
  uint64_t v19;

  v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType(v2, a2);
  v5 = OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_services;
  v6 = sub_100008628(&qword_10002A010);
  v7 = swift_allocObject(v6, 48, 7);
  *(_OWORD *)(v7 + 16) = xmmword_10001F730;
  v8 = objc_allocWithZone((Class)FRArticleNotificationService);
  v9 = v3;
  *(_QWORD *)(v7 + 32) = objc_msgSend(v8, "init");
  v10 = type metadata accessor for MarketingNotificationService(0);
  v11 = swift_allocObject(v10, *(unsigned int *)(v10 + 48), *(unsigned __int16 *)(v10 + 52));
  v12 = OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_logger;
  if (qword_100029BA8 != -1)
    swift_once(&qword_100029BA8, sub_10001AE78);
  v13 = type metadata accessor for Logger(0);
  v14 = sub_10000A404(v13, (uint64_t)qword_10002B360);
  v15 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11 + v12, v14, v13);
  v16 = (_QWORD *)(v11 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_contentHandler);
  *v16 = 0;
  v16[1] = 0;
  *(_QWORD *)(v11 + OBJC_IVAR____TtC32NewsNotificationServiceExtension28MarketingNotificationService_bestAttemptContent) = 0;
  *(_QWORD *)(v7 + 40) = v11;
  v19 = v7;
  specialized Array._endMutation()(v15);
  *(_QWORD *)&v9[v5] = v7;
  *(_QWORD *)&v9[OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService] = 0;

  v18.receiver = v9;
  v18.super_class = ObjectType;
  return objc_msgSendSuper2(&v18, "init");
}

uint64_t type metadata accessor for NewsNotificationService()
{
  return objc_opt_self(_TtC32NewsNotificationServiceExtension23NewsNotificationService);
}

void *sub_1000191F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  if ((unint64_t)a1 >> 62)
    goto LABEL_15;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(a1);
  while (v4)
  {
    v5 = 4;
    while (1)
    {
      v6 = v5 - 4;
      if ((a1 & 0xC000000000000001) == 0)
        break;
      v7 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)(v5 - 4, a1);
      v8 = __OFADD__(v6, 1);
      v9 = v5 - 3;
      if (v8)
        goto LABEL_14;
LABEL_9:
      if (objc_msgSend(v7, "supportsHandling:", a2))
      {
        swift_bridgeObjectRelease(a1);
        return v7;
      }
      swift_unknownObjectRelease(v7, v10);
      ++v5;
      if (v9 == v4)
        goto LABEL_11;
    }
    v7 = *(void **)(a1 + 8 * v5);
    swift_unknownObjectRetain(v7);
    v8 = __OFADD__(v6, 1);
    v9 = v5 - 3;
    if (!v8)
      goto LABEL_9;
LABEL_14:
    __break(1u);
LABEL_15:
    if (a1 < 0)
      v12 = a1;
    else
      v12 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v4 = _CocoaArrayWrapper.endIndex.getter(v12);
  }
LABEL_11:
  swift_bridgeObjectRelease(a1);
  return 0;
}

void sub_100019308(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t aBlock[5];
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;

  v6 = swift_allocObject(&unk_1000255C0, 24, 7);
  *(_QWORD *)(v6 + 16) = a3;
  v7 = *(_QWORD *)(a2 + OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_services);
  _Block_copy(a3);
  v8 = a1;
  swift_bridgeObjectRetain(v7);
  v10 = sub_1000191F0(v9, (uint64_t)v8);
  swift_bridgeObjectRelease(v7);

  if (v10)
  {
    v12 = *(_QWORD *)(a2 + OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService);
    *(_QWORD *)(a2 + OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService) = v10;
    swift_unknownObjectRetain(v10);
    swift_unknownObjectRelease(v12, v13);
    v14 = swift_allocObject(&unk_1000255E8, 24, 7);
    swift_unknownObjectWeakInit(v14 + 16, a2);
    v15 = (_QWORD *)swift_allocObject(&unk_100025610, 40, 7);
    v15[2] = v14;
    v15[3] = sub_10001969C;
    v15[4] = v6;
    aBlock[4] = (uint64_t)sub_1000196FC;
    v32 = v15;
    aBlock[0] = (uint64_t)_NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_100018E8C;
    aBlock[3] = (uint64_t)&unk_100025628;
    v16 = _Block_copy(aBlock);
    v17 = v32;
    swift_retain(v6);
    swift_release(v17);
    objc_msgSend(v10, "didReceive:withContentHandler:", v8, v16);
    _Block_release(v16);
    swift_release(v6);
    swift_unknownObjectRelease(v10, v18);
  }
  else
  {
    v19 = *(_QWORD *)(a2 + OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService);
    *(_QWORD *)(a2 + OBJC_IVAR____TtC32NewsNotificationServiceExtension23NewsNotificationService_activeService) = 0;
    swift_unknownObjectRelease(v19, v11);
    if (qword_100029B98 != -1)
      swift_once(&qword_100029B98, sub_10001ADF4);
    v20 = type metadata accessor for Logger(0);
    sub_10000A404(v20, (uint64_t)qword_10002B330);
    v21 = v8;
    v22 = Logger.logObject.getter(v21);
    v23 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc(12, -1);
      v30 = swift_slowAlloc(32, -1);
      aBlock[0] = v30;
      *(_DWORD *)v24 = 136446210;
      v25 = objc_msgSend(v21, "identifier");
      v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v25);
      v28 = v27;

      v33 = sub_1000160F4(v26, v28, aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v33, &v34, v24 + 4, v24 + 12);

      swift_bridgeObjectRelease(v28);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Unable to service notification request: %{public}s", v24, 0xCu);
      swift_arrayDestroy(v30, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v30, -1, -1);
      swift_slowDealloc(v24, -1, -1);

    }
    else
    {

    }
    v29 = objc_msgSend(v21, "content");
    ((void (**)(_QWORD, id))a3)[2](a3, v29);
    swift_release(v6);

  }
}

uint64_t sub_100019678()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001969C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1000196AC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000196D0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000196FC(uint64_t a1)
{
  uint64_t v1;

  return sub_100018EF0(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(uint64_t))(v1 + 24));
}

uint64_t sub_100019708(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100019718(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t destroy for APS(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(a1[7]);
  return swift_bridgeObjectRelease(a1[10]);
}

uint64_t initializeWithCopy for APS(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v7 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 80) = v7;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

_QWORD *assignWithCopy for APS(_QWORD *a1, _QWORD *a2)
{
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

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[4] = a2[4];
  v8 = a2[5];
  v9 = a1[5];
  a1[5] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  a1[6] = a2[6];
  v10 = a2[7];
  v11 = a1[7];
  a1[7] = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  a1[8] = a2[8];
  a1[9] = a2[9];
  v12 = a2[10];
  v13 = a1[10];
  a1[10] = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  return a1;
}

__n128 initializeWithTake for APS(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t assignWithTake for APS(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v10;
  swift_bridgeObjectRelease(v11);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  v12 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRelease(v12);
  return a1;
}

uint64_t getEnumTagSinglePayload for APS(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 88))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for APS(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 88) = 1;
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
    *(_BYTE *)(result + 88) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for APS()
{
  return &type metadata for APS;
}

uint64_t sub_100019A04(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v2 = 8 * a1;
  v3 = *(_QWORD *)&aAlert_2[v2];
  v4 = *(_QWORD *)&aMutableThreadI[v2 + 16];
  v5 = 8 * a2;
  v6 = *(_QWORD *)&aAlert_2[v5];
  v7 = *(_QWORD *)&aMutableThreadI[v5 + 16];
  if (v3 == v6 && v4 == v7)
    v9 = 1;
  else
    v9 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v4, v6, *(_QWORD *)&aMutableThreadI[8 * a2 + 16], 0);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v7);
  return v9 & 1;
}

Swift::Int sub_100019A88(char a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[9];

  Hasher.init(_seed:)(v5, 0);
  v2 = 8 * a1;
  v3 = *(_QWORD *)&aMutableThreadI[v2 + 16];
  String.hash(into:)(v5, *(_QWORD *)&aAlert_2[v2], v3);
  swift_bridgeObjectRelease(v3);
  return Hasher._finalize()();
}

uint64_t sub_100019AF0(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = 8 * a2;
  v3 = *(_QWORD *)&aMutableThreadI[v2 + 16];
  String.hash(into:)(a1, *(_QWORD *)&aAlert_2[v2], v3);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_100019B30(uint64_t a1, char a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, a1);
  v3 = 8 * a2;
  v4 = *(_QWORD *)&aMutableThreadI[v3 + 16];
  String.hash(into:)(v6, *(_QWORD *)&aAlert_2[v3], v4);
  swift_bridgeObjectRelease(v4);
  return Hasher._finalize()();
}

uint64_t sub_100019B94(char a1)
{
  if ((a1 & 1) != 0)
    return 2036625250;
  else
    return 0x656C746974;
}

uint64_t sub_100019BC0(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;

  v17 = a4;
  v18 = a5;
  v9 = sub_100008628(&qword_10002A368);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a1[3];
  v13 = a1[4];
  sub_1000085E4(a1, v14);
  v15 = sub_10001AC0C();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for APS.Alert.CodingKeys, &type metadata for APS.Alert.CodingKeys, v15, v14, v13);
  v20 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(a2, a3, &v20, v9);
  if (!v5)
  {
    v19 = 1;
    KeyedEncodingContainer.encodeIfPresent(_:forKey:)(v17, v18, &v19, v9);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_100019CE8()
{
  char *v0;

  return sub_100019B94(*v0);
}

uint64_t sub_100019CF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_10001A0DC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100019D14(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001AC0C();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100019D3C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001AC0C();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100019D64@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = sub_10001A1AC(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_100019D90(_QWORD *a1)
{
  uint64_t *v1;

  return sub_100019BC0(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t sub_100019DAC(char a1)
{
  return *(_QWORD *)&aAlert_2[8 * a1];
}

uint64_t sub_100019DCC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
  _OWORD v24[2];

  v3 = v1;
  v5 = sub_100008628(&qword_10002A330);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_1000085E4(a1, v9);
  v11 = sub_10001A754();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for APS.CodingKeys, &type metadata for APS.CodingKeys, v11, v9, v10);
  v12 = *(_OWORD *)(v3 + 16);
  v24[0] = *(_OWORD *)v3;
  v24[1] = v12;
  v23 = 0;
  v13 = sub_10001A7DC();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v24, &v23, v5, &type metadata for APS.Alert, v13);
  if (!v2)
  {
    v14 = *(_QWORD *)(v3 + 32);
    v15 = *(_QWORD *)(v3 + 40);
    LOBYTE(v24[0]) = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, v24, v5);
    v16 = *(_QWORD *)(v3 + 48);
    v17 = *(_QWORD *)(v3 + 56);
    LOBYTE(v24[0]) = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v17, v24, v5);
    v18 = *(_QWORD *)(v3 + 64);
    LOBYTE(v24[0]) = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v18, v24, v5);
    v19 = *(_QWORD *)(v3 + 72);
    v20 = *(_QWORD *)(v3 + 80);
    LOBYTE(v24[0]) = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v19, v20, v24, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100019F70(char *a1, char *a2)
{
  return sub_100019A04(*a1, *a2);
}

Swift::Int sub_100019F7C()
{
  char *v0;

  return sub_100019A88(*v0);
}

uint64_t sub_100019F84(uint64_t a1)
{
  char *v1;

  return sub_100019AF0(a1, *v1);
}

Swift::Int sub_100019F8C(uint64_t a1)
{
  char *v1;

  return sub_100019B30(a1, *v1);
}

unint64_t sub_100019F94@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10001A358(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100019FC0@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_100019DAC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100019FE8()
{
  char *v0;

  return sub_100019DAC(*v0);
}

unint64_t sub_100019FF0@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10001A358(a1);
  *a2 = result;
  return result;
}

void sub_10001A014(_BYTE *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_10001A020(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001A754();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001A048(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001A754();
  return CodingKey.debugDescription.getter(a1, v2);
}

double sub_10001A070@<D0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v5;
  __int128 v6;
  _OWORD v7[5];
  uint64_t v8;

  sub_10001A3A0(a1, v7);
  if (!v2)
  {
    v5 = v7[3];
    *(_OWORD *)(a2 + 32) = v7[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_OWORD *)(a2 + 64) = v7[4];
    *(_QWORD *)(a2 + 80) = v8;
    result = *(double *)v7;
    v6 = v7[1];
    *(_OWORD *)a2 = v7[0];
    *(_OWORD *)(a2 + 16) = v6;
  }
  return result;
}

uint64_t sub_10001A0C8(_QWORD *a1)
{
  return sub_100019DCC(a1);
}

uint64_t sub_10001A0DC(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  char v6;

  v3 = a1 == 0x656C746974 && a2 == 0xE500000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x656C746974, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  else if (a1 == 2036625250 && a2 == 0xE400000000000000)
  {
    swift_bridgeObjectRelease(0xE400000000000000);
    return 1;
  }
  else
  {
    v6 = _stringCompareWithSmolCheck(_:_:expecting:)(2036625250, 0xE400000000000000, a1, a2, 0);
    swift_bridgeObjectRelease(a2);
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_10001A1AC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;

  v3 = sub_100008628(&qword_10002A358);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v8 = a1[4];
  sub_1000085E4(a1, v7);
  v9 = sub_10001AC0C();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for APS.Alert.CodingKeys, &type metadata for APS.Alert.CodingKeys, v9, v7, v8);
  if (v1)
  {
    sub_100008608(a1);
  }
  else
  {
    v18 = 0;
    v8 = KeyedDecodingContainer.decode(_:forKey:)(&v18, v3);
    v12 = v11;
    v17 = 1;
    v13 = swift_bridgeObjectRetain(v11);
    KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v17, v3, v13);
    v15 = v14;
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    swift_bridgeObjectRetain(v15);
    sub_100008608(a1);
    swift_bridgeObjectRelease(v15);
    swift_bridgeObjectRelease(v12);
  }
  return v8;
}

unint64_t sub_10001A358(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100024DB8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5)
    return 5;
  else
    return v3;
}

uint64_t sub_10001A3A0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __n128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD v40[3];
  uint64_t v41;
  char v42;

  v5 = sub_100008628(&qword_10002A318);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_1000085E4(a1, v9);
  v11 = sub_10001A754();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for APS.CodingKeys, &type metadata for APS.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_100008608(a1);
  v42 = 0;
  v12 = sub_10001A798();
  KeyedDecodingContainer.decode<A>(_:forKey:)(v40, &type metadata for APS.Alert, &v42, v5, &type metadata for APS.Alert, v12);
  v13 = v40[1];
  v37 = v40[0];
  v38 = a2;
  v14 = v41;
  v36 = v40[2];
  LOBYTE(v40[0]) = 1;
  swift_bridgeObjectRetain(v41);
  swift_bridgeObjectRetain(v13);
  v15 = KeyedDecodingContainer.decode(_:forKey:)(v40, v5);
  v39 = v16;
  v33 = v15;
  LOBYTE(v40[0]) = 2;
  swift_bridgeObjectRetain(v16);
  v35 = 0;
  v32 = KeyedDecodingContainer.decode(_:forKey:)(v40, v5);
  LOBYTE(v40[0]) = 3;
  v18 = v17;
  v19 = swift_bridgeObjectRetain(v17);
  v20 = KeyedDecodingContainer.decode(_:forKey:)(v40, v5, v19);
  v34 = v18;
  v31 = v20;
  LOBYTE(v40[0]) = 4;
  v21 = KeyedDecodingContainer.decode(_:forKey:)(v40, v5);
  v23 = v22;
  v24 = *(void (**)(char *, uint64_t))(v6 + 8);
  v25 = v21;
  v24(v8, v5);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  v26 = v39;
  swift_bridgeObjectRetain(v39);
  swift_bridgeObjectRetain(v23);
  swift_bridgeObjectRelease(v14);
  swift_bridgeObjectRelease(v13);
  swift_bridgeObjectRelease(v26);
  sub_100008608(a1);
  swift_bridgeObjectRelease(v23);
  v27 = v34;
  swift_bridgeObjectRelease(v34);
  swift_bridgeObjectRelease(v26);
  swift_bridgeObjectRelease(v14);
  result = swift_bridgeObjectRelease(v13);
  v29 = v38;
  *v38 = v37;
  v29[1] = v13;
  v29[2] = v36;
  v29[3] = v14;
  v29[4] = v33;
  v29[5] = v26;
  v29[6] = v32;
  v29[7] = v27;
  v29[8] = v31;
  v29[9] = v25;
  v29[10] = v23;
  return result;
}

unint64_t sub_10001A754()
{
  unint64_t result;

  result = qword_10002A320;
  if (!qword_10002A320)
  {
    result = swift_getWitnessTable(&unk_10001F92C, &type metadata for APS.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002A320);
  }
  return result;
}

unint64_t sub_10001A798()
{
  unint64_t result;

  result = qword_10002A328;
  if (!qword_10002A328)
  {
    result = swift_getWitnessTable(&unk_10001F904, &type metadata for APS.Alert);
    atomic_store(result, (unint64_t *)&qword_10002A328);
  }
  return result;
}

unint64_t sub_10001A7DC()
{
  unint64_t result;

  result = qword_10002A338;
  if (!qword_10002A338)
  {
    result = swift_getWitnessTable(&unk_10001F8DC, &type metadata for APS.Alert);
    atomic_store(result, (unint64_t *)&qword_10002A338);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for APS.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for APS.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_10001A8FC + 4 * byte_10001F765[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10001A930 + 4 * byte_10001F760[v4]))();
}

uint64_t sub_10001A930(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001A938(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001A940);
  return result;
}

uint64_t sub_10001A94C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001A954);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10001A958(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001A960(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for APS.CodingKeys()
{
  return &type metadata for APS.CodingKeys;
}

uint64_t destroy for APS.Alert(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
}

_QWORD *initializeWithCopy for APS.Alert(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

_QWORD *assignWithCopy for APS.Alert(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  a1[2] = a2[2];
  v6 = a2[3];
  v7 = a1[3];
  a1[3] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  return a1;
}

__n128 initializeWithTake for APS.Alert(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for APS.Alert(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  v5 = a1[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease(v5);
  v6 = a2[3];
  v7 = a1[3];
  a1[2] = a2[2];
  a1[3] = v6;
  swift_bridgeObjectRelease(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for APS.Alert(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for APS.Alert(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for APS.Alert()
{
  return &type metadata for APS.Alert;
}

unint64_t sub_10001AB38()
{
  unint64_t result;

  result = qword_10002A340;
  if (!qword_10002A340)
  {
    result = swift_getWitnessTable(&unk_10001F8B4, &type metadata for APS.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002A340);
  }
  return result;
}

unint64_t sub_10001AB80()
{
  unint64_t result;

  result = qword_10002A348;
  if (!qword_10002A348)
  {
    result = swift_getWitnessTable(&unk_10001F7EC, &type metadata for APS.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002A348);
  }
  return result;
}

unint64_t sub_10001ABC8()
{
  unint64_t result;

  result = qword_10002A350;
  if (!qword_10002A350)
  {
    result = swift_getWitnessTable(&unk_10001F814, &type metadata for APS.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002A350);
  }
  return result;
}

unint64_t sub_10001AC0C()
{
  unint64_t result;

  result = qword_10002A360;
  if (!qword_10002A360)
  {
    result = swift_getWitnessTable(&unk_10001FA34, &type metadata for APS.Alert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002A360);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for APS.Alert.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_10001AC9C + 4 * byte_10001F76F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10001ACD0 + 4 * byte_10001F76A[v4]))();
}

uint64_t sub_10001ACD0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001ACD8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001ACE0);
  return result;
}

uint64_t sub_10001ACEC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001ACF4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10001ACF8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001AD00(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for APS.Alert.CodingKeys()
{
  return &type metadata for APS.Alert.CodingKeys;
}

unint64_t sub_10001AD20()
{
  unint64_t result;

  result = qword_10002A370;
  if (!qword_10002A370)
  {
    result = swift_getWitnessTable(&unk_10001FA0C, &type metadata for APS.Alert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002A370);
  }
  return result;
}

unint64_t sub_10001AD68()
{
  unint64_t result;

  result = qword_10002A378;
  if (!qword_10002A378)
  {
    result = swift_getWitnessTable(&unk_10001F97C, &type metadata for APS.Alert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002A378);
  }
  return result;
}

unint64_t sub_10001ADB0()
{
  unint64_t result;

  result = qword_10002A380;
  if (!qword_10002A380)
  {
    result = swift_getWitnessTable(&unk_10001F9A4, &type metadata for APS.Alert.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_10002A380);
  }
  return result;
}

uint64_t sub_10001ADF4(uint64_t a1)
{
  return sub_10001AE9C(a1, qword_10002B330, 0x6C6172656E6547, 0xE700000000000000);
}

uint64_t sub_10001AE14(uint64_t a1)
{
  return sub_10001AE9C(a1, qword_10002B348, 0xD000000000000014, 0x8000000100021A80);
}

uint64_t *sub_10001AE38(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10001AE78(uint64_t a1)
{
  return sub_10001AE9C(a1, qword_10002B360, 0xD000000000000016, 0x8000000100021AA0);
}

uint64_t sub_10001AE9C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for Logger(0);
  sub_10001AE38(v7, a2);
  sub_10000A404(v7, (uint64_t)a2);
  return Logger.init(subsystem:category:)(0xD00000000000002FLL, 0x8000000100021A50, a3, a4);
}

void sub_10001AF10()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003BB0();
  sub_100003B94((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"feedPersonalizerFactory", v6, 2u);

  sub_100003BA4();
}

void sub_10001AFD8()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003BB0();
  sub_100003B94((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"appConfigurationManager", v6, 2u);

  sub_100003BA4();
}

void sub_10001B0A0()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003BB0();
  sub_100003B94((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"cachesDirectory", v6, 2u);

  sub_100003BA4();
}

void sub_10001B168()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003BB0();
  sub_100003B94((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchCompletion != nil", v6, 2u);

  sub_100003BA4();
}

void sub_10001B234()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003BB0();
  sub_100003B94((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchCompletion != nil", v6, 2u);

  sub_100003BA4();
}

void sub_10001B300()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100003BB0();
  sub_100003B94((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"cachesDirectory != nil", v6, 2u);

  sub_100003BA4();
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_URLWithString_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:relativeToURL:");
}

id objc_msgSend__cleanupFilesInDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cleanupFilesInDirectory:");
}

id objc_msgSend__downloadFileURL_toDirectory_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_downloadFileURL:toDirectory:withCompletion:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_appConfigurationManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appConfigurationManager");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_articleController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "articleController");
}

id objc_msgSend_articleSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "articleSource");
}

id objc_msgSend_articleWithID_qualityOfService_relativePriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "articleWithID:qualityOfService:relativePriority:");
}

id objc_msgSend_assetHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "assetHandle");
}

id objc_msgSend_attachmentWithIdentifier_URL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachmentWithIdentifier:URL:options:error:");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attachments");
}

id objc_msgSend_bannerImageForMask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bannerImageForMask");
}

id objc_msgSend_bannerImageForWhiteBackground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bannerImageForWhiteBackground");
}

id objc_msgSend_baselineAggregateWithConfigurableValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baselineAggregateWithConfigurableValues:");
}

id objc_msgSend_bestAttemptContent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bestAttemptContent");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_bundleChannelIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleChannelIDs");
}

id objc_msgSend_bundleSubscription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSubscription");
}

id objc_msgSend_bundleSubscriptionProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleSubscriptionProvider");
}

id objc_msgSend_cachesDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cachesDirectory");
}

id objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerURLForSecurityApplicationGroupIdentifier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "content");
}

id objc_msgSend_contentContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentContext");
}

id objc_msgSend_contentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentHandler");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_criticalAlertSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "criticalAlertSetting");
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentNotificationCenter");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_decayFactor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decayFactor");
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultConfiguration");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_derivedPersonalizationData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "derivedPersonalizationData");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_downloadIfNeededWithGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadIfNeededWithGroup:");
}

id objc_msgSend_downloadTaskWithURL_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "downloadTaskWithURL:completionHandler:");
}

id objc_msgSend_earlierDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "earlierDate:");
}

id objc_msgSend_enableFlushingWithFlushingThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableFlushingWithFlushingThreshold:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_feedPersonalizerFactory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "feedPersonalizerFactory");
}

id objc_msgSend_fetchAppConfigurationIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAppConfigurationIfNeededWithCompletion:");
}

id objc_msgSend_fetchAssetsWithCachesDirectory_thumbnailURLString_publisherLogoURLString_publisherLogoMaskURLString_publisherLogoCompactURLString_flintDocumentURLString_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAssetsWithCachesDirectory:thumbnailURLString:publisherLogoURLString:publisherLogoMaskURLString:publisherLogoCompactURLString:flintDocumentURLString:completion:");
}

id objc_msgSend_fileAttributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileAttributes");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filePath");
}

id objc_msgSend_finalizeContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finalizeContent:");
}

id objc_msgSend_headline(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headline");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithContentsOfFile:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_initWithAggregates_scoringType_decayRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAggregates:scoringType:decayRate:");
}

id objc_msgSend_initWithAppConfigurationManager_feedPersonalizerFactory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppConfigurationManager:feedPersonalizerFactory:");
}

id objc_msgSend_initWithArticlePayload_sourceChannel_assetManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArticlePayload:sourceChannel:assetManager:");
}

id objc_msgSend_initWithConfiguration_configurationManager_contentHostDirectory_networkBehaviorMonitor_networkReachability_desiredHeadlineFieldOptions_feedUsage_assetKeyManagerDelegate_appActivityMonitor_backgroundTaskable_pptContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConfiguration:configurationManager:contentHostDirectory:networkBehaviorMonitor:networkReachability:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:");
}

id objc_msgSend_initWithContextConfiguration_contentHostDirectoryFileURL_feldsparIDProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:");
}

id objc_msgSend_initWithDropbox_transactionQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDropbox:transactionQueue:");
}

id objc_msgSend_initWithFileURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileURL:");
}

id objc_msgSend_initWithFileURL_storefrontID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFileURL:storefrontID:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithGenerator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGenerator:");
}

id objc_msgSend_initWithItems_baselineClickThroughRate_todayData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItems:baselineClickThroughRate:todayData:");
}

id objc_msgSend_initWithThumbnailImage_title_shortExcerpt_publishDate_publisherName_publisherLogoImage_publisherLogoMaskImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithThumbnailImage:title:shortExcerpt:publishDate:publisherName:publisherLogoImage:publisherLogoMaskImage:");
}

id objc_msgSend_initWithTranslationProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTranslationProvider:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_interruptionLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interruptionLevel");
}

id objc_msgSend_isBundlePaid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBundlePaid");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isPaid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPaid");
}

id objc_msgSend_isPaired(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPaired");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "items");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_newFeedPersonalizerWithAggregateStore_appConfigurationManager_todayPrivateData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newFeedPersonalizerWithAggregateStore:appConfigurationManager:todayPrivateData:");
}

id objc_msgSend_notificationArrived_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationArrived:completionHandler:");
}

id objc_msgSend_notificationAttachmentsWithThumbnailFileURL_publisherLogoFileURL_publisherLogoMaskFileURL_publisherLogoCompactFileURL_isKettleDigestEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationAttachmentsWithThumbnailFileURL:publisherLogoFileURL:publisherLogoMaskFileURL:publisherLogoCompactFileURL:isKettleDigestEnabled:");
}

id objc_msgSend_notificationScoringConfig(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationScoringConfig");
}

id objc_msgSend_notificationSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notificationSettings");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_performBlockWhenFullyLoaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockWhenFullyLoaded:");
}

id objc_msgSend_personalizationScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalizationScore");
}

id objc_msgSend_personalizationTreatment(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalizationTreatment");
}

id objc_msgSend_personalizationValueWithBaseline_decayRate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalizationValueWithBaseline:decayRate:");
}

id objc_msgSend_personalizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "personalizer");
}

id objc_msgSend_postProcessCoordinator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postProcessCoordinator");
}

id objc_msgSend_prepareForUseWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForUseWithCompletionHandler:");
}

id objc_msgSend_processDidReceiveSingleArticleNotificationRequest_withContentHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processDidReceiveSingleArticleNotificationRequest:withContentHandler:");
}

id objc_msgSend_publishDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishDate");
}

id objc_msgSend_purchaseProvider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purchaseProvider");
}

id objc_msgSend_purchasedTagIDs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "purchasedTagIDs");
}

id objc_msgSend_readPrivateDataSyncWithAccessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readPrivateDataSyncWithAccessor:");
}

id objc_msgSend_relevanceScore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "relevanceScore");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_scheduledDeliverySetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledDeliverySetting");
}

id objc_msgSend_scoreProfiles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scoreProfiles");
}

id objc_msgSend_setArticleSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setArticleSource:");
}

id objc_msgSend_setAttachments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttachments:");
}

id objc_msgSend_setBestAttemptContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBestAttemptContent:");
}

id objc_msgSend_setContentHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentHandler:");
}

id objc_msgSend_setLoadedArticle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoadedArticle:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setRelevanceScore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRelevanceScore:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_sharedAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedAccount");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedNetworkReachability(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedNetworkReachability");
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedSession");
}

id objc_msgSend_shortExcerpt(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortExcerpt");
}

id objc_msgSend_sortItems_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortItems:completion:");
}

id objc_msgSend_sortItems_options_configurationSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortItems:options:configurationSet:");
}

id objc_msgSend_sourceChannel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceChannel");
}

id objc_msgSend_sourceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceName");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_supportedContentStoreFrontID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedContentStoreFrontID");
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "theme");
}

id objc_msgSend_thumbnailAssetHandle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumbnailAssetHandle");
}

id objc_msgSend_thumbnailHQ(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thumbnailHQ");
}

id objc_msgSend_timeSensitiveSetting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeSensitiveSetting");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_unregister(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregister");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceStyle");
}
