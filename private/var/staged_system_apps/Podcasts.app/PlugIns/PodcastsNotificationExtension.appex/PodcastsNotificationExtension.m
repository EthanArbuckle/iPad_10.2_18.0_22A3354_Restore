uint64_t sub_100001BC4(uint64_t a1, int a2, int a3)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, (a3 | a2) == 0);
  return result;
}

void sub_100001DAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  void *v17;

  objc_sync_exit(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

id sub_100001DD4(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_retainBlock(*(id *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_100001DFC(uint64_t a1)
{

}

void sub_100001E04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  dispatch_time_t v10;
  _QWORD block[5];

  if (a3 | a2)
  {
    v6 = *(id *)(a1 + 32);
    objc_sync_enter(v6);
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v7)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(v7 + 16))(v7, a2, a3, 0);
      v8 = *(void **)(a1 + 32);
      v9 = objc_retainBlock(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v8, "removeObject:", v9);

    }
    objc_sync_exit(v6);

  }
  v10 = dispatch_time(0, 250000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001F10;
  block[3] = &unk_1000287D0;
  block[4] = *(_QWORD *)(a1 + 40);
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100001EFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100001F10(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "magicMomentCompletionHandlers"));
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "magicMomentCompletionHandlers"));
  v4 = objc_msgSend(v3, "count");

  objc_sync_exit(v2);
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "_getNowPlayingInfoAndCallPendingCompletions");
}

void sub_100001F88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000020C4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000020E8(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a2;
  v4 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "magicMomentCompletionHandlers"));

  objc_sync_enter(v6);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_loadWeakRetained(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "magicMomentCompletionHandlers", 0));

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v11) + 16))();
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  v12 = objc_loadWeakRetained(v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "magicMomentCompletionHandlers"));
  objc_msgSend(v13, "removeAllObjects");

  MRMediaRemoteSetWantsNowPlayingNotifications(0);
  objc_sync_exit(v6);

}

void sub_10000226C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000023B8(uint64_t a1, uint64_t a2)
{
  uint64_t ContentItemAtOffset;
  void *v4;
  uint64_t v5;
  void *v6;

  ContentItemAtOffset = MRPlaybackQueueGetContentItemAtOffset(a2, 0);
  v4 = (void *)MRContentItemCopyNowPlayingInfo(ContentItemAtOffset);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    v6 = v4;
    (*(void (**)(void))(v5 + 16))();
    v4 = v6;
  }

}

void sub_1000026D8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  uint64_t v13;

  if ((_DWORD)a2)
  {
    v5 = _MTLogCategoryPlayback();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v12 = 134217984;
      v13 = a2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to set playback queue: MediaRemote command failed with MRSendCommandError: %ld", (uint8_t *)&v12, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 32);
    if (v7)
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, 2, a2);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "firstObject"));
    v9 = objc_msgSend(v8, "unsignedIntValue");
    if (v9)
    {
      v10 = _MTLogCategoryPlayback();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = 134217984;
        v13 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to set playback queue: MediaRemote command failed with MRMediaRemoteCommandHandlerStatus: %ld", (uint8_t *)&v12, 0xCu);
      }

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t sub_100002A8C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100002B28(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100002DF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100002E0C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;

  v3 = a2;
  if ((objc_msgSend(v3, "isSourceOfTruth") & 1) != 0
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "backgroundEpisodeUuidFetches")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid")),
        v6 = objc_msgSend(v4, "containsObject:", v5),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uuid"));
  }

  return v7;
}

void sub_100002E9C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002F54;
  block[3] = &unk_1000288E8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  v6 = v3;
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
}

void sub_100002F54(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id to;

  objc_copyWeak(&to, (id *)(a1 + 48));
  v2 = objc_loadWeakRetained(&to);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");

    if (v4)
    {
      v5 = objc_loadWeakRetained(&to);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allObjects"));
      objc_msgSend(v5, "_didFetchEpisodePropertySources:", v6);

    }
  }
  v7 = objc_loadWeakRetained(&to);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "backgroundEpisodeUuidFetches"));
  objc_msgSend(v8, "removeObjectsInArray:", *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&to);
}

void sub_100003010(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

NSString *__cdecl sub_100003214(id a1, EpisodePropertySource *a2)
{
  return (NSString *)-[EpisodePropertySource uuid](a2, "uuid");
}

id sub_10000321C(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "uuid"));
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

NSString *__cdecl sub_100003260(id a1, EpisodePropertySource *a2)
{
  return (NSString *)-[EpisodePropertySource uuid](a2, "uuid");
}

NSString *__cdecl sub_100003268(id a1, EpisodePropertySource *a2)
{
  return (NSString *)-[EpisodePropertySource uuid](a2, "uuid");
}

void sub_100003D58(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_removeNotificationFromHistory");
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionContext"));
  objc_msgSend(v2, "dismissNotificationContentExtension");

}

uint64_t sub_100003F10(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "podcastUuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "podcastUuid"));
  v5 = objc_msgSend(v3, "isEqualToString:", v4) ^ 1;

  return v5;
}

id sub_100004D98(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "uuid"));
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

double sub_100004F28(uint64_t a1, unint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  objc_msgSend(*(id *)(a1 + 32), "itemSize");
  v5 = v4;
  v6 = 0.0;
  if (a2 >= 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "minimumLineSpacing");
    v6 = v7 * (double)(a2 - 1);
  }
  objc_msgSend(*(id *)(a1 + 32), "sectionInset");
  v9 = v6 + v5 * (double)a2 + v8;
  objc_msgSend(*(id *)(a1 + 32), "sectionInset");
  v11 = v9 + v10;
  objc_msgSend(*(id *)(a1 + 32), "footerReferenceSize");
  return v11 + v12;
}

id *sub_100005EE4(id *result, uint64_t a2)
{
  if (a2)
    return (id *)objc_msgSend(result[4], "applyImage:fromSource:", a2, result[5]);
  return result;
}

void sub_100005FA8(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "episodePropertySource"));
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "setHasLoadedCurrentImage:", objc_msgSend(*(id *)(a1 + 40), "isSourceOfTruth"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "artworkView"));
    objc_msgSend(v4, "setImage:", *(_QWORD *)(a1 + 48));

  }
}

void sub_100007020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007044(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfURL:", v3);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v5));
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
    else
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100007150;
      v9[3] = &unk_100028AA8;
      v8 = *(void **)(a1 + 32);
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v8, "placeholderWithSize:completionHandler:", v9, *(double *)(a1 + 56), *(double *)(a1 + 64));

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t sub_100007150(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100007440()
{
  _QWORD v0[4];
  Block_layout *v1;
  const char *v2;
  _QWORD v3[4];
  Block_layout *v4;
  const char *v5;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100007580;
  v3[3] = &unk_100028B60;
  v4 = &stru_100028B10;
  v5 = "preferredContentSizeCategory";
  +[IMRuntimeUtil swizzleMethod:onClass:withReplacementBlock:](IMRuntimeUtil, "swizzleMethod:onClass:withReplacementBlock:", "preferredContentSizeCategory", objc_opt_class(UIContentSizeCategoryPreference), v3);
  v0[0] = _NSConcreteStackBlock;
  v0[1] = 3221225472;
  v0[2] = sub_100007620;
  v0[3] = &unk_100028B60;
  v1 = &stru_100028B10;
  v2 = "preferredContentSizeCategory";
  +[IMRuntimeUtil swizzleMethod:onClass:withReplacementBlock:](IMRuntimeUtil, "swizzleMethod:onClass:withReplacementBlock:", "preferredContentSizeCategory", objc_opt_class(UITraitCollection), v0);

}

NSString *__cdecl sub_10000752C(id a1, id a2, SEL a3, void *a4)
{
  uint64_t v4;
  NSString *v5;
  UIContentSizeCategory v6;
  NSString *v7;

  v4 = ((uint64_t (*)(id, SEL))a4)(a2, a3);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue(v4);
  if (UIContentSizeCategoryIsAccessibilityCategory(v5))
    v6 = UIContentSizeCategoryExtraExtraExtraLarge;
  else
    v6 = v5;
  v7 = v6;

  return v7;
}

IMP sub_100007580(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  IMP v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000760C;
  v9[3] = &unk_100028B38;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v10 = v4;
  v11 = v5;
  v12 = a2;
  v6 = objc_retainBlock(v9);
  v7 = imp_implementationWithBlock(v6);

  return v7;
}

uint64_t sub_10000760C(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a2, a1[5], a1[6]);
}

