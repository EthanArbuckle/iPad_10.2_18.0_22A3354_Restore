uint64_t start(int a1, char **a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  NSString *v11;
  NSString *v12;
  objc_class *v13;
  NSString *v14;
  NSString *v15;
  uint64_t v16;
  uint8_t v18[16];
  uint8_t buf[16];

  v4 = VUISignpostLogObject();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.Main", "", buf, 2u);
  }

  v6 = VUISignpostLogObject();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)v18 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "Launch.FirstTab", "", v18, 2u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[VUITVAppLauncher sharedInstance](VUITVAppLauncher, "sharedInstance"));
  objc_msgSend(v8, "preWarm:", 0);

  v9 = objc_autoreleasePoolPush();
  v10 = (objc_class *)objc_opt_class(AppleTVAppDelegate);
  v11 = NSStringFromClass(v10);
  v12 = (NSString *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (objc_class *)objc_opt_class(ATAUIApplication);
  v14 = NSStringFromClass(v13);
  v15 = (NSString *)objc_claimAutoreleasedReturnValue(v14);
  objc_autoreleasePoolPop(v9);
  v16 = UIApplicationMain(a1, a2, v15, v12);

  return v16;
}

void sub_100004C20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004C70(id a1)
{
  id v1;
  void *v2;

  v1 = -[ATAPPTController _init]([ATAPPTController alloc], "_init");
  v2 = (void *)qword_10001A510;
  qword_10001A510 = (uint64_t)v1;

}

id sub_100005030(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:animated:", 0, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_100005120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100005138(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "hasPrefix:", a2);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

BOOL sub_100005390(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  return +[ATAPPTUtilities selectTabWithTitle:inTabBarController:](ATAPPTUtilities, "selectTabWithTitle:inTabBarController:", VUITabBarItemIdentifierKeyWatchNow, a3);
}

BOOL sub_1000053AC(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  return +[ATAPPTUtilities selectTabWithTitle:inTabBarController:](ATAPPTUtilities, "selectTabWithTitle:inTabBarController:", VUITabBarItemIdentifierKeyLibrary, a3);
}

BOOL sub_1000053C8(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  return +[ATAPPTUtilities selectTabWithTitle:inTabBarController:](ATAPPTUtilities, "selectTabWithTitle:inTabBarController:", VUITabBarItemIdentifierKeySearch, a3);
}

BOOL sub_1000053E4(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5;
  NSString *v6;
  UITabBarController *v7;
  BOOL v8;

  v5 = VUITabBarItemIdentifierKeyPPTStack;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:](ATAPPTUtilities, "selectTabWithTitle:inTabBarController:", v5, v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:](ATAPPTUtilities, "waitForTabWithTitleToLoad:inTabBarController:totalChildren:", v5, v7, 1);
  v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:](ATAPPTUtilities, "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:", v6, 0, 2, v7, 0);

  return v8;
}

BOOL sub_100005484(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5;
  NSString *v6;
  UITabBarController *v7;
  BOOL v8;

  v5 = VUITabBarItemIdentifierKeyPPTStack;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:](ATAPPTUtilities, "selectTabWithTitle:inTabBarController:", v5, v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:](ATAPPTUtilities, "waitForTabWithTitleToLoad:inTabBarController:totalChildren:", v5, v7, 1);
  v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:](ATAPPTUtilities, "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:", v6, 0, 1, v7, &stru_100014870);

  return v8;
}

UIScrollView *__cdecl sub_100005528(id a1, UIViewController *a2)
{
  return (UIScrollView *)+[ATAPPTUtilities findScrollViewByIndexInStackCollectionView:index:](ATAPPTUtilities, "findScrollViewByIndexInStackCollectionView:index:", a2, 1);
}

BOOL sub_10000553C(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5;
  NSString *v6;
  UITabBarController *v7;
  BOOL v8;

  v5 = VUITabBarItemIdentifierKeyLibrary;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:](ATAPPTUtilities, "selectTabWithTitle:inTabBarController:", v5, v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:](ATAPPTUtilities, "waitForTabWithTitleToLoad:inTabBarController:totalChildren:", v5, v7, 1);
  v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:](ATAPPTUtilities, "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:", v6, 0, 2, v7, &stru_1000148B0);

  return v8;
}

UIScrollView *__cdecl sub_1000055E0(id a1, UIViewController *a2)
{
  UIViewController *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = a2;
  +[ATAPPTUtilities resetNumScrollViewFound](ATAPPTUtilities, "resetNumScrollViewFound");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController view](v2, "view"));

  v4 = +[ATAPPTUtilities findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:](ATAPPTUtilities, "findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:", v3, objc_opt_class(UICollectionView), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (UIScrollView *)v5;
}

BOOL sub_100005660(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5;
  NSString *v6;
  UITabBarController *v7;
  BOOL v8;

  v5 = VUITabBarItemIdentifierKeyLibrary;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:](ATAPPTUtilities, "selectTabWithTitle:inTabBarController:", v5, v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:](ATAPPTUtilities, "waitForTabWithTitleToLoad:inTabBarController:totalChildren:", v5, v7, 1);
  v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:](ATAPPTUtilities, "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:", v6, 0, 2, v7, &stru_1000148F0);

  return v8;
}

UIScrollView *__cdecl sub_100005704(id a1, UIViewController *a2)
{
  UIViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v2 = a2;
  +[ATAPPTUtilities resetNumScrollViewFound](ATAPPTUtilities, "resetNumScrollViewFound");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](v2, "childViewControllers"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v8 = +[ATAPPTUtilities findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:](ATAPPTUtilities, "findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:", v7, objc_opt_class(UICollectionView), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return (UIScrollView *)v9;
}

BOOL sub_1000057D0(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5;
  NSString *v6;
  UITabBarController *v7;
  BOOL v8;

  v5 = VUITabBarItemIdentifierKeyLibrary;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:](ATAPPTUtilities, "selectTabWithTitle:inTabBarController:", v5, v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:](ATAPPTUtilities, "waitForTabWithTitleToLoad:inTabBarController:totalChildren:", v5, v7, 1);
  v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:](ATAPPTUtilities, "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:", v6, 0, 2, v7, &stru_100014930);

  return v8;
}

UIScrollView *__cdecl sub_100005874(id a1, UIViewController *a2)
{
  UIViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v2 = a2;
  +[ATAPPTUtilities resetNumScrollViewFound](ATAPPTUtilities, "resetNumScrollViewFound");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](v2, "childViewControllers"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
  v8 = +[ATAPPTUtilities findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:](ATAPPTUtilities, "findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:", v7, objc_opt_class(UICollectionView), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return (UIScrollView *)v9;
}

BOOL sub_100005940(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5;
  NSString *v6;
  UITabBarController *v7;
  BOOL v8;

  v5 = VUITabBarItemIdentifierKeyPPTStack;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:](ATAPPTUtilities, "selectTabWithTitle:inTabBarController:", v5, v7);
  +[ATAPPTUtilities resetNumScrollViewFound](ATAPPTUtilities, "resetNumScrollViewFound");
  v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:](ATAPPTUtilities, "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:", v6, 0, 1, v7, &stru_100014970);

  return v8;
}

UIScrollView *__cdecl sub_1000059D8(id a1, UIViewController *a2)
{
  return (UIScrollView *)+[ATAPPTUtilities findScrollViewByIndexInStackCollectionView:index:](ATAPPTUtilities, "findScrollViewByIndexInStackCollectionView:index:", a2, 2);
}

BOOL sub_1000059EC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _BOOL8 v11;

  v6 = a3;
  v7 = a4;
  v8 = VUITabBarItemIdentifierKeyPPTStack;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:](ATAPPTUtilities, "selectTabWithTitle:inTabBarController:", VUITabBarItemIdentifierKeyPPTStack, v6);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:](ATAPPTUtilities, "waitForTabWithTitleToLoad:inTabBarController:totalChildren:", v8, v6, 1);
  objc_msgSend(*(id *)(a1 + 32), "_scrollHalfTheScreenHeightIn:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_scrollHalfTheScreenHeightIn:", v6);
    objc_msgSend(*(id *)(a1 + 32), "_scrollHalfTheScreenHeightIn:", v6);
  }
  v11 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:](ATAPPTUtilities, "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:", v7, 0, 1, v6, &stru_100014990);

  return v11;
}

UIScrollView *__cdecl sub_100005AD8(id a1, UIViewController *a2)
{
  return (UIScrollView *)+[ATAPPTUtilities findScrollViewByIndexInStackCollectionView:index:](ATAPPTUtilities, "findScrollViewByIndexInStackCollectionView:index:", a2, 3);
}

BOOL sub_100005AEC(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _BOOL8 v11;

  v6 = a3;
  v7 = a4;
  v8 = VUITabBarItemIdentifierKeyPPTStack;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:](ATAPPTUtilities, "selectTabWithTitle:inTabBarController:", VUITabBarItemIdentifierKeyPPTStack, v6);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:](ATAPPTUtilities, "waitForTabWithTitleToLoad:inTabBarController:totalChildren:", v8, v6, 1);
  objc_msgSend(*(id *)(a1 + 32), "_scrollHalfTheScreenHeightIn:", v6);
  objc_msgSend(*(id *)(a1 + 32), "_scrollHalfTheScreenHeightIn:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if (!v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_scrollHalfTheScreenHeightIn:", v6);
    objc_msgSend(*(id *)(a1 + 32), "_scrollHalfTheScreenHeightIn:", v6);
  }
  v11 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:](ATAPPTUtilities, "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:", v7, 0, 1, v6, &stru_1000149D8);

  return v11;
}

UIScrollView *__cdecl sub_100005BE4(id a1, UIViewController *a2)
{
  return (UIScrollView *)+[ATAPPTUtilities findScrollViewByIndexInStackCollectionView:index:](ATAPPTUtilities, "findScrollViewByIndexInStackCollectionView:index:", a2, 5);
}

BOOL sub_100005BF8(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5;
  NSString *v6;
  UITabBarController *v7;
  BOOL v8;

  v5 = VUITabBarItemIdentifierKeyPPTSports;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:](ATAPPTUtilities, "selectTabWithTitle:inTabBarController:", v5, v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:](ATAPPTUtilities, "waitForTabWithTitleToLoad:inTabBarController:totalChildren:", v5, v7, 1);
  v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:](ATAPPTUtilities, "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:", v6, 0, 2, v7, 0);

  return v8;
}

