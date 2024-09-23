void sub_100003418(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000034A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003904(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setupShieldLifecycleMonitorForCurrentSession");
    WeakRetained = v2;
  }

}

void sub_100003CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003CF8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id WeakRetained;
  id v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  v5 = a2;
  v6 = a3;
  v8 = CMContinuityCaptureLog(0, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v15 = 138543874;
    v16 = WeakRetained;
    v17 = 2114;
    v18 = v5;
    v19 = 2114;
    v20 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Session Interrupted (%{public}@ %{public}@)", (uint8_t *)&v15, 0x20u);

  }
  v11 = objc_loadWeakRetained((id *)(a1 + 32));
  v12 = v11;
  if (v11)
  {
    v13 = v11;
    objc_sync_enter(v13);
    v14 = v13[8];
    if (v14)
      (*(void (**)(void))(v14 + 16))();
    objc_sync_exit(v13);

  }
}

void sub_100003E28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100003E44(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setupShieldLifecycleMonitorForCurrentSession");
    WeakRetained = v2;
  }

}

void sub_1000040CC(id a1)
{
  CCDShieldUILifeCycleManager *v1;
  void *v2;

  v1 = objc_alloc_init(CCDShieldUILifeCycleManager);
  v2 = (void *)qword_10001D850;
  qword_10001D850 = (uint64_t)v1;

}

void sub_1000044A4(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeSession"));

    WeakRetained = v3;
    if (v2)
    {
      if (!v3[1])
      {
        objc_msgSend(v3, "_acquireLockScreenAssertion");
        WeakRetained = v3;
      }
      if (!WeakRetained[2])
      {
        objc_msgSend(v3, "_acquireAppSwitcherAssertion");
        WeakRetained = v3;
      }
      if (!WeakRetained[3])
      {
        objc_msgSend(v3, "_acquireAlwaysOnDisplayAssertion");
        WeakRetained = v3;
      }
      *((_BYTE *)WeakRetained + 72) = 1;
    }
  }

}

uint64_t sub_10000470C(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_releaseLockScreenAssertion");
  objc_msgSend(*(id *)(a1 + 32), "_releaseAppSwitcherAssertion");
  objc_msgSend(*(id *)(a1 + 32), "_releaseAlwaysOnDisplayAssertion");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id sub_100004A6C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchShieldForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:statusHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(unsigned __int8 *)(a1 + 73), *(_QWORD *)(a1 + 56));
}

void sub_100004DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004E28(id a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));
  AVCapturePrewarm();

}

void sub_100004E74(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  BOOL v12;
  int v13;
  id v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  void *v18;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = CMContinuityCaptureLog(0, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_loadWeakRetained(v1);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeSession"));
      v13 = 138543874;
      v14 = v6;
      v15 = 2080;
      v16 = "-[CCDShieldUILifeCycleManager _launchShieldForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:stat"
            "usHandler:]_block_invoke";
      v17 = 2112;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s session interrupted active session %@", (uint8_t *)&v13, 0x20u);

    }
    v8 = WeakRetained;
    objc_sync_enter(v8);
    if (objc_msgSend(*((id *)v8 + 5), "willTerminate"))
    {
      v9 = *((_QWORD *)v8 + 8);
      if (v9)
      {
        dispatch_semaphore_signal(v9);
        v10 = (void *)*((_QWORD *)v8 + 8);
        *((_QWORD *)v8 + 8) = 0;

      }
      objc_sync_exit(v8);

    }
    else
    {
      objc_sync_exit(v8);

      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeSession"));
      v12 = v11 == 0;

      if (!v12)
        objc_msgSend(v8, "notifyShieldStatus:", -2001);
    }
  }

}

void sub_100004FFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1000052B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000052F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  id WeakRetained;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint8_t v17[16];

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v7 = CMContinuityCaptureLog(0, v5);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v4)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_1000100FC((uint64_t)v4, v9, v10, v11, v12, v13, v14, v15);

      objc_msgSend(WeakRetained, "notifyShieldStatus:", -2002);
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Successfully launched ContinuityCaptureShieldUI", v17, 2u);
      }

      objc_msgSend(WeakRetained, "notifyShieldStatus:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "activeSession"));
      objc_msgSend(v16, "setupShieldLifecycleMonitorForCurrentSession");

    }
  }

}

id sub_1000054D8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchShieldUIProcess");
}

void sub_100005810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  objc_destroyWeak(location);
  _Block_object_dispose(&a28, 8);
  objc_destroyWeak((id *)(v28 - 168));
  _Unwind_Resume(a1);
}

void sub_100005860(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  id v13;
  __int128 v14;
  _QWORD block[4];
  __int128 v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v9 = CMContinuityCaptureLog(0, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_loadWeakRetained((id *)(a1 + 56));
      *(_DWORD *)buf = 138544130;
      v18 = v11;
      v19 = 2080;
      v20 = "-[CCDShieldUILifeCycleManager _forceTerminateShieldIfApplicable:completionTimeoutInSec:]_block_invoke";
      v21 = 2114;
      v22 = v5;
      v23 = 2114;
      v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %s Session Interrupted (%{public}@ %{public}@)", buf, 0x2Au);

    }
    v12 = *(NSObject **)(a1 + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000059DC;
    block[3] = &unk_1000187C0;
    v14 = *(_OWORD *)(a1 + 40);
    v13 = (id)v14;
    v16 = v14;
    dispatch_async(v12, block);

  }
}

uint64_t sub_1000059DC(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
  if (!*(_BYTE *)(v1 + 24))
  {
    *(_BYTE *)(v1 + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  }
  return result;
}

uint64_t sub_100005A04(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v2 = result;
    v3 = CMContinuityCaptureLog(0, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      WeakRetained = objc_loadWeakRetained((id *)(v2 + 48));
      v6 = 138543362;
      v7 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ *** Should never happen, we even failed to exit due to force termination ***", (uint8_t *)&v6, 0xCu);

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) = 1;
    return (*(uint64_t (**)(void))(*(_QWORD *)(v2 + 32) + 16))();
  }
  return result;
}

void sub_100005BE8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  dispatch_semaphore_t v4;
  void *v5;
  NSObject *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  NSObject *v12;

  objc_msgSend(*(id *)(a1 + 32), "_releaseLockScreenAssertion");
  objc_msgSend(*(id *)(a1 + 32), "_releaseAppSwitcherAssertion");
  objc_msgSend(*(id *)(a1 + 32), "_releaseAlwaysOnDisplayAssertion");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    objc_msgSend(v3, "invalidate");
    v2 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v2 + 72) = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = *(void **)(a1 + 32);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005D04;
  v11[3] = &unk_100018798;
  v6 = v4;
  v12 = v6;
  objc_msgSend(v5, "_forceTerminateShieldIfApplicable:completionTimeoutInSec:", v11, 2);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  v7 = *(_QWORD **)(a1 + 32);
  if (v7[5])
  {
    objc_msgSend(v7, "willChangeValueForKey:", CFSTR("activeSession"));
    v8 = *(id *)(a1 + 32);
    objc_sync_enter(v8);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

    objc_sync_exit(v8);
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("activeSession"));
  }

}

intptr_t sub_100005D04(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100005E08(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  dispatch_time_t v4;
  void *v5;
  dispatch_semaphore_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  dispatch_semaphore_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  dispatch_semaphore_t v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  const char *v28;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "activeSession"));

  if (v2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setWillTerminate:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_releaseLockScreenAssertion");
    objc_msgSend(*(id *)(a1 + 32), "_releaseAppSwitcherAssertion");
    objc_msgSend(*(id *)(a1 + 32), "_releaseAlwaysOnDisplayAssertion");
    v4 = dispatch_time(0, 2000000000);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCServerCCD sharedInstance](CMContinuityCaptureXPCServerCCD, "sharedInstance"));
    objc_msgSend(v5, "tearDownShieldUI");

    v6 = dispatch_semaphore_create(0);
    v7 = *(id *)(a1 + 32);
    objc_sync_enter(v7);
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v6);
    objc_sync_exit(v7);

    if (dispatch_semaphore_wait(v6, v4))
    {
      v9 = CMContinuityCaptureLog(0, v8);
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v26 = v11;
        v27 = 2080;
        v28 = "-[CCDShieldUILifeCycleManager tearDownShield]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@ %s termination didn't complete within 5 sec", buf, 0x16u);
      }

      v12 = dispatch_semaphore_create(0);
      v13 = *(void **)(a1 + 32);
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100006130;
      v23[3] = &unk_100018798;
      v6 = v12;
      v24 = v6;
      objc_msgSend(v13, "_forceTerminateShieldIfApplicable:completionTimeoutInSec:", v23, 2);
      dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);

    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "invalidate");
    objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("activeSession"));
    v14 = *(id *)(a1 + 32);
    objc_sync_enter(v14);
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = 0;

    objc_sync_exit(v14);
    objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("activeSession"));
    v18 = CMContinuityCaptureLog(0, v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v26 = v20;
      v27 = 2080;
      v28 = "-[CCDShieldUILifeCycleManager tearDownShield]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ %s completed", buf, 0x16u);
    }

  }
  else
  {
    v21 = CMContinuityCaptureLog(0, v3);
    v6 = (dispatch_semaphore_t)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v26 = v22;
      v27 = 2080;
      v28 = "-[CCDShieldUILifeCycleManager tearDownShield]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ %s no active session", buf, 0x16u);
    }
  }

}

