uint64_t start(int a1, char **a2)
{
  void *v4;

  v4 = objc_autoreleasePoolPush();
  UIApplicationMain(a1, a2, CFSTR("MTAAppController"), CFSTR("MTAAppController"));
  objc_autoreleasePoolPop(v4);
  return 0;
}

Class sub_100006708(uint64_t a1)
{
  Class result;

  sub_100006C2C();
  result = objc_getClass("HKHealthStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_100064FC4();
  qword_1000BFB70 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000675C(id a1)
{
  id v1;

  +[MTAlarmManager warmUp](MTAlarmManager, "warmUp");
  +[MTTimerManager warmUp](MTTimerManager, "warmUp");
  +[MTSessionManager warmUp](MTSessionManager, "warmUp");
  v1 = +[MTPairedDeviceListener sharedListener](MTPairedDeviceListener, "sharedListener");
}

id sub_1000067A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id result;
  int v7;
  uint64_t v8;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ preparing tab bar controller", (uint8_t *)&v7, 0xCu);
  }

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setRootViewController:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "restoreLastSelectedTabIndex");
  return result;
}

uint64_t sub_10000687C(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 8);
  return result;
}

uint64_t sub_100006890(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_1000068A4(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_1000068B8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_numberOfItemsDidChangeAnimated:", 0);
}

id sub_1000068C4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadUI:", *(_QWORD *)(a1 + 40));
}

id sub_1000068D0(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "eventType");
  switch((unint64_t)result)
  {
    case 1uLL:
      result = _objc_msgSend(*(id *)(a1 + 40), "restoreAddNewAlarm");
      break;
    case 2uLL:
      result = _objc_msgSend(*(id *)(a1 + 40), "restoreAlarmEditWithEvent:");
      break;
    case 3uLL:
      result = _objc_msgSend(*(id *)(a1 + 40), "restoreWorldClockAdd");
      break;
    case 4uLL:
      goto LABEL_6;
    case 5uLL:
      result = _objc_msgSend(*(id *)(a1 + 40), "restoreWorldClockEdit");
      break;
    case 7uLL:
      objc_msgSend(*(id *)(a1 + 40), "restoreAlarmTabEditMode");
LABEL_6:
      result = _objc_msgSend(*(id *)(a1 + 40), "restoreWorldClockTabWithEvent:");
      break;
    case 8uLL:
      result = _objc_msgSend(*(id *)(a1 + 40), "restoreSleepEdit");
      break;
    default:
      return result;
  }
  return result;
}

void sub_100006980(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000068D0;
  v6[3] = &unk_1000993B8;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

}

id sub_100006A00(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "synchronize");
}

void sub_100006A2C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;

  v1 = (uint64_t *)(a1 + 32);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 24);
  if (!v3)
  {
    v4 = MTLogForCategory(8, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *v1;
      *(_DWORD *)buf = 138543362;
      v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ no current event", buf, 0xCu);
    }

    v3 = (id)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent blankEvent](MTAStateStoreEvent, "blankEvent"));
  }
  v15 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v3, 1, &v15));
  v8 = v15;
  v10 = MTLogForCategory(8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v8)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100065380(v1, (uint64_t)v8, v12);
  }
  else
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *v1;
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ synchronized state store successfully", buf, 0xCu);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v14, "setObject:forKey:", v7, CFSTR("kMTAStateStoreLatestEvent"));

    v12 = objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    -[NSObject synchronize](v12, "synchronize");
  }

}

void sub_100006C04(id a1)
{
  MTAStateStore *v1;
  void *v2;

  v1 = objc_alloc_init(MTAStateStore);
  v2 = (void *)qword_1000BFD18;
  qword_1000BFD18 = (uint64_t)v1;

}

uint64_t sub_100006C2C()
{
  uint64_t v0;
  void *v2;
  __int128 v3;
  uint64_t v4;

  v2 = 0;
  if (!qword_1000BFB78)
  {
    v3 = off_100099730;
    v4 = 0;
    qword_1000BFB78 = _sl_dlopen(&v3, &v2);
  }
  v0 = qword_1000BFB78;
  if (!qword_1000BFB78)
    sub_10006503C(&v2);
  if (v2)
    free(v2);
  return v0;
}

void sub_100006CD4(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 24);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "WorldClock activity resignCurrent %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000098F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000E234(id a1, WorldClockCity *a2)
{
  return -[WorldClockCity name](a2, "name");
}

int64_t sub_10000E460(id a1, NSIndexPath *a2, NSIndexPath *a3)
{
  return -[NSIndexPath compare:](a2, "compare:", a3);
}

void sub_10000E468(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v2, "setNeedsUpdateConstraints");

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "collectionViewController"));
  objc_msgSend(v3, "scrollToPageContainingIndexPath:animated:", *(_QWORD *)(a1 + 40), 0);

}

id sub_10000E4CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "flashScrollIndicators");
}

void sub_10000E5E0(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

id sub_10000EC9C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishAddViewControllerDismissal:", 1);
}

id sub_100013058(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateViewControllersWithTraitCollection:", *(_QWORD *)(a1 + 40));
}

void sub_10001311C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100013138(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showSleepView");

}

void sub_10001429C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000142B8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "showAddView");

}

void sub_10001455C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100014578(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEditing:animated:", 1, 0);

}

void sub_1000146E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000146FC(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "alarmViewController"));
  objc_msgSend(v1, "setEditing:", 1);

}

void sub_100014730(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEditing:animated:", 1, 1);

}

int64_t sub_100014F10(id a1, MTATone *a2, MTATone *a3)
{
  MTATone *v4;
  MTATone *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v4 = a2;
  v5 = a3;
  if (-[MTATone isDefaultTone](v4, "isDefaultTone"))
  {
    v6 = -1;
  }
  else if (-[MTATone isDefaultTone](v5, "isDefaultTone"))
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTATone name](v4, "name"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTATone name](v5, "name"));
    v6 = (int64_t)objc_msgSend(v7, "localizedStandardCompare:", v8);

  }
  return v6;
}

void sub_100014FF8(id a1)
{
  MTAToneManager *v1;
  void *v2;

  v1 = objc_opt_new(MTAToneManager);
  v2 = (void *)qword_1000BFB60;
  qword_1000BFB60 = (uint64_t)v1;

}

void sub_1000151B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD block[7];

  if (a2 == 5 || !a2)
  {
    block[5] = v2;
    block[6] = v3;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001521C;
    block[3] = &unk_100099320;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_10001521C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlert:", 0);
}

id sub_100015DBC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v3));
  }
  else
  {
    v6 = MTLogForCategory(8, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100064D40(v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "timerByUpdatingWithState:", 1));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timerManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "updateTimer:", v15));

  }
  return v5;
}

void sub_100015E7C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;

  v3 = a2;
  v5 = MTLogForCategory(8, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543362;
    v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found current timer: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "setTimer:", v3);
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v3, "duration");
  objc_msgSend(v7, "setCountDownDuration:");
  objc_msgSend(*(id *)(a1 + 32), "reloadTimerUI");
  objc_msgSend(*(id *)(a1 + 32), "updateSelectedSoundUI");
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

id sub_1000161F4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[5];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100016338;
  v19[3] = &unk_100099500;
  v19[4] = *(_QWORD *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "na_firstObjectPassingTest:", v19));
  v4 = v3;
  if (!v3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSError na_genericError](NSError, "na_genericError"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v7));
LABEL_8:

    goto LABEL_9;
  }
  if (!objc_msgSend(v3, "state"))
  {
    v8 = MTLogForCategory(8, v5);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100064D40(v9, v10, v11, v12, v13, v14, v15, v16);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timerByUpdatingWithState:", 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timerManager"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "updateTimer:", v7));

    goto LABEL_8;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithResult:](NAFuture, "futureWithResult:", v4));
LABEL_9:

  return v6;
}

id sub_100016338(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "timerID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "timerID"));
  v6 = objc_msgSend(v3, "isEqual:", v5);

  return v6;
}

void sub_1000163A8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;

  v3 = a2;
  v5 = MTLogForCategory(8, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v9 = 138543618;
    v10 = v7;
    v11 = 2114;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Found current timer: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "setTimer:", v3);
  objc_msgSend(*(id *)(a1 + 32), "setupTimerUI:", v3);
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(void))(v8 + 16))();

}

uint64_t sub_100016498(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint64_t result;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100064D74(a1, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v5, "didCancelTimerWithSender:", *(_QWORD *)(a1 + 32));

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_1000166D8(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;

  if (objc_msgSend(a2, "state") == (id)1)
  {
    +[MTTimerManager defaultDuration](MTTimerManager, "defaultDuration");
    v4 = v3;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "countDownDuration");
    if (v4 != v5)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "countDownDuration");
      +[MTTimerManager setDefaultDuration:](MTTimerManager, "setDefaultDuration:");
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));

      if (v6)
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));
        v8 = objc_msgSend(v7, "mutableCopy");

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "countDownDuration");
        objc_msgSend(v8, "setDuration:");
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timerManager"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "updateTimer:", v8));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NAScheduler mtMainThreadScheduler](NAScheduler, "mtMainThreadScheduler"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "reschedule:", v11));

        v15[0] = _NSConcreteStackBlock;
        v15[1] = 3221225472;
        v15[2] = sub_100016864;
        v15[3] = &unk_100099578;
        v15[4] = *(_QWORD *)(a1 + 32);
        v16 = v8;
        v13 = v8;
        v14 = objc_msgSend(v12, "addSuccessBlock:", v15);

      }
    }
  }
}

id sub_100016864(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTimer:", *(_QWORD *)(a1 + 40));
}

id sub_1000177B8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
}

void sub_100017A94(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

BOOL sub_100017BBC(id a1, UIApplicationShortcutItem *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  _QWORD v8[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIApplicationShortcutItem type](a2, "type", a3, a4));
  v8[0] = kStartTimerActionID;
  v8[1] = kStopTimerActionID;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

id sub_100017F58(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pauseResumeTimer:", 0);
}

void sub_100018200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001822C(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = MTLogForCategory(8, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = 138543362;
      v8 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer started. Preparing UI for running timer.", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setTimer:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "prepareUIForState:", 3);
    +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCATimerStarts);
  }

}

void sub_100018540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100018574(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "shouldHandleTimerReload"))
  {
    v8 = MTLogForCategory(8, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (v4)
    {
      if (v10)
        sub_100064E98(a1, (uint64_t)v4, v9);

    }
    else
    {
      if (v10)
        sub_100064DEC(a1, v9);

      objc_msgSend(*(id *)(a1 + 32), "setTimer:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "prepareUIForState:", 3);
    }
  }

}

void sub_10001881C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100018848(id *a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  char v14;
  id v15;
  void *v16;
  int v17;
  id v18;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "shouldHandleTimerReload"))
  {
    v5 = MTLogForCategory(8, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      v17 = 138543362;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer stopped. Preparing UI for stopped timer.", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(a1[4], "stopUpdatingTimerUI");
    objc_msgSend(*((id *)a1[4] + 1), "setTimerControlState:", 0);
    v8 = a1[4];
    v9 = (void *)v8[1];
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "timer"));
    objc_msgSend(v10, "duration");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "title"));
    objc_msgSend(v9, "setRemainingTime:duration:state:title:forceRefresh:", 1, v13, 1, 0.0, v12);

    v14 = MTUIIsPhoneIdiom();
    v15 = 0;
    if ((v14 & 1) == 0)
      v15 = a1[5];
    objc_msgSend(a1[4], "setTimer:", v15);
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "delegate"));
  objc_msgSend(v16, "didCancelTimerWithSender:", a1[4]);

  +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCATimerCancels);
}

void sub_100018C3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100018C78(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "shouldHandleTimerReload"))
  {
    v5 = MTLogForCategory(8, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138543362;
      v10 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer paused. Preparing UI for stopped timer.", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setTimer:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "prepareUIForState:", *(_QWORD *)(a1 + 56));
    v8 = &kMTCATimerPauses;
    if (*(_QWORD *)(a1 + 56) != 2)
      v8 = &kMTCATimerResumes;
    +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", *v8);
  }

}

void sub_100018D88(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v3 = a2;
  v7 = MTLogForCategory(8, v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer update failed with error: %{public}@", (uint8_t *)&v10, 0x16u);
  }

}

id sub_100019580(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setTimer:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "updateSelectedSoundUI");
}

id sub_100019838(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "title"));
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ timer label updated to: %{public}@", (uint8_t *)&v8, 0x16u);

  }
  return objc_msgSend(*(id *)(a1 + 32), "setTimer:", *(_QWORD *)(a1 + 40));
}

void sub_100019C08(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10001B478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_10001BA3C(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;

  v3 = 0;
  if (!qword_1000BFB90)
  {
    v4 = off_100099748;
    v5 = 0;
    qword_1000BFB90 = _sl_dlopen(&v4, &v3);
  }
  if (!qword_1000BFB90)
    sub_1000650B8(&v3);
  if (v3)
    free(v3);
  result = objc_getClass("HKSHQuickScheduleManagementViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    sub_100065134();
  qword_1000BFB88 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id sub_10001C464(uint64_t a1, void *a2)
{
  return _objc_msgSend(a2, "handleUserPreferencesChanged");
}

id sub_10001C8F0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id result;
  _QWORD v6[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "window"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rootViewController"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001CA04;
  v6[3] = &unk_100099320;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 0, v6);

  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("default")))
    return objc_msgSend(*(id *)(a1 + 32), "_handleDefaultSpecifierForSection:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("edit")))
    return objc_msgSend(*(id *)(a1 + 32), "_handleEditSpecifierForSection:", *(_QWORD *)(a1 + 48));
  result = objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("add"));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_handleAddSpecifierForSection:", *(_QWORD *)(a1 + 48));
  return result;
}

id sub_10001CA04(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "prepareStateForUrlLaunch");
}

uint64_t sub_10001CF4C(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "finishedTest:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
  result = objc_opt_respondsToSelector(*(_QWORD *)(a1 + 40), "teardownForTest:options:");
  if ((result & 1) != 0)
    return (uint64_t)objc_msgSend(*(id *)(a1 + 40), "teardownForTest:options:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88), *(_QWORD *)(a1 + 48));
  return result;
}

void sub_10001D83C(id a1)
{
  objc_class *v1;
  NSString *v2;
  objc_class *v3;
  NSString *v4;
  void *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;

  v1 = (objc_class *)objc_opt_class(MTCreateAlarmIntent);
  v2 = NSStringFromClass(v1);
  v20 = (id)objc_claimAutoreleasedReturnValue(v2);
  v3 = (objc_class *)objc_opt_class(MTDisableAlarmIntent);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (objc_class *)objc_opt_class(MTEnableAlarmIntent);
  v7 = NSStringFromClass(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (objc_class *)objc_opt_class(MTToggleAlarmIntent);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (objc_class *)objc_opt_class(MTUpdateAlarmIntent);
  v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (objc_class *)objc_opt_class(INCreateTimerIntent);
  v16 = NSStringFromClass(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v20, v5, v8, v11, v14, v17, 0));
  v19 = (void *)qword_1000BFBA8;
  qword_1000BFBA8 = v18;

}

void sub_10001DE6C(uint64_t a1)
{
  id *v2;
  uint64_t *v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  NSObject *v27;

  v3 = (uint64_t *)(a1 + 32);
  v2 = *(id **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2[3], "worldClockViewController"));
  objc_msgSend(v2, "_selectViewController:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v7 = *(_QWORD *)(a1 + 40);
  v6 = (uint64_t *)(a1 + 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "citiesMatchingName:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  if (v9)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*v3 + 24), "worldClockViewController"));
    if (-[NSObject conformsToProtocol:](v11, "conformsToProtocol:", &OBJC_PROTOCOL___MTAUpdateClockViewControllerDelegate))
    {
      v12 = -[NSObject isViewLoaded](v11, "isViewLoaded");
      v14 = MTLogForCategory(8, v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v16)
        {
          v17 = *v3;
          v18 = *v6;
          v22 = 138543874;
          v23 = v17;
          v24 = 2114;
          v25 = v18;
          v26 = 2114;
          v27 = v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: view controller is loaded, adding city name: %{public}@ to controller: %{public}@", (uint8_t *)&v22, 0x20u);
        }

        -[NSObject addCityWithoutUserInteraction:](v11, "addCityWithoutUserInteraction:", v9);
      }
      else
      {
        if (v16)
        {
          v20 = *v3;
          v21 = *v6;
          v22 = 138543874;
          v23 = v20;
          v24 = 2114;
          v25 = v21;
          v26 = 2114;
          v27 = v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: defer adding city name: %{public}@ to controller: %{public}@", (uint8_t *)&v22, 0x20u);
        }

        -[NSObject setDeferAddedCity:](v11, "setDeferAddedCity:", v9);
      }
    }
  }
  else
  {
    v19 = MTLogForCategory(8, v10);
    v11 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10006521C();
  }

}

void sub_10001E19C(uint64_t a1)
{
  id *v2;
  uint64_t *v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  NSObject *v27;

  v3 = (uint64_t *)(a1 + 32);
  v2 = *(id **)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2[3], "worldClockViewController"));
  objc_msgSend(v2, "_selectViewController:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[WorldClockManager sharedManager](WorldClockManager, "sharedManager"));
  v7 = *(_QWORD *)(a1 + 40);
  v6 = (uint64_t *)(a1 + 40);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "citiesMatchingName:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

  if (v9)
  {
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*v3 + 24), "worldClockViewController"));
    if (-[NSObject conformsToProtocol:](v11, "conformsToProtocol:", &OBJC_PROTOCOL___MTAUpdateClockViewControllerDelegate))
    {
      v12 = -[NSObject isViewLoaded](v11, "isViewLoaded");
      v14 = MTLogForCategory(8, v13);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (v12)
      {
        if (v16)
        {
          v17 = *v3;
          v18 = *v6;
          v22 = 138543874;
          v23 = v17;
          v24 = 2114;
          v25 = v18;
          v26 = 2114;
          v27 = v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: view controller is loaded, removing city name: %{public}@ from controller: %{public}@", (uint8_t *)&v22, 0x20u);
        }

        -[NSObject removeCityWithoutUserInteraction:](v11, "removeCityWithoutUserInteraction:", v9);
      }
      else
      {
        if (v16)
        {
          v20 = *v3;
          v21 = *v6;
          v22 = 138543874;
          v23 = v20;
          v24 = 2114;
          v25 = v21;
          v26 = 2114;
          v27 = v11;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: defer removing city name: %{public}@ from controller: %{public}@", (uint8_t *)&v22, 0x20u);
        }

        -[NSObject setDeferRemovedCity:](v11, "setDeferRemovedCity:", v9);
      }
    }
  }
  else
  {
    v19 = MTLogForCategory(8, v10);
    v11 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10006521C();
  }

}

void sub_10001E8A8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id sub_10001F0D4(uint64_t a1, void *a2, BOOL *a3)
{
  void *v5;
  void *v6;
  id result;

  if (a2)
  {
    v5 = *(void **)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(a2, "persistentID")));
    objc_msgSend(v5, "addObject:", v6);

  }
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  *a3 = (unint64_t)result > 1;
  return result;
}

UIImage *sub_100020064(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  __CFString *v5;
  void *v6;
  void *v7;
  UIImage *v8;
  void *v9;
  double width;
  double MidX;
  double MidY;
  id v13;
  void *v14;
  UIImage *ImageFromCurrentImageContext;
  void *v16;
  dispatch_queue_global_t global_queue;
  NSObject *v18;
  UIImage *v19;
  id v20;
  NSData *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  void **block;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  UIImage *v35;
  id v36;
  CGSize v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v3 = a2;
  if (qword_1000BFBC0 != -1)
    dispatch_once(&qword_1000BFBC0, &stru_100099848);
  v4 = MTUIMainScreenScale();
  if ((int)v4 == 1)
    v5 = &stru_10009A4D0;
  else
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("@%dx%@"), (int)v4, v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d%@.png"), a1, v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000BFBB0, "objectForKeyedSubscript:", v6));
  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1000BFBB8, "stringByAppendingPathComponent:", v6));
    +[MTACircleButton buttonWidthForSize:](MTACircleButton, "buttonWidthForSize:", a1);
    width = v37.width;
    v37.height = v37.width;
    UIGraphicsBeginImageContextWithOptions(v37, 0, 0.0);
    v38.origin.x = 0.0;
    v38.origin.y = 0.0;
    v38.size.width = width;
    v38.size.height = width;
    MidX = CGRectGetMidX(v38);
    v39.origin.x = 0.0;
    v39.origin.y = 0.0;
    v39.size.width = width;
    v39.size.height = width;
    MidY = CGRectGetMidY(v39);
    v13 = objc_alloc_init((Class)UIBezierPath);
    v40.origin.x = 0.0;
    v40.origin.y = 0.0;
    v40.size.width = width;
    v40.size.height = width;
    objc_msgSend(v13, "moveToPoint:", CGRectGetMidX(v40), 0.0);
    objc_msgSend(v13, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, MidY, width * 0.5, 4.71238898, 10.9955743);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v14, "setFill");

    objc_msgSend(v13, "fill");
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v16 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
    objc_msgSend((id)qword_1000BFBB0, "setObject:forKeyedSubscript:", v16, v6);
    global_queue = dispatch_get_global_queue(-2, 0);
    v18 = objc_claimAutoreleasedReturnValue(global_queue);
    block = _NSConcreteStackBlock;
    v32 = 3221225472;
    v33 = sub_100020478;
    v34 = &unk_1000993B8;
    v19 = v16;
    v35 = v19;
    v36 = v9;
    v20 = v9;
    dispatch_async(v18, &block);

    v21 = UIImagePNGRepresentation(v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if (MTUIIsPadIdiom(v22, v23))
      v24 = CFSTR("~ipad");
    else
      v24 = CFSTR("~iphone");
    v25 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v24));

    v26 = NSTemporaryDirectory();
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("circle_%d%@.png"), a1, v25, block, v32, v33, v34));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringByAppendingPathComponent:", v28));
    objc_msgSend(v22, "writeToFile:atomically:", v29, 1);

    v8 = v19;
    v5 = (__CFString *)v25;
  }

  return v8;
}

void sub_1000203AC(id a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v1 = objc_alloc_init((Class)NSMutableDictionary);
  v2 = (void *)qword_1000BFBB0;
  qword_1000BFBB0 = (uint64_t)v1;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(UIApp, "userCachesDirectory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingPathComponent:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("Circles")));
  v7 = objc_msgSend(v6, "copy");
  v8 = (void *)qword_1000BFBB8;
  qword_1000BFBB8 = (uint64_t)v7;

}

void sub_100020478(uint64_t a1)
{
  void *v2;
  NSData *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  objc_msgSend(v2, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:", qword_1000BFBB8, 0);

  v3 = UIImagePNGRepresentation(*(UIImage **)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue(v3);
  objc_msgSend(v4, "writeToFile:atomically:", *(_QWORD *)(a1 + 40), 1);

}

id sub_100022C50(double a1)
{
  if (qword_1000BFCE8 != -1)
    dispatch_once(&qword_1000BFCE8, &stru_100099898);
  return objc_msgSend((id)qword_1000BFBD0[5 * (int)sub_100024DB4(a1)], "size");
}

id sub_1000230CC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "layoutIfNeeded");
}

id sub_1000230F8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

id sub_100023458(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "frame");
  return objc_msgSend(v2, "setFrame:");
}

id sub_100023498(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t sub_1000234DC(double a1, double a2)
{
  double y;
  id v5;
  double v6;
  double v7;

  y = CGRectZero.origin.y;
  v5 = sub_100022C50(a1);
  return UIRectCenteredIntegralRect(v5, CGRectZero.origin.x, y, v6, v7, CGRectZero.origin.x, y, a1, a2);
}

void sub_100023928(float64x2_t *a1, unint64_t a2, void *a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v12;
  void *v13;
  size_t v14;
  float64x2_t *v15;
  int v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  float64x2_t *v26;
  double v27;
  double MaxX;
  CGFloat v29;
  double v30;
  _QWORD *v31;
  uint64_t v32;
  double *v33;
  void *v34;
  float64x2_t *v35;
  void *v36;
  uint64_t *v37;
  float64x2_t *v38;
  unint64_t v39;
  float64x2_t v40;
  float64x2_t *v41;
  unint64_t v42;
  float64x2_t *v43;
  uint64_t v44;
  uint64_t v45;
  float64x2_t *v46;
  float64x2_t *v47;
  float64x2_t *v48;
  float64x2_t *v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  int8x16_t v54;
  float v55;
  float64x2_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t v59;
  float64x2_t *v60;
  uint64_t v61;
  float64x2_t *v62;
  float64x2_t *v63;
  size_t v64;
  float64x2_t v65;
  uint64_t *v66;
  unsigned int v67;
  float64x2_t *v68;
  float64x2_t *v69;
  float64x2_t *v70;
  float64x2_t *v71;
  uint64_t v72;
  float64x2_t v73;
  float64x2_t v74;
  float64x2_t *v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[9];
  __int128 v79;
  float64_t v80;
  uint64_t v81;
  double *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double *v86;
  uint64_t v87;
  uint64_t v88;
  float64x2_t v89;
  CGFloat v90;
  CGFloat v91;
  __int128 v92;
  float64_t v93;
  CGRect v94;
  CGRect v95;

  *(double *)&v77 = a4;
  v89.f64[0] = a4;
  v89.f64[1] = a5;
  v90 = a6;
  v91 = a7;
  v12 = a3;
  v13 = v12;
  if (!a2)
    goto LABEL_37;
  v61 = (uint64_t)&v61;
  v14 = 32 * a2;
  __chkstk_darwin(v12);
  v15 = (float64x2_t *)(&v61 - 4 * a2);
  v75 = a1 + 1;
  v16 = 1;
  *(_QWORD *)&v76 = 3221225472;
  v70 = a1;
  v64 = 32 * a2;
  v71 = v15;
  do
  {
    LODWORD(v74.f64[0]) = v16;
    memcpy(v15, a1, v14);
    v17 = 0;
    do
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v17));
      v19 = objc_msgSend(v18, "iconPlacement") == (id)2;

      if (!v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v17));
        objc_msgSend(v20, "hotspotOffsetForPlacement:", 1);
        v22 = v21;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v17));
        objc_msgSend(v23, "hotspotOffsetForPlacement:", 2);
        v25 = v24;

        v26 = &v70[2 * v17];
        v27 = v26->f64[0];
        v92 = *(__int128 *)((char *)v26 + 8);
        *(_QWORD *)&v94.origin.y = v92;
        v93 = v26[1].f64[1];
        v94.size.width = v26[1].f64[0];
        v94.size.height = v26[1].f64[1];
        v94.origin.x = v27;
        MaxX = CGRectGetMaxX(v94);
        *(_QWORD *)&v95.origin.x = v77;
        v95.origin.y = a5;
        v95.size.width = a6;
        v95.size.height = a7;
        v29 = CGRectGetMaxX(v95);
        v30 = v22 - v25;
        v85 = 0;
        v86 = (double *)&v85;
        v87 = 0x2020000000;
        v88 = 0;
        v81 = 0;
        v82 = (double *)&v81;
        v83 = 0x2020000000;
        v84 = 0;
        if (MaxX > v29)
          goto LABEL_11;
        v78[0] = _NSConcreteStackBlock;
        v78[1] = v76;
        v78[2] = sub_10002522C;
        v78[3] = &unk_1000998C0;
        v78[6] = v70;
        v78[7] = v17;
        *(double *)&v78[8] = v30 + v27;
        v79 = v92;
        v80 = v93;
        v78[4] = &v85;
        v78[5] = &v81;
        v31 = objc_retainBlock(v78);
        v32 = 0;
        v33 = (double *)v75;
        do
        {
          if (v17 != v32)
            ((void (*)(_QWORD *, double, double, double, double))v31[2])(v31, *(v33 - 2), *(v33 - 1), *v33, v33[1]);
          ++v32;
          v33 += 4;
        }
        while (a2 != v32);

        if (v82[3] < v86[3])
        {
LABEL_11:
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v17));
          objc_msgSend(v34, "setIconPlacement:", 2);

          v35 = &v71[2 * v17];
          v35->f64[0] = v30 + v35->f64[0];
          sub_1000252A4(v35, &v89);
        }
        _Block_object_dispose(&v81, 8);
        _Block_object_dispose(&v85, 8);
      }
      ++v17;
    }
    while (v17 != a2);
    a1 = v70;
    v15 = v71;
    v14 = v64;
    v36 = memcpy(v70, v71, v64);
    v16 = 0;
  }
  while ((LOBYTE(v74.f64[0]) & 1) != 0);
  __chkstk_darwin(v36);
  v37 = &v61 - 2 * a2;
  v66 = v37;
  v38 = a1;
  v39 = a2;
  do
  {
    v40 = *v38;
    v38 += 2;
    *(float64x2_t *)v37 = v40;
    v37 += 2;
    --v39;
  }
  while (v39);
  v41 = a1;
  v42 = a2;
  do
  {
    sub_1000252A4(v41, &v89);
    v41 += 2;
    --v42;
  }
  while (v42);
  v67 = 0;
  v43 = v71;
  v63 = v71 + 2;
  v62 = v70 + 2;
  v74 = (float64x2_t)vdupq_n_s64(0x3FAEB851EB851EB8uLL);
  v73 = (float64x2_t)vdupq_n_s64(0xBFAEB851EB851EB8);
  v65 = (float64x2_t)vdupq_n_s64(0xBF9EB851EB851EB8);
  do
  {
    memcpy(v43, v70, v64);
    v44 = 0;
    LODWORD(v75) = 0;
    v69 = v62;
    v68 = v63;
    while (1)
    {
      v45 = v44 + 1;
      v72 = v44 + 1;
      if (v44 + 1 < a2)
      {
        v46 = v69;
        v47 = v68;
        v48 = &v43[2 * v44];
        v49 = &v70[2 * v44];
        do
        {
          sub_1000252A4(v48, &v89);
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v44));
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v45));
          objc_msgSend(v50, "sizeForIntersectionWithCityView:atOrigin:selfOrigin:", v51, v46->f64[0], v46->f64[1], v49->f64[0], v49->f64[1]);
          v76 = v52;
          v77 = v53;

          if (*(double *)&v76 != 0.0 || *(double *)&v77 != 0.0)
          {
            v54.i64[0] = v77;
            v55 = *(double *)v54.i64 * *(double *)v54.i64 + *(double *)&v76 * *(double *)&v76;
            v54.i64[1] = v76;
            v56 = (float64x2_t)vextq_s8(v54, v54, 8uLL);
            v57 = vaddq_f64(v56, (float64x2_t)vandq_s8((int8x16_t)vdupq_lane_s64(COERCE__INT64(sqrtf(v55)), 0), (int8x16_t)vcgtq_f64((float64x2_t)v54, v56)));
            v58 = (float64x2_t)vbslq_s8((int8x16_t)vcltzq_f64(vsubq_f64(*v49, *v46)), (int8x16_t)vnegq_f64(v57), (int8x16_t)v57);
            *v48 = vmlaq_f64(*v48, v74, v58);
            *v47 = vmlaq_f64(*v47, v73, v58);
            LODWORD(v75) = 1;
          }
          ++v45;
          v47 += 2;
          v46 += 2;
        }
        while (a2 != v45);
      }
      if (v67 > 9)
        break;
      v59 = vsubq_f64(v70[2 * v44], *(float64x2_t *)&v66[2 * v44]);
      if (v59.f64[0] == 0.0 && v59.f64[1] == 0.0)
        break;
      v60 = &v71[2 * v44];
      *v60 = vmlaq_f64(*v60, v65, v59);
      sub_1000252A4(v60, &v89);
      v43 = v71;
      if (v72 == a2)
        goto LABEL_36;
      LODWORD(v75) = 1;
LABEL_34:
      v68 += 2;
      v69 += 2;
      v44 = v72;
    }
    sub_1000252A4(&v71[2 * v44], &v89);
    if (v72 != a2)
    {
      v43 = v71;
      goto LABEL_34;
    }
    v43 = v71;
    if ((v75 & 1) == 0)
      break;
LABEL_36:
    memcpy(v70, v43, v64);
    ++v67;
  }
  while (v67 != 30);
LABEL_37:

}

void sub_1000240A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 288), 8);
  _Block_object_dispose((const void *)(v1 - 256), 8);
  _Unwind_Resume(a1);
}

id sub_1000240D4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id sub_1000249A4(int a1, long double a2, double a3, double a4)
{
  long double v8;
  double v9;
  double v10;
  double *v11;
  uint64_t i;
  double v13;
  double v14;
  long double v15;
  void *v16;
  double v17;
  uint64_t v18;
  double v20;
  long double __y[2];
  double v22[723];

  v8 = sin((a2 + 284.0) * 0.98630137 * 0.0174532925) * 23.45;
  v9 = (modf(a2, __y) * 24.0 + -12.0) * 15.0;
  v20 = v8;
  v10 = tan(v8 * 0.0174532925);
  v11 = v22;
  for (i = -180; i != 181; ++i)
  {
    v13 = (double)i;
    v14 = 90.0;
    if (v10 != 0.0)
    {
      v15 = cos((v9 + v13) * 0.0174532925);
      v14 = atan(-v15 / v10) * 57.2957795;
    }
    *(v11 - 1) = v14;
    *v11 = v13;
    v11 += 2;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPath](UIBezierPath, "bezierPath"));
  if (v20 <= 0.0)
    v17 = 0.0;
  else
    v17 = a4;
  if ((a1 & 1) == 0)
    sub_100024C4C(__y[1], v22[0], a3, a4);
  objc_msgSend(v16, "moveToPoint:");
  v18 = 0x1FFFFFFFFFFFFD2ELL;
  do
  {
    objc_msgSend(v16, "addLineToPoint:", sub_100024C4C(v22[v18 + 721], v22[v18 + 722], a3, a4));
    v18 += 2;
  }
  while (v18 * 8);
  if (a1)
  {
    objc_msgSend(v16, "addLineToPoint:", a3, v17);
    objc_msgSend(v16, "addLineToPoint:", 0.0, v17);
  }
  return v16;
}

double sub_100024C4C(double a1, double a2, double a3, double a4)
{
  double v6;
  double v7;

  sub_1000234DC(a3, a4);
  return *((double *)sub_100024CFC(a3) + 2) + v7 + (a2 + 180.0) * v6 / 360.0;
}