BOOL sub_100005C98(id a1, UIApplication *a2, UITabBarController *a3, NSString *a4)
{
  uint64_t v5;
  NSString *v6;
  UITabBarController *v7;
  BOOL v8;

  v5 = VUITabBarItemIdentifierKeyPPTShowProduct;
  v6 = a4;
  v7 = a3;
  +[ATAPPTUtilities selectTabWithTitle:inTabBarController:](ATAPPTUtilities, "selectTabWithTitle:inTabBarController:", v5, v7);
  +[ATAPPTUtilities waitForTabWithTitleToLoad:inTabBarController:totalChildren:](ATAPPTUtilities, "waitForTabWithTitleToLoad:inTabBarController:totalChildren:", v5, v7, 1);
  v8 = +[ATAPPTUtilities performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:](ATAPPTUtilities, "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:", v6, 0, 2, v7, 0);

  return v8;
}

void sub_100005ECC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100005EE0(id *a1)
{
  os_unfair_lock_s *v2;
  int os_unfair_lock_opaque_low;
  _QWORD v4[5];
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  if ((objc_msgSend(a1[4], "hasPrefix:", CFSTR("Scroll")) & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006074;
    block[3] = &unk_100014A40;
    v10 = a1[5];
    v11 = a1[4];
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

  }
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100006080;
  v5[3] = &unk_100014AB8;
  objc_copyWeak(&v8, a1 + 7);
  v6 = a1[4];
  v7 = a1[5];
  objc_msgSend(a1[6], "setApplicationLoadCompletion:", v5);
  os_unfair_lock_lock((os_unfair_lock_t)a1[6] + 3);
  v2 = (os_unfair_lock_s *)a1[6];
  os_unfair_lock_opaque_low = LOBYTE(v2[2]._os_unfair_lock_opaque);
  os_unfair_lock_unlock(v2 + 3);
  if (!os_unfair_lock_opaque_low)
    usleep(0x7A120u);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100006430;
  v4[3] = &unk_100014AE0;
  v4[4] = a1[6];
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v4);

  objc_destroyWeak(&v8);
}

void sub_10000605C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_100006074(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "startedTest:", *(_QWORD *)(a1 + 40));
}

void sub_100006080(id *a1)
{
  id *v2;
  id WeakRetained;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006154;
  block[3] = &unk_100014AB8;
  objc_copyWeak(&v8, v2);
  v6 = a1[4];
  v7 = a1[5];
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
}

void sub_100006154(id *a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  id (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ATAPPTUtilities prepareForPPT](ATAPPTUtilities, "prepareForPPT"));
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = sub_100006348;
  v20 = sub_100006370;
  v21 = 0;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "testsManifest"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allKeys"));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100006378;
  v12[3] = &unk_100014A68;
  v13 = a1[4];
  v14 = &v16;
  objc_copyWeak(&v15, a1 + 6);
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);
  v6 = v17[5];
  if (v6)
    v7 = (*(uint64_t (**)(uint64_t, id, void *, id))(v6 + 16))(v6, a1[5], v2, a1[4]);
  else
    v7 = 0;
  if ((objc_msgSend(a1[4], "hasPrefix:", CFSTR("Scroll")) & 1) == 0)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000640C;
    v8[3] = &unk_100014A90;
    v11 = v7;
    v9 = a1[5];
    v10 = a1[4];
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v8);

  }
  objc_destroyWeak(&v15);

  _Block_object_dispose(&v16, 8);
}

void sub_10000631C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  id *v23;

  objc_destroyWeak(v23);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

id sub_100006348(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_retainBlock(*(id *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_100006370(uint64_t a1)
{

}

void sub_100006378(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "hasPrefix:"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "testsManifest"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v11));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    *a4 = 1;
  }

}

id sub_10000640C(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (v2)
    return _objc_msgSend(v3, "finishedTest:waitForCommit:extraResults:", v4);
  else
    return _objc_msgSend(v3, "failedTest:", v4);
}

void sub_100006430(uint64_t a1)
{
  void (**v2)(void);

  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationLoadCompletion"));
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setApplicationLoadCompletion:", 0);
    v2[2]();
  }

}

void sub_1000066A0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.tv", "ATAPPTUtilities");
  v2 = (void *)qword_10001A520;
  qword_10001A520 = (uint64_t)v1;

}

void sub_100006710(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)NSOperationQueue);
  v2 = (void *)qword_10001A530;
  qword_10001A530 = (uint64_t)v1;

  objc_msgSend((id)qword_10001A530, "setMaxConcurrentOperationCount:", 1);
  _objc_msgSend((id)qword_10001A530, "setQualityOfService:", 17);
}

void sub_100006B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100006B64(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100006B74(uint64_t a1)
{

}

void sub_100006B7C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_topViewControllerInTabBarController:", *(_QWORD *)(a1 + 32)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v5 = objc_msgSend((id)objc_opt_class(*(_QWORD *)(a1 + 48)), "topMostController");
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
}

void sub_100006BF8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v4 = objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "_findScrollViewInViewController:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)));
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void sub_100006C5C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v1 = *(_QWORD *)(a1 + 56);
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = *(unsigned int *)(a1 + 64);
  v4 = *(unsigned int *)(a1 + 68);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006D14;
  v6[3] = &unk_100014C00;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:", v5, 10, v3, v4, v1, &stru_100014BD8, v6);

}

NSDictionary *__cdecl sub_100006D08(id a1)
{
  return (NSDictionary *)&__NSDictionary0__struct;
}

intptr_t sub_100006D14(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id sub_100006D1C()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)qword_10001A548;
  v7 = qword_10001A548;
  if (!qword_10001A548)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100009024;
    v3[3] = &unk_100014C50;
    v3[4] = &v4;
    sub_100009024((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100006DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006DD4(_QWORD *a1)
{
  void *v2;
  objc_class *v3;
  id v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  if (a1[6] == 1
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "_contentScrollsAlongXAxis") & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "_setContentScrollsAlongXAxis:", 1);
  }
  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)qword_10001A558;
  v9 = qword_10001A558;
  if (!qword_10001A558)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100009124;
    v5[3] = &unk_100014C50;
    v5[4] = &v6;
    sub_100009124((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  v4 = objc_msgSend([v3 alloc], "initWithTestName:scrollView:completionHandler:", a1[4], *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), 0);
  objc_msgSend(sub_100006D1C(), "runTestWithParameters:", v4);

}

void sub_100006ED8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006FC4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow keyWindow](UIWindow, "keyWindow"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "navigationController"));
  v6 = objc_msgSend(v7, "popToRootViewControllerAnimated:", 0);

}

void sub_100007460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_100007484(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  _BYTE v31[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tabBarItems"));
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v24;
    v7 = VUITabBarItemKeyIdentifier;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "vui_stringForKey:", v7, (_QWORD)v23));
        if (objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 40)))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

          goto LABEL_11;
        }
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  v10 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v11 = objc_claimAutoreleasedReturnValue(+[ATAPPTUtilities testLog](ATAPPTUtilities, "testLog"));
  v12 = v11;
  if (v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      *(_DWORD *)buf = 138412546;
      v28 = v13;
      v29 = 2048;
      v30 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Found '%@' at index %lu", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setSelectedIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "viewControllers"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    objc_msgSend(v16, "tabBarController:didSelectViewController:", *(_QWORD *)(a1 + 32), v12);

  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    sub_10000DEA8(a1, v12, v17, v18, v19, v20, v21, v22);
  }

}

intptr_t sub_1000077D4(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

int64_t sub_100007BCC(id a1, id a2, id a3)
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;

  v4 = a2;
  v5 = a3;
  v6 = objc_opt_class(UIScrollView);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0
    && (v7 = objc_opt_class(UIScrollView), (objc_opt_isKindOfClass(v5, v7) & 1) != 0))
  {
    v8 = v5;
    objc_msgSend(v4, "frame");
    v10 = v9;
    objc_msgSend(v8, "frame");
    v12 = v11;

    if (v10 > v12)
      v13 = 1;
    else
      v13 = -1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void sub_100007FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100008014(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "vui_ppt_isLoading");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_100008418(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = objc_opt_class(UILabel);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
  v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v7;
}

id sub_100008980(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 64);
}

uint64_t sub_100008B40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a2;
  if ((objc_opt_isKindOfClass(v3, *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textLabels", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v14;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v8), "text"));
          v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

          if ((v10 & 1) != 0)
          {
            v11 = 1;
            goto LABEL_13;
          }
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
    v11 = 0;
LABEL_13:

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id sub_100008D44(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  if ((objc_opt_respondsToSelector(v3, "textContentView") & 1) != 0)
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "performSelector:", "textContentView"));
  else
    v4 = 0;
  if ((objc_opt_respondsToSelector(v4, "text") & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "performSelector:", "text"));
  else
    v5 = 0;
  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));
  else
    v7 = 0;

  return v7;
}

id sub_100008ED4(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "currentTitle"));
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

Class sub_100009024(uint64_t a1)
{
  Class result;

  sub_100009078();
  result = objc_getClass("RPTTestRunner");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_10000DF10();
  qword_10001A548 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100009078()
{
  char *v0;
  char *v1;
  __int128 v2;
  uint64_t v3;

  v1 = 0;
  if (!qword_10001A550)
  {
    v2 = off_100014D78;
    v3 = 0;
    qword_10001A550 = _sl_dlopen(&v2, &v1);
  }
  v0 = v1;
  if (!qword_10001A550)
  {
    v0 = (char *)abort_report_np("%s", v1);
    goto LABEL_7;
  }
  if (v1)
LABEL_7:
    free(v0);
}

Class sub_100009124(uint64_t a1)
{
  Class result;

  sub_100009078();
  result = objc_getClass("RPTScrollViewTestParameters");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_10000DF34();
  qword_10001A558 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100009184()
{
  return sub_1000091D0(25705, 0xE200000000000000);
}

uint64_t sub_100009190()
{
  return sub_1000091D0(0x6E20797469746E45, 0xEB00000000656D61);
}

uint64_t sub_1000091B0()
{
  return sub_1000091D0(0x7420797469746E45, 0xEB00000000657079);
}

uint64_t sub_1000091D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v19 = a1;
  v20 = a2;
  v2 = type metadata accessor for InputConnectionBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3D0);
  __chkstk_darwin();
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3D8);
  __chkstk_darwin();
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3E0);
  __chkstk_darwin();
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for LocalizedStringResource(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin();
  v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3E8);
  LocalizedStringResource.init(stringLiteral:)(v19, v20);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v16 = type metadata accessor for String.IntentInputOptions(0);
  v21[0] = 0;
  v21[1] = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v9, 1, 1, v16);
  v17 = type metadata accessor for IntentDialog(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v7, 1, 1, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for InputConnectionBehavior.default(_:), v2);
  return IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)(v15, v11, v21, v9, v7, v5);
}