IMP sub_100007620(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  IMP v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000076AC;
  v9[3] = &unk_100028B38;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v10 = v4;
  v11 = v5;
  v12 = a2;
  v6 = objc_retainBlock(v9);
  v7 = imp_implementationWithBlock(v6);

  return v7;
}

uint64_t sub_1000076AC(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a2, a1[5], a1[6]);
}

NSString *__cdecl sub_10000792C(id a1, MTNotificationEpisode *a2)
{
  return -[MTNotificationEpisode podcastUuid](a2, "podcastUuid");
}

void sub_100007C8C(id a1, NSLayoutConstraint *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;

  v6 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSLayoutConstraint mt_dynamicTypeConstant](v6, "mt_dynamicTypeConstant"));
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "currentConstant");
    -[NSLayoutConstraint setConstant:](v6, "setConstant:");
  }

}

id sub_100007E6C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = objc_alloc((Class)NSURLQueryItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3));
  v6 = objc_msgSend(v4, "initWithName:value:", v3, v5);

  return v6;
}

id sub_100008080(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = objc_alloc((Class)NSURLQueryItem);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3));
  v6 = objc_msgSend(v4, "initWithName:value:", v3, v5);

  return v6;
}

void sub_10000818C(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[3];

  v3[0] = CFSTR("playPodcast");
  v3[1] = CFSTR("playPodcasts");
  v3[2] = CFSTR("playStation");
  v1 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
  v2 = (void *)qword_100033370;
  qword_100033370 = v1;

}

void sub_100008890(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000088A8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000088B8(uint64_t a1)
{

}

void sub_1000088C0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "episodeForUuid:", *(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "podcast"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uuid"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100009130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_100009160(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "executeFetchRequest:error:", v3, &obj));
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
  v8 = *(_QWORD *)(a1[7] + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void sub_1000093C0(id a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[3];
  _QWORD v4[3];

  v3[0] = CFSTR("playPodcasts");
  v3[1] = CFSTR("playPodcast");
  v4[0] = &off_100029F80;
  v4[1] = &off_100029F98;
  v3[2] = CFSTR("playStation");
  v4[2] = &off_100029FB0;
  v1 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v4, v3, 3));
  v2 = (void *)qword_100033388;
  qword_100033388 = v1;

}

void sub_10000A0C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 56));
  _Unwind_Resume(a1);
}

void sub_10000A0F8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "podcastUuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "podcastForUuid:", v3));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 != 0;

}

void sub_10000A2B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 56));
  _Unwind_Resume(a1);
}

void sub_10000A2EC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  v2 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "episodeUuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "episodeForUuid:", v3));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 != 0;

}

int64_t sub_10000A89C(id a1, MTLineCountLayoutGroupItem *a2, MTLineCountLayoutGroupItem *a3)
{
  MTLineCountLayoutGroupItem *v4;
  unint64_t v5;
  id v6;
  int64_t v7;

  v4 = a3;
  v5 = -[MTLineCountLayoutGroupItem sharingPriority](a2, "sharingPriority");
  v6 = -[MTLineCountLayoutGroupItem sharingPriority](v4, "sharingPriority");

  v7 = -1;
  if (v5 <= (unint64_t)v6)
    v7 = 1;
  if ((id)v5 == v6)
    return 0;
  else
    return v7;
}

void sub_10000ADB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000ADD4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000ADE4(uint64_t a1)
{

}

void sub_10000ADEC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "podcastForUuid:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v6 = v2;
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sortDescriptorsForSortOrder"));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = v6;
  }

}

NSURL *__cdecl sub_10000B254(id a1, MTPodcast *a2)
{
  return (NSURL *)-[MTPodcast displayURL](a2, "displayURL");
}

NSURL *__cdecl sub_10000B3C0(id a1, MTEpisode *a2)
{
  return (NSURL *)-[MTEpisode displayURL](a2, "displayURL");
}

uint64_t sub_10000B5E0(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_10000B5F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000B758(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B774(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "episodeForUuid:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v9 = v2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uuid"));
    v4 = objc_msgSend(v3, "length");

    v2 = v9;
    if (v4)
    {
      v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v2 = v9;
    }
  }

}

void sub_10000B95C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B978(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "podcastForUuid:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v9 = v2;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uuid"));
    v4 = objc_msgSend(v3, "length");

    v2 = v9;
    if (v4)
    {
      v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v2 = v9;
    }
  }

}

uint64_t sub_10000BE80(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10000C000(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  DatabaseEpisodePropertySource *v13;
  DatabaseEpisodePropertySource *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _BYTE v30[128];

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_10000ADD4;
  v28 = sub_10000ADE4;
  v29 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainOrPrivateContext"));

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10000C254;
  v19[3] = &unk_100028E58;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 48);
  v20 = v4;
  v23 = v5;
  v6 = v3;
  v21 = v6;
  v22 = &v24;
  objc_msgSend(v6, "performBlockAndWait:", v19);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = (id)v25[5];
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v11);
        v13 = [DatabaseEpisodePropertySource alloc];
        v14 = -[DatabaseEpisodePropertySource initWithFetchedPropertyValues:](v13, "initWithFetchedPropertyValues:", v12, (_QWORD)v15);
        if (v14)
          objc_msgSend(v7, "addObject:", v14);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v30, 16);
    }
    while (v9);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_object_dispose(&v24, 8);

}

void sub_10000C220(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_10000C254(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;

  if (objc_msgSend(*(id *)(a1 + 32), "count") == (id)1)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "firstObject"));
    v3 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuid:](MTEpisode, "predicateForEpisodeUuid:", v2));
  }
  else
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", *(_QWORD *)(a1 + 32)));
    v3 = objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeUuids:](MTEpisode, "predicateForEpisodeUuids:", v2));
  }
  v4 = (void *)v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "propertiesToFetch"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setByAddingObject:", kEpisodeUuid));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "computedPropertiesToFetch"));
  v8 = *(void **)(a1 + 40);
  v9 = kMTEpisodeEntityName;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectDictionariesInEntity:predicate:sortDescriptors:propertiesToFetch:includeObjectId:", v9, v4, 0, v10, 0));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10000C404;
  v16[3] = &unk_100028E30;
  v17 = *(id *)(a1 + 40);
  v18 = v7;
  v12 = v7;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mt_compactMap:", v16));
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v13;

}

id sub_10000C404(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = kEpisodeUuid;
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectDictionaryForUuid:entityName:byAddingComputedProperties:toFetchedObjectDictionary:", v5, kMTEpisodeEntityName, *(_QWORD *)(a1 + 40), v4));

  return v6;
}

uint64_t sub_10000CC90(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_10000CF2C(uint64_t a1)
{
  id v1;
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000D28C;
  v3[3] = &unk_100028EA0;
  v3[4] = a1;
  v1 = sub_10000D20C(v3);
  return (id)objc_claimAutoreleasedReturnValue(v1);
}

id sub_10000D20C(void *a1)
{
  id v1;
  uint64_t (**v2)(_QWORD, _QWORD, _QWORD);
  uint64_t v3;
  void *v4;

  v1 = a1;
  v2 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))v1;
  if (qword_100033390 != -1)
  {
    dispatch_once(&qword_100033390, &stru_100028EC0);
    if (v2)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  if (!v1)
    goto LABEL_5;
LABEL_3:
  v3 = v2[2](v2, qword_100033398, qword_1000333A0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
LABEL_6:

  return v4;
}

id sub_10000D28C(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", *(_QWORD *)(a1 + 32)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", &off_100029FE0));
  v8 = v7;

  return v8;
}