uint64_t *sub_100024CFC(double a1)
{
  uint64_t *v2;
  void **v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (qword_1000BFCE8 != -1)
    dispatch_once(&qword_1000BFCE8, &stru_100099898);
  v2 = &qword_1000BFBD0[5 * (int)sub_100024DB4(a1)];
  v3 = (void **)(v2 + 1);
  if (!v2[1])
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_worldClockMapLandColor](UIColor, "mtui_worldClockMapLandColor"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)*v2, "_flatImageWithColor:", v4));
    v6 = *v3;
    *v3 = (void *)v5;

  }
  return v2;
}

uint64_t sub_100024DB4(double a1)
{
  uint64_t v2;
  uint64_t v3;
  id *v4;
  double v5;
  double v6;
  double v7;

  if (qword_1000BFCE8 != -1)
    dispatch_once(&qword_1000BFCE8, &stru_100099898);
  v2 = 0;
  v3 = 0xFFFFFFFFLL;
  v4 = (id *)&qword_1000BFBD0;
  v5 = 1.79769313e308;
  do
  {
    objc_msgSend(*v4, "size");
    v7 = vabdd_f64(a1, v6);
    if ((_DWORD)v3 == -1 || (v3 & 0x80000000) == 0 && v7 < v5)
    {
      v5 = v7;
      v3 = v2;
    }
    ++v2;
    v4 += 5;
  }
  while (v2 != 7);
  return v3;
}

void sub_100024E5C(id a1)
{
  UIImage *v1;
  UIImage *v2;
  UIImage *v3;
  UIImage *v4;
  UIImage *v5;
  UIImage *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  id v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  id v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  id v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  id v32;
  id v33;
  uint64_t v34;
  __int128 v35;

  v33 = 0;
  v34 = 0;
  v32 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("map_portrait")));
  v35 = xmmword_10007A730;
  v1 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("map_landscape"), sub_100025118((uint64_t)qword_1000BFBD0, (uint64_t)&v32).n128_f64[0]);
  v29 = 0;
  v30 = 0;
  v28 = (id)objc_claimAutoreleasedReturnValue(v1);
  v31 = xmmword_10007A740;
  v2 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("map_landscape_large"), sub_100025118((uint64_t)&unk_1000BFBF8, (uint64_t)&v28).n128_f64[0]);
  v24 = (id)objc_claimAutoreleasedReturnValue(v2);
  v25 = 0;
  v26 = xmmword_10007A750;
  v27 = 0x4000000000000000;
  v3 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("map_portrait_medium"), sub_100025118((uint64_t)&unk_1000BFC20, (uint64_t)&v24).n128_f64[0]);
  v21 = 0;
  v22 = 0;
  v20 = (id)objc_claimAutoreleasedReturnValue(v3);
  v23 = xmmword_10007A760;
  v4 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("map_landscape_medium"), sub_100025118((uint64_t)&unk_1000BFC48, (uint64_t)&v20).n128_f64[0]);
  v17 = 0;
  v18 = 0;
  v16 = (id)objc_claimAutoreleasedReturnValue(v4);
  v19 = xmmword_10007A770;
  v5 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("map_landscape_medium_wide"), sub_100025118((uint64_t)&unk_1000BFC70, (uint64_t)&v16).n128_f64[0]);
  v13 = 0;
  v14 = 0;
  v12 = (id)objc_claimAutoreleasedReturnValue(v5);
  v15 = xmmword_10007A780;
  v6 = +[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("map_mac"), sub_100025118((uint64_t)&unk_1000BFC98, (uint64_t)&v12).n128_f64[0]);
  v7 = (id)objc_claimAutoreleasedReturnValue(v6);
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0x4000000000000000;
  sub_100025118((uint64_t)&unk_1000BFCC0, (uint64_t)&v7);

}

void sub_100025084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,void *a25,void *a26)
{
  uint64_t v26;

  _Unwind_Resume(a1);
}

void sub_100025110()
{
  JUMPOUT(0x1000250F8);
}

__n128 sub_100025118(uint64_t a1, uint64_t a2)
{
  __n128 result;

  objc_storeStrong((id *)a1, *(id *)a2);
  objc_storeStrong((id *)(a1 + 8), *(id *)(a2 + 8));
  result = *(__n128 *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)(a1 + 16) = result;
  return result;
}

double sub_10002515C(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  double v5;

  v1 = a1;
  v2 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneForSecondsFromGMT:](NSTimeZone, "timeZoneForSecondsFromGMT:", 0));
  objc_msgSend(v2, "setTimeZone:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "components:fromDate:toDate:options:", 128, qword_1000BFBC8, v1, 0));
  v5 = (double)(uint64_t)objc_msgSend(v4, "second") / 86400.0 + 1.0;

  return v5;
}

double sub_10002522C(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double v8;
  uint64_t v10;
  double result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CGRect v17;

  v8 = a2;
  v10 = *(_QWORD *)(a1 + 48) + 32 * *(_QWORD *)(a1 + 56);
  result = *(double *)v10;
  if (*(double *)v10 >= v8)
  {
    if (*(double *)v10 <= v8)
      return result;
    v17 = CGRectIntersection(*(CGRect *)(a1 + 64), *(CGRect *)&v8);
    v15 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v12 = *(_QWORD *)(v10 + 8);
    v13 = *(_QWORD *)(v10 + 16);
    v14 = *(_QWORD *)(v10 + 24);
    v17 = CGRectIntersection(*(CGRect *)&result, *(CGRect *)&v8);
    v15 = *(_QWORD *)(a1 + 32);
  }
  v16 = *(_QWORD *)(v15 + 8);
  result = *(double *)(v16 + 24) + v17.size.width * v17.size.height;
  *(double *)(v16 + 24) = result;
  return result;
}

void sub_1000252A4(float64x2_t *a1, float64x2_t *a2)
{
  double v4;
  double v5;

  if (!CGRectContainsRect(*(CGRect *)a2->f64, *(CGRect *)a1->f64))
  {
    *(int8x16_t *)a1 = vbslq_s8((int8x16_t)vcgtq_f64(*a1, *a2), *(int8x16_t *)a1, *(int8x16_t *)a2);
    v4 = CGRectGetMaxX(*(CGRect *)a2->f64) - a1[1].f64[0];
    if (v4 >= a1->f64[0])
      v4 = a1->f64[0];
    a1->f64[0] = v4;
    v5 = CGRectGetMaxY(*(CGRect *)a2->f64) - a1[1].f64[1];
    if (v5 >= a1->f64[1])
      v5 = a1->f64[1];
    a1->f64[1] = v5;
  }
}

id sub_100026C18(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "countDownView"));
  v3 = v2;
  v4 = 0.0;
  if (!*(_BYTE *)(a1 + 48))
    v4 = 1.0;
  objc_msgSend(v2, "setAlpha:", v4);

  return objc_msgSend(*(id *)(a1 + 32), "updateLabelColorForState:", *(_QWORD *)(a1 + 40));
}

void sub_100027244(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "alarmIDString"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:identifier:](MTAStateStoreEvent, "eventWithType:identifier:", 2, v3));
    objc_msgSend(v5, "pushEvent:", v4);

  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 1));
    objc_msgSend(v5, "pushEvent:", v3);
  }

}

void sub_1000273D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000273F4(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dataSource"));
  v3 = objc_msgSend(v2, "hasSleepAlarmMatchingAlarmIDString:", *(_QWORD *)(a1 + 32));

  if (v3)
  {
    objc_msgSend(WeakRetained, "showSleepView:", 0);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dataSource"));
    v5 = objc_msgSend(v4, "rowForAlarmWithID:", *(_QWORD *)(a1 + 32));

    if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "dataSource"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "alarmAtRow:", v5));

      objc_msgSend(WeakRetained, "showAddViewForAlarm:", v7);
    }
  }

}

void sub_100027558(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tableView"));
  objc_msgSend(v1, "setUserInteractionEnabled:", 1);

}

void sub_100027658(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tableView"));
  objc_msgSend(v1, "setUserInteractionEnabled:", 1);

}

id sub_100027808(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reloadUI:", *(_QWORD *)(a1 + 40));
  return _objc_msgSend(*(id *)(a1 + 32), "reloadWidgetTimeline");
}

id sub_1000279B0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reloadUI:", *(_QWORD *)(a1 + 40));
  return _objc_msgSend(*(id *)(a1 + 32), "reloadWidgetTimeline");
}

id sub_100027B58(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_reloadUI:", *(_QWORD *)(a1 + 40));
  return _objc_msgSend(*(id *)(a1 + 32), "reloadWidgetTimeline");
}

void sub_100027C54(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  int v10;
  uint64_t v11;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v10 = 138543362;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ reloading widget timeline from app", (uint8_t *)&v10, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTWidgetUtilities reloadAlarmWidgetTimeline](MTWidgetUtilities, "reloadAlarmWidgetTimeline"));
  if (v7)
  {
    v8 = MTLogForCategory(8, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100065284(a1, (uint64_t)v7, v9);

  }
}

void sub_100027F60(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[MTAlarm alarmWithHour:minute:](MTAlarm, "alarmWithHour:minute:", 7, 30));
  v2 = (void *)qword_1000BFCF8;
  qword_1000BFCF8 = v1;

}

void sub_100028204(id a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 8));
  objc_msgSend(v2, "pushEvent:", v1);

}

id sub_10002835C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "reloadSleepSection");
}

id sub_1000284E4(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "reloadSleepSection");
}

void sub_100028624(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100028644(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "tableView"));
  objc_msgSend(v2, "reloadData");

  objc_msgSend(WeakRetained, "_scrollToAlarm:", *(_QWORD *)(a1 + 32));
}

void sub_10002876C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10002878C(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_scrollToAlarm:", *(_QWORD *)(a1 + 32));

}

void sub_100028B58(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  unsigned int v5;
  id v6;
  _QWORD *v7;
  int8x16_t v8;
  void **block;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  int8x16_t v13;
  uint8_t buf[4];
  unsigned int v15;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "isEnabled");
    *(_DWORD *)buf = 67109120;
    v15 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Refreshing UI for cell (enabled: %d)", buf, 8u);
  }

  block = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100028C94;
  v12 = &unk_1000993B8;
  v8 = *(int8x16_t *)(a1 + 32);
  v6 = (id)v8.i64[0];
  v13 = vextq_s8(v8, v8, 8uLL);
  dispatch_after(0, (dispatch_queue_t)&_dispatch_main_q, &block);
  v7 = &kMTCAClockAlarmActivations;
  if (!*(_BYTE *)(a1 + 48))
    v7 = &kMTCAClockAlarmDeactivations;
  +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", *v7, *(_OWORD *)&v8, block, v10, v11, v12);

}

void sub_100028C94(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "dataSource"));
  v3 = objc_msgSend(v2, "rowForAlarm:", *(_QWORD *)(a1 + 40));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v3, 3));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cellForRowAtIndexPath:", v5));

  objc_msgSend(v6, "refreshUI:animated:", *(_QWORD *)(a1 + 40), 1);
}

void sub_10002AC5C(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  void *v11;
  double v12;
  NSBundle *v13;
  void *v14;
  NSBundle *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSBundle *v21;
  void *v22;
  void *v23;
  NSBundle *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD block[5];
  id v39;
  id v40;
  id v41;

  v2 = objc_alloc_init((Class)GEOAlmanac);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "city"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "alCity"));
  objc_msgSend(v4, "latitude");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "city"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alCity"));
  objc_msgSend(v8, "longitude");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  objc_msgSend(v2, "calculateAstronomicalTimeForLocation:time:altitudeInDegrees:", v6, v10, v12, GEOAlmanacAltitudeSunset);

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sunrise"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "sunset"));
  v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MTAWorldClockView));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SUNRISE_FORMAT"), &stru_10009A4D0, CFSTR("Localizable")));

  v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MTAWorldClockView));
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SUNRISE"), &stru_10009A4D0, CFSTR("Localizable")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timeFormatter"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringFromDate:", v37));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v36, v17, v19));

  v21 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MTAWorldClockView));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SUNSET_FORMAT"), &stru_10009A4D0, CFSTR("Localizable")));

  v24 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MTAWorldClockView));
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SUNSET"), &stru_10009A4D0, CFSTR("Localizable")));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timeFormatter"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "stringFromDate:", v35));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v23, v26, v28));

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "city"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "alCityId"));

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002B008;
  block[3] = &unk_100099A60;
  block[4] = *(_QWORD *)(a1 + 32);
  v39 = v31;
  v40 = v20;
  v41 = v29;
  v32 = v29;
  v33 = v20;
  v34 = v31;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

void sub_10002B008(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "city"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "alCityId"));
  v4 = objc_msgSend(v3, "isEqualToNumber:", *(_QWORD *)(a1 + 40));

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 48);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sunriseLabel"));
    objc_msgSend(v6, "setText:", v5);

    v7 = *(_QWORD *)(a1 + 56);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sunsetLabel"));
    objc_msgSend(v8, "setText:", v7);

    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  }
}

uint64_t sub_10002C614(uint64_t a1)
{
  void *v2;
  uint64_t result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "navigationController"));
  objc_msgSend(v2, "setEditing:animated:", 0, 0);

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

id sub_10002D6F0(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForCell:", v3));

  return v5;
}

void sub_10002EEA0(id a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 44.0, UIFontWeightLight));
  v2 = (void *)qword_1000BFD08;
  qword_1000BFD08 = v1;

}

id sub_10002F114(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadState");
}

id sub_10002F5BC(id a1, WorldClockCity *a2)
{
  return -[WorldClockCity name](a2, "name");
}

void sub_10002F9F4(id a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[MTAStateStore shared](MTAStateStore, "shared"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MTAStateStoreEvent eventWithType:](MTAStateStoreEvent, "eventWithType:", 3));
  objc_msgSend(v2, "pushEvent:", v1);

}

uint64_t sub_100032424(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 8) = 1;
  return result;
}

id sub_100032500(double a1)
{
  void *v3;
  void *v4;
  UIImage *ImageFromCurrentImageContext;
  void *v6;

  UIGraphicsBeginImageContextWithOptions(*(CGSize *)&a1, 0, 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, a1, a1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor mtui_backgroundColor](UIColor, "mtui_backgroundColor"));
  objc_msgSend(v4, "setFill");

  objc_msgSend(v3, "fill");
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v6 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  UIGraphicsEndImageContext();

  return v6;
}

void sub_100032968(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v2, "setNeedsUpdateConstraints");

  objc_msgSend(*(id *)(a1 + 32), "updateTimeViewFont");
  if (*(_BYTE *)(a1 + 40))
    v3 = 0.0;
  else
    v3 = 1.0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "pageControl"));
  objc_msgSend(v4, "setAlpha:", v3);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lapTableController"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tableView"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  objc_msgSend(v6, "safeAreaInsets");
  v8 = v7;

  objc_msgSend(v9, "setContentInset:", 0.0, 0.0, v8, 0.0);
  objc_msgSend(v9, "setScrollIndicatorInsets:", 0.0, 0.0, v8, 0.0);

}

void sub_1000334D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;

  v4 = a3;
  v6 = MTLogForCategory(5, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_1000653F8();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543362;
      v11 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ migration completed without error", (uint8_t *)&v10, 0xCu);
    }

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "migrator"));
    -[NSObject eraseLocalDefaults](v8, "eraseLocalDefaults");
  }

  objc_msgSend(*(id *)(a1 + 32), "reloadStopwatchesWithCompletion:", 0);
}

void sub_1000336C0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v5 = a2;
  v7 = a3;
  if (v7)
  {
    v8 = MTLogForCategory(5, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100065460();

  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    if (v14)
      goto LABEL_9;
  }
  v11 = MTLogForCategory(5, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v16 = 138543362;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@ couldn't fetch stopwatch, have to create one", (uint8_t *)&v16, 0xCu);
  }

  v14 = (void *)objc_opt_new(MTStopwatch);
LABEL_9:
  objc_msgSend(*(id *)(a1 + 32), "setupViewModelWithStopwatch:", v14);
  v15 = *(_QWORD *)(a1 + 40);
  if (v15)
    (*(void (**)(void))(v15 + 16))();

}

BOOL sub_100035EB8(id a1, UIApplicationShortcutItem *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  _QWORD v8[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIApplicationShortcutItem type](a2, "type", a3, a4));
  v8[0] = CFSTR("com.apple.mobiletimer.start-stopwatch");
  v8[1] = CFSTR("com.apple.mobiletimer.stop-stopwatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v8, 2));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

id sub_1000361A4(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[8];
  if (v3 == 3)
  {
    objc_msgSend(v2, "resumeLapTimer");
  }
  else if (v3 == 1)
  {
    objc_msgSend(v2, "startLapTimer");
  }
  return objc_msgSend(*(id *)(a1 + 32), "setMode:", 2);
}

_QWORD *sub_100036244(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[8] == 2)
    return objc_msgSend(result, "pauseLapTimer");
  return result;
}

_QWORD *sub_1000362B4(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[8] == 2)
    return objc_msgSend(result, "lapLapTimer");
  return result;
}

_QWORD *sub_100036324(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[8] != 1)
  {
    objc_msgSend(result, "resetLapTimer");
    return objc_msgSend(*(id *)(a1 + 32), "setMode:", 1);
  }
  return result;
}

void sub_100039568(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recentView"));
  objc_msgSend(v2, "setEditing:", *(unsigned __int8 *)(a1 + 40));

}

id sub_10003ABCC(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (*(_BYTE *)(a1 + 40))
    v3 = 1.0;
  else
    v3 = 0.0;
  objc_msgSend(v2, "setAlpha:", v3);
  if (*(_BYTE *)(a1 + 40))
    v4 = 0.0;
  else
    v4 = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setAlpha:", v4);
  if (*(_BYTE *)(a1 + 40))
    v5 = 0.0;
  else
    v5 = 1.0;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAlpha:", v5);
  if (*(_BYTE *)(a1 + 40))
    v6 = 0.0;
  else
    v6 = 1.0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", v6);
}

id sub_100042584()
{
  void *v0;
  NSString *v1;
  NSString *v2;
  void *v3;
  void *v4;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v1 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "preferredContentSizeCategory"));

  if (UIContentSizeCategoryCompareToCategory(v1, UIContentSizeCategoryAccessibilityMedium) == NSOrderedDescending)
  {
    v2 = UIContentSizeCategoryAccessibilityMedium;

    v1 = v2;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithPreferredContentSizeCategory:](UITraitCollection, "traitCollectionWithPreferredContentSizeCategory:", v1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleBody, v3));

  return v4;
}

uint64_t sub_100043B80(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100044020(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v13 = 138543362;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer updated", (uint8_t *)&v13, 0xCu);
  }

  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "remainingTime");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 48), "duration");
  v10 = v9;
  v11 = objc_msgSend(*(id *)(a1 + 48), "state");
  if (objc_msgSend(*(id *)(a1 + 48), "isCurrentTimer"))
  {
    objc_msgSend(v6, "setRemainingTime:duration:state:title:forceRefresh:", v11, 0, 1, v8, v10);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "title"));
    objc_msgSend(v6, "setRemainingTime:duration:state:title:forceRefresh:", v11, v12, 1, v8, v10);

  }
}

void sub_100044378(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  _BOOL4 v10;

  v5 = a2;
  v6 = a3;
  v8 = MTLogForCategory(8, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v10)
      sub_100065784();
  }
  else if (v10)
  {
    sub_1000656E8(a1);
  }

  if (*(_QWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "dismissAddEditViewController:");
  objc_msgSend(*(id *)(a1 + 32), "setEditing:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_reloadUI:", 0);

}

id sub_10004447C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showAddView");
}

void sub_10004506C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_100045098(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_1000450AC(void *a1, const char *a2)
{
  return objc_msgSend(a1, "row");
}

void sub_1000456E4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timerCellView"));
  objc_msgSend(v2, "setEditing:", *(unsigned __int8 *)(a1 + 40));

}

void sub_100046050(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  void *v4;
  void *v5;
  char *v6;
  char *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "view"));
  v3 = objc_msgSend(v2, "mtui_isRTL");

  v4 = *(void **)(a1 + 32);
  if ((v3 & 1) != 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pages"));
    v6 = (char *)objc_msgSend(v5, "count");
    v7 = &v6[~(unint64_t)objc_msgSend(*(id *)(a1 + 32), "currentPage")];

  }
  else
  {
    v7 = (char *)objc_msgSend(v4, "currentPage");
  }
  v8 = (double)(unint64_t)v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "scrollView"));
  objc_msgSend(v9, "bounds");
  v11 = v10 * v8;

  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "scrollView"));
  objc_msgSend(v12, "setContentOffset:", v11, 0.0);

}

void sub_10004B1C4(id a1)
{
  NSDateComponentsFormatter *v1;
  void *v2;

  v1 = objc_opt_new(NSDateComponentsFormatter);
  v2 = (void *)qword_1000BFD28;
  qword_1000BFD28 = (uint64_t)v1;

}

BOOL sub_10004B5C8(id a1, UIApplicationShortcutItem *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIApplicationShortcutItem type](a2, "type", a3, a4));
  v8 = kStopTimerActionID;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

BOOL sub_10004B670(id a1, UIApplicationShortcutItem *a2, unint64_t a3, BOOL *a4)
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  uint64_t v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UIApplicationShortcutItem type](a2, "type", a3, a4));
  v8 = kStartTimerActionID;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

id sub_10004C02C()
{
  if (qword_1000BFD40 != -1)
    dispatch_once(&qword_1000BFD40, &stru_100099E28);
  return (id)qword_1000BFD38;
}

void sub_10004C06C(id a1)
{
  void *v1;
  UIImage *ImageFromCurrentImageContext;
  uint64_t v3;
  void *v4;
  id v5;
  CGSize v6;

  v6.width = 10.0;
  v6.height = 10.0;
  UIGraphicsBeginImageContextWithOptions(v6, 0, 0.0);
  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", 0.0, 0.0, 10.0, 10.0));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemOrangeColor](UIColor, "systemOrangeColor"));
  objc_msgSend(v1, "setFill");

  objc_msgSend(v5, "fill");
  ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
  v3 = objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
  v4 = (void *)qword_1000BFD38;
  qword_1000BFD38 = v3;

  UIGraphicsEndImageContext();
}

void sub_10004D7A4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "dismissAddViewController:", *(_QWORD *)(a1 + 32));

}

int64_t sub_10004DDE4(id a1, ALCity *a2, ALCity *a3)
{
  ALCity *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ALCity name](a2, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ALCity name](v4, "name"));

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return (int64_t)v7;
}

int64_t sub_10004E5B8(id a1, ALCity *a2, ALCity *a3)
{
  ALCity *v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ALCity name](a2, "name"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ALCity name](v4, "name"));

  v7 = objc_msgSend(v5, "compare:", v6);
  return (int64_t)v7;
}

id sub_10004F030(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "addClockViewController:addCity:", 0, *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "finishAddViewControllerDismissal:", 0);
}

id sub_10004F064(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "scrollToCityAtIndex:animated:", *(_QWORD *)(a1 + 40), 1);
}

void sub_1000501AC(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  switch(*(_QWORD *)(a1 + 40))
  {
    case 0:
    case 4:
      NSLog(CFSTR("Unexpected timer state %ld"), *(_QWORD *)(a1 + 40));
      break;
    case 1:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setAlpha:", 1.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", 0.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAlpha:", 0.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setAlpha:", 0.0);
      break;
    case 2:
      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v3 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_quaternaryColor](UIColor, "mtui_quaternaryColor"));
      goto LABEL_6;
    case 3:
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setAlpha:", 0.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAlpha:", 1.0);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setAlpha:", 1.0);
      v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
      v3 = objc_claimAutoreleasedReturnValue(+[UIColor mtui_secondaryTextColor](UIColor, "mtui_secondaryTextColor"));
LABEL_6:
      v4 = (id)v3;
      objc_msgSend(v2, "setComponentColor:", v3);

      break;
    default:
      return;
  }
}

void sub_1000512E0(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "setNeedsStatusBarAppearanceUpdate");
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "collectionView"));
  objc_msgSend(v2, "reloadData");

}

id sub_1000513C8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadUI:", 0);
}

id sub_10005197C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadUI:", *(_QWORD *)(a1 + 40));
}

id sub_100051F58(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "isViewLoaded");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "showAddViewForTimer:", 0);
  return result;
}

void sub_100052090(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000520AC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "showAddTimerViewWithTimer:", *(_QWORD *)(a1 + 32));

}

id sub_1000526C0(id *a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  int v8;
  id v9;
  __int16 v10;
  void *v11;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = a1[4];
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "timerID"));
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer started: %@", (uint8_t *)&v8, 0x16u);

  }
  +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCATimerStarts);
  objc_msgSend(a1[6], "dismissAddViewController:", a1[6]);
  return objc_msgSend(a1[4], "reloadState");
}

id sub_100053928(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "timerID"));
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer started: %@", (uint8_t *)&v8, 0x16u);

  }
  +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCATimerStarts);
  return objc_msgSend(*(id *)(a1 + 32), "reloadState");
}

id sub_100053C08(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer stopped. Preparing UI for stopped timer.", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "reloadState");
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCATimerCancels);
}

id sub_100053E48(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;
  int v9;
  uint64_t v10;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v9 = 138543362;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer paused.  timer.", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "reloadState");
  v6 = objc_msgSend(*(id *)(a1 + 40), "state");
  v7 = &kMTCATimerPauses;
  if (v6 != (id)2)
    v7 = &kMTCATimerResumes;
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", *v7);
}

void sub_100054488(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;

  v4 = a3;
  v6 = MTLogForCategory(8, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100064E98(a1, (uint64_t)v4, v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "timerID"));
    v11 = 138543618;
    v12 = v9;
    v13 = 2114;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%{public}@ started timer: %{public}@", (uint8_t *)&v11, 0x16u);

  }
}

id sub_100054CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer stopped. Preparing UI for stopped timer.", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "stopUpdatingTimerUI");
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "controlsView"));
  objc_msgSend(v6, "setTimerControlState:", 0);

  objc_msgSend(*(id *)(a1 + 32), "updateStateAndReloadData");
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", kMTCATimerCancels);
}

id sub_100054FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  int v8;
  uint64_t v9;

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v8 = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer paused. Preparing UI for stopped timer.", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "prepareUIForState:forceRefresh:", *(_QWORD *)(a1 + 40), 0);
  v6 = &kMTCATimerPauses;
  if (*(_QWORD *)(a1 + 40) != 2)
    v6 = &kMTCATimerResumes;
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", *v6);
}

void sub_1000550CC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  v3 = a2;
  v7 = MTLogForCategory(8, v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = 138543618;
    v11 = v9;
    v12 = 2114;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Timer update failed with error: %{public}@", (uint8_t *)&v10, 0x16u);
  }

}

void sub_100055D54(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

id sub_100056BE4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

id sub_100056BF0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

id sub_100056BF8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

id sub_100057DD0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadUI:", *(_QWORD *)(a1 + 40));
}

void sub_100058028(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "collectionViewLayout"));
  objc_msgSend(v1, "invalidateLayout");

}

void sub_1000584DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000584F8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "showAddAlarmViewPopUpWithAlarm:", *(_QWORD *)(a1 + 32));

}

id sub_100058C10(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_addOrEditControllerDidDismissCommitChanges:", 0);
}

id sub_100058D90(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadUI:", 0);
}

id sub_100058D9C(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_addOrEditControllerDidDismissCommitChanges:", 0);
}

id sub_100058E1C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEditing:", 0);
  return _objc_msgSend(*(id *)(a1 + 32), "_addOrEditControllerDidDismissCommitChanges:", 0);
}

id sub_100058FAC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadUI:", *(_QWORD *)(a1 + 40));
}

id sub_100059024(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_addOrEditControllerDidDismissCommitChanges:", 0);
}

id sub_100059164(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadUI:", 0);
}

id sub_100059670(uint64_t a1)
{
  return _objc_msgSend(*(id *)(a1 + 32), "_addOrEditControllerDidDismissCommitChanges:", 0);
}

id sub_100059844(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  unsigned int v5;
  _QWORD *v6;
  _DWORD v8[2];

  v3 = MTLogForCategory(8, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "isEnabled");
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Refreshing UI for cell (enabled: %d)", (uint8_t *)v8, 8u);
  }

  objc_msgSend(*(id *)(a1 + 40), "refreshUI:animated:", *(_QWORD *)(a1 + 32), 1);
  v6 = &kMTCAClockAlarmActivations;
  if (!*(_BYTE *)(a1 + 48))
    v6 = &kMTCAClockAlarmDeactivations;
  return +[MTAnalytics incrementEventCount:](MTAnalytics, "incrementEventCount:", *v6);
}

uint64_t sub_100059B50()
{
  return 0;
}

uint64_t sub_100059B5C()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain(v0[1]);
  return v1;
}

uint64_t sub_100059B88(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(v2[1]);
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*sub_100059BBC())()
{
  return nullsub_11;
}

uint64_t sub_100059BD0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t sub_100059BFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease(*(_QWORD *)(v2 + 24));
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*sub_100059C30())()
{
  return nullsub_11;
}

uint64_t sub_100059C40()
{
  id v0;
  Swift::String v1;
  Swift::String v2;
  Swift::String v3;
  unint64_t v4;
  Swift::String v6;
  Swift::String v7;

  v0 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v7._countAndFlagsBits = 0xD000000000000044;
  v7._object = (void *)0x800000010008DBE0;
  v1._object = (void *)0x800000010008DBB0;
  v1._countAndFlagsBits = 0xD000000000000023;
  v2._countAndFlagsBits = 0;
  v2._object = (void *)0xE000000000000000;
  v3 = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, (Swift::String_optional)0, (NSBundle)v0, v2, v7);

  v6 = v3;
  v4 = sub_100059D08();
  return Text.init<A>(_:)(&v6, &type metadata for String, v4);
}

unint64_t sub_100059D08()
{
  unint64_t result;

  result = qword_1000BF7F0;
  if (!qword_1000BF7F0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000BF7F0);
  }
  return result;
}

uint64_t sub_100059D4C()
{
  uint64_t *v0;
  uint64_t v1;
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  void (*v40)(char *, char *, uint64_t);
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, uint64_t);
  uint64_t (*v51)(uint64_t, uint64_t, uint64_t);
  int v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t KeyPath;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(uint64_t *, _QWORD);
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(uint64_t *, _QWORD);
  uint64_t v71;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  void (*v77)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  void (*v87)(uint64_t, uint64_t);
  void (*v88)(char *, uint64_t, uint64_t);
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v95[2];
  Swift::String v96;

  v1 = sub_10005A514(&qword_1000BF7F8);
  __chkstk_darwin(v1);
  v86 = (char *)&v73 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_10005A514(&qword_1000BF800);
  v4 = __chkstk_darwin(v3);
  v79 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v85 = (char *)&v73 - v6;
  v92 = sub_10005A514(&qword_1000BF808);
  v87 = *(void (**)(uint64_t, uint64_t))(v92 - 8);
  v7 = __chkstk_darwin(v92);
  v74 = (uint64_t)&v73 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v7);
  v80 = (uint64_t)&v73 - v10;
  __chkstk_darwin(v9);
  v89 = (uint64_t)&v73 - v11;
  v90 = type metadata accessor for AttributedString(0);
  v83 = *(_QWORD *)(v90 - 8);
  v12 = __chkstk_darwin(v90);
  v82 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v73 - v14;
  v16 = *v0;
  v17 = v0[1];
  v18 = sub_10005A514(&qword_1000BF810);
  v19 = swift_allocObject(v18, 72, 7);
  v91 = xmmword_10007AC40;
  *(_OWORD *)(v19 + 16) = xmmword_10007AC40;
  *(_QWORD *)(v19 + 56) = &type metadata for String;
  v20 = sub_10005A554();
  *(_QWORD *)(v19 + 64) = v20;
  *(_QWORD *)(v19 + 32) = v16;
  *(_QWORD *)(v19 + 40) = v17;
  swift_bridgeObjectRetain(v17);
  v21 = String.init(format:_:)(0x9D80E240259C80E2, 0xA800000000000000, v19);
  v23 = v22;
  v24 = v0[2];
  v25 = v0[3];
  v26 = swift_allocObject(v18, 72, 7);
  *(_OWORD *)(v26 + 16) = v91;
  *(_QWORD *)(v26 + 56) = &type metadata for String;
  *(_QWORD *)(v26 + 64) = v20;
  *(_QWORD *)(v26 + 32) = v24;
  *(_QWORD *)(v26 + 40) = v25;
  swift_bridgeObjectRetain(v25);
  v27 = String.init(format:_:)(0x9D80E240259C80E2, 0xA800000000000000, v26);
  v29 = v28;
  v30 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v96._countAndFlagsBits = 0xD00000000000004BLL;
  v96._object = (void *)0x800000010008DC60;
  v31._object = (void *)0x800000010008DC30;
  v31._countAndFlagsBits = 0xD000000000000025;
  v32._countAndFlagsBits = 0;
  v32._object = (void *)0xE000000000000000;
  v33 = NSLocalizedString(_:tableName:bundle:value:comment:)(v31, (Swift::String_optional)0, (NSBundle)v30, v32, v96);

  v34 = swift_allocObject(v18, 112, 7);
  *(_OWORD *)(v34 + 16) = xmmword_10007AC50;
  *(_QWORD *)(v34 + 56) = &type metadata for String;
  *(_QWORD *)(v34 + 64) = v20;
  *(_QWORD *)(v34 + 32) = v21;
  *(_QWORD *)(v34 + 40) = v23;
  *(_QWORD *)(v34 + 96) = &type metadata for String;
  *(_QWORD *)(v34 + 104) = v20;
  v78 = v27;
  *(_QWORD *)(v34 + 72) = v27;
  *(_QWORD *)(v34 + 80) = v29;
  v81 = v23;
  swift_bridgeObjectRetain(v23);
  v84 = v29;
  swift_bridgeObjectRetain(v29);
  v35 = String.init(format:_:)(v33._countAndFlagsBits, v33._object, v34);
  v37 = v36;
  swift_bridgeObjectRelease(v33._object);
  AttributedString.init(stringLiteral:)(v35, v37);
  v39 = v82;
  v38 = v83;
  v40 = *(void (**)(char *, char *, uint64_t))(v83 + 16);
  *(_QWORD *)&v91 = v15;
  v41 = v15;
  v42 = v90;
  v40(v82, v41, v90);
  v93 = v21;
  v94 = v23;
  v43 = type metadata accessor for Locale(0);
  v44 = (uint64_t)v86;
  v77 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56);
  v77(v86, 1, 1, v43);
  v45 = sub_10005DD0C(&qword_1000BF820, (uint64_t (*)(uint64_t))&type metadata accessor for AttributedString, (uint64_t)&protocol conformance descriptor for AttributedString);
  v46 = sub_100059D08();
  v47 = (uint64_t)v85;
  v48 = v42;
  v76 = v45;
  v75 = v46;
  AttributedStringProtocol.range<A>(of:options:locale:)(&v93, 0, v44, v42, &type metadata for String, v45);
  v49 = v39;
  sub_10005E5F0(v44, &qword_1000BF7F8);
  v50 = *(void (**)(char *, uint64_t))(v38 + 8);
  v50(v39, v48);
  swift_bridgeObjectRelease(v81);
  v51 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v87 + 6);
  v52 = v51(v47, 1, v92);
  v88 = (void (*)(char *, uint64_t, uint64_t))v40;
  if (v52 == 1)
  {
    swift_bridgeObjectRelease(v84);
    sub_10005E5F0(v47, &qword_1000BF800);
    v53 = v91;
    v54 = (void (*)(uint64_t, uint64_t))v50;
  }
  else
  {
    sub_10005A598(v47, v89);
    v40(v39, (char *)v91, v48);
    v55 = v84;
    v93 = v78;
    v94 = v84;
    v77((char *)v44, 1, 1, v43);
    v56 = (uint64_t)v79;
    v57 = v39;
    AttributedStringProtocol.range<A>(of:options:locale:)(&v93, 0, v44, v48, &type metadata for String, v76);
    sub_10005E5F0(v44, &qword_1000BF7F8);
    v50(v39, v48);
    swift_bridgeObjectRelease(v55);
    v54 = (void (*)(uint64_t, uint64_t))v50;
    if (v51(v56, 1, v92) == 1)
    {
      sub_10005E5F0(v89, &qword_1000BF808);
      sub_10005E5F0(v56, &qword_1000BF800);
      v53 = v91;
    }
    else
    {
      sub_10005A598(v56, v80);
      v58 = v74;
      sub_10005A5E0(v89, v74);
      KeyPath = swift_getKeyPath(&unk_10007AC60);
      __chkstk_darwin(KeyPath);
      v60 = swift_getKeyPath(&unk_10007AC90);
      v95[0] = static Color.primary.getter();
      v61 = sub_10005EEF4(&qword_1000BF830, &qword_1000BF808, (uint64_t)&protocol conformance descriptor for Range<A>);
      v87 = (void (*)(uint64_t, uint64_t))v50;
      v62 = v92;
      v63 = v91;
      v64 = (void (*)(uint64_t *, _QWORD))AttributedString.subscript.modify(&v93, v58, v92, v61);
      v65 = sub_10005A704();
      AttributedSubstring.subscript.setter(v95, v60, v65);
      v64(&v93, 0);
      sub_10005E5F0(v58, &qword_1000BF808);
      v66 = v80;
      sub_10005A5E0(v80, v58);
      v67 = swift_getKeyPath(&unk_10007AC60);
      __chkstk_darwin(v67);
      v68 = swift_getKeyPath(&unk_10007AC90);
      v95[0] = static Color.primary.getter();
      v69 = v62;
      v54 = v87;
      v70 = (void (*)(uint64_t *, _QWORD))AttributedString.subscript.modify(&v93, v58, v69, v61);
      AttributedSubstring.subscript.setter(v95, v68, v65);
      v49 = v57;
      v70(&v93, 0);
      v48 = v90;
      sub_10005E5F0(v58, &qword_1000BF808);
      sub_10005E5F0(v66, &qword_1000BF808);
      sub_10005E5F0(v89, &qword_1000BF808);
      v53 = v63;
    }
  }
  v88(v49, v53, v48);
  v71 = Text.init(_:)(v49);
  v54(v53, v48);
  return v71;
}