intptr_t sub_100006130(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100006260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000627C(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject **WeakRetained;
  NSObject **v14;
  NSObject *v15;
  _QWORD block[5];

  v3 = a2;
  v5 = CMContinuityCaptureLog(0, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000101A0((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v14 = WeakRetained;
  if (WeakRetained)
  {
    v15 = WeakRetained[6];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006334;
    block[3] = &unk_100018798;
    block[4] = v14;
    dispatch_async(v15, block);
  }

}

void sub_100006334(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "invalidate");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

}

void sub_100006564(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 64));
  _Unwind_Resume(a1);
}

void sub_100006588(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v5;
  id v6;

  v6 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 2, a2);

}

void sub_1000065DC(uint64_t a1, void *a2)
{
  id v3;
  NSObject **WeakRetained;
  NSObject **v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v3 = a2;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained[6];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100006678;
    v7[3] = &unk_100018888;
    v7[4] = WeakRetained;
    v8 = v3;
    dispatch_async(v6, v7);

  }
}

void sub_100006678(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }
}

void sub_100006950(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100006B44(uint64_t a1)
{
  id WeakRetained;
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(v3, "addObserver:forKeyPath:options:context:", WeakRetained, CMContinuityCaptureCallStateKVOKey, 3, 0);

}

void sub_100006EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100006ECC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeSession"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pauseStateSolver"));
    objc_msgSend(v4, "resumeForEvent:", *(_QWORD *)(a1 + 40));

    objc_msgSend(WeakRetained, "_resolveUserPauseState");
  }

}

void sub_100006FF8(uint64_t a1)
{
  id *WeakRetained;
  int BoolAnswer;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  const __CFString *v8;
  int v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  int v30;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BoolAnswer = AVGestaltGetBoolAnswer(AVGQBPMGIAYPLJA32XFRAAWDO5G4G4);
    v4 = objc_msgSend(WeakRetained[11], "lockScreenInLayout");
    v6 = v4;
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      if (v7 == 2)
      {
        v9 = BoolAnswer | v4 ^ 1;
        v8 = CFSTR("CMContinuityCapturePauseEventShieldObscuredOnLockScreen");
      }
      else if (v7 == 1)
      {
        if (((BoolAnswer | v4) & 1) != 0)
        {
          v8 = CFSTR("CMContinuityCapturePauseEventShieldBackgrounded");
          v9 = 1;
        }
        else
        {
          v9 = SBSGetScreenLockStatus(0) != 0;
          v8 = CFSTR("CMContinuityCapturePauseEventShieldBackgrounded");
        }
      }
      else
      {
        v9 = 0;
        v8 = CFSTR("Unknown");
      }
    }
    else
    {
      v9 = 0;
      v8 = CFSTR("CMContinuityCapturePauseEventUserPressedPause");
    }
    v10 = CMContinuityCaptureLog(0, v5);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 48);
      v17 = 138544898;
      v18 = v12;
      v19 = 2080;
      v20 = "-[CMContinuityCaptureDServer pauseSessionForEvent:]_block_invoke";
      v21 = 1024;
      v22 = v13;
      v23 = 2112;
      v24 = v8;
      v25 = 1024;
      v26 = v9;
      v27 = 1024;
      v28 = v6;
      v29 = 1024;
      v30 = BoolAnswer;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %s event:%d, eventName:%@, ignoreEvent:%d, lockScreenInLayout:%d,  localDeviceSupportsContinuityCaptureMultitasking:%d", (uint8_t *)&v17, 0x38u);
    }

    if ((v9 & 1) == 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "activeSession"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "pauseStateSolver"));
      objc_msgSend(v16, "pauseForEvent:", *(_QWORD *)(a1 + 48));

      objc_msgSend(WeakRetained, "_resolveUserPauseState");
    }
  }

}

void sub_1000073D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000073F4(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _UNKNOWN **v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  id v44;

  v2 = (id *)(a1 + 56);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    if (v4)
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "sessionID"));
    else
      v5 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[1], "compositeDevice"));

    if (v6)
      +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:](CMContinuityCaptureRemoteCompositeDevice, "setWombatMode:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "deviceIdentifier"));
    objc_msgSend(*(id *)(a1 + 40), "_exitSessionIfApplicableForDeviceIdentifier:exitReason:", v7, *(_QWORD *)(a1 + 48));
    v8 = WeakRetained[1];
    if (v8)
      v9 = objc_msgSend(v8, "currentSessionID");
    else
      v9 = 0;
    objc_msgSend(WeakRetained, "_teardownShieldUI");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[1], "compositeDevice"));
    if (v10)
    {
      v12 = *(unsigned __int8 *)(a1 + 64);

      if (v12)
      {
        v13 = CMContinuityCaptureLog(0, v11);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15 = objc_loadWeakRetained(v2);
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[1], "compositeDevice"));
          *(_DWORD *)buf = 138543874;
          v38 = v15;
          v39 = 2080;
          v40 = "-[CMContinuityCaptureDServer disconnectSession:reason:]_block_invoke";
          v41 = 2112;
          v42 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ %s disconnect during active session for %@", buf, 0x20u);

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[1], "compositeDevice"));
        objc_msgSend(v17, "postEvent:entity:data:", kCMContinuityCaptureEventUserDisconnect, 0, 0);

      }
    }
    if (v7 && *(_BYTE *)(a1 + 64))
    {
      v18 = CMContinuityCaptureLog(0, v11);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_loadWeakRetained(v2);
        *(_DWORD *)buf = 138544130;
        v38 = v20;
        v39 = 2080;
        v40 = "-[CMContinuityCaptureDServer disconnectSession:reason:]_block_invoke";
        v41 = 2112;
        v42 = v7;
        v43 = 2048;
        v44 = v9;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ %s disconnect during headless state for %@ currentSessionID %llx", buf, 0x2Au);

      }
      v30 = ContinuityCaptureRapportClientMessageTypeKey;
      v31 = ContinuityCaptureRapportClientEventNameKey;
      v34 = &off_100018FB8;
      v35 = kCMContinuityCaptureEventUserDisconnect;
      v22 = *(void **)(a1 + 40);
      v21 = *(const __CFString **)(a1 + 48);
      v32 = ContinuityCaptureRapportClientUserDisconnectReasonKey;
      v33 = ContinuityCaptureRapportClientShieldSessionIDKey;
      v23 = CFSTR("Unknown");
      if (v21)
        v24 = v21;
      else
        v24 = CFSTR("Unknown");
      if (v5)
        v23 = v5;
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v9, v30, v31, v32, v33, ContinuityCaptureRapportClientTransportSessionIDKey, v34, v35, v24, v23));
      v36 = v25;
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v34, &v30, 5));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "configuration"));
      objc_msgSend(v22, "relayMessage:toDeviceWithIdentifier:andModel:", v26, v7, objc_msgSend(v27, "clientDeviceModel"));

    }
    if (!WeakRetained[1] && objc_msgSend(WeakRetained[7], "count"))
    {
      v28 = kCMContinuityCaptureEventCaptureSessionEnded;
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[7], "firstObject"));
      objc_msgSend(WeakRetained, "postEvent:toSession:", v28, v29);

      objc_msgSend(WeakRetained[7], "removeObjectAtIndex:", 0);
    }

  }
}

void sub_1000078E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007900(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_skipPlacementStepIfApplicable");
    WeakRetained = v2;
  }

}

void sub_100007A7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100007A98(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    objc_msgSend(v3, "prepareForPullConversation:", *(_QWORD *)(a1 + 32));

    WeakRetained = v4;
  }

}

