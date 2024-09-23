@implementation ATAPPTUtilities

- (ATAPPTUtilities)init
{

  return 0;
}

+ (id)testLog
{
  if (qword_10001A528 != -1)
    dispatch_once(&qword_10001A528, &stru_100014B28);
  return (id)qword_10001A520;
}

+ (id)testOperationQueue
{
  if (qword_10001A538 != -1)
    dispatch_once(&qword_10001A538, &stru_100014B48);
  return (id)qword_10001A530;
}

+ (BOOL)performScrollViewTest:(id)a3 testOptions:(id)a4 scrollAxis:(unint64_t)a5 tabBarController:(id)a6 scrollViewBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  dispatch_semaphore_t v19;
  void *v20;
  double Height;
  NSObject *v22;
  dispatch_time_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  uint64_t *v36;
  unint64_t v37;
  _QWORD v38[4];
  id v39;
  dispatch_semaphore_t v40;
  uint64_t *v41;
  unint64_t v42;
  int v43;
  int v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  __int128 *v48;
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _QWORD block[4];
  id v57;
  __int128 *p_buf;
  id v59;
  __int128 buf;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  CGRect v65;

  v11 = a3;
  v33 = a4;
  v12 = a6;
  v13 = a7;
  v14 = objc_claimAutoreleasedReturnValue(+[ATAPPTUtilities testLog](ATAPPTUtilities, "testLog"));
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Running scrollview test '%@'", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v61 = 0x3032000000;
  v62 = sub_100006B64;
  v63 = sub_100006B74;
  v64 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006B7C;
  block[3] = &unk_100014B70;
  p_buf = &buf;
  v59 = a1;
  v15 = v12;
  v57 = v15;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  usleep(0xF4240u);
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = sub_100006B64;
  v54 = sub_100006B74;
  v55 = 0;
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100006BF8;
  v45[3] = &unk_100014B98;
  v16 = v13;
  v46 = v16;
  v47 = &v50;
  v48 = &buf;
  v49 = a1;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v45);

  if (v51[5])
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lowercaseString"));
    v18 = objc_msgSend(v17, "containsString:", CFSTR("landscape"));

    if (v18)
    {
      v19 = dispatch_semaphore_create(0);
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v20, "bounds");
      Height = CGRectGetHeight(v65);

      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100006C5C;
      v38[3] = &unk_100014C28;
      v41 = &v50;
      v43 = 30;
      v44 = (int)(Height * 5.0);
      v42 = a5;
      v39 = v11;
      v40 = v19;
      v22 = v19;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v38);

      v23 = dispatch_time(0, 300000000000);
      dispatch_semaphore_wait(v22, v23);

LABEL_8:
      v24 = 1;
      goto LABEL_12;
    }
    if (objc_msgSend(sub_100006D1C(), "isRecapAvailable"))
    {
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100006DD4;
      v34[3] = &unk_100014B70;
      v36 = &v50;
      v37 = a5;
      v35 = v11;
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v34);

      v22 = v35;
      goto LABEL_8;
    }
  }
  v22 = objc_claimAutoreleasedReturnValue(+[ATAPPTUtilities testLog](ATAPPTUtilities, "testLog"));
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    sub_10000DDE0((uint64_t)v11, v22, v25, v26, v27, v28, v29, v30);
  v24 = 0;
LABEL_12:

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&buf, 8);

  return v24;
}