uint64_t sub_10005A514(uint64_t *a1)
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

unint64_t sub_10005A554()
{
  unint64_t result;

  result = qword_1000BF818;
  if (!qword_1000BF818)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000BF818);
  }
  return result;
}

uint64_t sub_10005A598(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10005A514(&qword_1000BF808);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005A5E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10005A514(&qword_1000BF808);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005A628(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *a2;
  v4 = *a1;
  v5 = v2;
  sub_10005A514(&qword_1000BFAB8);
  return dispatch thunk of static Equatable.== infix(_:_:)(&v5, &v4) & 1;
}

uint64_t sub_10005A680()
{
  uint64_t v0;

  v0 = sub_10005A514(&qword_1000BFAB8);
  return dispatch thunk of Hashable.hashValue.getter(v0, &protocol witness table for AnyKeyPath);
}

void sub_10005A6C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;

  v2 = *a2;
  v3 = sub_10005A704();
  AttributeDynamicLookup.subscript.getter(v2, v3);
  __break(1u);
}

void sub_10005A6E8()
{
  AttributeScopes.SwiftUIAttributes.foregroundColor.getter();
  __break(1u);
}

unint64_t sub_10005A704()
{
  unint64_t result;

  result = qword_1000BF828;
  if (!qword_1000BF828)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for AttributeScopes.SwiftUIAttributes.ForegroundColorAttribute, &type metadata for AttributeScopes.SwiftUIAttributes.ForegroundColorAttribute);
    atomic_store(result, (unint64_t *)&qword_1000BF828);
  }
  return result;
}

uint64_t sub_10005A748()
{
  return 8;
}

uint64_t sub_10005A754(_QWORD *a1)
{
  return swift_release(*a1);
}

uint64_t sub_10005A75C(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

_QWORD *sub_10005A768(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_10005A774(uint64_t *a1)
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

uint64_t sub_10005A7B8()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for SetTimerWithLabelWithSiriTip(0);
  v1 = sub_10005DD0C(&qword_1000BF838, type metadata accessor for SetTimerWithLabelWithSiriTip, (uint64_t)&unk_10007ACD0);
  return SiriKitIntentTip.siriIcon.getter(v0, v1);
}

uint64_t type metadata accessor for SetTimerWithLabelWithSiriTip(uint64_t a1)
{
  uint64_t result;

  result = qword_1000C0060;
  if (!qword_1000C0060)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SetTimerWithLabelWithSiriTip);
  return result;
}

uint64_t sub_10005A83C()
{
  return Tips.Event.init<>(id:)(0xD00000000000001ELL, 0x800000010008DCB0);
}

uint64_t sub_10005A858@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for SetTimerWithLabelWithSiriTip(0) + 24);
  v4 = sub_10005A514(&qword_1000BF840);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_10005A8A4()
{
  uint64_t v0;
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
  uint64_t v16;

  v1 = sub_10005A514(&qword_1000BF840);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_10005A514(&qword_1000BF848);
  v6 = *(_QWORD *)(type metadata accessor for Tips.Rule(0) - 8);
  v7 = swift_allocObject(v5, ((*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))+ 2 * *(_QWORD *)(v6 + 72), *(unsigned __int8 *)(v6 + 80) | 7);
  *(_OWORD *)(v7 + 16) = xmmword_10007AC50;
  v8 = type metadata accessor for SetTimerWithLabelWithSiriTip(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v0 + *(int *)(v8 + 24), v1);
  v9 = type metadata accessor for Tips.EmptyDonation(0);
  v10 = sub_10005DD0C(&qword_1000BF850, (uint64_t (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation, (uint64_t)&protocol conformance descriptor for Tips.EmptyDonation);
  v11 = sub_10005DD0C(&qword_1000BF858, (uint64_t (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation, (uint64_t)&protocol conformance descriptor for Tips.EmptyDonation);
  Tips.Rule.init<A>(_:_:)(v4, sub_10005AA84, 0, v9, v10, v11);
  v12 = sub_10005DD0C(&qword_1000BF838, type metadata accessor for SetTimerWithLabelWithSiriTip, (uint64_t)&unk_10007ACD0);
  SiriKitIntentTip.siriDidExecuteIntent.getter(v8, v12);
  Tips.Rule.init<A>(_:_:)(v4, sub_10005AE3C, 0, v9, v10, v11);
  v13 = static Tips.RuleBuilder.buildExpression(_:)(v7);
  swift_bridgeObjectRelease(v7);
  v14 = static Tips.RuleBuilder.buildPartialBlock(first:)(v13);
  swift_bridgeObjectRelease(v13);
  return v14;
}

uint64_t sub_10005AA84@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t KeyPath;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v38 = a2;
  v37 = type metadata accessor for PredicateExpressions.ComparisonOperator(0);
  v35 = *(_QWORD *)(v37 - 8);
  __chkstk_darwin(v37);
  v34 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10005A514(&qword_1000BFA38);
  v5 = *(_QWORD *)(v4 - 8);
  v39 = v4;
  v40 = v5;
  __chkstk_darwin(v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10005A514(&qword_1000BFA40);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_10005A514(&qword_1000BFA48);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v15 = (char *)&v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = sub_10005A514(&qword_1000BFA50);
  v36 = *(_QWORD *)(v33 - 8);
  __chkstk_darwin(v33);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_10005EEF4(&qword_1000BFA58, &qword_1000BFA40, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Variable<A>);
  static PredicateExpressions.build_Arg<A>(_:)(a1, v8, v18);
  KeyPath = swift_getKeyPath(&unk_10007AF28);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v11, KeyPath, v8, v18);
  swift_release(KeyPath);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v20 = swift_getKeyPath(&unk_10007AF60);
  v21 = sub_10005EEF4(&qword_1000BFA60, &qword_1000BFA48, (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v15, v20, v12, v21);
  swift_release(v20);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v41 = 1;
  static PredicateExpressions.build_Arg<A>(_:)(&v41, &type metadata for Int);
  v23 = v34;
  v22 = v35;
  v24 = v37;
  (*(void (**)(char *, _QWORD, uint64_t))(v35 + 104))(v34, enum case for PredicateExpressions.ComparisonOperator.greaterThanOrEqual(_:), v37);
  v25 = sub_10005A514(&qword_1000BFAA8);
  v26 = v38;
  v38[3] = v25;
  v26[4] = sub_10005EF34(&qword_1000BFAB0, &qword_1000BFAA8, (uint64_t)&protocol conformance descriptor for <> PredicateExpressions.Comparison<A, B>);
  sub_10005E98C(v26);
  v27 = sub_10005EEF4(&qword_1000BFA98, &qword_1000BFA50, (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  v28 = sub_10005EEF4(&qword_1000BFAA0, &qword_1000BFA38, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Value<A>);
  v29 = v33;
  v30 = v39;
  static PredicateExpressions.build_Comparison<A, B>(lhs:rhs:op:)(v17, v7, v23, v33, v39, v27, v28, &protocol witness table for Int);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
  (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v30);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v17, v29);
}

uint64_t sub_10005ADF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_10005A514(&qword_1000BF840);
  result = Tips.Event.donations.getter(v2);
  *a1 = result;
  return result;
}

uint64_t sub_10005AE2C@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *(_QWORD *)(*(_QWORD *)result + 16);
  return result;
}

uint64_t sub_10005AE3C@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t KeyPath;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v32 = a2;
  v3 = sub_10005A514(&qword_1000BFA38);
  v4 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  v34 = v4;
  __chkstk_darwin(v3);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10005A514(&qword_1000BFA40);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10005A514(&qword_1000BFA48);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_10005A514(&qword_1000BFA50);
  v16 = *(_QWORD *)(v15 - 8);
  v30 = v15;
  v31 = v16;
  __chkstk_darwin(v15);
  v18 = (char *)&v30 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_10005EEF4(&qword_1000BFA58, &qword_1000BFA40, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Variable<A>);
  static PredicateExpressions.build_Arg<A>(_:)(a1, v7, v19);
  KeyPath = swift_getKeyPath(&unk_10007AF28);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v10, KeyPath, v7, v19);
  swift_release(KeyPath);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  v21 = swift_getKeyPath(&unk_10007AF60);
  v22 = sub_10005EEF4(&qword_1000BFA60, &qword_1000BFA48, (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  static PredicateExpressions.build_KeyPath<A, B>(root:keyPath:)(v14, v21, v11, v22);
  swift_release(v21);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v35 = 0;
  static PredicateExpressions.build_Arg<A>(_:)(&v35, &type metadata for Int);
  v23 = sub_10005A514(&qword_1000BFA68);
  v24 = v32;
  v32[3] = v23;
  v24[4] = sub_10005EF34(&qword_1000BFA70, &qword_1000BFA68, (uint64_t)&protocol conformance descriptor for <> PredicateExpressions.Equal<A, B>);
  sub_10005E98C(v24);
  v25 = sub_10005EEF4(&qword_1000BFA98, &qword_1000BFA50, (uint64_t)&protocol conformance descriptor for PredicateExpressions.KeyPath<A, B>);
  v26 = sub_10005EEF4(&qword_1000BFAA0, &qword_1000BFA38, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Value<A>);
  v27 = v30;
  v28 = v33;
  static PredicateExpressions.build_Equal<A, B>(lhs:rhs:)(v18, v6, v30, v33, v25, v26, &protocol witness table for Int);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v6, v28);
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v18, v27);
}

uint64_t sub_10005B130()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t OpaqueTypeConformance2;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  void *v17;

  v0 = sub_10005A514(&qword_1000BF860);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for Tips.MaxDisplayCount(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10005A514(&qword_1000BF868);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  Tips.MaxDisplayCount.init(_:)(1);
  static Tips.OptionsBuilder.buildExpression<A>(_:)(v7, v4, &protocol witness table for Tips.MaxDisplayCount);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v16 = v4;
  v17 = &protocol witness table for Tips.MaxDisplayCount;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v16, &opaque type descriptor for <<opaque return type of static Tips.OptionsBuilder.buildExpression<A>(_:)>>, 1);
  static Tips.OptionsBuilder.buildPartialBlock<A>(first:)(v11, v8, OpaqueTypeConformance2);
  v16 = v8;
  v17 = (void *)OpaqueTypeConformance2;
  v13 = swift_getOpaqueTypeConformance2(&v16, &opaque type descriptor for <<opaque return type of static Tips.OptionsBuilder.buildPartialBlock<A>(first:)>>, 1);
  v14 = static Tips.OptionsBuilder.buildFinalResult<A>(_:)(v3, v0, v13);
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return v14;
}

uint64_t sub_10005B2D8@<X0>(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  type metadata accessor for SetTimerWithLabelWithSiriTip(0);
  return Tips.Event.init<>(id:)(0xD00000000000001ELL, 0x800000010008DCB0);
}

uint64_t sub_10005B32C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  type metadata accessor for SetTimerWithLabelWithSiriTip(0);
  return Tips.Event.init<>(id:)(0xD00000000000001ELL, 0x800000010008DCB0);
}

uint64_t sub_10005B37C@<X0>(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
  a1[2] = 0;
  a1[3] = 0xE000000000000000;
  return Tips.Event.init<>(id:)(0xD00000000000001ELL, 0x800000010008DCB0);
}

uint64_t sub_10005B3C0()
{
  return sub_100059C40();
}

uint64_t sub_10005B3E4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10005DD0C(&qword_1000BF838, type metadata accessor for SetTimerWithLabelWithSiriTip, (uint64_t)&unk_10007ACD0);
  return SiriKitIntentTip.siriIcon.getter(a1, v2);
}

uint64_t sub_10005B428(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v3 = sub_10005A514(&qword_1000BF840);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10005A514(&qword_1000BF848);
  v8 = type metadata accessor for Tips.Rule(0);
  v9 = swift_allocObject(v7, ((*(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80))+ 2 * *(_QWORD *)(*(_QWORD *)(v8 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v8 - 8) + 80) | 7);
  *(_OWORD *)(v9 + 16) = xmmword_10007AC50;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v1 + *(int *)(a1 + 24), v3);
  v10 = type metadata accessor for Tips.EmptyDonation(0);
  v11 = sub_10005DD0C(&qword_1000BF850, (uint64_t (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation, (uint64_t)&protocol conformance descriptor for Tips.EmptyDonation);
  v12 = sub_10005DD0C(&qword_1000BF858, (uint64_t (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation, (uint64_t)&protocol conformance descriptor for Tips.EmptyDonation);
  Tips.Rule.init<A>(_:_:)(v6, sub_10005AA84, 0, v10, v11, v12);
  v13 = sub_10005DD0C(&qword_1000BF838, type metadata accessor for SetTimerWithLabelWithSiriTip, (uint64_t)&unk_10007ACD0);
  SiriKitIntentTip.siriDidExecuteIntent.getter(a1, v13);
  Tips.Rule.init<A>(_:_:)(v6, sub_10005AE3C, 0, v10, v11, v12);
  v14 = static Tips.RuleBuilder.buildExpression(_:)(v9);
  swift_bridgeObjectRelease(v9);
  v15 = static Tips.RuleBuilder.buildPartialBlock(first:)(v14);
  swift_bridgeObjectRelease(v14);
  return v15;
}

uint64_t sub_10005B5FC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_10005DD0C(&qword_1000BF8A8, type metadata accessor for SetTimerWithLabelWithSiriTip, (uint64_t)&unk_10007AD18);
  result = Tip.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

uint64_t sub_10005B650(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain(a2);
  return a1;
}

void sub_10005B680(_QWORD *a1@<X8>)
{
  *a1 = 0;
  a1[1] = 0xE000000000000000;
}

uint64_t sub_10005B68C()
{
  return Tip.title.getter();
}

uint64_t sub_10005B6BC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  unint64_t v4;
  uint64_t result;
  uint64_t v6;

  v4 = sub_10005DD5C();
  result = Tip.id.getter(a1, v4);
  *a2 = result;
  a2[1] = v6;
  return result;
}

id sub_10005B6F8(uint64_t a1, void *a2, double a3)
{
  objc_class *v3;
  id v7;
  NSString v8;

  v7 = objc_msgSend(objc_allocWithZone(v3), "init");
  CreateTimerIntent.duration.setter(a3);
  objc_msgSend(v7, "setType:", a1);
  objc_msgSend(v7, "setLabel:", a2);
  v8 = String._bridgeToObjectiveC()();
  objc_msgSend(v7, "_setLaunchId:", v8);

  return v7;
}

id sub_10005B7BC(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v4;
  NSString v5;
  NSString v6;

  v4 = objc_msgSend(objc_allocWithZone(v2), "init");
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  objc_msgSend(v4, "setLabel:", v5);

  v6 = String._bridgeToObjectiveC()();
  objc_msgSend(v4, "_setLaunchId:", v6);

  return v4;
}

uint64_t variable initialization expression of SiriTipsController.delegate()
{
  return 0;
}

uint64_t sub_10005B8C0()
{
  uint64_t v0;
  _QWORD *v1;
  _BYTE v3[24];

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate);
  swift_beginAccess(v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate, v3, 0, 0);
  return swift_unknownObjectRetain(*v1);
}

uint64_t sub_10005B96C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v3;
  uint64_t v4;
  _BYTE v6[24];

  v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate);
  swift_beginAccess(v3, v6, 1, 0);
  v4 = *v3;
  *v3 = a1;
  return swift_unknownObjectRelease(v4);
}

void *sub_10005B9BC(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess(v1 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate, a1, 33, 0);
  return &j__swift_endAccess;
}

id SiriTipsController.__deallocating_deinit()
{
  _QWORD *v0;
  objc_super v2;

  (*(void (**)(void))((swift_isaMask & *v0) + 0xD8))();
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriTipsController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriTipsController()
{
  return objc_opt_self(_TtC11MobileTimer18SiriTipsController);
}

void sub_10005BB24()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  uint64_t (*v5)(void);
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v1 = sub_10005A514(&qword_1000BF890);
  __chkstk_darwin(v1);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(void **)((char *)v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView);
  if (v4)
  {
    v5 = *(uint64_t (**)(void))((swift_isaMask & *v0) + 0x70);
    v14 = v4;
    v6 = (void *)v5();
    if (v6)
    {
      v7 = v6;
      objc_msgSend(v6, "tipViewControllerDidBecomeAvailableWithSiriTipsController:tipView:", v0, v14);
      swift_unknownObjectRelease(v7);
    }

  }
  else
  {
    v8 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v3, 1, 1, v8);
    v9 = (_QWORD *)swift_allocObject(&unk_10009A0B8, 40, 7);
    v9[2] = 0;
    v9[3] = 0;
    v9[4] = v0;
    v10 = v0;
    v11 = sub_10005D324((uint64_t)v3, (uint64_t)&unk_1000BF8A0, (uint64_t)v9);
    v12 = *(_QWORD *)((char *)v10 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_checkForSiriTipsTask);
    *(_QWORD *)((char *)v10 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_checkForSiriTipsTask) = v11;
    swift_release(v12);
  }
}

uint64_t sub_10005BC6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4[10] = a4;
  v5 = sub_10005A514(&qword_1000BF890);
  v4[11] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10005A514(&qword_1000BF990);
  v4[12] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v6 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SetTimerWithLabelWithSiriTip(0);
  v4[13] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v4[14] = v8;
  v9 = *(_QWORD *)(v8 + 64);
  v4[15] = v9;
  v10 = (v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[16] = swift_task_alloc(v10);
  v4[17] = swift_task_alloc(v10);
  v4[18] = swift_task_alloc(v10);
  v11 = type metadata accessor for Tips.ConfigurationOption.DatastoreLocation(0);
  v4[19] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v4[20] = v12;
  v4[21] = swift_task_alloc((*(_QWORD *)(v12 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10005BD5C, 0, 0);
}

id sub_10005BD5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id result;
  void *v13;
  NSString v14;
  NSString v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSString v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  id v26;
  NSString v27;
  id v28;
  id v29;
  id v30;
  NSString v31;
  id v32;
  id v33;
  NSString v34;
  NSString v35;
  _QWORD *v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v1 = sub_10005A514(&qword_1000BF998);
  v2 = type metadata accessor for Tips.ConfigurationOption(0);
  v3 = swift_allocObject(v1, ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v2 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) | 7);
  *(_OWORD *)(v3 + 16) = xmmword_10007AC40;
  static Tips.ConfigurationOption.DatastoreLocation.tipsGroupContainer.getter();
  v5 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 152);
  static Tips.ConfigurationOption.datastoreLocation(_:)(v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  static Tips.configure(_:)(v3);
  swift_bridgeObjectRelease(v3);
  v7 = objc_msgSend((id)objc_opt_self(AFPreferences), "sharedPreferences");
  v8 = objc_msgSend(v7, "languageCode");

  if (!v8)
  {
    if (qword_1000BFD50 != -1)
      swift_once(&qword_1000BFD50, sub_10005DBB8);
    v37 = type metadata accessor for Logger(0);
    sub_10005DC2C(v37, (uint64_t)qword_1000C03C8);
    v38 = Logger.logObject.getter();
    v39 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v38, v39))
      goto LABEL_18;
    v40 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v40 = 0;
    v41 = "Not able to get the current Siri locale setting. Returning";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v38, v39, v41, v40, 2u);
    swift_slowDealloc(v40, -1, -1);
LABEL_18:

    v43 = *(_QWORD *)(v0 + 136);
    v44 = *(_QWORD *)(v0 + 144);
    v45 = *(_QWORD *)(v0 + 128);
    v47 = *(_QWORD *)(v0 + 88);
    v46 = *(_QWORD *)(v0 + 96);
    swift_task_dealloc(*(_QWORD *)(v0 + 168));
    swift_task_dealloc(v44);
    swift_task_dealloc(v43);
    swift_task_dealloc(v45);
    swift_task_dealloc(v46);
    swift_task_dealloc(v47);
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v11 = v10;

  result = objc_msgSend((id)objc_opt_self(AFLocalization), "sharedInstance");
  if (result)
  {
    v13 = result;
    v14 = String._bridgeToObjectiveC()();
    v15 = String._bridgeToObjectiveC()();
    v16 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    *(_QWORD *)(v0 + 16) = v9;
    *(_QWORD *)(v0 + 24) = v11;
    *(_QWORD *)(v0 + 32) = 45;
    *(_QWORD *)(v0 + 40) = 0xE100000000000000;
    *(_QWORD *)(v0 + 48) = 95;
    *(_QWORD *)(v0 + 56) = 0xE100000000000000;
    v17 = sub_100059D08();
    StringProtocol.replacingOccurrences<A, B>(of:with:options:range:)(v0 + 32, v0 + 48, 0, 0, 0, 1, &type metadata for String, &type metadata for String, &type metadata for String, v17, v17, v17);
    v19 = v18;
    swift_bridgeObjectRelease(v11);
    v20 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v19);
    v21 = objc_msgSend(v13, "localizedStringForKey:table:bundle:languageCode:", v14, v15, v16, v20);

    if (v21)
    {
      v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
      v24 = v23;

      v25 = HIBYTE(v24) & 0xF;
      if ((v24 & 0x2000000000000000) == 0)
        v25 = v22 & 0xFFFFFFFFFFFFLL;
      if (v25)
      {
        v26 = objc_allocWithZone((Class)INSpeakableString);
        swift_bridgeObjectRetain(v24);
        v27 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v24);
        v28 = objc_msgSend(v26, "initWithSpokenPhrase:", v27);

        v29 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for CreateTimerIntent(0)), "init");
        *(_QWORD *)(v0 + 176) = v29;
        v30 = v29;
        CreateTimerIntent.duration.setter(540.0);
        objc_msgSend(v30, "setType:", 1);
        objc_msgSend(v30, "setLabel:", v28);
        v31 = String._bridgeToObjectiveC()();
        objc_msgSend(v30, "_setLaunchId:", v31);

        v32 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for SearchTimerIntent(0)), "init");
        *(_QWORD *)(v0 + 184) = v32;
        v33 = v32;
        v34 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease(v24);
        objc_msgSend(v33, "setLabel:", v34);

        v35 = String._bridgeToObjectiveC()();
        objc_msgSend(v33, "_setLaunchId:", v35);

        v36 = (_QWORD *)swift_task_alloc(async function pointer to static SiriKitIntentTip.create(with:)[1]);
        *(_QWORD *)(v0 + 192) = v36;
        sub_10005E5AC();
        *v36 = v0;
        v36[1] = sub_10005C384;
        return (id)static SiriKitIntentTip.create(with:)(v0 + 64, v33);
      }
      swift_bridgeObjectRelease(v24);
    }
    if (qword_1000BFD50 != -1)
      swift_once(&qword_1000BFD50, sub_10005DBB8);
    v42 = type metadata accessor for Logger(0);
    sub_10005DC2C(v42, (uint64_t)qword_1000C03C8);
    v38 = Logger.logObject.getter();
    v39 = static os_log_type_t.debug.getter();
    if (!os_log_type_enabled(v38, v39))
      goto LABEL_18;
    v40 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v40 = 0;
    v41 = "Not able to get the timer label in Siri locale. Returning";
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

uint64_t sub_10005C384()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 192));
  return swift_task_switch(sub_10005C3D8, 0, 0);
}

uint64_t sub_10005C3D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  NSObject *v11;
  uint8_t *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v0 + 200) = v1;
  *(_QWORD *)(v0 + 208) = v2;
  if (v2)
  {
    swift_bridgeObjectRetain(v2);
    v3 = String.count.getter(v1, v2);
    swift_bridgeObjectRelease(v2);
    if (v3 > 0)
    {
      v4 = (_QWORD *)swift_task_alloc(async function pointer to static SiriKitIntentTip.create(with:)[1]);
      *(_QWORD *)(v0 + 216) = v4;
      sub_10005DD0C(&qword_1000BF838, type metadata accessor for SetTimerWithLabelWithSiriTip, (uint64_t)&unk_10007ACD0);
      *v4 = v0;
      v4[1] = sub_10005C5C4;
      return static SiriKitIntentTip.create(with:)(*(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 176));
    }
    swift_bridgeObjectRelease(v2);
  }
  if (qword_1000BFD50 != -1)
    swift_once(&qword_1000BFD50, sub_10005DBB8);
  v6 = type metadata accessor for Logger(0);
  sub_10005DC2C(v6, (uint64_t)qword_1000C03C8);
  v7 = Logger.logObject.getter();
  v8 = static os_log_type_t.debug.getter();
  v9 = os_log_type_enabled(v7, v8);
  v10 = *(void **)(v0 + 176);
  v11 = *(NSObject **)(v0 + 184);
  if (v9)
  {
    v12 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "Not able to create HowMuchTimeLeft Tip or its example utterance is empty. Returning", v12, 2u);
    swift_slowDealloc(v12, -1, -1);
    v13 = v7;
  }
  else
  {
    v13 = *(NSObject **)(v0 + 176);
    v10 = *(void **)(v0 + 184);
    v11 = v7;
  }

  v14 = *(_QWORD *)(v0 + 136);
  v15 = *(_QWORD *)(v0 + 144);
  v16 = *(_QWORD *)(v0 + 128);
  v18 = *(_QWORD *)(v0 + 88);
  v17 = *(_QWORD *)(v0 + 96);
  swift_task_dealloc(*(_QWORD *)(v0 + 168));
  swift_task_dealloc(v15);
  swift_task_dealloc(v14);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10005C5C4()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 216));
  return swift_task_switch(sub_10005C618, 0, 0);
}

uint64_t sub_10005C618()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  void *v9;
  void *v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 96);
  v3 = (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v1 + 48))(v2, 1, *(_QWORD *)(v0 + 104));
  v4 = *(_QWORD *)(v0 + 208);
  if (v3 == 1)
  {
    swift_bridgeObjectRelease(*(_QWORD *)(v0 + 208));
    sub_10005E5F0(v2, &qword_1000BF990);
    if (qword_1000BFD50 != -1)
      swift_once(&qword_1000BFD50, sub_10005DBB8);
    v5 = type metadata accessor for Logger(0);
    sub_10005DC2C(v5, (uint64_t)qword_1000C03C8);
    v6 = Logger.logObject.getter();
    v7 = static os_log_type_t.debug.getter();
    v8 = os_log_type_enabled(v6, v7);
    v9 = *(void **)(v0 + 176);
    v10 = *(void **)(v0 + 184);
    if (v8)
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Not able to create SetTimerWithLabel Tip. Returning", v11, 2u);
      swift_slowDealloc(v11, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 200);
    v40 = v12;
    v44 = *(void **)(v0 + 184);
    v45 = *(void **)(v0 + 176);
    v14 = *(_QWORD *)(v0 + 136);
    v13 = *(_QWORD *)(v0 + 144);
    v16 = *(_QWORD *)(v0 + 120);
    v15 = *(_QWORD *)(v0 + 128);
    v17 = *(_QWORD *)(v0 + 88);
    v46 = v17;
    v43 = *(void **)(v0 + 80);
    sub_10005E62C(v2, v13);
    v18 = *(_QWORD *)(v13 + 24);
    swift_bridgeObjectRetain(v4);
    swift_bridgeObjectRelease(v18);
    *(_QWORD *)(v13 + 16) = v12;
    *(_QWORD *)(v13 + 24) = v4;
    v41 = v14;
    sub_10005E670(v13, v14);
    v19 = type metadata accessor for TaskPriority(0);
    v20 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
    v20(v17, 1, 1, v19);
    sub_10005E670(v14, v15);
    v21 = *(unsigned __int8 *)(v1 + 80);
    v22 = (v21 + 32) & ~v21;
    v42 = v21 | 7;
    v23 = (v16 + v22 + 7) & 0xFFFFFFFFFFFFFFF8;
    v24 = (v23 + 15) & 0xFFFFFFFFFFFFFFF8;
    v25 = swift_allocObject(&unk_10009A2C8, v24 + 16, v21 | 7);
    *(_QWORD *)(v25 + 16) = 0;
    *(_QWORD *)(v25 + 24) = 0;
    sub_10005E62C(v15, v25 + v22);
    *(_QWORD *)(v25 + v23) = v43;
    v26 = (_QWORD *)(v25 + v24);
    *v26 = v40;
    v26[1] = v4;
    v27 = v43;
    v28 = sub_10005D324(v46, (uint64_t)&unk_1000BF9B0, v25);
    v29 = *(_QWORD *)&v27[OBJC_IVAR____TtC11MobileTimer18SiriTipsController_updateTipStatusTask];
    *(_QWORD *)&v27[OBJC_IVAR____TtC11MobileTimer18SiriTipsController_updateTipStatusTask] = v28;
    swift_release(v29);
    v20(v46, 1, 1, v19);
    sub_10005E670(v41, v15);
    type metadata accessor for MainActor(0);
    v30 = v27;
    v31 = static MainActor.shared.getter();
    v32 = swift_allocObject(&unk_10009A2F0, v23 + 8, v42);
    *(_QWORD *)(v32 + 16) = v31;
    *(_QWORD *)(v32 + 24) = &protocol witness table for MainActor;
    sub_10005E62C(v15, v32 + v22);
    *(_QWORD *)(v32 + v23) = v30;
    v33 = sub_10005D324(v46, (uint64_t)&unk_1000BF9C0, v32);

    swift_release(v33);
    sub_10005E950(v41);
    sub_10005E950(v13);
  }
  v34 = *(_QWORD *)(v0 + 136);
  v35 = *(_QWORD *)(v0 + 144);
  v36 = *(_QWORD *)(v0 + 128);
  v38 = *(_QWORD *)(v0 + 88);
  v37 = *(_QWORD *)(v0 + 96);
  swift_task_dealloc(*(_QWORD *)(v0 + 168));
  swift_task_dealloc(v35);
  swift_task_dealloc(v34);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  swift_task_dealloc(v38);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10005C990()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc(dword_1000BF89C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_10005C9DC;
  return sub_10005BC6C((uint64_t)v3, v4, v5, v2);
}

uint64_t sub_10005C9DC()
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

uint64_t sub_10005CA24()
{
  uint64_t v0;

  if (qword_1000BFD50 != -1)
    swift_once(&qword_1000BFD50, sub_10005DBB8);
  v0 = type metadata accessor for Logger(0);
  return sub_10005DC2C(v0, (uint64_t)qword_1000C03C8);
}

