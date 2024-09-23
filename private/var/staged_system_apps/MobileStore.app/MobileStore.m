uint64_t start(int a1, char **a2)
{
  void *v4;

  v4 = objc_autoreleasePoolPush();
  +[SUUIApplicationController prepareForLaunch](SUUIApplicationController, "prepareForLaunch");
  UIApplicationMain(a1, a2, CFSTR("MSApplication"), CFSTR("MSApplicationDelegate"));
  objc_autoreleasePoolPop(v4);
  return 0;
}

void sub_1000017C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100001AD4(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  NSObject *v9;
  id WeakRetained;
  id v11;
  uint64_t v12;
  void *v13;
  _BYTE v14[24];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig"));
  v7 = objc_msgSend(v6, "shouldLog");
  if (objc_msgSend(v6, "shouldLogToDisk"))
    LODWORD(v8) = v7 | 2;
  else
    LODWORD(v8) = v7;
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "OSLogObject"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    v8 = v8;
  else
    v8 &= 2u;
  if (a2)
  {
    if ((_DWORD)v8)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      *(_DWORD *)v14 = 138543362;
      *(_QWORD *)&v14[4] = objc_opt_class();
      v11 = *(id *)&v14[4];
      v12 = _os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v9, 0, "%{public}@: Authorization granted", v14, 12, *(_QWORD *)v14, *(_QWORD *)&v14[8], *(_QWORD *)&v14[16]);
      goto LABEL_12;
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!(_DWORD)v8)
    goto LABEL_14;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  *(_DWORD *)v14 = 138543618;
  *(_QWORD *)&v14[4] = objc_opt_class();
  *(_WORD *)&v14[12] = 2114;
  *(_QWORD *)&v14[14] = v5;
  v11 = *(id *)&v14[4];
  v12 = _os_log_send_and_compose_impl(v8, 0, 0, 0, &_mh_execute_header, v9, 0, "%{public}@: Failed to aquire authorization. Error: %{public}@", v14, 22, *(_QWORD *)v14, *(_QWORD *)&v14[8], *(_QWORD *)&v14[16]);
LABEL_12:
  v13 = (void *)v12;

  if (v13)
  {
    v9 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v13, 4));
    free(v13);
    SSFileLog(v6, CFSTR("%@"));
    goto LABEL_14;
  }
LABEL_15:

}

id sub_100002BE8(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  if (v2)
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:inTable:", a2, SUUILocalizedStringTableTabBar));
  else
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SUUIClientContext localizedStringForKey:inBundles:inTable:](SUUIClientContext, "localizedStringForKey:inBundles:inTable:", a2, 0, SUUILocalizedStringTableTabBar));
  return v3;
}

UIColor *sub_100002C38()
{
  return +[UIColor systemBlueColor](UIColor, "systemBlueColor");
}

void sub_100002F1C(id a1)
{
  MSQuickActionController *v1;
  void *v2;

  v1 = objc_alloc_init(MSQuickActionController);
  v2 = (void *)qword_100011E08;
  qword_100011E08 = (uint64_t)v1;

}