+ (id)prepareForPPT
{
  id v2;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = sub_100006B64;
  v9 = sub_100006B74;
  v10 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006FC4;
  block[3] = &unk_100014C50;
  block[4] = &v5;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  usleep(0xC350u);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

+ (BOOL)selectButtonWithTitle:(id)a3 inTabBarController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_topViewControllerInTabBarController:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  if ((objc_msgSend(a1, "_selectButtonWithTitle:inView:", v6, v8) & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationBar"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationBar"));
      v9 = objc_msgSend(a1, "_selectButtonWithTitle:inView:", v6, v13);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)selectButtonWithTitle:(id)a3 inShelf:(id)a4 inTabBarController:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_topViewControllerInTabBarController:", a5));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_findShelfViewControllerInViewController:withTitle:", v10, v9));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));
    v13 = objc_msgSend(a1, "_selectButtonWithTitle:inView:", v8, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)selectFirstShelfWithButtonTitle:(id)a3 inTabBarController:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned __int8 v24;
  void *v25;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_topViewControllerInTabBarController:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childViewControllers"));
  v9 = objc_msgSend(v8, "count");

  v10 = 0;
  if (v9)
  {
    v11 = 0;
    while (1)
    {
      v12 = v10;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_findShelfViewControllerInViewController:withShelfRow:", v7, v11));

      if (v10)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
        v14 = objc_msgSend(a1, "_selectButtonWithTitle:inView:", v6, v13);

        if ((v14 & 1) != 0)
          break;
      }
      ++v11;
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "childViewControllers"));
      v16 = objc_msgSend(v15, "count");

      if (v11 >= (unint64_t)v16)
        goto LABEL_6;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    v24 = objc_msgSend(a1, "_selectButtonWithTitle:inView:", v6, v25);

  }
  else
  {
LABEL_6:
    v17 = objc_claimAutoreleasedReturnValue(+[ATAPPTUtilities testLog](ATAPPTUtilities, "testLog"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_10000DE44((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);

    v24 = 0;
  }

  return v24;
}

+ (BOOL)selectTabWithTitle:(id)a3 inTabBarController:(id)a4
{
  id v6;
  id v7;
  id v8;
  void **v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;
  _QWORD v20[4];

  v6 = a3;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100007484;
  v13 = &unk_100014C78;
  v7 = a4;
  v14 = v7;
  v8 = v6;
  v15 = v8;
  v16 = v18;
  v17 = v20;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &v10);
  LOBYTE(a1) = objc_msgSend(a1, "_blockExecutionInTabBarController:documentRef:totalChildren:", v7, v8, 1, v10, v11, v12, v13);

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);

  return (char)a1;
}

+ (void)waitForNotificiation:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  dispatch_time_t v10;
  _QWORD v11[4];
  dispatch_semaphore_t v12;

  v4 = a3;
  v5 = dispatch_semaphore_create(0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "testOperationQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000077D4;
  v11[3] = &unk_100014CA0;
  v12 = v5;
  v8 = v5;
  v9 = objc_msgSend(v6, "addObserverForName:object:queue:usingBlock:", v4, 0, v7, v11);

  v10 = dispatch_time(0, 180000000000);
  dispatch_semaphore_wait(v8, v10);

}

+ (void)waitForTabWithTitleToLoad:(id)a3 inTabBarController:(id)a4 totalChildren:(unint64_t)a5
{
  objc_msgSend(a1, "_blockExecutionInTabBarController:documentRef:totalChildren:", a4, a3, a5);
}

+ (void)resetNumScrollViewFound
{
  dword_10001A540 = 0;
}

+ (id)findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = objc_msgSend((id)objc_opt_class(a1), "findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:", v6, a4, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

+ (id)findScrollViewInView:(id)a3 desiredScrollViewClass:(Class)a4 numScrollViewsToSkip:(int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  Class v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = v8;
  if (!v8)
    goto LABEL_19;
  if (a4)
  {
    v10 = a4;
LABEL_6:
    if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
      goto LABEL_7;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subviews", 0));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "findScrollViewInView:desiredScrollViewClass:numScrollViewsToSkip:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i), a4, v5));
          v12 = v18;
          v19 = dword_10001A540;
          if (v18)
            v19 = ++dword_10001A540;
          if (v19 > (int)v5)
          {

            goto LABEL_21;
          }

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v15)
          continue;
        break;
      }
    }

LABEL_19:
    v12 = 0;
    goto LABEL_21;
  }
  v11 = objc_opt_class(UICollectionView);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
  {
    v10 = (Class)objc_opt_class(UITableView);
    v8 = v9;
    goto LABEL_6;
  }
LABEL_7:
  v12 = v9;
LABEL_21:

  return v12;
}

+ (id)findScrollViewByIndexInStackCollectionView:(id)a3 index:(unint64_t)a4
{
  void *v5;
  id v6;
  void *v7;
  NSMutableArray *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  v6 = +[ATAPPTUtilities findScrollViewInView:desiredScrollViewClass:](ATAPPTUtilities, "findScrollViewInView:desiredScrollViewClass:", v5, NSClassFromString(CFSTR("VideosUI.StackCollectionView")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v8 = objc_opt_new(NSMutableArray);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subviews", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v13);
        v15 = objc_opt_class(UIScrollView);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          -[NSMutableArray addObject:](v8, "addObject:", v14);
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray sortedArrayUsingComparator:](v8, "sortedArrayUsingComparator:", &stru_100014CE0));
  v17 = v16;
  if (v16 && (unint64_t)objc_msgSend(v16, "count") > a4)
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", a4));
  else
    v18 = 0;

  return v18;
}