uint64_t sub_10005CA6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
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

  v7[12] = a6;
  v7[13] = a7;
  v7[10] = a4;
  v7[11] = a5;
  v8 = type metadata accessor for SetTimerWithLabelWithSiriTip(0);
  v7[14] = v8;
  v9 = *(_QWORD *)(v8 - 8);
  v7[15] = v9;
  v10 = *(_QWORD *)(v9 + 64);
  v7[16] = v10;
  v7[17] = swift_task_alloc((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (*(_QWORD *)(*(_QWORD *)(sub_10005A514(&qword_1000BF890) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v7[18] = swift_task_alloc(v11);
  v7[19] = swift_task_alloc(v11);
  v7[20] = swift_task_alloc(v11);
  v12 = type metadata accessor for Tips.Status(0);
  v7[21] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v7[22] = v13;
  v7[23] = swift_task_alloc((*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_10005A514(&qword_1000BF9C8);
  v7[24] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v14 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_10005A514(&qword_1000BF9D0);
  v7[25] = v15;
  v16 = *(_QWORD *)(v15 - 8);
  v7[26] = v16;
  v7[27] = swift_task_alloc((*(_QWORD *)(v16 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_10005A514(&qword_1000BF9D8);
  v7[28] = v17;
  v18 = *(_QWORD *)(v17 - 8);
  v7[29] = v18;
  v7[30] = swift_task_alloc((*(_QWORD *)(v18 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10005CBB8, 0, 0);
}

uint64_t sub_10005CBB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(_QWORD *)(v0 + 208);
  v1 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 200);
  v4 = *(_QWORD *)(v0 + 112);
  v5 = sub_10005DD0C(&qword_1000BF8A8, type metadata accessor for SetTimerWithLabelWithSiriTip, (uint64_t)&unk_10007AD18);
  Tip.statusUpdates.getter(v4, v5);
  AsyncStream.makeAsyncIterator()(v3);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  *(_DWORD *)(v0 + 256) = enum case for Tips.Status.invalidated(_:);
  *(_DWORD *)(v0 + 260) = enum case for Tips.Status.pending(_:);
  *(_DWORD *)(v0 + 264) = enum case for Tips.Status.available(_:);
  v6 = (_QWORD *)swift_task_alloc(async function pointer to AsyncStream.Iterator.next(isolation:)[1]);
  *(_QWORD *)(v0 + 248) = v6;
  *v6 = v0;
  v6[1] = sub_10005CCB8;
  return AsyncStream.Iterator.next(isolation:)(*(_QWORD *)(v0 + 192), 0, 0, *(_QWORD *)(v0 + 224));
}

uint64_t sub_10005CCB8()
{
  uint64_t v0;

  swift_task_dealloc(*(_QWORD *)(*(_QWORD *)v0 + 248));
  return swift_task_switch(sub_10005CD0C, 0, 0);
}

uint64_t sub_10005CD0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
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
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  _QWORD *v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t ObjectType;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unsigned __int8 v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  unsigned __int8 v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;

  v2 = (uint64_t *)(v0 + 176);
  v1 = *(_QWORD *)(v0 + 176);
  v3 = *(_QWORD *)(v0 + 192);
  v5 = (_QWORD *)(v0 + 168);
  v4 = *(_QWORD *)(v0 + 168);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v3, 1, v4) == 1)
  {
    v2 = (uint64_t *)(v0 + 232);
    v6 = (_QWORD *)(v0 + 240);
    v5 = (_QWORD *)(v0 + 224);
LABEL_5:
    v20 = *v6;
    v21 = *v5;
    v22 = *v2;
    v23 = *(_QWORD *)(v0 + 240);
    v24 = *(_QWORD *)(v0 + 216);
    v25 = *(_QWORD *)(v0 + 184);
    v27 = *(_QWORD *)(v0 + 152);
    v26 = *(_QWORD *)(v0 + 160);
    v29 = *(_QWORD *)(v0 + 136);
    v28 = *(_QWORD *)(v0 + 144);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
    swift_task_dealloc(v23);
    swift_task_dealloc(v24);
    swift_task_dealloc(v3);
    swift_task_dealloc(v25);
    swift_task_dealloc(v26);
    swift_task_dealloc(v27);
    swift_task_dealloc(v28);
    swift_task_dealloc(v29);
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v6 = (_QWORD *)(v0 + 184);
  v7 = *(_QWORD *)(v0 + 184);
  v8 = *(_DWORD *)(v0 + 256);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v7, v3, v4);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 88))(v7, v4);
  if (v9 == v8)
  {
    v11 = *(_QWORD *)(v0 + 232);
    v10 = *(_QWORD *)(v0 + 240);
    v12 = *(_QWORD *)(v0 + 224);
    v13 = *(_QWORD *)(v0 + 144);
    v14 = *(void **)(v0 + 88);
    v15 = type metadata accessor for TaskPriority(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v13, 1, 1, v15);
    type metadata accessor for MainActor(0);
    v16 = v14;
    v17 = static MainActor.shared.getter(v16);
    v18 = (_QWORD *)swift_allocObject(&unk_10009A318, 40, 7);
    v18[2] = v17;
    v18[3] = &protocol witness table for MainActor;
    v18[4] = v16;
    v19 = sub_10005D470(v13, (uint64_t)&unk_1000BF9E8, (uint64_t)v18);
    swift_release(v19);
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    v3 = *(_QWORD *)(v0 + 192);
    goto LABEL_5;
  }
  if (v9 == *(_DWORD *)(v0 + 260))
  {
    v31 = *(_QWORD *)(v0 + 160);
    v32 = *(void **)(v0 + 88);
    v33 = type metadata accessor for TaskPriority(0);
    v34 = *(_QWORD *)(v33 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v34 + 56))(v31, 1, 1, v33);
    type metadata accessor for MainActor(0);
    v35 = v32;
    v36 = static MainActor.shared.getter(v35);
    v37 = (_QWORD *)swift_allocObject(&unk_10009A390, 40, 7);
    v37[2] = v36;
    v37[3] = &protocol witness table for MainActor;
    v37[4] = v35;
    v38 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v34 + 48))(v31, 1, v33);
    v39 = *(_QWORD *)(v0 + 160);
    if (v38 == 1)
    {
      sub_10005E5F0(*(_QWORD *)(v0 + 160), &qword_1000BF890);
      v40 = 7168;
      if (v36)
      {
LABEL_9:
        v41 = v37[3];
        ObjectType = swift_getObjectType(v36);
        swift_unknownObjectRetain(v36);
        v43 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v41);
        v45 = v44;
        swift_unknownObjectRelease(v36);
LABEL_16:
        v73 = swift_allocObject(&unk_10009A3B8, 32, 7);
        *(_QWORD *)(v73 + 16) = &unk_1000BFA10;
        *(_QWORD *)(v73 + 24) = v37;
        v74 = (char *)sub_10005A514(&qword_1000BFA28);
        if (v45 | v43)
        {
          v75 = v0 + 48;
          *(_QWORD *)(v0 + 48) = 0;
          *(_QWORD *)(v0 + 56) = 0;
          *(_QWORD *)(v0 + 64) = v43;
          *(_QWORD *)(v0 + 72) = v45;
        }
        else
        {
          v75 = 0;
        }
        v76 = &unk_1000BFA20;
        v77 = v40;
        v78 = v73;
LABEL_27:
        v80 = swift_task_create(v77, v75, v74, v76, v78);
        swift_release(v80);
        goto LABEL_28;
      }
    }
    else
    {
      v72 = TaskPriority.rawValue.getter();
      (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v39, v33);
      v40 = v72 | 0x1C00;
      v36 = v37[2];
      if (v36)
        goto LABEL_9;
    }
    v43 = 0;
    v45 = 0;
    goto LABEL_16;
  }
  if (v9 == *(_DWORD *)(v0 + 264))
  {
    v46 = *(_QWORD *)(v0 + 152);
    v47 = *(_QWORD *)(v0 + 136);
    v82 = v47;
    v83 = *(_QWORD *)(v0 + 128);
    v84 = v46;
    v48 = *(_QWORD *)(v0 + 120);
    v49 = *(_QWORD *)(v0 + 104);
    v85 = *(_QWORD *)(v0 + 96);
    v50 = *(_QWORD *)(v0 + 80);
    v51 = *(void **)(v0 + 88);
    v52 = type metadata accessor for TaskPriority(0);
    v53 = *(_QWORD *)(v52 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 56))(v46, 1, 1, v52);
    sub_10005E670(v50, v47);
    type metadata accessor for MainActor(0);
    v54 = v51;
    v55 = v49;
    v56 = swift_bridgeObjectRetain(v49);
    v57 = static MainActor.shared.getter(v56);
    v58 = *(unsigned __int8 *)(v48 + 80);
    v59 = (v58 + 40) & ~v58;
    v60 = (v83 + v59 + 7) & 0xFFFFFFFFFFFFFFF8;
    v61 = (_QWORD *)swift_allocObject(&unk_10009A340, v60 + 16, v58 | 7);
    v61[2] = v57;
    v61[3] = &protocol witness table for MainActor;
    v61[4] = v54;
    sub_10005E62C(v82, (uint64_t)v61 + v59);
    v62 = (_QWORD *)((char *)v61 + v60);
    *v62 = v85;
    v62[1] = v55;
    v63 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v84, 1, v52);
    v64 = *(_QWORD *)(v0 + 152);
    if (v63 == 1)
    {
      sub_10005E5F0(*(_QWORD *)(v0 + 152), &qword_1000BF890);
      v65 = 7168;
      v66 = v61[2];
      if (v66)
      {
LABEL_13:
        v67 = v61[3];
        v68 = swift_getObjectType(v66);
        swift_unknownObjectRetain(v66);
        v69 = dispatch thunk of Actor.unownedExecutor.getter(v68, v67);
        v71 = v70;
        swift_unknownObjectRelease(v66);
LABEL_23:
        v78 = swift_allocObject(&unk_10009A368, 32, 7);
        *(_QWORD *)(v78 + 16) = &unk_1000BF9F8;
        *(_QWORD *)(v78 + 24) = v61;
        if (v71 | v69)
        {
          v75 = v0 + 16;
          *(_QWORD *)(v0 + 16) = 0;
          *(_QWORD *)(v0 + 24) = 0;
          *(_QWORD *)(v0 + 32) = v69;
          *(_QWORD *)(v0 + 40) = v71;
        }
        else
        {
          v75 = 0;
        }
        v76 = &unk_1000BFA00;
        v74 = (char *)&type metadata for () + 8;
        v77 = v65;
        goto LABEL_27;
      }
    }
    else
    {
      v79 = TaskPriority.rawValue.getter();
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v64, v52);
      v65 = v79 | 0x1C00;
      v66 = v61[2];
      if (v66)
        goto LABEL_13;
    }
    v69 = 0;
    v71 = 0;
    goto LABEL_23;
  }
  (*(void (**)(_QWORD, _QWORD))(*v2 + 8))(*v6, *v5);
LABEL_28:
  v81 = (_QWORD *)swift_task_alloc(async function pointer to AsyncStream.Iterator.next(isolation:)[1]);
  *(_QWORD *)(v0 + 248) = v81;
  *v81 = v0;
  v81[1] = sub_10005CCB8;
  return AsyncStream.Iterator.next(isolation:)(*(_QWORD *)(v0 + 192), 0, 0, *(_QWORD *)(v0 + 224));
}

uint64_t sub_10005D2B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[2] = a1;
  v4[3] = a4;
  v5 = type metadata accessor for MainActor(0);
  v4[4] = static MainActor.shared.getter();
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_10005EFC4, v6, v7);
}

uint64_t sub_10005D324(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_10005E5F0(a1, &qword_1000BF890);
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
  v16 = swift_allocObject(&unk_10009A2A0, 32, 7);
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
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_1000BF988, v16);
}

uint64_t sub_10005D470(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_10005E5F0(a1, &qword_1000BF890);
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
  v16 = swift_allocObject(&unk_10009A3E0, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  v17 = sub_10005A514(&qword_1000BFA28);
  if (v14 | v12)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v12;
    v20[3] = v14;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v8, v18, v17, &unk_1000BFA30, v16);
}

uint64_t sub_10005D5C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v7[6] = a6;
  v7[7] = a7;
  v7[4] = a4;
  v7[5] = a5;
  v8 = type metadata accessor for MainActor(0);
  v7[8] = static MainActor.shared.getter(v8);
  v9 = dispatch thunk of Actor.unownedExecutor.getter(v8, &protocol witness table for MainActor);
  return swift_task_switch(sub_10005D634, v9, v10);
}

uint64_t sub_10005D634()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t (*v3)(void);
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(void);
  uint64_t v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 32);
  swift_release(*(_QWORD *)(v0 + 64));
  v2 = *(void **)(v1 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView);
  if (v2)
  {
    v3 = *(uint64_t (**)(void))((swift_isaMask & **(_QWORD **)(v0 + 32)) + 0x70);
    v4 = v2;
    v5 = (void *)v3();
    if (v5)
    {
      v6 = v5;
      objc_msgSend(v5, "tipViewControllerDidBecomeAvailableWithSiriTipsController:tipView:", *(_QWORD *)(v0 + 32), v4);
      swift_unknownObjectRelease(v6);
    }
    v8 = *(_QWORD *)(v0 + 48);
    v7 = *(_QWORD *)(v0 + 56);
    v9 = type metadata accessor for SetTimerWithLabelWithSiriTip(0);
    v10 = sub_10005DD0C(&qword_1000BF838, type metadata accessor for SetTimerWithLabelWithSiriTip, (uint64_t)&unk_10007ACD0);
    v11 = (void (*)(void))SiriKitIntentTip.notifySiriTipOnDisplay.getter(v9, v10);
    v13 = v12;
    v11();
    swift_release(v13);
    *(_QWORD *)(v0 + 16) = v8;
    *(_QWORD *)(v0 + 24) = v7;
    v14 = sub_10005E5AC();
    v15 = (void (*)(void))SiriKitIntentTip.notifySiriTipOnDisplay.getter(&type metadata for HowMuchTimeLeftOnLabeledTimer, v14);
    v17 = v16;
    v15();
    swift_release(v17);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10005D754(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[2] = a1;
  v4[3] = a4;
  v5 = type metadata accessor for MainActor(0);
  v4[4] = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_10005D7C0, v6, v7);
}

uint64_t sub_10005D7C0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = *(_QWORD **)(v0 + 24);
  v2 = swift_release(*(_QWORD *)(v0 + 32));
  v3 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v1) + 0x70))(v2);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "tipViewControllerWasInvalidatedWithSiriTipsController:", *(_QWORD *)(v0 + 24));
    swift_unknownObjectRelease(v4);
  }
  **(_BYTE **)(v0 + 16) = v4 == 0;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10005D840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[7] = a4;
  v5[8] = a5;
  v6 = type metadata accessor for MainActor(0);
  v5[9] = static MainActor.shared.getter(v6);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  return swift_task_switch(sub_10005D8AC, v7, v8);
}

uint64_t sub_10005D8AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 56);
  swift_release(*(_QWORD *)(v0 + 72));
  *(_QWORD *)(v0 + 40) = type metadata accessor for SetTimerWithLabelWithSiriTip(0);
  *(_QWORD *)(v0 + 48) = sub_10005DD0C(&qword_1000BF8A8, type metadata accessor for SetTimerWithLabelWithSiriTip, (uint64_t)&unk_10007AD18);
  v3 = sub_10005E98C((_QWORD *)(v0 + 16));
  sub_10005E670(v2, (uint64_t)v3);
  objc_allocWithZone((Class)type metadata accessor for TipUIView(0));
  v4 = TipUIView.init(_:arrowEdge:actionHandler:)(v0 + 16, 4, nullsub_11, 0);
  v5 = *(void **)(v1 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView) = v4;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10005D9A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v1 = OBJC_IVAR____TtC11MobileTimer18SiriTipsController_updateTipStatusTask;
  v2 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_updateTipStatusTask);
  if (v2)
  {
    swift_retain(*(_QWORD *)(v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_updateTipStatusTask));
    Task.cancel()();
    swift_release(v2);
    v3 = *(_QWORD *)(v0 + v1);
  }
  else
  {
    v3 = 0;
  }
  *(_QWORD *)(v0 + v1) = 0;
  swift_release(v3);
  v4 = OBJC_IVAR____TtC11MobileTimer18SiriTipsController_checkForSiriTipsTask;
  v5 = *(_QWORD *)(v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_checkForSiriTipsTask);
  if (v5)
  {
    swift_retain(*(_QWORD *)(v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_checkForSiriTipsTask));
    Task.cancel()();
    swift_release(v5);
    v6 = *(_QWORD *)(v0 + v4);
  }
  else
  {
    v6 = 0;
  }
  *(_QWORD *)(v0 + v4) = 0;
  swift_release(v6);
  v7 = *(void **)(v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView);
  *(_QWORD *)(v0 + OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView) = 0;

}

id SiriTipsController.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id SiriTipsController.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR____TtC11MobileTimer18SiriTipsController_delegate] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11MobileTimer18SiriTipsController_tipView] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11MobileTimer18SiriTipsController_checkForSiriTipsTask] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC11MobileTimer18SiriTipsController_updateTipStatusTask] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriTipsController();
  return objc_msgSendSuper2(&v2, "init");
}

void *sub_10005DB90()
{
  return &unk_10009A078;
}

unint64_t sub_10005DB9C()
{
  return 0xD00000000000001DLL;
}

uint64_t sub_10005DBB8()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_10005E44C(v0, qword_1000C03C8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C03C8);
  return Logger.init(subsystem:category:)(0xD00000000000001DLL, 0x800000010008DB90, 0x70695469726953, 0xE700000000000000);
}

uint64_t sub_10005DC2C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_10005DC44@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1000BFD50 != -1)
    swift_once(&qword_1000BFD50, sub_10005DBB8);
  v2 = type metadata accessor for Logger(0);
  v3 = sub_10005DC2C(v2, (uint64_t)qword_1000C03C8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_10005DCB4()
{
  return sub_10005DD0C(&qword_1000BF8A8, type metadata accessor for SetTimerWithLabelWithSiriTip, (uint64_t)&unk_10007AD18);
}

uint64_t sub_10005DCE0()
{
  return sub_10005DD0C(&qword_1000BF8B0, type metadata accessor for SetTimerWithLabelWithSiriTip, (uint64_t)&unk_10007AD78);
}

uint64_t sub_10005DD0C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

void *sub_10005DD4C()
{
  return &protocol witness table for String;
}

unint64_t sub_10005DD5C()
{
  unint64_t result;

  result = qword_1000BF8B8;
  if (!qword_1000BF8B8)
  {
    result = swift_getWitnessTable(&unk_10007ADF8, &type metadata for HowMuchTimeLeftOnLabeledTimer);
    atomic_store(result, (unint64_t *)&qword_1000BF8B8);
  }
  return result;
}

unint64_t sub_10005DDA4()
{
  unint64_t result;

  result = qword_1000BF8C0;
  if (!qword_1000BF8C0)
  {
    result = swift_getWitnessTable(&unk_10007AE58, &type metadata for HowMuchTimeLeftOnLabeledTimer);
    atomic_store(result, (unint64_t *)&qword_1000BF8C0);
  }
  return result;
}

uint64_t *sub_10005DDE8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v11);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    v7 = *(int *)(a3 + 24);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    swift_bridgeObjectRetain(v5);
    swift_bridgeObjectRetain(v6);
    v10 = sub_10005A514(&qword_1000BF840);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  return a1;
}

uint64_t sub_10005DE88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = sub_10005A514(&qword_1000BF840);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_10005DEDC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 24);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  v9 = sub_10005A514(&qword_1000BF840);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v7, v8, v9);
  return a1;
}

_QWORD *sub_10005DF50(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  v8 = a2[3];
  v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_10005A514(&qword_1000BF840);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

_OWORD *sub_10005DFF0(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_10005A514(&qword_1000BF840);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(v6, v7, v8);
  return a1;
}

_QWORD *sub_10005E050(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  v8 = a2[3];
  v9 = a1[3];
  a1[2] = a2[2];
  a1[3] = v8;
  swift_bridgeObjectRelease(v9);
  v10 = *(int *)(a3 + 24);
  v11 = (char *)a1 + v10;
  v12 = (char *)a2 + v10;
  v13 = sub_10005A514(&qword_1000BF840);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t sub_10005E0D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10005E0DC);
}

uint64_t sub_10005E0DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_10005A514(&qword_1000BF840);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v8);
  }
}

uint64_t sub_10005E15C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10005E168);
}

uint64_t sub_10005E168(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_10005A514(&qword_1000BF840);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

void sub_10005E1E0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_10007AEC0;
  v4[1] = &unk_10007AEC0;
  sub_10005E254(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
  }
}

void sub_10005E254(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!qword_1000BF920)
  {
    v2 = type metadata accessor for Tips.EmptyDonation(255);
    v3 = sub_10005DD0C(&qword_1000BF850, (uint64_t (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation, (uint64_t)&protocol conformance descriptor for Tips.EmptyDonation);
    v4 = sub_10005DD0C(&qword_1000BF858, (uint64_t (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation, (uint64_t)&protocol conformance descriptor for Tips.EmptyDonation);
    v5 = type metadata accessor for Tips.Event(a1, v2, v3, v4);
    if (!v6)
      atomic_store(v5, (unint64_t *)&qword_1000BF920);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for HowMuchTimeLeftOnLabeledTimer(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  return a1;
}

uint64_t destroy for HowMuchTimeLeftOnLabeledTimer(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for HowMuchTimeLeftOnLabeledTimer(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  *a1 = *a2;
  v3 = a2[1];
  v4 = a1[1];
  a1[1] = v3;
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRelease(v4);
  return a1;
}

__n128 initializeWithTake for HowMuchTimeLeftOnLabeledTimer(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for HowMuchTimeLeftOnLabeledTimer(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for HowMuchTimeLeftOnLabeledTimer(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for HowMuchTimeLeftOnLabeledTimer(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for HowMuchTimeLeftOnLabeledTimer()
{
  return &type metadata for HowMuchTimeLeftOnLabeledTimer;
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

uint64_t *sub_10005E44C(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10005E48C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10005E4F0;
  return v6(a1);
}

uint64_t sub_10005E4F0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10005E53C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000BF984);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10005EFC8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000BF980 + dword_1000BF980))(a1, v4);
}

unint64_t sub_10005E5AC()
{
  unint64_t result;

  result = qword_1000BF9A0;
  if (!qword_1000BF9A0)
  {
    result = swift_getWitnessTable(&unk_10007ADB0, &type metadata for HowMuchTimeLeftOnLabeledTimer);
    atomic_store(result, &qword_1000BF9A0);
  }
  return result;
}

uint64_t sub_10005E5F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10005A514(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10005E62C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SetTimerWithLabelWithSiriTip(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005E670(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SetTimerWithLabelWithSiriTip(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005E6B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = type metadata accessor for SetTimerWithLabelWithSiriTip(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  v8 = v0 + v4;
  swift_bridgeObjectRelease(*(_QWORD *)(v8 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v8 + 24));
  v9 = v8 + *(int *)(v1 + 24);
  v10 = sub_10005A514(&qword_1000BF840);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v7 + 8));
  return swift_deallocObject(v0, v7 + 16, v5);
}

uint64_t sub_10005E784()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(type metadata accessor for SetTimerWithLabelWithSiriTip(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = *(_QWORD *)(v0 + v4);
  v6 = v0 + v3;
  v7 = (uint64_t *)(v0 + ((v4 + 15) & 0xFFFFFFFFFFFFFFF8));
  v8 = *v7;
  v9 = v7[1];
  v10 = (_QWORD *)swift_task_alloc(dword_1000BF9AC);
  *(_QWORD *)(v1 + 16) = v10;
  *v10 = v1;
  v10[1] = sub_10005EFC8;
  return sub_10005CA6C((uint64_t)v10, v11, v12, v6, v5, v8, v9);
}

uint64_t sub_10005E820()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = type metadata accessor for SetTimerWithLabelWithSiriTip(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  v7 = v0 + v4;
  swift_bridgeObjectRelease(*(_QWORD *)(v7 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v7 + 24));
  v8 = v7 + *(int *)(v1 + 24);
  v9 = sub_10005A514(&qword_1000BF840);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);

  return swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10005E8D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(type metadata accessor for SetTimerWithLabelWithSiriTip(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = v0 + v3;
  v5 = *(_QWORD *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8));
  v6 = (_QWORD *)swift_task_alloc(dword_1000BF9BC);
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_10005EFC8;
  return sub_10005D840((uint64_t)v6, v7, v8, v4, v5);
}

uint64_t sub_10005E950(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SetTimerWithLabelWithSiriTip(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *sub_10005E98C(_QWORD *a1)
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

uint64_t sub_10005E9CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc(dword_1000BF9E4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10005EFC8;
  return sub_10005D754(a1, v6, v7, v4);
}

uint64_t sub_10005EA24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = type metadata accessor for SetTimerWithLabelWithSiriTip(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 40) & ~v3;
  v5 = v3 | 7;
  v6 = (*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  v7 = v0 + v4;
  swift_bridgeObjectRelease(*(_QWORD *)(v7 + 8));
  swift_bridgeObjectRelease(*(_QWORD *)(v7 + 24));
  v8 = v7 + *(int *)(v1 + 24);
  v9 = sub_10005A514(&qword_1000BF840);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + v6 + 8));
  return swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_10005EAE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(type metadata accessor for SetTimerWithLabelWithSiriTip(0) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = *(_QWORD *)(v0 + 32);
  v5 = v0 + v3;
  v6 = (uint64_t *)(v0 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  v7 = *v6;
  v8 = v6[1];
  v9 = (_QWORD *)swift_task_alloc(dword_1000BF9F4);
  *(_QWORD *)(v1 + 16) = v9;
  *v9 = v1;
  v9[1] = sub_10005EFC8;
  return sub_10005D5C4((uint64_t)v9, v10, v11, v4, v5, v7, v8);
}

uint64_t sub_10005EB78()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10005EBA0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10005EBCC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(v1 + 32);
  v5 = (_QWORD *)swift_task_alloc(dword_1000BFA0C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10005EFC8;
  return sub_10005D2B8(a1, v6, v7, v4);
}

uint64_t sub_10005EC24(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_10005EC8C;
  return v5(v2 + 32);
}

uint64_t sub_10005EC8C()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 24));
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_10005ECDC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000BFA1C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10005EFC8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000BFA18 + dword_1000BFA18))(a1, v4);
}

uint64_t sub_10005ED4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000BFA1C);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10005C9DC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000BFA18 + dword_1000BFA18))(a1, v4);
}

uint64_t sub_10005EDBC()
{
  return sub_10005DD0C(&qword_1000BF850, (uint64_t (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation, (uint64_t)&protocol conformance descriptor for Tips.EmptyDonation);
}

uint64_t sub_10005EDE8()
{
  return sub_10005DD0C(&qword_1000BF858, (uint64_t (*)(uint64_t))&type metadata accessor for Tips.EmptyDonation, (uint64_t)&protocol conformance descriptor for Tips.EmptyDonation);
}

unint64_t sub_10005EE14()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000BFA78;
  if (!qword_1000BFA78)
  {
    v1 = sub_10005A774(&qword_1000BFA50);
    sub_10005EE78();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.KeyPath<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000BFA78);
  }
  return result;
}

unint64_t sub_10005EE78()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000BFA80;
  if (!qword_1000BFA80)
  {
    v1 = sub_10005A774(&qword_1000BFA48);
    sub_10005EEF4(&qword_1000BFA88, &qword_1000BFA40, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Variable<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> PredicateExpressions.KeyPath<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000BFA80);
  }
  return result;
}

uint64_t sub_10005EEF4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10005A774(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10005EF34(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10005A774(a2);
    sub_10005EE14();
    sub_10005EEF4(&qword_1000BFA90, &qword_1000BFA38, (uint64_t)&protocol conformance descriptor for PredicateExpressions.Value<A>);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void sub_10005EFB4()
{
  swift_deletedMethodError();
  __break(1u);
}

uint64_t sub_10005EFDC()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

id sub_10005EFEC()
{
  uint64_t v0;
  uint64_t ObjCClassFromMetadata;
  id result;

  v0 = type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata(v0);
  result = objc_msgSend((id)objc_opt_self(NSBundle), "bundleForClass:", ObjCClassFromMetadata);
  qword_1000C0088 = (uint64_t)result;
  return result;
}

uint64_t sub_10005F03C()
{
  uint64_t v0;

  v0 = type metadata accessor for ColorResource(0);
  sub_10005E44C(v0, qword_1000C03E0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C03E0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ColorResource.init(name:bundle:)(0x4320746E65636341, 0xEC000000726F6C6FLL, (id)qword_1000C0088);
}

uint64_t sub_10005F0DC()
{
  return sub_100064BD8(&qword_1000C0090, (uint64_t (*)(_QWORD))&type metadata accessor for ColorResource, (uint64_t)qword_1000C03E0, (uint64_t)sub_10005F03C);
}

uint64_t sub_10005F100@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0090, (uint64_t (*)(_QWORD))&type metadata accessor for ColorResource, (uint64_t)qword_1000C03E0, (uint64_t)sub_10005F03C, a1);
}

uint64_t sub_10005F124()
{
  uint64_t v0;

  v0 = type metadata accessor for ColorResource(0);
  sub_10005E44C(v0, qword_1000C03F8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C03F8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ColorResource.init(name:bundle:)(0xD000000000000020, 0x800000010008EB70, (id)qword_1000C0088);
}

uint64_t sub_10005F1C0()
{
  return sub_100064BD8(&qword_1000C0098, (uint64_t (*)(_QWORD))&type metadata accessor for ColorResource, (uint64_t)qword_1000C03F8, (uint64_t)sub_10005F124);
}

uint64_t sub_10005F1E4@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0098, (uint64_t (*)(_QWORD))&type metadata accessor for ColorResource, (uint64_t)qword_1000C03F8, (uint64_t)sub_10005F124, a1);
}

uint64_t sub_10005F208()
{
  uint64_t v0;

  v0 = type metadata accessor for ColorResource(0);
  sub_10005E44C(v0, qword_1000C0410);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0410);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ColorResource.init(name:bundle:)(0xD000000000000022, 0x800000010008EB40, (id)qword_1000C0088);
}

uint64_t sub_10005F2A4()
{
  return sub_100064BD8(&qword_1000C00A0, (uint64_t (*)(_QWORD))&type metadata accessor for ColorResource, (uint64_t)qword_1000C0410, (uint64_t)sub_10005F208);
}

uint64_t sub_10005F2C8@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C00A0, (uint64_t (*)(_QWORD))&type metadata accessor for ColorResource, (uint64_t)qword_1000C0410, (uint64_t)sub_10005F208, a1);
}

uint64_t sub_10005F2EC()
{
  uint64_t v0;

  v0 = type metadata accessor for ColorResource(0);
  sub_10005E44C(v0, qword_1000C0428);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0428);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ColorResource.init(name:bundle:)(0xD000000000000010, 0x800000010008EB20, (id)qword_1000C0088);
}

uint64_t sub_10005F388()
{
  return sub_100064BD8(&qword_1000C00A8, (uint64_t (*)(_QWORD))&type metadata accessor for ColorResource, (uint64_t)qword_1000C0428, (uint64_t)sub_10005F2EC);
}

uint64_t sub_10005F3AC@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C00A8, (uint64_t (*)(_QWORD))&type metadata accessor for ColorResource, (uint64_t)qword_1000C0428, (uint64_t)sub_10005F2EC, a1);
}

uint64_t sub_10005F3D0()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0440);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0440);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0x4D72656B61657053, 0xEA00000000007861, (id)qword_1000C0088);
}

uint64_t sub_10005F46C()
{
  return sub_100064BD8(&qword_1000C00B0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0440, (uint64_t)sub_10005F3D0);
}

uint64_t sub_10005F490@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C00B0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0440, (uint64_t)sub_10005F3D0, a1);
}

uint64_t sub_10005F4B4()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0458);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0458);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0x4D72656B61657053, 0xEB00000000657475, (id)qword_1000C0088);
}

uint64_t sub_10005F554()
{
  return sub_100064BD8(&qword_1000C00B8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0458, (uint64_t)sub_10005F4B4);
}

uint64_t sub_10005F578@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C00B8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0458, (uint64_t)sub_10005F4B4, a1);
}

uint64_t sub_10005F59C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0470);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0470);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000019, 0x800000010008EB00, (id)qword_1000C0088);
}

uint64_t sub_10005F638()
{
  return sub_100064BD8(&qword_1000C00C0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0470, (uint64_t)sub_10005F59C);
}

uint64_t sub_10005F65C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C00C0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0470, (uint64_t)sub_10005F59C, a1);
}

uint64_t sub_10005F680()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0488);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0488);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000016, 0x800000010008EAE0, (id)qword_1000C0088);
}

uint64_t sub_10005F71C()
{
  return sub_100064BD8(&qword_1000C00C8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0488, (uint64_t)sub_10005F680);
}

uint64_t sub_10005F740@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C00C8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0488, (uint64_t)sub_10005F680, a1);
}

uint64_t sub_10005F764()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C04A0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C04A0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008EAC0, (id)qword_1000C0088);
}

uint64_t sub_10005F800()
{
  return sub_100064BD8(&qword_1000C00D0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C04A0, (uint64_t)sub_10005F764);
}

uint64_t sub_10005F824@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C00D0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C04A0, (uint64_t)sub_10005F764, a1);
}

uint64_t sub_10005F848()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C04B8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C04B8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008EAA0, (id)qword_1000C0088);
}

uint64_t sub_10005F8E4()
{
  return sub_100064BD8(&qword_1000C00D8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C04B8, (uint64_t)sub_10005F848);
}

uint64_t sub_10005F908@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C00D8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C04B8, (uint64_t)sub_10005F848, a1);
}

uint64_t sub_10005F92C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C04D0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C04D0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008EA80, (id)qword_1000C0088);
}

uint64_t sub_10005F9C8()
{
  return sub_100064BD8(&qword_1000C00E0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C04D0, (uint64_t)sub_10005F92C);
}

uint64_t sub_10005F9EC@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C00E0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C04D0, (uint64_t)sub_10005F92C, a1);
}

uint64_t sub_10005FA10()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C04E8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C04E8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008EA60, (id)qword_1000C0088);
}

uint64_t sub_10005FAAC()
{
  return sub_100064BD8(&qword_1000C00E8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C04E8, (uint64_t)sub_10005FA10);
}

uint64_t sub_10005FAD0@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C00E8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C04E8, (uint64_t)sub_10005FA10, a1);
}

