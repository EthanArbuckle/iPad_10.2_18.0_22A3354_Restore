void sub_100003990(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000039A4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[VSAMSMetricsReporter shared](_TtC19videosubscriptionsd20VSAMSMetricsReporter, "shared"));
  objc_msgSend(v2, "enqueue:", *(_QWORD *)(a1 + 32));

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "preferences"));
  LODWORD(v2) = objc_msgSend(v3, "flushMetrics");

  if ((_DWORD)v2)
  {
    v8 = VSDefaultLogObject(v4, v5, v6, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Flushing AMS metrics event", v11, 2u);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[VSAMSMetricsReporter shared](_TtC19videosubscriptionsd20VSAMSMetricsReporter, "shared"));
    objc_msgSend(v10, "flush");

  }
}

void sub_100004B1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100004B30(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD v11[5];
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "recordEvent"));
  objc_msgSend(v2, "addErrorBlock:", &stru_100018690);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "preferences"));
  v4 = objc_msgSend(v3, "flushMetrics");

  if (v4)
  {
    v9 = VSDefaultLogObject(v5, v6, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Analytics service flushing events.", buf, 2u);
    }

    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100004C70;
    v11[3] = &unk_1000186F8;
    v11[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v2, "addSuccessBlock:", v11);
  }

}

void sub_100004C20(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;

  v2 = a2;
  v3 = VSErrorLogObject();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10000EA48();

}

void sub_100004C70(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  v3 = a2;
  v7 = VSDefaultLogObject(v3, v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully recorded metadata event: %@", (uint8_t *)&v13, 0xCu);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "mainMetricsKit"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "system"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "eventRecorder"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "flushUnreportedEvents"));

  objc_msgSend(v12, "addFinishBlock:", &stru_1000186D0);
}

void sub_100004D80(id a1, id a2, NSError *a3)
{
  NSError *v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  NSError *v7;

  v3 = a3;
  v4 = VSDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Did flush unreported events with error %@", (uint8_t *)&v6, 0xCu);
  }

}

void sub_100005118(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005148(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void sub_100005314(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint8_t v14[16];

  v6 = a2;
  if (v6)
  {
    v7 = VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000EAA8();

  }
  else
  {
    v9 = VSDefaultLogObject(0, v3, v4, v5);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Finished initial load, resetting timer.", v14, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "resetTimer");
  }
  v11 = objc_claimAutoreleasedReturnValue(+[WLKSettingsStore sharedSettings](WLKSettingsStore, "sharedSettings"));
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(v12 + 64);
  *(_QWORD *)(v12 + 64) = v11;

  objc_msgSend(*(id *)(a1 + 32), "_setupObservers");
}

void sub_1000054E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005508(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v7[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = VSDefaultLogObject(WeakRetained, v2, v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TV app settings changed, removing any disconnected user accounts", v7, 2u);
  }

  objc_msgSend(WeakRetained, "_removeNonConnectedSignedOutUserAccounts");
}

void sub_10000561C(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD *v19;
  uint8_t buf[16];
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  id location;
  _QWORD v32[4];
  id v33;
  uint32_t os_unfair_lock_opaque;
  os_unfair_lock_s lock;

  lock._os_unfair_lock_opaque = objc_msgSend(*(id *)(a1 + 32), "loadingStoresLock");
  os_unfair_lock_lock(&lock);
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100005924;
  v32[3] = &unk_100018770;
  os_unfair_lock_opaque = lock._os_unfair_lock_opaque;
  v33 = *(id *)(a1 + 40);
  v2 = objc_retainBlock(v32);
  if (!objc_msgSend(*(id *)(a1 + 32), "storesLoaded"))
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = objc_alloc_init((Class)VSSemaphore);
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = sub_100005970;
    v29 = sub_100005980;
    v30 = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "container"));
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100005988;
    v21[3] = &unk_100018798;
    objc_copyWeak(&v24, &location);
    v23 = &v25;
    v5 = v3;
    v22 = v5;
    objc_msgSend(v4, "loadPersistentStoresWithCompletionHandler:", v21);

    objc_msgSend(v5, "wait");
    if ((objc_msgSend(*(id *)(a1 + 32), "storesLoaded") & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "preferences"));
      v7 = objc_msgSend(v6, "performedSubcriptionToUserAccountMigration");

      if (!v7)
      {
        v15 = VSDefaultLogObject(v8, v9, v10, v11);
        v16 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Migration not performed, will fetch subscriptions for migration...", buf, 2u);
        }

        v17 = *(void **)(a1 + 32);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100005A80;
        v18[3] = &unk_1000187E8;
        v18[4] = v17;
        v19 = v2;
        objc_msgSend(v17, "_subscriptionsForMigrationWithCompletion:", v18);

        goto LABEL_13;
      }
      v12 = VSDefaultLogObject(v8, v9, v10, v11);
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Migration already performed, skipping.", buf, 2u);
      }

      v14 = 0;
    }
    else
    {
      v14 = v26[5];
    }
    ((void (*)(_QWORD *, uint64_t))v2[2])(v2, v14);
LABEL_13:

    objc_destroyWeak(&v24);
    _Block_object_dispose(&v25, 8);

    objc_destroyWeak(&location);
    goto LABEL_14;
  }
  ((void (*)(_QWORD *, _QWORD))v2[2])(v2, 0);
LABEL_14:

}

void sub_1000058E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  id *v24;
  uint64_t v25;

  objc_destroyWeak(v24);
  _Block_object_dispose(&a24, 8);
  objc_destroyWeak((id *)(v25 - 136));
  _Unwind_Resume(a1);
}

void sub_100005924(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

uint64_t sub_100005970(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100005980(uint64_t a1)
{

}

void sub_100005988(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint8_t v15[16];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v10 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      v11 = VSErrorLogObject();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10000EB08();

      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    }
    else
    {
      v13 = VSDefaultLogObject(WeakRetained, v7, v8, v9);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Finished loading persistent stores successfully.", v15, 2u);
      }

      objc_msgSend(v10, "setStoresLoaded:", 1);
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "signal");

}