void sub_100007CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007D08(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100007D18(uint64_t a1)
{

}

void sub_100007D20(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureCapabilities capabilitiesForCurrentDevice](CMContinuityCaptureCapabilities, "capabilitiesForCurrentDevice"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100007F80(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_relayMessage:toDeviceWithIdentifier:andModel:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
    WeakRetained = v3;
  }

}

void sub_100008264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000082A8(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id WeakRetained;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t CurrentTimeString;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;

  v3 = a2;
  v5 = CMContinuityCaptureLog(0, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    *(_DWORD *)buf = 138543618;
    v29 = WeakRetained;
    v30 = 2112;
    v31 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ companion link activation %@", buf, 0x16u);

  }
  if (!v3 || !objc_msgSend(v3, "code"))
  {
    v8 = objc_loadWeakRetained((id *)(a1 + 64));
    if (!v8)
    {
LABEL_14:

      goto LABEL_15;
    }
    v9 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithDictionary:", *(_QWORD *)(a1 + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeSession"));
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeSession"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sessionID"));
      v15 = v14 == 0;

      if (v15)
      {
LABEL_11:
        v18 = (id)GestaltCopyAnswer(CFSTR("ProductType"), 0, 0);
        v19 = v18;
        if (v18)
          v18 = objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, RPOptionSenderModelID);
        CurrentTimeString = CMContinuityCaptureGetCurrentTimeString(v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue(CurrentTimeString);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v21, ContinuityCaptureRapportClientEventOriginTimeInNativeClockKey);

        v22 = *(void **)(a1 + 48);
        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_1000085B4;
        v24[3] = &unk_1000189A0;
        objc_copyWeak(&v27, (id *)(a1 + 64));
        v23 = ContinuityCaptureCompanionSessionEventID;
        v25 = *(id *)(a1 + 56);
        v26 = *(id *)(a1 + 32);
        objc_msgSend(v22, "sendEventID:event:options:completion:", v23, v9, 0, v24);

        objc_destroyWeak(&v27);
        goto LABEL_14;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "activeSession"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "sessionID"));
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, ContinuityCaptureRapportClientShieldSessionIDKey);

    }
    goto LABEL_11;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
LABEL_15:

}

void sub_100008598(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000085B4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = CMContinuityCaptureLog(0, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_loadWeakRetained((id *)(a1 + 48));
      v9 = *(_QWORD *)(a1 + 32);
      v10 = 138543874;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      v14 = 2112;
      v15 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Message sent to device %{public}@ with error %@", (uint8_t *)&v10, 0x20u);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }

}

void sub_100008750(uint64_t a1)
{
  id *v1;
  uint64_t v2;
  id WeakRetained;
  uint64_t v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = CMContinuityCaptureLog(0, v2);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_loadWeakRetained(v1);
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeSession"));
      v16 = 138543618;
      v17 = v6;
      v18 = 2114;
      v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ shield disconnected currently status:%{public}@", (uint8_t *)&v16, 0x16u);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeSession"));

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeSession"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configuration"));
      v14 = objc_msgSend(v13, "clientDeviceModel");

      if (v14 == (id)2)
        objc_msgSend(WeakRetained, "disconnectSession:reason:", 1, kCMContinuityCaptureSessionExitReasonShieldDisconnected);
      else
        objc_msgSend(WeakRetained, "teardownShieldUI");
      objc_msgSend(WeakRetained, "teardownSession");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      objc_msgSend(v15, "shieldDidDisconnect");

    }
  }

}

void sub_100008AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008AD4(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  id *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  id *v16;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v16 = WeakRetained;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeSession"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "pauseStateSolver"));
    objc_msgSend(v5, "incomingCallStatusUpdated:", *(unsigned __int8 *)(a1 + 48));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeSession"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "configuration"));
    v9 = objc_msgSend(v8, "clientDeviceModel");

    if (v9 == (id)2)
    {
      if (*(_BYTE *)(a1 + 49))
      {
        v11 = *(unsigned __int8 *)(a1 + 48);
        v10 = &__NSDictionary0__struct;
LABEL_7:
        v12 = v16;
        if (v11)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16[1], "compositeDevice"));
          v14 = v13;
          v15 = &kCMContinuityCaptureControlIncomingCall;
LABEL_11:
          objc_msgSend(v13, "postEvent:entity:data:", *v15, 4, v10);

          WeakRetained = v16;
          goto LABEL_12;
        }
LABEL_10:
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12[1], "compositeDevice"));
        v14 = v13;
        v15 = &kCMContinuityCaptureControlIncomingCallComplete;
        goto LABEL_11;
      }
    }
    else if (v9 == (id)1)
    {
      v10 = *(id *)(a1 + 32);
      v11 = *(unsigned __int8 *)(a1 + 48);
      goto LABEL_7;
    }
    v10 = &__NSDictionary0__struct;
    v12 = v16;
    goto LABEL_10;
  }
LABEL_12:

}

void sub_100008E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008E88(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[1], "compositeDevice"));

    WeakRetained = v8;
    if (v3)
    {
      v4 = *(unsigned __int8 *)(a1 + 40);
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[1], "compositeDevice"));
      v6 = v5;
      v7 = &kCMContinuityCaptureEventActiveCallEnd;
      if (v4)
        v7 = &kCMContinuityCaptureEventActiveCallStart;
      objc_msgSend(v5, "postEvent:entity:data:", *v7, 0, 0);

      WeakRetained = v8;
    }
  }

}

void sub_1000090B0(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  id v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;

  v3 = a2;
  v5 = CMContinuityCaptureLog(0, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = 138543874;
    v9 = WeakRetained;
    v10 = 2080;
    v11 = "-[CMContinuityCaptureDServer activate]_block_invoke";
    v12 = 2114;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %s completion error %{public}@ ", (uint8_t *)&v8, 0x20u);

  }
}

void sub_100009198(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[2], "activateWithCompletion:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3[3], "activateWithCompletion:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void sub_10000927C(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[2], "invalidate");
    objc_msgSend(v2[3], "invalidate");
    WeakRetained = v2;
  }

}

void sub_1000093BC(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_launchShieldUIForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(unsigned __int8 *)(a1 + 65));
    WeakRetained = v3;
  }

}

void sub_1000095C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000095E0(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  _QWORD *v4;
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
  NSObject *v15;
  id v16;
  void *v17;
  _QWORD block[4];
  id v19;
  id v20;
  id v21[2];
  __int16 v22;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 56) != 2)
      objc_msgSend(WeakRetained, "callActive:", objc_msgSend(WeakRetained, "activeCallSession"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeSession"));

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", *(unsigned __int8 *)(a1 + 64)));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeSession"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "configuration"));
      objc_msgSend(v10, "setPlacementStepSkipped:", v7);

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCServerCCD sharedInstance](CMContinuityCaptureXPCServerCCD, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeSession"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "configuration"));
      objc_msgSend(v11, "updateClientsWithConfiguration:", v14);

    }
    else
    {
      v15 = v4[4];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000097BC;
      block[3] = &unk_100018A40;
      objc_copyWeak(v21, v2);
      v19 = *(id *)(a1 + 32);
      v16 = *(id *)(a1 + 40);
      v17 = *(void **)(a1 + 56);
      v20 = v16;
      v21[1] = v17;
      v22 = *(_WORD *)(a1 + 64);
      dispatch_async(v15, block);

      objc_destroyWeak(v21);
    }
  }

}

void sub_1000097BC(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  id WeakRetained;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  _BOOL8 v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  const char *v23;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v5 = CMContinuityCaptureLog(0, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained(v2);
      *(_DWORD *)buf = 138543618;
      v21 = v7;
      v22 = 2080;
      v23 = "-[CMContinuityCaptureDServer _launchShieldUIForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);

    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000099EC;
    block[3] = &unk_100018670;
    objc_copyWeak(&v19, v2);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v9 = a1 + 32;
    v12 = *(_QWORD *)(v9 + 24);
    v13 = *(_BYTE *)(v9 + 32) != 0;
    v14 = *(_BYTE *)(v9 + 33) != 0;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100009AB4;
    v15[3] = &unk_100018A68;
    objc_copyWeak(&v17, v2);
    v16 = *(id *)v9;
    objc_msgSend(v8, "launchShieldForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:statusHandler:", v10, v11, v12, v13, v14, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
  }

}

void sub_1000099C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;

  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1000099EC(id *a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"));
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(v2, "addObserver:", WeakRetained);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"));
  objc_msgSend(v4, "holdIdleSleepAssertionForReason:", &stru_100018E78);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"));
  v5 = objc_loadWeakRetained(a1);
  objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v5, CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey, 3, 0);

}

