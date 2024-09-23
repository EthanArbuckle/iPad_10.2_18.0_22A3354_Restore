uint64_t start(int a1, char **a2)
{
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;

  v4 = objc_autoreleasePoolPush();
  +[CNApplication prewarmResourcesForLaunch](CNApplication, "prewarmResourcesForLaunch");
  v5 = (objc_class *)objc_opt_class(ContactsAppDelegate);
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue(v6);
  v8 = UIApplicationMain(a1, a2, CFSTR("CNApplication"), v7);

  objc_autoreleasePoolPop(v4);
  return v8;
}

id sub_100004638(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setNeedsUpdateOfMultitaskingDragExclusionRects");
}

void sub_100004640(id a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v1 = objc_msgSend((id)qword_100025B68, "currentSnapshot");
  v2 = (void *)qword_100025B68;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactListViewController descriptorForRequiredKeysForPreferredForNameMeContact](CNContactListViewController, "descriptorForRequiredKeysForPreferredForNameMeContact"));
  v7 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v5 = objc_msgSend(v2, "preferredForNameMeContactWithKeysToFetch:", v4);

  v6 = (void *)qword_100025B68;
  qword_100025B68 = 0;

}

void sub_100004708(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;

  kdebug_trace(725483556, 0, 0, 0, 0);
  v2 = objc_msgSend(*(id *)(a1 + 32), "newContactStoreDataSourceForSplitViewController");
  v3 = (void *)qword_100025B68;
  qword_100025B68 = (uint64_t)v2;

  v4 = +[CNContactNavigationController newContactFormatter](CNContactNavigationController, "newContactFormatter");
  objc_msgSend((id)qword_100025B68, "setContactFormatter:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100025B68, "store"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[CNContactStoreFilter contactStoreFilterFromPreferencesWithContactStore:](CNContactStoreFilter, "contactStoreFilterFromPreferencesWithContactStore:", v5));

  if (v6)
    objc_msgSend((id)qword_100025B68, "setFilter:", v6);
  kdebug_trace(725483560, 0, 0, 0, 0);

}

uint64_t sub_1000047F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100004800(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactStoreDataSource"));
  objc_msgSend(v1, "setShouldRevalidateFilterOnStoreChange:", 0);

}

id sub_100004834(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "checkInLaunchTasksIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "displayContactIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "performMigrationOfFacebookContactsToLocalStoreIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "createShowMeCardApplicationShortcutIfNecessary");
  return objc_msgSend(*(id *)(a1 + 32), "executeAllDelayedActions");
}

uint64_t sub_100004874(uint64_t a1)
{
  uint64_t v1;

  v1 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _UIApplicationIsAccountBased(v1);
  return kdebug_trace(725483528, 0, 0, 0, 0);
}

void sub_1000048AC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.contactsui", "scene");
  v2 = (void *)qword_100025B88;
  qword_100025B88 = (uint64_t)v1;

}

void sub_100005F14(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.contactsui", "ContactsURLParser");
  v2 = (void *)qword_100025B50;
  qword_100025B50 = (uint64_t)v1;

}

void sub_1000064A0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id sub_100006A78(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willStartTest");
  return objc_msgSend(*(id *)(a1 + 32), "startSearchQuery");
}

void sub_100006B78(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double Current;
  double v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allSearchQueries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "currentQueryIndex")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("search for \"%@\""), v3));
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "lastSearchBeginTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current - v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extraResults"));
  objc_msgSend(v8, "setValue:forKey:", v7, v4);

  v9 = (char *)objc_msgSend(*(id *)(a1 + 32), "currentQueryIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allSearchQueries"));
  v11 = (char *)objc_msgSend(v10, "count") - 1;

  if (v9 >= v11)
  {
    v12 = (void *)UIApp;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("testName")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extraResults"));
    objc_msgSend(v12, "finishedTest:extraResults:", v14, v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contactListViewController"));
    objc_msgSend(v17, "cancelSearch:", 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCurrentQueryIndex:", (char *)objc_msgSend(*(id *)(a1 + 32), "currentQueryIndex") + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006D7C;
    block[3] = &unk_10001C488;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

id sub_100006D7C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startSearchQuery");
}

void sub_100006ECC(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.contactsui", "app");
  v2 = (void *)qword_100025B60;
  qword_100025B60 = (uint64_t)v1;

}

BOOL sub_100006FF4(id a1, UIScene *a2)
{
  UIScene *v2;
  uint64_t v3;
  UIScene *v4;
  UIScene *v5;
  BOOL v6;

  v2 = a2;
  v3 = objc_opt_class(UIWindowScene);
  if ((objc_opt_isKindOfClass(v2, v3) & 1) != 0)
    v4 = v2;
  else
    v4 = 0;
  v5 = v4;
  if (-[UIScene _isKeyWindowScene](v5, "_isKeyWindowScene"))
    v6 = -[UIScene activationState](v5, "activationState") == UISceneActivationStateForegroundActive;
  else
    v6 = 0;

  return v6;
}

id sub_100007268(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willStartTest");
  return objc_msgSend(*(id *)(a1 + 32), "performTest");
}

void sub_100007418(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  v2 = (void *)UIApp;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName")));
  objc_msgSend(v2, "finishedSubTest:forTest:", CFSTR("Create New Contact"), v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactSplitViewController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000074E4;
  v6[3] = &unk_10001C488;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

}

id sub_1000074E4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", "performTest", 0, 1.0);
}

void sub_1000077B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000077D8(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didShow:", v3);

}

void sub_100007820(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
  objc_msgSend(v2, "showCardForContact:animated:", *(_QWORD *)(a1 + 40), 0);

  if (objc_msgSend(*(id *)(a1 + 32), "isIPad"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactSplitViewController"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedContactViewController"));

    objc_msgSend(*(id *)(a1 + 32), "editAndScrollContactViewController:", v4);
  }
}

void sub_100007B48(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentViewController"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contactView"));

  objc_msgSend(*(id *)(a1 + 40), "performScrollTestWithScrollView:completionBlock:", v3, 0);
}