void sub_100005A80(uint64_t a1, int a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  int v26;
  id v27;
  id obj;
  uint8_t buf[16];
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v26 = a2;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSValueTransformer valueTransformerForName:](NSValueTransformer, "valueTransformerForName:", VSSubscriptionValueTransformerName));
    v11 = objc_alloc_init((Class)VSWaitGroup);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v27 = v5;
    obj = v5;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transformedValue:", v16));

          if (!v17)
            +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("The [subscriptionTransformer transformedValue:migrationSubscription] parameter must not be nil."));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transformedValue:", v16));
          objc_msgSend(v11, "enter");
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "createSaveContext"));
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_100005D40;
          v30[3] = &unk_1000187C0;
          v20 = *(_QWORD *)(a1 + 32);
          v31 = v19;
          v32 = v20;
          v33 = v18;
          v34 = v11;
          v21 = v18;
          v22 = v19;
          objc_msgSend(v22, "performBlock:", v30);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v13);
    }

    objc_msgSend(v11, "wait");
    v5 = v27;
    a2 = v26;
  }
  if (a2)
  {
    v23 = VSDefaultLogObject(v6, v7, v8, v9);
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Marking migration as completed.", buf, 2u);
    }

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "preferences"));
    objc_msgSend(v25, "setPerformedSubcriptionToUserAccountMigration");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100005D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  NSObject *v6;
  VSPersistentUserAccount *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  unsigned __int8 v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  VSPersistentUserAccount *v22;

  v5 = VSDefaultLogObject(a1, a2, a3, a4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "performing migration user account insertion...", buf, 2u);
  }

  v7 = -[VSPersistentUserAccount initWithContext:]([VSPersistentUserAccount alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  v8 = objc_msgSend(*(id *)(a1 + 40), "_populatePersistentUserAccount:withUserAccount:context:", v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  v12 = VSDefaultLogObject(v8, v9, v10, v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "saving migrated persistent account: %@", buf, 0xCu);
  }

  v15 = *(_QWORD *)(a1 + 32);
  v14 = *(void **)(a1 + 40);
  v20 = 0;
  v16 = objc_msgSend(v14, "saveContext:withError:", v15, &v20);
  v17 = v20;
  if ((v16 & 1) == 0)
  {
    v18 = VSErrorLogObject();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10000EB68();

  }
  objc_msgSend(*(id *)(a1 + 56), "leave");

}

void sub_100005ECC(_Unwind_Exception *exception_object, int a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;

  if (a2)
  {
    if (a2 == 2)
    {
      v2 = objc_begin_catch(exception_object);
      v3 = VSErrorLogObject();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        sub_10000EBC8();

      objc_end_catch();
      JUMPOUT(0x100005E78);
    }
    objc_begin_catch(exception_object);
    JUMPOUT(0x100005E7CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_1000061B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1000061D8(uint64_t a1, int a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _DWORD v14[2];
  __int16 v15;
  id v16;

  v5 = a3;
  v9 = VSDefaultLogObject(v5, v6, v7, v8);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = a2;
    v15 = 2112;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Migration delegate block invoked with completion status %d subscriptions %@", (uint8_t *)v14, 0x12u);
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;
  v13 = v5;

  objc_msgSend(*(id *)(a1 + 32), "leave");
}

void sub_100006398(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "prepareUserAccountsToVend:withSecurityTask:", a2, *(_QWORD *)(a1 + 40)));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100006458;
  v10[3] = &unk_100018860;
  v7 = *(id *)(a1 + 48);
  v12 = v5;
  v13 = v7;
  v11 = v6;
  v8 = v5;
  v9 = v6;
  VSPerformCompletionHandler(v10);

}

uint64_t sub_100006458(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_100006608(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "prepareUserAccountsToVend:withSecurityTask:", a2, *(_QWORD *)(a1 + 40)));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000066C8;
  v10[3] = &unk_100018860;
  v7 = *(id *)(a1 + 48);
  v12 = v5;
  v13 = v7;
  v11 = v6;
  v8 = v5;
  v9 = v6;
  VSPerformCompletionHandler(v10);

}

uint64_t sub_1000066C8(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

uint64_t sub_100006B54(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100006B64(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  if ((objc_msgSend(*(id *)(a1 + 32), "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameInternalSubscriptionService) & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "signingIdentifier"));
    v3 = objc_msgSend(objc_alloc((Class)VSBundleRecord), "initWithBundleID:", v2);
    v4 = v3;
    if (v3)
    {
      v5 = *(void **)(a1 + 40);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleVersion"));
      objc_msgSend(v5, "setModifierIdentifier:", v6);

    }
    objc_msgSend(*(id *)(a1 + 40), "setModifierType:", VSMetricAccountUpdateValueModifierTypeApp);

  }
  v10 = VSMetricAccountUpdateValueWriteTypeUpdate;
  if (objc_msgSend(*(id *)(a1 + 40), "isSignedOut"))
  {
    v7 = VSMetricAccountUpdateValueWriteTypeRemove;

    v10 = v7;
  }
  v8 = *(void **)(a1 + 40);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modifierIdentifier"));
  +[VSMetricsManagerObjC recordAccountUpdateWithAccount:source:updateType:completion:](VSMetricsManagerObjC, "recordAccountUpdateWithAccount:source:updateType:completion:", v8, v9, v10, 0);

}

void sub_100006C98(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  char v14;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006D7C;
  v9[3] = &unk_100018900;
  v10 = *(id *)(a1 + 32);
  v14 = *(_BYTE *)(a1 + 64);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v11 = v4;
  v12 = v5;
  v13 = v6;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007018;
  v7[3] = &unk_100018928;
  v8 = *(id *)(a1 + 56);
  objc_msgSend(a2, "unwrapObject:error:", v9, v7);

}

void sub_100006D7C(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "firstObject"));
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identityProviderID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "forceUnwrapObject"));
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v7)
    {
      if (*(_BYTE *)(a1 + 64))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legacyItemHash"));

        if (!v8)
          +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("The [account legacyItemHash] parameter must not be nil."));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legacyItemHash"));
        v13 = VSDefaultLogObject(v9, v10, v11, v12);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v21 = v9;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Associating user account with keychain hash %@", buf, 0xCu);
        }

        objc_msgSend(*(id *)(a1 + 40), "setKeychainItemHash:", objc_msgSend(v9, "unsignedIntegerValue"));
        objc_msgSend(*(id *)(a1 + 48), "insertUserAccount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
        goto LABEL_13;
      }
    }
  }
  v15 = VSErrorLogObject();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    sub_10000ED40();

  v17 = *(void **)(a1 + 56);
  if (v17)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100006F64;
    v18[3] = &unk_1000188D8;
    v19 = v17;
    VSPerformCompletionHandler(v18);
    v9 = v19;
LABEL_13:

  }
}

void sub_100006F64(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = VSPublicError(1, 6, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));

  if (v4
    && (+[VSLSApplicationRecord isAppStoreVendableForBundleIdentifier:](VSLSApplicationRecord, "isAppStoreVendableForBundleIdentifier:", v4) & 1) == 0)
  {
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("VSExceptionProviderMismatch"), CFSTR("Not currently signed in to a provider matching the one indicated by the user account"));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100007018(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a2;
  v4 = VSErrorLogObject();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_10000ED6C();

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = VSPublicError(1, 3, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000070F8;
    v10[3] = &unk_1000188B0;
    v8 = *(id *)(a1 + 32);
    v11 = v7;
    v12 = v8;
    v9 = v7;
    VSPerformCompletionHandler(v10);

  }
}

uint64_t sub_1000070F8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_100007108(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100007298(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "shouldAllowAccessForBooleanEntitlement:", VSEntitlementNameInternalSubscriptionService) & 1) == 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "signingIdentifier"));
    v3 = objc_msgSend(objc_alloc((Class)VSBundleRecord), "initWithBundleID:", v2);
    v4 = v3;
    if (v3)
    {
      v5 = *(void **)(a1 + 40);
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleVersion"));
      objc_msgSend(v5, "setModifierIdentifier:", v6);

    }
    objc_msgSend(*(id *)(a1 + 40), "setModifierType:", VSMetricAccountUpdateValueModifierTypeApp);

  }
  v7 = *(void **)(a1 + 40);
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "modifierIdentifier"));
  +[VSMetricsManagerObjC recordAccountUpdateWithAccount:source:updateType:completion:](VSMetricsManagerObjC, "recordAccountUpdateWithAccount:source:updateType:completion:", v7, v8, VSMetricAccountUpdateValueWriteTypeRemove, 0);

}

void sub_100007390(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = VSPublicError(1, 3, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);

}

void sub_1000073E0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    v5 = VSErrorLogObject();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000EDCC();

    v7 = objc_msgSend(v4, "copy");
    v8 = VSPublicError(1, 3, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  }
  else
  {
    v9 = 0;
  }
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000074D8;
    v11[3] = &unk_1000188B0;
    v13 = v10;
    v12 = v9;
    VSPerformCompletionHandler(v11);

  }
}

uint64_t sub_1000074D8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_10000768C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_1000076B0(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setCurrentUpdateSessionIsForced:", 1);
    objc_msgSend(v3, "_update");
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100007744;
  v4[3] = &unk_1000188D8;
  v5 = *(id *)(a1 + 32);
  VSPerformCompletionHandler(v4);

}

uint64_t sub_100007744(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100007750(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100007904(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_100007928(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setCurrentUpdateSessionIsForced:", 1);
    objc_msgSend(v3, "_forceRefreshAccount:", *(_QWORD *)(a1 + 32));
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000079C0;
  v4[3] = &unk_1000188D8;
  v5 = *(id *)(a1 + 40);
  VSPerformCompletionHandler(v4);

}

uint64_t sub_1000079C0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_1000079D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100007A90(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100007B18;
  v6[3] = &unk_1000188B0;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  VSPerformCompletionHandler(v6);

}

uint64_t sub_100007B18(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void sub_100007BB4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  if (v3)
  {
    v4 = v3;
    v5 = VSErrorLogObject();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000EE84();

    v7 = objc_msgSend(v4, "copy");
    v8 = VSPublicError(1, 3, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  }
  else
  {
    v9 = 0;
  }
  v10 = *(void **)(a1 + 32);
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100007CAC;
    v11[3] = &unk_1000188B0;
    v13 = v10;
    v12 = v9;
    VSPerformCompletionHandler(v11);

  }
}

uint64_t sub_100007CAC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100007DC8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *k;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  id v49;
  id obj;
  id v51;
  id v52;
  void *v53;
  id v54;
  _QWORD v55[4];
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  uint64_t v74;
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v47 = a1;
    v48 = v6;
    v8 = objc_alloc_init((Class)NSMutableDictionary);
    v54 = objc_alloc_init((Class)NSMutableDictionary);
    v51 = objc_alloc_init((Class)NSMutableArray);
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
    v53 = v8;
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v70 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subscriptionBillingCycleEndDate"));
          if (v15)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "subscriptionBillingCycleEndDate"));
            v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
            v18 = objc_msgSend(v16, "vs_isAfter:", v17);

            v8 = v53;
          }
          else
          {
            v18 = 1;
          }

          if ((objc_msgSend(v14, "isSignedOut") & 1) == 0
            && v18
            && objc_msgSend(v14, "sourceType") != (id)2)
          {
            v19 = objc_msgSend(v14, "sourceType");
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sourceIdentifier"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld%@"), v19, v20));

            objc_msgSend(v51, "addObject:", v21);
            if (objc_msgSend(v14, "isFromCurrentDevice"))
            {
              objc_msgSend(v54, "setObject:forKeyedSubscript:", v14, v21);
              v8 = v53;
            }
            else
            {
              v8 = v53;
              v22 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "objectForKeyedSubscript:", v21));
              if (!v22)
                v22 = objc_alloc_init((Class)NSMutableArray);
              objc_msgSend(v22, "addObject:", v14);
              objc_msgSend(v53, "setObject:forKeyedSubscript:", v22, v21);

            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v69, v77, 16);
      }
      while (v11);
    }
    v49 = v5;

    v23 = objc_alloc_init((Class)NSMutableArray);
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    obj = v51;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != v25; j = (char *)j + 1)
        {
          if (*(_QWORD *)v66 != v26)
            objc_enumerationMutation(obj);
          v28 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)j);
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v28));
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "objectForKeyedSubscript:", v28));
          if (v30)
          {
            objc_msgSend(v23, "addObject:", v30);
          }
          else if (objc_msgSend(v29, "count"))
          {
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "firstObject"));

            if (!v31)
              +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("The [nonLocalAccounts firstObject] parameter must not be nil."));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "firstObject"));
            objc_msgSend(v23, "addObject:", v32);

            v8 = v53;
          }

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v76, 16);
      }
      while (v25);
    }

    v52 = objc_alloc_init((Class)NSMutableArray);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v33 = v23;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v62;
      v37 = VSSubscriptionValueTransformerName;
      do
      {
        for (k = 0; k != v35; k = (char *)k + 1)
        {
          if (*(_QWORD *)v62 != v36)
            objc_enumerationMutation(v33);
          v39 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)k);
          v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSValueTransformer valueTransformerForName:](NSValueTransformer, "valueTransformerForName:", v37));
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "reverseTransformedValue:", v39));
          if (v41)
          {
            objc_msgSend(v52, "addObject:", v41);
          }
          else
          {
            v42 = VSErrorLogObject();
            v43 = objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412290;
              v74 = v39;
              _os_log_fault_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_FAULT, "Error transforming user account to subscription: %@", buf, 0xCu);
            }

          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v61, v75, 16);
      }
      while (v35);
    }

    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_1000083CC;
    v58[3] = &unk_1000188B0;
    v44 = *(id *)(v47 + 32);
    v59 = v52;
    v60 = v44;
    v45 = v52;
    VSPerformCompletionHandler(v58);

    v7 = v48;
    v5 = v49;
    v46 = v53;
  }
  else
  {
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000083E0;
    v55[3] = &unk_1000188B0;
    v57 = *(id *)(a1 + 32);
    v56 = v7;
    VSPerformCompletionHandler(v55);

    v46 = v57;
  }

}