void sub_100009AB4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  id *v12;
  NSObject **v13;
  NSObject **v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject **WeakRetained;
  _QWORD block[4];
  id v30;
  _QWORD v31[3];
  _QWORD v32[3];
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;

  v5 = a2;
  v7 = v5;
  if (a3 == -2002)
  {
    v16 = CMContinuityCaptureLog(0, v6);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      sub_1000102D0(a1);

    v14 = (NSObject **)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance"));
    v31[0] = kContinuityCaptureNotificationKeyTitle;
    v31[1] = kContinuityCaptureNotificationKeyBody;
    v32[0] = CFSTR("ALERT_SHIELD_CONNECT_FAILED_TITLE");
    v32[1] = CFSTR("ALERT_SHIELD_CONNECT_FAILED_DESCRIPTION");
    v31[2] = kContinuityCaptureNotificationKeyButtonTitle;
    v32[2] = CFSTR("OK");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
    objc_msgSend(v14, "scheduleNotification:data:", 12, v18);

    goto LABEL_10;
  }
  if (a3)
  {
    if (v5 && a3 == -2001)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "activeSession"));
      if (!v20)
      {

        goto LABEL_11;
      }
      v21 = (void *)v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "activeSession"));
      v24 = objc_msgSend(v23, "isEqual:", v7);

      if (v24)
      {
        v26 = CMContinuityCaptureLog(0, v25);
        v27 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
          sub_100010204(a1);

        WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
        if (WeakRetained)
        {
          v14 = WeakRetained;
          objc_msgSend(WeakRetained, "shieldDidDisconnect");
          goto LABEL_10;
        }
      }
    }
  }
  else
  {
    v8 = CMContinuityCaptureLog(0, v6);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_loadWeakRetained((id *)(a1 + 40));
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v34 = v10;
      v35 = 2114;
      v36 = v7;
      v37 = 2114;
      v38 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ [shieldSession:%{public}@] (CMContinuityCapture)Shields are up! for device %{public}@", buf, 0x20u);

    }
    v12 = (id *)(a1 + 40);
    v13 = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
    if (v13)
    {
      v14 = v13;
      v15 = v13[4];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100009DB0;
      block[3] = &unk_100018670;
      objc_copyWeak(&v30, v12);
      dispatch_async(v15, block);
      objc_destroyWeak(&v30);
LABEL_10:

    }
  }
LABEL_11:

}

void sub_100009DB0(uint64_t a1)
{
  id *v1;
  _BYTE *WeakRetained;
  _BYTE *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[112])
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeSession"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pauseStateSolver"));
      v7 = objc_msgSend(v6, "isUserPauseStored");

      if (v7)
      {
        v9 = CMContinuityCaptureLog(0, v8);
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = objc_loadWeakRetained(v1);
          v18 = 138543362;
          v19 = v11;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Stream was in user pause state , potentially a crash recovery", (uint8_t *)&v18, 0xCu);

        }
        v3[112] = 0;
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeSession"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "pauseStateSolver"));
        objc_msgSend(v14, "pauseForEvent:", 0);

        v15 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeSession"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pauseStateSolver"));
        objc_msgSend(v17, "saveUserPauseState:", 0);

        objc_msgSend(v3, "_resolveUserPauseState");
      }
    }
  }

}

void sub_100009FF0(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_teardownShieldUI");
    WeakRetained = v2;
  }

}

void sub_10000A1D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A1F8(id *a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  id v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"));
  objc_msgSend(v2, "releaseCurrentIdleSleepAssertion");

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"));
  a1 += 4;
  WeakRetained = objc_loadWeakRetained(a1);
  objc_msgSend(v3, "removeObserver:", WeakRetained);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"));
  v5 = objc_loadWeakRetained(a1);
  objc_msgSend(v6, "removeObserver:forKeyPath:context:", v5, CMContinuityCaptureSystemStatusPowerButtonPressedKVOKey, 0);

}

void sub_10000A71C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "compositeDevice"));
  objc_msgSend(v2, "removeObserver:forKeyPath:context:", *(_QWORD *)(a1 + 32), CMContinuityCaptureRemoteCompositeStateKVOKey, 0);

}

void sub_10000AA58(uint64_t a1, int a2)
{
  int DeviceClass;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  _BOOL4 v21;

  DeviceClass = GestaltGetDeviceClass();
  v6 = CMContinuityCaptureLog(0, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeSession"));
    v14 = 138544130;
    v15 = v8;
    v16 = 1024;
    v17 = a2;
    v18 = 2114;
    v19 = v10;
    v20 = 1024;
    v21 = DeviceClass == 3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ incomingStreamRequestHandler stream:%d activeSession %{public}@ isOniPad %d", (uint8_t *)&v14, 0x22u);

  }
  if (a2)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeSession"));

    if (v12)
    {
      if (DeviceClass != 3)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
        objc_msgSend(v13, "bringShieldUIProcessToForegroundIfApplicable");

      }
    }
  }
}

void sub_10000AE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_10000AEBC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id WeakRetained;
  uint64_t v8;
  id v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  v3 = a2;
  v5 = CMContinuityCaptureLog(0, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v8 = *(_QWORD *)(a1 + 32);
    v9 = objc_loadWeakRetained((id *)(a1 + 48));
    v10 = 138544130;
    v11 = WeakRetained;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    v16 = 2112;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ event %{public}@ dispatched to session %{public}@ with error %@", (uint8_t *)&v10, 0x2Au);

  }
}

void sub_10000BCFC(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_observeValueForKeyPath:ofObject:change:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    WeakRetained = v3;
  }

}

void sub_10000C7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C850(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  int v9;
  id v10;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = (void *)*((_QWORD *)WeakRetained + 5);
    if (v5)
      dispatch_block_cancel(v5);
    v6 = CMContinuityCaptureLog(0, v3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_loadWeakRetained(v1);
      v9 = 138543362;
      v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Teardown Session", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(v4, "teardownSession");
  }

}

void sub_10000D524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000D57C(uint64_t a1, int a2, void *a3)
{
  id v5;
  id *v6;
  uint64_t v7;
  id WeakRetained;
  uint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  id v24;

  v5 = a3;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v9 = CMContinuityCaptureLog(0, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_loadWeakRetained(v6);
      v19 = 138543874;
      v20 = v11;
      v21 = 1024;
      v22 = a2;
      v23 = 2114;
      v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Session state changed to %d for device %{public}@", (uint8_t *)&v19, 0x1Cu);

    }
    if (!a2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "activeSession"));
      if (v13)
      {
        v14 = (void *)v13;
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "activeSession"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "configuration"));
        v18 = objc_msgSend(v17, "clientDeviceModel");

        if (v18 == (id)2)
          objc_msgSend(WeakRetained, "disconnectSession:reason:", 1, kCMContinuityCaptureSessionExitReasonStreamSessionStopped);
      }
      else
      {

      }
    }
  }

}

void sub_10000D720(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = CMContinuityCaptureLog(0, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138412546;
      v21 = WeakRetained;
      v22 = 2112;
      v23 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ RPRemoteDisplayDiscovery dedicatedDeviceChanged: %@", (uint8_t *)&v20, 0x16u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "idsDeviceIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "activeSession"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "deviceIdentifier"));
    v12 = objc_msgSend(v8, "isEqual:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "activeSession"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "configuration"));
    objc_msgSend(v15, "setIsDedicated:", v12);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCServerCCD sharedInstance](CMContinuityCaptureXPCServerCCD, "sharedInstance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "activeSession"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "configuration"));
    objc_msgSend(v16, "updateClientsWithConfiguration:", v19);

  }
}

void sub_10000D908(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id WeakRetained;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;
  __int16 v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = CMContinuityCaptureLog(0, v4);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412546;
      v9 = WeakRetained;
      v10 = 2112;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ RPRemoteDisplayDiscovery activateWithCompletion error %@", (uint8_t *)&v8, 0x16u);
    }

  }
}

void sub_10000DD44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10)
{
  id *v10;
  id *v11;
  id *v12;
  uint64_t v13;

  objc_destroyWeak(v11);
  objc_destroyWeak(v12);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v13 - 144));
  _Unwind_Resume(a1);
}

void sub_10000DDA8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = 138412290;
    v7 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Client Invalidated", (uint8_t *)&v6, 0xCu);

  }
}

void sub_10000DE5C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = 138412290;
    v7 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Rapport Client Interrupted", (uint8_t *)&v6, 0xCu);

  }
}

void sub_10000DF10(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  id v10;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v6 = objc_msgSend(*(id *)(a1 + 32), "errorFlags");
    v7 = 138412546;
    v8 = WeakRetained;
    v9 = 2048;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Client ErrorChange, newError %llu", (uint8_t *)&v7, 0x16u);

  }
}