void sub_100003174(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  _QWORD v26[4];
  _QWORD v27[2];
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lowercaseString"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "tabBarController"));
  v5 = v4;
  if (v4)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = sub_1000034E4;
    v35 = sub_1000034F4;
    v36 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectedViewController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.MobileStore.search"), "lowercaseString"));
    v7 = objc_msgSend(v3, "isEqualToString:", v6);

    if (v7)
    {
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_1000034FC;
      v28[3] = &unk_10000C498;
      v8 = &v29;
      v29 = *(id *)(a1 + 40);
      v30 = v5;
      v9 = objc_retainBlock(v28);
      v10 = v30;
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.MobileStore.redeem"), "lowercaseString"));
      v13 = objc_msgSend(v3, "isEqualToString:", v12);

      if (v13)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_100003660;
        v26[3] = &unk_10000C4C0;
        v8 = (id *)v27;
        v27[0] = *(id *)(a1 + 40);
        v27[1] = &v31;
        v9 = objc_retainBlock(v26);
LABEL_9:

        if (v9)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v32[5], "presentedViewController"));

          if (v14)
            objc_msgSend((id)v32[5], "dismissViewControllerAnimated:completion:", 0, v9);
          else
            ((void (*)(_QWORD *))v9[2])(v9);
        }
        goto LABEL_18;
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.MobileStore.viewdownloads"), "lowercaseString"));
      v16 = objc_msgSend(v3, "isEqualToString:", v15);

      if (v16)
      {
        v23[0] = _NSConcreteStackBlock;
        v23[1] = 3221225472;
        v23[2] = sub_100003714;
        v23[3] = &unk_10000C498;
        v8 = &v24;
        v24 = *(id *)(a1 + 40);
        v25 = v5;
        v9 = objc_retainBlock(v23);
        v10 = v25;
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("com.apple.MobileStore.purchased"), "lowercaseString"));
        v18 = objc_msgSend(v3, "isEqualToString:", v17);

        if (!v18)
        {
          v9 = 0;
LABEL_18:
          v19 = *(_QWORD *)(a1 + 48);
          if (v19)
            (*(void (**)(uint64_t, uint64_t))(v19 + 16))(v19, 1);

          _Block_object_dispose(&v31, 8);
          goto LABEL_21;
        }
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1000038E8;
        v20[3] = &unk_10000C498;
        v8 = &v21;
        v21 = *(id *)(a1 + 40);
        v22 = v5;
        v9 = objc_retainBlock(v20);
        v10 = v22;
      }
    }

    goto LABEL_9;
  }
  v11 = *(_QWORD *)(a1 + 48);
  if (v11)
    (*(void (**)(uint64_t, _QWORD))(v11 + 16))(v11, 0);
LABEL_21:

}

void sub_1000034CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000034E4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000034F4(uint64_t a1)
{

}

void sub_1000034FC(uint64_t a1)
{
  id v2;
  _QWORD block[4];
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "selectTabWithIdentifier:", CFSTR("search"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003588;
  block[3] = &unk_10000C470;
  v4 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_100003588(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "selectedNavigationController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "viewControllers"));
  v4 = objc_msgSend(v3, "count");

  if ((unint64_t)v4 >= 2)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "selectedNavigationController"));
    v6 = objc_msgSend(v5, "popToRootViewControllerAnimated:", 0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "selectedNavigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "viewControllers"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  objc_msgSend(v9, "_setMakeSearchBarFirstResponderOnLoad:", 1);
  objc_msgSend(v9, "_setSelectSearchBarContentOnBecomingFirstResponder:", 1);
  objc_msgSend(v9, "_reloadNavigationBarController");

}

void sub_100003660(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeAccount"));

  if ((objc_msgSend(v5, "isManagedAppleID") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "clientContext"));
    v4 = objc_msgSend(objc_alloc((Class)SUUIRedeemViewController), "initWithRedeemCategory:", 0);
    objc_msgSend(v4, "setClientContext:", v3);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "presentViewController:animated:completion:", v4, 0, 0);

  }
}

void sub_100003714(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "selectTabWithIdentifier:", CFSTR("downloads")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "moreNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "allViewControllers"));
  v5 = objc_msgSend(v4, "indexOfObject:", v2);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "allViewControllers"));
  v7 = objc_msgSend(v6, "indexOfObject:", v3);

  if (v5 > v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000381C;
    v8[3] = &unk_10000C498;
    v9 = v3;
    v10 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  }
}

void sub_10000381C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "topViewController"));
  v3 = objc_opt_class(UIMoreListController, v2);
  if ((objc_opt_isKindOfClass(v9, v3) & 1) != 0)
  {
    v4 = v9;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "moreViewControllers"));
    v6 = objc_msgSend(v5, "indexOfObject:", *(_QWORD *)(a1 + 40));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "table"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
    objc_msgSend(v4, "tableView:didSelectRowAtIndexPath:", v7, v8);

  }
}