uint64_t sub_1000083CC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t sub_1000083E0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = VSDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Legacy API - Found no active subscriptions.", v5, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_100008A84(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  uint8_t v19[16];
  void *v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_updateRequestForAccount:", *(_QWORD *)(a1 + 40)));
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));

    if (v6)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));

      if (!v11)
        +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("The [self timer] parameter must not be nil."));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));
      dispatch_source_cancel(v12);

    }
    v13 = VSDefaultLogObject(v7, v8, v9, v10);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "1 update request will be enqueued.", v19, 2u);
    }

    v15 = *(void **)(a1 + 32);
    v20 = v5;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
    objc_msgSend(v15, "_setUpdateRequestManagerWithRequests:", v16);

  }
  else
  {
    v17 = VSDefaultLogObject(0, v2, v3, v4);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "User account did not qualify for force refresh.", v19, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "setCurrentUpdateSessionIsForced:", 0);
  }

}

void sub_100008C98(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));

    if (!v3)
      +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("The [self timer] parameter must not be nil."));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));
    dispatch_source_cancel(v4);

  }
  v5 = *(void **)(a1 + 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v5, "setLastUpdateTime:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_predicateForUserAccountWithNonnullUpdateURL"));
  v8 = *(void **)(a1 + 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "createSaveContext"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100008DC8;
  v10[3] = &unk_100018A18;
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v8, "_queryUserAccountsWithPredicate:context:completion:", v7, v9, v10);

}

void sub_100008DC8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  void **v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void *v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  id v21;

  v3 = a2;
  v4 = objc_alloc_init((Class)NSMutableArray);
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_100008F44;
  v17 = &unk_1000189F0;
  v18 = *(_QWORD *)(a1 + 32);
  v5 = v4;
  v19 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", &v14);

  v6 = objc_msgSend(v5, "count", v14, v15, v16, v17, v18);
  v10 = VSDefaultLogObject(v6, v7, v8, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v12)
    {
      v13 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134217984;
      v21 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%lu update requests will be enqueued.", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "_setUpdateRequestManagerWithRequests:", v5);
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No user accounts qualified for update, will not enqueue any update requests.", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "resetTimer");
  }

}

void sub_100008F44(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_updateRequestForAccount:", a2));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v3 = v4;
  }

}

void sub_1000090D8(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  void *v20;
  _QWORD v21[3];

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = sub_100005970;
  v18 = sub_100005980;
  v19 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "timer"));
  v2 = v15[5];
  if (v2)
    dispatch_source_cancel(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_predicateForIsSignedOut:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_predicateForUserAccountWithNonnullUpdateURL"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_predicateForUserAccountWithNonnullBillingCycleEndDate"));
  v21[0] = v3;
  v21[1] = v4;
  v21[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_sortForUserAccountBillingCycleEndDateASC:", 1));
  v9 = *(void **)(a1 + 32);
  v20 = v8;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "createSaveContext"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100009318;
  v13[3] = &unk_100018A90;
  v12 = *(_QWORD *)(a1 + 32);
  v13[6] = *(_QWORD *)(a1 + 40);
  v13[4] = v12;
  v13[5] = &v14;
  objc_msgSend(v9, "_queryUserAccountsWithPredicate:sorts:fetchLimit:context:completion:", v7, v10, &off_100019358, v11, v13);

  _Block_object_dispose(&v14, 8);
}

void sub_1000092E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009318(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  dispatch_source_t v34;
  uint64_t v35;
  void *v36;
  dispatch_time_t v37;
  NSObject *v38;
  id v39;
  id v40;
  _QWORD handler[4];
  id v42;
  uint8_t buf[4];
  double v44;
  __int16 v45;
  id v46;

  v39 = a2;
  v40 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subscriptionBillingCycleEndDate"));

  v11 = VSDefaultLogObject(v7, v8, v9, v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v44 = *(double *)&v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Soonest expiring account is: %@", buf, 0xCu);
    }

    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastUpdateTime"));
    if (!v12)
      v12 = objc_claimAutoreleasedReturnValue(+[NSDate distantPast](NSDate, "distantPast"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject dateByAddingTimeInterval:](v12, "dateByAddingTimeInterval:", *(double *)(a1 + 48)));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "vs_dateIncrementedByMinutes:", 1));
    v16 = objc_msgSend(v14, "vs_isAfter:", v15);
    v20 = v15;
    if ((_DWORD)v16)
    {
      v21 = VSDefaultLogObject(v16, v17, v18, v19);
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = *(double *)&v14;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Next refresh time is within update frequency limit, using frequency limit time: %@", buf, 0xCu);
      }

      v20 = v14;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v20, "timeIntervalSinceDate:", v23);
    v25 = v24;

    v30 = VSDefaultLogObject(v26, v27, v28, v29);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v44 = v25;
      v45 = 2112;
      v46 = v20;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "refresh expiry timer will fire in %f seconds (%@)", buf, 0x16u);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "privateQueue"));
    v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "underlyingQueue"));
    v34 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v33);
    v35 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v36 = *(void **)(v35 + 40);
    *(_QWORD *)(v35 + 40) = v34;

    v37 = dispatch_time(0, 1000000000 * (unint64_t)v25);
    dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v37, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v38 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100009700;
    handler[3] = &unk_100018A68;
    objc_copyWeak(&v42, (id *)buf);
    dispatch_source_set_event_handler(v38, handler);
    objc_msgSend(*(id *)(a1 + 32), "setTimer:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    dispatch_activate(*(dispatch_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_destroyWeak(&v42);
    objc_destroyWeak((id *)buf);

  }
  else if (v13)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No subscriptions that qualify for expriation. Not setting up schedule.", buf, 2u);
  }

}

void sub_1000096DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100009700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  uint8_t v9[16];

  v5 = VSDefaultLogObject(a1, a2, a3, a4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Schedule timer fired.", v9, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "_update");

}

void sub_1000097F0(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WLKChannelManager defaultChannelManager](WLKChannelManager, "defaultChannelManager"));
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100009868;
  v3[3] = &unk_100018B08;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "vppaConsentedBundleIDsWithCompletion:", v3);

}

void sub_100009868(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  id v26;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v10 = v5;
    v14 = VSDefaultLogObject(v10, v11, v12, v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Consented Bundle IDs: %@", buf, 0xCu);
    }

    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_predicateForIsSignedOut:", 1));
    v17 = *(void **)(a1 + 32);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "createSaveContext"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100009A30;
    v22[3] = &unk_100018AE0;
    v19 = *(_QWORD *)(a1 + 32);
    v23 = v10;
    v24 = v19;
    v20 = v10;
    objc_msgSend(v17, "_queryUserAccountsWithPredicate:context:completion:", v16, v18, v22);

  }
  else
  {
    if (!v6)
      goto LABEL_6;
    v21 = VSDefaultLogObject(0, v7, v8, v9);
    v16 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Could not fetch VPPA-Consented and Connected bundleIDs: %@", buf, 0xCu);
    }
  }