void sub_10000D318(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v15[0] = &off_100029FE0;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("podcastAction-"), 0));
  v16[0] = v1;
  v15[1] = &off_100029FF8;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("podcastAction-"), 1));
  v16[1] = v2;
  v15[2] = &off_10002A010;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("podcastAction-"), 2));
  v16[2] = v3;
  v15[3] = &off_10002A028;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("podcastAction-"), 3));
  v16[3] = v4;
  v15[4] = &off_10002A040;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%d"), CFSTR("podcastAction-"), 4));
  v16[4] = v5;
  v6 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 5));
  v7 = (void *)qword_100033398;
  qword_100033398 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v9 = (void *)qword_100033398;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000D524;
  v13[3] = &unk_100028EE8;
  v14 = v8;
  v10 = v8;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v13);
  v11 = objc_msgSend(v10, "copy");
  v12 = (void *)qword_1000333A0;
  qword_1000333A0 = (uint64_t)v11;

}

id sub_10000D524(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a2, a3);
}

id sub_10000D534(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
}

void sub_10000D96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D984(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000D994(uint64_t a1)
{

}

void sub_10000D99C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "podcastForUuid:", *(_QWORD *)(a1 + 40)));
  if (objc_msgSend(v4, "hidden"))
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
}

void sub_10000DB3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DB54(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "podcastForUuid:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(a1 + 56);
  v8 = v2;
  if (*(_BYTE *)(a1 + 64))
  {
    if (*(_BYTE *)(a1 + 65))
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "newestUserEpisodeExcludingExplicit:", v3));
    else
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oldestUserEpisodeExcludingExplicit:", v3));
  }
  else if (*(_BYTE *)(a1 + 65))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "newestEpisodeExcludingUuid:excludeExplicit:", 0, v3));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "oldestEpisodeExcludingExplicit:", v3));
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = v4;
  v7 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v6;

}

void sub_10000DCE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DD00(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id sub_10000DDD4(id a1, NSDictionary *a2)
{
  NSDictionary *v2;
  MTNotificationEpisode *v3;

  v2 = a2;
  v3 = -[MTNotificationEpisode initWithDictionaryRepresentation:]([MTNotificationEpisode alloc], "initWithDictionaryRepresentation:", v2);

  return v3;
}

id sub_10000DFF4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "identifier"));
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_10000E694(id a1)
{
  dispatch_queue_t v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = dispatch_queue_create(0, 0);
  v2 = (void *)qword_1000333B0;
  qword_1000333B0 = (uint64_t)v1;

  v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = (void *)qword_1000333B8;
  qword_1000333B8 = v3;

}

uint64_t sub_10000E6DC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000E7B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E7C8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000E7D8(uint64_t a1)
{

}

void sub_10000E7E0(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v8));

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

void sub_10000E8BC(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

uint64_t sub_10000EB64(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10000EB74(uint64_t a1)
{

}

void sub_10000EB7C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 32);
  if (!v2)
    v2 = *(void **)(v1 + 56);
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void sub_10000EC30(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;

  v2 = _MTLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MTAccountController: Setting active account: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 56), *(id *)(a1 + 32));
}

void sub_10000EDF8(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  if ((objc_msgSend(*(id *)(a1 + 32), "hasFetchedInitialAccount") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_updateActiveAccount");
  v2 = *(void **)(a1 + 40);
  if (v2)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000EE90;
    block[3] = &unk_100029010;
    v5 = v2;
    dispatch_async(v3, block);

  }
}

uint64_t sub_10000EE90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10000F154(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint8_t v8[16];

  v2 = _MTLogCategoryDefault();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MTAccountController: updating active account", v8, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_activeAccountBlocking"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  v7 = *(_QWORD *)(a1 + 40);
  if (v7 | v6 && (objc_msgSend((id)v7, "isEqualToString:", v6) & 1) == 0)
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000290E0);
  objc_msgSend(*(id *)(a1 + 32), "setActiveAccount:", v4);
  objc_msgSend(*(id *)(a1 + 32), "setHasFetchedInitialAccount:", 1);

}

void sub_10000F23C(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v1, "postNotificationName:object:", CFSTR("AccountDSIDChangedNotification"), 0);

}

void sub_10000F5F4(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initDefault");
  v2 = (void *)qword_1000333C8;
  qword_1000333C8 = (uint64_t)v1;

}

void sub_10000F9C0(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc(*(Class *)(a1 + 32)), "_initDefault");
  v2 = (void *)qword_1000333D8;
  qword_1000333D8 = (uint64_t)v1;

}

void sub_1000104F8(uint64_t a1)
{
  id v1;
  void *v2;
  objc_super v3;

  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS___MTShowsPreferencesDataStore;
  v1 = objc_msgSend(objc_msgSendSuper2(&v3, "allocWithZone:", 0), "init");
  v2 = (void *)qword_1000333E0;
  qword_1000333E0 = (uint64_t)v1;

}

NSString *__cdecl sub_100011D74(id a1, NSSortDescriptor *a2)
{
  return -[NSSortDescriptor key](a2, "key");
}

void sub_100012420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012438(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTRecencyUtil upNextForPodcastUuid:excludeExplicit:ctx:](MTRecencyUtil, "upNextForPodcastUuid:excludeExplicit:ctx:", v2, 0, *(_QWORD *)(a1 + 40)));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeUuid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "nextEpisodeUuid"));
  v6 = _MTLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeUuid"));
    objc_msgSend(v3, "modifiedDate");
    v16 = 138543874;
    v17 = v8;
    v18 = 2114;
    v19 = v9;
    v20 = 2050;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "UpNext result from update cursor position for podcast %{public}@: episodeUuid: %{public}@ at %{public}f", (uint8_t *)&v16, 0x20u);

  }
  v11 = _MTLogCategoryDefault();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "episodeUuid"));
    v16 = 138543618;
    v17 = v5;
    v18 = 2114;
    v19 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "UpNext result updating podcast nextEpisodeUuid from %{public}@ to %{public}@", (uint8_t *)&v16, 0x16u);

  }
  if (v5 != v4 && (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "episodeForUuid:", v4));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "episodeForUuid:", v5));
    if (objc_msgSend(v15, "listenNowEpisode"))
    {
      objc_msgSend(v15, "setListenNowEpisode:", 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    if (v14 && (objc_msgSend(v14, "listenNowEpisode") & 1) == 0)
    {
      objc_msgSend(v14, "setListenNowEpisode:", 1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      objc_msgSend(v3, "modifiedDate");
      objc_msgSend(*(id *)(a1 + 32), "setModifiedDate:");
    }

  }
  if (*(_BYTE *)(a1 + 56) && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "saveInCurrentBlock");

}

void sub_1000127E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100012800(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100012810(uint64_t a1)
{

}

void sub_100012818(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "podcastForFeedUrl:", *(_QWORD *)(a1 + 40)));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uuid"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100012BE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_100012BF8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", kMTEpisodeEntityName));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uuid"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodesWithSeasonNumbersOnPodcastUuid:](MTEpisode, "predicateForEpisodesWithSeasonNumbersOnPodcastUuid:", v3));
  objc_msgSend(v2, "setPredicate:", v4);

  objc_msgSend(v2, "setFetchLimit:", 1);
  v5 = *(void **)(a1 + 40);
  v8 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v2, &v8));
  v7 = v8;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v6, "count") != 0;

  objc_msgSend(v7, "logAndThrow:", 0);
}

void sub_100012E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100012E20(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_fetchRequestForDistinctSeasons"));
  v3 = *(void **)(a1 + 40);
  v9 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "executeFetchRequest:error:", v2, &v9));
  v5 = v9;
  objc_msgSend(v5, "logAndThrow:", 0);
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", kEpisodeSeasonNumber));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void sub_100012FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013000(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "predicateForPodcast:", *(_QWORD *)(a1 + 40)));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeType:](MTEpisode, "predicateForEpisodeType:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForSeasonNumberWithNoEpisodeNumber:](MTEpisode, "predicateForSeasonNumberWithNoEpisodeNumber:", *(_QWORD *)(a1 + 64)));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "AND:", v2));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AND:", v3));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode sortDescriptorsForPubDateAscending:](MTEpisode, "sortDescriptorsForPubDateAscending:", 0));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:", kMTEpisodeEntityName, v5, v6, 0, 1));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

}

void sub_100013EE0(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "episodePropertySource"));
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "artworkView"));
    objc_msgSend(v4, "setImage:", *(_QWORD *)(a1 + 48));

  }
}

id *sub_1000140C8(id *result, uint64_t a2)
{
  if (a2)
    return (id *)objc_msgSend(result[4], "applyImage:fromSource:", a2, result[5]);
  return result;
}