uint64_t sub_1000093E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  char *v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t, uint64_t);
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
  void (*v50)(char *);
  unsigned int v51;
  void (*v52)(char *, uint64_t, uint64_t, uint64_t);
  char *v53;
  void (*v54)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v47 = a1;
  v48 = a8;
  v45 = a6;
  v46 = a7;
  v43 = a4;
  v44 = a5;
  v40 = a2;
  v41 = a3;
  v55 = type metadata accessor for InputConnectionBehavior(0);
  v8 = *(_QWORD *)(v55 - 8);
  __chkstk_darwin();
  v53 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3D0);
  __chkstk_darwin();
  v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3D8);
  __chkstk_darwin();
  v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3E0);
  __chkstk_darwin();
  v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for LocalizedStringResource(0);
  v17 = *(_QWORD *)(v16 - 8);
  v39 = v16;
  v18 = v17;
  v42 = v17;
  __chkstk_darwin();
  v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3E8);
  LocalizedStringResource.init(stringLiteral:)(25705, 0xE200000000000000);
  v54 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v54(v15, 1, 1, v16);
  v49 = type metadata accessor for String.IntentInputOptions(0);
  v56 = 0;
  v57 = 0;
  v52 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 56);
  v52(v13, 1, 1, v49);
  v21 = type metadata accessor for IntentDialog(0);
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v37 = v21;
  v38 = v22;
  v23 = v11;
  v22(v11, 1, 1, v21);
  v51 = enum case for InputConnectionBehavior.default(_:);
  v50 = *(void (**)(char *))(v8 + 104);
  v24 = v53;
  v25 = v55;
  v50(v53);
  v26 = v15;
  v27 = v23;
  v28 = IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)(v20, v15, &v56, v13, v23, v24);
  swift_retain(v28);
  LocalizedStringResource.init(stringLiteral:)(0x6E20797469746E45, 0xEB00000000656D61);
  v29 = v39;
  v54(v15, 1, 1, v39);
  v56 = 0;
  v57 = 0;
  v52(v13, 1, 1, v49);
  v30 = v38;
  v38(v27, 1, 1, v21);
  v31 = v53;
  ((void (*)(char *, _QWORD, uint64_t))v50)(v53, v51, v25);
  v32 = v31;
  v33 = IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)(v20, v26, &v56, v13, v27, v31);
  swift_retain(v33);
  LocalizedStringResource.init(stringLiteral:)(0x7420797469746E45, 0xEB00000000657079);
  v54(v26, 1, 1, v29);
  v56 = 0;
  v57 = 0;
  v52(v13, 1, 1, v49);
  v30(v27, 1, 1, v37);
  ((void (*)(char *, _QWORD, uint64_t))v50)(v32, v51, v55);
  v34 = IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)(v20, v26, &v56, v13, v27, v32);
  v56 = v40;
  v57 = v41;
  swift_retain(v28);
  swift_retain(v33);
  swift_retain(v34);
  IntentParameter.wrappedValue.setter(&v56);
  swift_release(v33);
  swift_release(v28);
  v56 = v43;
  v57 = v44;
  swift_retain(v28);
  swift_retain(v33);
  swift_retain(v34);
  IntentParameter.wrappedValue.setter(&v56);
  swift_release(v34);
  swift_release(v33);
  swift_release(v28);
  v56 = v45;
  v57 = v46;
  swift_retain(v28);
  swift_retain(v33);
  swift_retain(v34);
  IntentParameter.wrappedValue.setter(&v56);
  swift_release(v34);
  swift_release(v33);
  swift_release(v28);
  v35 = type metadata accessor for IntentMediaItem(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 8))(v48, v35);
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v47, v29);
  swift_release(v34);
  swift_release(v33);
  swift_release(v28);
  return v28;
}

uint64_t sub_1000098D0(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a1;
  v3[1] = a2;
  return IntentParameter.wrappedValue.setter(v3);
}

uint64_t sub_100009900(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a1;
  v3[1] = a2;
  return IntentParameter.wrappedValue.setter(v3);
}

uint64_t sub_100009930(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a1;
  v3[1] = a2;
  return IntentParameter.wrappedValue.setter(v3);
}

uint64_t sub_100009960()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000BC68(v0, qword_10001AA28);
  sub_10000B768(v0, (uint64_t)qword_10001AA28);
  return LocalizedStringResource.init(stringLiteral:)(0xD00000000000001CLL, 0x8000000100013090);
}

uint64_t sub_1000099C0()
{
  return sub_100009B28(&qword_10001A560, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001AA28);
}

uint64_t sub_1000099E4@<X0>(uint64_t a1@<X8>)
{
  return sub_100009B90(&qword_10001A560, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001AA28, a1);
}

uint64_t sub_100009A08(uint64_t a1)
{
  return sub_100009C40(a1, &qword_10001A560, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001AA28, (uint64_t)sub_100009960);
}

uint64_t (*sub_100009A2C(uint64_t a1))(_QWORD)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10001A560 != -1)
    swift_once(&qword_10001A560, sub_100009960);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_10000B768(v2, (uint64_t)qword_10001AA28);
  swift_beginAccess(v3, a1, 33, 0);
  return j_j__swift_endAccess;
}

uint64_t sub_100009AA4()
{
  uint64_t v0;

  v0 = type metadata accessor for IntentDescription(0);
  sub_10000BC68(v0, qword_10001AA40);
  sub_10000B768(v0, (uint64_t)qword_10001AA40);
  return IntentDescription.init(stringLiteral:)(0xD00000000000003DLL, 0x8000000100013050);
}

uint64_t sub_100009B04()
{
  return sub_100009B28(&qword_10001A568, (uint64_t (*)(_QWORD))&type metadata accessor for IntentDescription, (uint64_t)qword_10001AA40);
}

uint64_t sub_100009B28(_QWORD *a1, uint64_t (*a2)(_QWORD), uint64_t a3)
{
  uint64_t v5;

  if (*a1 != -1)
    swift_once();
  v5 = a2(0);
  return sub_10000B768(v5, a3);
}

uint64_t sub_100009B6C@<X0>(uint64_t a1@<X8>)
{
  return sub_100009B90(&qword_10001A568, (uint64_t (*)(_QWORD))&type metadata accessor for IntentDescription, (uint64_t)qword_10001AA40, a1);
}

uint64_t sub_100009B90@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[24];

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = sub_10000B768(v7, a3);
  swift_beginAccess(v8, v10, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t sub_100009C1C(uint64_t a1)
{
  return sub_100009C40(a1, &qword_10001A568, (uint64_t (*)(_QWORD))&type metadata accessor for IntentDescription, (uint64_t)qword_10001AA40, (uint64_t)sub_100009AA4);
}

uint64_t sub_100009C40(uint64_t a1, _QWORD *a2, uint64_t (*a3)(_QWORD), uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v12[24];

  if (*a2 != -1)
    swift_once(a2, a5);
  v8 = a3(0);
  v9 = sub_10000B768(v8, a4);
  swift_beginAccess(v9, v12, 33, 0);
  v10 = *(_QWORD *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 24))(v9, a1, v8);
  swift_endAccess(v12);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(a1, v8);
}

uint64_t (*sub_100009CE8(uint64_t a1))(_QWORD)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10001A568 != -1)
    swift_once(&qword_10001A568, sub_100009AA4);
  v2 = type metadata accessor for IntentDescription(0);
  v3 = sub_10000B768(v2, (uint64_t)qword_10001AA40);
  swift_beginAccess(v3, a1, 33, 0);
  return j__swift_endAccess;
}

void sub_100009D64()
{
  strcpy((char *)&qword_10001AA58, "PurchaseIntent");
  HIBYTE(qword_10001AA60) = -18;
}

uint64_t *sub_100009D94()
{
  if (qword_10001A570 != -1)
    swift_once(&qword_10001A570, sub_100009D64);
  return &qword_10001AA58;
}

uint64_t sub_100009DD4()
{
  uint64_t v0;
  _BYTE v2[24];

  if (qword_10001A570 != -1)
    swift_once(&qword_10001A570, sub_100009D64);
  swift_beginAccess(&qword_10001AA58, v2, 0, 0);
  v0 = qword_10001AA58;
  swift_bridgeObjectRetain(qword_10001AA60);
  return v0;
}

uint64_t sub_100009E4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BYTE v6[24];

  if (qword_10001A570 != -1)
    swift_once(&qword_10001A570, sub_100009D64);
  swift_beginAccess(&qword_10001AA58, v6, 1, 0);
  v4 = qword_10001AA60;
  qword_10001AA58 = a1;
  qword_10001AA60 = a2;
  return swift_bridgeObjectRelease(v4);
}

uint64_t (*sub_100009ECC(uint64_t a1))(_QWORD)
{
  if (qword_10001A570 != -1)
    swift_once(&qword_10001A570, sub_100009D64);
  swift_beginAccess(&qword_10001AA58, a1, 33, 0);
  return j_j__swift_endAccess;
}