LABEL_6:
}

void sub_100009A30(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  __int128 v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];

  v3 = a2;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v23;
    *(_QWORD *)&v5 = 138412290;
    v20 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sourceIdentifier", v20));
        v11 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10);
        if ((v11 & 1) == 0)
        {
          v15 = VSDefaultLogObject(v11, v12, v13, v14);
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "sourceIdentifier"));
            *(_DWORD *)buf = v20;
            v27 = v17;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Removing Signed Out User Account that is Not Connected: %@", buf, 0xCu);

          }
          v18 = *(void **)(a1 + 40);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "createSaveContext"));
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_100009C18;
          v21[3] = &unk_100018720;
          v21[4] = v9;
          objc_msgSend(v18, "_deleteUserAccount:context:completion:", v9, v19, v21);

        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v6);
  }

}

void sub_100009C18(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;

  v3 = a2;
  if (v3)
  {
    v4 = VSErrorLogObject();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_10000EF44(a1, (uint64_t)v3, v5);

  }
}

void sub_100009ED4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_100009EF0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint8_t buf[4];
  void *v25;

  v5 = a2;
  v6 = a3;
  v10 = v6;
  if (v6)
  {
    v11 = VSDefaultLogObject(v6, v7, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error checking for Existing Persistent User Account: %@", buf, 0xCu);
    }

  }
  if (objc_msgSend(v5, "count"))
  {
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000A098;
    v21[3] = &unk_100018B30;
    v23 = *(_QWORD *)(a1 + 64);
    v22 = *(id *)(a1 + 48);
    objc_msgSend(v13, "_deduplicatePersistentUserAccounts:context:completion:", v5, v14, v21);

  }
  else if (!objc_msgSend(v5, "count"))
  {
    v18 = VSDefaultLogObject(0, v15, v16, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(void **)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v25 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "New User Account to Insert: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "leave");
  }

}

void sub_10000A098(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  int v18;
  void *v19;

  v5 = a2;
  v6 = a3;
  v10 = v6;
  if (v6)
  {
    v11 = VSDefaultLogObject(v6, v7, v8, v9);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Error deduplicating Existing Persistent User Account: %@", (uint8_t *)&v18, 0xCu);
    }

  }
  v13 = VSDefaultLogObject(v6, v7, v8, v9);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Found matching existing persistent user account to update.", (uint8_t *)&v18, 2u);
  }

  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v5;
  v17 = v5;

  objc_msgSend(*(id *)(a1 + 32), "leave");
}

void sub_10000A1C8(uint64_t a1)
{
  VSPersistentUserAccount *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  VSPersistentUserAccount *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint8_t buf[16];

  v2 = (VSPersistentUserAccount *)*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v2)
  {
    v6 = v2;
    v7 = VSDefaultLogObject(v2, v3, v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found matching existing persistent user account to update.", buf, 2u);
    }

  }
  else
  {
    v6 = -[VSPersistentUserAccount initWithContext:]([VSPersistentUserAccount alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
  }
  objc_msgSend(*(id *)(a1 + 40), "_populatePersistentUserAccount:withUserAccount:context:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (!v9 || objc_msgSend(v9, "signedOut"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[VSPersistentUserAccount setCreated:](v6, "setCreated:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "signingIdentifier"));
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    if ((+[VSLSApplicationRecord isAppStoreVendableForBundleIdentifier:](VSLSApplicationRecord, "isAppStoreVendableForBundleIdentifier:", v13) & 1) == 0&& (+[VSLSApplicationRecord isDeletableForBundleIdentifier:](VSLSApplicationRecord, "isDeletableForBundleIdentifier:", v13) & 1) != 0|| objc_msgSend(*(id *)(a1 + 48), "isDeveloperCreated"))
    {
      -[VSPersistentUserAccount setDeveloper:](v6, "setDeveloper:", 1);
    }

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[VSDevice currentDevice](VSDevice, "currentDevice"));
  v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
  -[VSPersistentUserAccount setDeviceName:](v6, "setDeviceName:", v15);

  v17 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(a1 + 40);
  v22 = 0;
  LOBYTE(v15) = objc_msgSend(v16, "saveContext:withError:", v17, &v22);
  v18 = v22;
  if ((v15 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "resetTimer");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "remoteNotifier"));
    objc_msgSend(v19, "postNotification");

    if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "signedOut") & 1) == 0
      && objc_msgSend(*(id *)(a1 + 48), "isSignedOut"))
    {
      objc_msgSend(*(id *)(a1 + 40), "_removeNonConnectedSignedOutUserAccounts");
    }
  }
  else
  {
    v20 = VSErrorLogObject();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      sub_10000F080();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

void sub_10000A41C(void *exc_buf, int a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;

  if (a2 == 2)
  {
    v3 = objc_begin_catch(exc_buf);
    v4 = VSErrorLogObject();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_10000F020();

    v6 = VSPublicError(1, 3, 0);
    objc_claimAutoreleasedReturnValue(v6);

    objc_end_catch();
  }
  else
  {
    objc_begin_catch(exc_buf);
  }
  JUMPOUT(0x10000A3CCLL);
}

void sub_10000A618(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000F0E0();

    v9 = v6;
  }
  else if (objc_msgSend(v5, "count"))
  {
    v10 = v5;
    goto LABEL_8;
  }
  v10 = 0;
LABEL_8:
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000A730;
  v15[3] = &unk_100018860;
  v11 = *(void **)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v17 = v6;
  v18 = v12;
  v16 = v10;
  v13 = v6;
  v14 = v10;
  objc_msgSend(v11, "performBlock:", v15);

}

uint64_t sub_10000A730(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_10000AA64(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10000AA90(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    v5 = VSDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138412290;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Failed to delete duplicate persistent user account: %@", (uint8_t *)&v8, 0xCu);
    }

  }
}

void sub_10000ACA4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000F1E8();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else if (v5)
  {
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v9 = VSErrorLogObject();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        sub_10000F16C(v5, v10);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "_deletePersistentUserAccount:withContext:completion:", v11, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    }
    else
    {
      v12 = VSErrorLogObject();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        sub_10000F140();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

  }
}

void sub_10000AE98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned __int8 v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;

  v5 = VSDefaultLogObject(a1, a2, a3, a4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sourceIdentifier"));
    *(_DWORD *)buf = 138412290;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Going to delete account: %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "deleteObject:", *(_QWORD *)(a1 + 32));
  v9 = *(_QWORD *)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v24 = 0;
  v10 = objc_msgSend(v8, "saveContext:withError:", v9, &v24);
  v11 = v24;
  v15 = v11;
  if ((v10 & 1) != 0)
  {
    v16 = VSDefaultLogObject(v11, v12, v13, v14);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Success Delete: Posting Notification", buf, 2u);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "remoteNotifier"));
    objc_msgSend(v18, "postNotification");

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    v19 = VSErrorLogObject();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10000F248();

    v21 = *(_QWORD *)(a1 + 56);
    v22 = VSPublicError(1, 3, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v23);

  }
}

void sub_10000B130(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v6 = objc_alloc_init((Class)NSMutableArray);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_userAccountForPersistentUserAccount:context:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11), *(_QWORD *)(a1 + 40), (_QWORD)v13));
          objc_msgSend(v6, "addObject:", v12);

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void sub_10000B3C8(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  v4 = a1[4];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000B4B4;
  v6[3] = &unk_100018C48;
  v7 = v3;
  v12 = a1[8];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v11 = a1[4];
  v5 = v3;
  objc_msgSend(v4, "performBlock:", v6);

}

void sub_10000B4B4(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void (*v28)(void);
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t v38[128];
  uint8_t buf[4];
  id v40;
  __int16 v41;
  void *v42;

  v2 = a1[4];
  if (v2)
  {
    v3 = VSPublicError(1, 3, v2);
    v32 = (id)objc_claimAutoreleasedReturnValue(v3);
    (*(void (**)(void))(a1[9] + 16))();

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[VSPersistentUserAccount fetchRequest](VSPersistentUserAccount, "fetchRequest"));
    objc_msgSend(v4, "setIncludesPendingChanges:", 0);
    objc_msgSend(v4, "setPredicate:", a1[5]);
    objc_msgSend(v4, "setSortDescriptors:", a1[6]);
    v8 = (id)a1[7];
    if (v8)
      v8 = objc_msgSend(v4, "setFetchLimit:", objc_msgSend(v8, "unsignedIntegerValue"));
    v9 = VSDefaultLogObject(v8, v5, v6, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "predicate"));
      *(_DWORD *)buf = 138412290;
      v40 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Using predicate for fetch request: %@", buf, 0xCu);

    }
    v12 = (void *)a1[8];
    v37 = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "executeFetchRequest:error:", v4, &v37));
    v14 = v37;
    v18 = v14;
    if (v13)
    {
      v19 = VSDefaultLogObject(v14, v15, v16, v17);
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = objc_msgSend(v13, "count");
        *(_DWORD *)buf = 134218242;
        v40 = v21;
        v41 = 2112;
        v42 = v13;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Retrieved %lu persistent user accounts: %@", buf, 0x16u);
      }

      v22 = objc_alloc_init((Class)NSMutableArray);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v23 = v13;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v25; i = (char *)i + 1)
          {
            if (*(_QWORD *)v34 != v26)
              objc_enumerationMutation(v23);
            objc_msgSend(v22, "addObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i));
          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        }
        while (v25);
      }

      v28 = *(void (**)(void))(a1[9] + 16);
    }
    else
    {
      v29 = VSErrorLogObject();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_10000F2A8();

      v31 = VSPublicError(1, 3, v18);
      v22 = (id)objc_claimAutoreleasedReturnValue(v31);
      v28 = *(void (**)(void))(a1[9] + 16);
    }
    v28();

  }
}