void sub_1000038E8(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "selectTabWithIdentifier:", CFSTR("purchased")));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "moreNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "allViewControllers"));
  v5 = objc_msgSend(v4, "indexOfObject:", v2);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "allViewControllers"));
  v7 = objc_msgSend(v6, "indexOfObject:", v3);

  if (v5 > v7)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000039F0;
    v8[3] = &unk_10000C498;
    v9 = v3;
    v10 = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  }
}

void sub_1000039F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "topViewController"));
  v3 = objc_opt_class(UIMoreListController, v2);
  if ((objc_opt_isKindOfClass(v9, v3) & 1) != 0)
  {
    v4 = v9;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "moreViewControllers"));
    v6 = objc_msgSend(v5, "indexOfObject:", *(_QWORD *)(a1 + 40));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "table"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
    objc_msgSend(v4, "tableView:didSelectRowAtIndexPath:", v7, v8);

  }
}

void sub_100003C80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100003E38()
{
  if (qword_100011E20 != -1)
    dispatch_once(&qword_100011E20, &stru_10000C508);
  return qword_100011E18;
}

void sub_100003E78(id a1)
{
  qword_100011E18 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AppleAccountUI.framework/AppleAccountUI", 1);
}

uint64_t sub_100003EA0()
{
  if (qword_100011E30 != -1)
    dispatch_once(&qword_100011E30, &stru_10000C528);
  return qword_100011E28;
}

void sub_100003EE0(id a1)
{
  qword_100011E28 = (uint64_t)dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 1);
}

id sub_100003F08(NSString *a1, uint64_t a2)
{
  Class v2;

  if (!a2)
    return 0;
  v2 = NSClassFromString(a1);
  return (id)objc_claimAutoreleasedReturnValue(v2);
}

void *sub_100003F2C(char *__symbol, void *__handle)
{
  if (__handle)
    return dlsym(__handle, __symbol);
  else
    return 0;
}

void sub_100004248(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "tabIdentifier"));
  objc_msgSend(v2, "addObject:", v3);

}

void sub_100004674(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  id v7;
  _QWORD *v8;
  void *v9;
  id v10;
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "tabBarItems"));
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", &stru_10000C590);

  if ((((v3 == (id)0x7FFFFFFFFFFFFFFFLL) ^ objc_msgSend(*(id *)(a1 + 32), "_showsDownloadsTabForDownloadManager:", *(_QWORD *)(a1 + 40))) & 1) == 0)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "rootViewController"));
    v4 = *(void **)(a1 + 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    objc_msgSend(v5, "bounds");
    v7 = objc_msgSend(v4, "_tabBarStyleWithWidth:", v6);

    v8 = *(_QWORD **)(a1 + 32);
    v9 = (void *)v8[1];
    v10 = objc_msgSend(v8, "_newTabBarItemsWithStyle:", v7);
    objc_msgSend(v9, "updateTabBarWithItems:animated:", v10, 1);

  }
}

BOOL sub_100004760(id a1, SUUITabBarItem *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  unsigned __int8 v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SUUITabBarItem tabIdentifier](a2, "tabIdentifier", a3, a4));
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("downloads"));

  return v5;
}

void sub_100004B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004B88(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_showExternalURL:", *(_QWORD *)(a1 + 32));

}

void sub_100005064(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005080(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  +[MSQuickActionController processShortcutItem:applicationController:completionHandler:](MSQuickActionController, "processShortcutItem:applicationController:completionHandler:", *(_QWORD *)(a1 + 32), WeakRetained, *(_QWORD *)(a1 + 40));

}

void sub_10000514C(uint64_t a1, char a2)
{
  dispatch_time_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v4 = dispatch_time(0, 250000000);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000051F0;
  v8[3] = &unk_10000C608;
  v5 = *(id *)(a1 + 32);
  v12 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v9 = v5;
  v10 = v6;
  v11 = v7;
  dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, v8);

}