void sub_100014244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100014268(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (v3)
    {
      v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfURL:", v3);
      v6 = *(_QWORD *)(a1 + 40);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageWithData:](UIImage, "imageWithData:", v5));
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

    }
    else
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100014374;
      v9[3] = &unk_100028AA8;
      v8 = *(void **)(a1 + 32);
      v10 = *(id *)(a1 + 40);
      objc_msgSend(v8, "placeholderWithSize:completionHandler:", v9, *(double *)(a1 + 56), *(double *)(a1 + 64));

    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

uint64_t sub_100014374(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id objc_msgSend_AND_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "AND:");
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGColor");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend___queryStringToQueryDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__queryStringToQueryDictionary:");
}

id objc_msgSend___stringByRemovingPercentEscapes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__stringByRemovingPercentEscapes:");
}

id objc_msgSend___stringWithPercentEscape_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__stringWithPercentEscape:");
}

id objc_msgSend___urlIfCanFindDatabaseEpisodeForUuid_urlBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__urlIfCanFindDatabaseEpisodeForUuid:urlBlock:");
}

id objc_msgSend___urlIfCanFindDatabasePodcastForUuid_urlBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__urlIfCanFindDatabasePodcastForUuid:urlBlock:");
}

id objc_msgSend__activeAccountBlocking(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_activeAccountBlocking");
}

id objc_msgSend__applePodcastsFoundationSharedUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applePodcastsFoundationSharedUserDefaults");
}

id objc_msgSend__baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baselineOffsetFromBottom");
}

id objc_msgSend__boundsRelativeHitRect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_boundsRelativeHitRect");
}

id objc_msgSend__didFetchEpisodePropertySources_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didFetchEpisodePropertySources:");
}

id objc_msgSend__didUpdateEpisodePropertySourcesAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didUpdateEpisodePropertySourcesAtIndexes:");
}

id objc_msgSend__didUpdateEpisodePropertySourcesNeedingFullReload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didUpdateEpisodePropertySourcesNeedingFullReload");
}

id objc_msgSend__episodeContextFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_episodeContextFromString:");
}

id objc_msgSend__episodeContextSortFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_episodeContextSortFromString:");
}

id objc_msgSend__episodeOrderFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_episodeOrderFromString:");
}

id objc_msgSend__episodeSourceAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_episodeSourceAtIndexPath:");
}

id objc_msgSend__fetchImageWithSize_imageKeyWithFallbackKeys_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchImageWithSize:imageKeyWithFallbackKeys:completion:");
}

id objc_msgSend__fetchRequestForDistinctSeasons(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_fetchRequestForDistinctSeasons");
}

id objc_msgSend__getNowPlayingInfoAndCallPendingCompletions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getNowPlayingInfoAndCallPendingCompletions");
}

id objc_msgSend__hasLabelWithPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasLabelWithPriority:");
}

id objc_msgSend__initDefault(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initDefault");
}

id objc_msgSend__initiatePlaybackWithDefaultBehaviorForEpisodeUUid_episodeStoreTrackId_podcastUuid_podcastStoreCollectionId_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initiatePlaybackWithDefaultBehaviorForEpisodeUUid:episodeStoreTrackId:podcastUuid:podcastStoreCollectionId:completion:");
}

id objc_msgSend__isLastEpisodeRowForIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isLastEpisodeRowForIndexPath:");
}

id objc_msgSend__latestEpisodeForPodcastUuid_restrictToUserEpisodes_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_latestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:ctx:");
}

id objc_msgSend__loadEpisodePropertySourcesFromNotificationInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadEpisodePropertySourcesFromNotificationInfo");
}

id objc_msgSend__loadQueryParameterValuesFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadQueryParameterValuesFromString:");
}

id objc_msgSend__localizedDateStringForDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localizedDateStringForDate:");
}

id objc_msgSend__localizedStringByCombiningWithString_firstComponent_secondComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localizedStringByCombiningWithString:firstComponent:secondComponent:");
}

id objc_msgSend__localizedStringForDuration_podcastTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_localizedStringForDuration:podcastTitle:");
}

id objc_msgSend__lookupEpisodeUuidIfNecessaryFromURLString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lookupEpisodeUuidIfNecessaryFromURLString:");
}

id objc_msgSend__lookupPodcastUuidIfNecessaryFromURLString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_lookupPodcastUuidIfNecessaryFromURLString:");
}

id objc_msgSend__oldestEpisodeForPodcastUuid_restrictToUserEpisodes_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_oldestEpisodeForPodcastUuid:restrictToUserEpisodes:excludeExplicit:ctx:");
}

id objc_msgSend__openEpisodeDetailInAppURLForEpisodeUuid_episodeStoreTrackId_podcastStoreCollectionId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openEpisodeDetailInAppURLForEpisodeUuid:episodeStoreTrackId:podcastStoreCollectionId:");
}

id objc_msgSend__openPodcastDetailInAppURLForPodcastUuid_podcastStoreCollectionId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_openPodcastDetailInAppURLForPodcastUuid:podcastStoreCollectionId:");
}

id objc_msgSend__playQueueTypeForRequestURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_playQueueTypeForRequestURL:");
}

id objc_msgSend__playReasonFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_playReasonFromString:");
}

id objc_msgSend__playbackRequestIdentifierWithHost_queryComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_playbackRequestIdentifierWithHost:queryComponents:");
}

id objc_msgSend__playbackRequestIdentifierWithHost_queryKey_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_playbackRequestIdentifierWithHost:queryKey:value:");
}

id objc_msgSend__preferredCollectionViewHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_preferredCollectionViewHeight");
}

id objc_msgSend__removeNotificationFromHistory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeNotificationFromHistory");
}

id objc_msgSend__representationByMigratingLegacyKeysInRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_representationByMigratingLegacyKeysInRepresentation:");
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scaledValueForValue:");
}

id objc_msgSend__setPlaybackQueueWithIdentifier_startPlayback_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_playerID_mrCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setPlaybackQueueWithIdentifier:startPlayback:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:playerID:mrCompletion:");
}

id objc_msgSend__sortDescriptorsForDefaultOrdering(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sortDescriptorsForDefaultOrdering");
}

id objc_msgSend__sortTypeForString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sortTypeForString:");
}

id objc_msgSend__sourceByApplyingDefaultOrderingToPropertySources_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sourceByApplyingDefaultOrderingToPropertySources:");
}

id objc_msgSend__stringForSortType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_stringForSortType:");
}

id objc_msgSend__universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_context_contextSortType_sampPlaybackOrder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:context:contextSortType:sampPlaybackOrder:");
}

id objc_msgSend__updateActiveAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateActiveAccount");
}

id objc_msgSend__upgradeRepresentationFrom0To1_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_upgradeRepresentationFrom0To1:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_actionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionHandler");
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionIdentifier");
}

id objc_msgSend_actionWithIdentifier_title_options_icon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionWithIdentifier:title:options:icon:");
}

id objc_msgSend_actionsWithDefaultActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionsWithDefaultActions:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeAccount");
}

id objc_msgSend_activeDsid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeDsid");
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adamID");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addLabel_maxLineCount_sharingPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLabel:maxLineCount:sharingPriority:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_adjustsFontForContentSizeCategory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustsFontForContentSizeCategory");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allPossibleEpisodeListSortOrderProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allPossibleEpisodeListSortOrderProperties");
}

id objc_msgSend_ams_DSID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_DSID");
}

id objc_msgSend_ams_activeiTunesAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_activeiTunesAccount");
}

id objc_msgSend_ams_fullName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_fullName");
}

id objc_msgSend_ams_isManagedAppleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_isManagedAppleID");
}

id objc_msgSend_ams_sharedAccountStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_sharedAccountStore");
}

id objc_msgSend_ams_storefront(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ams_storefront");
}

id objc_msgSend_appTintColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appTintColor");
}

id objc_msgSend_applyImage_fromSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyImage:fromSource:");
}

id objc_msgSend_applyShowTypeSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyShowTypeSetting:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_artTop_To_mainHeaderBL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "artTop_To_mainHeaderBL");
}

id objc_msgSend_artworkPathForShow_size_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "artworkPathForShow:size:completionHandler:");
}