+ (BOOL)_blockExecutionInTabBarController:(id)a3 documentRef:(id)a4 totalChildren:(unint64_t)a5
{
  id v7;
  id v8;
  id v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  id v26;
  void *v27;
  char *v28;
  void *v29;
  char *v30;
  void **block;
  uint64_t v32;
  id (*v33)(uint64_t);
  void *v34;
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v7 = a3;
  v8 = a4;
  v29 = v7;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tabBarItems"));
  v10 = (char *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v10)
  {
    v11 = 0;
    v12 = *(_QWORD *)v42;
    v13 = VUITabBarItemKeyIdentifier;
    while (2)
    {
      v14 = 0;
      v30 = &v10[(_QWORD)v11];
      do
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v14), "vui_stringForKey:", v13));
        v16 = objc_msgSend(v15, "isEqualToString:", v8);

        if ((v16 & 1) != 0)
        {
          v30 = &v14[(_QWORD)v11];
          goto LABEL_12;
        }
        ++v14;
      }
      while (v10 != v14);
      v10 = (char *)objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      v11 = v30;
      if (v10)
        continue;
      break;
    }
  }
  else
  {
    v30 = 0;
  }
LABEL_12:

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "viewControllers"));
  v28 = (char *)objc_msgSend(v17, "count");

  if (v30 < v28)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "viewControllers"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndex:", v30));

    v19 = objc_opt_class(UINavigationController);
    if ((objc_opt_isKindOfClass(v27, v19) & 1) != 0)
      v20 = v27;
    else
      v20 = 0;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "viewControllers"));
    if ((unint64_t)objc_msgSend(v21, "count") >= a5)
    {
LABEL_20:

    }
    else
    {
      v22 = 11;
      while (1)
      {

        if (!--v22)
          break;
        usleep(0xC350u);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "viewControllers"));
        if ((unint64_t)objc_msgSend(v21, "count") >= a5)
          goto LABEL_20;
      }
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "viewControllers"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "lastObject"));

    v37 = 0;
    v38 = &v37;
    v39 = 0x2020000000;
    v40 = 0;
    block = _NSConcreteStackBlock;
    v32 = 3221225472;
    v33 = sub_100008014;
    v34 = &unk_100014D08;
    v36 = &v37;
    v26 = v24;
    v35 = v26;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &block);
    while (*((_BYTE *)v38 + 24))
    {
      usleep(0xC350u);
      block = _NSConcreteStackBlock;
      v32 = 3221225472;
      v33 = sub_100008014;
      v34 = &unk_100014D08;
      v36 = &v37;
      objc_storeStrong(&v35, v24);
      dispatch_sync((dispatch_queue_t)&_dispatch_main_q, &block);
    }

    _Block_object_dispose(&v37, 8);
  }

  return v30 < v28;
}

+ (id)_cellWithTitle:(id)a3 inViewController:(id)a4 returningCollectionView:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  unsigned int v22;
  id *v24;
  id v25;
  id v26;

  v8 = a3;
  v9 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionView"));
    if (!v10)
      goto LABEL_16;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_findCollectionViewInView:", v11));

    if (!v10)
    {
LABEL_16:
      v18 = 0;
      goto LABEL_21;
    }
  }
  v12 = objc_msgSend(v10, "visibleCells");
  v26 = objc_msgSend(v10, "numberOfSections");
  if (!v26)
    goto LABEL_16;
  v24 = a5;
  v25 = v9;
  v13 = 0;
  while (1)
  {
    v14 = objc_msgSend(v10, "numberOfItemsInSection:", v13);
    if (v14)
      break;
LABEL_14:
    if ((id)++v13 == v26)
    {
      v18 = 0;
      goto LABEL_20;
    }
  }
  v15 = v14;
  v16 = 0;
  while (1)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", v16, v13));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "cellForItemAtIndexPath:", v17));

    if (v18)
      break;
LABEL_13:

    if (v15 == (id)++v16)
      goto LABEL_14;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_findLabelInView:", v18));
  if (objc_msgSend(v8, "length"))
  {
    v20 = a1;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "text"));
    v22 = objc_msgSend(v21, "isEqualToString:", v8);

    if (!v22)
    {
      a1 = v20;

      goto LABEL_13;
    }
  }
  if (v24)
    *v24 = objc_retainAutorelease(v10);

LABEL_20:
  v9 = v25;
LABEL_21:

  return v18;
}

+ (id)_findCollectionViewInView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(a1, "_findViewOfType:inView:withFilter:", objc_opt_class(UICollectionView), v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_opt_class(UICollectionView);
  v8 = 0;
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;

  return v8;
}