uint64_t sub_100009F38()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t (*sub_100009F68(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100009FB0;
}

uint64_t sub_100009FB4()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_100009FD4()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t (*sub_10000A004(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100009FB0;
}

uint64_t sub_10000A04C()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_10000A06C()
{
  uint64_t v1;

  IntentParameter.wrappedValue.getter(&v1);
  return v1;
}

uint64_t (*sub_10000A09C(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = IntentParameter.wrappedValue.modify();
  return sub_100009FB0;
}

void sub_10000A0E4(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 32))(*a1, 0);
  free(v1);
}

uint64_t sub_10000A114()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_10000A134(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4[29] = a2;
  v4[30] = a4;
  v4[28] = a1;
  v5 = type metadata accessor for Logger(0);
  v4[31] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[32] = v6;
  v7 = (*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[33] = swift_task_alloc(v7);
  v4[34] = swift_task_alloc(v7);
  v4[35] = swift_task_alloc(v7);
  v8 = (*(_QWORD *)(*(_QWORD *)(sub_10000B728(&qword_10001A3F8) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[36] = swift_task_alloc(v8);
  v4[37] = swift_task_alloc(v8);
  return swift_task_switch(sub_10000A1E8, 0, 0);
}

id sub_10000A1E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  Swift::String v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  Swift::String v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id result;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  NSURL *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;

  if ((TVAppFeature.isEnabled.getter(19) & 1) != 0)
  {
    _StringGuts.grow(_:)(47);
    swift_bridgeObjectRelease(0xE000000000000000);
    v53 = 0xD000000000000014;
    v54 = 0x8000000100012D70;
    IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 168));
    v1 = *(_QWORD *)(v0 + 176);
    if (v1)
      v2 = *(_QWORD *)(v0 + 168);
    else
      v2 = 0x656E696665646E75;
    if (v1)
      v3 = *(_QWORD *)(v0 + 176);
    else
      v3 = 0xE900000000000064;
    v4 = v3;
    String.append(_:)(*(Swift::String *)&v2);
    swift_bridgeObjectRelease(v3);
    v5._countAndFlagsBits = 0xD000000000000017;
    v5._object = (void *)0x8000000100012D90;
    String.append(_:)(v5);
    IntentParameter.wrappedValue.getter((_QWORD *)(v0 + 184));
    v6 = *(_QWORD *)(v0 + 192);
    if (v6)
      v7 = *(_QWORD *)(v0 + 184);
    else
      v7 = 0x656E696665646E75;
    if (v6)
      v8 = *(_QWORD *)(v0 + 192);
    else
      v8 = 0xE900000000000064;
    v9 = v8;
    String.append(_:)(*(Swift::String *)&v7);
    swift_bridgeObjectRelease(v8);
    v10._countAndFlagsBits = v53;
    v11 = (void *)v54;
    v53 = 0xD00000000000002ALL;
    v54 = 0x8000000100012DB0;
    v10._object = v11;
    String.append(_:)(v10);
    swift_bridgeObjectRelease(v11);
    *(_QWORD *)(v0 + 304) = 0xD00000000000002ALL;
    *(_QWORD *)(v0 + 312) = 0x8000000100012DB0;
    URL.init(string:)(0xD00000000000002ALL, 0x8000000100012DB0);
    if (qword_10001A570 != -1)
      swift_once(&qword_10001A570, sub_100009D64);
    swift_beginAccess(&qword_10001AA58, v0 + 144, 0, 0);
    v13 = qword_10001AA58;
    v12 = qword_10001AA60;
    swift_bridgeObjectRetain(qword_10001AA60);
    Logger.init(subsystem:category:)(v13, v12, 1868983913, 0xE400000000000000);
    v14 = swift_bridgeObjectRetain_n(0x8000000100012DB0, 2);
    v15 = Logger.logObject.getter(v14);
    v16 = static os_log_type_t.default.getter();
    v17 = os_log_type_enabled(v15, v16);
    v18 = *(_QWORD *)(v0 + 280);
    v19 = *(_QWORD *)(v0 + 248);
    v20 = *(_QWORD *)(v0 + 256);
    if (v17)
    {
      v52 = *(_QWORD *)(v0 + 248);
      v51 = *(_QWORD *)(v0 + 280);
      v21 = (uint8_t *)swift_slowAlloc(12, -1);
      v22 = swift_slowAlloc(32, -1);
      v53 = v22;
      *(_DWORD *)v21 = 136315138;
      swift_bridgeObjectRetain(0x8000000100012DB0);
      *(_QWORD *)(v0 + 216) = sub_10000AD40(0xD00000000000002ALL, 0x8000000100012DB0, &v53);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 216, v0 + 224, v21 + 4, v21 + 12);
      swift_bridgeObjectRelease_n(0x8000000100012DB0, 3);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Deep linking to %s", v21, 0xCu);
      swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1, -1);
      swift_slowDealloc(v21, -1, -1);

      v23 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
      v23(v51, v52);
    }
    else
    {
      swift_bridgeObjectRelease_n(0x8000000100012DB0, 2);

      v23 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
      v23(v18, v19);
    }
    *(_QWORD *)(v0 + 320) = v23;
    result = objc_msgSend((id)objc_opt_self(LSApplicationWorkspace), "defaultWorkspace");
    *(_QWORD *)(v0 + 328) = result;
    if (result)
    {
      v39 = result;
      v40 = *(_QWORD *)(v0 + 288);
      sub_10000B780(*(_QWORD *)(v0 + 296), v40);
      v41 = type metadata accessor for URL(0);
      v42 = *(_QWORD *)(v41 - 8);
      v43 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41);
      v45 = 0;
      if (v43 != 1)
      {
        v46 = *(_QWORD *)(v0 + 288);
        URL._bridgeToObjectiveC()(v44);
        v45 = v47;
        (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v46, v41);
      }
      v48 = v0 + 16;
      *(_QWORD *)(v0 + 336) = v45;
      *(_QWORD *)(v0 + 56) = v0 + 200;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_10000A784;
      v49 = swift_continuation_init(v0 + 16, 1);
      *(_QWORD *)(v0 + 80) = _NSConcreteStackBlock;
      v50 = (_QWORD *)(v0 + 80);
      v50[1] = 0x40000000;
      v50[2] = sub_10000AAC8;
      v50[3] = &unk_100014D90;
      v50[4] = v49;
      objc_msgSend(v39, "openURL:configuration:completionHandler:", v45, 0, v50);
      return (id)swift_continuation_await(v48);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (qword_10001A570 != -1)
      swift_once(&qword_10001A570, sub_100009D64);
    swift_beginAccess(&qword_10001AA58, v0 + 120, 0, 0);
    v25 = qword_10001AA58;
    v24 = qword_10001AA60;
    swift_bridgeObjectRetain(qword_10001AA60);
    v26 = Logger.init(subsystem:category:)(v25, v24, 1868983913, 0xE400000000000000);
    v27 = Logger.logObject.getter(v26);
    v28 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "Feature flag disabled", v29, 2u);
      swift_slowDealloc(v29, -1, -1);
    }
    v30 = *(_QWORD *)(v0 + 272);
    v31 = *(_QWORD *)(v0 + 248);
    v32 = *(_QWORD *)(v0 + 256);

    v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 8))(v30, v31);
    static IntentResult.result<>()(v33);
    v34 = *(_QWORD *)(v0 + 288);
    v36 = *(_QWORD *)(v0 + 272);
    v35 = *(_QWORD *)(v0 + 280);
    v37 = *(_QWORD *)(v0 + 264);
    swift_task_dealloc(*(_QWORD *)(v0 + 296));
    swift_task_dealloc(v34);
    swift_task_dealloc(v35);
    swift_task_dealloc(v36);
    swift_task_dealloc(v37);
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_10000A784()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)();

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 48);
  *(_QWORD *)(*v0 + 344) = v2;
  if (v2)
  {
    v3 = sub_10000A87C;
  }
  else
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v1 + 312));
    v3 = sub_10000A7EC;
  }
  return swift_task_switch(v3, 0, 0);
}

uint64_t sub_10000A7EC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *(void **)(v0 + 336);
  v2 = *(_QWORD *)(v0 + 200);

  v3 = swift_bridgeObjectRelease(v2);
  v4 = *(_QWORD *)(v0 + 296);
  static IntentResult.result<>()(v3);
  sub_10000B7C8(v4);
  v5 = *(_QWORD *)(v0 + 288);
  v7 = *(_QWORD *)(v0 + 272);
  v6 = *(_QWORD *)(v0 + 280);
  v8 = *(_QWORD *)(v0 + 264);
  swift_task_dealloc(*(_QWORD *)(v0 + 296));
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000A87C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  uint64_t v28;

  v1 = *(void **)(v0 + 336);
  v2 = *(void **)(v0 + 328);
  v3 = *(_QWORD *)(v0 + 312);
  swift_willThrow();

  v5 = qword_10001AA58;
  v4 = qword_10001AA60;
  swift_bridgeObjectRetain(qword_10001AA60);
  Logger.init(subsystem:category:)(v5, v4, 0x726F727265, 0xE500000000000000);
  v6 = swift_bridgeObjectRetain(v3);
  v7 = Logger.logObject.getter(v6);
  v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = *(_QWORD *)(v0 + 344);
    v10 = *(_QWORD *)(v0 + 312);
    v11 = *(_QWORD *)(v0 + 304);
    v26 = *(_QWORD *)(v0 + 264);
    v27 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 320);
    v25 = *(_QWORD *)(v0 + 248);
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v28 = v13;
    *(_DWORD *)v12 = 136315138;
    swift_bridgeObjectRetain(v10);
    *(_QWORD *)(v0 + 208) = sub_10000AD40(v11, v10, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 208, v0 + 216, v12 + 4, v12 + 12);
    swift_bridgeObjectRelease_n(v10, 3);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Unable to deep link to %s", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
    swift_errorRelease(v9);

    v14 = v27(v26, v25);
  }
  else
  {
    v15 = *(_QWORD *)(v0 + 344);
    v16 = *(uint64_t (**)(uint64_t, uint64_t))(v0 + 320);
    v17 = *(_QWORD *)(v0 + 264);
    v18 = *(_QWORD *)(v0 + 248);
    swift_bridgeObjectRelease_n(*(_QWORD *)(v0 + 312), 2);
    swift_errorRelease(v15);

    v14 = v16(v17, v18);
  }
  v19 = *(_QWORD *)(v0 + 296);
  static IntentResult.result<>()(v14);
  sub_10000B7C8(v19);
  v20 = *(_QWORD *)(v0 + 288);
  v22 = *(_QWORD *)(v0 + 272);
  v21 = *(_QWORD *)(v0 + 280);
  v23 = *(_QWORD *)(v0 + 264);
  swift_task_dealloc(*(_QWORD *)(v0 + 296));
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000AAC8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    v5 = sub_10000B728(&qword_10001A440);
    v6 = swift_allocError(v5, &protocol self-conformance witness table for Error, 0, 0);
    *v7 = a3;
    v8 = a3;
    return swift_continuation_throwingResumeWithError(v3, v6);
  }
  else
  {
    if (a2)
      v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a2, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    else
      v10 = 0;
    v11 = v10;
    sub_10000BC20((uint64_t)&v11, *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40));
    return swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10000AB94@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_10001A560 != -1)
    swift_once(&qword_10001A560, sub_100009960);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_10000B768(v2, (uint64_t)qword_10001AA28);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000AC40(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v4 = *v1;
  v5 = v1[2];
  v6 = (_QWORD *)swift_task_alloc(dword_10001A3F4);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_10000ACA8;
  return sub_10000A134(a1, v4, v7, v5);
}