void sub_10000B8CC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "updateURL"));
  objc_msgSend(v2, "setUpdateURL:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setRequiresSystemTrust:", objc_msgSend(*(id *)(a1 + 40), "requiresSystemTrust"));
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "accountProviderIdentifier"));
  objc_msgSend(v4, "setProviderID:", v5);

  v6 = *(void **)(a1 + 32);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
  objc_msgSend(v6, "setAccountIdentifier:", v7);

  objc_msgSend(*(id *)(a1 + 32), "setAccountType:", objc_msgSend(*(id *)(a1 + 40), "accountType"));
  objc_msgSend(*(id *)(a1 + 32), "setSignedOut:", objc_msgSend(*(id *)(a1 + 40), "isSignedOut"));
  v8 = *(void **)(a1 + 32);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "subscriptionBillingCycleEndDate"));
  objc_msgSend(v8, "setBillingCycleEndDate:", v9);

  v10 = *(void **)(a1 + 32);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "tierIdentifiers"));
  objc_msgSend(v10, "setTierIdentifiers:", v11);

  v12 = *(void **)(a1 + 32);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "billingIdentifier"));
  objc_msgSend(v12, "setBillingIdentifier:", v13);

  v14 = *(void **)(a1 + 32);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "authenticationData"));
  objc_msgSend(v14, "setAuthenticationData:", v15);

  objc_msgSend(*(id *)(a1 + 32), "setDeviceType:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setSourceType:", objc_msgSend(*(id *)(a1 + 40), "sourceType"));
  v16 = *(void **)(a1 + 32);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "sourceIdentifier"));
  objc_msgSend(v16, "setSourceIdentifier:", v17);

  v18 = *(void **)(a1 + 32);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "deviceIdentifier"));
  objc_msgSend(v18, "setDeviceIdentifier:", v19);

  objc_msgSend(*(id *)(a1 + 32), "setKeychainItemHash:", objc_msgSend(*(id *)(a1 + 40), "keychainItemHash"));
  v20 = *(void **)(a1 + 32);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v20, "setModified:", v21);

  objc_msgSend(*(id *)(a1 + 32), "setDeveloper:", objc_msgSend(*(id *)(a1 + 40), "isDeveloperCreated"));
  v22 = *(void **)(a1 + 32);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "created"));
  objc_msgSend(v22, "setCreated:", v23);

  v24 = *(void **)(a1 + 32);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "deviceName"));
  objc_msgSend(v24, "setDeviceName:", v25);

  v26 = *(void **)(a1 + 32);
  v27 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "appleSubscription"));
  objc_msgSend(v26, "setAppleSubscription:", v27);

}

void sub_10000BFB0(id *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "sourceType") == (id)2)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sourceIdentifier"));
          v10 = objc_msgSend(v9, "isEqualToString:", a1[4]);

          if (v10)
          {
            v12 = a1[5];
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "billingCycleEndDate"));
            objc_msgSend(v12, "setSubscriptionBillingCycleEndDate:", v13);

            objc_msgSend(a1[6], "signal");
            goto LABEL_12;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v5)
        continue;
      break;
    }
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[VSAccountStore sharedAccountStore](VSAccountStore, "sharedAccountStore"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000C1A0;
  v14[3] = &unk_100018D58;
  v15 = a1[4];
  v16 = a1[5];
  v17 = a1[6];
  objc_msgSend(v11, "fetchAccountsWithCompletionHandler:", v14);

LABEL_12:
}

void sub_10000C1A0(id *a1, void *a2)
{
  void **v4;
  uint64_t v5;
  void (*v6)(uint64_t, void *);
  void *v7;
  id v8;
  id v9;

  v4 = _NSConcreteStackBlock;
  v5 = 3221225472;
  v6 = sub_10000C234;
  v7 = &unk_100018D10;
  v8 = a1[4];
  v9 = a1[5];
  objc_msgSend(a2, "unwrapObject:error:", &v4, &stru_100018D30);
  objc_msgSend(a1[6], "signal", v4, v5, v6, v7);

}

void sub_10000C234(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "firstObject"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identityProviderID"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10000C304;
    v8[3] = &unk_100018CE8;
    v9 = *(id *)(a1 + 32);
    v10 = v5;
    v11 = *(id *)(a1 + 40);
    v7 = v5;
    objc_msgSend(v6, "conditionallyUnwrapObject:", v8);

  }
}

void sub_10000C304(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  if (objc_msgSend(a2, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "legacyItemHash"));
    v4 = objc_msgSend(v3, "unsignedIntegerValue");
    v5 = objc_msgSend(*(id *)(a1 + 48), "keychainItemHash");

    if (v4 == v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "authenticationToken"));
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_10000C3D0;
      v7[3] = &unk_100018CC0;
      v8 = *(id *)(a1 + 48);
      objc_msgSend(v6, "conditionallyUnwrapObject:", v7);

    }
  }
}

void sub_10000C3D0(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "expirationDate"));
  objc_msgSend(v2, "setSubscriptionBillingCycleEndDate:", v3);

}

void sub_10000C414(id a1, NSError *a2)
{
  NSError *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSError *v6;

  v2 = a2;
  v3 = VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Could not get account for expiration: %@", (uint8_t *)&v5, 0xCu);
  }

}

void sub_10000D300(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v6 = a2;
  if (v6)
  {
    v7 = VSErrorLogObject();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_10000F600();
  }
  else
  {
    v9 = VSDefaultLogObject(0, v3, v4, v5);
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138412290;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully inserted updated account from JS refresh: %@", (uint8_t *)&v11, 0xCu);
    }
  }

}

void sub_10000D5E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_10000D5F4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000D604(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_10000D628(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_10000D640(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void start()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const char *v3;
  void *v4;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;

  v0 = objc_autoreleasePoolPush();
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Entering main() for videosubscriptionsd.", buf, 2u);
  }
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_100018DC0);
  v1 = VSLoadBundleAtPath(CFSTR("System/Library/Frameworks/VideoSubscriberAccount.framework"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  objc_autoreleasePoolPop(v0);
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Will load VideoSubscriberAccount framework.", buf, 2u);
    }
    v4 = objc_autoreleasePoolPush();
    v14 = 0;
    v5 = objc_msgSend(v2, "loadAndReturnError:", &v14);
    v6 = v14;
    objc_autoreleasePoolPop(v4);
    if (v5)
    {
      v7 = objc_autoreleasePoolPush();
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Did load VideoSubscriberAccount framework.", buf, 2u);
      }
      v8 = objc_alloc_init(NSClassFromString(CFSTR("VSUserAccountService")));
      v9 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.VideoSubscriberAccount.videosubscriptionsd"));
      objc_msgSend(v9, "setDelegate:", v8);
      objc_msgSend(v9, "resume");
      v10 = NSClassFromString(CFSTR("VSAnalyticsService"));
      if (v10)
      {
        v11 = objc_alloc_init(v10);
        v12 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.VideoSubscriberAccount.AnalyticsService"));
        objc_msgSend(v12, "setDelegate:", v11);
        objc_msgSend(v12, "resume");
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Analytics service now listening.", buf, 2u);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to find principal class by name VSAnalyticsService.", buf, 2u);
      }
      objc_autoreleasePoolPop(v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
      objc_msgSend(v13, "run");

LABEL_12:
      exit(1);
    }
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 138412290;
    v16 = v6;
    v3 = "Error loading framework: %@";
  }
  else
  {
    if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      goto LABEL_12;
    *(_DWORD *)buf = 138412290;
    v16 = 0;
    v3 = "Unable to find framework using path: %@";
  }
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, v3, buf, 0xCu);
  goto LABEL_12;
}

void sub_10000D97C(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  const char *string;
  const char *v4;
  void *v5;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
    sub_10000F660();
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    v4 = string;
    if (!strcmp(string, "Application Installed") || !strcmp(v4, "Application Uninstalled"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v5, "postNotificationName:object:", CFSTR("VSInstalledApplicationsDidChange"), 0);

    }
  }

}

void sub_10000DD28(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void (*v7)(void);

  v4 = a3;
  if (v4)
  {
    v5 = VSErrorLogObject();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      sub_10000F6A4((uint64_t)v4, v6);

    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v7 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v7();

}

id sub_10000DEF4()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for VSAMSMetricsReporter()), "init");
  static VSAMSMetricsReporter.shared = (uint64_t)result;
  return result;
}