id sub_1000051F0(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if (objc_msgSend(*(id *)(a1 + 32), "applicationState"))
  {
    v2 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(a1 + 56))
    {
      *(_BYTE *)(v2 + 64) = 0;
    }
    else
    {
      *(_BYTE *)(v2 + 64) = 1;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "suspendApplicationWithOptions:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "clientContext"));
      objc_msgSend(v3, "setPurchaseReferrerURL:", 0);

      v4 = *(_QWORD *)(a1 + 40);
      v5 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = 0;

    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "endBackgroundTask:", *(_QWORD *)(a1 + 48));
}

void sub_1000052D4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 56);
  if (!v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v4, "setNetworkActivityIndicatorVisible:", 1);

    v1 = *(_QWORD *)(a1 + 32);
    v2 = *(_QWORD *)(v1 + 56);
  }
  *(_QWORD *)(v1 + 56) = v2 + 1;
}

void sub_100005384(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  dispatch_time_t v4;
  _QWORD block[5];

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 56);
  if (v2 < 2)
  {
    if (v2 == 1)
    {
      v4 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005420;
      block[3] = &unk_10000C470;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    *(_QWORD *)(v1 + 56) = v2 - 1;
  }
}

void sub_100005420(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(v1 + 56);
  if (v2 < 2)
  {
    if (v2 == 1)
    {
      *(_QWORD *)(v1 + 56) = 0;
      v3 = (id)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      objc_msgSend(v3, "setNetworkActivityIndicatorVisible:", 0);

    }
  }
  else
  {
    *(_QWORD *)(v1 + 56) = v2 - 1;
  }
}

void sub_1000055C8(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "windowScene"));
  +[SKStoreReviewController requestReviewInScene:](SKStoreReviewController, "requestReviewInScene:", v1);

}

void sub_100005654(id a1)
{
  id v1;
  void *v2;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[AMSSharedStoreReview createBagForSubProfile](AMSSharedStoreReview, "createBagForSubProfile"));
  v1 = objc_msgSend(objc_alloc((Class)AMSSharedStoreReview), "initWithBag:", v3);
  v2 = (void *)qword_100011E38;
  qword_100011E38 = (uint64_t)v1;

}

NSString *__cdecl sub_100005AFC(id a1, NSString *a2)
{
  NSString *v2;
  void *v3;
  void *v4;

  v2 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_10000C7F8, SUUILocalizedStringTableTabBar));

  return (NSString *)v4;
}

uint64_t sub_100005B6C(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "tabIdentifier"));
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  v9 = *(void **)(a1 + 32);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tabIdentifier"));

  v11 = objc_msgSend(v9, "indexOfObject:", v10);
  if ((uint64_t)v8 < (uint64_t)v11)
    return -1;
  else
    return (uint64_t)v8 > (uint64_t)v11;
}

void sub_100005CD4(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[1], "showExternalURL:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void sub_100005E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005E60(uint64_t a1, void *a2, void *a3)
{
  id *WeakRetained;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  char v13;
  char v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  BOOL v19;
  unsigned int v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  id *from;
  id *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  int has_internal_content;
  _QWORD v32[4];
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v29 = a2;
  v28 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    from = (id *)(a1 + 32);
    v26 = WeakRetained;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", SUUIConfigurationKeyTabs));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "objectForKey:", SUUIConfigurationKeyStopPages));
    has_internal_content = os_variant_has_internal_content("com.apple.MobileStore");
    v6 = 2;
    if (!v28 && v27)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("standard")));
      v8 = v7;
      if (v7)
        v9 = v7;
      else
        v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("compact")));
      v10 = v9;

      v11 = _os_feature_enabled_impl("MobileStore", "stop_page_respected_onboarding");
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v12 = v10;
      v13 = 0;
      v14 = 0;
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v15; i = (char *)i + 1)
          {
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(v12);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("id")));
            if (objc_msgSend(v18, "isEqualToString:", CFSTR("tv")))
            {
              if (v11)
              {
                if (has_internal_content
                  && (_os_feature_enabled_impl("MobileStore", "always_show_tv_stop_pages") & 1) != 0)
                {
                  v19 = 1;
                }
                else if (_os_feature_enabled_impl("MobileStore", "tv_stop_pages"))
                {
                  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("tv")));
                  v19 = v22 != 0;

                }
                else
                {
                  v19 = 0;
                }
                v14 = !v19;
              }
              else
              {
                v14 = 1;
              }
            }
            else
            {
              v20 = objc_msgSend(v18, "isEqualToString:", CFSTR("movies"));
              if (v20)
                v13 = 1;
              if ((v20 & v11) == 1)
              {
                if (has_internal_content
                  && (_os_feature_enabled_impl("MobileStore", "always_show_tv_stop_pages") & 1) != 0)
                {
                  v21 = 1;
                }
                else if (_os_feature_enabled_impl("MobileStore", "tv_stop_pages"))
                {
                  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("movies")));
                  v21 = v23 != 0;

                }
                else
                {
                  v21 = 0;
                }
                v13 = !v21;
              }
            }

          }
          v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v15);
      }

      if ((v13 & 1) != 0)
        v6 = 1;
      else
        v6 = 2;
      if ((v13 & 1 & v14) != 0)
        v6 = 0;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26[1], "rootViewController"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10000624C;
    v32[3] = &unk_10000C708;
    objc_copyWeak(&v33, from);
    +[MSOnboardingUtil presentIfNeededFromViewController:mediaTypes:completion:](MSOnboardingUtil, "presentIfNeededFromViewController:mediaTypes:completion:", v24, v6, v32);

    objc_destroyWeak(&v33);
    WeakRetained = v26;
  }

}