uint64_t sub_10000ACA8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000ACF0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = sub_10000B380();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_10000AD18(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000B8FC();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10000AD40(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_10000AE10(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10000BBE0((uint64_t)v12, *a3);
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
      sub_10000BBE0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000BBC0(v12);
  return v7;
}

uint64_t sub_10000AE10(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    result = sub_10000AFC8(a5, a6);
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
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

uint64_t sub_10000AFC8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_10000B05C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10000B234(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_10000B234(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_10000B05C(uint64_t a1, unint64_t a2)
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
      v5 = sub_10000B1D0(v4, 0);
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

_QWORD *sub_10000B1D0(uint64_t a1, uint64_t a2)
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
  v4 = sub_10000B728(&qword_10001A430);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_10000B234(char a1, int64_t a2, char a3, char *a4)
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
    v10 = sub_10000B728(&qword_10001A430);
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

uint64_t sub_10000B380()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  char *v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void (*v23)(char *);
  uint64_t v24;
  _QWORD v26[2];
  void (*v27)(char *);
  void (*v28)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t, uint64_t);
  void (*v33)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v38 = type metadata accessor for InputConnectionBehavior(0);
  v34 = *(_QWORD *)(v38 - 8);
  __chkstk_darwin();
  v37 = (char *)v26 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3D0);
  __chkstk_darwin();
  v2 = (char *)v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3D8);
  __chkstk_darwin();
  v4 = (char *)v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3E0);
  __chkstk_darwin();
  v6 = (char *)v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for LocalizedStringResource(0);
  v8 = *(_QWORD *)(v7 - 8);
  v36 = v7;
  __chkstk_darwin();
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10000B728(&qword_10001A3E8);
  LocalizedStringResource.init(stringLiteral:)(25705, 0xE200000000000000);
  v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v33(v6, 1, 1, v7);
  v12 = type metadata accessor for String.IntentInputOptions(0);
  v39 = 0;
  v40 = 0;
  v32 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
  v29 = v12;
  v32(v4, 1, 1, v12);
  v30 = type metadata accessor for IntentDialog(0);
  v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56);
  v13(v2, 1, 1, v30);
  v28 = v13;
  v35 = enum case for InputConnectionBehavior.default(_:);
  v27 = *(void (**)(char *))(v34 + 104);
  v15 = v37;
  v14 = v38;
  v27(v37);
  v26[0] = v6;
  v26[1] = v11;
  v34 = IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)(v10, v6, &v39, v4, v2, v15);
  LocalizedStringResource.init(stringLiteral:)(0x6E20797469746E45, 0xEB00000000656D61);
  v16 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v33;
  v33(v6, 1, 1, v36);
  v39 = 0;
  v40 = 0;
  v17 = v12;
  v18 = v32;
  v32(v4, 1, 1, v17);
  v19 = v2;
  v20 = v30;
  v13(v2, 1, 1, v30);
  v21 = v37;
  v22 = v14;
  v23 = v27;
  ((void (*)(char *, _QWORD, uint64_t))v27)(v37, v35, v22);
  v24 = v26[0];
  v31 = IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)(v10, v26[0], &v39, v4, v19, v21);
  LocalizedStringResource.init(stringLiteral:)(0x7420797469746E45, 0xEB00000000657079);
  v16(v24, 1, 1, v36);
  v39 = 0;
  v40 = 0;
  v18(v4, 1, 1, v29);
  v28(v19, 1, 1, v20);
  ((void (*)(char *, _QWORD, uint64_t))v23)(v21, v35, v38);
  IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)(v10, v24, &v39, v4, v19, v21);
  return v34;
}

uint64_t sub_10000B728(uint64_t *a1)
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

uint64_t sub_10000B768(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_10000B780(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000B728(&qword_10001A3F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B7C8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000B728(&qword_10001A3F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000B80C()
{
  unint64_t result;

  result = qword_10001A400;
  if (!qword_10001A400)
  {
    result = swift_getWitnessTable(&unk_10000FC90, &type metadata for PurchaseIntent);
    atomic_store(result, (unint64_t *)&qword_10001A400);
  }
  return result;
}

unint64_t sub_10000B854()
{
  unint64_t result;

  result = qword_10001A408;
  if (!qword_10001A408)
  {
    result = swift_getWitnessTable(&unk_10000FCB8, &type metadata for PurchaseIntent);
    atomic_store(result, (unint64_t *)&qword_10001A408);
  }
  return result;
}

uint64_t sub_10000B898(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_10001398C, 1) + 8);
}

uint64_t sub_10000B8BC(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10000B8FC();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

unint64_t sub_10000B8FC()
{
  unint64_t result;

  result = qword_10001A410;
  if (!qword_10001A410)
  {
    result = swift_getWitnessTable(&unk_10000FC00, &type metadata for PurchaseIntent);
    atomic_store(result, (unint64_t *)&qword_10001A410);
  }
  return result;
}

uint64_t destroy for PurchaseIntent(_QWORD *a1)
{
  swift_release(*a1);
  swift_release(a1[1]);
  return swift_release(a1[2]);
}

_QWORD *_s7AppleTV14PurchaseIntentVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[2];
  a1[2] = v4;
  ((void (*)(void))swift_retain)();
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t *assignWithCopy for PurchaseIntent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = a2[2];
  v9 = a1[2];
  a1[2] = v8;
  swift_retain(v8);
  swift_release(v9);
  return a1;
}

__n128 initializeWithTake for PurchaseIntent(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

_QWORD *assignWithTake for PurchaseIntent(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  v5 = a1[2];
  a1[2] = *(_QWORD *)(a2 + 16);
  swift_release(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for PurchaseIntent(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PurchaseIntent(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PurchaseIntent()
{
  return &type metadata for PurchaseIntent;
}

unint64_t sub_10000BB30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001A420;
  if (!qword_10001A420)
  {
    v1 = sub_10000BB7C(&qword_10001A428);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentResultContainer<A, B, C, D>, v1);
    atomic_store(result, (unint64_t *)&qword_10001A420);
  }
  return result;
}

uint64_t sub_10000BB7C(uint64_t *a1)
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

uint64_t sub_10000BBC0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000BBE0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000BC20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000B728(&qword_10001A438);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10000BC68(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10000BCAC()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000BC68(v0, qword_10001AA68);
  sub_10000B768(v0, (uint64_t)qword_10001AA68);
  return LocalizedStringResource.init(stringLiteral:)(0xD00000000000001CLL, 0x8000000100013120);
}

uint64_t sub_10000BD0C()
{
  return sub_100009B28(&qword_10001A700, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001AA68);
}

uint64_t sub_10000BD30@<X0>(uint64_t a1@<X8>)
{
  return sub_100009B90(&qword_10001A700, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001AA68, a1);
}

uint64_t sub_10000BD54(uint64_t a1)
{
  return sub_100009C40(a1, &qword_10001A700, (uint64_t (*)(_QWORD))&type metadata accessor for LocalizedStringResource, (uint64_t)qword_10001AA68, (uint64_t)sub_10000BCAC);
}

uint64_t (*sub_10000BD78(uint64_t a1))(_QWORD)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10001A700 != -1)
    swift_once(&qword_10001A700, sub_10000BCAC);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_10000B768(v2, (uint64_t)qword_10001AA68);
  swift_beginAccess(v3, a1, 33, 0);
  return j_j__swift_endAccess;
}

uint64_t sub_10000BDF0()
{
  uint64_t v0;

  v0 = type metadata accessor for IntentDescription(0);
  sub_10000BC68(v0, qword_10001AA80);
  sub_10000B768(v0, (uint64_t)qword_10001AA80);
  return IntentDescription.init(stringLiteral:)(0xD000000000000045, 0x80000001000130D0);
}

uint64_t sub_10000BE50()
{
  return sub_100009B28(&qword_10001A708, (uint64_t (*)(_QWORD))&type metadata accessor for IntentDescription, (uint64_t)qword_10001AA80);
}

uint64_t sub_10000BE74@<X0>(uint64_t a1@<X8>)
{
  return sub_100009B90(&qword_10001A708, (uint64_t (*)(_QWORD))&type metadata accessor for IntentDescription, (uint64_t)qword_10001AA80, a1);
}

uint64_t sub_10000BE98(uint64_t a1)
{
  return sub_100009C40(a1, &qword_10001A708, (uint64_t (*)(_QWORD))&type metadata accessor for IntentDescription, (uint64_t)qword_10001AA80, (uint64_t)sub_10000BDF0);
}

uint64_t (*sub_10000BEBC(uint64_t a1))(_QWORD)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_10001A708 != -1)
    swift_once(&qword_10001A708, sub_10000BDF0);
  v2 = type metadata accessor for IntentDescription(0);
  v3 = sub_10000B768(v2, (uint64_t)qword_10001AA80);
  swift_beginAccess(v3, a1, 33, 0);
  return j__swift_endAccess;
}

uint64_t sub_10000BF34()
{
  return sub_1000091D0(0xD00000000000001CLL, 0x80000001000130B0);
}

void sub_10000BF50()
{
  strcpy((char *)&qword_10001AA98, "DownloadIntent");
  HIBYTE(qword_10001AAA0) = -18;
}

uint64_t *sub_10000BF80()
{
  if (qword_10001A710 != -1)
    swift_once(&qword_10001A710, sub_10000BF50);
  return &qword_10001AA98;
}

uint64_t sub_10000BFC0()
{
  uint64_t v0;
  _BYTE v2[24];

  if (qword_10001A710 != -1)
    swift_once(&qword_10001A710, sub_10000BF50);
  swift_beginAccess(&qword_10001AA98, v2, 0, 0);
  v0 = qword_10001AA98;
  swift_bridgeObjectRetain(qword_10001AAA0);
  return v0;
}

uint64_t sub_10000C038(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BYTE v6[24];

  if (qword_10001A710 != -1)
    swift_once(&qword_10001A710, sub_10000BF50);
  swift_beginAccess(&qword_10001AA98, v6, 1, 0);
  v4 = qword_10001AAA0;
  qword_10001AA98 = a1;
  qword_10001AAA0 = a2;
  return swift_bridgeObjectRelease(v4);
}

uint64_t (*sub_10000C0B8(uint64_t a1))(_QWORD)
{
  if (qword_10001A710 != -1)
    swift_once(&qword_10001A710, sub_10000BF50);
  swift_beginAccess(&qword_10001AA98, a1, 33, 0);
  return j_j__swift_endAccess;
}

uint64_t sub_10000C124(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[5] = a1;
  v2 = type metadata accessor for Logger(0);
  v1[6] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[7] = v3;
  v1[8] = swift_task_alloc((*(_QWORD *)(v3 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000C184, 0, 0);
}

uint64_t sub_10000C184()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = TVAppFeature.isEnabled.getter(19);
  if ((v1 & 1) == 0)
  {
    if (qword_10001A710 != -1)
      swift_once(&qword_10001A710, sub_10000BF50);
    swift_beginAccess(&qword_10001AA98, v0 + 16, 0, 0);
    v3 = qword_10001AA98;
    v2 = qword_10001AAA0;
    swift_bridgeObjectRetain(qword_10001AAA0);
    v4 = Logger.init(subsystem:category:)(v3, v2, 1868983913, 0xE400000000000000);
    v5 = Logger.logObject.getter(v4);
    v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Feature flag disabled", v7, 2u);
      swift_slowDealloc(v7, -1, -1);
    }
    v9 = *(_QWORD *)(v0 + 56);
    v8 = *(_QWORD *)(v0 + 64);
    v10 = *(_QWORD *)(v0 + 48);

    v1 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  static IntentResult.result<>()(v1);
  swift_task_dealloc(*(_QWORD *)(v0 + 64));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C2E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE v5[24];

  if (qword_10001A700 != -1)
    swift_once(&qword_10001A700, sub_10000BCAC);
  v2 = type metadata accessor for LocalizedStringResource(0);
  v3 = sub_10000B768(v2, (uint64_t)qword_10001AA68);
  swift_beginAccess(v3, v5, 0, 0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10000C380(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10001A44C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10000ACA8;
  return sub_10000C124(a1);
}

uint64_t sub_10000C3D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_10000C41C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10000C3F4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000C7F8();
  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t sub_10000C41C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v28 = type metadata accessor for InputConnectionBehavior(0);
  v0 = *(_QWORD *)(v28 - 8);
  __chkstk_darwin();
  v27 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3D0);
  __chkstk_darwin();
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3D8);
  __chkstk_darwin();
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B728(&qword_10001A3E0);
  __chkstk_darwin();
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LocalizedStringResource(0);
  v9 = *(_QWORD *)(v8 - 8);
  v26 = v8;
  __chkstk_darwin();
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_10000B728(&qword_10001A3E8);
  LocalizedStringResource.init(stringLiteral:)(25705, 0xE200000000000000);
  v25 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56);
  v25(v7, 1, 1, v8);
  v12 = type metadata accessor for String.IntentInputOptions(0);
  v29 = 0;
  v30 = 0;
  v24 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56);
  v13 = v5;
  v24(v5, 1, 1, v12);
  v14 = type metadata accessor for IntentDialog(0);
  v22 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
  v22(v3, 1, 1, v14);
  v15 = enum case for InputConnectionBehavior.default(_:);
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v0 + 104);
  v16 = v27;
  v17 = v28;
  v20(v27, enum case for InputConnectionBehavior.default(_:), v28);
  v21 = IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)(v11, v7, &v29, v13, v3, v16);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001CLL, 0x80000001000130B0);
  v25(v7, 1, 1, v26);
  v29 = 0;
  v30 = 0;
  v24(v13, 1, 1, v12);
  v22(v3, 1, 1, v14);
  v20(v16, v15, v17);
  IntentParameter<>.init(title:description:default:inputOptions:requestValueDialog:inputConnectionBehavior:)(v11, v7, &v29, v13, v3, v16);
  return v21;
}

