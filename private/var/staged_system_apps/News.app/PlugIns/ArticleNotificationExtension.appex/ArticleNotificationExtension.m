void sub_1000041E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004204(uint64_t a1, void *a2, void *a3)
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
  v11[2] = sub_1000042D8;
  v11[3] = &unk_1000082D8;
  v12 = v6;
  v8 = *(id *)(a1 + 32);
  v13 = v5;
  v14 = v8;
  v9 = v5;
  v10 = v6;
  FCPerformIfNonNil(WeakRetained, v11);

}

void sub_1000042D8(uint64_t a1, void *a2)
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
    v47[3] = sub_1000046E0;
    v47[4] = sub_1000046F0;
    v48 = 0;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = sub_1000046E0;
    v45[4] = sub_1000046F0;
    v46 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = sub_1000046E0;
    v43[4] = sub_1000046F0;
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
        block[2] = sub_1000046F8;
        block[3] = &unk_1000082B0;
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

void sub_100004690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 184), 8);
  _Block_object_dispose((const void *)(v28 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000046E0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000046F0(uint64_t a1)
{

}

void sub_1000046F8(uint64_t a1)
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
  block[2] = sub_100004878;
  block[3] = &unk_100008288;
  v18 = *(_QWORD *)(a1 + 72);
  v16 = *(id *)(a1 + 56);
  v19 = *(_OWORD *)(a1 + 80);
  v17 = *(id *)(a1 + 64);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100004878(uint64_t a1)
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

void sub_1000049F8(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

void sub_100004ED8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_100004F08(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "articleViewController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004F9C;
  v6[3] = &unk_100008328;
  v6[4] = WeakRetained;
  objc_msgSend(v5, "presentArticle:completion:", v3, v6);

}

id sub_100004F9C(uint64_t a1, double a2, double a3)
{
  objc_msgSend(*(id *)(a1 + 32), "setArticlePreferredSize:");
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", a2, a3);
}

void sub_100004FDC(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "articleViewController"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100005100;
    v10[3] = &unk_100008328;
    v10[4] = v5;
    objc_msgSend(v6, "presentArticle:completion:", v3, v10);

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005140;
    v8[3] = &unk_100008350;
    objc_copyWeak(&v9, (id *)(a1 + 40));
    +[NSSArticleInternal articleFromNotification:completion:](NSSArticleInternal, "articleFromNotification:completion:", v7, v8);
    objc_destroyWeak(&v9);
  }

}

void sub_1000050EC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_100005100(uint64_t a1, double a2, double a3)
{
  objc_msgSend(*(id *)(a1 + 32), "setArticlePreferredSize:");
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", a2, a3);
}

void sub_100005140(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "articleViewController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000051D4;
  v6[3] = &unk_100008328;
  v6[4] = WeakRetained;
  objc_msgSend(v5, "presentArticle:completion:", v3, v6);

}

id sub_1000051D4(uint64_t a1, double a2, double a3)
{
  objc_msgSend(*(id *)(a1 + 32), "setArticlePreferredSize:");
  return objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", a2, a3);
}

void sub_100005858()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100004A14();
  sub_1000049F8((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"cachesDirectory", v6, 2u);

  sub_100004A08();
}

void sub_100005920()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  sub_100004A14();
  sub_1000049F8((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"fetchCompletion != nil", v6, 2u);

  sub_100004A08();
}

void sub_1000059EC()
{
  id v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("invalid nil value for '%s'"));
  sub_1000057BC();
  sub_1000057AC();
  sub_100004A14();
  sub_1000049F8((void *)&_mh_execute_header, &_os_log_default, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"contentContext", v6, 2u);

  sub_100004A08();
}

id objc_msgSend_URLWithString_relativeToURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:relativeToURL:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_articleController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "articleController");
}

id objc_msgSend_articleFromNotification_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "articleFromNotification:completion:");
}

id objc_msgSend_articlePreferredSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "articlePreferredSize");
}

id objc_msgSend_articleRecordData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "articleRecordData");
}

id objc_msgSend_articleSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "articleSource");
}

id objc_msgSend_articleViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "articleViewController");
}

id objc_msgSend_articleWithID_qualityOfService_relativePriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "articleWithID:qualityOfService:relativePriority:");
}

id objc_msgSend_asChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asChannel");
}

id objc_msgSend_assetHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetHandle");
}

id objc_msgSend_assetManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetManager");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachments");
}

id objc_msgSend_bannerImageForMask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerImageForMask");
}

id objc_msgSend_bannerImageForWhiteBackground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bannerImageForWhiteBackground");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_cachesDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cachesDirectory");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content");
}

id objc_msgSend_contentContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentContext");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultConfiguration");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_downloadIfNeededWithGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadIfNeededWithGroup:");
}

id objc_msgSend_enableFlushingWithFlushingThreshold_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableFlushingWithFlushingThreshold:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_fetchArticleWithID_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchArticleWithID:completion:");
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filePath");
}

id objc_msgSend_headline(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headline");
}

id objc_msgSend_imageWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithContentsOfFile:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_initWithArticleRecordData_sourceChannel_parentIssue_assetManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArticleRecordData:sourceChannel:parentIssue:assetManager:");
}

id objc_msgSend_initWithCachesDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCachesDirectory:");
}

id objc_msgSend_initWithConfiguration_configurationManager_contentHostDirectory_networkBehaviorMonitor_networkReachability_desiredHeadlineFieldOptions_feedUsage_assetKeyManagerDelegate_appActivityMonitor_backgroundTaskable_pptContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfiguration:configurationManager:contentHostDirectory:networkBehaviorMonitor:networkReachability:desiredHeadlineFieldOptions:feedUsage:assetKeyManagerDelegate:appActivityMonitor:backgroundTaskable:pptContext:");
}

id objc_msgSend_initWithContextConfiguration_contentHostDirectoryFileURL_feldsparIDProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContextConfiguration:contentHostDirectoryFileURL:feldsparIDProvider:");
}

id objc_msgSend_initWithData_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:context:");
}

id objc_msgSend_initWithData_sourceChannel_assetManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:sourceChannel:assetManager:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithThumbnailImage_title_shortExcerpt_publishDate_publisherName_publisherLogoImage_publisherLogoMaskImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithThumbnailImage:title:shortExcerpt:publishDate:publisherName:publisherLogoImage:publisherLogoMaskImage:");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_parentIssueRecordData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentIssueRecordData");
}

id objc_msgSend_performBlockWhenFullyLoaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBlockWhenFullyLoaded:");
}

id objc_msgSend_presentArticle_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentArticle:completion:");
}

id objc_msgSend_publishDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publishDate");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_setArticleID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArticleID:");
}

id objc_msgSend_setArticlePreferredSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArticlePreferredSize:");
}

id objc_msgSend_setArticleViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArticleViewController:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setLoadedArticle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLoadedArticle:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedNetworkReachability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedNetworkReachability");
}

id objc_msgSend_shortExcerpt(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortExcerpt");
}

id objc_msgSend_slowCachedTagForID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "slowCachedTagForID:");
}

id objc_msgSend_sourceChannel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceChannel");
}

id objc_msgSend_sourceChannelID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceChannelID");
}

id objc_msgSend_sourceChannelRecordData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceChannelRecordData");
}

id objc_msgSend_sourceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceName");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_tagController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tagController");
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "theme");
}

id objc_msgSend_thumbnailAssetHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbnailAssetHandle");
}

id objc_msgSend_thumbnailHQ(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thumbnailHQ");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_uniqueKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueKey");
}

id objc_msgSend_unregister(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregister");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceStyle");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}