void sub_100007E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007E78(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didShow:", v3);

}

void sub_100007EC0(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
  objc_msgSend(v2, "showCardForContact:animated:", *(_QWORD *)(a1 + 40), 0);

  if (objc_msgSend(*(id *)(a1 + 32), "isIPad"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactSplitViewController"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedContactViewController"));

    objc_msgSend(*(id *)(a1 + 32), "scrollContactViewController:", v4);
  }
}

id sub_1000081E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performScrollTestWithScrollView:completionBlock:", *(_QWORD *)(a1 + 40), 0);
}

id sub_100008384(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willStartTest");
  return objc_msgSend(*(id *)(a1 + 32), "startSearchQuery");
}

void sub_1000084A0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double Current;
  double v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  char *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD block[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allSearchQueries"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectAtIndex:", objc_msgSend(*(id *)(a1 + 32), "currentQueryIndex")));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("search for \"%@\""), v3));
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(*(id *)(a1 + 32), "lastSearchBeginTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current - v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extraResults"));
  objc_msgSend(v8, "setValue:forKey:", v7, v4);

  kdebug_trace(725483608, 0, 0, 0, 0);
  v9 = (char *)objc_msgSend(*(id *)(a1 + 32), "currentQueryIndex");
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "allSearchQueries"));
  v11 = (char *)objc_msgSend(v10, "count") - 1;

  if (v9 >= v11)
  {
    v12 = (void *)UIApp;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("testName")));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extraResults"));
    objc_msgSend(v12, "finishedTest:extraResults:", v14, v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contactListViewController"));
    objc_msgSend(v17, "cancelSearch:", 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setCurrentQueryIndex:", (char *)objc_msgSend(*(id *)(a1 + 32), "currentQueryIndex") + 1);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000086C0;
    block[3] = &unk_10001C488;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }

}

id sub_1000086C0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startSearchQuery");
}

void sub_10000901C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "displayedContact"));
  LOBYTE(v3) = 0;
  objc_msgSend(v4, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:dismissingPresentedController:", v2, 0, 0, 1, 1, 0, v3);

}

void sub_1000091C0(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "potentiallyPresentedDetailViewController"));
  objc_msgSend(v2, "showDetailViewController:sender:", v3, *(_QWORD *)(a1 + 40));

}

NSArray *__cdecl sub_10000929C(id a1, UIViewController *a2)
{
  UIViewController *v2;
  void *v3;
  void *v4;
  void *v5;
  UIViewController *v7;

  v7 = a2;
  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIViewController childViewControllers](v2, "childViewControllers", v7));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4));
  return (NSArray *)v5;
}

BOOL sub_100009350(id a1, UIViewController *a2)
{
  UIViewController *v2;
  uint64_t v3;
  char isKindOfClass;

  v2 = a2;
  v3 = objc_opt_class(CNContactContentViewController);
  isKindOfClass = objc_opt_isKindOfClass(v2, v3);

  return isKindOfClass & 1;
}

void sub_100009398(id a1, CNContactContentViewController *a2)
{
  CNContactContentViewController *v2;

  v2 = a2;
  if (-[CNContactContentViewController isEditing](v2, "isEditing"))
  {
    -[CNContactContentViewController clearMapsDataIfEdited](v2, "clearMapsDataIfEdited");
    -[CNContactContentViewController saveChanges](v2, "saveChanges");
  }

}

uint64_t sub_10000A354(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_10000A368(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_10000A600(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_10000A734(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performTest");
}

void sub_10000A828(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentViewController"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contactView"));

  objc_msgSend(*(id *)(a1 + 40), "performScrollTestWithScrollView:completionBlock:", v3, 0);
}

void sub_10000A96C(uint64_t a1)
{
  dispatch_time_t v2;
  void *v3;
  _QWORD v4[5];
  id v5;

  v2 = dispatch_time(0, 1000000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000A9FC;
  v4[3] = &unk_10001C538;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);

}

id sub_10000A9FC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performScrollTestWithScrollView:completionBlock:", *(_QWORD *)(a1 + 40), 0);
}

void sub_10000AF74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000AF9C(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didShow:", v3);

}

id sub_10000B194(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  kdebug_trace(725483600, 0, 0, 0, 0);
  v2 = (void *)UIApp;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName")));
  objc_msgSend(v2, "finishedSubTest:forTest:", CFSTR("Open Contact"), v4);

  return objc_msgSend(*(id *)(a1 + 32), "performSelector:", "showContactsListForIPhone");
}

void sub_10000B2D8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  signed int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  kdebug_trace(725483600, 0, 0, 0, 0);
  v2 = (void *)UIApp;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName")));
  objc_msgSend(v2, "finishedSubTest:forTest:", CFSTR("Open Contact"), v4);

  LODWORD(v2) = objc_msgSend(*(id *)(a1 + 32), "nextContactIndex");
  if ((int)v2 >= (int)objc_msgSend(*(id *)(a1 + 32), "maxContactIndex")
    || (v5 = objc_msgSend(*(id *)(a1 + 32), "nextContactIndex"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contacts")),
        v7 = objc_msgSend(v6, "count"),
        v6,
        (unint64_t)v7 <= v5))
  {
    v8 = (void *)UIApp;
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("testName")));
    objc_msgSend(v8, "finishedTest:", v9);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", "showNextContact", 0, 0.5);
  }
}