id objc_msgSend_artworkView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "artworkView");
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ascender");
}

id objc_msgSend_attachmentWithIdentifier_URL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachmentWithIdentifier:URL:options:error:");
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attachments");
}

id objc_msgSend_author(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "author");
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundColor");
}

id objc_msgSend_backgroundEpisodeUuidFetches(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundEpisodeUuidFetches");
}

id objc_msgSend_beginLoadingFromDatabaseInBackground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginLoadingFromDatabaseInBackground");
}

id objc_msgSend_bestSummary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bestSummary");
}

id objc_msgSend_bestTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bestTitle");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_buttonWithTitleTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithTitleTextStyle:");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_byteSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "byteSize");
}

id objc_msgSend_canExtensionOpenDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canExtensionOpenDatabase");
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capHeight");
}

id objc_msgSend_categoryWithIdentifier_actions_intentIdentifiers_hiddenPreviewsBodyPlaceholder_categorySummaryFormat_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "categoryWithIdentifier:actions:intentIdentifiers:hiddenPreviewsBodyPlaceholder:categorySummaryFormat:options:");
}

id objc_msgSend_cellForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellForItemAtIndexPath:");
}

id objc_msgSend_cellSecondaryTextColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellSecondaryTextColor");
}

id objc_msgSend_cellSelectedBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellSelectedBackgroundColor");
}

id objc_msgSend_cellSeparatorColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellSeparatorColor");
}

id objc_msgSend_cell_artworkDimension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cell_artworkDimension");
}

id objc_msgSend_cell_artworkToContentSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cell_artworkToContentSpacing");
}

id objc_msgSend_cell_container_To_mainHeaderBL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cell_container_To_mainHeaderBL");
}

id objc_msgSend_cell_mainHeaderBL_To_collectionViewTop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cell_mainHeaderBL_To_collectionViewTop");
}

id objc_msgSend_cell_newArtworkView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cell_newArtworkView");
}

id objc_msgSend_cell_newHorizontalSeparatorView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cell_newHorizontalSeparatorView");
}

id objc_msgSend_cell_newPlayButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cell_newPlayButton");
}

id objc_msgSend_cell_newSubtitleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cell_newSubtitleLabel");
}

id objc_msgSend_cell_newTitleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cell_newTitleLabel");
}

id objc_msgSend_cell_playButtonToContentSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cell_playButtonToContentSpacing");
}

id objc_msgSend_cell_titleBL_To_subtitleBL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cell_titleBL_To_subtitleBL");
}

id objc_msgSend_cell_topAndBottomPadding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cell_topAndBottomPadding");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionView");
}

id objc_msgSend_collectionViewHeightConstraint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionViewHeightConstraint");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_computedPropertiesToFetch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computedPropertiesToFetch");
}

id objc_msgSend_computedPropertyKeyForBestSummary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computedPropertyKeyForBestSummary");
}

id objc_msgSend_computedPropertyKeyForBestTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computedPropertyKeyForBestTitle");
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constant");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_container_To_artTop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "container_To_artTop");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "content");
}

id objc_msgSend_contentAvailableViewControllerForNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentAvailableViewControllerForNotification:");
}

id objc_msgSend_contentCompressionResistancePriorityForAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentCompressionResistancePriorityForAxis:");
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentInset");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfAllEpisodes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countOfAllEpisodes");
}

id objc_msgSend_countOfEpisodePropertySources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countOfEpisodePropertySources");
}

id objc_msgSend_currentConstant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentConstant");
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentNotificationCenter");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dateBL_To_titleBL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateBL_To_titleBL");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultCombiningString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCombiningString");
}

id objc_msgSend_defaultHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultHeight");
}

id objc_msgSend_defaultMarginH(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultMarginH");
}

id objc_msgSend_defaultSortOrderSortDescriptorsForPodcastUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSortOrderSortDescriptorsForPodcastUuid:");
}

id objc_msgSend_defaultStyle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStyle");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_dequeueReusableCellWithReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");
}

id objc_msgSend_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:");
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descender");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dismissNotificationContentExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissNotificationContentExtension");
}

id objc_msgSend_dividerColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dividerColor");
}

id objc_msgSend_dividerLine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dividerLine");
}

id objc_msgSend_divider_To_summaryBL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "divider_To_summaryBL");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "duration");
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection");
}

id objc_msgSend_ensureInstalledSubviews_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ensureInstalledSubviews:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_episodeDateLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "episodeDateLabel");
}

id objc_msgSend_episodeForUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "episodeForUuid:");
}

id objc_msgSend_episodeMetadataLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "episodeMetadataLabel");
}

id objc_msgSend_episodePropertySource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "episodePropertySource");
}

id objc_msgSend_episodePropertySourceAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "episodePropertySourceAtIndex:");
}

id objc_msgSend_episodeSummaryLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "episodeSummaryLabel");
}

id objc_msgSend_episodeTitleBL_To_divider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "episodeTitleBL_To_divider");
}

id objc_msgSend_episodeTitleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "episodeTitleLabel");
}

id objc_msgSend_episodeUuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "episodeUuid");
}

id objc_msgSend_episodeUuidForSetPlaybackQueueRequestIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "episodeUuidForSetPlaybackQueueRequestIdentifier:");
}

id objc_msgSend_episodesPropertySourceController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "episodesPropertySourceController");
}

id objc_msgSend_episodesPropertySourceController_didUpdateEpisodePropertySourcesAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "episodesPropertySourceController:didUpdateEpisodePropertySourcesAtIndexes:");
}

id objc_msgSend_episodesPropertySourceControllerDidUpdatingNeedingFullReload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "episodesPropertySourceControllerDidUpdatingNeedingFullReload:");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContext");
}

id objc_msgSend_feedChangedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedChangedDate");
}

id objc_msgSend_feedURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedURL");
}

id objc_msgSend_fetchRequestWithEntityName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchRequestWithEntityName:");
}

id objc_msgSend_fetchSourceForEpisodeUuids_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchSourceForEpisodeUuids:completion:");
}

id objc_msgSend_findEpisodeWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findEpisodeWithRequest:");
}

id objc_msgSend_firstAttribute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstAttribute");
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstBaselineAnchor");
}

id objc_msgSend_firstEpisodePropertySource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstEpisodePropertySource");
}

id objc_msgSend_firstEpisodePropertySourcePassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstEpisodePropertySourcePassingTest:");
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstIndex");
}

id objc_msgSend_firstItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstItem");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flags");
}

id objc_msgSend_flowLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flowLayout");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "font");
}

id objc_msgSend_fontDescriptorWithSymbolicTraits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontDescriptorWithSymbolicTraits:");
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fontWithDescriptor:size:");
}

id objc_msgSend_footerReferenceSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "footerReferenceSize");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frame");
}

id objc_msgSend_friendlyDisplayString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "friendlyDisplayString");
}

id objc_msgSend_fromLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fromLabel");
}

id objc_msgSend_getNowPlayingInfoForMagicMomentInfoCenterWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNowPlayingInfoForMagicMomentInfoCenterWithCompletion:");
}

id objc_msgSend_groupedFooterConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupedFooterConfiguration");
}

id objc_msgSend_handlePlayActionForEpisodeAvailableCell_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlePlayActionForEpisodeAvailableCell:");
}

id objc_msgSend_handleShowMoreEpisodesForFooterView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleShowMoreEpisodesForFooterView:");
}

id objc_msgSend_hasFetchedInitialAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasFetchedInitialAccount");
}

id objc_msgSend_hasHTML(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasHTML");
}

id objc_msgSend_hasLoadedCurrentImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasLoadedCurrentImage");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_headerTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerTitle");
}

id objc_msgSend_headerTitleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "headerTitleLabel");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_hidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hidden");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_iTunesAccountDidChangeForACAccountNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iTunesAccountDidChangeForACAccountNotification:");
}

id objc_msgSend_iconWithSystemImageName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconWithSystemImageName:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifiers");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "image");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageURL");
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageWithData:");
}

id objc_msgSend_indexGreaterThanIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexGreaterThanIndex:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexOfPropertySourcePassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfPropertySourcePassingTest:");
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForItem:inSection:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfURL:");
}