void sub_10000DFE0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id *v7;
  dispatch_queue_t *WeakRetained;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  dispatch_queue_t *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (CMContinityCaptureDebugLogEnabled())
    {
      v10 = CMContinuityCaptureLog(0, v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        v13 = objc_loadWeakRetained(v7);
        *(_DWORD *)buf = 138412802;
        v20 = v13;
        v21 = 2112;
        v22 = v5;
        v23 = 2112;
        v24 = v6;
        _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@ Client Event %@ Option %@", buf, 0x20u);

      }
    }
    dispatch_assert_queue_not_V2(WeakRetained[4]);
    v12 = WeakRetained[4];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000E17C;
    v14[3] = &unk_100018B80;
    v15 = v6;
    v16 = v5;
    objc_copyWeak(&v18, v7);
    v17 = WeakRetained;
    dispatch_async_and_wait(v12, v14);
    objc_destroyWeak(&v18);

  }
}

void sub_10000E17C(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  char *v13;
  id v14;
  uint64_t v15;
  void *v16;
  char *v17;
  uint64_t v18;
  NSObject *v19;
  id WeakRetained;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  int UserPreferenceDisabled;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  char *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  unsigned int v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  unsigned int v50;
  void *v51;
  void *v52;
  NSObject *v53;
  char *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  unsigned int v62;
  id *v63;
  void *v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  id v73;
  uint64_t v74;
  NSObject *v75;
  id v76;
  uint64_t v77;
  NSObject *v78;
  id v79;
  void *v80;
  unsigned int v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  uint64_t v86;
  void *v87;
  id v88;
  uint64_t v89;
  NSObject *v90;
  id v91;
  uint64_t v92;
  id v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  unsigned int v104;
  uint8_t buf[4];
  id v106;
  __int16 v107;
  const char *v108;
  __int16 v109;
  char *v110;
  __int16 v111;
  void *v112;
  __int16 v113;
  void *v114;

  v2 = RPOptionSenderModelID;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectForKeyedSubscript:", RPOptionSenderModelID));
  if (v3)
  {

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", v2));

    if (!v4)
    {
      v9 = 0;
      goto LABEL_7;
    }
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectForKeyedSubscript:", v2));
  v7 = 4;
  if (!v6)
    v7 = 5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[v7], "objectForKeyedSubscript:", v2));
  v9 = CMContinuityCaptureDeviceModelFromModelString();

LABEL_7:
  v10 = a1[4];
  if (v10)
  {
    v11 = RPOptionSenderIDSDeviceID;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", RPOptionSenderIDSDeviceID));
    if (v12)
      v13 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectForKeyedSubscript:", v11));
    else
      v13 = 0;

  }
  else
  {
    v13 = 0;
  }
  v14 = a1[4];
  if (v14)
  {
    v15 = RPOptionSenderDeviceName;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", RPOptionSenderDeviceName));
    if (v16)
      v17 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "objectForKeyedSubscript:", v15));
    else
      v17 = 0;

  }
  else
  {
    v17 = 0;
  }
  v18 = CMContinuityCaptureLog(0, v5);
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained(a1 + 7);
    *(_DWORD *)buf = 138413058;
    v106 = WeakRetained;
    v107 = 2114;
    v108 = v13;
    v109 = 2114;
    v110 = v17;
    v111 = 1024;
    LODWORD(v112) = v9;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%@ deviceIdentifier %{public}@ name %{public}@ model %d", buf, 0x26u);

  }
  v21 = a1[5];
  if (v21)
  {
    v22 = ContinuityCaptureRapportClientMessageTypeKey;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", ContinuityCaptureRapportClientMessageTypeKey));

    if (v23)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", v22));
      v25 = objc_msgSend(v24, "integerValue");

      switch((unint64_t)v25)
      {
        case 0uLL:
          UserPreferenceDisabled = FigContinuityCaptureGetUserPreferenceDisabled();
          if (UserPreferenceDisabled)
          {
            v28 = kCMContinuityCaptureSessionExitReasonUserDisabled;
            objc_msgSend(a1[6], "_exitSessionIfApplicableForDeviceIdentifier:exitReason:", v13, kCMContinuityCaptureSessionExitReasonUserDisabled);
            objc_msgSend(a1[6], "disconnectSession:reason:", 1, v28);
            if (v9 != 2)
              goto LABEL_64;
          }
          else if (v9 != 2)
          {
            goto LABEL_58;
          }
          if (objc_msgSend(*((id *)a1[6] + 10), "currentState") != 1
            || !v13
            || (v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)a1[6] + 10), "peerDeviceIdentifier")),
                v81 = objc_msgSend(v80, "isEqualToString:", v13),
                v80,
                !v81)
            || UserPreferenceDisabled == 1)
          {
LABEL_64:
            v92 = CMContinuityCaptureLog(0, v29);
            v53 = objc_claimAutoreleasedReturnValue(v92);
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
            {
              v93 = objc_loadWeakRetained(a1 + 7);
              *(_DWORD *)buf = 138543874;
              v106 = v93;
              v107 = 2114;
              v108 = v13;
              v109 = 1024;
              LODWORD(v110) = UserPreferenceDisabled;
              _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}@ Disregard launch shield UI event for %{public}@ userDisabledContinuityCapture %d", buf, 0x1Cu);

            }
            goto LABEL_79;
          }
LABEL_58:
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)a1[6] + 10), "dedicatedDevice"));
          v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "idsDeviceIdentifier"));
          v84 = objc_msgSend(v83, "isEqual:", v13);

          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", ContinuityCaptureRapportClientShieldLaunchDataKey));
          v87 = v85;
          v88 = v84;
          if (v85)
          {
            v88 = v84;
            if (objc_msgSend(v85, "length") == (id)2)
              v88 = (id)(*(_BYTE *)objc_msgSend(objc_retainAutorelease(v87), "bytes") & 1);
          }
          v89 = CMContinuityCaptureLog(0, v86);
          v90 = objc_claimAutoreleasedReturnValue(v89);
          if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
          {
            v91 = objc_loadWeakRetained(a1 + 7);
            *(_DWORD *)buf = 138543874;
            v106 = v91;
            v107 = 2114;
            v108 = v13;
            v109 = 1024;
            LODWORD(v110) = (_DWORD)v88;
            _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_DEFAULT, "%{public}@ Launch shield ui event for %{public}@ skipPlacementStep %d", buf, 0x1Cu);

          }
          objc_msgSend(a1[6], "launchShieldUIForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:", v13, v17, v9, v88, v84);

          break;
        case 1uLL:
          v30 = CMContinuityCaptureLog(0, v26);
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = objc_loadWeakRetained(a1 + 7);
            v33 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", ContinuityCaptureRapportClientUserDisconnectReasonKey));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", ContinuityCaptureRapportClientShieldSessionIDKey));
            v35 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "activeSession"));
            *(_DWORD *)buf = 138544386;
            v106 = v32;
            v107 = 2114;
            v108 = v13;
            v109 = 2114;
            v110 = v33;
            v111 = 2114;
            v112 = v34;
            v113 = 2114;
            v114 = v36;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%{public}@ User Disconnect from Host %{public}@ reason %{public}@ shieldSessionID %{public}@ activeSession %{public}@", buf, 0x34u);

          }
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "activeSession"));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "deviceIdentifier"));
          v40 = objc_msgSend(v13, "isEqualToString:", v39);

          v41 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "activeSession"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "sessionID"));
          if (v43)
          {
            v104 = v40;
            v44 = ContinuityCaptureRapportClientShieldSessionIDKey;
            v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", ContinuityCaptureRapportClientShieldSessionIDKey));
            if (v45)
            {
              v103 = v45;
              v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", v44));
              v46 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
              v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "activeSession"));
              v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "sessionID"));
              v49 = objc_msgSend(v102, "containsString:", v48);

              v50 = v49;
              v45 = v103;
            }
            else
            {
              v50 = 0;
            }

            v40 = v104;
          }
          else
          {
            v50 = 0;
          }

          v94 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "activeSession"));

          if (v95)
          {
            if ((v40 & v50) == 1)
            {
              v96 = a1[6];
              v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", ContinuityCaptureRapportClientUserDisconnectReasonKey));
              objc_msgSend(v96, "disconnectSession:reason:", 0, v97);

              objc_msgSend(a1[6], "teardownSession");
            }
          }
          else
          {
            v98 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
            objc_msgSend(v98, "forceShieldUITerminationIfApplicable");

          }
          break;
        case 3uLL:
          v51 = (void *)*((_QWORD *)a1[6] + 1);
          if (v51)
          {
            v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "compositeDevice"));

            if (v52)
            {
              v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", ContinuityCaptureRapportClientEventNameKey));
              v54 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", ContinuityCaptureRapportClientEventEntityTypeKey));
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "objectForKeyedSubscript:", ContinuityCaptureRapportClientEventDataKey));
              v57 = CMContinuityCaptureLog(0, v56);
              v58 = objc_claimAutoreleasedReturnValue(v57);
              if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
              {
                v59 = objc_loadWeakRetained(a1 + 7);
                *(_DWORD *)buf = 138544130;
                v106 = v59;
                v107 = 2114;
                v108 = (const char *)v53;
                v109 = 2114;
                v110 = v54;
                v111 = 2114;
                v112 = v55;
                _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ User Event %{public}@ entity %{public}@ data %{public}@", buf, 0x2Au);

              }
              if (v53)
              {
                if (v54)
                {
                  v60 = objc_opt_class(NSString);
                  if ((objc_opt_isKindOfClass(v53, v60) & 1) != 0)
                  {
                    v61 = objc_opt_class(NSNumber);
                    if ((objc_opt_isKindOfClass(v54, v61) & 1) != 0)
                    {
                      v62 = -[NSObject containsString:](v53, "containsString:", kCMContinuityCaptureEventStateMismatched);
                      v63 = (id *)a1[6];
                      if (v62)
                      {
                        objc_msgSend(v63, "_resolveUserPauseState");
                        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*((id *)a1[6] + 1), "compositeDevice"));
                        v65 = objc_msgSend(objc_alloc((Class)NSError), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -1012, 0);
                        objc_msgSend(v64, "connectionInterrupted:forDevice:", v65, 0);

                      }
                      else
                      {
                        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63[1], "compositeDevice"));
                        v99 = objc_msgSend(v54, "unsignedIntValue");
                        v100 = objc_opt_class(NSDictionary);
                        if ((objc_opt_isKindOfClass(v55, v100) & 1) != 0)
                          v101 = v55;
                        else
                          v101 = 0;
                        objc_msgSend(v64, "postEvent:entity:data:", v53, v99, v101);
                      }

                    }
                  }
                }
              }