unint64_t sub_10000C708()
{
  unint64_t result;

  result = qword_10001A450;
  if (!qword_10001A450)
  {
    result = swift_getWitnessTable(&unk_10000FD80, &type metadata for DownloadIntent);
    atomic_store(result, (unint64_t *)&qword_10001A450);
  }
  return result;
}

unint64_t sub_10000C750()
{
  unint64_t result;

  result = qword_10001A458;
  if (!qword_10001A458)
  {
    result = swift_getWitnessTable(&unk_10000FDA8, &type metadata for DownloadIntent);
    atomic_store(result, (unint64_t *)&qword_10001A458);
  }
  return result;
}

uint64_t sub_10000C794(uint64_t a1)
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2(a1, &unk_1000139D0, 1) + 8);
}

uint64_t sub_10000C7B8(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10000C7F8();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppIntent.parameterSummary>>, 1);
}

unint64_t sub_10000C7F8()
{
  unint64_t result;

  result = qword_10001A460;
  if (!qword_10001A460)
  {
    result = swift_getWitnessTable(&unk_10000FCF0, &type metadata for DownloadIntent);
    atomic_store(result, (unint64_t *)&qword_10001A460);
  }
  return result;
}

uint64_t destroy for DownloadIntent(_QWORD *a1)
{
  swift_release(*a1);
  return swift_release(a1[1]);
}

uint64_t *_s7AppleTV14DownloadIntentVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t *assignWithCopy for DownloadIntent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  return a1;
}

__n128 initializeWithTake for DownloadIntent(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for DownloadIntent(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *a2;
  swift_release(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for DownloadIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for DownloadIntent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DownloadIntent()
{
  return &type metadata for DownloadIntent;
}

uint64_t sub_10000C9D8()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

id sub_10000C9E8()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id result;

  v0 = type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  result = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  qword_10001A8A8 = (uint64_t)result;
  return result;
}

uint64_t sub_10000CA38(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AAA8, 0x654D6E6F69746341, 0xEE006464412D756ELL);
}

uint64_t sub_10000CA64()
{
  return sub_10000CADC(&qword_10001A8B0, (uint64_t)qword_10001AAA8, (uint64_t)sub_10000CA38);
}

uint64_t sub_10000CA80@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A8B0, (uint64_t)qword_10001AAA8, (uint64_t)sub_10000CA38, a1);
}

uint64_t sub_10000CA9C(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AAC0, 0xD000000000000011, 0x8000000100013580);
}

uint64_t sub_10000CAC0()
{
  return sub_10000CADC(&qword_10001A8B8, (uint64_t)qword_10001AAC0, (uint64_t)sub_10000CA9C);
}

uint64_t sub_10000CADC(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  if (*a1 != -1)
    swift_once(a1, a3);
  v4 = type metadata accessor for ImageResource(0);
  return sub_10000B768(v4, a2);
}

uint64_t sub_10000CB1C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A8B8, (uint64_t)qword_10001AAC0, (uint64_t)sub_10000CA9C, a1);
}

uint64_t sub_10000CB38@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  if (*a1 != -1)
    swift_once(a1, a3);
  v6 = type metadata accessor for ImageResource(0);
  v7 = sub_10000B768(v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a4, v7, v6);
}

uint64_t sub_10000CBA0(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AAD8, 0xD00000000000001ALL, 0x8000000100013560);
}

uint64_t sub_10000CBC4()
{
  return sub_10000CADC(&qword_10001A8C0, (uint64_t)qword_10001AAD8, (uint64_t)sub_10000CBA0);
}

uint64_t sub_10000CBE0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A8C0, (uint64_t)qword_10001AAD8, (uint64_t)sub_10000CBA0, a1);
}

uint64_t sub_10000CBFC(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AAF0, 0xD000000000000027, 0x8000000100013530);
}

uint64_t sub_10000CC20()
{
  return sub_10000CADC(&qword_10001A8C8, (uint64_t)qword_10001AAF0, (uint64_t)sub_10000CBFC);
}

uint64_t sub_10000CC3C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A8C8, (uint64_t)qword_10001AAF0, (uint64_t)sub_10000CBFC, a1);
}

uint64_t sub_10000CC58(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AB08, 0x6C6C69662E676162, 0xE800000000000000);
}

uint64_t sub_10000CC78()
{
  return sub_10000CADC(&qword_10001A8D0, (uint64_t)qword_10001AB08, (uint64_t)sub_10000CC58);
}

uint64_t sub_10000CC94@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A8D0, (uint64_t)qword_10001AB08, (uint64_t)sub_10000CC58, a1);
}

uint64_t sub_10000CCB0(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AB20, 0x6C69662E656D6F68, 0xEE00646C6F622E6CLL);
}

uint64_t sub_10000CCDC()
{
  return sub_10000CADC(&qword_10001A8D8, (uint64_t)qword_10001AB20, (uint64_t)sub_10000CCB0);
}

uint64_t sub_10000CCF8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A8D8, (uint64_t)qword_10001AB20, (uint64_t)sub_10000CCB0, a1);
}

uint64_t sub_10000CD14(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AB38, 0x6568632D7473696CLL, 0xEC0000006E6F7276);
}

uint64_t sub_10000CD3C()
{
  return sub_10000CADC(&qword_10001A8E0, (uint64_t)qword_10001AB38, (uint64_t)sub_10000CD14);
}

uint64_t sub_10000CD58@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A8E0, (uint64_t)qword_10001AB38, (uint64_t)sub_10000CD14, a1);
}

uint64_t sub_10000CD74(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AB50, 0xD000000000000013, 0x8000000100013510);
}

uint64_t sub_10000CD98()
{
  return sub_10000CADC(&qword_10001A8E8, (uint64_t)qword_10001AB50, (uint64_t)sub_10000CD74);
}

uint64_t sub_10000CDB4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A8E8, (uint64_t)qword_10001AB50, (uint64_t)sub_10000CD74, a1);
}

uint64_t sub_10000CDD0(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AB68, 1937075312, 0xE400000000000000);
}

uint64_t sub_10000CDE8()
{
  return sub_10000CADC(&qword_10001A8F0, (uint64_t)qword_10001AB68, (uint64_t)sub_10000CDD0);
}

uint64_t sub_10000CE04@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A8F0, (uint64_t)qword_10001AB68, (uint64_t)sub_10000CDD0, a1);
}

uint64_t sub_10000CE20(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AB80, 0x65726E65672E7674, 0xEF6E6F697463612ELL);
}

uint64_t sub_10000CE4C()
{
  return sub_10000CADC(&qword_10001A8F8, (uint64_t)qword_10001AB80, (uint64_t)sub_10000CE20);
}

uint64_t sub_10000CE68@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A8F8, (uint64_t)qword_10001AB80, (uint64_t)sub_10000CE20, a1);
}

uint64_t sub_10000CE84(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AB98, 0xD000000000000012, 0x80000001000134F0);
}

uint64_t sub_10000CEA8()
{
  return sub_10000CADC(&qword_10001A900, (uint64_t)qword_10001AB98, (uint64_t)sub_10000CE84);
}

uint64_t sub_10000CEC4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A900, (uint64_t)qword_10001AB98, (uint64_t)sub_10000CE84, a1);
}

uint64_t sub_10000CEE0(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001ABB0, 0xD000000000000012, 0x80000001000134D0);
}

uint64_t sub_10000CF04()
{
  return sub_10000CADC(&qword_10001A908, (uint64_t)qword_10001ABB0, (uint64_t)sub_10000CEE0);
}

uint64_t sub_10000CF20@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A908, (uint64_t)qword_10001ABB0, (uint64_t)sub_10000CEE0, a1);
}

uint64_t sub_10000CF3C(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001ABC8, 0x65726E65672E7674, 0xEE00656D696E612ELL);
}

uint64_t sub_10000CF68()
{
  return sub_10000CADC(&qword_10001A910, (uint64_t)qword_10001ABC8, (uint64_t)sub_10000CF3C);
}

uint64_t sub_10000CF84@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A910, (uint64_t)qword_10001ABC8, (uint64_t)sub_10000CF3C, a1);
}

uint64_t sub_10000CFA0(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001ABE0, 0xD000000000000015, 0x80000001000134B0);
}

uint64_t sub_10000CFC4()
{
  return sub_10000CADC(&qword_10001A918, (uint64_t)qword_10001ABE0, (uint64_t)sub_10000CFA0);
}

uint64_t sub_10000CFE0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A918, (uint64_t)qword_10001ABE0, (uint64_t)sub_10000CFA0, a1);
}

uint64_t sub_10000CFFC(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001ABF8, 0xD000000000000012, 0x8000000100013490);
}

uint64_t sub_10000D020()
{
  return sub_10000CADC(&qword_10001A920, (uint64_t)qword_10001ABF8, (uint64_t)sub_10000CFFC);
}