id objc_msgSend_initWithDefaultConstant_textStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDefaultConstant:textStyle:");
}

id objc_msgSend_initWithDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionaryRepresentation:");
}

id objc_msgSend_initWithEntityName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEntityName:");
}

id objc_msgSend_initWithFeedUrl_storeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFeedUrl:storeIdentifier:");
}

id objc_msgSend_initWithFetchedPropertyValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFetchedPropertyValues:");
}

id objc_msgSend_initWithFrame_collectionViewLayout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:collectionViewLayout:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNotification:");
}

id objc_msgSend_initWithNotification_episode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNotification:episode:");
}

id objc_msgSend_initWithNotification_keepSorted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNotification:keepSorted:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTextStyle_symbolicTraits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTextStyle:symbolicTraits:");
}

id objc_msgSend_initWithTotalLineCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTotalLineCount:");
}

id objc_msgSend_initiatePlaybackWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initiatePlaybackWithCompletion:");
}

id objc_msgSend_installedConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installedConstraints");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateIntrinsicContentSize");
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateLayout");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHighlighted");
}

id objc_msgSend_isLocalSetPlaybackQueueURLString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocalSetPlaybackQueueURLString:");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isSerialShowTypeInFeed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSerialShowTypeInFeed");
}

id objc_msgSend_isSourceOfTruth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSourceOfTruth");
}

id objc_msgSend_isSubscribeCommandURLString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSubscribeCommandURLString:");
}

id objc_msgSend_isUniversalPlaybackIdentifierURLString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUniversalPlaybackIdentifierURLString:");
}

id objc_msgSend_isUserLoggedIn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUserLoggedIn");
}

id objc_msgSend_isValidShowTypeSetting_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidShowTypeSetting:");
}

id objc_msgSend_isVideo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVideo");
}

id objc_msgSend_itemDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemDescription");
}

id objc_msgSend_itemSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "itemSize");
}

id objc_msgSend_keepSorted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keepSorted");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "label");
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastBaselineAnchor");
}

id objc_msgSend_lastDatePlayed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastDatePlayed");
}

id objc_msgSend_lastImplicitlyFollowedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastImplicitlyFollowedDate");
}

id objc_msgSend_latestSeasonNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestSeasonNumber");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layer");
}

id objc_msgSend_layout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layout");
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "layoutMargins");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lenientSharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lenientSharedInstance");
}

id objc_msgSend_library(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "library");
}

id objc_msgSend_lineCountLayoutGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lineCountLayoutGroup");
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lineHeight");
}

id objc_msgSend_listenNowEpisode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listenNowEpisode");
}

id objc_msgSend_loadArtworkImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadArtworkImage");
}

id objc_msgSend_loadCollectionView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadCollectionView");
}

id objc_msgSend_loadConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadConstraints");
}

id objc_msgSend_loadContentViews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadContentViews");
}

id objc_msgSend_loadViewAndConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadViewAndConstraints");
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadViewIfNeeded");
}

id objc_msgSend_localizedDateString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDateString");
}

id objc_msgSend_localizedDurationAndPodcastTitleString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDurationAndPodcastTitleString");
}

id objc_msgSend_localizedDurationString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDurationString");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringWithValidatedFormat_validFormatSpecifiers_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringWithValidatedFormat:validFormatSpecifiers:error:");
}

id objc_msgSend_localizedUserNotificationStringForKey_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedUserNotificationStringForKey:arguments:");
}

id objc_msgSend_logAndThrow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logAndThrow:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_magicMomentCompletionHandlers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "magicMomentCompletionHandlers");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainHeaderBL_To_showTitleBL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainHeaderBL_To_showTitleBL");
}

id objc_msgSend_mainOrPrivateContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainOrPrivateContext");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_managedObjectContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "managedObjectContext");
}

id objc_msgSend_markPlaylistsForUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markPlaylistsForUpdate");
}

id objc_msgSend_markSubscriptionSyncDirty_for_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "markSubscriptionSyncDirty:for:");
}

id objc_msgSend_maxLineCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxLineCount");
}

id objc_msgSend_metadataBL_To_bottomBL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadataBL_To_bottomBL");
}

id objc_msgSend_minimumLineSpacing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minimumLineSpacing");
}

id objc_msgSend_modifiedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modifiedDate");
}

id objc_msgSend_mt_accessSchedulingOptionsByRequestIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_accessSchedulingOptionsByRequestIdentifier:");
}

id objc_msgSend_mt_allObjectsExcludingIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_allObjectsExcludingIndexes:");
}

id objc_msgSend_mt_allSupportedLocalNotificationCategories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_allSupportedLocalNotificationCategories");
}

id objc_msgSend_mt_areMarginsGenerousForWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_areMarginsGenerousForWidth:");
}

id objc_msgSend_mt_attachedImageForCacheKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_attachedImageForCacheKey:");
}

id objc_msgSend_mt_compactMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_compactMap:");
}

id objc_msgSend_mt_configureForDisplayingArtworkWithRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_configureForDisplayingArtworkWithRadius:");
}

id objc_msgSend_mt_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_copy");
}

id objc_msgSend_mt_copyWithDynamicTypeConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_copyWithDynamicTypeConstant:");
}

id objc_msgSend_mt_copyWithPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_copyWithPriority:");
}

id objc_msgSend_mt_dequeueReusableCellClass_forIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_dequeueReusableCellClass:forIndexPath:");
}

id objc_msgSend_mt_dequeueReusableSupplementaryViewClass_supplementaryViewKind_forIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_dequeueReusableSupplementaryViewClass:supplementaryViewKind:forIndexPath:");
}

id objc_msgSend_mt_displayURLForEpisodeStoreTrackId_inPodcastWithStoreCollectionId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_displayURLForEpisodeStoreTrackId:inPodcastWithStoreCollectionId:");
}

id objc_msgSend_mt_displayURLForPodcastStoreCollectionId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_displayURLForPodcastStoreCollectionId:");
}

id objc_msgSend_mt_dynamicTypeConstant(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_dynamicTypeConstant");
}

id objc_msgSend_mt_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_firstObjectPassingTest:");
}

id objc_msgSend_mt_fontDescriptorForTextStyle_contentSizeCategoryName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_fontDescriptorForTextStyle:contentSizeCategoryName:");
}

id objc_msgSend_mt_horizontalMarginsForWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_horizontalMarginsForWidth:");
}

id objc_msgSend_mt_localNotificationForAnnouncements(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_localNotificationForAnnouncements");
}

id objc_msgSend_mt_localNotificationForNewEpisodesAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_localNotificationForNewEpisodesAvailable");
}

id objc_msgSend_mt_notificationEpisodes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_notificationEpisodes");
}

id objc_msgSend_mt_offsetFromCapHeightToAscent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_offsetFromCapHeightToAscent");
}

id objc_msgSend_mt_playEpisodeActionWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_playEpisodeActionWithOptions:");
}

id objc_msgSend_mt_playMultipleEpisodesActionWithCount_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_playMultipleEpisodesActionWithCount:options:");
}

id objc_msgSend_mt_podcastUuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_podcastUuid");
}

id objc_msgSend_mt_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_preferredFontForTextStyle:");
}

id objc_msgSend_mt_preferredFontForTextStyle_addingSymbolicTraits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_preferredFontForTextStyle:addingSymbolicTraits:");
}

id objc_msgSend_mt_recursivelyFindFirstViewMeetingCriteria_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_recursivelyFindFirstViewMeetingCriteria:");
}

id objc_msgSend_mt_registerCellClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_registerCellClass:");
}

id objc_msgSend_mt_registerSupplementaryViewClass_forSupplementaryViewOfKind_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_registerSupplementaryViewClass:forSupplementaryViewOfKind:");
}

id objc_msgSend_mt_removeFromUserNotificationCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_removeFromUserNotificationCenter");
}

id objc_msgSend_mt_setDynamicTypeConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_setDynamicTypeConstant:");
}

id objc_msgSend_mt_setUserInfoPodcastUuid_episodes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_setUserInfoPodcastUuid:episodes:");
}

id objc_msgSend_mt_showOnePodcastMultipleEpisodesDetail(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_showOnePodcastMultipleEpisodesDetail");
}