LABEL_79:
            }
          }
          break;
        case 4uLL:
          v66 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "activeSession"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "deviceIdentifier"));
          v69 = objc_msgSend(v13, "isEqualToString:", v68);

          if (v69)
          {
            v71 = CMContinuityCaptureLog(0, v70);
            v72 = objc_claimAutoreleasedReturnValue(v71);
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              v73 = objc_loadWeakRetained(a1 + 7);
              *(_DWORD *)buf = 138543618;
              v106 = v73;
              v107 = 2114;
              v108 = v13;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ Skip placement step from Host %{public}@", buf, 0x16u);

            }
            objc_msgSend(a1[6], "_skipPlacementStepIfApplicable");
          }
          break;
        case 5uLL:
          v74 = CMContinuityCaptureLog(0, v26);
          v75 = objc_claimAutoreleasedReturnValue(v74);
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            v76 = objc_loadWeakRetained(a1 + 7);
            *(_DWORD *)buf = 138543362;
            v106 = v76;
            _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "%{public}@ Query camera capabilities", buf, 0xCu);

          }
          objc_msgSend(a1[6], "postCameraCapabilitiesToDeviceWithIdentifier:andModel:", v13, v9);
          break;
        case 8uLL:
          v77 = CMContinuityCaptureLog(0, v26);
          v78 = objc_claimAutoreleasedReturnValue(v77);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            v79 = objc_loadWeakRetained(a1 + 7);
            *(_DWORD *)buf = 138543874;
            v106 = v79;
            v107 = 2080;
            v108 = "-[CMContinuityCaptureDServer setupSidebandRPClient]_block_invoke";
            v109 = 2114;
            v110 = v13;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%{public}@ %s update system state from Host %{public}@", buf, 0x20u);

          }
          objc_msgSend(a1[6], "updateSystemStateForDeviceIdentifier:andModel:", v13, v9);
          break;
        default:
          break;
      }
    }
  }

}

void sub_10000ECCC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  id v9;
  __int16 v10;
  id v11;

  v3 = a2;
  v5 = CMContinuityCaptureLog(0, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = 138543618;
    v9 = WeakRetained;
    v10 = 2112;
    v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ activate cc client, error %@", (uint8_t *)&v8, 0x16u);

  }
}

void sub_10000F02C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 144));
  _Unwind_Resume(a1);
}

void sub_10000F068(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 4));
    v5 = CMContinuityCaptureLog(0, v4);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained(v1);
      v10 = 138543362;
      v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ server session interrupted", (uint8_t *)&v10, 0xCu);

    }
    v8 = (void *)v3[1];
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displaySession"));
      objc_msgSend(v3, "resetCurrentSession:added:completion:", v9, 0, &stru_100018BC8);

    }
  }

}

void sub_10000F174(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  id v7;

  v3 = CMContinuityCaptureLog(0, a2);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v6 = 138543362;
    v7 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ server session invalidated", (uint8_t *)&v6, 0xCu);

  }
}

void sub_10000F228(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void (**v6)(id, _QWORD);
  id *v7;
  id WeakRetained;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  int v27;

  v5 = a2;
  v6 = a3;
  v7 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)WeakRetained + 4));
    v10 = (void *)v9[5];
    if (v10)
    {
      dispatch_block_cancel(v10);
      v11 = (void *)v9[5];
      v9[5] = 0;

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destinationDevice"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "model"));
    v14 = CMContinuityCaptureDeviceModelFromModelString();

    v16 = CMContinuityCaptureLog(0, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_loadWeakRetained(v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceType"));
      v20 = 138544130;
      v21 = v18;
      v22 = 2114;
      v23 = v5;
      v24 = 2114;
      v25 = v19;
      v26 = 1024;
      v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ session started for %{public}@ serviceType %{public}@ deviceModel %d", (uint8_t *)&v20, 0x26u);

    }
    objc_msgSend(v9, "resetCurrentSession:added:completion:", v5, 1, &stru_100018BE8);
    v6[2](v6, 0);
  }

}

void sub_10000F3D4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id WeakRetained;
  id *v11;
  dispatch_queue_t *v12;
  dispatch_queue_t *v13;
  dispatch_queue_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  dispatch_queue_t v20;
  dispatch_time_t v21;
  void **v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  dispatch_queue_t *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;

  v5 = a2;
  v6 = a3;
  v8 = CMContinuityCaptureLog(0, v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 138543874;
    v29 = WeakRetained;
    v30 = 2114;
    v31 = v5;
    v32 = 2114;
    v33 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ session ended for %{public}@ error %{public}@", buf, 0x20u);

  }
  v11 = (id *)(a1 + 32);
  v12 = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v13 = v12;
  if (v12)
  {
    dispatch_assert_queue_V2(v12[4]);
    if (!v13[5])
    {
      v14 = v13[6];
      if (v14)
      {
        if (-[NSObject isEqual:](v14, "isEqual:", v5))
        {
          v16 = CMContinuityCaptureLog(0, v15);
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            v18 = objc_loadWeakRetained(v11);
            *(_DWORD *)buf = 138543618;
            v29 = v18;
            v30 = 2114;
            v31 = v5;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ setup timeout for %{public}@", buf, 0x16u);

          }
          v22 = _NSConcreteStackBlock;
          v23 = 3221225472;
          v24 = sub_10000F610;
          v25 = &unk_100018B58;
          objc_copyWeak(&v27, v11);
          v26 = v13;
          v19 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &v22);
          v20 = v13[5];
          v13[5] = v19;

          v21 = dispatch_time(0, 10000000000);
          dispatch_after(v21, v13[4], v13[5]);
          objc_destroyWeak(&v27);
        }
      }
    }
    -[dispatch_queue_t resetCurrentSession:added:completion:](v13, "resetCurrentSession:added:completion:", v5, 0, &stru_100018C30, v22, v23, v24, v25);
  }

}

void sub_10000F610(uint64_t a1)
{
  id *v2;
  uint64_t v3;
  id *WeakRetained;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;

  v2 = (id *)(a1 + 40);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = CMContinuityCaptureLog(0, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained(v2);
      v21 = 138543362;
      v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@  Teardown timeout", (uint8_t *)&v21, 0xCu);

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "activeSession"));
    if (v9)
    {
      v10 = (void *)v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "activeSession"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "configuration"));
      v14 = objc_msgSend(v13, "clientDeviceModel");

      if (v14 != (id)2)
        objc_msgSend(WeakRetained, "teardownShieldUI");
    }
    else
    {

    }
    v15 = WeakRetained[5];
    WeakRetained[5] = 0;

    objc_msgSend(WeakRetained, "teardownSession");
    if (objc_msgSend(WeakRetained[7], "count"))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained[7], "firstObject"));
      objc_msgSend(WeakRetained, "postEvent:toSession:", kCMContinuityCaptureEventCaptureSessionEnded, v16);
      v18 = CMContinuityCaptureLog(0, v17);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = objc_loadWeakRetained(v2);
        v21 = 138543618;
        v22 = v20;
        v23 = 2114;
        v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@  Activate pending connection %{public}@", (uint8_t *)&v21, 0x16u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectAtIndex:", 0);

    }
  }

}