uint64_t sub_10005FAF4()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0500);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0500);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008EA40, (id)qword_1000C0088);
}

uint64_t sub_10005FB90()
{
  return sub_100064BD8(&qword_1000C00F0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0500, (uint64_t)sub_10005FAF4);
}

uint64_t sub_10005FBB4@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C00F0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0500, (uint64_t)sub_10005FAF4, a1);
}

uint64_t sub_10005FBD8()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0518);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0518);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008EA20, (id)qword_1000C0088);
}

uint64_t sub_10005FC74()
{
  return sub_100064BD8(&qword_1000C00F8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0518, (uint64_t)sub_10005FBD8);
}

uint64_t sub_10005FC98@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C00F8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0518, (uint64_t)sub_10005FBD8, a1);
}

uint64_t sub_10005FCBC()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0530);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0530);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008EA00, (id)qword_1000C0088);
}

uint64_t sub_10005FD58()
{
  return sub_100064BD8(&qword_1000C0100, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0530, (uint64_t)sub_10005FCBC);
}

uint64_t sub_10005FD7C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0100, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0530, (uint64_t)sub_10005FCBC, a1);
}

uint64_t sub_10005FDA0()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0548);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0548);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E9E0, (id)qword_1000C0088);
}

uint64_t sub_10005FE3C()
{
  return sub_100064BD8(&qword_1000C0108, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0548, (uint64_t)sub_10005FDA0);
}

uint64_t sub_10005FE60@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0108, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0548, (uint64_t)sub_10005FDA0, a1);
}

uint64_t sub_10005FE84()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0560);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0560);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E9C0, (id)qword_1000C0088);
}

uint64_t sub_10005FF20()
{
  return sub_100064BD8(&qword_1000C0110, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0560, (uint64_t)sub_10005FE84);
}

uint64_t sub_10005FF44@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0110, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0560, (uint64_t)sub_10005FE84, a1);
}

uint64_t sub_10005FF68()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0578);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0578);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E9A0, (id)qword_1000C0088);
}

uint64_t sub_100060004()
{
  return sub_100064BD8(&qword_1000C0118, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0578, (uint64_t)sub_10005FF68);
}

uint64_t sub_100060028@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0118, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0578, (uint64_t)sub_10005FF68, a1);
}

uint64_t sub_10006004C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0590);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0590);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000016, 0x800000010008E980, (id)qword_1000C0088);
}

uint64_t sub_1000600E8()
{
  return sub_100064BD8(&qword_1000C0120, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0590, (uint64_t)sub_10006004C);
}

uint64_t sub_10006010C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0120, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0590, (uint64_t)sub_10006004C, a1);
}

uint64_t sub_100060130()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C05A8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C05A8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E960, (id)qword_1000C0088);
}

uint64_t sub_1000601CC()
{
  return sub_100064BD8(&qword_1000C0128, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C05A8, (uint64_t)sub_100060130);
}

uint64_t sub_1000601F0@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0128, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C05A8, (uint64_t)sub_100060130, a1);
}

uint64_t sub_100060214()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C05C0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C05C0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E940, (id)qword_1000C0088);
}

uint64_t sub_1000602B0()
{
  return sub_100064BD8(&qword_1000C0130, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C05C0, (uint64_t)sub_100060214);
}

uint64_t sub_1000602D4@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0130, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C05C0, (uint64_t)sub_100060214, a1);
}

uint64_t sub_1000602F8()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C05D8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C05D8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E920, (id)qword_1000C0088);
}

uint64_t sub_100060394()
{
  return sub_100064BD8(&qword_1000C0138, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C05D8, (uint64_t)sub_1000602F8);
}

uint64_t sub_1000603B8@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0138, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C05D8, (uint64_t)sub_1000602F8, a1);
}

uint64_t sub_1000603DC()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C05F0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C05F0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E900, (id)qword_1000C0088);
}

uint64_t sub_100060478()
{
  return sub_100064BD8(&qword_1000C0140, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C05F0, (uint64_t)sub_1000603DC);
}

uint64_t sub_10006049C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0140, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C05F0, (uint64_t)sub_1000603DC, a1);
}

uint64_t sub_1000604C0()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0608);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0608);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E8E0, (id)qword_1000C0088);
}

uint64_t sub_10006055C()
{
  return sub_100064BD8(&qword_1000C0148, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0608, (uint64_t)sub_1000604C0);
}

uint64_t sub_100060580@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0148, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0608, (uint64_t)sub_1000604C0, a1);
}

uint64_t sub_1000605A4()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0620);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0620);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E8C0, (id)qword_1000C0088);
}

uint64_t sub_100060640()
{
  return sub_100064BD8(&qword_1000C0150, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0620, (uint64_t)sub_1000605A4);
}

uint64_t sub_100060664@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0150, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0620, (uint64_t)sub_1000605A4, a1);
}

uint64_t sub_100060688()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0638);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0638);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E8A0, (id)qword_1000C0088);
}

uint64_t sub_100060724()
{
  return sub_100064BD8(&qword_1000C0158, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0638, (uint64_t)sub_100060688);
}

uint64_t sub_100060748@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0158, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0638, (uint64_t)sub_100060688, a1);
}

uint64_t sub_10006076C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0650);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0650);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E880, (id)qword_1000C0088);
}

uint64_t sub_100060808()
{
  return sub_100064BD8(&qword_1000C0160, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0650, (uint64_t)sub_10006076C);
}

uint64_t sub_10006082C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0160, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0650, (uint64_t)sub_10006076C, a1);
}

uint64_t sub_100060850()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0668);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0668);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E860, (id)qword_1000C0088);
}

uint64_t sub_1000608EC()
{
  return sub_100064BD8(&qword_1000C0168, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0668, (uint64_t)sub_100060850);
}

uint64_t sub_100060910@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0168, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0668, (uint64_t)sub_100060850, a1);
}

uint64_t sub_100060934()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0680);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0680);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E840, (id)qword_1000C0088);
}

uint64_t sub_1000609D0()
{
  return sub_100064BD8(&qword_1000C0170, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0680, (uint64_t)sub_100060934);
}

uint64_t sub_1000609F4@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0170, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0680, (uint64_t)sub_100060934, a1);
}

uint64_t sub_100060A18()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0698);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0698);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000016, 0x800000010008E820, (id)qword_1000C0088);
}

uint64_t sub_100060AB4()
{
  return sub_100064BD8(&qword_1000C0178, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0698, (uint64_t)sub_100060A18);
}

uint64_t sub_100060AD8@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0178, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0698, (uint64_t)sub_100060A18, a1);
}

uint64_t sub_100060AFC()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C06B0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C06B0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E800, (id)qword_1000C0088);
}

uint64_t sub_100060B98()
{
  return sub_100064BD8(&qword_1000C0180, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C06B0, (uint64_t)sub_100060AFC);
}

uint64_t sub_100060BBC@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0180, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C06B0, (uint64_t)sub_100060AFC, a1);
}

uint64_t sub_100060BE0()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C06C8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C06C8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E7E0, (id)qword_1000C0088);
}

uint64_t sub_100060C7C()
{
  return sub_100064BD8(&qword_1000C0188, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C06C8, (uint64_t)sub_100060BE0);
}

uint64_t sub_100060CA0@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0188, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C06C8, (uint64_t)sub_100060BE0, a1);
}

uint64_t sub_100060CC4()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C06E0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C06E0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E7C0, (id)qword_1000C0088);
}

uint64_t sub_100060D60()
{
  return sub_100064BD8(&qword_1000C0190, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C06E0, (uint64_t)sub_100060CC4);
}

uint64_t sub_100060D84@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0190, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C06E0, (uint64_t)sub_100060CC4, a1);
}

uint64_t sub_100060DA8()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C06F8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C06F8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E7A0, (id)qword_1000C0088);
}

uint64_t sub_100060E44()
{
  return sub_100064BD8(&qword_1000C0198, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C06F8, (uint64_t)sub_100060DA8);
}

uint64_t sub_100060E68@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0198, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C06F8, (uint64_t)sub_100060DA8, a1);
}

uint64_t sub_100060E8C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0710);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0710);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E780, (id)qword_1000C0088);
}

uint64_t sub_100060F28()
{
  return sub_100064BD8(&qword_1000C01A0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0710, (uint64_t)sub_100060E8C);
}

uint64_t sub_100060F4C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C01A0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0710, (uint64_t)sub_100060E8C, a1);
}

uint64_t sub_100060F70()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0728);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0728);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E760, (id)qword_1000C0088);
}

uint64_t sub_10006100C()
{
  return sub_100064BD8(&qword_1000C01A8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0728, (uint64_t)sub_100060F70);
}

uint64_t sub_100061030@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C01A8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0728, (uint64_t)sub_100060F70, a1);
}

uint64_t sub_100061054()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0740);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0740);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E740, (id)qword_1000C0088);
}

uint64_t sub_1000610F0()
{
  return sub_100064BD8(&qword_1000C01B0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0740, (uint64_t)sub_100061054);
}

uint64_t sub_100061114@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C01B0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0740, (uint64_t)sub_100061054, a1);
}

uint64_t sub_100061138()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0758);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0758);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E720, (id)qword_1000C0088);
}

uint64_t sub_1000611D4()
{
  return sub_100064BD8(&qword_1000C01B8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0758, (uint64_t)sub_100061138);
}

uint64_t sub_1000611F8@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C01B8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0758, (uint64_t)sub_100061138, a1);
}

uint64_t sub_10006121C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0770);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0770);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E700, (id)qword_1000C0088);
}

uint64_t sub_1000612B8()
{
  return sub_100064BD8(&qword_1000C01C0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0770, (uint64_t)sub_10006121C);
}

uint64_t sub_1000612DC@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C01C0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0770, (uint64_t)sub_10006121C, a1);
}

uint64_t sub_100061300()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0788);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0788);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E6E0, (id)qword_1000C0088);
}

uint64_t sub_10006139C()
{
  return sub_100064BD8(&qword_1000C01C8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0788, (uint64_t)sub_100061300);
}

uint64_t sub_1000613C0@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C01C8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0788, (uint64_t)sub_100061300, a1);
}

uint64_t sub_1000613E4()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C07A0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C07A0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000016, 0x800000010008E6C0, (id)qword_1000C0088);
}

uint64_t sub_100061480()
{
  return sub_100064BD8(&qword_1000C01D0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C07A0, (uint64_t)sub_1000613E4);
}

uint64_t sub_1000614A4@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C01D0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C07A0, (uint64_t)sub_1000613E4, a1);
}

uint64_t sub_1000614C8()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C07B8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C07B8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E6A0, (id)qword_1000C0088);
}

uint64_t sub_100061564()
{
  return sub_100064BD8(&qword_1000C01D8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C07B8, (uint64_t)sub_1000614C8);
}

uint64_t sub_100061588@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C01D8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C07B8, (uint64_t)sub_1000614C8, a1);
}

uint64_t sub_1000615AC()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C07D0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C07D0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E680, (id)qword_1000C0088);
}

uint64_t sub_100061648()
{
  return sub_100064BD8(&qword_1000C01E0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C07D0, (uint64_t)sub_1000615AC);
}

uint64_t sub_10006166C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C01E0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C07D0, (uint64_t)sub_1000615AC, a1);
}

uint64_t sub_100061690()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C07E8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C07E8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E660, (id)qword_1000C0088);
}

uint64_t sub_10006172C()
{
  return sub_100064BD8(&qword_1000C01E8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C07E8, (uint64_t)sub_100061690);
}

uint64_t sub_100061750@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C01E8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C07E8, (uint64_t)sub_100061690, a1);
}

uint64_t sub_100061774()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0800);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0800);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E640, (id)qword_1000C0088);
}

uint64_t sub_100061810()
{
  return sub_100064BD8(&qword_1000C01F0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0800, (uint64_t)sub_100061774);
}

uint64_t sub_100061834@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C01F0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0800, (uint64_t)sub_100061774, a1);
}

uint64_t sub_100061858()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0818);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0818);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E620, (id)qword_1000C0088);
}

uint64_t sub_1000618F4()
{
  return sub_100064BD8(&qword_1000C01F8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0818, (uint64_t)sub_100061858);
}

uint64_t sub_100061918@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C01F8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0818, (uint64_t)sub_100061858, a1);
}

uint64_t sub_10006193C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0830);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0830);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E600, (id)qword_1000C0088);
}

uint64_t sub_1000619D8()
{
  return sub_100064BD8(&qword_1000C0200, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0830, (uint64_t)sub_10006193C);
}

uint64_t sub_1000619FC@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0200, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0830, (uint64_t)sub_10006193C, a1);
}

uint64_t sub_100061A20()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0848);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0848);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E5E0, (id)qword_1000C0088);
}

uint64_t sub_100061ABC()
{
  return sub_100064BD8(&qword_1000C0208, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0848, (uint64_t)sub_100061A20);
}

uint64_t sub_100061AE0@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0208, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0848, (uint64_t)sub_100061A20, a1);
}

uint64_t sub_100061B04()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0860);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0860);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E5C0, (id)qword_1000C0088);
}

uint64_t sub_100061BA0()
{
  return sub_100064BD8(&qword_1000C0210, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0860, (uint64_t)sub_100061B04);
}

uint64_t sub_100061BC4@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0210, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0860, (uint64_t)sub_100061B04, a1);
}

uint64_t sub_100061BE8()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0878);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0878);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E5A0, (id)qword_1000C0088);
}

uint64_t sub_100061C84()
{
  return sub_100064BD8(&qword_1000C0218, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0878, (uint64_t)sub_100061BE8);
}

uint64_t sub_100061CA8@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0218, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0878, (uint64_t)sub_100061BE8, a1);
}

uint64_t sub_100061CCC()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0890);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0890);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E580, (id)qword_1000C0088);
}

uint64_t sub_100061D68()
{
  return sub_100064BD8(&qword_1000C0220, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0890, (uint64_t)sub_100061CCC);
}

uint64_t sub_100061D8C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0220, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0890, (uint64_t)sub_100061CCC, a1);
}

uint64_t sub_100061DB0()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C08A8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C08A8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000016, 0x800000010008E560, (id)qword_1000C0088);
}

uint64_t sub_100061E4C()
{
  return sub_100064BD8(&qword_1000C0228, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C08A8, (uint64_t)sub_100061DB0);
}

uint64_t sub_100061E70@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0228, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C08A8, (uint64_t)sub_100061DB0, a1);
}

uint64_t sub_100061E94()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C08C0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C08C0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E540, (id)qword_1000C0088);
}

uint64_t sub_100061F30()
{
  return sub_100064BD8(&qword_1000C0230, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C08C0, (uint64_t)sub_100061E94);
}

uint64_t sub_100061F54@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0230, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C08C0, (uint64_t)sub_100061E94, a1);
}

uint64_t sub_100061F78()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C08D8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C08D8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E520, (id)qword_1000C0088);
}

uint64_t sub_100062014()
{
  return sub_100064BD8(&qword_1000C0238, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C08D8, (uint64_t)sub_100061F78);
}

uint64_t sub_100062038@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0238, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C08D8, (uint64_t)sub_100061F78, a1);
}

uint64_t sub_10006205C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C08F0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C08F0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E500, (id)qword_1000C0088);
}

uint64_t sub_1000620F8()
{
  return sub_100064BD8(&qword_1000C0240, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C08F0, (uint64_t)sub_10006205C);
}

uint64_t sub_10006211C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0240, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C08F0, (uint64_t)sub_10006205C, a1);
}

uint64_t sub_100062140()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0908);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0908);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E4E0, (id)qword_1000C0088);
}

uint64_t sub_1000621DC()
{
  return sub_100064BD8(&qword_1000C0248, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0908, (uint64_t)sub_100062140);
}

uint64_t sub_100062200@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0248, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0908, (uint64_t)sub_100062140, a1);
}

uint64_t sub_100062224()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0920);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0920);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E4C0, (id)qword_1000C0088);
}

uint64_t sub_1000622C0()
{
  return sub_100064BD8(&qword_1000C0250, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0920, (uint64_t)sub_100062224);
}

uint64_t sub_1000622E4@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0250, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0920, (uint64_t)sub_100062224, a1);
}

uint64_t sub_100062308()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0938);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0938);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E4A0, (id)qword_1000C0088);
}

uint64_t sub_1000623A4()
{
  return sub_100064BD8(&qword_1000C0258, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0938, (uint64_t)sub_100062308);
}

uint64_t sub_1000623C8@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0258, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0938, (uint64_t)sub_100062308, a1);
}

uint64_t sub_1000623EC()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0950);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0950);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E480, (id)qword_1000C0088);
}

uint64_t sub_100062488()
{
  return sub_100064BD8(&qword_1000C0260, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0950, (uint64_t)sub_1000623EC);
}

uint64_t sub_1000624AC@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0260, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0950, (uint64_t)sub_1000623EC, a1);
}

uint64_t sub_1000624D0()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0968);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0968);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E460, (id)qword_1000C0088);
}

uint64_t sub_10006256C()
{
  return sub_100064BD8(&qword_1000C0268, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0968, (uint64_t)sub_1000624D0);
}

uint64_t sub_100062590@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0268, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0968, (uint64_t)sub_1000624D0, a1);
}

uint64_t sub_1000625B4()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0980);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0980);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E440, (id)qword_1000C0088);
}

uint64_t sub_100062650()
{
  return sub_100064BD8(&qword_1000C0270, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0980, (uint64_t)sub_1000625B4);
}

uint64_t sub_100062674@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0270, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0980, (uint64_t)sub_1000625B4, a1);
}

uint64_t sub_100062698()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0998);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0998);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E420, (id)qword_1000C0088);
}

uint64_t sub_100062734()
{
  return sub_100064BD8(&qword_1000C0278, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0998, (uint64_t)sub_100062698);
}

uint64_t sub_100062758@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0278, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0998, (uint64_t)sub_100062698, a1);
}

uint64_t sub_10006277C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C09B0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C09B0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000016, 0x800000010008E400, (id)qword_1000C0088);
}

uint64_t sub_100062818()
{
  return sub_100064BD8(&qword_1000C0280, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C09B0, (uint64_t)sub_10006277C);
}

uint64_t sub_10006283C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0280, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C09B0, (uint64_t)sub_10006277C, a1);
}

uint64_t sub_100062860()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C09C8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C09C8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E3E0, (id)qword_1000C0088);
}

uint64_t sub_1000628FC()
{
  return sub_100064BD8(&qword_1000C0288, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C09C8, (uint64_t)sub_100062860);
}

uint64_t sub_100062920@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0288, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C09C8, (uint64_t)sub_100062860, a1);
}

uint64_t sub_100062944()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C09E0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C09E0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E3C0, (id)qword_1000C0088);
}

uint64_t sub_1000629E0()
{
  return sub_100064BD8(&qword_1000C0290, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C09E0, (uint64_t)sub_100062944);
}

uint64_t sub_100062A04@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0290, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C09E0, (uint64_t)sub_100062944, a1);
}

uint64_t sub_100062A28()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C09F8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C09F8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E3A0, (id)qword_1000C0088);
}

uint64_t sub_100062AC4()
{
  return sub_100064BD8(&qword_1000C0298, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C09F8, (uint64_t)sub_100062A28);
}

uint64_t sub_100062AE8@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0298, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C09F8, (uint64_t)sub_100062A28, a1);
}

uint64_t sub_100062B0C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0A10);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0A10);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E380, (id)qword_1000C0088);
}

uint64_t sub_100062BA8()
{
  return sub_100064BD8(&qword_1000C02A0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0A10, (uint64_t)sub_100062B0C);
}

uint64_t sub_100062BCC@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C02A0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0A10, (uint64_t)sub_100062B0C, a1);
}

uint64_t sub_100062BF0()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0A28);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0A28);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E360, (id)qword_1000C0088);
}

uint64_t sub_100062C8C()
{
  return sub_100064BD8(&qword_1000C02A8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0A28, (uint64_t)sub_100062BF0);
}

uint64_t sub_100062CB0@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C02A8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0A28, (uint64_t)sub_100062BF0, a1);
}

uint64_t sub_100062CD4()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0A40);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0A40);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E340, (id)qword_1000C0088);
}

uint64_t sub_100062D70()
{
  return sub_100064BD8(&qword_1000C02B0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0A40, (uint64_t)sub_100062CD4);
}

uint64_t sub_100062D94@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C02B0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0A40, (uint64_t)sub_100062CD4, a1);
}

uint64_t sub_100062DB8()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0A58);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0A58);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E320, (id)qword_1000C0088);
}

uint64_t sub_100062E54()
{
  return sub_100064BD8(&qword_1000C02B8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0A58, (uint64_t)sub_100062DB8);
}

uint64_t sub_100062E78@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C02B8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0A58, (uint64_t)sub_100062DB8, a1);
}

uint64_t sub_100062E9C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0A70);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0A70);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E300, (id)qword_1000C0088);
}

uint64_t sub_100062F38()
{
  return sub_100064BD8(&qword_1000C02C0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0A70, (uint64_t)sub_100062E9C);
}

uint64_t sub_100062F5C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C02C0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0A70, (uint64_t)sub_100062E9C, a1);
}

uint64_t sub_100062F80()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0A88);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0A88);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E2E0, (id)qword_1000C0088);
}

uint64_t sub_10006301C()
{
  return sub_100064BD8(&qword_1000C02C8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0A88, (uint64_t)sub_100062F80);
}

uint64_t sub_100063040@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C02C8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0A88, (uint64_t)sub_100062F80, a1);
}

uint64_t sub_100063064()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0AA0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0AA0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E2C0, (id)qword_1000C0088);
}

uint64_t sub_100063100()
{
  return sub_100064BD8(&qword_1000C02D0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0AA0, (uint64_t)sub_100063064);
}

uint64_t sub_100063124@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C02D0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0AA0, (uint64_t)sub_100063064, a1);
}

uint64_t sub_100063148()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0AB8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0AB8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000016, 0x800000010008E2A0, (id)qword_1000C0088);
}

uint64_t sub_1000631E4()
{
  return sub_100064BD8(&qword_1000C02D8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0AB8, (uint64_t)sub_100063148);
}

uint64_t sub_100063208@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C02D8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0AB8, (uint64_t)sub_100063148, a1);
}

uint64_t sub_10006322C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0AD0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0AD0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E280, (id)qword_1000C0088);
}

uint64_t sub_1000632C8()
{
  return sub_100064BD8(&qword_1000C02E0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0AD0, (uint64_t)sub_10006322C);
}

uint64_t sub_1000632EC@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C02E0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0AD0, (uint64_t)sub_10006322C, a1);
}

uint64_t sub_100063310()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0AE8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0AE8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E260, (id)qword_1000C0088);
}

uint64_t sub_1000633AC()
{
  return sub_100064BD8(&qword_1000C02E8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0AE8, (uint64_t)sub_100063310);
}

uint64_t sub_1000633D0@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C02E8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0AE8, (uint64_t)sub_100063310, a1);
}

uint64_t sub_1000633F4()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0B00);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0B00);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E240, (id)qword_1000C0088);
}

uint64_t sub_100063490()
{
  return sub_100064BD8(&qword_1000C02F0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B00, (uint64_t)sub_1000633F4);
}

uint64_t sub_1000634B4@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C02F0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B00, (uint64_t)sub_1000633F4, a1);
}

uint64_t sub_1000634D8()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0B18);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0B18);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E220, (id)qword_1000C0088);
}

uint64_t sub_100063574()
{
  return sub_100064BD8(&qword_1000C02F8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B18, (uint64_t)sub_1000634D8);
}

uint64_t sub_100063598@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C02F8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B18, (uint64_t)sub_1000634D8, a1);
}

uint64_t sub_1000635BC()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0B30);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0B30);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E200, (id)qword_1000C0088);
}

uint64_t sub_100063658()
{
  return sub_100064BD8(&qword_1000C0300, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B30, (uint64_t)sub_1000635BC);
}

uint64_t sub_10006367C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0300, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B30, (uint64_t)sub_1000635BC, a1);
}

uint64_t sub_1000636A0()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0B48);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0B48);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E1E0, (id)qword_1000C0088);
}

uint64_t sub_10006373C()
{
  return sub_100064BD8(&qword_1000C0308, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B48, (uint64_t)sub_1000636A0);
}

uint64_t sub_100063760@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0308, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B48, (uint64_t)sub_1000636A0, a1);
}

uint64_t sub_100063784()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0B60);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0B60);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E1C0, (id)qword_1000C0088);
}

uint64_t sub_100063820()
{
  return sub_100064BD8(&qword_1000C0310, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B60, (uint64_t)sub_100063784);
}

uint64_t sub_100063844@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0310, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B60, (uint64_t)sub_100063784, a1);
}

uint64_t sub_100063868()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0B78);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0B78);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E1A0, (id)qword_1000C0088);
}

uint64_t sub_100063904()
{
  return sub_100064BD8(&qword_1000C0318, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B78, (uint64_t)sub_100063868);
}

uint64_t sub_100063928@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0318, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B78, (uint64_t)sub_100063868, a1);
}

uint64_t sub_10006394C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0B90);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0B90);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E180, (id)qword_1000C0088);
}

uint64_t sub_1000639E8()
{
  return sub_100064BD8(&qword_1000C0320, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B90, (uint64_t)sub_10006394C);
}

uint64_t sub_100063A0C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0320, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0B90, (uint64_t)sub_10006394C, a1);
}

uint64_t sub_100063A30()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0BA8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0BA8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E160, (id)qword_1000C0088);
}

uint64_t sub_100063ACC()
{
  return sub_100064BD8(&qword_1000C0328, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0BA8, (uint64_t)sub_100063A30);
}

uint64_t sub_100063AF0@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0328, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0BA8, (uint64_t)sub_100063A30, a1);
}

uint64_t sub_100063B14()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0BC0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0BC0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000016, 0x800000010008E140, (id)qword_1000C0088);
}

uint64_t sub_100063BB0()
{
  return sub_100064BD8(&qword_1000C0330, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0BC0, (uint64_t)sub_100063B14);
}

uint64_t sub_100063BD4@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0330, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0BC0, (uint64_t)sub_100063B14, a1);
}

uint64_t sub_100063BF8()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0BD8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0BD8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E120, (id)qword_1000C0088);
}

uint64_t sub_100063C94()
{
  return sub_100064BD8(&qword_1000C0338, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0BD8, (uint64_t)sub_100063BF8);
}

uint64_t sub_100063CB8@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0338, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0BD8, (uint64_t)sub_100063BF8, a1);
}

uint64_t sub_100063CDC()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0BF0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0BF0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E100, (id)qword_1000C0088);
}

uint64_t sub_100063D78()
{
  return sub_100064BD8(&qword_1000C0340, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0BF0, (uint64_t)sub_100063CDC);
}

uint64_t sub_100063D9C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0340, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0BF0, (uint64_t)sub_100063CDC, a1);
}

uint64_t sub_100063DC0()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0C08);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0C08);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E0E0, (id)qword_1000C0088);
}

uint64_t sub_100063E5C()
{
  return sub_100064BD8(&qword_1000C0348, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C08, (uint64_t)sub_100063DC0);
}

uint64_t sub_100063E80@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0348, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C08, (uint64_t)sub_100063DC0, a1);
}

uint64_t sub_100063EA4()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0C20);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0C20);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E0C0, (id)qword_1000C0088);
}

uint64_t sub_100063F40()
{
  return sub_100064BD8(&qword_1000C0350, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C20, (uint64_t)sub_100063EA4);
}

uint64_t sub_100063F64@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0350, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C20, (uint64_t)sub_100063EA4, a1);
}

uint64_t sub_100063F88()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0C38);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0C38);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E0A0, (id)qword_1000C0088);
}

uint64_t sub_100064024()
{
  return sub_100064BD8(&qword_1000C0358, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C38, (uint64_t)sub_100063F88);
}

uint64_t sub_100064048@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0358, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C38, (uint64_t)sub_100063F88, a1);
}

uint64_t sub_10006406C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0C50);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0C50);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E080, (id)qword_1000C0088);
}

uint64_t sub_100064108()
{
  return sub_100064BD8(&qword_1000C0360, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C50, (uint64_t)sub_10006406C);
}

uint64_t sub_10006412C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0360, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C50, (uint64_t)sub_10006406C, a1);
}

uint64_t sub_100064150()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0C68);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0C68);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000017, 0x800000010008E060, (id)qword_1000C0088);
}

uint64_t sub_1000641EC()
{
  return sub_100064BD8(&qword_1000C0368, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C68, (uint64_t)sub_100064150);
}

uint64_t sub_100064210@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0368, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C68, (uint64_t)sub_100064150, a1);
}

uint64_t sub_100064234()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0C80);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0C80);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000016, 0x800000010008E040, (id)qword_1000C0088);
}

uint64_t sub_1000642D0()
{
  return sub_100064BD8(&qword_1000C0370, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C80, (uint64_t)sub_100064234);
}

uint64_t sub_1000642F4@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0370, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C80, (uint64_t)sub_100064234, a1);
}

uint64_t sub_100064318()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0C98);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0C98);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000011, 0x800000010008E020, (id)qword_1000C0088);
}

uint64_t sub_1000643B4()
{
  return sub_100064BD8(&qword_1000C0378, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C98, (uint64_t)sub_100064318);
}

uint64_t sub_1000643D8@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0378, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0C98, (uint64_t)sub_100064318, a1);
}

uint64_t sub_1000643FC()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0CB0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0CB0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000011, 0x800000010008E000, (id)qword_1000C0088);
}

uint64_t sub_100064498()
{
  return sub_100064BD8(&qword_1000C0380, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0CB0, (uint64_t)sub_1000643FC);
}

uint64_t sub_1000644BC@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0380, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0CB0, (uint64_t)sub_1000643FC, a1);
}

uint64_t sub_1000644E0()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0CC8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0CC8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000011, 0x800000010008DFE0, (id)qword_1000C0088);
}

uint64_t sub_10006457C()
{
  return sub_100064BD8(&qword_1000C0388, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0CC8, (uint64_t)sub_1000644E0);
}

uint64_t sub_1000645A0@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0388, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0CC8, (uint64_t)sub_1000644E0, a1);
}

uint64_t sub_1000645C4()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0CE0);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0CE0);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000011, 0x800000010008DFC0, (id)qword_1000C0088);
}

uint64_t sub_100064660()
{
  return sub_100064BD8(&qword_1000C0390, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0CE0, (uint64_t)sub_1000645C4);
}

uint64_t sub_100064684@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0390, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0CE0, (uint64_t)sub_1000645C4, a1);
}

uint64_t sub_1000646A8()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0CF8);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0CF8);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000014, 0x800000010008DFA0, (id)qword_1000C0088);
}

uint64_t sub_100064744()
{
  return sub_100064BD8(&qword_1000C0398, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0CF8, (uint64_t)sub_1000646A8);
}

uint64_t sub_100064768@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C0398, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0CF8, (uint64_t)sub_1000646A8, a1);
}

uint64_t sub_10006478C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0D10);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0D10);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000010, 0x800000010008DF80, (id)qword_1000C0088);
}

uint64_t sub_100064828()
{
  return sub_100064BD8(&qword_1000C03A0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0D10, (uint64_t)sub_10006478C);
}

uint64_t sub_10006484C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C03A0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0D10, (uint64_t)sub_10006478C, a1);
}

uint64_t sub_100064870()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0D28);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0D28);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000014, 0x800000010008DF60, (id)qword_1000C0088);
}

uint64_t sub_10006490C()
{
  return sub_100064BD8(&qword_1000C03A8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0D28, (uint64_t)sub_100064870);
}

uint64_t sub_100064930@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C03A8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0D28, (uint64_t)sub_100064870, a1);
}

uint64_t sub_100064954()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0D40);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0D40);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0xD000000000000010, 0x800000010008DF40, (id)qword_1000C0088);
}

uint64_t sub_1000649F0()
{
  return sub_100064BD8(&qword_1000C03B0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0D40, (uint64_t)sub_100064954);
}

uint64_t sub_100064A14@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C03B0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0D40, (uint64_t)sub_100064954, a1);
}

uint64_t sub_100064A38()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0D58);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0D58);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0x6D69547065656C73, 0xE900000000000065, (id)qword_1000C0088);
}

uint64_t sub_100064AD4()
{
  return sub_100064BD8(&qword_1000C03B8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0D58, (uint64_t)sub_100064A38);
}

uint64_t sub_100064AF8@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C03B8, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0D58, (uint64_t)sub_100064A38, a1);
}

uint64_t sub_100064B1C()
{
  uint64_t v0;

  v0 = type metadata accessor for ImageResource(0);
  sub_10005E44C(v0, qword_1000C0D70);
  sub_10005DC2C(v0, (uint64_t)qword_1000C0D70);
  if (qword_1000C0080 != -1)
    swift_once(&qword_1000C0080, sub_10005EFEC);
  return ImageResource.init(name:bundle:)(0x656D6954656B6177, 0xE800000000000000, (id)qword_1000C0088);
}

uint64_t sub_100064BB4()
{
  return sub_100064BD8(&qword_1000C03C0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0D70, (uint64_t)sub_100064B1C);
}

uint64_t sub_100064BD8(_QWORD *a1, uint64_t (*a2)(_QWORD), uint64_t a3, uint64_t a4)
{
  uint64_t v6;

  if (*a1 != -1)
    swift_once(a1, a4);
  v6 = a2(0);
  return sub_10005DC2C(v6, a3);
}

uint64_t sub_100064C1C@<X0>(uint64_t a1@<X8>)
{
  return sub_100064C40(&qword_1000C03C0, (uint64_t (*)(_QWORD))&type metadata accessor for ImageResource, (uint64_t)qword_1000C0D70, (uint64_t)sub_100064B1C, a1);
}

uint64_t sub_100064C40@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;

  if (*a1 != -1)
    swift_once(a1, a4);
  v8 = a2(0);
  v9 = sub_10005DC2C(v8, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a5, v9, v8);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC11MobileTimerP33_345EC15CCBCBB0F083B016B853C8D68119ResourceBundleClass);
}

void sub_100064CCC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@ missing alarm identifier", (uint8_t *)&v2, 0xCu);
}

void sub_100064D40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100019C08((void *)&_mh_execute_header, a1, a3, "Timer state unknown", a5, a6, a7, a8, 0);
}

void sub_100064D74(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@ Current timer not found!", (uint8_t *)&v3, 0xCu);
}

void sub_100064DEC(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "timerID"));
  v5 = 138543618;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@ started timer: %{public}@", (uint8_t *)&v5, 0x16u);

}