void sub_100006230(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000624C(uint64_t a1, int a2)
{
  _QWORD *WeakRetained;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD *v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (a2)
  {
    v5 = (void *)WeakRetained[4];
    v10 = v4;
    if (v5)
    {
      objc_msgSend(v5, "checkForNotifications");
      v4 = v10;
    }
    v6 = v4[10];
    if (v6)
    {
      (*(void (**)(void))(v6 + 16))();
      v7 = (void *)v10[10];
      v10[10] = 0;

      v4 = v10;
    }
    v8 = v4[11];
    if (v8)
    {
      (*(void (**)(void))(v8 + 16))();
      v9 = (void *)v10[11];
      v10[11] = 0;

      v4 = v10;
    }
  }

}

id objc_msgSend_OSLogObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "OSLogObject");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__downloadManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadManager");
}

id objc_msgSend__hasDisplayedFamilySetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_hasDisplayedFamilySetup");
}

id objc_msgSend__imageThatSuppressesAccessibilityHairlineThickening(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_imageThatSuppressesAccessibilityHairlineThickening");
}

id objc_msgSend__loadApplicationWithLaunchOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadApplicationWithLaunchOptions:");
}

id objc_msgSend__maximumTabBarItemsForStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_maximumTabBarItemsForStyle:");
}

id objc_msgSend__newDefaultTabBarItemsWithClientContext_style_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_newDefaultTabBarItemsWithClientContext:style:");
}

id objc_msgSend__newTabBarItemsWithStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_newTabBarItemsWithStyle:");
}

id objc_msgSend__reloadNavigationBarController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reloadNavigationBarController");
}

id objc_msgSend__requestAuthorization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestAuthorization");
}

id objc_msgSend__setInternalTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setInternalTitle:");
}

id objc_msgSend__setMakeSearchBarFirstResponderOnLoad_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setMakeSearchBarFirstResponderOnLoad:");
}

id objc_msgSend__setMaximumNumberOfItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setMaximumNumberOfItems:");
}

id objc_msgSend__setSelectSearchBarContentOnBecomingFirstResponder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setSelectSearchBarContentOnBecomingFirstResponder:");
}

id objc_msgSend__shortcutItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shortcutItems");
}

id objc_msgSend__showExternalURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showExternalURL:");
}

id objc_msgSend__showsDownloadsTabForDownloadManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_showsDownloadsTabForDownloadManager:");
}

id objc_msgSend__storeReview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_storeReview");
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemImageNamed:");
}

id objc_msgSend__tabBarStyleWithWidth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_tabBarStyleWithWidth:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_activeAccount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeAccount");
}

id objc_msgSend_addButtonWithTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addButtonWithTitle:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_allViewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allViewControllers");
}