void sub_10000F8F4(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  char *v19;
  int v20;
  id v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
    goto LABEL_12;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "activeSession"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "activeSession"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sessionID"));

    if (v9)
    {
      v11 = CMContinuityCaptureLog(0, v10);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = objc_loadWeakRetained(v2);
        v14 = *(unsigned __int8 *)(a1 + 40);
        v20 = 138543874;
        v21 = v13;
        v22 = 2080;
        v23 = "-[CMContinuityCaptureDServer lockScreenLayoutMonitor:didUpdateLayoutWithShieldFrontMost:lockscreenInLayout:]_block_invoke";
        v24 = 1024;
        v25 = v14;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}@ %s lockScreenLayoutMonitor did receive update on lock screen shieldFrontMost:%d", (uint8_t *)&v20, 0x1Cu);

      }
      if (*(_BYTE *)(a1 + 40))
        objc_msgSend(WeakRetained, "resumeStreamingForEvent:", 2);
      else
        objc_msgSend(WeakRetained, "pauseSessionForEvent:", 2);
      goto LABEL_12;
    }
  }
  else
  {

  }
  v15 = CMContinuityCaptureLog(0, v10);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = objc_loadWeakRetained(v2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
    v19 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "activeSession"));
    v20 = 138543618;
    v21 = v17;
    v22 = 2112;
    v23 = v19;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ ignore layout monitor update for active session %@", (uint8_t *)&v20, 0x16u);

  }
LABEL_12:

}

uint64_t start(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  CMContinuityCaptureDServer *v12;
  void *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  dispatch_queue_attr_t v21;
  NSObject *v22;
  dispatch_queue_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  int v30;
  const char *v31;

  v2 = CMContinuityCaptureLog(0, a2);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v30 = 136315138;
    v31 = "200.0.1";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "ccd start, log version:%s", (uint8_t *)&v30, 0xCu);
  }

  v4 = (void *)FigDispatchQueueCreateWithPriority("com.apple.continuitycapture.rapportServer", 0, 14);
  v6 = CMContinuityCaptureLog(2, v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (char *)objc_claimAutoreleasedReturnValue(+[ContinuityCaptureRemoteUISystemStatus sharedInstance](ContinuityCaptureRemoteUISystemStatus, "sharedInstance"));
    v30 = 138412290;
    v31 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v30, 0xCu);

  }
  v10 = CMContinuityCaptureLog(2, v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v30) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting System Status attribution to com.apple.ContinuityCaptureShieldUI", (uint8_t *)&v30, 2u);
  }

  +[STDynamicActivityAttributionPublisher setCurrentAttributionKey:andApp:](STDynamicActivityAttributionPublisher, "setCurrentAttributionKey:andApp:", 0, CFSTR("com.apple.ContinuityCaptureShieldUI"));
  v12 = -[CMContinuityCaptureDServer initWithQueue:]([CMContinuityCaptureDServer alloc], "initWithQueue:", v4);
  v13 = (void *)qword_10001D858;
  qword_10001D858 = (uint64_t)v12;

  objc_msgSend((id)qword_10001D858, "activate");
  v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = dispatch_queue_create("com.apple.continuitycapture.rapportlaunch", v15);

  xpc_set_event_stream_handler("com.apple.rapport.matching", v16, &stru_100018C98);
  if (qword_10001D858)
  {
    v18 = objc_claimAutoreleasedReturnValue(+[CMContinuityCaptureXPCServerCCD sharedInstance](CMContinuityCaptureXPCServerCCD, "sharedInstance"));
    -[NSObject startListeningWithDelegate:](v18, "startListeningWithDelegate:", qword_10001D858);
  }
  else
  {
    v19 = CMContinuityCaptureLog(0, v17);
    v18 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_10001040C(v18);
  }

  if (FigGetCFPreferenceBooleanWithDefault(CFSTR("com.apple.continuitycapture.hostLocalServer"), CFSTR("com.apple.cameracapture"), 0))
  {
    v20 = objc_alloc((Class)CMContinuityCaptureNWServer);
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = dispatch_queue_create("com.apple.continuitycapture.localServer", v22);
    v24 = objc_msgSend(v20, "initWithQueue:", v23);
    v25 = (void *)qword_10001D860;
    qword_10001D860 = (uint64_t)v24;

    v27 = CMContinuityCaptureLog(0, v26);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v30 = 138412290;
      v31 = (const char *)qword_10001D860;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Hosting local server %@", (uint8_t *)&v30, 0xCu);
    }

  }
  CFRunLoopRun();

  return 0;
}

void sub_10000FF10(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  const char *string;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *reply;
  int v12;
  OS_xpc_object *v13;

  v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_dictionary)
  {
    v4 = CMContinuityCaptureLog(0, v3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v2;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received launch event from rapport %@", (uint8_t *)&v12, 0xCu);
    }
LABEL_11:

    goto LABEL_12;
  }
  string = xpc_dictionary_get_string(v2, _xpc_event_key_name);
  if (string)
  {
    v8 = string;
    v9 = CMContinuityCaptureLog(0, v7);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136315138;
      v13 = (OS_xpc_object *)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "ccd stream event %s", (uint8_t *)&v12, 0xCu);
    }

  }
  if (xpc_dictionary_get_BOOL(v2, "replyRequired"))
  {
    reply = xpc_dictionary_create_reply(v2);
    v5 = reply;
    if (reply)
      xpc_dictionary_send_reply(reply);
    goto LABEL_11;
  }
LABEL_12:

}

void sub_100010078(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

id sub_10001008C(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(a1 + 40));
}

void sub_100010098(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006950((void *)&_mh_execute_header, a2, a3, "Failed to encode launchUIConfiguration for shield: %@", a5, a6, a7, a8, 2u);
  sub_100006960();
}

void sub_1000100FC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006950((void *)&_mh_execute_header, a2, a3, "Failed to launch ContinuityCaptureShieldUI with error: %{public}@", a5, a6, a7, a8, 2u);
  sub_100006960();
}

void sub_100010160(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Attempted to acquire SBSSecureAppAssertion for lock screen even though we already have one", v1, 2u);
}

void sub_1000101A0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006950((void *)&_mh_execute_header, a2, a3, "SBSSecureAppAssertion errorHandler: %{public}@", a5, a6, a7, a8, 2u);
  sub_100006960();
}

void sub_100010204(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v1 = sub_10001008C(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CCDShieldUILifeCycleManager sharedInstance](CCDShieldUILifeCycleManager, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "activeSession"));
  sub_100010078((void *)&_mh_execute_header, v3, v4, "%@ [shieldSession:%{public}@] Shield Session %{public}@ aborted", v5, v6, v7, v8, 2u);

}

void sub_1000102D0(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = sub_10001008C(a1);
  sub_100010078((void *)&_mh_execute_header, v2, v3, "%@ [shieldSession:%{public}@] Shield failed to launch for %{public}@", v4, v5, v6, v7, 2u);

}

void sub_100010374(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;

  v3 = 138543874;
  v4 = a1;
  v5 = 2080;
  v6 = "-[CMContinuityCaptureDServer _exitSessionIfApplicableForDeviceIdentifier:exitReason:]";
  v7 = 2112;
  v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@ %s called with nil identifier for reason %@", (uint8_t *)&v3, 0x20u);
}

void sub_10001040C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Couldn't create CMContinuityCaptureDServer", v1, 2u);
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__acquireAlwaysOnDisplayAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_acquireAlwaysOnDisplayAssertion");
}

id objc_msgSend__acquireAppSwitcherAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_acquireAppSwitcherAssertion");
}

id objc_msgSend__acquireLockScreenAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_acquireLockScreenAssertion");
}

id objc_msgSend__exitSessionIfApplicableForDeviceIdentifier_exitReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_exitSessionIfApplicableForDeviceIdentifier:exitReason:");
}

id objc_msgSend__forceTerminateShieldIfApplicable_completionTimeoutInSec_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_forceTerminateShieldIfApplicable:completionTimeoutInSec:");
}

id objc_msgSend__launchShieldUIForDeviceIdentifier_name_model_skipPlacementStep_isDedicated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_launchShieldUIForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:");
}

id objc_msgSend__launchShieldUIProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_launchShieldUIProcess");
}

id objc_msgSend__observeValueForKeyPath_ofObject_change_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_observeValueForKeyPath:ofObject:change:context:");
}

id objc_msgSend__relayMessage_toDeviceWithIdentifier_andModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_relayMessage:toDeviceWithIdentifier:andModel:");
}

id objc_msgSend__releaseAlwaysOnDisplayAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_releaseAlwaysOnDisplayAssertion");
}