uint64_t sub_10000D03C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A920, (uint64_t)qword_10001ABF8, (uint64_t)sub_10000CFFC, a1);
}

uint64_t sub_10000D058(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AC10, 0xD000000000000012, 0x8000000100013470);
}

uint64_t sub_10000D07C()
{
  return sub_10000CADC(&qword_10001A928, (uint64_t)qword_10001AC10, (uint64_t)sub_10000D058);
}

uint64_t sub_10000D098@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A928, (uint64_t)qword_10001AC10, (uint64_t)sub_10000D058, a1);
}

uint64_t sub_10000D0B4(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AC28, 0xD000000000000011, 0x8000000100013450);
}

uint64_t sub_10000D0D8()
{
  return sub_10000CADC(&qword_10001A930, (uint64_t)qword_10001AC28, (uint64_t)sub_10000D0B4);
}

uint64_t sub_10000D0F4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A930, (uint64_t)qword_10001AC28, (uint64_t)sub_10000D0B4, a1);
}

uint64_t sub_10000D110(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AC40, 0x65726E65672E7674, 0xEF7964656D6F632ELL);
}

uint64_t sub_10000D13C()
{
  return sub_10000CADC(&qword_10001A938, (uint64_t)qword_10001AC40, (uint64_t)sub_10000D110);
}

uint64_t sub_10000D158@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A938, (uint64_t)qword_10001AC40, (uint64_t)sub_10000D110, a1);
}

uint64_t sub_10000D174(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AC58, 0xD000000000000014, 0x8000000100013430);
}

uint64_t sub_10000D198()
{
  return sub_10000CADC(&qword_10001A940, (uint64_t)qword_10001AC58, (uint64_t)sub_10000D174);
}

uint64_t sub_10000D1B4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A940, (uint64_t)qword_10001AC58, (uint64_t)sub_10000D174, a1);
}

uint64_t sub_10000D1D0(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AC70, 0x65726E65672E7674, 0xEE00616D6172642ELL);
}

uint64_t sub_10000D1FC()
{
  return sub_10000CADC(&qword_10001A948, (uint64_t)qword_10001AC70, (uint64_t)sub_10000D1D0);
}

uint64_t sub_10000D218@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A948, (uint64_t)qword_10001AC70, (uint64_t)sub_10000D1D0, a1);
}

uint64_t sub_10000D234(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AC88, 0xD000000000000010, 0x8000000100013410);
}

uint64_t sub_10000D258()
{
  return sub_10000CADC(&qword_10001A950, (uint64_t)qword_10001AC88, (uint64_t)sub_10000D234);
}

uint64_t sub_10000D274@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A950, (uint64_t)qword_10001AC88, (uint64_t)sub_10000D234, a1);
}

uint64_t sub_10000D290(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001ACA0, 0xD000000000000010, 0x80000001000133F0);
}

uint64_t sub_10000D2B4()
{
  return sub_10000CADC(&qword_10001A958, (uint64_t)qword_10001ACA0, (uint64_t)sub_10000D290);
}

uint64_t sub_10000D2D0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A958, (uint64_t)qword_10001ACA0, (uint64_t)sub_10000D290, a1);
}

uint64_t sub_10000D2EC(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001ACB8, 0xD000000000000010, 0x80000001000133D0);
}

uint64_t sub_10000D310()
{
  return sub_10000CADC(&qword_10001A960, (uint64_t)qword_10001ACB8, (uint64_t)sub_10000D2EC);
}

uint64_t sub_10000D32C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A960, (uint64_t)qword_10001ACB8, (uint64_t)sub_10000D2EC, a1);
}

uint64_t sub_10000D348(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001ACD0, 0xD000000000000010, 0x80000001000133B0);
}

uint64_t sub_10000D36C()
{
  return sub_10000CADC(&qword_10001A968, (uint64_t)qword_10001ACD0, (uint64_t)sub_10000D348);
}

uint64_t sub_10000D388@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A968, (uint64_t)qword_10001ACD0, (uint64_t)sub_10000D348, a1);
}

uint64_t sub_10000D3A4(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001ACE8, 0x65726E65672E7674, 0xEF726F72726F682ELL);
}

uint64_t sub_10000D3D0()
{
  return sub_10000CADC(&qword_10001A970, (uint64_t)qword_10001ACE8, (uint64_t)sub_10000D3A4);
}

uint64_t sub_10000D3EC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A970, (uint64_t)qword_10001ACE8, (uint64_t)sub_10000D3A4, a1);
}

uint64_t sub_10000D408(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AD00, 0xD000000000000014, 0x8000000100013390);
}

uint64_t sub_10000D42C()
{
  return sub_10000CADC(&qword_10001A978, (uint64_t)qword_10001AD00, (uint64_t)sub_10000D408);
}

uint64_t sub_10000D448@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A978, (uint64_t)qword_10001AD00, (uint64_t)sub_10000D408, a1);
}

uint64_t sub_10000D464(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AD18, 0xD000000000000016, 0x8000000100013370);
}

uint64_t sub_10000D488()
{
  return sub_10000CADC(&qword_10001A980, (uint64_t)qword_10001AD18, (uint64_t)sub_10000D464);
}

uint64_t sub_10000D4A4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A980, (uint64_t)qword_10001AD18, (uint64_t)sub_10000D464, a1);
}

uint64_t sub_10000D4C0(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AD30, 0xD000000000000018, 0x8000000100013350);
}

uint64_t sub_10000D4E4()
{
  return sub_10000CADC(&qword_10001A988, (uint64_t)qword_10001AD30, (uint64_t)sub_10000D4C0);
}

uint64_t sub_10000D500@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A988, (uint64_t)qword_10001AD30, (uint64_t)sub_10000D4C0, a1);
}

uint64_t sub_10000D51C(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AD48, 0xD000000000000018, 0x8000000100013330);
}

uint64_t sub_10000D540()
{
  return sub_10000CADC(&qword_10001A990, (uint64_t)qword_10001AD48, (uint64_t)sub_10000D51C);
}

uint64_t sub_10000D55C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A990, (uint64_t)qword_10001AD48, (uint64_t)sub_10000D51C, a1);
}

uint64_t sub_10000D578(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AD60, 0xD000000000000011, 0x8000000100013310);
}

uint64_t sub_10000D59C()
{
  return sub_10000CADC(&qword_10001A998, (uint64_t)qword_10001AD60, (uint64_t)sub_10000D578);
}

uint64_t sub_10000D5B8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A998, (uint64_t)qword_10001AD60, (uint64_t)sub_10000D578, a1);
}

uint64_t sub_10000D5D4(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AD78, 0x65726E65672E7674, 0xEE00636973756D2ELL);
}

uint64_t sub_10000D600()
{
  return sub_10000CADC(&qword_10001A9A0, (uint64_t)qword_10001AD78, (uint64_t)sub_10000D5D4);
}

uint64_t sub_10000D61C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A9A0, (uint64_t)qword_10001AD78, (uint64_t)sub_10000D5D4, a1);
}

uint64_t sub_10000D638(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AD90, 0xD000000000000010, 0x80000001000132F0);
}

uint64_t sub_10000D65C()
{
  return sub_10000CADC(&qword_10001A9A8, (uint64_t)qword_10001AD90, (uint64_t)sub_10000D638);
}

uint64_t sub_10000D678@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A9A8, (uint64_t)qword_10001AD90, (uint64_t)sub_10000D638, a1);
}

uint64_t sub_10000D694(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001ADA8, 0xD000000000000010, 0x80000001000132D0);
}

uint64_t sub_10000D6B8()
{
  return sub_10000CADC(&qword_10001A9B0, (uint64_t)qword_10001ADA8, (uint64_t)sub_10000D694);
}

uint64_t sub_10000D6D4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A9B0, (uint64_t)qword_10001ADA8, (uint64_t)sub_10000D694, a1);
}

uint64_t sub_10000D6F0(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001ADC0, 0xD000000000000010, 0x80000001000132B0);
}

uint64_t sub_10000D714()
{
  return sub_10000CADC(&qword_10001A9B8, (uint64_t)qword_10001ADC0, (uint64_t)sub_10000D6F0);
}

uint64_t sub_10000D730@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A9B8, (uint64_t)qword_10001ADC0, (uint64_t)sub_10000D6F0, a1);
}

uint64_t sub_10000D74C(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001ADD8, 0xD000000000000010, 0x8000000100013290);
}

uint64_t sub_10000D770()
{
  return sub_10000CADC(&qword_10001A9C0, (uint64_t)qword_10001ADD8, (uint64_t)sub_10000D74C);
}

uint64_t sub_10000D78C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A9C0, (uint64_t)qword_10001ADD8, (uint64_t)sub_10000D74C, a1);
}

uint64_t sub_10000D7A8(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001ADF0, 0xD000000000000018, 0x8000000100013270);
}

uint64_t sub_10000D7CC()
{
  return sub_10000CADC(&qword_10001A9C8, (uint64_t)qword_10001ADF0, (uint64_t)sub_10000D7A8);
}

uint64_t sub_10000D7E8@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A9C8, (uint64_t)qword_10001ADF0, (uint64_t)sub_10000D7A8, a1);
}

uint64_t sub_10000D804(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AE08, 0xD000000000000010, 0x8000000100013250);
}

uint64_t sub_10000D828()
{
  return sub_10000CADC(&qword_10001A9D0, (uint64_t)qword_10001AE08, (uint64_t)sub_10000D804);
}

uint64_t sub_10000D844@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A9D0, (uint64_t)qword_10001AE08, (uint64_t)sub_10000D804, a1);
}

uint64_t sub_10000D860(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AE20, 0xD000000000000010, 0x8000000100013230);
}

uint64_t sub_10000D884()
{
  return sub_10000CADC(&qword_10001A9D8, (uint64_t)qword_10001AE20, (uint64_t)sub_10000D860);
}

uint64_t sub_10000D8A0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A9D8, (uint64_t)qword_10001AE20, (uint64_t)sub_10000D860, a1);
}

uint64_t sub_10000D8BC(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AE38, 0x65726E65672E7674, 0xEF69662D6963732ELL);
}

uint64_t sub_10000D8E8()
{
  return sub_10000CADC(&qword_10001A9E0, (uint64_t)qword_10001AE38, (uint64_t)sub_10000D8BC);
}

uint64_t sub_10000D904@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A9E0, (uint64_t)qword_10001AE38, (uint64_t)sub_10000D8BC, a1);
}

uint64_t sub_10000D920(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AE50, 0xD000000000000014, 0x8000000100013210);
}

uint64_t sub_10000D944()
{
  return sub_10000CADC(&qword_10001A9E8, (uint64_t)qword_10001AE50, (uint64_t)sub_10000D920);
}