void sub_10000B520(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD block[5];

  v2 = (void *)UIApp;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("time")));
  objc_msgSend(v2, "startedSubTest:forTest:withMetrics:", CFSTR("Open Contact"), v4, v5);

  kdebug_trace(725483596, 0, 0, 0, 0);
  if (objc_msgSend(*(id *)(a1 + 32), "isIPad"))
    +[CATransaction setFrameStallSkipRequest:](CATransaction, "setFrameStallSkipRequest:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
  objc_msgSend(v6, "showCardForContact:animated:", *(_QWORD *)(a1 + 40), 1);

  objc_msgSend(*(id *)(a1 + 32), "setNextContactIndex:", objc_msgSend(*(id *)(a1 + 32), "nextContactIndex") + 1);
  if (objc_msgSend(*(id *)(a1 + 32), "isIPad"))
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000B684;
    block[3] = &unk_10001C488;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_10000B684(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:", "iterateContact");
}

void sub_10000B788(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = (void *)UIApp;
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName")));
  objc_msgSend(v1, "finishedSubTest:forTest:", CFSTR("Close Contact"), v2);

}

id sub_10000B86C(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activityRestorer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "restorableActivityTypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activityType"));

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

void sub_10000BA04(id a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[CNUIDataCollector sharedCollector](CNUIDataCollector, "sharedCollector"));
  objc_msgSend(v1, "logPresentation");

}

void sub_10000BAFC(id a1, id a2)
{
  (*((void (**)(id))a2 + 2))(a2);
}

void sub_10000C2BC(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "splitViewController"));
  objc_msgSend(v1, "createNewContact");

}

void sub_10000C3A8(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "splitViewController"));
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  if (v2)
    objc_msgSend(v3, "showEditingCardForContact:", v4);
  else
    objc_msgSend(v3, "showCardForContact:fallbackToFirstContact:", v4, 0);

}

void sub_10000C828(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "splitViewController"));
  objc_msgSend(v2, "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), 0);

}

void sub_10000CC44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000CC6C(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didShow:", v3);

}

void sub_10000CCB4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
  objc_msgSend(v2, "showCardForContact:animated:", *(_QWORD *)(a1 + 40), 0);

  if (objc_msgSend(*(id *)(a1 + 32), "isIPad"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactSplitViewController"));
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedContactViewController"));

    objc_msgSend(*(id *)(a1 + 32), "editAndScrollContactViewController:", v4);
  }
}

void sub_10000CFDC(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contactHeaderView"));

  if ((objc_opt_respondsToSelector(v3, "editButtonPressed") & 1) != 0)
    objc_msgSend(v3, "editButtonPressed");
  v4 = dispatch_time(0, 1000000000);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000D0B4;
  v7[3] = &unk_10001C538;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v7);

}

void sub_10000D0B4(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "photoView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "photoPicker"));
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionView"));

  objc_msgSend(*(id *)(a1 + 40), "performScrollTestWithScrollView:completionBlock:", v4, 0);
}

void sub_10000D420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D448(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "didShow:", v3);

}

id sub_10000D490(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "willStartTest");
  return objc_msgSend(*(id *)(a1 + 32), "startSearchQuery");
}

id sub_10000D668(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)UIApp;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName")));
  objc_msgSend(v2, "finishedSubTest:forTest:", CFSTR("Open Contact"), v4);

  return objc_msgSend(*(id *)(a1 + 32), "performSelector:", "showPseudoContactsListForIPhone");
}

id sub_10000D790(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  signed int v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v2 = (void *)UIApp;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName")));
  objc_msgSend(v2, "finishedSubTest:forTest:", CFSTR("Open Contact"), v4);

  LODWORD(v2) = objc_msgSend(*(id *)(a1 + 32), "nextContactIndex");
  if ((int)v2 < (int)objc_msgSend(*(id *)(a1 + 32), "maxContactIndex"))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "nextContactIndex");
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "contacts"));
    v7 = objc_msgSend(v6, "count");

    if ((unint64_t)v7 > v5)
      return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", "showNextContact", 0, 0.5);
  }
  v8 = (void *)UIApp;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("testName")));
  objc_msgSend(v8, "finishedTest:", v10);

  v11 = *(void **)(a1 + 32);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000D900;
  v13[3] = &unk_10001C488;
  v13[4] = v11;
  return objc_msgSend(v11, "showContactListWithCompletionBlock:", v13);
}

void sub_10000D900(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contactListViewController"));
  objc_msgSend(v1, "cancelSearch:", 0);

}

void sub_10000DA44(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  v2 = (void *)UIApp;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", CFSTR("time")));
  objc_msgSend(v2, "startedSubTest:forTest:withMetrics:", CFSTR("Open Contact"), v4, v5);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000DBA0;
  v8[3] = &unk_10001C488;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(UIApp, "installCACommitCompletionBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
  objc_msgSend(v6, "showCardForContact:animated:", *(_QWORD *)(a1 + 40), 1);

  objc_msgSend(*(id *)(a1 + 32), "setNextContactIndex:", objc_msgSend(*(id *)(a1 + 32), "nextContactIndex") + 1);
  if (objc_msgSend(*(id *)(a1 + 32), "isIPad"))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000DC0C;
    v7[3] = &unk_10001C488;
    v7[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

void sub_10000DBA0(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = (void *)UIApp;
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName")));
  objc_msgSend(v1, "finishedSubTest:forTest:", CFSTR("Open Contact"), v2);

}

id sub_10000DC0C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSelector:", "iterateContact");
}

void sub_10000DD10(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = (void *)UIApp;
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName")));
  objc_msgSend(v1, "finishedSubTest:forTest:", CFSTR("Close Contact"), v2);

}

void sub_10000DE48(uint64_t a1)
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000DEA4;
  block[3] = &unk_10001C488;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000DEA4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showNextContact");
}

id sub_10000E12C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startSearchQueryWithOptions:", *(_QWORD *)(a1 + 40));
}