void sub_100064E98(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "timerID"));
  v7 = 138543874;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  v11 = 2114;
  v12 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@ starting timer: %{public}@ completed with error: %{public}@", (uint8_t *)&v7, 0x20u);

}

void sub_100064F50()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "HKFeatureIdentifier getHKFeatureIdentifierSleepCoaching(void)"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTASleepCoordinator.m"), 41, CFSTR("%s"), dlerror());

  __break(1u);
}

void sub_100064FC4()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getHKHealthStoreClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTASleepCoordinator.m"), 40, CFSTR("Unable to find class %s"), "HKHealthStore");

  __break(1u);
}

void sub_10006503C(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *HealthKitLibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTASleepCoordinator.m"), 37, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_1000650B8(_QWORD *a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void *SleepHealthUILibrary(void)"));
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MTASleepCoordinator.m"), 36, CFSTR("%s"), *a1);

  __break(1u);
}

void sub_100065134()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "Class getHKSHQuickScheduleManagementViewControllerClass(void)_block_invoke"));
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("MTASleepCoordinator.m"), 39, CFSTR("Unable to find class %s"), "HKSHQuickScheduleManagementViewController");

  __break(1u);
}

void sub_1000651AC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  sub_10001E8A8((void *)&_mh_execute_header, a2, a3, "%{public}@ didFailToContinueUserActivityWithType, error: %{public}@ ", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_10001E8D4();
}

void sub_10006521C()
{
  uint64_t v0;
  os_log_t v1;

  sub_10001E8BC();
  sub_10001E8A8((void *)&_mh_execute_header, v0, v1, "%{public}@: Could not query city name: %{public}@ from app support");
  sub_10001E8D4();
}

void sub_100065284(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to reload alarm widget timeline, error: %{public}@", (uint8_t *)&v4, 0x16u);
}

void sub_10006530C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  sub_10001E8A8((void *)&_mh_execute_header, a2, a3, "%{public}@ error decoding latest event: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
}

void sub_100065380(_QWORD *a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  sub_10001E8A8((void *)&_mh_execute_header, a2, a3, "%{public}@ error encoding: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
}

void sub_1000653F8()
{
  uint64_t v0;
  os_log_t v1;

  sub_10003772C();
  sub_10001E8A8((void *)&_mh_execute_header, v0, v1, "%{public}@ migration encountered error: %{public}@");
}

void sub_100065460()
{
  uint64_t v0;
  os_log_t v1;

  sub_10003772C();
  sub_10001E8A8((void *)&_mh_execute_header, v0, v1, "%{public}@ error fetching stopwatches: %{public}@");
}

void sub_1000654C8()
{
  NSObject *v0;
  void *v1;
  const char *v2;
  uint8_t v3[24];

  sub_1000450B4();
  sub_1000450AC(v1, v2);
  sub_100045080();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Unable to get recent timer duration at index: %{public}ld. Current total is %{public}ld", v3, 0x16u);
  sub_100045060();
}

void sub_100065540()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1000450B4();
  sub_1000450AC(v0, v1);
  sub_100045080();
  sub_10004506C((void *)&_mh_execute_header, v2, v3, "Index: %{public}ld exceeds number of recent timer durations: %{public}ld", v4, v5, v6, v7, v8);
  sub_100045060();
}

void sub_1000655A8(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1000450AC(a1, a2);
  sub_100045098((void *)&_mh_execute_header, v2, v3, "No active timer at row %{public}ld", v4, v5, v6, v7, 0);
  sub_100045060();
}

void sub_100065614()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_1000450B4();
  sub_1000450AC(v0, v1);
  sub_100045080();
  sub_10004506C((void *)&_mh_execute_header, v2, v3, "Index: %{public}ld exceeds number of active of timers: %{public}ld", v4, v5, v6, v7, v8);
  sub_100045060();
}

void sub_10006567C(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_1000450AC(a1, a2);
  sub_100045098((void *)&_mh_execute_header, v2, v3, "No recent timer duration at row %{public}ld", v4, v5, v6, v7, 0);
  sub_100045060();
}

void sub_1000656E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "timerID"));
  sub_10004506C((void *)&_mh_execute_header, v1, v2, "%{public}@ started timer: %{public}@", v3, v4, v5, v6, 2u);

}

void sub_100065784()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  void *v8;
  __int16 v9;
  uint64_t v10;

  sub_1000450B4();
  v3 = *(_QWORD *)(v2 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v2 + 40), "timerID"));
  v5 = 138543874;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = v1;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%{public}@ starting timer: %{public}@ completed with error: %{public}@", (uint8_t *)&v5, 0x20u);

}

void sub_100065838()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100055D60();
  sub_100055D54((void *)&_mh_execute_header, v0, v1, "Invalid MTATimerListSection: %ld", v2);
  sub_10001E8D4();
}

void sub_10006589C(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "dataSource"));
  objc_msgSend(v3, "numberOfActiveTimers");
  sub_100055D60();
  sub_100055D54((void *)&_mh_execute_header, a2, v4, "Returning single timer cell but numberOfActiveTimers is %lu (should be 0 or 1 instead)", v5);

  sub_100045060();
}

void sub_100065920()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100055D60();
  sub_100055D54((void *)&_mh_execute_header, v0, v1, "%{public}@ unable to fetch active timer, aborting", v2);
  sub_10001E8D4();
}

void sub_100065984(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  id v7;

  v4 = 138543618;
  v5 = a1;
  v6 = 2048;
  v7 = objc_msgSend(a2, "state");
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%{public}@ timerTick unexpected timer state %ld", (uint8_t *)&v4, 0x16u);
  sub_100045060();
}

void sub_100065A18(uint64_t a1, NSObject *a2, double a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  double v6;

  v3 = 138543618;
  v4 = a1;
  v5 = 2048;
  v6 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@ Passing in invalid duration to picker: %f", (uint8_t *)&v3, 0x16u);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGColor");
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGImage");
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGPath");
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "CGRectValue");
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLContexts");
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForResource:withExtension:");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__accessibilitySetInterfaceStyleIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accessibilitySetInterfaceStyleIntent:");
}

id objc_msgSend__addAlarm_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAlarm:withCompletionBlock:");
}

id objc_msgSend__addAutolayoutConstraintsForNoResultsFoundLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAutolayoutConstraintsForNoResultsFoundLabel");
}

id objc_msgSend__addLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addLayoutGuide:");
}

id objc_msgSend__calculateVerticalMultiplierForKeyboard(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateVerticalMultiplierForKeyboard");
}

id objc_msgSend__changeButtonWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_changeButtonWidth");
}

id objc_msgSend__clearButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clearButton");
}

id objc_msgSend__clockLabelTextFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_clockLabelTextFont");
}

id objc_msgSend__commonInitialization(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_commonInitialization");
}

id objc_msgSend__configureAndAddButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_configureAndAddButton:");
}

id objc_msgSend__dateUnderSelectionBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dateUnderSelectionBar");
}

id objc_msgSend__defaultTraitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_defaultTraitCollection");
}

id objc_msgSend__enumerateItemsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateItemsUsingBlock:");
}

id objc_msgSend__fadeLabelForComponent_toText_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fadeLabelForComponent:toText:animated:");
}

id objc_msgSend__firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_firstBaselineOffsetFromTop");
}

id objc_msgSend__flatImageWithColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_flatImageWithColor:");
}

id objc_msgSend__handleAddSpecifierForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAddSpecifierForSection:");
}

id objc_msgSend__handleDefaultSpecifierForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDefaultSpecifierForSection:");
}

id objc_msgSend__handleEditSpecifierForSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleEditSpecifierForSection:");
}

id objc_msgSend__handleNumberOfItemsDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleNumberOfItemsDidChange");
}

id objc_msgSend__hoursStringForHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hoursStringForHour:");
}

id objc_msgSend__initWithAlertType_tableViewStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithAlertType:tableViewStyle:");
}

id objc_msgSend__interactiveInsetGroupedHeaderConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_interactiveInsetGroupedHeaderConfiguration");
}

id objc_msgSend__isAlarmsSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isAlarmsSection:");
}

id objc_msgSend__isWakeAlarmSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isWakeAlarmSection:");
}

id objc_msgSend__labelForComponent_createIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_labelForComponent:createIfNecessary:");
}

id objc_msgSend__lastLineBaseline(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lastLineBaseline");
}

id objc_msgSend__layoutNoItemsLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutNoItemsLabel");
}

id objc_msgSend__legacy_sizeWithFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_legacy_sizeWithFont:");
}

id objc_msgSend__lightSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lightSystemFontOfSize:");
}

id objc_msgSend__makeNewComponentLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_makeNewComponentLabel");
}

id objc_msgSend__marginWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_marginWidth");
}

id objc_msgSend__minutesCircleCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_minutesCircleCenter:");
}

id objc_msgSend__minutesStringForMinutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_minutesStringForMinutes:");
}

id objc_msgSend__naui_beginDebuggingAutolayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_naui_beginDebuggingAutolayout");
}

id objc_msgSend__numberOfItemsDidChangeAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_numberOfItemsDidChangeAnimated:");
}

id objc_msgSend__performScrollTest_iterations_delta_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performScrollTest:iterations:delta:");
}

id objc_msgSend__performWithoutDeferringTransitions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performWithoutDeferringTransitions:");
}

id objc_msgSend__positionLabel_forComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_positionLabel:forComponent:");
}

id objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFontForTextStyle:maximumContentSizeCategory:");
}

id objc_msgSend__preferredFontForTextStyle_maximumContentSizeCategory_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preferredFontForTextStyle:maximumContentSizeCategory:compatibleWithTraitCollection:");
}

id objc_msgSend__presentAddEditForTimer_isNewTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentAddEditForTimer:isNewTimer:");
}

id objc_msgSend__reloadData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadData:");
}

id objc_msgSend__reloadDataIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadDataIfNecessary");
}

id objc_msgSend__reloadNoResultsFoundLabelForKeyboardNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadNoResultsFoundLabelForKeyboardNotification:");
}

id objc_msgSend__reloadUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadUI:");
}

id objc_msgSend__removeAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAlarm:");
}

id objc_msgSend__removeAlarm_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAlarm:withCompletionBlock:");
}

id objc_msgSend__removeAutolayoutConstraintsForNoResultsFoundLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeAutolayoutConstraintsForNoResultsFoundLabel");
}

id objc_msgSend__removeTimer_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeTimer:withCompletionBlock:");
}

id objc_msgSend__restoreIdleTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_restoreIdleTimer");
}

id objc_msgSend__runResizeTest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runResizeTest");
}

id objc_msgSend__runRotationTest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runRotationTest");
}

id objc_msgSend__runScrollTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runScrollTest:");
}

id objc_msgSend__runSelectTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runSelectTest:");
}

id objc_msgSend__scaledValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaledValueForValue:");
}

id objc_msgSend__scrollToAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollToAlarm:");
}

id objc_msgSend__secondsStringForSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_secondsStringForSeconds:");
}

id objc_msgSend__selectViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectViewController:");
}

id objc_msgSend__separatorFrame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_separatorFrame");
}

id objc_msgSend__setBackdropStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBackdropStyle:");
}

id objc_msgSend__setBottomPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBottomPadding:");
}

id objc_msgSend__setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCornerRadius:");
}

id objc_msgSend__setDisplaysCellContentStringsOnTapAndHold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDisplaysCellContentStringsOnTapAndHold:");
}

id objc_msgSend__setFirstLineBaselineFrameOriginY_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFirstLineBaselineFrameOriginY:");
}

id objc_msgSend__setForcesClearButtonHighContrastAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setForcesClearButtonHighContrastAppearance:");
}

id objc_msgSend__setLabel_forComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setLabel:forComponent:");
}

id objc_msgSend__setMarginWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setMarginWidth:");
}

id objc_msgSend__setObservableScrollView_forEdges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setObservableScrollView:forEdges:");
}

id objc_msgSend__setOrderingDirectionMappings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOrderingDirectionMappings:");
}

id objc_msgSend__setOrderingProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setOrderingProperties:");
}

id objc_msgSend__setSelected_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSelected:");
}

id objc_msgSend__setSelectionBarIgnoresInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setSelectionBarIgnoresInset:");
}

id objc_msgSend__setTopPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTopPadding:");
}

id objc_msgSend__setTouchInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTouchInsets:");
}

id objc_msgSend__shouldStackViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldStackViews");
}

id objc_msgSend__shouldUseRegularLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldUseRegularLayout");
}

id objc_msgSend__showNoResultsFound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showNoResultsFound:");
}

id objc_msgSend__showSelectedIndicator_changeSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showSelectedIndicator:changeSelection:");
}

id objc_msgSend__spinMainRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_spinMainRunLoop");
}

id objc_msgSend__titleLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titleLabel");
}

id objc_msgSend__updateAlarm_reload_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAlarm:reload:withCompletionBlock:");
}

id objc_msgSend__updateAlarm_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAlarm:withCompletionBlock:");
}

id objc_msgSend__updateCurrentLapCell(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCurrentLapCell");
}

id objc_msgSend__updateLabels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLabels:");
}

id objc_msgSend__updateLapExtrema(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLapExtrema");
}

id objc_msgSend__viewAvailabelWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_viewAvailabelWidth");
}

id objc_msgSend__web_createDirectoryAtPathWithIntermediateDirectories_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_web_createDirectoryAtPathWithIntermediateDirectories:attributes:");
}

id objc_msgSend_accessibilitySizeLayoutConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessibilitySizeLayoutConstraints");
}

id objc_msgSend_accessoryType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accessoryType");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activate");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activateNextKeyField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateNextKeyField");
}

id objc_msgSend_activatePreviousKeyField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activatePreviousKeyField");
}

id objc_msgSend_activeTimerAtRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeTimerAtRow:");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityType");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAlarm:");
}

id objc_msgSend_addArcWithCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addArcWithCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_addAttribute_value_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAttribute:value:range:");
}

id objc_msgSend_addButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addButton");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addCity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCity:");
}

id objc_msgSend_addCity_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCity:animated:");
}

id objc_msgSend_addCityWithoutUserInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCityWithoutUserInteraction:");
}

id objc_msgSend_addClockViewController_addCity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addClockViewController:addCity:");
}

id objc_msgSend_addCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCompletionBlock:");
}

id objc_msgSend_addConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConstraints:");
}

id objc_msgSend_addDefaultSongsIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDefaultSongsIfNeeded");
}

id objc_msgSend_addEditAlarmController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEditAlarmController");
}

id objc_msgSend_addEditTimerController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEditTimerController");
}

id objc_msgSend_addFailureBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFailureBlock:");
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addGestureRecognizer:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addLap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLap:");
}

id objc_msgSend_addLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLayoutGuide:");
}

id objc_msgSend_addLineToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLineToPoint:");
}

id objc_msgSend_addMediaItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addMediaItems:");
}

id objc_msgSend_addNewTimerWithDuration_title_sound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNewTimerWithDuration:title:sound:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forBundleIdentifier:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSublayer:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimer:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimer:forMode:");
}

id objc_msgSend_addTimer_reload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTimer:reload:");
}

id objc_msgSend_addViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addViewController");
}

id objc_msgSend_adjustClearButtonInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustClearButtonInset");
}

id objc_msgSend_adjustedContentInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustedContentInset");
}

id objc_msgSend_adjustsFontSizeToFitWidth(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "adjustsFontSizeToFitWidth");
}

id objc_msgSend_alCity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alCity");
}

id objc_msgSend_alCityId(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alCityId");
}

id objc_msgSend_alarm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarm");
}

id objc_msgSend_alarmAtRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmAtRow:");
}

id objc_msgSend_alarmComponents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmComponents");
}

id objc_msgSend_alarmEditController_didAddAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmEditController:didAddAlarm:");
}

id objc_msgSend_alarmEditController_didDeleteAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmEditController:didDeleteAlarm:");
}

id objc_msgSend_alarmEditController_didEditAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmEditController:didEditAlarm:");
}

id objc_msgSend_alarmEditControllerDidCancel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmEditControllerDidCancel:");
}

id objc_msgSend_alarmEditSettingController_didEditAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmEditSettingController:didEditAlarm:");
}

id objc_msgSend_alarmEditViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmEditViewController");
}

id objc_msgSend_alarmID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmID");
}

id objc_msgSend_alarmIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmIDString");
}

id objc_msgSend_alarmTableViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmTableViewController");
}

id objc_msgSend_alarmViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmViewController");
}

id objc_msgSend_alarmWithHour_minute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmWithHour:minute:");
}

id objc_msgSend_alarmsCollectionViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alarmsCollectionViewController");
}

id objc_msgSend_alert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alert");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alertType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertType");
}

id objc_msgSend_alertWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertWithConfiguration:");
}

id objc_msgSend_allCities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allCities");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allValues");
}

id objc_msgSend_allowsSnooze(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allowsSnooze");
}

id objc_msgSend_analogClock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analogClock");
}

id objc_msgSend_analogClockWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analogClockWithStyle:");
}

id objc_msgSend_analogStopwatch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analogStopwatch");
}

id objc_msgSend_analogStopwatchContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analogStopwatchContainer");
}

id objc_msgSend_anchorStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anchorStyle");
}

id objc_msgSend_angle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "angle");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:animations:");
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:options:animations:completion:");
}

id objc_msgSend_animationDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationDuration");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appearance");
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appendAttributedString:");
}

id objc_msgSend_applyBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyBackgroundColor:");
}

id objc_msgSend_applyStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyStyle");
}

id objc_msgSend_applyTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyTransform:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributedStringWithAttachment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedStringWithAttachment:");
}

id objc_msgSend_autoupdatingCurrentLocale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "autoupdatingCurrentLocale");
}

id objc_msgSend_barWidthForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "barWidthForStyle:");
}

id objc_msgSend_becomeCurrent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeCurrent");
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "becomeFirstResponder");
}

id objc_msgSend_beep(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beep");
}

id objc_msgSend_beginAnimations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginAnimations:");
}

id objc_msgSend_beginAnimations_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginAnimations:context:");
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginUpdates");
}

id objc_msgSend_beginningOfDocument(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginningOfDocument");
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPath");
}

id objc_msgSend_bezierPathWithArcCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:");
}

id objc_msgSend_bezierPathWithOvalInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithOvalInRect:");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blackColor");
}

id objc_msgSend_blankEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blankEvent");
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blueColor");
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bottomAnchor");
}

id objc_msgSend_bottomKeylineView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bottomKeylineView");
}

id objc_msgSend_boundingRectWithSize_options_attributes_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boundingRectWithSize:options:attributes:context:");
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bounds");
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bringSubviewToFront:");
}

id objc_msgSend_buildTableRowsWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildTableRowsWithStyle:");
}

id objc_msgSend_buildVolumeSlider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buildVolumeSlider");
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_buttonCircleSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonCircleSize");
}

id objc_msgSend_buttonWidthForSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWidthForSize:");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_bypass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bypass");
}

id objc_msgSend_bypassReloadAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bypassReloadAlarm:");
}

id objc_msgSend_calculateAstronomicalTimeForLocation_time_altitudeInDegrees_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calculateAstronomicalTimeForLocation:time:altitudeInDegrees:");
}

id objc_msgSend_calendar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calendar");
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_canAddCity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canAddCity");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelButton");
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelPreviousPerformRequestsWithTarget:selector:object:");
}

id objc_msgSend_cancelScheduledUserPreferencesCommit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelScheduledUserPreferencesCommit");
}

id objc_msgSend_cancelTerminatorUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTerminatorUpdate");
}

id objc_msgSend_cancelTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTimer:");
}

id objc_msgSend_cancelTimerForCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTimerForCell:");
}

id objc_msgSend_cancelTrackingWithEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelTrackingWithEvent:");
}

id objc_msgSend_capHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "capHeight");
}

id objc_msgSend_captureSnapshotOfView_withSnapshotType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "captureSnapshotOfView:withSnapshotType:");
}

id objc_msgSend_cellDidEditAlarmVolume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellDidEditAlarmVolume:");
}

id objc_msgSend_cellForItemAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForItemAtIndexPath:");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_cellHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellHeight");
}

id objc_msgSend_cellStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellStyle");
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "center");
}

id objc_msgSend_centerNoResultsFoundLabelConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerNoResultsFoundLabelConstraints");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerXAnchor");
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "centerYAnchor");
}

id objc_msgSend_changeButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeButton");
}

id objc_msgSend_changeButtonPressed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeButtonPressed");
}

id objc_msgSend_charactersIgnoringModifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "charactersIgnoringModifiers");
}

id objc_msgSend_checkForSiriTips(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkForSiriTips");
}

id objc_msgSend_checkIfCitiesModified(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkIfCitiesModified");
}

id objc_msgSend_circleShape(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "circleShape");
}

id objc_msgSend_circleView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "circleView");
}

id objc_msgSend_cities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cities");
}

id objc_msgSend_citiesMatchingName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "citiesMatchingName:");
}

id objc_msgSend_city(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "city");
}

id objc_msgSend_cityNameLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cityNameLabel");
}

id objc_msgSend_clear(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clear");
}

id objc_msgSend_clearAllLaps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearAllLaps");
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clearColor");
}

id objc_msgSend_clockLabelBaselineToTopConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clockLabelBaselineToTopConstraint");
}

id objc_msgSend_clockLabelDetailLabelSpaceConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clockLabelDetailLabelSpaceConstraint");
}

id objc_msgSend_clockLabelHeightConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clockLabelHeightConstraint");
}

id objc_msgSend_closestCityToLocation_matchingTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "closestCityToLocation:matchingTimeZone:");
}

id objc_msgSend_collectionBottomConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionBottomConstraint");
}

id objc_msgSend_collectionController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionController");
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView");
}

id objc_msgSend_collectionView_didRemoveCity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionView:didRemoveCity:");
}

id objc_msgSend_collectionViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionViewController");
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "collectionViewLayout");
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "color");
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithRed:green:blue:alpha:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_columnAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "columnAtIndex:");
}

id objc_msgSend_columnsPerPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "columnsPerPage");
}

id objc_msgSend_commitAnimations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitAnimations");
}

id objc_msgSend_commitUserPreferences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commitUserPreferences");
}

id objc_msgSend_commonInit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commonInit");
}

id objc_msgSend_compactSizeFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compactSizeFont");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_component_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "component:fromDate:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationWithPointSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithPointSize:weight:");
}

id objc_msgSend_configurationWithWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithWeight:");
}

id objc_msgSend_configureBackground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureBackground");
}

id objc_msgSend_configureSetupButtonWithTitle_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureSetupButtonWithTitle:action:");
}

id objc_msgSend_configureTimeLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureTimeLabel");
}

id objc_msgSend_configureWithOpaqueBackground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithOpaqueBackground");
}

id objc_msgSend_configureWithTransparentBackground(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configureWithTransparentBackground");
}

id objc_msgSend_confirmPickingSound(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "confirmPickingSound");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:multiplier:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:multiplier:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_constraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraints");
}

id objc_msgSend_containerGridViewWithArrangedSubviewRows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerGridViewWithArrangedSubviewRows:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentInset");
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentOffset");
}

id objc_msgSend_contentScrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentScrollView");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentSize");
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentView");
}

id objc_msgSend_controlButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controlButton");
}

id objc_msgSend_controlButtonAttributesForView_buttonCircleSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controlButtonAttributesForView:buttonCircleSize:");
}

id objc_msgSend_controlsView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controlsView");
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toView:");
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertRect:fromView:");
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

id objc_msgSend_countDownDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countDownDuration");
}

id objc_msgSend_countDownLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countDownLabel");
}

id objc_msgSend_countDownView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countDownView");
}

id objc_msgSend_currentAlarmEditController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentAlarmEditController");
}

id objc_msgSend_currentCollation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentCollation");
}

id objc_msgSend_currentConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConstraints");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentInterval");
}

id objc_msgSend_currentLapCell(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLapCell");
}

id objc_msgSend_currentLapTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLapTime");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentPage");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentSoundToneName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentSoundToneName");
}

id objc_msgSend_currentTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTitle");
}

id objc_msgSend_currentTone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentTone");
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataSource");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "date");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_dateComponents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateComponents");
}

id objc_msgSend_dateFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateFromComponents:");
}

id objc_msgSend_dateLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateLabel");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_dayAndTimeZoneOffsetStringFromDate_withTimeZoneOffset_timeZoneAbbreviation_spaceBeforeTimeDesignator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dayAndTimeZoneOffsetStringFromDate:withTimeZoneOffset:timeZoneAbbreviation:spaceBeforeTimeDesignator:");
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateConstraints:");
}

id objc_msgSend_deadZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deadZone");
}

id objc_msgSend_decimalDigitCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decimalDigitCharacterSet");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decrementValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decrementValue");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultCitiesShownInWorldClock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCitiesShownInWorldClock");
}

id objc_msgSend_defaultDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultDuration");
}

id objc_msgSend_defaultEditLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultEditLabel");
}

id objc_msgSend_defaultHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultHeight");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultShortcutItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultShortcutItem");
}

id objc_msgSend_defaultSizeForCurrentOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSizeForCurrentOrientation");
}

id objc_msgSend_defaultSoundForCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSoundForCategory:");
}

id objc_msgSend_defaultToneIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultToneIdentifier");
}

id objc_msgSend_defaultToneIdentifierForAlertType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultToneIdentifierForAlertType:");
}

id objc_msgSend_defaultVibrationIdentifierForAlertType_topic_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultVibrationIdentifierForAlertType:topic:");
}

id objc_msgSend_defaultViewStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultViewStyle");
}

id objc_msgSend_deferAddedCity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deferAddedCity");
}

id objc_msgSend_deferRemovedCity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deferRemovedCity");
}

id objc_msgSend_deferredAddingAlarm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deferredAddingAlarm");
}

id objc_msgSend_deferredAddingTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deferredAddingTimer");
}

id objc_msgSend_deferredEditingAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deferredEditingAction");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteButton");
}

id objc_msgSend_deleteCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteCell:");
}

id objc_msgSend_deleteItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteItemsAtIndexPaths:");
}

id objc_msgSend_deleteRecent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRecent:");
}

id objc_msgSend_deleteRecentTimerForCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRecentTimerForCell:");
}

id objc_msgSend_deleteRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_deleteSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteSections:");
}

id objc_msgSend_deleteSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteSections:withRowAnimation:");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:forIndexPath:");
}

id objc_msgSend_dequeueReusableCellWithReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithReuseIdentifier:forIndexPath:");
}

id objc_msgSend_dequeueReusableHeaderFooterViewWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableHeaderFooterViewWithIdentifier:");
}

id objc_msgSend_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableSupplementaryViewOfKind:withReuseIdentifier:forIndexPath:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "description");
}

id objc_msgSend_descriptorByDisallowingSmallSizes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorByDisallowingSmallSizes");
}

id objc_msgSend_descriptorWithTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "descriptorWithTextStyle:");
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_desiredContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "desiredContentSize");
}

id objc_msgSend_detailLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailLabel");
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailTextLabel");
}

id objc_msgSend_detailedDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detailedDescription");
}

id objc_msgSend_dictionaryWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithContentsOfURL:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didCancelTimerWithSender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCancelTimerWithSender:");
}

id objc_msgSend_didCompleteSleepOnboarding(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCompleteSleepOnboarding");
}

id objc_msgSend_didDismissViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didDismissViewController");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_didReceiveStartTimerShortcutAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didReceiveStartTimerShortcutAction");
}

id objc_msgSend_didSelectPresetWithDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSelectPresetWithDuration:");
}

id objc_msgSend_didSelectRecentDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSelectRecentDuration:");
}

id objc_msgSend_didSendPauseAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSendPauseAction");
}

id objc_msgSend_didSendPauseAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSendPauseAction:");
}

id objc_msgSend_didSendResumeAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSendResumeAction");
}

id objc_msgSend_didSendResumeAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didSendResumeAction:");
}

id objc_msgSend_didStartTimerWithDuration_title_sound_sender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didStartTimerWithDuration:title:sound:sender:");
}

id objc_msgSend_didUpdateWithLabel_sender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didUpdateWithLabel:sender:");
}

id objc_msgSend_digitalClockLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "digitalClockLabel");
}

id objc_msgSend_digitalStopwatchContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "digitalStopwatchContainer");
}

id objc_msgSend_dismissAddEditViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissAddEditViewController:");
}

id objc_msgSend_dismissAddViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissAddViewController:");
}

id objc_msgSend_dismissSoundPicker(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissSoundPicker");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayNameIncludingCountry_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameIncludingCountry:");
}

id objc_msgSend_displayNameIncludingCountry_withFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameIncludingCountry:withFormat:");
}

id objc_msgSend_displayTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayTitle");
}

id objc_msgSend_displaysTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displaysTime");
}

id objc_msgSend_dotImageFrameForPlacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dotImageFrameForPlacement:");
}

id objc_msgSend_dotImageView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dotImageView");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_drawAtPoint_withAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawAtPoint:withAttributes:");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "duration");
}

id objc_msgSend_durationFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "durationFormatter");
}

id objc_msgSend_durationLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "durationLabel");
}

id objc_msgSend_durationStringFromInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "durationStringFromInterval:");
}

id objc_msgSend_editButtonItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editButtonItem");
}

id objc_msgSend_editLabelCell(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editLabelCell");
}

id objc_msgSend_edited(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "edited");
}

id objc_msgSend_editedAlarm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editedAlarm");
}

id objc_msgSend_editingPopoverSourceRect(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editingPopoverSourceRect");
}

id objc_msgSend_editingRectForBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "editingRectForBounds:");
}

id objc_msgSend_effectiveLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveLayoutSizeFittingSize:");
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "elapsedTime");
}

id objc_msgSend_enableSwitch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enableSwitch");
}

id objc_msgSend_enabledSwitch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enabledSwitch");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_endAlertingSession(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endAlertingSession");
}

id objc_msgSend_endAnimations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endAnimations");
}

id objc_msgSend_endDisplayUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endDisplayUpdates");
}

id objc_msgSend_endEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endEditing");
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endEditing:");
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endUpdates");
}

id objc_msgSend_ensureLapFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ensureLapFormatter");
}

id objc_msgSend_eraseLocalDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eraseLocalDefaults");
}

id objc_msgSend_estimatedCellHeightForTimerWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedCellHeightForTimerWithTitle:");
}

id objc_msgSend_estimatedCountdownViewHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedCountdownViewHeight");
}

id objc_msgSend_estimatedElementSpacing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedElementSpacing");
}

id objc_msgSend_estimatedHeightForTimerWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedHeightForTimerWithTitle:");
}

id objc_msgSend_estimatedNonCountdownElementHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedNonCountdownElementHeight");
}

id objc_msgSend_estimatedNonCountdownElementHeightWithSpacing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedNonCountdownElementHeightWithSpacing");
}

id objc_msgSend_estimatedSplitLayoutForWindowWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedSplitLayoutForWindowWidth:");
}

id objc_msgSend_estimatedTimePickerHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedTimePickerHeight");
}

id objc_msgSend_estimatedTonePickerHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedTonePickerHeight");
}

id objc_msgSend_estimatedViewHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "estimatedViewHeight");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventType");
}

id objc_msgSend_eventWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithType:");
}

id objc_msgSend_eventWithType_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithType:identifier:");
}

id objc_msgSend_eventWithType_indexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventWithType:indexPath:");
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "familyName");
}

id objc_msgSend_featureStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "featureStore");
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fill");
}

id objc_msgSend_finishAddViewControllerDismissal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishAddViewControllerDismissal:");
}

id objc_msgSend_finishedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedTest:");
}

id objc_msgSend_finishedTest_extraResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "finishedTest:extraResults:");
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstBaselineAnchor");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstRectForRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstRectForRange:");
}

id objc_msgSend_firstWeekday(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstWeekday");
}

id objc_msgSend_flashScrollIndicators(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flashScrollIndicators");
}

id objc_msgSend_flatMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flatMap:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "floatValue");
}

id objc_msgSend_focusHeading(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "focusHeading");
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "font");
}

id objc_msgSend_fontWithFamilyName_traits_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fontWithFamilyName:traits:size:");
}

id objc_msgSend_formatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "formatter");
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "frame");
}

id objc_msgSend_futureWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "futureWithError:");
}

id objc_msgSend_futureWithResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "futureWithResult:");
}

id objc_msgSend_getCurrentDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCurrentDuration");
}

id objc_msgSend_getCurrentLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getCurrentLabel");
}

id objc_msgSend_getLatestDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getLatestDuration");
}

id objc_msgSend_getRecentDurations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getRecentDurations");
}

id objc_msgSend_getStopwatch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStopwatch");
}

id objc_msgSend_getStopwatches(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStopwatches");
}

id objc_msgSend_grayButtonConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "grayButtonConfiguration");
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "grayColor");
}

id objc_msgSend_greyOutExpectedTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "greyOutExpectedTime");
}

id objc_msgSend_gridView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "gridView");
}

id objc_msgSend_groupedHeaderConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupedHeaderConfiguration");
}

id objc_msgSend_handleContentSizeChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleContentSizeChange");
}

id objc_msgSend_handleContentSizeTransitionFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleContentSizeTransitionFrom:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleLapStopwatchShortcutAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleLapStopwatchShortcutAction");
}

id objc_msgSend_handleLocaleChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleLocaleChange");
}

id objc_msgSend_handleResetStopwatchShortcutAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleResetStopwatchShortcutAction");
}

id objc_msgSend_handleStartStopwatchShortcutAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStartStopwatchShortcutAction");
}

id objc_msgSend_handleStopStopwatchShortcutAction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleStopStopwatchShortcutAction");
}

id objc_msgSend_hasDefaultTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasDefaultTitle");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSleepAlarmMatchingAlarmIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSleepAlarmMatchingAlarmIDString:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hasTail(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasTail");
}

id objc_msgSend_headerTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerTitle");
}

id objc_msgSend_healthAppInstallationDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "healthAppInstallationDidChange");
}

id objc_msgSend_healthAppNotInstalled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "healthAppNotInstalled");
}

id objc_msgSend_healthStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "healthStore");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "heightAnchor");
}