id VSAMSMetricsCenterBridge.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

uint64_t *VSAMSMetricsReporter.shared.unsafeMutableAddressor()
{
  if (qword_10001ED30 != -1)
    swift_once(&qword_10001ED30, sub_10000DEF4);
  return &static VSAMSMetricsReporter.shared;
}

id static VSAMSMetricsReporter.shared.getter()
{
  _BYTE v1[24];

  if (qword_10001ED30 != -1)
    swift_once(&qword_10001ED30, sub_10000DEF4);
  swift_beginAccess(&static VSAMSMetricsReporter.shared, v1, 0, 0);
  return (id)static VSAMSMetricsReporter.shared;
}

void static VSAMSMetricsReporter.shared.setter(uint64_t a1)
{
  void *v2;
  _BYTE v3[24];

  if (qword_10001ED30 != -1)
    swift_once(&qword_10001ED30, sub_10000DEF4);
  swift_beginAccess(&static VSAMSMetricsReporter.shared, v3, 1, 0);
  v2 = (void *)static VSAMSMetricsReporter.shared;
  static VSAMSMetricsReporter.shared = a1;

}

void *static VSAMSMetricsReporter.shared.modify(uint64_t a1)
{
  if (qword_10001ED30 != -1)
    swift_once(&qword_10001ED30, sub_10000DEF4);
  swift_beginAccess(&static VSAMSMetricsReporter.shared, a1, 33, 0);
  return &j__swift_endAccess;
}

id sub_10000E1B0()
{
  void *v0;
  void *v1;
  char *v2;
  id v3;
  void *v4;
  id v5;
  NSString v6;
  id v7;
  id result;
  objc_super v9;

  v1 = (void *)objc_opt_self(AMSBag);
  v2 = v0;
  v3 = objc_msgSend(v1, "vs_defaultBag");
  if (v3)
  {
    v4 = v3;
    v5 = objc_allocWithZone((Class)AMSMetrics);
    v6 = String._bridgeToObjectiveC()();
    v7 = objc_msgSend(v5, "initWithContainerID:bag:", v6, v4);

    *(_QWORD *)&v2[OBJC_IVAR____TtC19videosubscriptionsd20VSAMSMetricsReporter_metrics] = v7;
    v9.receiver = v2;
    v9.super_class = (Class)type metadata accessor for VSAMSMetricsReporter();
    return objc_msgSendSuper2(&v9, "init");
  }
  else
  {
    result = (id)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x6920676142534D41, 0xED00006C696E2073, "videosubscriptionsd/VSAMSMetricsReporter.swift", 46, 2, 25, 0);
    __break(1u);
  }
  return result;
}

uint64_t type metadata accessor for VSAMSMetricsReporter()
{
  return objc_opt_self(_TtC19videosubscriptionsd20VSAMSMetricsReporter);
}

Swift::Void __swiftcall VSAMSMetricsReporter.flush()()
{
  uint64_t v0;

  objc_release(objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                                     + OBJC_IVAR____TtC19videosubscriptionsd20VSAMSMetricsReporter_metrics), "flush")));
}

id VSAMSMetricsReporter.enqueue(_:)(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC19videosubscriptionsd20VSAMSMetricsReporter_metrics), "enqueueEvent:", a1);
}

Swift::Void __swiftcall VSAMSMetricsReporter.enqueueEvents(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;
  void *v2;
  Class isa;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC19videosubscriptionsd20VSAMSMetricsReporter_metrics);
  sub_10000E43C();
  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v2, "enqueueEvents:", isa);

}

unint64_t sub_10000E43C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10001ECD8;
  if (!qword_10001ECD8)
  {
    v1 = objc_opt_self(AMSMetricsEvent);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10001ECD8);
  }
  return result;
}

id VSAMSMetricsReporter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VSAMSMetricsReporter();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t static VSAMSMetricsCenterBridge.recordAccountUpdate(_:source:updateType:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  type metadata accessor for VSAMSMetricsCenter(0);
  v8 = (void *)static VSAMSMetricsCenter.shared.getter();
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = v10;
  dispatch thunk of VSAMSMetricsCenter.recordAccountUpdate(_:source:updateType:completion:)(a1, a2, a3, v9, v10, 0, 0);

  return swift_bridgeObjectRelease(v11);
}

id VSAMSMetricsCenterBridge.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VSAMSMetricsCenterBridge();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for VSAMSMetricsCenterBridge()
{
  return objc_opt_self(_TtC19videosubscriptionsd24VSAMSMetricsCenterBridge);
}

id VSAMSMetricsCenterBridge.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VSAMSMetricsCenterBridge();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000E788(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_10000E798()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000E7BC()
{
  uint64_t v0;
  uint64_t v1;
  Class isa;

  v1 = *(_QWORD *)(v0 + 16);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  (*(void (**)(uint64_t, Class))(v1 + 16))(v1, isa);

}

void sub_10000E818()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000513C();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Denying XPC invocation from client missing %@ entitlement.", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000E888(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", a2));
  sub_100005130();
  sub_100005148((void *)&_mh_execute_header, a3, v5, "Punchout event occurred from an app without a version: %@", v6);

}

void sub_10000E914()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Denying XPC invocation from client missing %@ entitlement.", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000E974()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100005130();
  sub_100005148((void *)&_mh_execute_header, v0, v1, "Punchout event occurred from an app without a version: %@", v2);
  sub_100005128();
}

void sub_10000E9D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000513C();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Denying XPC invocation from client missing %@ entitlement.", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000EA48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error publishing event: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000EAA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error performing initial load: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000EB08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error loading persistent stores: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000EB68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error saving context after migration insertion: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000EBC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_10000D604((void *)&_mh_execute_header, v0, v1, "Error saving after user account migration insertion: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000EC28()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D61C();
  sub_10000D640((void *)&_mh_execute_header, v0, v1, "Attempted to fetch migration data from nil delegate.", v2, v3, v4, v5, v6);
  sub_10000D614();
}

void sub_10000EC54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D61C();
  sub_10000D640((void *)&_mh_execute_header, v0, v1, "Timed out waiting for migration block invocation.", v2, v3, v4, v5, v6);
  sub_10000D614();
}

void sub_10000EC80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_10000D604((void *)&_mh_execute_header, v0, v1, "The entitlement to update the user account was not valid for bundleID: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000ECE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_10000D604((void *)&_mh_execute_header, v0, v1, "Attempt to write user account with no device identifier: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000ED40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D61C();
  sub_10000D5F4((void *)&_mh_execute_header, v0, v1, "Not currently signed in to a provider matching the one indicated by the user account, denying.", v2, v3, v4, v5, v6);
  sub_10000D614();
}

void sub_10000ED6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error fetching accounts for user account validation: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000EDCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error deleting user account: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000EE2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D61C();
  sub_10000D5F4((void *)&_mh_execute_header, v0, v1, "Client not entitled for force refresh accounts.", v2, v3, v4, v5, v6);
  sub_10000D614();
}

void sub_10000EE58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D61C();
  sub_10000D5F4((void *)&_mh_execute_header, v0, v1, "Client not entitled for force refresh user account.", v2, v3, v4, v5, v6);
  sub_10000D614();
}

void sub_10000EE84()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error inserting user account: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000EEE4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error fetching maximum update frequency from bag: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000EF44(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  sub_10000D628((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to delete signed out non-connected user account: %@ - error: %@", (uint8_t *)&v4);
  sub_100005128();
}

void sub_10000EFC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error Updating UserAccount with NO deviceID: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000F020()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_10000D604((void *)&_mh_execute_header, v0, v1, "Error saving after user account insertion: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000F080()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error saving context after insertion: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000F0E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error fetching existing persistent user account: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000F140()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D61C();
  sub_10000D5F4((void *)&_mh_execute_header, v0, v1, "Did not find any persistent user accounts to delete.", v2, v3, v4, v5, v6);
  sub_10000D614();
}

void sub_10000F16C(void *a1, NSObject *a2)
{
  uint8_t v3[24];

  objc_msgSend(a1, "count");
  sub_100005130();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Found %ld existing persistent user accounts that match the user account to delete.", v3, 0xCu);
  sub_10000D634();
}

void sub_10000F1E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error fetching persistent user account to delete: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000F248()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error saving context after deletion: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000F2A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error fetching persistent user accounts: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000F308(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "sourceType");
  sub_100005130();
  sub_10000D5E8((void *)&_mh_execute_header, a2, v3, "Invalid Update Query - Preventing Access For Non-Web SourceType: %ld", v4);
  sub_10000D634();
}

void sub_10000F37C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D61C();
  sub_10000D5F4((void *)&_mh_execute_header, v0, v1, "Invalid Update Query - Preventing Access For Non-Internally-Entitled Client", v2, v3, v4, v5, v6);
  sub_10000D614();
}

void sub_10000F3A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D61C();
  sub_10000D5F4((void *)&_mh_execute_header, v0, v1, "Invalid Update Query - No Bundle Identifier Found", v2, v3, v4, v5, v6);
  sub_10000D614();
}