void sub_10000E1E4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contactListViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResultsController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));

  v6 = dispatch_time(0, 1000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000E2C8;
  v8[3] = &unk_10001C538;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);

}

id sub_10000E2C8(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000E320;
  v4[3] = &unk_10001C488;
  v4[4] = v2;
  return objc_msgSend(v2, "performScrollTestWithScrollView:completionBlock:", v1, v4);
}

void sub_10000E320(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contactListViewController"));
  objc_msgSend(v1, "cancelSearch:", 0);

}

void sub_10000E4B4(id a1)
{
  ContactsTestingManager *v1;
  void *v2;

  v1 = objc_alloc_init(ContactsTestingManager);
  v2 = (void *)qword_100025B90;
  qword_100025B90 = (uint64_t)v1;

}

void sub_10000E84C(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD block[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "iteration");
  if (v2 >= objc_msgSend(*(id *)(a1 + 32), "maxIterations"))
  {
    v9 = (void *)UIApp;
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("testName")));
    objc_msgSend(v9, "finishedTest:", v10);

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contacts"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "iteration")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
    objc_msgSend(v7, "showCardForContact:animated:", v6, 0);

    objc_msgSend(*(id *)(a1 + 32), "setIteration:", (char *)objc_msgSend(*(id *)(a1 + 32), "iteration") + 1);
    v8 = dispatch_time(0, 800000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000E9D8;
    block[3] = &unk_10001C488;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, block);

  }
}

void sub_10000E9D8(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactSplitViewController"));
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "presentedContactViewController"));

  objc_msgSend(*(id *)(a1 + 32), "measureEditingTransitionOnController:", v3);
}

id sub_10000EB3C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)UIApp;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "testOptions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("testName")));
  objc_msgSend(v2, "finishedSubTest:forTest:", CFSTR("Edit Contact Transition"), v4);

  return objc_msgSend(*(id *)(a1 + 32), "performSelector:withObject:afterDelay:", "showNextContact", 0, 1.0);
}

id sub_10000ED54(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000EDA8;
  v3[3] = &unk_10001C488;
  v3[4] = v1;
  return objc_msgSend(v1, "startSearchQueryWithCompletionBlock:", v3);
}

void sub_10000EDA8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contactListViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchResultsController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionView"));

  v6 = dispatch_time(0, 1000000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000EE8C;
  v8[3] = &unk_10001C538;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);

}

id sub_10000EE8C(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000EEE4;
  v4[3] = &unk_10001C488;
  v4[4] = v2;
  return objc_msgSend(v2, "performScrollTestWithScrollView:completionBlock:", v1, v4);
}

void sub_10000EEE4(uint64_t a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "contactNavigationController"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "contactListViewController"));
  objc_msgSend(v1, "cancelSearch:", 0);

}

void sub_10000F0D0(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "scheme"));
  v5 = 138412546;
  v6 = v4;
  v7 = 2112;
  v8 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error: Unexpected scheme '%@' sent in URL %@.", (uint8_t *)&v5, 0x16u);

}

void sub_10000F17C()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000064B4();
  sub_1000064A0((void *)&_mh_execute_header, v0, v1, "Unknown reference '%@' sent in URL %@.");
}

void sub_10000F1E0()
{
  uint64_t v0;
  os_log_t v1;

  sub_1000064B4();
  sub_1000064A0((void *)&_mh_execute_header, v0, v1, "Unknown type '%@' sent in URL %@.");
}

void sub_10000F244(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "During -[AppDelegate application:willFinishLaunchingWithOptions:], the value for UIApplicationLaunchOptionsSearchResultIdentifierKey was expected to be an NSString representating a contact's identifier, but instead it is %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000F2B8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error in Recap Test: Recap is not available", v1, 2u);
}

void sub_10000F2F8(void *a1, NSObject *a2)
{
  void *v4;
  NSString *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  CGRect v11;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "coordinateSpace"));
  objc_msgSend(v4, "bounds");
  v5 = NSStringFromCGRect(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "scene:%@ willConnectToSession: with bounds: %@", (uint8_t *)&v7, 0x16u);

}

void sub_10000F3B8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "received unknown shortcut item type: %@", (uint8_t *)&v2, 0xCu);
  sub_10000C9C8();
}

void sub_10000F428(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;

  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "error fetching contact with identifier %@: %@", (uint8_t *)&v3, 0x16u);
  sub_10000C9C8();
}

void sub_10000F4A8(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;

  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "error fetching contact with legacy identifier %d: %@", (uint8_t *)v3, 0x12u);
  sub_10000C9C8();
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "CGRectValue");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLContexts");
}

id objc_msgSend__allowingMutationsInDelegateCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_allowingMutationsInDelegateCallback:");
}

id objc_msgSend__cn_addNonNilObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cn_addNonNilObject:");
}

id objc_msgSend__cn_each_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cn_each:");
}

id objc_msgSend__cn_filter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cn_filter:");
}

id objc_msgSend__cn_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cn_firstObjectPassingTest:");
}

id objc_msgSend__cn_flatMap_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cn_flatMap:");
}

id objc_msgSend__isCollapsed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isCollapsed");
}

id objc_msgSend__isKeyWindowScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isKeyWindowScene");
}

id objc_msgSend__launchTestName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_launchTestName");
}

id objc_msgSend__performScrollTest_iterations_delta_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performScrollTest:iterations:delta:length:");
}