id objc_msgSend_applicationDidForeground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationDidForeground");
}

id objc_msgSend_applicationOptionsWithLaunchOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationOptionsWithLaunchOptions:");
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationState");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_beginBackgroundTaskWithExpirationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginBackgroundTaskWithExpirationHandler:");
}

id objc_msgSend_beginDownloadManagerSessionWithManagerOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginDownloadManagerSessionWithManagerOptions:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bounds");
}

id objc_msgSend_buyParameters(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buyParameters");
}

id objc_msgSend_buyParamsWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buyParamsWithString:");
}

id objc_msgSend_checkForNotifications(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkForNotifications");
}

id objc_msgSend_clientContext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientContext");
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientInterface");
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

id objc_msgSend_createBagForSubProfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createBagForSubProfile");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentNotificationCenter");
}

id objc_msgSend_customizePurchase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "customizePurchase:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultConfigurationWithClientInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultConfigurationWithClientInterface:");
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStore");
}

id objc_msgSend_didAttemptPromptReview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didAttemptPromptReview");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_downloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloads");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_evaluateBlockWhenLoaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateBlockWhenLoaded:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_iconWithTemplateImageName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconWithTemplateImageName:");
}

id objc_msgSend_iconWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "iconWithType:");
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "image");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_initWithBag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBag:");
}

id objc_msgSend_initWithClientContextClass_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClientContextClass:options:");
}

id objc_msgSend_initWithClientInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClientInterface:");
}

id objc_msgSend_initWithClientInterface_sectionType_defaultPNGStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClientInterface:sectionType:defaultPNGStyle:");
}

id objc_msgSend_initWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentsOfFile:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithItems:");
}

id objc_msgSend_initWithLocaleName_bundles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocaleName:bundles:");
}

id objc_msgSend_initWithMemoryCapacity_diskCapacity_diskPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMemoryCapacity:diskCapacity:diskPath:");
}

id objc_msgSend_initWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:");
}

id objc_msgSend_initWithParentViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithParentViewController:");
}

id objc_msgSend_initWithRedeemCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRedeemCategory:");
}

id objc_msgSend_initWithSection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSection:");
}

id objc_msgSend_initWithTabBarSystemItem_tag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTabBarSystemItem:tag:");
}

id objc_msgSend_initWithTabIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTabIdentifier:");
}

id objc_msgSend_initWithType_localizedTitle_localizedSubtitle_icon_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithiTunesAccount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithiTunesAccount:");
}

id objc_msgSend_isAnimated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAnimated");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isManagedAppleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isManagedAppleID");
}

id objc_msgSend_launchedToTest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchedToTest");
}

id objc_msgSend_loadApplicationWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadApplicationWithOptions:");
}

id objc_msgSend_loadValueForConfigurationKeys_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "loadValueForConfigurationKeys:completionBlock:");
}

id objc_msgSend_localizedStringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:");
}

id objc_msgSend_localizedStringForKey_inBundles_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:inBundles:");
}

id objc_msgSend_localizedStringForKey_inBundles_inTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:inBundles:inTable:");
}

id objc_msgSend_localizedStringForKey_inTable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:inTable:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_moreNavigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moreNavigationController");
}

id objc_msgSend_moreViewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moreViewControllers");
}

id objc_msgSend_newDownloadManagerOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newDownloadManagerOptions");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "object");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_parameterForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameterForKey:");
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathForResource:ofType:");
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "popToRootViewControllerAnimated:");
}

id objc_msgSend_prepareForLaunch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForLaunch");
}

id objc_msgSend_presentIfNeededFromViewController_mediaTypes_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentIfNeededFromViewController:mediaTypes:completion:");
}

id objc_msgSend_presentOnboardingIfNeeded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentOnboardingIfNeeded");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_processShortcutItem_applicationController_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processShortcutItem:applicationController:completionHandler:");
}

id objc_msgSend_promptIfEligibleWithPresentingViewController_isFirstRun_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promptIfEligibleWithPresentingViewController:isFirstRun:");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_purchaseManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "purchaseManager");
}