void sub_10000F3D4(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  uint8_t v7[12];
  __int16 v8;
  uint64_t v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sourceIdentifier"));
  sub_100005130();
  v8 = 2112;
  v9 = a2;
  sub_10000D628((void *)&_mh_execute_header, a3, v6, "Invalid Update Query - Incorrect Source Identifier: %@ Does Not Match %@", v7);

  sub_10000D650();
}

void sub_10000F468(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(a1, "sourceType");
  sub_100005130();
  sub_10000D5E8((void *)&_mh_execute_header, a2, v3, "Invalid Update Query - Non-App Source Type: %ld", v4);
  sub_10000D634();
}

void sub_10000F4DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000D61C();
  sub_10000D5F4((void *)&_mh_execute_header, v0, v1, "Invalid Update Query - Minimum Entitlement Not Found", v2, v3, v4, v5, v6);
  sub_10000D614();
}

void sub_10000F508()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Updated user account denied insert for request: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000F568(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "updateError"));
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  sub_10000D628((void *)&_mh_execute_header, a2, v5, "Error updating request %@: %@", (uint8_t *)&v6);

  sub_10000D650();
}

void sub_10000F600()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005130();
  sub_100005118((void *)&_mh_execute_header, v0, v1, "Error inserting account updated via update JS: %@", v2, v3, v4, v5, v6);
  sub_100005128();
}

void sub_10000F660()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Received distnoted matching event.", v0, 2u);
}

void sub_10000F6A4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error fetching subscriptions for migration: %@", (uint8_t *)&v2, 0xCu);
}

id objc_msgSend__deduplicatePersistentUserAccounts_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deduplicatePersistentUserAccounts:context:completion:");
}

id objc_msgSend__deletePersistentUserAccount_withContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deletePersistentUserAccount:withContext:completion:");
}

id objc_msgSend__deleteUserAccount_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deleteUserAccount:context:completion:");
}

id objc_msgSend__forceRefreshAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_forceRefreshAccount:");
}

id objc_msgSend__insertUserAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_insertUserAccount:completion:");
}

id objc_msgSend__isValidForDeleteQueryForCurrentTask(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isValidForDeleteQueryForCurrentTask");
}

id objc_msgSend__isValidForUpdateQueryForCurrentTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isValidForUpdateQueryForCurrentTask:");
}

id objc_msgSend__loadStoresAndMigrateIfRequiredWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadStoresAndMigrateIfRequiredWithCompletion:");
}

id objc_msgSend__persistentAccountsForUserAccount_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_persistentAccountsForUserAccount:context:completion:");
}

id objc_msgSend__populatePersistentUserAccount_withUserAccount_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_populatePersistentUserAccount:withUserAccount:context:");
}

id objc_msgSend__predicateForFetchingAllResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForFetchingAllResults");
}

id objc_msgSend__predicateForFetchingZeroResults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForFetchingZeroResults");
}

id objc_msgSend__predicateForIsSignedOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForIsSignedOut:");
}

id objc_msgSend__predicateForQueryRequestWithOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForQueryRequestWithOptions:");
}

id objc_msgSend__predicateForUserAccountFromCurrentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForUserAccountFromCurrentDevice");
}

id objc_msgSend__predicateForUserAccountFromDeviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForUserAccountFromDeviceID:");
}

id objc_msgSend__predicateForUserAccountFromSourceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForUserAccountFromSourceID:");
}

id objc_msgSend__predicateForUserAccountWithDeviceIdentifier_sourceIdentifier_sourceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForUserAccountWithDeviceIdentifier:sourceIdentifier:sourceType:");
}

id objc_msgSend__predicateForUserAccountWithNonnullBillingCycleEndDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForUserAccountWithNonnullBillingCycleEndDate");
}

id objc_msgSend__predicateForUserAccountWithNonnullUpdateURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForUserAccountWithNonnullUpdateURL");
}

id objc_msgSend__predicateForUserAccountWithSourceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_predicateForUserAccountWithSourceType:");
}

id objc_msgSend__queryPersistentUserAccountsWithPredicate_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queryPersistentUserAccountsWithPredicate:context:completion:");
}

id objc_msgSend__queryPersistentUserAccountsWithPredicate_sorts_fetchLimit_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queryPersistentUserAccountsWithPredicate:sorts:fetchLimit:context:completion:");
}

id objc_msgSend__queryUserAccountsWithPredicate_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queryUserAccountsWithPredicate:context:completion:");
}

id objc_msgSend__queryUserAccountsWithPredicate_sorts_fetchLimit_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_queryUserAccountsWithPredicate:sorts:fetchLimit:context:completion:");
}

id objc_msgSend__removeNonConnectedSignedOutUserAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeNonConnectedSignedOutUserAccounts");
}

id objc_msgSend__securityTaskForCurrentConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_securityTaskForCurrentConnection");
}

id objc_msgSend__setUpdateRequestManagerWithRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setUpdateRequestManagerWithRequests:");
}

id objc_msgSend__setupObservers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupObservers");
}

id objc_msgSend__sortForUserAccountBillingCycleEndDateASC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortForUserAccountBillingCycleEndDateASC:");
}

id objc_msgSend__sortForUserAccountModifiedTimeASC_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortForUserAccountModifiedTimeASC:");
}

id objc_msgSend__subscriptionsForMigrationWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_subscriptionsForMigrationWithCompletion:");
}

id objc_msgSend__update(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_update");
}

id objc_msgSend__updateRequestForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateRequestForAccount:");
}

id objc_msgSend__userAccountForPersistentUserAccount_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_userAccountForPersistentUserAccount:context:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_accountIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountIdentifier");
}

id objc_msgSend_accountProviderIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountProviderIdentifier");
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountType");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addErrorBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addErrorBlock:");
}

id objc_msgSend_addFinishBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFinishBlock:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_addSuccessBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSuccessBlock:");
}

id objc_msgSend_amsEventCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "amsEventCache");
}

id objc_msgSend_analyticsAllowed(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyticsAllowed");
}

id objc_msgSend_andPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "andPredicateWithSubpredicates:");
}

id objc_msgSend_appleSubscription(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appleSubscription");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "auditToken");
}

id objc_msgSend_authenticationData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationData");
}

id objc_msgSend_authenticationToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticationToken");
}

id objc_msgSend_base(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "base");
}

id objc_msgSend_billingCycleEndDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "billingCycleEndDate");
}

id objc_msgSend_billingIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "billingIdentifier");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleVersion(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleVersion");
}

id objc_msgSend_click(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "click");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "code");
}

id objc_msgSend_conditionallyUnwrapObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conditionallyUnwrapObject:");
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "container");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
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

id objc_msgSend_createSaveContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createSaveContext");
}

id objc_msgSend_created(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "created");
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentConnection");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_currentUpdateSessionIsForced(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentUpdateSessionIsForced");
}

id objc_msgSend_dateByAddingTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateByAddingTimeInterval:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultChannelManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultChannelManager");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteObject:");
}

id objc_msgSend_developer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "developer");
}

id objc_msgSend_deviceCategoryFromDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceCategoryFromDeviceType:");
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceIdentifier");
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceName");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceType");
}

id objc_msgSend_didBuddyComplete(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didBuddyComplete");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "distantPast");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "domain");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_enqueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enqueue:");
}

id objc_msgSend_enter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enter");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_eventCache(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventCache");
}

id objc_msgSend_eventHandlers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventHandlers");
}

id objc_msgSend_eventQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventQueue");
}

id objc_msgSend_eventRecorder(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "eventRecorder");
}

id objc_msgSend_executeFetchRequest_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "executeFetchRequest:error:");
}

id objc_msgSend_exit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "exit");
}

id objc_msgSend_expirationDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "expirationDate");
}

id objc_msgSend_fetchAccountsWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAccountsWithCompletionHandler:");
}

id objc_msgSend_fetchActiveSubscriptionsWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchActiveSubscriptionsWithOptions:completionHandler:");
}

id objc_msgSend_fetchRequest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchRequest");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flexible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flexible");
}

id objc_msgSend_flexibleBaseFields(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flexibleBaseFields");
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flush");
}

id objc_msgSend_flushMetrics(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flushMetrics");
}

id objc_msgSend_flushUnreportedEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "flushUnreportedEvents");
}

id objc_msgSend_forceUnwrapObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "forceUnwrapObject");
}

id objc_msgSend_hasChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasChanges");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identifier");
}

id objc_msgSend_identityProviderID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "identityProviderID");
}

id objc_msgSend_initInMemory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initInMemory:");
}

id objc_msgSend_initWithAMSBag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAMSBag:");
}

id objc_msgSend_initWithAccountType_updateURL_sourceType_sourceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountType:updateURL:sourceType:sourceIdentifier:");
}

id objc_msgSend_initWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithNotificationName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNotificationName:");
}

id objc_msgSend_initWithTopic_delegatePackage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTopic:delegatePackage:");
}