id objc_msgSend_hideExpectedTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hideExpectedTime");
}

id objc_msgSend_highlightLayer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlightLayer");
}

id objc_msgSend_highlightedBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlightedBackgroundColor");
}

id objc_msgSend_highlightedShade(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlightedShade");
}

id objc_msgSend_horizontalMapHeightConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalMapHeightConstraint");
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "horizontalSizeClass");
}

id objc_msgSend_hotspotOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hotspotOffset");
}

id objc_msgSend_hotspotOffsetForPlacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hotspotOffsetForPlacement:");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hour");
}

id objc_msgSend_hourHighlightFrame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hourHighlightFrame");
}

id objc_msgSend_hoverStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hoverStyle");
}

id objc_msgSend_iPadSingleCellNewTimerConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iPadSingleCellNewTimerConstraints");
}

id objc_msgSend_iconPlacement(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconPlacement");
}

id objc_msgSend_iconWithSystemImageName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "iconWithSystemImageName:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_imageForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForState:");
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:");
}

id objc_msgSend_imageWithRenderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithRenderingMode:");
}

id objc_msgSend_incrementEventCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementEventCount:");
}

id objc_msgSend_incrementValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementValue");
}

id objc_msgSend_indexGreaterThanOrEqualToIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexGreaterThanOrEqualToIndex:");
}

id objc_msgSend_indexLessThanIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexLessThanIndex:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_indexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPath");
}

id objc_msgSend_indexPathForCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForCell:");
}

id objc_msgSend_indexPathForItem_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForItem:inSection:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForSelectedRow");
}

id objc_msgSend_indexPathsForVisibleItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathsForVisibleItems");
}

id objc_msgSend_indexPathsForVisibleRows(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathsForVisibleRows");
}

id objc_msgSend_indexSetWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexSetWithIndex:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "init");
}

id objc_msgSend_initWithALCity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithALCity:");
}

id objc_msgSend_initWithAlarm_isNewAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAlarm:isNewAlarm:");
}

id objc_msgSend_initWithAlarm_setting_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAlarm:setting:delegate:");
}

id objc_msgSend_initWithAlarmManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAlarmManager:");
}

id objc_msgSend_initWithAlarmManager_alarmDataSource_timerManager_timerDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAlarmManager:alarmDataSource:timerManager:timerDataSource:");
}

id objc_msgSend_initWithAlarmManager_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAlarmManager:dataSource:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithBarColor_backgroundBarColor_barWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarColor:backgroundBarColor:barWidth:");
}

id objc_msgSend_initWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCGImage:scale:orientation:");
}

id objc_msgSend_initWithCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCalendarIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCity:");
}

id objc_msgSend_initWithCollectionViewLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCollectionViewLayout:");
}

id objc_msgSend_initWithDataSource_timerManager_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDataSource:timerManager:delegate:");
}

id objc_msgSend_initWithDefaults_manager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDefaults:manager:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDelegate_currentTitle_isEmpty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:currentTitle:isEmpty:");
}

id objc_msgSend_initWithDelegate_style_timerControlState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:style:timerControlState:");
}

id objc_msgSend_initWithFeatureIdentifier_sleepStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFeatureIdentifier:sleepStore:");
}

id objc_msgSend_initWithFireDate_interval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFireDate:interval:target:selector:userInfo:repeats:");
}

id objc_msgSend_initWithFont_textColor_glyphName_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFont:textColor:glyphName:style:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithFrame_title_style_includeBackdrop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:title:style:includeBackdrop:");
}

id objc_msgSend_initWithHealthStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHealthStore:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithItems_presetsDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithItems:presetsDelegate:");
}

id objc_msgSend_initWithLatitude_longitude_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLatitude:longitude:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithPersistentID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPersistentID:");
}

id objc_msgSend_initWithPicker_timeView_expectedTimeView_countdownView_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPicker:timeView:expectedTimeView:countdownView:reuseIdentifier:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSleepStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSleepStore:");
}

id objc_msgSend_initWithState_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithState:duration:");
}

id objc_msgSend_initWithStopwatch_manager_delegate_dateProvider_registerForNotifications_broadcastUpdates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStopwatch:manager:delegate:dateProvider:registerForNotifications:broadcastUpdates:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initWithTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:");
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTarget:action:");
}

id objc_msgSend_initWithTestName_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestName:scrollView:completionHandler:");
}

id objc_msgSend_initWithTestName_window_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTestName:window:completionHandler:");
}

id objc_msgSend_initWithTimer_timerManager_dataSource_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimer:timerManager:dataSource:delegate:");
}

id objc_msgSend_initWithTimerManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimerManager:");
}

id objc_msgSend_initWithTimerManager_dataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTimerManager:dataSource:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithType_localizedTitle_localizedSubtitle_icon_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:localizedTitle:localizedSubtitle:icon:userInfo:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_insertItemsAtIndexPaths_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertItemsAtIndexPaths:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertRowsAtIndexPaths_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertRowsAtIndexPaths:withRowAnimation:");
}

id objc_msgSend_insertSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSections:withRowAnimation:");
}

id objc_msgSend_insertSubview_aboveSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:aboveSubview:");
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "integerValue");
}

id objc_msgSend_intent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intent");
}

id objc_msgSend_interaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interaction");
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceOrientation");
}

id objc_msgSend_internalSetBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "internalSetBackgroundColor:");
}

id objc_msgSend_interruptAudio(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interruptAudio");
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intrinsicContentSize");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateDisplayLink(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateDisplayLink");
}

id objc_msgSend_invalidateLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateLayout");
}

id objc_msgSend_invalidateViewControllersWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateViewControllersWithTraitCollection:");
}

id objc_msgSend_isCurrentOnboardingVersionCompletedWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrentOnboardingVersionCompletedWithError:");
}

id objc_msgSend_isCurrentTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCurrentTimer");
}

id objc_msgSend_isDefaultTone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDefaultTone");
}

id objc_msgSend_isEdited(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEdited");
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEditing");
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabled");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToSet:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFirstResponder");
}

id objc_msgSend_isFocused(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFocused");
}

id objc_msgSend_isHealthAppNotInstalled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHealthAppNotInstalled");
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isHighlighted");
}

id objc_msgSend_isIpadAddSheet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIpadAddSheet");
}

id objc_msgSend_isLandscape(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isLandscape");
}

id objc_msgSend_isMovingFromParentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMovingFromParentViewController");
}

id objc_msgSend_isNewAlarm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isNewAlarm");
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isOn");
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRecapAvailable");
}

id objc_msgSend_isRunningInThirdSplitView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunningInThirdSplitView");
}

id objc_msgSend_isRunningPPTTest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunningPPTTest");
}

id objc_msgSend_isRunningTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isRunningTimer");
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSelected");
}

id objc_msgSend_isSilent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSilent");
}

id objc_msgSend_isSleepAlarm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSleepAlarm");
}

id objc_msgSend_isStarted(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isStarted");
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSuspended");
}

id objc_msgSend_isUserInteractionEnabled(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isUserInteractionEnabled");
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isViewLoaded");
}

id objc_msgSend_itemWithNumber_unit_duration_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemWithNumber:unit:duration:identifier:");
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "items");
}

id objc_msgSend_itemsTableRowHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemsTableRowHeight");
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "key");
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyWindow");
}

id objc_msgSend_keyboardFrame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keyboardFrame");
}

id objc_msgSend_keywords(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keywords");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "label");
}

id objc_msgSend_labelBaseFontForCellStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelBaseFontForCellStyle:");
}

id objc_msgSend_labelFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelFont");
}

id objc_msgSend_labelViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelViews");
}

id objc_msgSend_lapButtonOccludingView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapButtonOccludingView");
}

id objc_msgSend_lapButtonTopConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapButtonTopConstraint");
}

id objc_msgSend_lapButtonWidthConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapButtonWidthConstraint");
}

id objc_msgSend_lapControlButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapControlButton");
}

id objc_msgSend_lapCount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapCount");
}

id objc_msgSend_lapExtrema(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapExtrema");
}

id objc_msgSend_lapLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapLabel");
}

id objc_msgSend_lapLabelBaselineTopOffset_bottomOffset_forCellStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapLabelBaselineTopOffset:bottomOffset:forCellStyle:");
}

id objc_msgSend_lapLabelDefaultBaselineTopOffset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapLabelDefaultBaselineTopOffset");
}

id objc_msgSend_lapLabelTextForNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapLabelTextForNumber:");
}

id objc_msgSend_lapLapTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapLapTimer");
}

id objc_msgSend_lapLapTimerUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapLapTimerUI");
}

id objc_msgSend_lapNumberLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapNumberLabel");
}

id objc_msgSend_lapNumberLabelBaselineBottomOffsetConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapNumberLabelBaselineBottomOffsetConstraint");
}

id objc_msgSend_lapNumberLabelBaselineTopOffsetConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapNumberLabelBaselineTopOffsetConstraint");
}

id objc_msgSend_lapSecondsHand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapSecondsHand");
}

id objc_msgSend_lapStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapStyle");
}

id objc_msgSend_lapTableController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapTableController");
}

id objc_msgSend_lapTimes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lapTimes");
}

id objc_msgSend_laps(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "laps");
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastBaselineAnchor");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_latestLayoutSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latestLayoutSize");
}

id objc_msgSend_latitude(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "latitude");
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layer");
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutFrame");
}

id objc_msgSend_layoutGuides(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutGuides");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutIfNeeded");
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutMargins");
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutMarginsGuide");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leadingAnchor");
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leftAnchor");
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leftBarButtonItem");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_lineHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lineHeight");
}

id objc_msgSend_loadAvailableTones(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadAvailableTones");
}

id objc_msgSend_loadCities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadCities");
}

id objc_msgSend_loadUserPreferences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadUserPreferences");
}

id objc_msgSend_localSetup(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localSetup");
}

id objc_msgSend_locale(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locale");
}

id objc_msgSend_localizedCaseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedCaseInsensitiveCompare:");
}

id objc_msgSend_localizedStandardCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStandardCompare:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringFromNumber_numberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromNumber:numberStyle:");
}

id objc_msgSend_localizedTimeStringFromDate_forTimeZone_timeDesignator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedTimeStringFromDate:forTimeZone:timeDesignator:");
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_longitude(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "longitude");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainDescription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainDescription");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_mainThreadScheduler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainThreadScheduler");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_makeObjectsPerformSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeObjectsPerformSelector:");
}

id objc_msgSend_mapHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapHeight");
}

id objc_msgSend_mapHeightForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapHeightForWidth:");
}

id objc_msgSend_mapView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mapView");
}

id objc_msgSend_maskForRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maskForRow:");
}

id objc_msgSend_maxWidthForDateStringWithFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "maxWidthForDateStringWithFont:");
}

id objc_msgSend_mediaItemIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mediaItemIdentifier");
}

id objc_msgSend_migrateLegacyStopwatch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrateLegacyStopwatch");
}

id objc_msgSend_migrator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "migrator");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minute");
}

id objc_msgSend_minuteHighlightFrame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minuteHighlightFrame");
}

id objc_msgSend_minutesHand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minutesHand");
}

id objc_msgSend_mockItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mockItems");
}

id objc_msgSend_modifierFlags(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifierFlags");
}

id objc_msgSend_moveCityFromIndex_toIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveCityFromIndex:toIndex:");
}

id objc_msgSend_moveToPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveToPoint:");
}

id objc_msgSend_moveViewFrameToVerticalPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveViewFrameToVerticalPosition:");
}

id objc_msgSend_mtClockAppSection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtClockAppSection");
}

id objc_msgSend_mtDecimalStyleNumberFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtDecimalStyleNumberFormatter");
}

id objc_msgSend_mtMainThreadScheduler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtMainThreadScheduler");
}

id objc_msgSend_mtUserActivityWithActivityType_title_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtUserActivityWithActivityType:title:");
}

id objc_msgSend_mt_sleepMetaDataForUpcomingAlarmInCalendar_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mt_sleepMetaDataForUpcomingAlarmInCalendar:error:");
}

id objc_msgSend_mtui_backgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_backgroundColor");
}

id objc_msgSend_mtui_buttonBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_buttonBackgroundColor");
}

id objc_msgSend_mtui_cellHighlightColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_cellHighlightColor");
}

id objc_msgSend_mtui_cellSeparatorColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_cellSeparatorColor");
}

id objc_msgSend_mtui_defaultTimeDesignatorFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_defaultTimeDesignatorFont");
}

id objc_msgSend_mtui_deleteButtonImage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_deleteButtonImage");
}

id objc_msgSend_mtui_disabledButtonTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_disabledButtonTintColor");
}

id objc_msgSend_mtui_disabledStartButtonTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_disabledStartButtonTintColor");
}

id objc_msgSend_mtui_disabledTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_disabledTextColor");
}

id objc_msgSend_mtui_fontByAddingTimeFontAttributes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_fontByAddingTimeFontAttributes");
}

id objc_msgSend_mtui_foregroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_foregroundColor");
}

id objc_msgSend_mtui_imageWithSymbolName_pointSize_color_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_imageWithSymbolName:pointSize:color:");
}

id objc_msgSend_mtui_imageWithSymbolName_scale_textStyle_andTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_imageWithSymbolName:scale:textStyle:andTintColor:");
}

id objc_msgSend_mtui_imageWithTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_imageWithTintColor:");
}

id objc_msgSend_mtui_isRTL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_isRTL");
}

id objc_msgSend_mtui_lapResetButtonTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_lapResetButtonTintColor");
}

id objc_msgSend_mtui_pauseButtonTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_pauseButtonTextColor");
}

id objc_msgSend_mtui_pauseButtonTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_pauseButtonTintColor");
}

id objc_msgSend_mtui_primaryColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_primaryColor");
}

id objc_msgSend_mtui_primaryTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_primaryTextColor");
}

id objc_msgSend_mtui_quaternaryColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_quaternaryColor");
}

id objc_msgSend_mtui_secondaryTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_secondaryTextColor");
}

id objc_msgSend_mtui_startResumeButtonTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_startResumeButtonTextColor");
}

id objc_msgSend_mtui_startResumeButtonTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_startResumeButtonTintColor");
}

id objc_msgSend_mtui_stopButtonTextColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_stopButtonTextColor");
}

id objc_msgSend_mtui_stopButtonTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_stopButtonTintColor");
}

id objc_msgSend_mtui_stopwatchMajorTickMarkColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_stopwatchMajorTickMarkColor");
}

id objc_msgSend_mtui_stopwatchMinorTickMarkColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_stopwatchMinorTickMarkColor");
}

id objc_msgSend_mtui_switchTintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_switchTintColor");
}

id objc_msgSend_mtui_tertiaryColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_tertiaryColor");
}

id objc_msgSend_mtui_thinTimeFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_thinTimeFont");
}

id objc_msgSend_mtui_thinTimeFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_thinTimeFontOfSize:");
}

id objc_msgSend_mtui_tintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_tintColor");
}

id objc_msgSend_mtui_worldClockMapLandColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mtui_worldClockMapLandColor");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_na_firstObjectPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_firstObjectPassingTest:");
}

id objc_msgSend_na_genericError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_genericError");
}

id objc_msgSend_na_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_map:");
}

id objc_msgSend_na_safeAddObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "na_safeAddObject:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_nameForToneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameForToneIdentifier:");
}

id objc_msgSend_nameLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameLabel");
}

id objc_msgSend_nameOfVibrationWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameOfVibrationWithIdentifier:");
}

id objc_msgSend_naui_setDynamicFontTextStyleDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "naui_setDynamicFontTextStyleDescriptor:");
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationBar");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationController");
}

id objc_msgSend_navigationControllerForHorizontalSizeClass_verticalSizeClass_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationControllerForHorizontalSizeClass:verticalSizeClass:atIndex:");
}

id objc_msgSend_navigationControllerForTab_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationControllerForTab:");
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "navigationItem");
}

id objc_msgSend_needsMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "needsMigration");
}

id objc_msgSend_nextFocusedView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nextFocusedView");
}

id objc_msgSend_noItemsText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noItemsText");
}

id objc_msgSend_noItemsView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noItemsView");
}

id objc_msgSend_noResultsFoundLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "noResultsFoundLabel");
}

id objc_msgSend_normalBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalBackgroundColor");
}

id objc_msgSend_normalShade(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalShade");
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "number");
}

id objc_msgSend_numberFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberFormatter");
}

id objc_msgSend_numberLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberLabel");
}

id objc_msgSend_numberOfActiveTimers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfActiveTimers");
}

id objc_msgSend_numberOfAlarms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfAlarms");
}

id objc_msgSend_numberOfItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfItems");
}

id objc_msgSend_numberOfItemsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfItemsInSection:");
}

id objc_msgSend_numberOfItemsIncludingSleep(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfItemsIncludingSleep");
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfSections");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "object");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "options");
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orientation");
}

id objc_msgSend_originalAlarm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "originalAlarm");
}

id objc_msgSend_pageControl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pageControl");
}

id objc_msgSend_pages(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pages");
}

id objc_msgSend_pagingViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pagingViewController");
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pause");
}

id objc_msgSend_pauseLapTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseLapTimer");
}

id objc_msgSend_pauseLapTimerUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseLapTimerUI");
}

id objc_msgSend_pauseResumeButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseResumeButton");
}

id objc_msgSend_pauseResumeTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseResumeTimer:");
}

id objc_msgSend_pauseResumeTimerForCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pauseResumeTimerForCell:");
}

id objc_msgSend_performActionForIntent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performActionForIntent:");
}

id objc_msgSend_performActionForShortcutItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performActionForShortcutItem:");
}

id objc_msgSend_performSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:");
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:afterDelay:");
}

id objc_msgSend_persistentID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "persistentID");
}

id objc_msgSend_pickerView_didChangeSelectedDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pickerView:didChangeSelectedDuration:");
}

id objc_msgSend_pickerView_rowHeightForComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pickerView:rowHeightForComponent:");
}

id objc_msgSend_pickerView_widthForComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pickerView:widthForComponent:");
}

id objc_msgSend_pillButtonWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pillButtonWithTitle:");
}

id objc_msgSend_playWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "playWithCompletionHandler:");
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pointSize");
}

id objc_msgSend_popTimerViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popTimerViewController");
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popoverPresentationController");
}

id objc_msgSend_populateShortcutItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateShortcutItems");
}

id objc_msgSend_populateTabIndexes(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateTabIndexes");
}

id objc_msgSend_positionFromPosition_offset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "positionFromPosition:offset:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:userInfo:");
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentSize");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentSizeCategory");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredFontForTextStyle_compatibleWithTraitCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:compatibleWithTraitCollection:");
}

id objc_msgSend_preferredHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredHeight");
}

id objc_msgSend_prepareStateForUrlLaunch(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareStateForUrlLaunch");
}

id objc_msgSend_prepareTabBarControllerRestoreIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareTabBarControllerRestoreIndex:");
}

id objc_msgSend_prepareUIForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareUIForState:");
}

id objc_msgSend_prepareUIForState_forceRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareUIForState:forceRefresh:");
}

id objc_msgSend_prepareUIForState_inCell_forceRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareUIForState:inCell:forceRefresh:");
}

id objc_msgSend_prepopulateSuggestions(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepopulateSuggestions");
}

id objc_msgSend_presentSleepAlert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentSleepAlert:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationController");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentingViewController");
}

id objc_msgSend_presetFlowLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presetFlowLayout");
}

id objc_msgSend_presetView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presetView");
}

id objc_msgSend_presetsController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presetsController");
}

id objc_msgSend_pressesBegan_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pressesBegan:withEvent:");
}

id objc_msgSend_previewAudioVolume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previewAudioVolume");
}

id objc_msgSend_previousLapsTotalInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previousLapsTotalInterval");
}

id objc_msgSend_previouslyFocusedView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "previouslyFocusedView");
}

id objc_msgSend_processCountdownState_previousState_remainingTime_duration_forceRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processCountdownState:previousState:remainingTime:duration:forceRefresh:");
}

id objc_msgSend_prominentInsetGroupedHeaderConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prominentInsetGroupedHeaderConfiguration");
}

id objc_msgSend_pushEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushEvent:");
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_recentView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recentView");
}

id objc_msgSend_recognizer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recognizer");
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "redColor");
}

id objc_msgSend_refreshUI_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshUI:animated:");
}

id objc_msgSend_refreshWithSleepMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshWithSleepMetadata:");
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellReuseIdentifier:");
}

id objc_msgSend_registerClass_forCellWithReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forCellWithReuseIdentifier:");
}

id objc_msgSend_registerClass_forHeaderFooterViewReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forHeaderFooterViewReuseIdentifier:");
}

id objc_msgSend_registerClass_forSupplementaryViewOfKind_withReuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClass:forSupplementaryViewOfKind:withReuseIdentifier:");
}

id objc_msgSend_registerClock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerClock:");
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerObserver:");
}

id objc_msgSend_regularLayoutConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regularLayoutConstraints");
}

id objc_msgSend_reloadAlarmWidgetTimeline(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadAlarmWidgetTimeline");
}

id objc_msgSend_reloadAlarms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadAlarms");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadData");
}

id objc_msgSend_reloadDataFuture(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadDataFuture");
}

id objc_msgSend_reloadSections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSections");
}

id objc_msgSend_reloadSections_withRowAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSections:withRowAnimation:");
}

id objc_msgSend_reloadState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadState");
}

id objc_msgSend_reloadState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadState:");
}

id objc_msgSend_reloadStopwatchesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadStopwatchesWithCompletion:");
}

id objc_msgSend_reloadTimerDurations(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadTimerDurations");
}

id objc_msgSend_reloadTimerState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadTimerState");
}

id objc_msgSend_reloadTimerUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadTimerUI");
}

id objc_msgSend_reloadTimers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadTimers");
}

id objc_msgSend_remainingTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remainingTime");
}

id objc_msgSend_removeAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAlarm:");
}

id objc_msgSend_removeAlarmAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAlarmAtIndexPath:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeCity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCity:");
}

id objc_msgSend_removeCityAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCityAtIndex:");
}

id objc_msgSend_removeCityAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCityAtIndexPath:");
}

id objc_msgSend_removeCityWithoutUserInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeCityWithoutUserInteraction:");
}

id objc_msgSend_removeConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeConstraints:");
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromParentViewController");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFromSuperview");
}

id objc_msgSend_removeLayoutGuide_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLayoutGuide:");
}

id objc_msgSend_removeNotificationObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeNotificationObserver");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removeRecentDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRecentDuration:");
}

id objc_msgSend_removeTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTimer:");
}

id objc_msgSend_renderViewModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renderViewModel");
}

id objc_msgSend_repeatLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "repeatLabel");
}

id objc_msgSend_repeatSchedule(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "repeatSchedule");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_reschedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reschedule:");
}

id objc_msgSend_resetLapTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetLapTimer");
}

id objc_msgSend_resetLapTimerUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetLapTimerUI");
}

id objc_msgSend_resetLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetLayout");
}

id objc_msgSend_resignCurrent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resignCurrent");
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resignFirstResponder");
}

id objc_msgSend_resizeCityViews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resizeCityViews");
}

id objc_msgSend_resourceSpecifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resourceSpecifier");
}

id objc_msgSend_restoreAlarmTabEditMode(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreAlarmTabEditMode");
}

id objc_msgSend_restoreIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreIndexPath:");
}

id objc_msgSend_restoreLastEventWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreLastEventWithCompletion:");
}

id objc_msgSend_restoreLastSelectedTabIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreLastSelectedTabIndex");
}

id objc_msgSend_restoreState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreState");
}

id objc_msgSend_restoreWithUserActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "restoreWithUserActivity:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_resumeLapTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumeLapTimer");
}

id objc_msgSend_resumeLapTimerUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resumeLapTimerUI");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rightAnchor");
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rightBarButtonItem");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "role");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_rootViewControllerForTab_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewControllerForTab:");
}

id objc_msgSend_rotateIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rotateIfNeeded:");
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "row");
}

id objc_msgSend_rowForAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowForAlarm:");
}

id objc_msgSend_rowForAlarmWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowForAlarmWithID:");
}

id objc_msgSend_rowForTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowForTimer:");
}

id objc_msgSend_rowHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowHeight");
}

id objc_msgSend_rowHeightWithCurrentAccessibilityConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowHeightWithCurrentAccessibilityConfiguration");
}

id objc_msgSend_rowsPerPage(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rowsPerPage");
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runTestWithParameters:");
}

id objc_msgSend_runUntilDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runUntilDate:");
}

id objc_msgSend_runningTotal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runningTotal");
}

id objc_msgSend_runningTotalForLap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runningTotalForLap:");
}

id objc_msgSend_runningTotalLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runningTotalLabel");
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeAreaInsets");
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "safeAreaLayoutGuide");
}

id objc_msgSend_saveAlarmOnlyIfEdited_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveAlarmOnlyIfEdited:");
}

id objc_msgSend_saveCities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveCities");
}

id objc_msgSend_saveLastIndexPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveLastIndexPath");
}

id objc_msgSend_saveState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveState");
}

id objc_msgSend_scene_continueUserActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene:continueUserActivity:");
}

id objc_msgSend_scene_didFailToContinueUserActivityWithType_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene:didFailToContinueUserActivityWithType:error:");
}

id objc_msgSend_scene_openURL_sourceApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene:openURL:sourceApplication:");
}

id objc_msgSend_scene_openURLContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene:openURLContexts:");
}

id objc_msgSend_scene_willContinueUserActivityWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene:willContinueUserActivityWithType:");
}

id objc_msgSend_sceneDidBecomeActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sceneDidBecomeActive:");
}

id objc_msgSend_sceneDidEnterBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sceneDidEnterBackground:");
}

id objc_msgSend_sceneWillEnterForeground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sceneWillEnterForeground:");
}

id objc_msgSend_sceneWillResignActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sceneWillResignActive:");
}

id objc_msgSend_scheduleTerminatorUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduleTerminatorUpdate");
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:");
}

id objc_msgSend_scrollDirection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollDirection");
}

id objc_msgSend_scrollToCityAtIndex_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToCityAtIndex:animated:");
}

id objc_msgSend_scrollToItemAtIndexPath_atScrollPosition_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToItemAtIndexPath:atScrollPosition:animated:");
}

id objc_msgSend_scrollToPageContainingIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToPageContainingIndexPath:animated:");
}

id objc_msgSend_scrollToRowAtIndexPath_atScrollPosition_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToRowAtIndexPath:atScrollPosition:animated:");
}

id objc_msgSend_scrollToSavedPoint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToSavedPoint");
}

id objc_msgSend_scrollToTop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToTop");
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollView");
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "searchBar");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "second");
}

id objc_msgSend_secondHighlightFrame(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondHighlightFrame");
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondaryLabelColor");
}

id objc_msgSend_secondaryLabelFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondaryLabelFont");
}

id objc_msgSend_secondsFromGMTForDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondsFromGMTForDate:");
}

id objc_msgSend_secondsHand(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "secondsHand");
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "section");
}

id objc_msgSend_sectionFooterHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionFooterHeight");
}

id objc_msgSend_sectionForObject_collationStringSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionForObject:collationStringSelector:");
}

id objc_msgSend_sectionForSectionIndexTitleAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionForSectionIndexTitleAtIndex:");
}

id objc_msgSend_sectionHeaderConfigurationWithTitle_isRTL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionHeaderConfigurationWithTitle:isRTL:");
}

id objc_msgSend_sectionHeaderHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionHeaderHeight");
}

id objc_msgSend_sectionIndexTitles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionIndexTitles");
}

id objc_msgSend_sectionTitles(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionTitles");
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sections");
}

id objc_msgSend_selectRow_inComponent_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectRow:inComponent:animated:");
}

id objc_msgSend_selectedDuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedDuration");
}

id objc_msgSend_selectedField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedField");
}

id objc_msgSend_selectedIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedIndex");
}

id objc_msgSend_selectedRowInComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedRowInComponent:");
}

id objc_msgSend_selectedToneIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedToneIdentifier");
}

id objc_msgSend_selectedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "selectedViewController");
}

id objc_msgSend_separatorInset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "separatorInset");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "set");
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIdentifier:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAddEditAlarmController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddEditAlarmController:");
}

id objc_msgSend_setAddEditTimerController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddEditTimerController:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAdjustsImageWhenHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsImageWhenHighlighted:");
}

id objc_msgSend_setAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlarm:");
}

id objc_msgSend_setAlarmEditViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlarmEditViewController:");
}

id objc_msgSend_setAlarmEnabled_forCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlarmEnabled:forCell:");
}

id objc_msgSend_setAlarmManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlarmManager:");
}

id objc_msgSend_setAlarmVolume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlarmVolume:");
}

id objc_msgSend_setAlarmsLoadedAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlarmsLoadedAction:");
}

id objc_msgSend_setAlert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlert:");
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlignment:");
}

id objc_msgSend_setAllowedUnits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowedUnits:");
}

id objc_msgSend_setAllowsSelection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsSelection:");
}

id objc_msgSend_setAllowsSelectionDuringEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsSelectionDuringEditing:");
}

id objc_msgSend_setAllowsSnooze_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsSnooze:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAlwaysBounceVertical_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlwaysBounceVertical:");
}

id objc_msgSend_setAnalogClock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnalogClock:");
}

id objc_msgSend_setAnalogStopwatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnalogStopwatch:");
}

id objc_msgSend_setAnalogStopwatchContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnalogStopwatchContainer:");
}

id objc_msgSend_setAnchorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnchorStyle:");
}

id objc_msgSend_setAngle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAngle:");
}

id objc_msgSend_setAnimationBeginsFromCurrentState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationBeginsFromCurrentState:");
}

id objc_msgSend_setAnimationCurve_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationCurve:");
}

id objc_msgSend_setAnimationDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationDuration:");
}

id objc_msgSend_setAnimationRemainingTime_totalTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationRemainingTime:totalTime:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAudioVolume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAudioVolume:");
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocapitalizationType:");
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutocorrectionType:");
}

id objc_msgSend_setAutomaticallyAdjustsScrollViewInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticallyAdjustsScrollViewInsets:");
}

id objc_msgSend_setAutoresizesSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizesSubviews:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackButtonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackButtonTitle:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBackgroundImage_forBarPosition_barMetrics_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundImage:forBarPosition:barMetrics:");
}

id objc_msgSend_setBackgroundImage_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundImage:forState:");
}

id objc_msgSend_setBackgroundView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundView:");
}

id objc_msgSend_setBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarButtonItem:");
}

id objc_msgSend_setBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBarStyle:");
}

id objc_msgSend_setBaseForegroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaseForegroundColor:");
}

id objc_msgSend_setBaselineAdjustment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaselineAdjustment:");
}

id objc_msgSend_setBaselineRelativeLayoutMarginsForArrangement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBaselineRelativeLayoutMarginsForArrangement:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderStyle:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBottomKeylineView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBottomKeylineView:");
}

id objc_msgSend_setButtonCircleSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonCircleSize:");
}

id objc_msgSend_setButtonSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setButtonSize:");
}

id objc_msgSend_setByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setByAddingObjectsFromArray:");
}

id objc_msgSend_setBypassReloadDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBypassReloadDate:");
}

id objc_msgSend_setCalendar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCalendar:");
}

id objc_msgSend_setCellLayoutMarginsFollowReadableWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellLayoutMarginsFollowReadableWidth:");
}

id objc_msgSend_setCellStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellStyle:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setCenterNoResultsFoundLabelConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenterNoResultsFoundLabelConstraints:");
}

id objc_msgSend_setChangeButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChangeButton:");
}

id objc_msgSend_setCircleView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCircleView:");
}

id objc_msgSend_setCities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCities:");
}

id objc_msgSend_setCity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCity:");
}

id objc_msgSend_setCityNameLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCityNameLabel:");
}

id objc_msgSend_setClassicTones_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClassicTones:");
}

id objc_msgSend_setClearButtonMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClearButtonMode:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setClockLabelBaselineToTopConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClockLabelBaselineToTopConstraint:");
}

id objc_msgSend_setClockLabelDetailLabelSpaceConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClockLabelDetailLabelSpaceConstraint:");
}

id objc_msgSend_setClockLabelHeightConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClockLabelHeightConstraint:");
}

id objc_msgSend_setCollectionBottomConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollectionBottomConstraint:");
}

id objc_msgSend_setCollectionViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCollectionViewController:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setColumnSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColumnSpacing:");
}

id objc_msgSend_setColumnsPerPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColumnsPerPage:");
}

id objc_msgSend_setComponentColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setComponentColor:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstant:");
}

id objc_msgSend_setConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstraints:");
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentCompressionResistancePriority:forAxis:");
}

id objc_msgSend_setContentConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentConfiguration:");
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentHuggingPriority:forAxis:");
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentInset:");
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:");
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentOffset:animated:");
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentSize:");
}

id objc_msgSend_setContentString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentString:");
}

id objc_msgSend_setControlButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlButton:");
}

id objc_msgSend_setControlsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlsView:");
}

id objc_msgSend_setControlsViewDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControlsViewDelegate:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCornerStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerStyle:");
}

id objc_msgSend_setCountDownDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountDownDuration:");
}

id objc_msgSend_setCountDownLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountDownLabel:");
}

id objc_msgSend_setCountDownView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCountDownView:");
}

id objc_msgSend_setCurrentInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentInterval:");
}

id objc_msgSend_setCurrentLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentLabel:");
}

id objc_msgSend_setCurrentLapCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentLapCell:");
}

id objc_msgSend_setCurrentLapTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentLapTime:");
}

id objc_msgSend_setCurrentPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPage:");
}

id objc_msgSend_setCurrentPage_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentPage:animated:");
}

id objc_msgSend_setCurrentTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentTitle:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDate:");
}

id objc_msgSend_setDatePickerMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDatePickerMode:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDay:");
}

id objc_msgSend_setDeadZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeadZone:");
}

id objc_msgSend_setDefaultDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultDuration:");
}

id objc_msgSend_setDefaultSound_forCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultSound:forCategory:");
}

id objc_msgSend_setDefaultTone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultTone:");
}

id objc_msgSend_setDefaultToneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultToneIdentifier:");
}