id objc_msgSend_mt_showOnePodcastOneEpisodeDetail(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_showOnePodcastOneEpisodeDetail");
}

id objc_msgSend_mt_subdictionaryWithKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mt_subdictionaryWithKeys:");
}

id objc_msgSend_multiplier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multiplier");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_needsUpdate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsUpdate");
}

id objc_msgSend_newArtworkView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newArtworkView");
}

id objc_msgSend_newLabelWithText_textStyle_traits_numberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newLabelWithText:textStyle:traits:numberOfLines:");
}

id objc_msgSend_newLabelWithTextStyle_traits_numberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newLabelWithTextStyle:traits:numberOfLines:");
}

id objc_msgSend_newSeeMoreButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newSeeMoreButton");
}

id objc_msgSend_newestEpisodeExcludingUuid_excludeExplicit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newestEpisodeExcludingUuid:excludeExplicit:");
}

id objc_msgSend_newestEpisodeWithFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newestEpisodeWithFilter:");
}

id objc_msgSend_newestUserEpisodeExcludingExplicit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newestUserEpisodeExcludingExplicit:");
}

id objc_msgSend_nextEpisodeUuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextEpisodeUuid");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notification");
}

id objc_msgSend_notificationActions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notificationActions");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberOfRevealedEpisodes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfRevealedEpisodes");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectDictionariesInEntity_predicate_sortDescriptors_propertiesToFetch_includeObjectId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectDictionariesInEntity:predicate:sortDescriptors:propertiesToFetch:includeObjectId:");
}

id objc_msgSend_objectDictionaryForUuid_entityName_byAddingComputedProperties_toFetchedObjectDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectDictionaryForUuid:entityName:byAddingComputedProperties:toFetchedObjectDictionary:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectsInEntity_predicate_sortDescriptors_returnsObjectsAsFaults_limit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectsInEntity:predicate:sortDescriptors:returnsObjectsAsFaults:limit:");
}

id objc_msgSend_oldestEpisodeExcludingExplicit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oldestEpisodeExcludingExplicit:");
}

id objc_msgSend_oldestUserEpisodeExcludingExplicit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oldestUserEpisodeExcludingExplicit:");
}

id objc_msgSend_openEpisodeDetailInAppURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openEpisodeDetailInAppURL");
}

id objc_msgSend_openPodcastDetailInAppURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openPodcastDetailInAppURL");
}

id objc_msgSend_openURL_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:completionHandler:");
}

id objc_msgSend_orderedEpisodePropertySources(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedEpisodePropertySources");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentID");
}

id objc_msgSend_pf_queryAsDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pf_queryAsDictionary");
}

id objc_msgSend_placeholderWithSize_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placeholderWithSize:completionHandler:");
}

id objc_msgSend_playButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playButton");
}

id objc_msgSend_playEpisodeWithDefaultBehaviorForEpisodeWithDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playEpisodeWithDefaultBehaviorForEpisodeWithDataSource:");
}

id objc_msgSend_playbackNewestToOldest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackNewestToOldest");
}

id objc_msgSend_playbackQueueForIdentifier_startPlayback_assetInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackQueueForIdentifier:startPlayback:assetInfo:");
}

id objc_msgSend_playbackQueueWithDsid_forIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackQueueWithDsid:forIdentifiers:");
}

id objc_msgSend_playbackRequestURLWithPlayReason_baseRequestURLString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playbackRequestURLWithPlayReason:baseRequestURLString:");
}

id objc_msgSend_playlist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playlist");
}

id objc_msgSend_playlistIfDefault(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playlistIfDefault");
}

id objc_msgSend_playlistSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "playlistSettings");
}

id objc_msgSend_podcast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "podcast");
}

id objc_msgSend_podcastForFeedUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "podcastForFeedUrl:");
}

id objc_msgSend_podcastForUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "podcastForUuid:");
}

id objc_msgSend_podcastStoreCollectionId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "podcastStoreCollectionId");
}

id objc_msgSend_podcastTitle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "podcastTitle");
}

id objc_msgSend_podcastTitleButton(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "podcastTitleButton");
}

id objc_msgSend_podcastUuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "podcastUuid");
}

id objc_msgSend_podcastUuidForFeedUrlString_ctx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "podcastUuidForFeedUrlString:ctx:");
}

id objc_msgSend_podcastUuidForSetPlaybackQueueRequestIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "podcastUuidForSetPlaybackQueueRequestIdentifier:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_predicateForEpisodeType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForEpisodeType:");
}

id objc_msgSend_predicateForEpisodeUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForEpisodeUuid:");
}

id objc_msgSend_predicateForEpisodeUuids_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForEpisodeUuids:");
}

id objc_msgSend_predicateForEpisodesWithSeasonNumbersOnPodcastUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForEpisodesWithSeasonNumbersOnPodcastUuid:");
}

id objc_msgSend_predicateForIdentifer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForIdentifer:");
}

id objc_msgSend_predicateForPodcast_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForPodcast:");
}

id objc_msgSend_predicateForSeasonNumberWithNoEpisodeNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForSeasonNumberWithNoEpisodeNumber:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredContentSizeCategory");
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
}

id objc_msgSend_preloadedImageWithSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preloadedImageWithSize:");
}

id objc_msgSend_presentedContentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedContentViewController");
}

id objc_msgSend_prettyShortStringWithDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prettyShortStringWithDuration:");
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "priority");
}

id objc_msgSend_priorityOrderedItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "priorityOrderedItems");
}

id objc_msgSend_propertiesToFetch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertiesToFetch");
}

id objc_msgSend_propertyPathForPodcastProperty_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyPathForPodcastProperty:");
}

id objc_msgSend_pubDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pubDate");
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "query");
}

id objc_msgSend_registerClass_forCellWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerClass:forCellWithReuseIdentifier:");
}

id objc_msgSend_registerClass_forSupplementaryViewOfKind_withReuseIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:");
}

id objc_msgSend_relation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relation");
}

id objc_msgSend_reloadContentPropertyValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadContentPropertyValues");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadData");
}

id objc_msgSend_reloadItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadItemsAtIndexPaths:");
}

id objc_msgSend_reloadValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reloadValues");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeDeliveredNotificationsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDeliveredNotificationsWithIdentifiers:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removePendingNotificationRequestsWithIdentifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePendingNotificationRequestsWithIdentifiers:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requiresForegroundLaunch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requiresForegroundLaunch");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "row");
}

id objc_msgSend_saveInCurrentBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveInCurrentBlock");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scale");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_seasonNumbers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seasonNumbers");
}

id objc_msgSend_seasonSortDescriptorsForSortOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seasonSortDescriptorsForSortOrder");
}

id objc_msgSend_seasonTrailerInSeason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seasonTrailerInSeason:");
}

id objc_msgSend_secondAttribute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondAttribute");
}

id objc_msgSend_secondItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondItem");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "section");
}

id objc_msgSend_sectionHeaderIndexPathForItemIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sectionHeaderIndexPathForItemIndexPath:");
}

id objc_msgSend_sectionHeaderViewForIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sectionHeaderViewForIndexPath:");
}

id objc_msgSend_sectionInset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sectionInset");
}

id objc_msgSend_seeMore_buttonBL_To_containerBottom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seeMore_buttonBL_To_containerBottom");
}

id objc_msgSend_seeMore_containerTop_To_buttonBL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "seeMore_containerTop_To_buttonBL");
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "semanticContentAttribute");
}

id objc_msgSend_separatorHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "separatorHidden");
}

id objc_msgSend_separatorView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "separatorView");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setActionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActionHandler:");
}

id objc_msgSend_setActiveAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveAccount:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBestSummary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBestSummary:");
}

id objc_msgSend_setBestTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBestTitle:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setByteSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByteSize:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentHorizontalAlignment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentHorizontalAlignment:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setEpisodeGuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEpisodeGuid:");
}

id objc_msgSend_setEpisodePropertySource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEpisodePropertySource:");
}

id objc_msgSend_setEpisodeTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEpisodeTitle:");
}

id objc_msgSend_setEpisodeUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEpisodeUuid:");
}

id objc_msgSend_setEstimatedItemSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEstimatedItemSize:");
}