id objc_msgSend__performScrollTest_iterations_delta_length_scrollAxis_extraResultsBlock_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_performScrollTest:iterations:delta:length:scrollAxis:extraResultsBlock:completionBlock:");
}

id objc_msgSend__selfReallyRespondsToSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_selfReallyRespondsToSelector:");
}

id objc_msgSend_accountsAndGroupsViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accountsAndGroupsViewController");
}

id objc_msgSend_actionFound(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionFound");
}

id objc_msgSend_actionsDelayedUntilSceneInitialization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionsDelayedUntilSceneInitialization");
}

id objc_msgSend_activationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationState");
}

id objc_msgSend_activityRestorer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityRestorer");
}

id objc_msgSend_activityRestorerDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityRestorerDelegate");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activityType");
}

id objc_msgSend_addContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addContact:");
}

id objc_msgSend_addContact_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addContact:animated:");
}

id objc_msgSend_addKeyCommand_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addKeyCommand:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_afterDelay_performBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "afterDelay:performBlock:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allSearchQueries(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allSearchQueries");
}

id objc_msgSend_animate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animate");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "anyObject");
}

id objc_msgSend_application(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "application");
}

id objc_msgSend_areAllLaunchTasksComplete(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "areAllLaunchTasksComplete");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_backgroundScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundScheduler");
}

id objc_msgSend_beginSearch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginSearch:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundle");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_canPerformAction_withSender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canPerformAction:withSender:");
}

id objc_msgSend_cancelSearch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelSearch");
}

id objc_msgSend_cancelSearch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelSearch:");
}

id objc_msgSend_capabilitiesManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capabilitiesManager");
}

id objc_msgSend_checkForFacebookContactsWithDelay_allowAlert_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkForFacebookContactsWithDelay:allowAlert:");
}

id objc_msgSend_checkInLaunchTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInLaunchTasks:");
}

id objc_msgSend_checkInLaunchTasksIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInLaunchTasksIfNecessary");
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "childViewControllers");
}

id objc_msgSend_clearMapsDataIfEdited(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearMapsDataIfEdited");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "collectionView");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedScenes");
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contact");
}

id objc_msgSend_contactContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactContainer");
}

id objc_msgSend_contactFormatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactFormatter");
}

id objc_msgSend_contactHeaderView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactHeaderView");
}

id objc_msgSend_contactListViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactListViewController");
}

id objc_msgSend_contactNavigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactNavigationController");
}

id objc_msgSend_contactSplitViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactSplitViewController");
}

id objc_msgSend_contactStoreDataSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactStoreDataSource");
}

id objc_msgSend_contactStoreFilterFromPreferencesWithContactStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactStoreFilterFromPreferencesWithContactStore:");
}

id objc_msgSend_contactStyleDefaultBackgroundColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactStyleDefaultBackgroundColor");
}

id objc_msgSend_contactView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactView");
}

id objc_msgSend_contactViewIsCovered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactViewIsCovered");
}

id objc_msgSend_contacts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contacts");
}

id objc_msgSend_contactsApplicationTintColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactsApplicationTintColor");
}

id objc_msgSend_contactsList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactsList");
}

id objc_msgSend_contactsSplitViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contactsSplitViewController");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentViewController");
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "convertRect:fromView:");
}

id objc_msgSend_coordinateSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinateSpace");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_createNewContact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createNewContact");
}

id objc_msgSend_createShowMeCardApplicationShortcutIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createShowMeCardApplicationShortcutIfNecessary");
}

id objc_msgSend_createUserActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createUserActivity");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentEnvironment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentEnvironment");
}

id objc_msgSend_currentQueryIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentQueryIndex");
}

id objc_msgSend_currentSnapshot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSnapshot");
}

id objc_msgSend_currentTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentTest");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataSource");
}

id objc_msgSend_defaultCapabilitiesManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCapabilitiesManager");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultSchedulerProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSchedulerProvider");
}

id objc_msgSend_defaultTestingManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultTestingManager");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_delegateWithDelegate_willShowViewControllerHandler_didShowViewControllerHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegateWithDelegate:willShowViewControllerHandler:didShowViewControllerHandler:");
}

id objc_msgSend_deleteContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deleteContact:");
}

id objc_msgSend_descriptorForRequiredKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptorForRequiredKeys");
}

id objc_msgSend_descriptorForRequiredKeysForPreferredForNameMeContact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptorForRequiredKeysForPreferredForNameMeContact");
}

id objc_msgSend_deselectAllSelectedIndexPathsAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deselectAllSelectedIndexPathsAnimated:");
}

id objc_msgSend_deselectContactAndSelectNext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deselectContactAndSelectNext:");
}

id objc_msgSend_deselectItemAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deselectItemAtIndexPath:animated:");
}

id objc_msgSend_detailViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detailViewController");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_didExecuteSceneInitializationTasks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didExecuteSceneInitializationTasks");
}

id objc_msgSend_didShow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didShow");
}

id objc_msgSend_didShow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didShow:");
}

id objc_msgSend_disableCompatiblityWorkaround(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableCompatiblityWorkaround");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayContactIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayContactIfNecessary");
}

id objc_msgSend_displayMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayMode");
}

id objc_msgSend_displayedContact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayedContact");
}

id objc_msgSend_editAndScrollContactViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "editAndScrollContactViewController:");
}

id objc_msgSend_editButtonPressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "editButtonPressed");
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endEditing:");
}

id objc_msgSend_enqueueContactsAtURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueueContactsAtURL:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_executeActionDelayedUntilSceneInitialization_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeActionDelayedUntilSceneInitialization:");
}

id objc_msgSend_executeSceneInitializationTasksOnce_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeSceneInitializationTasksOnce:");
}