id objc_msgSend_setDefaultVibrationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDefaultVibrationIdentifier:");
}

id objc_msgSend_setDeferAddedCity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeferAddedCity:");
}

id objc_msgSend_setDeferRemovedCity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeferRemovedCity:");
}

id objc_msgSend_setDeferredAddingAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeferredAddingAlarm:");
}

id objc_msgSend_setDeferredAddingTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeferredAddingTimer:");
}

id objc_msgSend_setDeferredEditingAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeferredEditingAction:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDelegate_duration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:duration:");
}

id objc_msgSend_setDelegateClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegateClass:");
}

id objc_msgSend_setDeleteButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeleteButton:");
}

id objc_msgSend_setDigitalStopwatchContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDigitalStopwatchContainer:");
}

id objc_msgSend_setDirectionalLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirectionalLayoutMargins:");
}

id objc_msgSend_setDisplayAdjustedElapsedTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayAdjustedElapsedTime:");
}

id objc_msgSend_setDotImageView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDotImageView:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setDurationFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDurationFormatter:");
}

id objc_msgSend_setDurationLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDurationLabel:");
}

id objc_msgSend_setDurationTime_title_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDurationTime:title:");
}

id objc_msgSend_setDurationWithInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDurationWithInterval:");
}

id objc_msgSend_setEdgesForExtendedLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEdgesForExtendedLayout:");
}

id objc_msgSend_setEdited_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEdited:");
}

id objc_msgSend_setEditedAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditedAlarm:");
}

id objc_msgSend_setEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditing:");
}

id objc_msgSend_setEditing_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditing:animated:");
}

id objc_msgSend_setEditingAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditingAccessoryType:");
}

id objc_msgSend_setElapsedTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setElapsedTime:");
}

id objc_msgSend_setEnableSwitch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnableSwitch:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEnabledSwitch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabledSwitch:");
}

id objc_msgSend_setEnablesReturnKeyAutomatically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnablesReturnKeyAutomatically:");
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstimatedRowHeight:");
}

id objc_msgSend_setEventType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventType:");
}

id objc_msgSend_setFeatureStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeatureStore:");
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFill");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setForPreview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForPreview:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHasTail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHasTail:");
}

id objc_msgSend_setHeaderTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeaderTitle:");
}

id objc_msgSend_setHealthQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHealthQueue:");
}

id objc_msgSend_setHealthStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHealthStore:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlighted:");
}

id objc_msgSend_setHighlightedBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlightedBackgroundColor:");
}

id objc_msgSend_setHorizontalAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHorizontalAlignment:");
}

id objc_msgSend_setHorizontalMapHeightConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHorizontalMapHeightConstraint:");
}

id objc_msgSend_setHour_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHour:");
}

id objc_msgSend_setHour_minute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHour:minute:");
}

id objc_msgSend_setHourHighlightFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHourHighlightFrame:");
}

id objc_msgSend_setHourMidX_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHourMidX:");
}

id objc_msgSend_setHoverStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHoverStyle:");
}

id objc_msgSend_setIconPlacement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIconPlacement:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdleTimerDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdleTimerDisabled:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:forState:");
}

id objc_msgSend_setIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndexPath:");
}

id objc_msgSend_setIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndicatorStyle:");
}

id objc_msgSend_setInstallsStandardGestureForInteractiveMovement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInstallsStandardGestureForInteractiveMovement:");
}

id objc_msgSend_setIsRunningPPTTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsRunningPPTTest:");
}

id objc_msgSend_setIsSleepAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsSleepAlarm:");
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItems:");
}

id objc_msgSend_setKeyboardAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardAppearance:");
}

id objc_msgSend_setKeyboardDismissMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardDismissMode:");
}

id objc_msgSend_setKeyboardFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardFrame:");
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardType:");
}

id objc_msgSend_setKeywords_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeywords:");
}

id objc_msgSend_setLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLabel:");
}

id objc_msgSend_setLap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLap:");
}

id objc_msgSend_setLapButtonOccludingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLapButtonOccludingView:");
}

id objc_msgSend_setLapButtonTopConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLapButtonTopConstraint:");
}

id objc_msgSend_setLapButtonWidthConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLapButtonWidthConstraint:");
}

id objc_msgSend_setLapLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLapLabel:");
}

id objc_msgSend_setLapNumberLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLapNumberLabel:");
}

id objc_msgSend_setLapNumberLabelBaselineBottomOffsetConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLapNumberLabelBaselineBottomOffsetConstraint:");
}

id objc_msgSend_setLapNumberLabelBaselineTopOffsetConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLapNumberLabelBaselineTopOffsetConstraint:");
}

id objc_msgSend_setLapSecondsHand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLapSecondsHand:");
}

id objc_msgSend_setLapStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLapStyle:");
}

id objc_msgSend_setLapTableController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLapTableController:");
}

id objc_msgSend_setLapTimes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLapTimes:");
}

id objc_msgSend_setLaps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLaps:");
}

id objc_msgSend_setLargeTitleDisplayMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLargeTitleDisplayMode:");
}

id objc_msgSend_setLatestLayoutSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLatestLayoutSize:");
}

id objc_msgSend_setLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMargins:");
}

id objc_msgSend_setLayoutMarginsFollowReadableWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLayoutMarginsFollowReadableWidth:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setLineWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineWidth:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setMapView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMapView:");
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMasksToBounds:");
}

id objc_msgSend_setMaximumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumContentSizeCategory:");
}

id objc_msgSend_setMaximumValueImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumValueImage:");
}

id objc_msgSend_setMediaAtTop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMediaAtTop:");
}

id objc_msgSend_setMigrator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMigrator:");
}

id objc_msgSend_setMinimumFontSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumFontSize:");
}

id objc_msgSend_setMinimumInteritemSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumInteritemSpacing:");
}

id objc_msgSend_setMinimumLineSpacing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumLineSpacing:");
}

id objc_msgSend_setMinimumScaleFactor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumScaleFactor:");
}

id objc_msgSend_setMinimumValueImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumValueImage:");
}

id objc_msgSend_setMinute_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinute:");
}

id objc_msgSend_setMinuteHighlightFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinuteHighlightFrame:");
}

id objc_msgSend_setMinuteMidX_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinuteMidX:");
}

id objc_msgSend_setMinutesHand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinutesHand:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMode:");
}

id objc_msgSend_setModernTones_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModernTones:");
}

id objc_msgSend_setMonth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMonth:");
}

id objc_msgSend_setNameLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNameLabel:");
}

id objc_msgSend_setNavigationBarHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNavigationBarHidden:");
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsDisplay");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsLayout");
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsStatusBarAppearanceUpdate");
}

id objc_msgSend_setNeedsUpdateConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsUpdateConstraints");
}

id objc_msgSend_setNoItemsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNoItemsView:");
}

id objc_msgSend_setNoResultsFoundLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNoResultsFoundLabel:");
}

id objc_msgSend_setNoneString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNoneString:");
}

id objc_msgSend_setNormalBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNormalBackgroundColor:");
}

id objc_msgSend_setNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumber:");
}

id objc_msgSend_setNumberFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberFormatter:");
}

id objc_msgSend_setNumberLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberLabel:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberOfPages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfPages:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOn:");
}

id objc_msgSend_setOn_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOn:animated:");
}

id objc_msgSend_setOnTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOnTintColor:");
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOpaque:");
}

id objc_msgSend_setOverrideTraitCollection_forChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideTraitCollection:forChildViewController:");
}

id objc_msgSend_setPageControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPageControl:");
}

id objc_msgSend_setPages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPages:");
}

id objc_msgSend_setPagingEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPagingEnabled:");
}

id objc_msgSend_setPagingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPagingViewController:");
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPath:");
}

id objc_msgSend_setPauseResumeButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPauseResumeButton:");
}

id objc_msgSend_setPermittedArrowDirections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPermittedArrowDirections:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setPreferredDatePickerStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredDatePickerStyle:");
}

id objc_msgSend_setPreferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredStyle:");
}

id objc_msgSend_setPrefersLargeTitles_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrefersLargeTitles:");
}

id objc_msgSend_setPreservesSuperviewLayoutMargins_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreservesSuperviewLayoutMargins:");
}

id objc_msgSend_setPresetItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresetItem:");
}

id objc_msgSend_setPresetView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresetView:");
}

id objc_msgSend_setPresetsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresetsController:");
}

id objc_msgSend_setPresetsDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresetsDelegate:");
}

id objc_msgSend_setPreviousLapsTotalInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviousLapsTotalInterval:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setPrompt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrompt:");
}

id objc_msgSend_setRecentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecentView:");
}

id objc_msgSend_setRecognizer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecognizer:");
}

id objc_msgSend_setReloadDataFuture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReloadDataFuture:");
}

id objc_msgSend_setRemainingTime_duration_state_title_forceRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemainingTime:duration:state:title:forceRefresh:");
}

id objc_msgSend_setRepeatLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepeatLabel:");
}

id objc_msgSend_setRepeatSchedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepeatSchedule:");
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReturnKeyType:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRole:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRowHeight:");
}

id objc_msgSend_setRowsPerPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRowsPerPage:");
}

id objc_msgSend_setRunMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRunMode:");
}

id objc_msgSend_setRunningTotal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRunningTotal:");
}

id objc_msgSend_setRunningTotalLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRunningTotalLabel:");
}

id objc_msgSend_setScrollDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollDirection:");
}

id objc_msgSend_setScrollEdgeAppearance_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEdgeAppearance:");
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollEnabled:");
}

id objc_msgSend_setScrollIndicatorInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollIndicatorInsets:");
}

id objc_msgSend_setScrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScrollView:");
}

id objc_msgSend_setSearchBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchBarStyle:");
}

id objc_msgSend_setSecond_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecond:");
}

id objc_msgSend_setSecondHighlightFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondHighlightFrame:");
}

id objc_msgSend_setSecondMidX_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondMidX:");
}

id objc_msgSend_setSecondsHand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondsHand:");
}

id objc_msgSend_setSectionIndexBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionIndexBackgroundColor:");
}

id objc_msgSend_setSectionIndexColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionIndexColor:");
}

id objc_msgSend_setSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSections:");
}

id objc_msgSend_setSelectedBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedBackgroundColor:");
}

id objc_msgSend_setSelectedField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedField:");
}

id objc_msgSend_setSelectedIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedIndex:");
}

id objc_msgSend_setSelectedMediaIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedMediaIdentifier:");
}

id objc_msgSend_setSelectedToneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedToneIdentifier:");
}

id objc_msgSend_setSelectedVibrationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedVibrationIdentifier:");
}

id objc_msgSend_setSelectionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectionStyle:");
}

id objc_msgSend_setSeparatorColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorColor:");
}

id objc_msgSend_setSeparatorInset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorInset:");
}

id objc_msgSend_setSeparatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSeparatorStyle:");
}

id objc_msgSend_setSetupButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSetupButton:");
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShadowColor:");
}

id objc_msgSend_setShape_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShape:");
}

id objc_msgSend_setShortcutItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortcutItems:");
}

id objc_msgSend_setShouldEnableStartButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldEnableStartButton:");
}

id objc_msgSend_setShouldHandleTimerReload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldHandleTimerReload:");
}

id objc_msgSend_setShouldRepeat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldRepeat:");
}

id objc_msgSend_setShowsCurrentLap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsCurrentLap:");
}

id objc_msgSend_setShowsEditButtonInNavigationBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsEditButtonInNavigationBar:");
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsHorizontalScrollIndicator:");
}

id objc_msgSend_setShowsMedia_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsMedia:");
}

id objc_msgSend_setShowsNone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsNone:");
}

id objc_msgSend_setShowsReorderControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsReorderControl:");
}

id objc_msgSend_setShowsToneStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsToneStore:");
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVerticalScrollIndicator:");
}

id objc_msgSend_setShowsVibrations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsVibrations:");
}

id objc_msgSend_setSiriTipView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiriTipView:");
}

id objc_msgSend_setSiriTipsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSiriTipsController:");
}

id objc_msgSend_setSleepCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSleepCoordinator:");
}

id objc_msgSend_setSleepDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSleepDelegate:");
}

id objc_msgSend_setSleepSchedule_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSleepSchedule:");
}

id objc_msgSend_setSleepStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSleepStore:");
}

id objc_msgSend_setSound_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSound:");
}

id objc_msgSend_setSoundLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSoundLabel:");
}

id objc_msgSend_setSourceRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceRect:");
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceView:");
}

id objc_msgSend_setSplitLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSplitLabel:");
}

id objc_msgSend_setStartButtonOccludingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartButtonOccludingView:");
}

id objc_msgSend_setStartButtonTopConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartButtonTopConstraint:");
}

id objc_msgSend_setStartButtonWidthConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartButtonWidthConstraint:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setState_animate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:animate:");
}

id objc_msgSend_setState_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:animated:");
}

id objc_msgSend_setStateNeedsReset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStateNeedsReset:");
}

id objc_msgSend_setStopButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStopButton:");
}

id objc_msgSend_setStopwatchController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStopwatchController:");
}

id objc_msgSend_setStopwatchManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStopwatchManager:");
}

id objc_msgSend_setStroke(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStroke");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setStyle_forceRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:forceRefresh:");
}

id objc_msgSend_setStyleProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyleProvider:");
}

id objc_msgSend_setSunriseLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSunriseLabel:");
}

id objc_msgSend_setSunsetLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSunsetLabel:");
}

id objc_msgSend_setTableHeaderView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableHeaderView:");
}

id objc_msgSend_setTableRows_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableRows:");
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableView:");
}

id objc_msgSend_setTableWidthConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableWidthConstraint:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTextContentType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextContentType:");
}

id objc_msgSend_setTextLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextLabel:");
}

id objc_msgSend_setTextfield_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextfield:");
}

id objc_msgSend_setTextfieldTrailConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextfieldTrailConstraint:");
}

id objc_msgSend_setTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTime:");
}

id objc_msgSend_setTimeDesignatorFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeDesignatorFont:");
}

id objc_msgSend_setTimeFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeFormatter:");
}

id objc_msgSend_setTimeLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeLabel:");
}

id objc_msgSend_setTimeLabelText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeLabelText:");
}

id objc_msgSend_setTimeLabelWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeLabelWidth:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeView:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimeZoneOffsetLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeZoneOffsetLabel:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setTimerCellView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimerCellView:");
}

id objc_msgSend_setTimerControlState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimerControlState:");
}

id objc_msgSend_setTimerControlsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimerControlsView:");
}

id objc_msgSend_setTimerCountdownWidthConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimerCountdownWidthConstraint:");
}

id objc_msgSend_setTimerLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimerLabel:");
}

id objc_msgSend_setTimerManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimerManager:");
}

id objc_msgSend_setTimerToEdit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimerToEdit:");
}

id objc_msgSend_setTimerToneName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimerToneName:");
}

id objc_msgSend_setTimerViewStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimerViewStyle");
}

id objc_msgSend_setTimerViewStyleForceRefresh_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimerViewStyleForceRefresh:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleColor:forState:");
}

id objc_msgSend_setTitleFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleFormatter:");
}

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleLabel:");
}

id objc_msgSend_setTitleView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleView:");
}

id objc_msgSend_setToneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToneIdentifier:");
}

id objc_msgSend_setToneName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setToneName:");
}

id objc_msgSend_setTopKeylineView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTopKeylineView:");
}

id objc_msgSend_setTotalLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTotalLabel:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTranslucent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslucent:");
}

id objc_msgSend_setUnderEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnderEditing:");
}

id objc_msgSend_setUnit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnit:");
}

id objc_msgSend_setUnitLabel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnitLabel:");
}

id objc_msgSend_setUnitsStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnitsStyle:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setVerticalAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerticalAlignment:");
}

id objc_msgSend_setVerticalMapHeightConstraint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVerticalMapHeightConstraint:");
}

id objc_msgSend_setVibrantOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVibrantOptions:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setViewControllers_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewControllers:animated:");
}

id objc_msgSend_setViewLoadedAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewLoadedAction:");
}

id objc_msgSend_setViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewModel:");
}

id objc_msgSend_setVolumeSlider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVolumeSlider:");
}

id objc_msgSend_setWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWidth:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWorldClockView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWorldClockView:");
}

id objc_msgSend_setYear_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setYear:");
}

id objc_msgSend_setZeroFormattingBehavior_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setZeroFormattingBehavior:");
}

id objc_msgSend_setupButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupButton");
}

id objc_msgSend_setupCell(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupCell");
}

id objc_msgSend_setupChangeButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupChangeButton");
}

id objc_msgSend_setupCircleView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupCircleView");
}

id objc_msgSend_setupCollectionControllerWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupCollectionControllerWithDelegate:");
}

id objc_msgSend_setupCollectionViewConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupCollectionViewConstraints");
}

id objc_msgSend_setupCompactNewTimerConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupCompactNewTimerConstraints");
}

id objc_msgSend_setupConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupConstraints");
}

id objc_msgSend_setupControlButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupControlButton");
}

id objc_msgSend_setupControlsView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupControlsView");
}

id objc_msgSend_setupCountdownLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupCountdownLabel");
}

id objc_msgSend_setupCountdownView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupCountdownView");
}

id objc_msgSend_setupDateFormatters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDateFormatters");
}

id objc_msgSend_setupDurationLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDurationLabel");
}

id objc_msgSend_setupEdgeAppearance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupEdgeAppearance");
}

id objc_msgSend_setupForTest_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupForTest:options:");
}

id objc_msgSend_setupHeaderTitle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupHeaderTitle");
}

id objc_msgSend_setupLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupLabel");
}

id objc_msgSend_setupLayoutConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupLayoutConstraints");
}

id objc_msgSend_setupLayoutForTimerControlState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupLayoutForTimerControlState:");
}

id objc_msgSend_setupMultipleTimerConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupMultipleTimerConstraints");
}

id objc_msgSend_setupNavigationButtons(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupNavigationButtons");
}

id objc_msgSend_setupNumberLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupNumberLabel");
}

id objc_msgSend_setupPresetView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupPresetView");
}

id objc_msgSend_setupSharedLayoutConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupSharedLayoutConstraint");
}

id objc_msgSend_setupSingleTimerConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupSingleTimerConstraints");
}

id objc_msgSend_setupTextField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupTextField");
}

id objc_msgSend_setupTimeView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupTimeView");
}

id objc_msgSend_setupTimerNameLabelForTimerStyle_withFontStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupTimerNameLabelForTimerStyle:withFontStyle:");
}

id objc_msgSend_setupTimerUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupTimerUI:");
}

id objc_msgSend_setupUnitLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupUnitLabel");
}

id objc_msgSend_setupViewModelWithStopwatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupViewModelWithStopwatch:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedBehavior(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedBehavior");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedListener(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedListener");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedToneManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedToneManager");
}

id objc_msgSend_sharedVibrationManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedVibrationManager");
}

id objc_msgSend_sharedWorkspaceObserver(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedWorkspaceObserver");
}

id objc_msgSend_shortcutItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortcutItem");
}

id objc_msgSend_shortcutItemForCurrentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortcutItemForCurrentState");
}

id objc_msgSend_shortcutItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortcutItems");
}

id objc_msgSend_shouldHandleTimerReload(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldHandleTimerReload");
}

id objc_msgSend_shouldMakeUIForDefaultPNG(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldMakeUIForDefaultPNG");
}

id objc_msgSend_shouldProcessUpdate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldProcessUpdate");
}

id objc_msgSend_shouldSetupConstraintsAtLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldSetupConstraintsAtLayout");
}

id objc_msgSend_shouldShowAddView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowAddView");
}

id objc_msgSend_shouldToggleEditView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldToggleEditView");
}

id objc_msgSend_shouldUseCompactLayoutForSizeClass_windowWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUseCompactLayoutForSizeClass:windowWidth:");
}

id objc_msgSend_shouldUseRegularLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldUseRegularLayout");
}

id objc_msgSend_showAddAlarmViewPopUpWithAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAddAlarmViewPopUpWithAlarm:");
}

id objc_msgSend_showAddTimerViewWithTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAddTimerViewWithTimer:");
}

id objc_msgSend_showAddView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAddView");
}

id objc_msgSend_showAddViewForAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAddViewForAlarm:");
}

id objc_msgSend_showAddViewForAlarmWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAddViewForAlarmWithID:");
}

id objc_msgSend_showAddViewForTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAddViewForTimer:");
}

id objc_msgSend_showEditViewForRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showEditViewForRow:");
}

id objc_msgSend_showExpectedTimeWithRemainingTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showExpectedTimeWithRemainingTime:");
}

id objc_msgSend_showSleepView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSleepView");
}

id objc_msgSend_showSleepView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSleepView:");
}

id objc_msgSend_showSoundPicker_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSoundPicker:");
}

id objc_msgSend_showSubseconds(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showSubseconds");
}

id objc_msgSend_showingClearButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showingClearButton");
}

id objc_msgSend_showsCurrentLap(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsCurrentLap");
}

id objc_msgSend_showsReorderControl(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showsReorderControl");
}

id objc_msgSend_singleTimerCell(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "singleTimerCell");
}

id objc_msgSend_singleTimerSectionSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "singleTimerSectionSize");
}

id objc_msgSend_singleTimerVC(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "singleTimerVC");
}

id objc_msgSend_siriTipsController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "siriTipsController");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "size");
}

id objc_msgSend_sizeForIntersectionWithCityView_atOrigin_selfOrigin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeForIntersectionWithCityView:atOrigin:selfOrigin:");
}

id objc_msgSend_sizeForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeForStyle:");
}

id objc_msgSend_sizeLabelToFit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeLabelToFit");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeThatFits_siriTipView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:siriTipView:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeToFit");
}

id objc_msgSend_sizeWithAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeWithAttributes:");
}

id objc_msgSend_sleepAlarm(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepAlarm");
}

id objc_msgSend_sleepCoordinator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepCoordinator");
}

id objc_msgSend_sleepEditController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepEditController");
}

id objc_msgSend_sleepMetadata(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepMetadata");
}

id objc_msgSend_sleepSchedule(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepSchedule");
}

id objc_msgSend_sleepScheduleModelDidChange(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepScheduleModelDidChange");
}

id objc_msgSend_sleepStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sleepStore");
}

id objc_msgSend_songSoundWithIdentifier_vibrationIdentifier_volume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "songSoundWithIdentifier:vibrationIdentifier:volume:");
}

id objc_msgSend_songsQuery(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "songsQuery");
}

id objc_msgSend_sortDescriptorWithKey_ascending_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortDescriptorWithKey:ascending:");
}

id objc_msgSend_sortedArrayFromArray_collationStringSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayFromArray:collationStringSelector:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_sound(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sound");
}

id objc_msgSend_soundByUpdatingVibrationIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "soundByUpdatingVibrationIdentifier:");
}

id objc_msgSend_soundLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "soundLabel");
}

id objc_msgSend_soundType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "soundType");
}

id objc_msgSend_soundVolume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "soundVolume");
}

id objc_msgSend_sourceApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceApplication");
}

id objc_msgSend_splitLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "splitLabel");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "start");
}

id objc_msgSend_startButtonItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startButtonItem");
}

id objc_msgSend_startButtonOccludingView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startButtonOccludingView");
}

id objc_msgSend_startButtonTopConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startButtonTopConstraint");
}

id objc_msgSend_startButtonWidthConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startButtonWidthConstraint");
}

id objc_msgSend_startDisplayUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startDisplayUpdates");
}

id objc_msgSend_startEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startEditing");
}

id objc_msgSend_startEditingSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startEditingSetting:");
}

id objc_msgSend_startLapTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startLapTimer");
}

id objc_msgSend_startRecentTimerForCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRecentTimerForCell:");
}

id objc_msgSend_startStopButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startStopButton");
}

id objc_msgSend_startStopwatchShortcutItemForMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startStopwatchShortcutItemForMode:");
}

id objc_msgSend_startTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimer:");
}

id objc_msgSend_startTimerForCell_withDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimerForCell:withDuration:");
}

id objc_msgSend_startTimerShortcutItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startTimerShortcutItem");
}

id objc_msgSend_startUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startUpdates");
}

id objc_msgSend_startUpdatingSingleTimerUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startUpdatingSingleTimerUI");
}

id objc_msgSend_startUpdatingTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startUpdatingTime");
}

id objc_msgSend_startUpdatingTimerUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startUpdatingTimerUI");
}

id objc_msgSend_started(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "started");
}

id objc_msgSend_startedTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startedTest:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "state");
}

id objc_msgSend_stateNeedsReset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateNeedsReset");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stop");
}

id objc_msgSend_stopButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopButton");
}

id objc_msgSend_stopPreviewingTone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopPreviewingTone");
}

id objc_msgSend_stopStopwatchShortcutItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopStopwatchShortcutItem");
}

id objc_msgSend_stopTimerShortcutItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopTimerShortcutItem");
}

id objc_msgSend_stopUpdates(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopUpdates");
}

id objc_msgSend_stopUpdatingTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopUpdatingTime");
}

id objc_msgSend_stopUpdatingTimerUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopUpdatingTimerUI");
}

id objc_msgSend_stopwatchController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopwatchController");
}

id objc_msgSend_stopwatchManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopwatchManager");
}

id objc_msgSend_stopwatchPagingViewController_didPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopwatchPagingViewController:didPage:");
}

id objc_msgSend_stopwatchViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopwatchViewController");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringFromTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromTimeInterval:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_stroke(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stroke");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "style");
}

id objc_msgSend_styleSpecificConstraints(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "styleSpecificConstraints");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subviews");
}

id objc_msgSend_sunrise(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sunrise");
}

id objc_msgSend_sunriseLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sunriseLabel");
}

id objc_msgSend_sunset(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sunset");
}

id objc_msgSend_sunsetLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sunsetLabel");
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "superview");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronize");
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemBlueColor");
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:");
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:weight:");
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemGreenColor");
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemOrangeColor");
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemRedColor");
}

id objc_msgSend_systemTimeZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemTimeZone");
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemWhiteColor");
}

id objc_msgSend_tabBar(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBar");
}

id objc_msgSend_tabBarController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarController");
}

id objc_msgSend_tabBarItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabBarItem");
}

id objc_msgSend_tabIndexForAppSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tabIndexForAppSection:");
}

id objc_msgSend_tableCellClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableCellClass");
}

id objc_msgSend_tableHeaderView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableHeaderView");
}

id objc_msgSend_tableRows(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableRows");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView");
}

id objc_msgSend_tableWidthConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableWidthConstraint");
}

id objc_msgSend_teardownForTest_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "teardownForTest:options:");
}

id objc_msgSend_terminatorUpdateInterval(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "terminatorUpdateInterval");
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "text");
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textField");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textLabel");
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textProperties");
}

id objc_msgSend_textRangeFromPosition_toPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textRangeFromPosition:toPosition:");
}

id objc_msgSend_textStyleForCellStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textStyleForCellStyle:");
}

id objc_msgSend_textfield(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textfield");
}

id objc_msgSend_textfieldTrailConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "textfieldTrailConstraint");
}

id objc_msgSend_thinG2MonospacedDigitFontWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "thinG2MonospacedDigitFontWithSize:");
}

id objc_msgSend_tickWithTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tickWithTimer:");
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "time");
}

id objc_msgSend_timeDesignatorAppearsBeforeTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeDesignatorAppearsBeforeTime");
}

id objc_msgSend_timeFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeFormatter");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeLabel");
}

id objc_msgSend_timePickerCellForTableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timePickerCellForTableView:");
}

id objc_msgSend_timePickerDidSelectDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timePickerDidSelectDuration:");
}

id objc_msgSend_timeView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeView");
}

id objc_msgSend_timeZone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZone");
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneForSecondsFromGMT:");
}

id objc_msgSend_timeZoneOffsetLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneOffsetLabel");
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeZoneWithName:");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timer");
}

id objc_msgSend_timerAddEditController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerAddEditController");
}

id objc_msgSend_timerAddEditControllerDidCancel_reload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerAddEditControllerDidCancel:reload:");
}

id objc_msgSend_timerByUpdatingWithState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerByUpdatingWithState:");
}

id objc_msgSend_timerCellView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerCellView");
}

id objc_msgSend_timerControlCell(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerControlCell");
}

id objc_msgSend_timerControlState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerControlState");
}

id objc_msgSend_timerControlsView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerControlsView");
}

id objc_msgSend_timerCountdownWidthConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerCountdownWidthConstraint");
}

id objc_msgSend_timerID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerID");
}

id objc_msgSend_timerIDString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerIDString");
}

id objc_msgSend_timerLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerLabel");
}

id objc_msgSend_timerManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerManager");
}

id objc_msgSend_timerTick_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerTick:");
}

id objc_msgSend_timerToEdit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerToEdit");
}

id objc_msgSend_timerViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerViewController");
}

id objc_msgSend_timerViewStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerViewStyle");
}

id objc_msgSend_timerWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timerWithIdentifier:");
}

id objc_msgSend_timers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timers");
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tintColor");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "title");
}

id objc_msgSend_titleForTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleForTimer:");
}

id objc_msgSend_titleFormatter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleFormatter");
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "titleLabel");
}

id objc_msgSend_toneIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toneIdentifier");
}

id objc_msgSend_toneName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toneName");
}

id objc_msgSend_tonePickerCellForTableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tonePickerCellForTableView:");
}

id objc_msgSend_tonePickerViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tonePickerViewController");
}

id objc_msgSend_toneSoundWithIdentifier_vibrationIdentifer_volume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toneSoundWithIdentifier:vibrationIdentifer:volume:");
}

id objc_msgSend_toneWithIdentifierIsValid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "toneWithIdentifierIsValid:");
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topAnchor");
}

id objc_msgSend_topKeylineView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topKeylineView");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topViewController");
}

id objc_msgSend_topic(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topic");
}

id objc_msgSend_totalLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "totalLabel");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "trailingAnchor");
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollection");
}

id objc_msgSend_traitCollectionWithPreferredContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithPreferredContentSizeCategory:");
}

id objc_msgSend_traitCollectionWithUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "traitCollectionWithUserInterfaceStyle:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_underEditing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underEditing");
}

id objc_msgSend_unit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unit");
}

id objc_msgSend_unitLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unitLabel");
}

id objc_msgSend_unregisterObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unregisterObserver:");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_updateAddButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAddButton");
}

id objc_msgSend_updateAlarm_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateAlarm:");
}

id objc_msgSend_updateCityNameAndTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCityNameAndTime");
}

id objc_msgSend_updateClocksForSize_transitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateClocksForSize:transitionCoordinator:");
}

id objc_msgSend_updateCollectionViewLayout(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCollectionViewLayout");
}

id objc_msgSend_updateControlButtonWithState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateControlButtonWithState:");
}

id objc_msgSend_updateDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDelegate:");
}

id objc_msgSend_updateDetails(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDetails");
}

id objc_msgSend_updateDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDuration:");
}

id objc_msgSend_updateHighlightPath(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHighlightPath");
}

id objc_msgSend_updateLabelAdjustFontSize(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLabelAdjustFontSize");
}

id objc_msgSend_updateLabelColorForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLabelColorForState:");
}

id objc_msgSend_updateNewYearsDay(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateNewYearsDay");
}

id objc_msgSend_updatePauseResumeButtonWithState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatePauseResumeButtonWithState:");
}

id objc_msgSend_updateSelectedSoundCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSelectedSoundCell:");
}

id objc_msgSend_updateSelectedSoundUI(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSelectedSoundUI");
}

id objc_msgSend_updateSelectedTone(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSelectedTone");
}

id objc_msgSend_updateSelectedToneForCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSelectedToneForCell:");
}

id objc_msgSend_updateShortcutItemForCurrentState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateShortcutItemForCurrentState");
}

id objc_msgSend_updateShouldStackViewInCell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateShouldStackViewInCell:");
}

id objc_msgSend_updateStateAndReloadData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateAndReloadData");
}

id objc_msgSend_updateStopwatch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStopwatch:");
}

id objc_msgSend_updateSunriseAndSunsetLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSunriseAndSunsetLabel");
}

id objc_msgSend_updateTerminator(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTerminator");
}

id objc_msgSend_updateTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTime");
}

id objc_msgSend_updateTimeAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTimeAnimated:");
}

id objc_msgSend_updateTimeViewFont(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTimeViewFont");
}

id objc_msgSend_updateTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTimer:");
}

id objc_msgSend_updateTimer_reload_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTimer:reload:");
}

id objc_msgSend_updateTimerAppShortcuts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateTimerAppShortcuts");
}

id objc_msgSend_updateWithDisplayLink(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithDisplayLink");
}

id objc_msgSend_updateWithDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithDuration:");
}

id objc_msgSend_updateWithLatestDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithLatestDuration:");
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userActivities");
}

id objc_msgSend_userActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userActivity");
}

id objc_msgSend_userCachesDirectory(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userCachesDirectory");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceIdiom");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "value");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_verticalMapHeightConstraint(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verticalMapHeightConstraint");
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verticalSizeClass");
}

id objc_msgSend_vibrationIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vibrationIdentifier");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewControllers");
}

id objc_msgSend_viewModel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewModel");
}

id objc_msgSend_viewWillTransitionToSize_withTransitionCoordinator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewWillTransitionToSize:withTransitionCoordinator:");
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleCells");
}

id objc_msgSend_visibleViewHeight(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleViewHeight");
}

id objc_msgSend_volumeSlider(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "volumeSlider");
}

id objc_msgSend_warmUp(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "warmUp");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whiteColor");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_width(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "width");
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widthAnchor");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willMoveToParentViewController:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowScene");
}

id objc_msgSend_windowScene_performActionForShortcutItem_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowScene:performActionForShortcutItem:completionHandler:");
}

id objc_msgSend_windowSceneWillConnect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowSceneWillConnect:");
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windows");
}

id objc_msgSend_worldClockPadController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "worldClockPadController");
}

id objc_msgSend_worldClockTableViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "worldClockTableViewController");
}

id objc_msgSend_worldClockView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "worldClockView");
}

id objc_msgSend_worldClockViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "worldClockViewController");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToFile:atomically:");
}