+ (id)_findLabelInView:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = objc_msgSend(a1, "_findViewOfType:inView:withFilter:", objc_opt_class(UILabel), v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  v7 = objc_opt_class(UILabel);
  v8 = 0;
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;

  return v8;
}

+ (id)_findLabelWithTitle:(id)a3 inView:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(UILabel);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100008418;
  v14[3] = &unk_100014D30;
  v9 = v6;
  v15 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_findViewOfType:inView:withFilter:", v8, v7, v14));

  v11 = objc_opt_class(UILabel);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    v12 = v10;
  else
    v12 = 0;

  return v12;
}

+ (id)_findViewOfType:(Class)a3 inView:(id)a4 withFilter:(id)a5
{
  id v8;
  uint64_t (**v9)(id, id);
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  char v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v8 = a4;
  v9 = (uint64_t (**)(id, id))a5;
  if (!v8)
  {
LABEL_17:
    v10 = 0;
    goto LABEL_19;
  }
  if ((objc_opt_isKindOfClass(v8, a3) & 1) == 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subviews", 0));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_findViewOfType:inView:withFilter:", a3, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v15), v9));
          v16 = 1;
          if (v9 && v10)
            v16 = v9[2](v9, v10);
          if (v10 && (v16 & 1) != 0)
          {

            goto LABEL_19;
          }

          v15 = (char *)v15 + 1;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v13)
          continue;
        break;
      }
    }

    goto LABEL_17;
  }
  v10 = v8;
LABEL_19:

  return v10;
}

+ (id)_findScrollViewInViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (((((uint64_t (*)(void))objc_opt_respondsToSelector)() & 1) == 0
     || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "performSelector:withObject:", "collectionView", 0))) == 0)
    && ((objc_opt_respondsToSelector(v4, "tableView") & 1) == 0
     || (v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "performSelector:withObject:", "tableView", 0))) == 0))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "findScrollViewInView:desiredScrollViewClass:", v6, 0));

  }
  return v5;
}

+ (id)_findShelfViewControllerInViewController:(id)a3 withTitle:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v6 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "childViewControllers", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "view"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_findLabelWithTitle:inView:", v6, v13));

        if (v14)
        {
          v15 = v12;

          goto LABEL_11;
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
  v15 = 0;
LABEL_11:

  return v15;
}

+ (id)_findShelfViewControllerInViewController:(id)a3 withShelfRow:(unint64_t)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "childViewControllers"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a4));

  return v6;
}

+ (BOOL)_selectButtonWithTitle:(id)a3 inView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;
  _QWORD block[4];
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_findTVButtonWithTitle:inView:", v6, v7));
  if (v8
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_findUIButtonWithTitle:inView:", v6, v7))) != 0
    || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_findVUIRoundButtonWithTitle:inView:", v6, v7))) != 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100008980;
    block[3] = &unk_100014AE0;
    v13 = v8;
    v9 = v8;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_findVUIRoundButtonWithTitle:(id)a3 inView:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  Class v23;
  _BYTE v24[128];

  v6 = a3;
  v7 = a4;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100008B40;
  v21[3] = &unk_100014D58;
  v23 = NSClassFromString(CFSTR("VUIRoundButton"));
  v8 = v6;
  v22 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_findViewOfType:inView:withFilter:", v23, v7, v21));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subviews", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v15 = objc_opt_class(UIButton);
        if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
        {
          v11 = v14;
          goto LABEL_11;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v24, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_11:

  return v11;
}

+ (id)_findTVButtonWithTitle:(id)a3 inView:(id)a4
{
  id v6;
  id v7;
  Class v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = NSClassFromString(CFSTR("TVButton"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008D44;
  v12[3] = &unk_100014D30;
  v13 = v6;
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_findViewOfType:inView:withFilter:", v8, v7, v12));

  return v10;
}

+ (id)_findUIButtonWithTitle:(id)a3 inView:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_opt_class(UIButton);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100008ED4;
  v12[3] = &unk_100014D30;
  v13 = v6;
  v9 = v6;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_findViewOfType:inView:withFilter:", v8, v7, v12));

  return v10;
}

+ (id)_topViewControllerInTabBarController:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "selectedViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "topViewController"));
  v5 = objc_opt_class(_TVAppDocumentController);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "templateViewController"));

    v4 = (void *)v6;
  }

  return v4;
}

+ (id)topMostController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIWindow keyWindow](UIWindow, "keyWindow"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "rootViewController"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));
  if (v4)
  {
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "presentedViewController"));
      v3 = v5;
    }
    while (v6);
  }
  else
  {
    v5 = v3;
  }
  return v5;
}

@end