id objc_msgSend_setExcludeUnentitled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExcludeUnentitled:");
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFetchLimit:");
}

id objc_msgSend_setFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFlags:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFooterReferenceSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFooterReferenceSize:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHasFetchedInitialAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasFetchedInitialAccount:");
}

id objc_msgSend_setHasLoadedCurrentImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasLoadedCurrentImage:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHighlighted:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:forState:");
}

id objc_msgSend_setImageEdgeInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImageEdgeInsets:");
}

id objc_msgSend_setIsVideo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsVideo:");
}

id objc_msgSend_setItemSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setItemSize:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLayoutMargins:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setListenNowEpisode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListenNowEpisode:");
}

id objc_msgSend_setMaxLineCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxLineCount:");
}

id objc_msgSend_setMinimumLineSpacing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMinimumLineSpacing:");
}

id objc_msgSend_setModifiedDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModifiedDate:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsUpdate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsUpdate:");
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNeedsUpdateConstraints");
}

id objc_msgSend_setNotificationActions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotificationActions:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfRevealedEpisodes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNumberOfRevealedEpisodes:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPersistentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistentID:");
}

id objc_msgSend_setPodcastFeedUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPodcastFeedUrl:");
}

id objc_msgSend_setPodcastTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPodcastTitle:");
}

id objc_msgSend_setPodcastUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPodcastUuid:");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setPrimitiveValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrimitiveValue:forKey:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setPropertiesToFetch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPropertiesToFetch:");
}

id objc_msgSend_setPubDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPubDate:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setQueueWithPlaybackRequestIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueueWithPlaybackRequestIdentifier:completion:");
}

id objc_msgSend_setQueueWithPlaybackRequestIdentifier_startPlayback_assetInfo_requesterSharedUserId_sharedUserIdFromPlayableITunesAccount_mrCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueueWithPlaybackRequestIdentifier:startPlayback:assetInfo:requesterSharedUserId:sharedUserIdFromPlayableITunesAccount:mrCompletion:");
}

id objc_msgSend_setResultType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResultType:");
}

id objc_msgSend_setReturnsDistinctResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReturnsDistinctResults:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setScrollDirection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScrollDirection:");
}

id objc_msgSend_setSectionInset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSectionInset:");
}

id objc_msgSend_setSeparatorHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSeparatorHidden:");
}

id objc_msgSend_setSharingPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSharingPriority:");
}

id objc_msgSend_setSortAscending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSortAscending:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setSortPropertyValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSortPropertyValues:");
}

id objc_msgSend_setStoreCollectionId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStoreCollectionId:");
}

id objc_msgSend_setStoreTrackId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStoreTrackId:");
}

id objc_msgSend_setStreamUrl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStreamUrl:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleEdgeInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitleEdgeInsets:");
}

id objc_msgSend_setTouchInsets_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTouchInsets:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharingPriority(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharingPriority");
}

id objc_msgSend_shouldShowRevealMoreFooter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowRevealMoreFooter");
}

id objc_msgSend_showEpisodeDetailsForEpisodeWithDataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showEpisodeDetailsForEpisodeWithDataSource:");
}

id objc_msgSend_showTitleBL_To_dateBaseline_Min(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showTitleBL_To_dateBaseline_Min");
}

id objc_msgSend_showTypeInFeed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showTypeInFeed");
}

id objc_msgSend_showTypeSetting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showTypeSetting");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_sortAscending(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortAscending");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortDescriptorWithKey_ascending_selector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorWithKey:ascending:selector:");
}

id objc_msgSend_sortDescriptors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptors");
}

id objc_msgSend_sortDescriptorsForDateAddedAscending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorsForDateAddedAscending:");
}

id objc_msgSend_sortDescriptorsForFirstTimeAvailableAscending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorsForFirstTimeAvailableAscending:");
}

id objc_msgSend_sortDescriptorsForManualOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorsForManualOrder");
}

id objc_msgSend_sortDescriptorsForNewestOnTop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorsForNewestOnTop");
}

id objc_msgSend_sortDescriptorsForPlayOrderByEpisodeNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorsForPlayOrderByEpisodeNumber");
}

id objc_msgSend_sortDescriptorsForPlayOrderByPubDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorsForPlayOrderByPubDate");
}

id objc_msgSend_sortDescriptorsForPubDateAscending_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorsForPubDateAscending:");
}

id objc_msgSend_sortDescriptorsForRecentlyUnfollowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorsForRecentlyUnfollowed");
}

id objc_msgSend_sortDescriptorsForSortOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorsForSortOrder");
}

id objc_msgSend_sortDescriptorsForTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortDescriptorsForTitle:");
}

id objc_msgSend_sortOrder(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortOrder");
}

id objc_msgSend_sortOrderAscForShowType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortOrderAscForShowType:");
}

id objc_msgSend_sortProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortProperties");
}

id objc_msgSend_sortPropertyValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortPropertyValues");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_spacingBetweenTextAndArtwork(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spacingBetweenTextAndArtwork");
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAccessingSecurityScopedResource");
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAccessingSecurityScopedResource");
}

id objc_msgSend_storeCollectionId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeCollectionId");
}

id objc_msgSend_storeTrackId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeTrackId");
}

id objc_msgSend_streamURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamURL");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByRemovingPercentEscapes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByRemovingPercentEscapes");
}

id objc_msgSend_stringBySmartlyStrippingHTML(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringBySmartlyStrippingHTML");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "style");
}

id objc_msgSend_subscribed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscribed");
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subtitleLabel");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subviews");
}

id objc_msgSend_summary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "summary");
}

id objc_msgSend_summaryBL_To_metadataBL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "summaryBL_To_metadataBL");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superview");
}

id objc_msgSend_supplementaryViewForElementKind_atIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supplementaryViewForElementKind:atIndexPath:");
}

id objc_msgSend_swizzleMethod_onClass_withReplacementBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "swizzleMethod:onClass:withReplacementBlock:");
}

id objc_msgSend_syncType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncType");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemGrayColor");
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemLayoutSizeFittingSize:");
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textProperties");
}

id objc_msgSend_textRectForBounds_limitedToNumberOfLines_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textRectForBounds:limitedToNumberOfLines:");
}

id objc_msgSend_timestampBoundByNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestampBoundByNow:");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_totalLineCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalLineCount");
}

id objc_msgSend_touchInsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "touchInsets");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_universalPlaybackQueueIdentifierForPodcastFeedUrl_podcastStoreId_episodeGuid_episodeStoreId_sampPlaybackOrder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "universalPlaybackQueueIdentifierForPodcastFeedUrl:podcastStoreId:episodeGuid:episodeStoreId:sampPlaybackOrder:");
}

id objc_msgSend_universalPlaybackQueueIdentifierForPodcastUuid_podcastFeedUrl_podcastStoreId_episodeUuid_episodeGuid_episodeStoreId_sampPlaybackOrder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "universalPlaybackQueueIdentifierForPodcastUuid:podcastFeedUrl:podcastStoreId:episodeUuid:episodeGuid:episodeStoreId:sampPlaybackOrder:");
}

id objc_msgSend_universalStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "universalStore");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_upNextForPodcastUuid_excludeExplicit_ctx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upNextForPodcastUuid:excludeExplicit:ctx:");
}

id objc_msgSend_updateAvg(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateAvg");
}

id objc_msgSend_updateDebugUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDebugUI");
}

id objc_msgSend_updateDynamicConstantInConstraints_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDynamicConstantInConstraints:");
}

id objc_msgSend_updateDynamicConstraints(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDynamicConstraints");
}

id objc_msgSend_updateForCurrentContentSizeCategory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateForCurrentContentSizeCategory");
}

id objc_msgSend_updateStdDev(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStdDev");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceLayoutDirectionForSemanticContentAttribute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceLayoutDirectionForSemanticContentAttribute:");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "username");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendorID");
}

id objc_msgSend_versionOfDictionaryRepresentation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "versionOfDictionaryRepresentation:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllerMultipleNotificationEpisodes_notification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerMultipleNotificationEpisodes:notification:");
}

id objc_msgSend_viewControllerSingleNotificationEpisode_notification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerSingleNotificationEpisode:notification:");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "webpageURL");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}