uint64_t sub_10000D960@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A9E8, (uint64_t)qword_10001AE50, (uint64_t)sub_10000D920, a1);
}

uint64_t sub_10000D97C(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AE68, 0x65726E65672E7674, 0xEF7374726F70732ELL);
}

uint64_t sub_10000D9A8()
{
  return sub_10000CADC(&qword_10001A9F0, (uint64_t)qword_10001AE68, (uint64_t)sub_10000D97C);
}

uint64_t sub_10000D9C4@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A9F0, (uint64_t)qword_10001AE68, (uint64_t)sub_10000D97C, a1);
}

uint64_t sub_10000D9E0(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AE80, 0xD000000000000011, 0x80000001000131F0);
}

uint64_t sub_10000DA04()
{
  return sub_10000CADC(&qword_10001A9F8, (uint64_t)qword_10001AE80, (uint64_t)sub_10000D9E0);
}

uint64_t sub_10000DA20@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001A9F8, (uint64_t)qword_10001AE80, (uint64_t)sub_10000D9E0, a1);
}

uint64_t sub_10000DA3C(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AE98, 0xD000000000000012, 0x80000001000131D0);
}

uint64_t sub_10000DA60()
{
  return sub_10000CADC(&qword_10001AA00, (uint64_t)qword_10001AE98, (uint64_t)sub_10000DA3C);
}

uint64_t sub_10000DA7C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001AA00, (uint64_t)qword_10001AE98, (uint64_t)sub_10000DA3C, a1);
}

uint64_t sub_10000DA98(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AEB0, 0x65726E65672E7674, 0xEF6C65766172742ELL);
}

uint64_t sub_10000DAC4()
{
  return sub_10000CADC(&qword_10001AA08, (uint64_t)qword_10001AEB0, (uint64_t)sub_10000DA98);
}

uint64_t sub_10000DAE0@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001AA08, (uint64_t)qword_10001AEB0, (uint64_t)sub_10000DA98, a1);
}

uint64_t sub_10000DAFC(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AEC8, 0xD000000000000010, 0x80000001000131B0);
}

uint64_t sub_10000DB20()
{
  return sub_10000CADC(&qword_10001AA10, (uint64_t)qword_10001AEC8, (uint64_t)sub_10000DAFC);
}

uint64_t sub_10000DB3C@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001AA10, (uint64_t)qword_10001AEC8, (uint64_t)sub_10000DAFC, a1);
}

uint64_t sub_10000DB58(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AEE0, 0xD000000000000010, 0x8000000100013190);
}

uint64_t sub_10000DB7C()
{
  return sub_10000CADC(&qword_10001AA18, (uint64_t)qword_10001AEE0, (uint64_t)sub_10000DB58);
}

uint64_t sub_10000DB98@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001AA18, (uint64_t)qword_10001AEE0, (uint64_t)sub_10000DB58, a1);
}

uint64_t sub_10000DBB4(uint64_t a1)
{
  return sub_10000DBE0(a1, qword_10001AEF8, 0x6F697369762E7674, 0xEF64332E6F72706ELL);
}

uint64_t sub_10000DBE0(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for ImageResource(0);
  sub_10000BC68(v7, a2);
  sub_10000B768(v7, (uint64_t)a2);
  if (qword_10001A8A0 != -1)
    swift_once(&qword_10001A8A0, sub_10000C9E8);
  return ImageResource.init(name:bundle:)(a3, a4, (id)qword_10001A8A8);
}

uint64_t sub_10000DC78()
{
  return sub_10000CADC(&qword_10001AA20, (uint64_t)qword_10001AEF8, (uint64_t)sub_10000DBB4);
}

uint64_t sub_10000DC94@<X0>(uint64_t a1@<X8>)
{
  return sub_10000CB38(&qword_10001AA20, (uint64_t)qword_10001AEF8, (uint64_t)sub_10000DBB4, a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC7AppleTVP33_7CA9A91CE23DBC2939975EE0CF80278219ResourceBundleClass);
}

void sub_10000DCD0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C20((void *)&_mh_execute_header, a2, a3, "Already have a previous AR completion handler for %@.  Calling it now", a5, a6, a7, a8, 2u);
}

void sub_10000DD38(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C20((void *)&_mh_execute_header, a2, a3, "Already have a previous completion handler for %@.  Calling it now", a5, a6, a7, a8, 2u);
}

void sub_10000DDA0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out waiting for background URL session events to complete.", v1, 2u);
}

void sub_10000DDE0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C20((void *)&_mh_execute_header, a2, a3, "Failed to find scrollview for test '%@'", a5, a6, a7, a8, 2u);
  sub_100009178();
}

void sub_10000DE44(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C20((void *)&_mh_execute_header, a2, a3, "Unable to find shelf with button %@", a5, a6, a7, a8, 2u);
  sub_100009178();
}

void sub_10000DEA8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C20((void *)&_mh_execute_header, a2, a3, "Unable to find tab %@", a5, a6, a7, a8, 2u);
  sub_100009178();
}

void sub_10000DF10()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "RPTTestRunner");
  sub_10000DF34(v0);
}

void sub_10000DF34()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "RPTScrollViewTestParameters");
  static AppIntent.openAppWhenRun.getter(v0);
}

id objc_msgSend__blockExecutionInTabBarController_documentRef_totalChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_blockExecutionInTabBarController:documentRef:totalChildren:");
}

id objc_msgSend__canHandleTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canHandleTest:");
}

id objc_msgSend__contentScrollsAlongXAxis(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentScrollsAlongXAxis");
}

id objc_msgSend__downloadSessionDidFinishEventsForBackgroundURLSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_downloadSessionDidFinishEventsForBackgroundURLSession:");
}

id objc_msgSend__findCollectionViewInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findCollectionViewInView:");
}

id objc_msgSend__findLabelInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findLabelInView:");
}

id objc_msgSend__findLabelWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findLabelWithTitle:inView:");
}

id objc_msgSend__findScrollViewInViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findScrollViewInViewController:");
}

id objc_msgSend__findShelfViewControllerInViewController_withShelfRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findShelfViewControllerInViewController:withShelfRow:");
}

id objc_msgSend__findShelfViewControllerInViewController_withTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findShelfViewControllerInViewController:withTitle:");
}

id objc_msgSend__findTVButtonWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findTVButtonWithTitle:inView:");
}

id objc_msgSend__findUIButtonWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findUIButtonWithTitle:inView:");
}

id objc_msgSend__findVUIRoundButtonWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findVUIRoundButtonWithTitle:inView:");
}

id objc_msgSend__findViewOfType_inView_withFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findViewOfType:inView:withFilter:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_init");
}

id objc_msgSend__performScrollTest_iterations_delta_length_scrollAxis_extraResultsBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:");
}

id objc_msgSend__registerTests(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerTests");
}

id objc_msgSend__scrollHalfTheScreenHeightIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollHalfTheScreenHeightIn:");
}

id objc_msgSend__selectButtonWithTitle_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectButtonWithTitle:inView:");
}

id objc_msgSend__setContentScrollsAlongXAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContentScrollsAlongXAxis:");
}

id objc_msgSend__sourceApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sourceApplication");
}

id objc_msgSend__topViewControllerInTabBarController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_topViewControllerInTabBarController:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityType");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_applicationDidFinishLaunchingWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationDidFinishLaunchingWithOptions:");
}

id objc_msgSend_applicationLoadCompletion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationLoadCompletion");
}

id objc_msgSend_applicationWillFinishLaunchingWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationWillFinishLaunchingWithOptions:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_canHandleTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canHandleTest:");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_cellForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForItemAtIndexPath:");
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "childViewControllers");
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cleanUp");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentOffset");
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

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTitle");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_findScrollViewInView_desiredScrollViewClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findScrollViewInView:desiredScrollViewClass:");
}

id objc_msgSend_findScrollViewInView_desiredScrollViewClass_numScrollViewsToSkip_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_handleEventsForARQLBackgroundURLSessionCompletionHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEventsForARQLBackgroundURLSessionCompletionHandler");
}

id objc_msgSend_handleEventsForBackgroundURLSessionCompletionHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleEventsForBackgroundURLSessionCompletionHandler");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForItem:inSection:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithTestName_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestName:scrollView:completionHandler:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMainThread");
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRecapAvailable");
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWindow");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationController");
}

id objc_msgSend_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfItemsInSection:");
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfSections");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:options:");
}

id objc_msgSend_overrideOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overrideOrientation");
}

id objc_msgSend_overridesOrientationLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "overridesOrientationLock");
}

id objc_msgSend_performScrollViewTest_testOptions_scrollAxis_tabBarController_scrollViewBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performScrollViewTest:testOptions:scrollAxis:tabBarController:scrollViewBlock:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_preWarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preWarm:");
}

id objc_msgSend_prepareForPPT(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForPPT");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_referrerURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "referrerURL");
}

id objc_msgSend_registerBgUrlSessionNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerBgUrlSessionNotifications");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_resetNumScrollViewFound(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetNumScrollViewFound");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_runTest_app_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTest:app:");
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestWithParameters:");
}

id objc_msgSend_selectTabWithTitle_inTabBarController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectTabWithTitle:inTabBarController:");
}

id objc_msgSend_selectedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedViewController");
}

id objc_msgSend_setApplicationLoadCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplicationLoadCompletion:");
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:animated:");
}

id objc_msgSend_setHandleEventsForARQLBackgroundURLSessionCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandleEventsForARQLBackgroundURLSessionCompletionHandler:");
}

id objc_msgSend_setHandleEventsForBackgroundURLSessionCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandleEventsForBackgroundURLSessionCompletionHandler:");
}

id objc_msgSend_setMainWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMainWindow:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setSelectedIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedIndex:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subviews");
}

id objc_msgSend_tabBarController_didSelectViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarController:didSelectViewController:");
}

id objc_msgSend_tabBarItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarItems");
}

id objc_msgSend_templateViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "templateViewController");
}

id objc_msgSend_testLog(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testLog");
}

id objc_msgSend_testOperationQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testOperationQueue");
}

id objc_msgSend_testsManifest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "testsManifest");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "text");
}

id objc_msgSend_textLabels(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textLabels");
}

id objc_msgSend_topMostController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topMostController");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topViewController");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_valueForKeyPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKeyPath:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllers");
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleCells");
}

id objc_msgSend_vui_ppt_isLoading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vui_ppt_isLoading");
}

id objc_msgSend_vui_stringForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vui_stringForKey:");
}

id objc_msgSend_waitForTabWithTitleToLoad_inTabBarController_totalChildren_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitForTabWithTitleToLoad:inTabBarController:totalChildren:");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "webpageURL");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workQueue");
}