id objc_msgSend_executeShortcutIfNecessary_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeShortcutIfNecessary:completionHandler:");
}

id objc_msgSend_extraResults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extraResults");
}

id objc_msgSend_finishedSubTest_forTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedSubTest:forTest:");
}

id objc_msgSend_finishedTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedTest:");
}

id objc_msgSend_finishedTest_extraResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishedTest:extraResults:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_globalIndexForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "globalIndexForItemAtIndexPath:");
}

id objc_msgSend_groupsPanelIsHidden(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupsPanelIsHidden");
}

id objc_msgSend_hasForceTouchCapability(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasForceTouchCapability");
}

id objc_msgSend_hideColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hideColumn:");
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "horizontalSizeClass");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_iconWithContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconWithContact:");
}

id objc_msgSend_identifierFound(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierFound");
}

id objc_msgSend_identifierFromShowCommandURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifierFromShowCommandURL:");
}

id objc_msgSend_indexPathForContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForContact:");
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForItem:inSection:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexPathsForSelectedItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathsForSelectedItems");
}

id objc_msgSend_initWithApplication_capabilitiesManager_schedulerProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithApplication:capabilitiesManager:schedulerProvider:");
}

id objc_msgSend_initWithCapabilitiesManager_mainBundle_schedulerProvider_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapabilitiesManager:mainBundle:schedulerProvider:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithContactStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContactStore:");
}

id objc_msgSend_initWithContactStore_presentationDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContactStore:presentationDelegate:");
}

id objc_msgSend_initWithContactsSplitViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContactsSplitViewController:");
}

id objc_msgSend_initWithDataSource_contactFormatter_applyGroupFilterFromPreferences_environment_allowsLargeTitles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDataSource:contactFormatter:applyGroupFilterFromPreferences:environment:allowsLargeTitles:");
}

id objc_msgSend_initWithDataSource_environment_allowsLargeTitles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDataSource:environment:allowsLargeTitles:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithStore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStore:");
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStyle:");
}

id objc_msgSend_initWithTestName_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTestName:scrollView:completionHandler:");
}

id objc_msgSend_initWithType_localizedTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:localizedTitle:");
}

id objc_msgSend_initWithURL_dataSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:dataSource:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_installCACommitCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installCACommitCompletionBlock:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isCollapsed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCollapsed");
}

id objc_msgSend_isDisplayingAddNewContactViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDisplayingAddNewContactViewController");
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEditing");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFileURL");
}

id objc_msgSend_isIPad(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIPad");
}

id objc_msgSend_isRecap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRecap");
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRecapAvailable");
}

id objc_msgSend_isSearching(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSearching");
}

id objc_msgSend_isSetupFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSetupFinished");
}

id objc_msgSend_isShowingGroups(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isShowingGroups");
}

id objc_msgSend_isShowingListView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isShowingListView");
}

id objc_msgSend_isValidIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidIndexPath:");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "item");
}

id objc_msgSend_iteration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iteration");
}

id objc_msgSend_iterations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iterations");
}

id objc_msgSend_keyCommandWithInput_modifierFlags_action_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyCommandWithInput:modifierFlags:action:");
}

id objc_msgSend_lastSearchBeginTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastSearchBeginTime");
}

id objc_msgSend_launchCheckinRegistrar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchCheckinRegistrar");
}

id objc_msgSend_legacyIdentifierFound(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "legacyIdentifierFound");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_log(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log");
}

id objc_msgSend_logPresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logPresentation");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainSceneDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainSceneDelegate");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_maxContactIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxContactIndex");
}

id objc_msgSend_maxIterations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxIterations");
}

id objc_msgSend_measureEditingTransitionOnController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "measureEditingTransitionOnController:");
}

id objc_msgSend_multitaskingDragExclusionRects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "multitaskingDragExclusionRects");
}

id objc_msgSend_navControllerDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navControllerDelegate");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationControllerForPPT(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationControllerForPPT");
}

id objc_msgSend_navigationControllerForPotentiallyWrappedViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "navigationControllerForPotentiallyWrappedViewController:");
}

id objc_msgSend_newContactFormatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newContactFormatter");
}

id objc_msgSend_newContactStoreDataSourceForSplitViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newContactStoreDataSourceForSplitViewController");
}

id objc_msgSend_nextContactIndex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextContactIndex");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openContactsURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openContactsURL:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_performMigrationOfFacebookContactsToLocalStoreIfNecessary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performMigrationOfFacebookContactsToLocalStoreIfNecessary");
}

id objc_msgSend_performScrollTestWithScrollView_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performScrollTestWithScrollView:completionBlock:");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performWithoutAnimation:");
}

id objc_msgSend_photoPicker(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoPicker");
}

id objc_msgSend_photoView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "photoView");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_potentiallyPresentedDetailViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "potentiallyPresentedDetailViewController");
}

id objc_msgSend_predicateForLegacyIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateForLegacyIdentifier:");
}

id objc_msgSend_preferredForNameMeContact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredForNameMeContact");
}

id objc_msgSend_preferredForNameMeContactIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredForNameMeContactIdentifier");
}

id objc_msgSend_preferredForNameMeContactWithKeysToFetch_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preferredForNameMeContactWithKeysToFetch:");
}

id objc_msgSend_prepareForNextTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForNextTest");
}

id objc_msgSend_prepareForTestWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForTestWithOptions:");
}

id objc_msgSend_presentOnboardingFlowIfNeededForMode_fromViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentOnboardingFlowIfNeededForMode:fromViewController:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedContactViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedContactViewController");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_prewarmContactStoreDataSourceBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prewarmContactStoreDataSourceBlock");
}