id objc_msgSend_queueSessionManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queueSessionManager");
}

id objc_msgSend_registerDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDefaults:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_requestAuthorizationWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestAuthorizationWithOptions:completionHandler:");
}

id objc_msgSend_requestReviewInScene_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestReviewInScene:");
}

id objc_msgSend_resumeApplicationWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeApplicationWithOptions:");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_selectTabWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectTabWithIdentifier:");
}

id objc_msgSend_selectedImage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedImage");
}

id objc_msgSend_selectedNavigationController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedNavigationController");
}

id objc_msgSend_selectedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "selectedViewController");
}

id objc_msgSend_setAlwaysCreatesRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAlwaysCreatesRootViewController:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBarTintStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBarTintStyle:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setCancelButtonIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCancelButtonIndex:");
}

id objc_msgSend_setCategory_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategory:error:");
}

id objc_msgSend_setClientBridge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientBridge:");
}

id objc_msgSend_setClientContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientContext:");
}

id objc_msgSend_setClientIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientIdentifier:");
}

id objc_msgSend_setClientInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientInterface:");
}

id objc_msgSend_setDarkKeyColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDarkKeyColor:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setLightKeyColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLightKeyColor:");
}

id objc_msgSend_setNetworkActivityIndicatorVisible_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNetworkActivityIndicatorVisible:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPageRenderMetricsEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPageRenderMetricsEnabled:");
}

id objc_msgSend_setPurchaseReferrerURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPurchaseReferrerURL:");
}

id objc_msgSend_setPurchasesAndContinuationsFromPurchases_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPurchasesAndContinuationsFromPurchases:");
}

id objc_msgSend_setReferrerApplicationName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReferrerApplicationName:");
}

id objc_msgSend_setReferrerURLString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReferrerURLString:");
}

id objc_msgSend_setRootURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootURL:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRootViewControllerClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewControllerClass:");
}

id objc_msgSend_setSearchFieldConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSearchFieldConfiguration:");
}

id objc_msgSend_setSelectedImage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSelectedImage:");
}

id objc_msgSend_setSharedURLCache_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSharedURLCache:");
}

id objc_msgSend_setShortcutItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShortcutItems:");
}

id objc_msgSend_setTabBarItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTabBarItems:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setURLBagKey_forIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURLBagKey:forIdentifier:");
}

id objc_msgSend_setUnderlyingTabBarItem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnderlyingTabBarItem:");
}

id objc_msgSend_setUserInterfaceTintColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserInterfaceTintColor:");
}

id objc_msgSend_setViewControllerFactory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllerFactory:");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConfig");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shouldAttemptPromptReview(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldAttemptPromptReview");
}

id objc_msgSend_shouldLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldLog");
}

id objc_msgSend_shouldLogToDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldLogToDisk");
}

id objc_msgSend_shouldMakeUIForDefaultPNG(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldMakeUIForDefaultPNG");
}

id objc_msgSend_shouldShowOnboarding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldShowOnboarding");
}

id objc_msgSend_showErrorViewWithTitle_message_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showErrorViewWithTitle:message:");
}

id objc_msgSend_showExternalURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showExternalURL:");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_suspendApplicationWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "suspendApplicationWithOptions:");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_tabBarController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tabBarController");
}

id objc_msgSend_tabBarItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tabBarItems");
}

id objc_msgSend_tabBarItemsForStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tabBarItemsForStyle:");
}

id objc_msgSend_tabIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tabIdentifier");
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "table");
}

id objc_msgSend_tableView_didSelectRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tableView:didSelectRowAtIndexPath:");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topViewController");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_underlyingTabBarItem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "underlyingTabBarItem");
}

id objc_msgSend_updateShortcutItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateShortcutItems");
}

id objc_msgSend_updateTabBarWithItems_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateTabBarWithItems:animated:");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_valueForConfigurationKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForConfigurationKey:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllerFactory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllerFactory");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "viewControllers");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "windowScene");
}