id objc_msgSend__releaseAppSwitcherAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_releaseAppSwitcherAssertion");
}

id objc_msgSend__releaseLockScreenAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_releaseLockScreenAssertion");
}

id objc_msgSend__resolveUserPauseState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resolveUserPauseState");
}

id objc_msgSend__setupShieldLifecycleMonitorForCurrentSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupShieldLifecycleMonitorForCurrentSession");
}

id objc_msgSend__skipPlacementStepIfApplicable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_skipPlacementStepIfApplicable");
}

id objc_msgSend__teardownShieldUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_teardownShieldUI");
}

id objc_msgSend_acquireSecureAppAssertionWithType_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireSecureAppAssertionWithType:errorHandler:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activeCallCountOnMainQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeCallCountOnMainQueue");
}

id objc_msgSend_activeCallSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeCallSession");
}

id objc_msgSend_activeSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeSession");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:forKeyPath:options:context:");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryLevel");
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryState");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bringShieldUIProcessToForegroundIfApplicable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bringShieldUIProcessToForegroundIfApplicable");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_callActive_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callActive:");
}

id objc_msgSend_callState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callState");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_capabilitiesForCurrentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "capabilitiesForCurrentDevice");
}

id objc_msgSend_clientDeviceModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientDeviceModel");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compositeDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compositeDevice");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_connectionInterrupted_forDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionInterrupted:forDevice:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_controlFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controlFlags");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_createSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSession:");
}

id objc_msgSend_currentSessionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSessionID");
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentState");
}

id objc_msgSend_dedicatedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dedicatedDevice");
}

id objc_msgSend_destinationDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destinationDevice");
}

id objc_msgSend_deviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIdentifier");
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryRepresentation");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didChangeValueForKey:");
}

id objc_msgSend_disconnectSession_reason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnectSession:reason:");
}

id objc_msgSend_displaySession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displaySession");
}

id objc_msgSend_errorFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorFlags");
}

id objc_msgSend_execute_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "execute:");
}

id objc_msgSend_exitDiscoverySessionWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exitDiscoverySessionWithReason:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_forceShieldUITerminationIfApplicable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceShieldUITerminationIfApplicable");
}

id objc_msgSend_handleForPredicate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleForPredicate:error:");
}

id objc_msgSend_holdIdleSleepAssertionForReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "holdIdleSleepAssertionForReason:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_idsDeviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idsDeviceIdentifier");
}

id objc_msgSend_incomingCallDeclinedStatusUpdated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingCallDeclinedStatusUpdated:");
}

id objc_msgSend_incomingCallStatusUpdated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incomingCallStatusUpdated:");
}

id objc_msgSend_initWithDeviceIdentifier_name_model_placementStepSkipped_isDedicated_sessionInterruptionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDeviceIdentifier:name:model:placementStepSkipped:isDedicated:sessionInterruptionBlock:");
}

id objc_msgSend_initWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithExplanation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExplanation:");
}

id objc_msgSend_initWithName_attributes_entity_minimumSupportedVersion_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:attributes:entity:minimumSupportedVersion:value:");
}

id objc_msgSend_initWithPredicate_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPredicate:context:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithRapportDisplaySession_queue_voucher_incomingStreamRequestHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRapportDisplaySession:queue:voucher:incomingStreamRequestHandler:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateCurrentSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateCurrentSession");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isUserPauseStored(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isUserPauseStored");
}

id objc_msgSend_launchShieldForDeviceIdentifier_name_model_skipPlacementStep_isDedicated_statusHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchShieldForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:statusHandler:");
}

id objc_msgSend_launchShieldUIForDeviceIdentifier_name_model_skipPlacementStep_isDedicated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchShieldUIForDeviceIdentifier:name:model:skipPlacementStep:isDedicated:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localDevice");
}

id objc_msgSend_lockScreenInLayout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockScreenInLayout");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "model");
}

id objc_msgSend_monitorForDeath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorForDeath:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_notifyShieldStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyShieldStatus:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openApplication_withOptions_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openApplication:withOptions:completion:");
}

id objc_msgSend_optionsWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optionsWithDictionary:");
}

id objc_msgSend_pauseForEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseForEvent:");
}

id objc_msgSend_pauseSessionForEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseSessionForEvent:");
}

id objc_msgSend_pauseStateSolver(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseStateSolver");
}

id objc_msgSend_peerDeviceIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerDeviceIdentifier");
}

id objc_msgSend_placementStepSkipped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "placementStepSkipped");
}

id objc_msgSend_pongIfNeededWithShouldConsiderPongHistory_forIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pongIfNeededWithShouldConsiderPongHistory:forIdentifier:");
}

id objc_msgSend_postCameraCapabilitiesToDeviceWithIdentifier_andModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postCameraCapabilitiesToDeviceWithIdentifier:andModel:");
}

id objc_msgSend_postEvent_entity_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postEvent:entity:data:");
}

id objc_msgSend_postEvent_toSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postEvent:toSession:");
}

id objc_msgSend_predicateMatchingBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateMatchingBundleIdentifier:");
}

id objc_msgSend_prepareForPullConversation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prepareForPullConversation:");
}

id objc_msgSend_preventSpuriousScreenUndimWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preventSpuriousScreenUndimWithReason:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_registerEventID_options_handler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerEventID:options:handler:");
}

id objc_msgSend_relayMessage_toDeviceWithIdentifier_andModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "relayMessage:toDeviceWithIdentifier:andModel:");
}

id objc_msgSend_releaseCurrentIdleSleepAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseCurrentIdleSleepAssertion");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_resetCurrentSession_added_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetCurrentSession:added:completion:");
}

id objc_msgSend_resetDisplaySession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetDisplaySession:");
}

id objc_msgSend_resolvePauseState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resolvePauseState");
}

id objc_msgSend_resumeForEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeForEvent:");
}

id objc_msgSend_resumeStreamingForEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeStreamingForEvent:");
}

id objc_msgSend_saveUserPauseState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveUserPauseState:");
}

id objc_msgSend_scheduleNotification_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleNotification:data:");
}

id objc_msgSend_sendEventID_event_destinationID_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventID:event:destinationID:options:completion:");
}

id objc_msgSend_sendEventID_event_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendEventID:event:options:completion:");
}

id objc_msgSend_serviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceType");
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionID");
}

id objc_msgSend_sessionIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionIdentifier:");
}

id objc_msgSend_setClientDeviceModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientDeviceModel:");
}

id objc_msgSend_setClientName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientName:");
}

id objc_msgSend_setCompositeState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompositeState:");
}

id objc_msgSend_setControlFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setControlFlags:");
}

id objc_msgSend_setCurrentAttributionKey_andApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentAttributionKey:andApp:");
}

id objc_msgSend_setDedicatedDeviceChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDedicatedDeviceChangedHandler:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDestinationDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDestinationDevice:");
}

id objc_msgSend_setDiscoverySessionStateChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscoverySessionStateChangedHandler:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setErrorFlagsChangedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setErrorFlagsChangedHandler:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsDedicated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsDedicated:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPlacementStepSkipped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlacementStepSkipped:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setSessionEndedHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionEndedHandler:");
}

id objc_msgSend_setSessionStartHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionStartHandler:");
}

id objc_msgSend_setWillTerminate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWillTerminate:");
}

id objc_msgSend_setWombatMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWombatMode:");
}

id objc_msgSend_setupDisplayServer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupDisplayServer");
}

id objc_msgSend_setupRPRemoteDisplayDiscovery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupRPRemoteDisplayDiscovery");
}

id objc_msgSend_setupShieldLifecycleMonitorForCurrentSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupShieldLifecycleMonitorForCurrentSession");
}

id objc_msgSend_setupSidebandRPClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupSidebandRPClient");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shieldDidConnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shieldDidConnect");
}

id objc_msgSend_shieldDidDisconnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shieldDidDisconnect");
}

id objc_msgSend_sideButtonPressed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sideButtonPressed");
}

id objc_msgSend_sideButtonReleased(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sideButtonReleased");
}

id objc_msgSend_startListeningWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startListeningWithDelegate:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_tearDownShield(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tearDownShield");
}

id objc_msgSend_tearDownShieldUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tearDownShieldUI");
}

id objc_msgSend_teardownSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teardownSession");
}

id objc_msgSend_teardownShieldUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "teardownShieldUI");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_updateClientsWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateClientsWithConfiguration:");
}

id objc_msgSend_updateSystemStateForDeviceIdentifier_andModel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateSystemStateForDeviceIdentifier:andModel:");
}

id objc_msgSend_willChangeValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willChangeValueForKey:");
}

id objc_msgSend_willTerminate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willTerminate");
}