id objc_msgSend_prewarmContactStoreDataSourceSnapshotBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prewarmContactStoreDataSourceSnapshotBlock");
}

id objc_msgSend_prewarmResourcesForLaunch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prewarmResourcesForLaunch");
}

id objc_msgSend_prewarmedContactStoreDataSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prewarmedContactStoreDataSource");
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "query");
}

id objc_msgSend_queryString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryString");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_readURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readURL:");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeContactViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeContactViewController");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_resetDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetDelegate");
}

id objc_msgSend_resourcesPrewarmingQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resourcesPrewarmingQueue");
}

id objc_msgSend_restorableActivityTypes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restorableActivityTypes");
}

id objc_msgSend_restoreUserActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreUserActivity:");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "row");
}

id objc_msgSend_runTest_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTest:options:");
}

id objc_msgSend_runTest_options_splitViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTest:options:splitViewController:");
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runTestWithParameters:");
}

id objc_msgSend_saveChanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveChanges");
}

id objc_msgSend_saveEditingViewControllersAndDismissViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveEditingViewControllersAndDismissViewController:");
}

id objc_msgSend_saveModelChangesToContact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveModelChangesToContact");
}

id objc_msgSend_sceneWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sceneWindow");
}

id objc_msgSend_schedulerProvider(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "schedulerProvider");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_scrollContactViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollContactViewController:");
}

id objc_msgSend_scrollToContact_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scrollToContact:animated:");
}

id objc_msgSend_searchForString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchForString:");
}

id objc_msgSend_searchForString_animated_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchForString:animated:completionBlock:");
}

id objc_msgSend_searchResultIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchResultIdentifier");
}

id objc_msgSend_searchResultsController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "searchResultsController");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "section");
}

id objc_msgSend_selectContact_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectContact:animated:scrollPosition:");
}

id objc_msgSend_selectItemAtIndexPath_animated_scrollPosition_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectItemAtIndexPath:animated:scrollPosition:");
}

id objc_msgSend_selectNextContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectNextContact:");
}

id objc_msgSend_selectPreviousContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectPreviousContact:");
}

id objc_msgSend_selectedIndexPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedIndexPath");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setAllSearchQueries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllSearchQueries:");
}

id objc_msgSend_setAllowsCardDeletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsCardDeletion:");
}

id objc_msgSend_setAllowsCardEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsCardEditing:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAnimate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAnimate:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCellStateSelected_forContact_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCellStateSelected:forContact:animated:");
}

id objc_msgSend_setContactFormatter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContactFormatter:");
}

id objc_msgSend_setContactNavigationController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContactNavigationController:");
}

id objc_msgSend_setContactSplitViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContactSplitViewController:");
}

id objc_msgSend_setCurrentQueryIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentQueryIndex:");
}

id objc_msgSend_setCurrentTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentTest:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDidExecuteSceneInitializationTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidExecuteSceneInitializationTasks:");
}

id objc_msgSend_setDidShow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDidShow:");
}

id objc_msgSend_setDiscoverabilityTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoverabilityTitle:");
}

id objc_msgSend_setDisplayedContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDisplayedContact:");
}

id objc_msgSend_setEditing_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEditing:animated:");
}

id objc_msgSend_setExtraResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtraResults:");
}

id objc_msgSend_setFilter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFilter:");
}

id objc_msgSend_setFrameStallSkipRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrameStallSkipRequest:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHideGroupsButton_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHideGroupsButton:");
}

id objc_msgSend_setIcon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIcon:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIncludeDonatedContacts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludeDonatedContacts:");
}

id objc_msgSend_setIncludeLocalContacts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludeLocalContacts:");
}

id objc_msgSend_setIncludeSuggestedContacts_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludeSuggestedContacts:");
}

id objc_msgSend_setIsIPad_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsIPad:");
}

id objc_msgSend_setIteration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIteration:");
}

id objc_msgSend_setIterations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIterations:");
}

id objc_msgSend_setLastSearchBeginTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastSearchBeginTime:");
}

id objc_msgSend_setLaunchCheckinRegistrar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLaunchCheckinRegistrar:");
}

id objc_msgSend_setLegacyIdenifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLegacyIdenifier:");
}

id objc_msgSend_setMaxContactIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxContactIndex:");
}

id objc_msgSend_setMaxIterations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxIterations:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setNavControllerDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavControllerDelegate:");
}

id objc_msgSend_setNextContactIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNextContactIndex:");
}

id objc_msgSend_setOnboardingController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOnboardingController:");
}

id objc_msgSend_setPotentiallyPresentedDetailViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPotentiallyPresentedDetailViewController:");
}

id objc_msgSend_setPreferredDisplayMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreferredDisplayMode:");
}

id objc_msgSend_setPrefersLargeTitles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrefersLargeTitles:");
}

id objc_msgSend_setPresentsWithGesture_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPresentsWithGesture:");
}

id objc_msgSend_setQueryString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryString:");
}

id objc_msgSend_setRestorationIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRestorationIdentifier:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setSceneWindow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSceneWindow:");
}

id objc_msgSend_setSelectedIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectedIndexPath:");
}

id objc_msgSend_setShortcutItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShortcutItems:");
}

id objc_msgSend_setShouldDisplayMeContactBanner_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDisplayMeContactBanner:");
}

id objc_msgSend_setShouldRevalidateFilterOnStoreChange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldRevalidateFilterOnStoreChange:");
}

id objc_msgSend_setTestOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestOptions:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTotalIterations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTotalIterations:");
}

id objc_msgSend_setUseInProcessMapperExclusively_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseInProcessMapperExclusively:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setViewController_forColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewController:forColumn:");
}