id objc_msgSend_initWithUserAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserAccount:");
}

id objc_msgSend_initWithUserAccountUpdateRequests_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUserAccountUpdateRequests:");
}

id objc_msgSend_initWithVoucherLockbox_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithVoucherLockbox:");
}

id objc_msgSend_insertUserAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertUserAccount:completion:");
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

id objc_msgSend_isAccessGrantedForAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAccessGrantedForAuditToken:");
}

id objc_msgSend_isAppStoreVendableForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAppStoreVendableForBundleIdentifier:");
}

id objc_msgSend_isDeletableForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeletableForBundleIdentifier:");
}

id objc_msgSend_isDeveloperCreated(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDeveloperCreated");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFromCurrentDevice(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFromCurrentDevice");
}

id objc_msgSend_isSignedOut(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSignedOut");
}

id objc_msgSend_keychainItemHash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "keychainItemHash");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastUpdateTime(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastUpdateTime");
}

id objc_msgSend_leave(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "leave");
}

id objc_msgSend_legacyItemHash(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "legacyItemHash");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_loadAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadAndReturnError:");
}

id objc_msgSend_loadPersistentStoresWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadPersistentStoresWithCompletionHandler:");
}

id objc_msgSend_loadingStoresLock(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadingStoresLock");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainMetricsKit(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainMetricsKit");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_metricsDataWithEventType_eventData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsDataWithEventType:eventData:");
}

id objc_msgSend_metricsDataWithPageId_pageType_pageContext_eventData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsDataWithPageId:pageType:pageContext:eventData:");
}

id objc_msgSend_modified(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modified");
}

id objc_msgSend_modifierIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modifierIdentifier");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_newBackgroundContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newBackgroundContext");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "now");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_optedIn(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "optedIn");
}

id objc_msgSend_orPredicateWithSubpredicates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orPredicateWithSubpredicates:");
}

id objc_msgSend_performBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlock:");
}

id objc_msgSend_performBlockAndWait_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performBlockAndWait:");
}

id objc_msgSend_performedSubcriptionToUserAccountMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performedSubcriptionToUserAccountMigration");
}

id objc_msgSend_postNotification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotification");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_predicate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicate");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferences(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferences");
}

id objc_msgSend_prepareUserAccountsToVend_withSecurityTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareUserAccountsToVend:withSecurityTask:");
}

id objc_msgSend_privacyFacade(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privacyFacade");
}

id objc_msgSend_privateQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "privateQueue");
}

id objc_msgSend_providerID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "providerID");
}

id objc_msgSend_publishMetricsKitEventWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publishMetricsKitEventWithData:");
}

id objc_msgSend_queryUserAccountsWithOptions_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryUserAccountsWithOptions:completion:");
}

id objc_msgSend_queryUserAccountsWithPredicate_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryUserAccountsWithPredicate:completion:");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_recordAccountUpdateWithAccount_source_updateType_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordAccountUpdateWithAccount:source:updateType:completion:");
}

id objc_msgSend_recordEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordEvent");
}

id objc_msgSend_registerObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerObserver:");
}

id objc_msgSend_remoteNotifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteNotifier");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_requiresSystemTrust(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requiresSystemTrust");
}

id objc_msgSend_resetTimer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetTimer");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resume");
}

id objc_msgSend_reverseTransformedValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reverseTransformedValue:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "run");
}

id objc_msgSend_save_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "save:");
}

id objc_msgSend_saveContext_withError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveContext:withError:");
}

id objc_msgSend_securityTaskForCurrentConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "securityTaskForCurrentConnection");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_setAccountIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountIdentifier:");
}

id objc_msgSend_setAccountProviderIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountProviderIdentifier:");
}

id objc_msgSend_setAccountType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountType:");
}

id objc_msgSend_setAmsEventCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAmsEventCache:");
}

id objc_msgSend_setAppleSubscription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppleSubscription:");
}

id objc_msgSend_setAuthenticationData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationData:");
}

id objc_msgSend_setAutomaticallyMergesChangesFromParent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticallyMergesChangesFromParent:");
}

id objc_msgSend_setBillingCycleEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBillingCycleEndDate:");
}

id objc_msgSend_setBillingIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBillingIdentifier:");
}

id objc_msgSend_setCreated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCreated:");
}

id objc_msgSend_setCurrentUpdateSessionIsForced_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentUpdateSessionIsForced:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDeveloper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeveloper:");
}

id objc_msgSend_setDeviceCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceCategory:");
}

id objc_msgSend_setDeviceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceIdentifier:");
}

id objc_msgSend_setDeviceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceName:");
}

id objc_msgSend_setDeviceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceType:");
}

id objc_msgSend_setEntitlementNames_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEntitlementNames:");
}

id objc_msgSend_setEventCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEventCache:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFetchLimit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFetchLimit:");
}

id objc_msgSend_setFromCurrentDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFromCurrentDevice:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIncludesPendingChanges_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIncludesPendingChanges:");
}

id objc_msgSend_setIsDeveloperCreated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsDeveloperCreated:");
}

id objc_msgSend_setKeychainItemHash_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeychainItemHash:");
}

id objc_msgSend_setLastUpdateTime_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastUpdateTime:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setMergePolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMergePolicy:");
}

id objc_msgSend_setModified_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModified:");
}

id objc_msgSend_setModifierIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifierIdentifier:");
}

id objc_msgSend_setModifierType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifierType:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOptedIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOptedIn:");
}

id objc_msgSend_setPerformedSubcriptionToUserAccountMigration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPerformedSubcriptionToUserAccountMigration");
}

id objc_msgSend_setPredicate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPredicate:");
}

id objc_msgSend_setProviderID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProviderID:");
}

id objc_msgSend_setRequiresSystemTrust_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiresSystemTrust:");
}

id objc_msgSend_setSignedOut_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignedOut:");
}

id objc_msgSend_setSortDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSortDescriptors:");
}

id objc_msgSend_setSourceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceIdentifier:");
}

id objc_msgSend_setSourceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceType:");
}

id objc_msgSend_setStoresLoaded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStoresLoaded:");
}

id objc_msgSend_setSubscriptionBillingCycleEndDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSubscriptionBillingCycleEndDate:");
}

id objc_msgSend_setTierIdentifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTierIdentifiers:");
}

id objc_msgSend_setTimer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimer:");
}

id objc_msgSend_setUpdateManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateManager:");
}

id objc_msgSend_setUpdateURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdateURL:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedAccountStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedAccountStore");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedMetricsCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedMetricsCenter");
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedSettings");
}

id objc_msgSend_shouldAllowAccessForBooleanEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAllowAccessForBooleanEntitlement:");
}

id objc_msgSend_shouldAllowUserAccountUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldAllowUserAccountUpdate:");
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signal");
}

id objc_msgSend_signedOut(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signedOut");
}

id objc_msgSend_signingIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signingIdentifier");
}

id objc_msgSend_sortedArrayUsingDescriptors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingDescriptors:");
}

id objc_msgSend_sourceIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceIdentifier");
}

id objc_msgSend_sourceType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceType");
}

id objc_msgSend_storesLoaded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "storesLoaded");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subscriptionBillingCycleEndDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "subscriptionBillingCycleEndDate");
}

id objc_msgSend_system(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "system");
}

id objc_msgSend_tierIdentifiers(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tierIdentifiers");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timer");
}

id objc_msgSend_transformedValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformedValue:");
}

id objc_msgSend_underlyingQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "underlyingQueue");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unwrapObject_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unwrapObject:error:");
}

id objc_msgSend_updateError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateError");
}

id objc_msgSend_updateURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateURL");
}

id objc_msgSend_updateUserAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUserAccount:completion:");
}

id objc_msgSend_updateUserAccounts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateUserAccounts");
}

id objc_msgSend_updatedUserAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedUserAccount");
}

id objc_msgSend_userAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userAccount");
}

id objc_msgSend_userAccountRegistry_didFinishUpdatingUserAccountsWithManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userAccountRegistry:didFinishUpdatingUserAccountsWithManager:");
}

id objc_msgSend_userAccountRegistry_willPerformMigrationIfRequiredWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userAccountRegistry:willPerformMigrationIfRequiredWithBlock:");
}

id objc_msgSend_valueTransformerForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueTransformerForName:");
}

id objc_msgSend_valueWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithError:");
}

id objc_msgSend_vppaConsentedBundleIDsWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vppaConsentedBundleIDsWithCompletion:");
}

id objc_msgSend_vs_dateIncrementedByMinutes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vs_dateIncrementedByMinutes:");
}

id objc_msgSend_vs_defaultBag(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vs_defaultBag");
}

id objc_msgSend_vs_isAfter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vs_isAfter:");
}

id objc_msgSend_vs_setObjectUnlessNil_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "vs_setObjectUnlessNil:forKey:");
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wait");
}

id objc_msgSend_waitWithMilliseconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "waitWithMilliseconds:");
}