id objc_msgSend_setViewingContactActivityForRestoration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewingContactActivityForRestoration:");
}

id objc_msgSend_setWantsPriorityOverSystemBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWantsPriorityOverSystemBehavior:");
}

id objc_msgSend_setWillShow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWillShow:");
}

id objc_msgSend_setup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setup");
}

id objc_msgSend_setupAppIntentDependenciesWithActionPerformer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupAppIntentDependenciesWithActionPerformer:");
}

id objc_msgSend_setupColumns(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupColumns");
}

id objc_msgSend_setupContainerController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupContainerController");
}

id objc_msgSend_setupGroupsNavigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupGroupsNavigationController");
}

id objc_msgSend_setupKeyCommands(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupKeyCommands");
}

id objc_msgSend_setupNavigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupNavigationController");
}

id objc_msgSend_setupPrimaryColumnViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupPrimaryColumnViewController");
}

id objc_msgSend_setupSplitViewControllerProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupSplitViewControllerProperties");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedCollector(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCollector");
}

id objc_msgSend_shortcutItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shortcutItem");
}

id objc_msgSend_shouldDisplayListHeaderView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldDisplayListHeaderView");
}

id objc_msgSend_shouldEnableActivityIndicatorWhenRestoringUserActivityWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldEnableActivityIndicatorWhenRestoringUserActivityWithType:");
}

id objc_msgSend_shouldMakeUIForDefaultPNG(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldMakeUIForDefaultPNG");
}

id objc_msgSend_shouldShowAccountsAndGroups(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowAccountsAndGroups");
}

id objc_msgSend_shouldShowOnboarding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowOnboarding");
}

id objc_msgSend_showCardForContact_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showCardForContact:animated:");
}

id objc_msgSend_showCardForContact_fallbackToFirstContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showCardForContact:fallbackToFirstContact:");
}

id objc_msgSend_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:");
}

id objc_msgSend_showCardForContact_resetFilter_resetSearch_fallbackToFirstContact_scrollToContact_animated_dismissingPresentedController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showCardForContact:resetFilter:resetSearch:fallbackToFirstContact:scrollToContact:animated:dismissingPresentedController:");
}

id objc_msgSend_showColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showColumn:");
}

id objc_msgSend_showContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showContact:");
}

id objc_msgSend_showContact_setEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showContact:setEditing:");
}

id objc_msgSend_showContactDetailViewController_sender_animated_dismissingPresentedController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showContactDetailViewController:sender:animated:dismissingPresentedController:");
}

id objc_msgSend_showContactFromURLReader_setEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showContactFromURLReader:setEditing:");
}

id objc_msgSend_showContactList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showContactList");
}

id objc_msgSend_showContactListWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showContactListWithCompletionBlock:");
}

id objc_msgSend_showContactWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showContactWithIdentifier:");
}

id objc_msgSend_showContactWithIdentifier_setEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showContactWithIdentifier:setEditing:");
}

id objc_msgSend_showContactWithLegacyIdentifier_setEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showContactWithLegacyIdentifier:setEditing:");
}

id objc_msgSend_showDetailViewController_sender_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showDetailViewController:sender:");
}

id objc_msgSend_showEditingCardForContact_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showEditingCardForContact:");
}

id objc_msgSend_showGroupsAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showGroupsAnimated:");
}

id objc_msgSend_showMeCardShortcutItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showMeCardShortcutItem");
}

id objc_msgSend_showMeContact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showMeContact");
}

id objc_msgSend_showNewContact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showNewContact");
}

id objc_msgSend_showNextContact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showNextContact");
}

id objc_msgSend_splitViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "splitViewController");
}

id objc_msgSend_splitViewControllerIsDisplayingList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "splitViewControllerIsDisplayingList");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startSearchQueryWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startSearchQueryWithCompletionBlock:");
}

id objc_msgSend_startedSubTest_forTest_withMetrics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startedSubTest:forTest:withMetrics:");
}

id objc_msgSend_startedTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startedTest:");
}

id objc_msgSend_stateRestorationActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateRestorationActivity");
}

id objc_msgSend_statusBar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusBar");
}

id objc_msgSend_store(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "store");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_suggestionsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suggestionsEnabled");
}

id objc_msgSend_testOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testOptions");
}

id objc_msgSend_testWithSplitViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testWithSplitViewController:");
}

id objc_msgSend_toggleEditing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "toggleEditing:");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topViewController");
}

id objc_msgSend_totalIterations(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalIterations");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_transitionCoordinator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "transitionCoordinator");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unifiedContactWithIdentifier_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unifiedContactWithIdentifier:keysToFetch:error:");
}

id objc_msgSend_unifiedContactsMatchingPredicate_keysToFetch_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unifiedContactsMatchingPredicate:keysToFetch:error:");
}

id objc_msgSend_updateModeOnSplitViewControllerForDisplayMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateModeOnSplitViewControllerForDisplayMode:");
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userActivities");
}

id objc_msgSend_userActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userActivity");
}

id objc_msgSend_userActivityRepresentingCurrentlyDisplayedContact(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userActivityRepresentingCurrentlyDisplayedContact");
}

id objc_msgSend_userActivityRepresentingGroupsView(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userActivityRepresentingGroupsView");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_vCardImportController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vCardImportController");
}

id objc_msgSend_valueWithBytes_objCType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithBytes:objCType:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllerForColumn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerForColumn:");
}

id objc_msgSend_viewingContactActivityForRestoration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewingContactActivityForRestoration");
}

id objc_msgSend_visibleViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "visibleViewController");
}

id objc_msgSend_willShow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willShow");
}

id objc_msgSend_willStartTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willStartTest");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "window");
}
