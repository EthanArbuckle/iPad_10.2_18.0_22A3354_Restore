BAApplicationConfigurationOverrides *sub_100005124(uint64_t a1, void *a2)
{
  id v3;
  BAApplicationConfigurationOverrides *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  objc_opt_self(a1);
  v4 = objc_opt_new(BAApplicationConfigurationOverrides);
  v5 = sub_100005580();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v3));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("BAEssentialMaxInstallSize")));
    -[BAApplicationConfigurationOverrides setEssentialMaxInstallSize:](v4, "setEssentialMaxInstallSize:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("BAMaxInstallSize")));
    -[BAApplicationConfigurationOverrides setMaxInstallSize:](v4, "setMaxInstallSize:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("BAEssentialDownloadAllowance")));
    -[BAApplicationConfigurationOverrides setEssentialDownloadAllowance:](v4, "setEssentialDownloadAllowance:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("BADownloadAllowance")));
    -[BAApplicationConfigurationOverrides setDownloadAllowance:](v4, "setDownloadAllowance:", v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("BAManifestURL")));
    -[BAApplicationConfigurationOverrides setManifestURL:](v4, "setManifestURL:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", CFSTR("BADownloadDomainAllowList")));
    -[BAApplicationConfigurationOverrides setDomainAllowlist:](v4, "setDomainAllowlist:", v13);

  }
  return v4;
}

BOOL sub_1000052B4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
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
  _BOOL8 v23;

  v5 = a2;
  v6 = a3;
  objc_opt_self(a1);
  v7 = sub_100005580();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "manifestURL"));

    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "manifestURL"));
      objc_msgSend(v10, "setValue:forKey:", v12, CFSTR("BAManifestURL"));

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domainAllowlist"));

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "domainAllowlist"));
      objc_msgSend(v10, "setValue:forKey:", v14, CFSTR("BADownloadDomainAllowList"));

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "essentialMaxInstallSize"));

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "essentialMaxInstallSize"));
      objc_msgSend(v10, "setValue:forKey:", v16, CFSTR("BAEssentialMaxInstallSize"));

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "maxInstallSize"));

    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "maxInstallSize"));
      objc_msgSend(v10, "setValue:forKey:", v18, CFSTR("BAMaxInstallSize"));

    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "essentialDownloadAllowance"));

    if (v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "essentialDownloadAllowance"));
      objc_msgSend(v10, "setValue:forKey:", v20, CFSTR("BAEssentialDownloadAllowance"));

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "downloadAllowance"));

    if (v21)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "downloadAllowance"));
      objc_msgSend(v10, "setValue:forKey:", v22, CFSTR("BADownloadAllowance"));

    }
    objc_msgSend(v9, "setValue:forKey:", v10, v6);

  }
  else
  {
    objc_msgSend(v8, "removeObjectForKey:", v6);
  }
  CFPreferencesSetAppValue(CFSTR("InternalAppOverrides"), v9, CFSTR("com.apple.backgroundassets"));
  v23 = CFPreferencesAppSynchronize(CFSTR("com.apple.backgroundassets")) != 0;

  return v23;
}

id sub_100005580()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;

  objc_opt_self();
  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("InternalAppOverrides"), CFSTR("com.apple.backgroundassets"));
  v1 = v0;
  if (v0)
    v2 = objc_msgSend(v0, "mutableCopy");
  else
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v3 = v2;

  return v3;
}

void sub_100005680(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1000056F4(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10000576C(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1000061CC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void sub_10000621C(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleChallenge:authenticationHandler:", v6, v5);

}

void sub_100006280(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleChallenge:authenticationHandler:", v6, v5);

}

void sub_1000062E4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "downloadDidBegin:", *(_QWORD *)(a1 + 32));

}

void sub_100006324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleProgressWithBytesReceived:totalBytesRecieved:totalDownloadSize:resuming:", a2, a3, a4, a5);

}

void sub_100006380(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[2];

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v15;
  if (v11)
  {
    os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(*(id *)(a1 + 32), "downloadLock"));
    if (!sub_1000301EC(*(void **)(a1 + 32))
      && (*(_BYTE *)(a1 + 40) || objc_msgSend(*(id *)(a1 + 32), "necessity") != (id)1)
      || (v17 = objc_msgSend(*(id *)(a1 + 32), "amountDownloaded"), v17 == (id)sub_1000301EC(*(void **)(a1 + 32))))
    {
      os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(*(id *)(a1 + 32), "downloadLock"));
      objc_msgSend(*(id *)(a1 + 32), "_handleDownloadCompletionWithFileLocation:response:", v11, v13);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setStopRequest:", 0);
      os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(*(id *)(a1 + 32), "downloadLock"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      objc_msgSend(v18, "removeItemAtURL:error:", v11, 0);

      v19 = sub_1000273E4(CFSTR("BAURLDownloadErrorDomain"), 101);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      objc_msgSend(*(id *)(a1 + 32), "_handleDownloadFailureWithError:resumeData:response:", v20, 0, 0);

    }
LABEL_15:

    return;
  }
  if (!v12)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "domain"));
    v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("BAURLSessionErrorDomain"));

    if (v22)
    {
      if (objc_msgSend(v16, "code") == (id)100)
      {
        v32[0] = CFSTR("HTTPResponseStatusCode");
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", CFSTR("ResponseStatusCode")));
        v32[1] = CFSTR("HTTPResponseHeaders");
        v33[0] = v23;
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "userInfo"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKey:", CFSTR("ResponseHTTPHeaders")));
        v33[1] = v25;
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v33, v32, 2));

        sub_1000273EC(CFSTR("BAURLDownloadErrorDomain"), 100, v26);
        v28 = objc_claimAutoreleasedReturnValue(v27);

        v16 = (void *)v28;
      }
      else if (objc_msgSend(v16, "code") == (id)108)
      {
        objc_msgSend(*(id *)(a1 + 32), "setStopRequest:", 6);
      }
    }
    objc_msgSend(*(id *)(a1 + 32), "_handleDownloadFailureWithError:resumeData:response:", v16, v14, v13);
    goto LABEL_15;
  }
  v29 = sub_100012A44();
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    sub_100034EF4(a1, (uint64_t)v12, v30);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    sub_100034E74();
  qword_1000654C8 = (uint64_t)"BUG IN BackgroundAssets: BAURLDownload returned an NSData, which is highly unexpected.";
  qword_1000654F8 = 6;
  __break(1u);
}

void sub_100006944(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100006FC0(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "downloadDidPause:", *(_QWORD *)(a1 + 32));

}

void sub_100007104(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "downloadError"));
  objc_msgSend(v4, "download:failedWithError:", v2, v3);

}

void sub_100007248(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_1000072DC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100007378(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100007414(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_100007614(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100008E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

id sub_100008E34(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;

  v2 = sub_100012964();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100035054(a1, v3, v4);

  return objc_msgSend(*(id *)(a1 + 40), "invalidate");
}

void sub_100008E84(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;

  v2 = sub_100012964();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Extension invalidated for identifier: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  if (*(_QWORD *)(a1 + 40))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
    objc_msgSend(v5, "extensionDisconnectedWithIdentifier:connectionProxy:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void sub_100008F50(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a2;
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000350C4((uint64_t)v3, v5, v6);

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100008FB4(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100009184(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000351C8();

  v6 = *(_QWORD *)(a1 + 40);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
  (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  objc_msgSend(*(id *)(a1 + 32), "_checkForExit");
}

id sub_10000921C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_checkForExit");
}

void sub_100009394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000093AC(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100035260();

  objc_msgSend(*(id *)(a1 + 32), "_checkForExit");
}

id sub_100009420(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_checkForExit");
}

void sub_1000094C8(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  v3 = sub_100012964();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1000352F8();

}

void sub_100009654(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100035390();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_checkForExit");

}

id sub_1000096CC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_checkForExit");
}

void sub_100009824(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100035428();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "_checkForExit");

}

id sub_10000989C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "_checkForExit");
}

id sub_100009B64(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSentWillTerminateMessage:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setExtensionActiveCalls:", (char *)objc_msgSend(*(id *)(a1 + 32), "extensionActiveCalls") + 1);
}

id sub_100009C0C(uint64_t a1)
{
  id result;

  if (objc_msgSend(*(id *)(a1 + 32), "extensionActiveCalls"))
    objc_msgSend(*(id *)(a1 + 32), "setExtensionActiveCalls:", (char *)objc_msgSend(*(id *)(a1 + 32), "extensionActiveCalls") - 1);
  result = objc_msgSend(*(id *)(a1 + 32), "extensionActiveCalls");
  if (!result)
    return objc_msgSend(*(id *)(a1 + 32), "_startExitTimer");
  return result;
}

void sub_100009D0C(uint64_t a1)
{
  id v2;
  void *v3;
  double v4;
  unsigned __int8 v5;
  dispatch_time_t v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];

  v2 = objc_msgSend(*(id *)(a1 + 32), "extensionActiveCalls");
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationInfo"));
    objc_msgSend(v8, "extensionRuntime");
    if (v4 < 600.0)
    {

      return;
    }
    v5 = objc_msgSend(*(id *)(a1 + 32), "sentWillTerminateMessage");

    if ((v5 & 1) == 0)
      goto LABEL_7;
  }
  else if ((objc_msgSend(v3, "sentWillTerminateMessage") & 1) == 0)
  {
LABEL_7:
    objc_msgSend(*(id *)(a1 + 32), "setSentWillTerminateMessage:", 1);
    objc_msgSend(*(id *)(a1 + 32), "extensionWillTerminate");
    v6 = dispatch_time(0, 5000000000);
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "shutdownQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009E30;
    block[3] = &unk_100058998;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v6, v7, block);

  }
}

void sub_100009E30(uint64_t a1)
{
  id v2;
  void *v3;
  double v4;
  unsigned __int8 v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "extensionActiveCalls");
  v3 = *(void **)(a1 + 32);
  if (!v2)
  {
    if ((objc_msgSend(v3, "sentTerminatonMessage") & 1) != 0)
      return;
    goto LABEL_5;
  }
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationInfo"));
  objc_msgSend(v6, "extensionRuntime");
  if (v4 < 600.0)
  {

    return;
  }
  v5 = objc_msgSend(*(id *)(a1 + 32), "sentTerminatonMessage");

  if ((v5 & 1) == 0)
  {
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "setSentTerminatonMessage:", 1);
    objc_msgSend(*(id *)(a1 + 32), "invalidate");
  }
}

void sub_10000A2D4(uint64_t a1)
{
  id *v1;
  id v2;
  NSObject *v3;

  v1 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "extensionWakeAssertions"))
  {
    objc_msgSend(*v1, "setExtensionWakeAssertions:", (char *)objc_msgSend(*v1, "extensionWakeAssertions") - 1);
  }
  else
  {
    v2 = sub_100012964();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_1000354C0(v1, v3);

  }
}

id sub_10000A3D8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSentWillTerminateMessage:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setExtensionActiveCalls:", (char *)objc_msgSend(*(id *)(a1 + 32), "extensionActiveCalls") + 1);
  return objc_msgSend(*(id *)(a1 + 32), "setExtensionWakeAssertions:", (char *)objc_msgSend(*(id *)(a1 + 32), "extensionWakeAssertions") + 1);
}

void sub_10000A568(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t sub_10000A598()
{
  uint64_t v0;

  return v0;
}

void sub_10000A5A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_10000A5B0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void sub_10000A5BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000A990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A9B4(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "terminationAssertion"));
  objc_msgSend(v3, "removeObserver:", *(_QWORD *)(a1 + 32));

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void start()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_autoreleasePoolPush();
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSPort port](NSPort, "port"));
  objc_msgSend(v1, "addPort:forMode:", v2, NSRunLoopCommonModes);

  objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
  while (1)
  {
    v3 = objc_autoreleasePoolPush();
    objc_msgSend(v1, "run");
    objc_autoreleasePoolPop(v3);
  }
}

void sub_10000AF60(id a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v1 = sub_100018310((uint64_t)NSSet);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  v3 = (void *)qword_100065500;
  qword_100065500 = v2;

  v4 = (void *)qword_100065500;
  v15 = objc_opt_class(NSURL, v5);
  v16 = objc_opt_class(NSError, v6);
  v17 = objc_opt_class(NSData, v7);
  v18 = objc_opt_class(BADownload, v8);
  v19 = objc_opt_class(BAURLDownload, v9);
  v20 = objc_opt_class(BAManifestDownload, v10);
  v21 = objc_opt_class(BACloudKitDownload, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 7));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "setByAddingObjectsFromArray:", v12, v15, v16, v17, v18, v19, v20));
  v14 = (void *)qword_100065500;
  qword_100065500 = v13;

}

_QWORD *sub_10000B1A8(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD *v16;
  _QWORD *v17;
  objc_super v19;

  if (!a1)
    return 0;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLRequest requestWithURL:cachePolicy:timeoutInterval:](NSURLRequest, "requestWithURL:cachePolicy:timeoutInterval:", a2, 4, 60.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "applicationIdentifier"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "UUIDString"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.Manifest-%@"), v12, v14));
  v19.receiver = a1;
  v19.super_class = (Class)BAManifestDownload;
  v16 = objc_msgSendSuper2(&v19, "initWithIdentifier:request:essential:fileSize:applicationGroupIdentifier:priority:", v15, v11, 1, 0, v10, 1001);

  if (v16)
  {
    v16[24] = a3;
    if ((unint64_t)(a3 - 1) <= 1)
    {
      os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(v16, "downloadLock"));
      objc_msgSend(v16, "setIsForegroundDownload:", 1);
      os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(v16, "downloadLock"));
    }
  }
  v17 = v16;

  return v17;
}

uint64_t sub_10000B428(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 192);
  return result;
}

id *sub_10000B8B4(os_unfair_lock_s *a1)
{
  id *v1;
  os_unfair_lock_s *v2;

  v1 = (id *)a1;
  if (a1)
  {
    v2 = a1 + 2;
    os_unfair_lock_lock(a1 + 2);
    v1 = (id *)v1[4];
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

_QWORD *sub_10000B988(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_super v7;

  if (result)
  {
    v7.receiver = result;
    v7.super_class = (Class)BAAppStoreProgressInfoDescriptor;
    result = objc_msgSendSuper2(&v7, "init");
    if (result)
    {
      result[2] = a4;
      result[3] = a3;
      result[1] = a2;
    }
  }
  return result;
}

void sub_10000BF64(id a1)
{
  void *v1;
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "deviceIdentifierForVendor"));
  objc_msgSend(v1, "getUUIDBytes:", &unk_100065510);

}

const __CFString *sub_10000C400(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return *(&off_100058BD0 + a1);
}

void sub_10000DED0(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  v3 = sub_100012964();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100035754(v2, v4);

}

id sub_10000E438(id a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, uint64_t a8, uint64_t a9)
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  __SecTask *v34;
  __SecTask *v35;
  const __CFString *v36;
  const __CFString *v37;
  CFTypeID v38;
  uint64_t v39;
  id v40;
  uint64_t v42;
  uint64_t v43;
  id v44;
  objc_super v45;

  v42 = a8;
  v15 = a2;
  v16 = a3;
  v17 = a4;
  v44 = a5;
  v18 = a6;
  v20 = a7;
  if (a1)
  {
    v21 = objc_opt_class(NSString, v19);
    if ((objc_opt_isKindOfClass(v15, v21) & 1) == 0 || !objc_msgSend(v15, "length"))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("NSString *  must be a valid unique string."), 0, v42));
      objc_msgSend(v23, "raise");

    }
    if ((objc_msgSend(v16, "isMemberOfClass:", objc_opt_class(CKQuery, v22)) & 1) == 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Provided query must be a valid CKQuery."), 0));
      objc_msgSend(v25, "raise");

    }
    v26 = objc_opt_class(NSString, v24);
    if ((objc_opt_isKindOfClass(v17, v26) & 1) == 0 || !objc_msgSend(v17, "length"))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Provided assetKey must be a valid string."), 0, v42));
      objc_msgSend(v28, "raise");

    }
    v29 = objc_opt_class(NSString, v27);
    if ((objc_opt_isKindOfClass(v18, v29) & 1) == 0 || !objc_msgSend(v18, "length"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Provided containerIdentifier must be a valid string."), 0, v42));
      objc_msgSend(v31, "raise");

    }
    if ((objc_msgSend(v20, "isMemberOfClass:", objc_opt_class(CKRecordZoneID, v30)) & 1) == 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("Provided CKRecordZoneID must be a valid object."), 0));
      objc_msgSend(v32, "raise");

    }
    v45.receiver = a1;
    v45.super_class = (Class)BACloudKitDownload;
    v33 = v44;
    a1 = objc_msgSendSuper2(&v45, "initPrivatelyWithApplicationGroupIdentifier:", v44, v42);
    if (a1)
    {
      v34 = SecTaskCreateFromSelf(kCFAllocatorDefault);
      if (v34)
      {
        v35 = v34;
        v36 = (const __CFString *)SecTaskCopyValueForEntitlement(v34, CFSTR("com.apple.developer.icloud-container-environment"), 0);
        if (v36)
        {
          v37 = v36;
          v38 = CFGetTypeID(v36);
          if (v38 == CFStringGetTypeID())
          {
            v39 = 1;
            if (CFStringCompare(v37, CFSTR("production"), 1uLL))
              v39 = 2;
          }
          else
          {
            v39 = 2;
          }
          CFRelease(v37);
        }
        else
        {
          v39 = 2;
        }
        CFRelease(v35);
        v33 = v44;
      }
      else
      {
        v39 = 2;
      }
      objc_msgSend(a1, "setIdentifier:", v15);
      objc_msgSend(a1, "setPriority:", a9);
      v40 = objc_msgSend(objc_alloc((Class)CKContainerID), "initWithContainerIdentifier:environment:", v18, v39);
      objc_msgSend(a1, "setContainerID:", v40);

      objc_msgSend(a1, "setQuery:", v16);
      objc_msgSend(a1, "setAssetKey:", v17);
      objc_msgSend(a1, "setZoneID:", v20);
      objc_msgSend(a1, "setDatabaseScope:", v43);
    }
  }
  else
  {
    v33 = v44;
  }

  return a1;
}

void sub_10000EE54(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10000EEF8(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10000F090(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "awaitingConnectivityTimer"));
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
  {
    v4 = sub_100012A44();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v7 = *(_QWORD *)(a1 + 56);
      v9 = 138543618;
      v10 = v6;
      v11 = 2048;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "BAURLSession: Task %{public}@ timed out waiting for connectivity after %.1f seconds.", (uint8_t *)&v9, 0x16u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAURLSessionErrorDomain"), 108, 0));
    objc_msgSend(*(id *)(a1 + 32), "setMostRecentError:", v8);

    objc_msgSend(*(id *)(a1 + 48), "cancel");
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setAwaitingConnectivityTimer:", 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
}

void sub_10000F5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_unfair_lock_t lock)
{
  os_unfair_lock_unlock(lock);
  _Unwind_Resume(a1);
}

void sub_10000F5E0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 16))();
  objc_autoreleasePoolPop(v2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = 0;

}

void sub_100010398(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10001056C(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_100010688(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_100010730(uint64_t a1)
{
  void *v2;

  v2 = objc_autoreleasePoolPush();
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) + 16))();
  objc_autoreleasePoolPop(v2);
}

void sub_100010A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100010AA0(uint64_t a1, uint64_t a2, void *a3)
{
  os_unfair_lock_s *WeakRetained;
  NSObject *v5;
  BOOL v6;
  void *v7;
  dispatch_time_t v8;
  id v9;

  v9 = a3;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 48));
  v5 = *(id *)(a1 + 32);
  if (v5)
    v6 = WeakRetained == 0;
  else
    v6 = 1;
  if (!v6)
  {
    os_unfair_lock_lock(WeakRetained + 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[os_unfair_lock_s awaitingConnectivityTimer](WeakRetained, "awaitingConnectivityTimer"));

    if (!v7)
    {
      v8 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
      dispatch_source_set_timer(v5, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      -[os_unfair_lock_s setAwaitingConnectivityTimer:](WeakRetained, "setAwaitingConnectivityTimer:", v5);
      dispatch_resume(v5);

      v5 = 0;
    }
    os_unfair_lock_unlock(WeakRetained + 4);
  }
  if (v5)
  {
    dispatch_source_set_event_handler(v5, 0);
    dispatch_resume(v5);
    dispatch_source_cancel(v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void sub_100010CE4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = objc_autoreleasePoolPush();
  v3 = *(_QWORD *)(a1 + 56);
  v4 = (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) + 16))();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v5);

  objc_autoreleasePoolPop(v2);
}

void sub_1000113A0(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "baURLSessionDelegate"));
  objc_msgSend(v4, "cancelWithResumeData:", v3);

}

void sub_1000118D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000118F8(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;
  NSString *v11;
  void *v12;

  v11 = NSURLErrorFailingURLErrorKey;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "URL"));
  v12 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    v4 = 107;
  else
    v4 = 106;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100011A14;
  v7[3] = &unk_100058D60;
  v5 = *(NSObject **)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = v4;
  v8 = v3;
  v6 = v3;
  dispatch_async(v5, v7);

}

void sub_100011A14(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_autoreleasePoolPush();
  v3 = a1[5];
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BAURLSessionErrorDomain"), a1[6], a1[4]));
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, void *))(v3 + 16))(v3, 0, 0, 0, 0, v4);

  objc_autoreleasePoolPop(v2);
}

id *sub_100011BF8(id *a1, void *a2, void *a3, void *a4)
{
  id v8;
  id v9;
  id *v10;
  objc_super v12;

  v8 = a2;
  v9 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)BAAppStorePrepareDescriptor;
    v10 = (id *)objc_msgSendSuper2(&v12, "init");
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      a1[4] = a4;
    }
  }

  return a1;
}

id *sub_100011F6C(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10;
  id v11;
  id *v12;
  objc_super v14;

  v10 = a2;
  v11 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)BAAppStoreEventDescriptor;
    v12 = (id *)objc_msgSendSuper2(&v14, "init");
    a1 = v12;
    if (v12)
    {
      objc_storeStrong(v12 + 2, a2);
      objc_storeStrong(a1 + 3, a3);
      a1[4] = a4;
      a1[5] = a5;
      *((_WORD *)a1 + 4) = 0;
    }
  }

  return a1;
}

id sub_1000128F4()
{
  if (qword_100065530 != -1)
    dispatch_once(&qword_100065530, &stru_100058DA8);
  return (id)qword_100065528;
}

void sub_100012934(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.backgroundassets", "system");
  v2 = (void *)qword_100065528;
  qword_100065528 = (uint64_t)v1;

}

id sub_100012964()
{
  if (qword_100065540 != -1)
    dispatch_once(&qword_100065540, &stru_100058DC8);
  return (id)qword_100065538;
}

void sub_1000129A4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.backgroundassets", "client");
  v2 = (void *)qword_100065538;
  qword_100065538 = (uint64_t)v1;

}

id sub_1000129D4()
{
  if (qword_100065550 != -1)
    dispatch_once(&qword_100065550, &stru_100058DE8);
  return (id)qword_100065548;
}

void sub_100012A14(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.backgroundassets", "client_connection");
  v2 = (void *)qword_100065548;
  qword_100065548 = (uint64_t)v1;

}

id sub_100012A44()
{
  if (qword_100065560 != -1)
    dispatch_once(&qword_100065560, &stru_100058E08);
  return (id)qword_100065558;
}

void sub_100012A84(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.backgroundassets", "download");
  v2 = (void *)qword_100065558;
  qword_100065558 = (uint64_t)v1;

}

void sub_100012D00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001317C(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "token"));
  objc_msgSend(v2, "drainSpecificWithToken:", v3);

  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 48));
}

void sub_1000132C4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1000132E4(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x100013288);
}

void sub_100013488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000134A0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000134B0(uint64_t a1)
{

}

void sub_1000134B8(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "token"));
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void sub_1000136E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100013700(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  unsigned int v8;
  id v9;

  v9 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "token"));
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

void sub_100013818(id a1, BABlock *a2, unint64_t a3, BOOL *a4)
{
  -[BABlock executeWithSuccessfulDequeue:](a2, "executeWithSuccessfulDequeue:", 0, a4);
}

void sub_100013A24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100013B2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100013B9C(id a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v1 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v2 = (void *)qword_100065568;
  qword_100065568 = v1;

  v3 = (void *)qword_100065568;
  v4 = sub_100018310((uint64_t)NSSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "unionSet:", v5);

  v6 = (void *)qword_100065568;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BADownload classesForSerialization](BADownload, "classesForSerialization"));
  objc_msgSend(v6, "unionSet:", v7);

  v8 = (void *)qword_100065568;
  v11 = objc_opt_class(BADownloadQueue, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));
  objc_msgSend(v8, "addObjectsFromArray:", v10);

}

int64_t sub_100014C3C(id a1, BADownload *a2, BADownload *a3)
{
  return -[BADownload compare:](a2, "compare:", a3);
}

uint64_t sub_100015734(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_100015744(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_100015754(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_100015F54(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "download:failedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_100015F64(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "download:failedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_100015F74(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "download:failedWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t sub_100015F84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100016404(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = sub_1000272FC(101);
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);

}

void sub_10001644C(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = sub_1000272FC(109);
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);

}

void sub_100016494(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = sub_1000272FC(-110);
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v3);

}

uint64_t sub_1000164DC(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_100016CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100016D1C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100016D2C(uint64_t a1)
{

}

void sub_100016D34(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  BOOL v11;
  id v12;

  v12 = a2;
  v7 = objc_msgSend(v12, "state");
  v8 = objc_msgSend(v12, "necessity");
  v9 = objc_msgSend(v12, "necessity");
  if (*(_BYTE *)(a1 + 40))
    v10 = v8 == (id)1;
  else
    v10 = 0;
  if (v10)
    goto LABEL_9;
  if (!*(_BYTE *)(a1 + 41) || v9)
    goto LABEL_13;
  if (v8 == (id)1)
LABEL_9:
    v11 = 0;
  else
    v11 = *(_BYTE *)(a1 + 42) != 0;
  if ((unint64_t)v7 <= 1 && !v11)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
LABEL_13:

}

id sub_100016DF8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "download:failedWithError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40));
}

void sub_100017F04(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id sub_100017F60()
{
  id v0;
  int *v1;
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  int *v7;
  id v8;
  NSObject *v9;
  stat v11;

  memset(&v11, 0, sizeof(v11));
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/tmp"), "stringByAppendingPathComponent:", CFSTR("com.apple.backgroundassets"))));
  if (stat((const char *)objc_msgSend(v0, "fileSystemRepresentation", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
                         0,
                         0),
         &v11))
  {
    if (*__error() != 2)
    {
      v1 = __error();
      strerror(*v1);
      v2 = sub_1000128F4();
      v3 = objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        sub_100035CD4();

      return v0;
    }
  }
  else
  {
    if ((v11.st_mode & 0xF000) == 0x4000)
      return v0;
    v4 = sub_1000128F4();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100035C50((uint64_t)v0, &v11.st_mode, v5);

  }
  v6 = objc_retainAutorelease(v0);
  if (mkdir((const char *)objc_msgSend(v6, "fileSystemRepresentation"), 0x1FDu))
  {
    v7 = __error();
    strerror(*v7);
    v8 = sub_1000128F4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100035BF0();

  }
  else
  {
    chmod((const char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation"), 0x1FDu);
  }
  return v0;
}

uint64_t sub_1000180E0()
{
  objc_opt_self();
  if (qword_100065580 != -1)
    dispatch_once(&qword_100065580, &stru_100058FB8);
  return byte_100065578;
}

void sub_100018124(id a1)
{
  id v1;
  NSObject *v2;
  size_t v3;
  uint64_t v4;

  v3 = 8;
  v4 = 0;
  if (sysctlbyname("security.mac.amfi.developer_mode_status", &v4, &v3, 0, 0))
  {
    v1 = sub_1000128F4();
    v2 = objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_100035D34(v2);

  }
  else
  {
    byte_100065578 = v4 == 1;
  }
}

BOOL sub_1000181AC(uint64_t a1)
{
  id v1;
  NSObject *v2;
  int AppBooleanValue;
  BOOL v4;
  Boolean keyExistsAndHasValidFormat;

  objc_opt_self(a1);
  if (!CFPreferencesAppSynchronize(CFSTR("com.apple.appstored")))
  {
    v1 = sub_1000128F4();
    v2 = objc_claimAutoreleasedReturnValue(v1);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_100035DBC(v2);

  }
  keyExistsAndHasValidFormat = 0;
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("BackgroundAssetDownloadsEnabled"), CFSTR("com.apple.appstored"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    v4 = AppBooleanValue == 0;
  else
    v4 = 0;
  return !v4;
}

void sub_100018234(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

NSSet *sub_100018260(uint64_t a1)
{
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

  objc_opt_self(a1);
  v2 = objc_opt_class(NSDictionary, v1);
  v4 = objc_opt_class(NSArray, v3);
  v6 = objc_opt_class(NSString, v5);
  v8 = objc_opt_class(NSNumber, v7);
  v10 = objc_opt_class(NSData, v9);
  return +[NSSet setWithObjects:](NSSet, "setWithObjects:", v2, v4, v6, v8, v10, objc_opt_class(NSDate, v11), 0);
}

id sub_100018310(uint64_t a1)
{
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
  void *v11;
  void *v12;
  _QWORD v14[10];

  objc_opt_self(a1);
  v14[0] = objc_opt_class(NSData, v1);
  v14[1] = objc_opt_class(NSArray, v2);
  v14[2] = objc_opt_class(NSDictionary, v3);
  v14[3] = objc_opt_class(NSOrderedSet, v4);
  v14[4] = objc_opt_class(NSDate, v5);
  v14[5] = objc_opt_class(NSNumber, v6);
  v14[6] = objc_opt_class(NSString, v7);
  v14[7] = objc_opt_class(NSSet, v8);
  v14[8] = objc_opt_class(NSURL, v9);
  v14[9] = objc_opt_class(NSNull, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v14, 10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v11));

  return v12;
}

void sub_1000188A0(id a1)
{
  BAAgentCore *v1;
  void *v2;

  v1 = objc_alloc_init(BAAgentCore);
  v2 = (void *)qword_100065588;
  qword_100065588 = (uint64_t)v1;

}

id sub_100018E48(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_deserializeState");
  return objc_msgSend(*(id *)(a1 + 32), "_pokeScheduler");
}

void sub_100018E70()
{
  id v0;

  v0 = (id)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
  objc_msgSend(v0, "_backgroundActivityStateDidChange");

}

void sub_100018EA4(uint64_t a1, uint64_t a2)
{
  dispatch_queue_attr_t v4;
  dispatch_queue_t v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t buf[16];

  if ((sub_1000180E0() & 1) != 0)
  {
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue(v4);
    v5 = dispatch_queue_create("com.apple.backgroundassets.agentcore.lockdown.client", v8);
    objc_msgSend(*(id *)(a1 + 32), "_asyncAwaitLockdownClientMessage:waitQueue:", a2, v5);

  }
  else
  {
    v6 = sub_1000128F4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Rejecting lockdown connection as developer mode is not enabled.", buf, 2u);
    }

    lockdown_disconnect(a2);
  }
}

void sub_100019170(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  void *v9;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100019210;
  v6[3] = &unk_100059028;
  v2 = *(void **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = *(void **)(a1 + 48);
  v8 = v3;
  v9 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "workQueue"));
  objc_msgSend(v2, "callBlockWhenConnectionReady:onQueue:", v6, v5);

}

void sub_100019210(id *a1, char a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  unsigned int v12;
  id v13;
  NSObject *v14;
  unsigned int v15;
  const char *v16;
  id v17;
  unsigned int v18;
  int v19;
  unsigned int v20;

  if ((a2 & 1) == 0)
  {
    v13 = sub_1000129D4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(a1[4], "processIdentifier");
      v19 = 67240192;
      v20 = v15;
      v16 = "Client connection rejected (could not validate on connection setup) from pid:%{public}d";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, 8u);
    }
LABEL_13:

    objc_msgSend(a1[5], "invalidate");
    return;
  }
  v3 = a1[5];
  if (!v3)
    goto LABEL_10;
  v4 = a1[6];
  v5 = a1[4];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationBundleIdentifier"));
  LODWORD(v4) = objc_msgSend(v4, "_checkConnection:hasAllowedTeamIDForIdentifier:", v5, v6);

  if (!(_DWORD)v4
    || (v7 = a1[6],
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "applicationBundleIdentifier")),
        LODWORD(v7) = objc_msgSend(v7, "_checkIdentifierHasExtension:", v8),
        v8,
        !(_DWORD)v7))
  {
LABEL_10:
    v17 = sub_1000129D4();
    v14 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v18 = objc_msgSend(a1[4], "processIdentifier");
      v19 = 67240192;
      v20 = v18;
      v16 = "Client connection rejected (no extension, signing error or team-id mismatch) from pid:%{public}d";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "connections"));
  objc_msgSend(v9, "addObject:", a1[5]);

  objc_msgSend(a1[5], "resume");
  v10 = sub_1000129D4();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(a1[4], "processIdentifier");
    v19 = 67240192;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Client connection accepted from pid:%{public}d", (uint8_t *)&v19, 8u);
  }

}

id sub_1000195F8(id *a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  unsigned int v5;
  id v7;
  NSObject *v8;
  _DWORD v9[2];

  if (a1[4])
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "connections"));
    objc_msgSend(v2, "addObject:", a1[4]);

    v3 = sub_1000129D4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_msgSend(a1[6], "processIdentifier");
      v9[0] = 67240192;
      v9[1] = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "System connection accepted from pid:%{public}d", (uint8_t *)v9, 8u);
    }

    return objc_msgSend(a1[4], "resume");
  }
  else
  {
    v7 = sub_1000129D4();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      sub_100035FF4((uint64_t)a1);

    return objc_msgSend(a1[4], "invalidate");
  }
}

id sub_1000197A0(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connections"));
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

  v3 = *(_QWORD *)(a1 + 40);
  v5 = objc_opt_class(BAAgentClientConnection, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0)
  {
    v6 = *(id *)(a1 + 40);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "applicationBundleIdentifier"));
    if (v7)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connections", 0));
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
      {
        v11 = v9;
        v12 = *(_QWORD *)v20;
LABEL_5:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
          v15 = objc_opt_class(BAAgentClientConnection, v10);
          if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "applicationBundleIdentifier"));
            v17 = objc_msgSend(v16, "isEqual:", v7);

            if ((v17 & 1) != 0)
              break;
          }
          if (v11 == (id)++v13)
          {
            v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
            if (v11)
              goto LABEL_5;
            goto LABEL_12;
          }
        }
      }
      else
      {
LABEL_12:

        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connectionReplyQueue"));
        objc_msgSend(v8, "removeObjectForKey:", v7);
      }

    }
  }
  return objc_msgSend(*(id *)(a1 + 40), "connectionInvalidated");
}

void sub_100019A3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100019B4C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100019B5C(uint64_t a1)
{

}

void sub_100019B64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_downloaderExtensionForApplicationIdentifier:cacheOnly:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100019F28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_10001A034(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serializeApplicationState");
}

void sub_10001A34C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001A4D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001A58C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "appBundleIdentifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "applicationInfoForIdentifier:", v3));

  objc_msgSend(v6, "applicationPrepareWithDescriptor:", *(_QWORD *)(a1 + 40));
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "appBundleIdentifier"));
  objc_msgSend(v4, "_deleteDownloadQueueForIdentifier:", v5);

  objc_msgSend(*(id *)(a1 + 32), "_serializeApplicationState");
  objc_msgSend(*(id *)(a1 + 32), "_serializeDownloadQueues");

}

void sub_10001A6EC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  const __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;

  v2 = sub_100012964();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 56))
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "path"));
    v11 = 138543874;
    v12 = v5;
    v13 = 2114;
    v14 = v4;
    v15 = 2114;
    v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Placeholder ready for identifier: %{public}@ (UserInitiated: %{public}@, URL: %{public}@)", (uint8_t *)&v11, 0x20u);

  }
  if (_os_feature_enabled_impl("BackgroundAssets", "GreenTeaPlaceholder"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "applicationInfoForIdentifier:", *(_QWORD *)(a1 + 32)));
    v8 = sub_100012964();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543362;
      v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "GreenTeaPlaceholder Enabled: Potentially presenting network consent during placeholder install for identifier: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "_requestNetworkConsentWithApplication:userInitiated:", v7, *(unsigned __int8 *)(a1 + 56));
  }
}

id sub_10001AA4C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serializeDownloadQueues");
}

void sub_10001AB30(uint64_t a1, void *a2, void *a3)
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;
  id v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v15 = sub_100012964();
    v11 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      v17 = 138543874;
      v18 = v16;
      v19 = 2114;
      v20 = v5;
      v21 = 2114;
      v22 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Requesting consent for network access failed for identifier: %{public}@ (Policies: %{public}@, Error: %{public}@)", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    v8 = -[__CFString wifi](v5, "wifi");
    v9 = -[__CFString cellular](v5, "cellular");
    v10 = sub_100012964();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = CFSTR("NO");
      v13 = *(_QWORD *)(a1 + 32);
      if (v8 == (id)1)
        v14 = CFSTR("YES");
      else
        v14 = CFSTR("NO");
      v17 = 138543874;
      v18 = v13;
      v19 = 2114;
      if (v9 == (id)1)
        v12 = CFSTR("YES");
      v20 = v14;
      v21 = 2114;
      v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Network consent received for identifier: %{public}@. (Wi-Fi: %{public}@, Cellular: %{public}@)", (uint8_t *)&v17, 0x20u);
    }
  }

  objc_msgSend(*(id *)(a1 + 40), "setAwaitingNetworkConsent:", 0);
}

void sub_10001B930(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a3;
  if (v3)
  {
    v4 = sub_100012964();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000368A8();

  }
}

void sub_10001B994(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a3;
  if (v3)
  {
    v4 = sub_100012964();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100036914();

  }
}

void sub_10001B9F8(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_downloadQueueForIdentifier:create:error:", *(_QWORD *)(a1 + 40), 1, 0));
  objc_msgSend(v2, "thaw");
  objc_msgSend(*(id *)(a1 + 48), "applicationInstalled");
  objc_msgSend(*(id *)(a1 + 32), "_pokeScheduler");
  objc_msgSend(*(id *)(a1 + 32), "_serializeApplicationState");

}

void sub_10001BA58(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  if (v2)
  {
    v3 = sub_100012964();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100036980();

  }
}

id sub_10001BABC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleDownloads");
}

void sub_10001BCE4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unsigned __int8 v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id *v12;
  id *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v27 = 0;
  v28 = 0;
  v26 = 0;
  v4 = objc_msgSend(v2, "__schedulingPermittedWithIdentifier:downloadQueue:appInfo:error:", v3, &v28, &v27, &v26);
  v5 = v28;
  v6 = v27;
  v7 = v26;
  if ((v4 & 1) != 0)
  {
    if (objc_msgSend(v6, "initialRestrictionsAreEnforced"))
    {
      v9 = *(_QWORD *)(a1 + 56);
      v10 = objc_opt_class(BAManifestDownload, v8);
      LOBYTE(v9) = objc_opt_isKindOfClass(v9, v10);
      os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(*(id *)(a1 + 56), "downloadLock"));
      objc_msgSend(*(id *)(a1 + 56), "setApplicationInformationForRestrictedDownload:", v6);
      if ((v9 & 1) != 0)
      {
        if (objc_msgSend(v6, "initialBackgroundCellularPolicy"))
          objc_msgSend(*(id *)(a1 + 56), "setPermitInitialCellularDownload:", 1);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 56), "setIsForegroundDownload:", 0);
      }
      os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(*(id *)(a1 + 56), "downloadLock"));
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001BF00;
    v17[3] = &unk_100059140;
    v12 = &v18;
    v14 = *(_QWORD *)(a1 + 56);
    v18 = *(id *)(a1 + 48);
    v13 = &v22;
    v22 = *(id *)(a1 + 64);
    v19 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 32);
    v20 = v15;
    v21 = v16;
    objc_msgSend(v5, "scheduleDownload:completionHandler:", v14, v17);

  }
  else
  {
    v11 = *(NSObject **)(a1 + 48);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001BEF0;
    block[3] = &unk_100058F20;
    v12 = &v25;
    v25 = *(id *)(a1 + 64);
    v13 = &v24;
    v24 = v7;
    dispatch_async(v11, block);
  }

}

uint64_t sub_10001BEF0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_10001BF00(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[5];
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;

  v3 = a2;
  if (v3)
  {
    v4 = *(NSObject **)(a1 + 32);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C0E0;
    block[3] = &unk_100058F20;
    v17 = *(id *)(a1 + 64);
    v16 = v3;
    dispatch_async(v4, block);

    v5 = v17;
  }
  else
  {
    v6 = sub_1000128F4();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
      v9 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v19 = v8;
      v20 = 2114;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Scheduled download identifier: %{public}@ for client: %{public}@", buf, 0x16u);

    }
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "workQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10001C0F0;
    v14[3] = &unk_100058998;
    v14[4] = *(_QWORD *)(a1 + 56);
    dispatch_async(v10, v14);

    v11 = *(NSObject **)(a1 + 32);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001C118;
    v12[3] = &unk_100058F48;
    v13 = *(id *)(a1 + 64);
    dispatch_async(v11, v12);
    v5 = v13;
  }

}

uint64_t sub_10001C0E0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

id sub_10001C0F0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_pokeScheduler");
  return objc_msgSend(*(id *)(a1 + 32), "_serializeDownloadQueues");
}

uint64_t sub_10001C118(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001C20C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v30 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_downloadQueueForIdentifier:create:error:", v3, 1, &v30));
  v5 = v30;
  if (v4)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allDownloads"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v27;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIdentifier"));
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
          {

            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_10001C5B8;
            v20[3] = &unk_100059190;
            v19 = *(_QWORD *)(a1 + 48);
            v21 = *(id *)(a1 + 56);
            objc_msgSend(v4, "startForegroundDownload:completionHandler:", v19, v20);
            v18 = v21;
            goto LABEL_12;
          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        if (v8)
          continue;
        break;
      }
    }

    objc_msgSend(*(id *)(a1 + 48), "setApplicationIdentifier:", *(_QWORD *)(a1 + 40));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10001C470;
    v22[3] = &unk_1000591E0;
    v15 = *(_QWORD *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    v17 = *(_QWORD *)(a1 + 32);
    v25 = v16;
    v22[4] = v17;
    v23 = v4;
    v24 = *(id *)(a1 + 48);
    objc_msgSend(v23, "scheduleDownload:completionHandler:", v15, v22);

    v18 = v25;
LABEL_12:

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

void sub_10001C470(id *a1, uint64_t a2)
{
  NSObject *v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  if (a2)
  {
    (*((void (**)(void))a1[7] + 2))();
  }
  else
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "workQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001C538;
    block[3] = &unk_1000591B8;
    v5 = a1[5];
    v6 = a1[6];
    v7 = a1[7];
    dispatch_async(v3, block);

  }
}

void sub_10001C538(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD v3[4];
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001C5AC;
  v3[3] = &unk_100059190;
  v4 = *(id *)(a1 + 48);
  objc_msgSend(v1, "startForegroundDownload:completionHandler:", v2, v3);

}

uint64_t sub_10001C5AC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_10001C5B8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10001C680(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_downloadQueueForIdentifier:create:error:", v3, 0, &v6));
  v5 = v6;
  if (v4)
  {
    objc_msgSend(v4, "freeze");
    objc_msgSend(*(id *)(a1 + 32), "_serializeDownloadQueues");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10001C7D8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v6 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_downloadQueueForIdentifier:create:error:", v3, 0, &v6));
  v5 = v6;
  if (v4)
  {
    objc_msgSend(v4, "thaw");
    objc_msgSend(*(id *)(a1 + 32), "_pokeScheduler");
    objc_msgSend(*(id *)(a1 + 32), "_serializeDownloadQueues");
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void sub_10001C9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10001C9F0(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier"));
  v3 = *(void **)(a1 + 40);
  v26 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_downloadQueueForIdentifier:create:error:", v2, 0, &v26));
  v5 = v26;
  v6 = v26;
  v7 = v6;
  if (v4)
  {
    v20 = v6;
    v8 = sub_100012964();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v2;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "App (%{public}@) was canceled and removed by the App Store, all in-flight downloads will be canceled silently.", buf, 0xCu);
    }

    objc_msgSend(v4, "cancelAllDownloadsSilently");
    v21 = v4;
    objc_msgSend(v4, "thaw");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "unhandledDownloadEvents"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "download", v20));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "applicationIdentifier"));
          if (objc_msgSend(v18, "isEqualToString:", v2))
            objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v13);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "unhandledDownloadEvents"));
    objc_msgSend(v19, "removeObjectsInArray:", v10);

    objc_msgSend(*(id *)(a1 + 40), "_serializeUndeliveredEvents");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;

    v7 = v20;
    v4 = v21;
  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v5);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  }

}

void sub_10001CD34(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v12 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_downloadQueueForIdentifier:create:error:", v3, 0, &v12));
  v5 = v12;
  if (v4)
  {
    v6 = a1[6];
    v11 = 0;
    v7 = objc_msgSend(v4, "cancelDownload:error:", v6, &v11);
    v8 = v11;
    if (v7)
    {
      v9 = 1;
      v10 = 0;
    }
    else
    {
      v9 = 0;
      v10 = v8;
    }
    (*(void (**)(_QWORD, uint64_t, id))(a1[7] + 16))(a1[7], v9, v10);

  }
  else
  {
    (*(void (**)(void))(a1[7] + 16))();
  }

}

void sub_10001CF24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001CF3C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_downloadQueueForIdentifier:create:error:", *(_QWORD *)(a1 + 40), 0, 0));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10001D078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10001D090(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_downloadQueueForIdentifier:create:error:", *(_QWORD *)(a1 + 40), 0, 0));
  v7 = v2;
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allDownloads"));
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = &__NSArray0__struct;
  }

}

void sub_10001D55C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001D580(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001D5F4;
  v3[3] = &unk_1000592D0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v1 = objc_claimAutoreleasedReturnValue(+[RBSProcessMonitor monitorWithConfiguration:](RBSProcessMonitor, "monitorWithConfiguration:", v3));
  v2 = (void *)qword_100065598;
  qword_100065598 = v1;

}

void sub_10001D5F4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v3 = a2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessStateDescriptor descriptor](RBSProcessStateDescriptor, "descriptor"));
  objc_msgSend(v4, "setValues:", 1);
  objc_msgSend(v4, "setEndowmentNamespaces:", &off_10005BEF8);
  objc_msgSend(v3, "setStateDescriptor:", v4);
  objc_msgSend(v3, "setEvents:", 1);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D6B8;
  v5[3] = &unk_1000592A8;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setUpdateHandler:", v5);

}

id sub_10001D6B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processRunningBoardStateUpdate:forProcess:", a4, a3);
}

id sub_10001D6CC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPredicates:", *(_QWORD *)(a1 + 32));
}

void sub_10001DA00(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "bundleIdentifier"));
  objc_msgSend(v2, "_updateStateForAppExtensionBundleIdentifier:appBundleIdentifier:state:", v4, v3, *(_QWORD *)(a1 + 56));

}

void sub_10001DA68(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
  objc_msgSend(v2, "_updateStateForAppBundleIdentifier:state:", v3, *(_QWORD *)(a1 + 48));

}

void sub_10001DF50(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationInfoForIdentifier:", *(_QWORD *)(a1 + 40)));
  objc_msgSend(*(id *)(a1 + 32), "__handleApplicationLaunchedWithInfo:", v2);

}

int64_t sub_10001E724(id a1, BADownloadQueue *a2, BADownloadQueue *a3)
{
  BADownloadQueue *v4;
  BADownloadQueue *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = -[BADownloadQueue numberOfActiveDownloads](v4, "numberOfActiveDownloads");
  if (v6 >= -[BADownloadQueue numberOfActiveDownloads](v5, "numberOfActiveDownloads"))
  {
    v8 = -[BADownloadQueue numberOfActiveDownloads](v4, "numberOfActiveDownloads");
    if (v8 <= -[BADownloadQueue numberOfActiveDownloads](v5, "numberOfActiveDownloads"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue lastDownloadStartDate](v4, "lastDownloadStartDate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BADownloadQueue lastDownloadStartDate](v5, "lastDownloadStartDate"));
      v7 = (int64_t)objc_msgSend(v9, "compare:", v10);

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

void sub_10001E8CC(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[5];
  id v25;
  __int128 *p_buf;
  uint8_t v27[4];
  uint64_t v28;
  uint64_t v29;
  uint8_t v30[128];
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v2 = sub_100012A44();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Download did begin: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = sub_100019B4C;
  v34 = sub_100019B5C;
  v35 = 0;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001EBF4;
  block[3] = &unk_100059258;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  p_buf = &buf;
  block[4] = v6;
  v25 = v7;
  dispatch_sync(v5, block);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v12, "isActive") & 1) != 0)
        {
          v29 = *(_QWORD *)(a1 + 32);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
          objc_msgSend(v12, "syncDownloads:", v13);

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier"));
          objc_msgSend(v12, "downloadIdentifierDidBegin:", v14);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v9);
  }

  v15 = sub_100012A44();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v27 = 138543362;
    v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Download did begin finished: %{public}@", v27, 0xCu);
  }

  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "workQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001EC30;
  v19[3] = &unk_100058998;
  v19[4] = *(_QWORD *)(a1 + 40);
  dispatch_sync(v18, v19);

  _Block_object_dispose(&buf, 8);
}

void sub_10001EBC4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10001EBF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_connectionsForApplicationIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id sub_10001EC30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serializeDownloadQueues");
}

void sub_10001ED18(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  _QWORD v19[5];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[5];
  id v25;
  __int128 *p_buf;
  uint8_t v27[4];
  uint64_t v28;
  uint64_t v29;
  uint8_t v30[128];
  __int128 buf;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v2 = sub_100012A44();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Download did pause: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v32 = 0x3032000000;
  v33 = sub_100019B4C;
  v34 = sub_100019B5C;
  v35 = 0;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F040;
  block[3] = &unk_100059258;
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(void **)(a1 + 48);
  p_buf = &buf;
  block[4] = v6;
  v25 = v7;
  dispatch_sync(v5, block);

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v12, "isActive") & 1) != 0)
        {
          v29 = *(_QWORD *)(a1 + 32);
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
          objc_msgSend(v12, "syncDownloads:", v13);

          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier"));
          objc_msgSend(v12, "downloadIdentifierDidPause:", v14);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v30, 16);
    }
    while (v9);
  }

  v15 = sub_100012A44();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)v27 = 138543362;
    v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Download did pause finished: %{public}@", v27, 0xCu);
  }

  v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "workQueue"));
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10001F07C;
  v19[3] = &unk_100058998;
  v19[4] = *(_QWORD *)(a1 + 40);
  dispatch_sync(v18, v19);

  _Block_object_dispose(&buf, 8);
}

void sub_10001F010(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_10001F040(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_connectionsForApplicationIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id sub_10001F07C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serializeDownloadQueues");
}

void sub_10001F1C0(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  dispatch_time_t v14;
  intptr_t v15;
  uint64_t *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  _QWORD v40[8];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  NSLock *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  void (*v59)(uint64_t);
  id v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD block[5];
  id v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint8_t buf[4];
  uint64_t v75;
  __int16 v76;
  uint64_t v77;
  uint64_t v78;
  _BYTE v79[128];

  v68 = 0;
  v69 = &v68;
  v70 = 0x3032000000;
  v71 = sub_100019B4C;
  v72 = sub_100019B5C;
  v73 = 0;
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F814;
  block[3] = &unk_100059258;
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v67 = &v68;
  block[4] = v4;
  v66 = v3;
  dispatch_sync(v2, block);

  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 2;
  v55 = 0;
  v56 = &v55;
  v57 = 0x3032000000;
  v58 = sub_100019B4C;
  v59 = sub_100019B5C;
  v60 = 0;
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = sub_100019B4C;
  v49 = sub_100019B5C;
  v50 = objc_opt_new(NSLock);
  v5 = dispatch_group_create();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = (id)v69[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v79, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "isActive") & 1) != 0)
        {
          v78 = *(_QWORD *)(a1 + 48);
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v78, 1));
          objc_msgSend(v10, "syncDownloads:", v11);

          dispatch_group_enter(v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "uniqueIdentifier"));
          v13 = *(_QWORD *)(a1 + 56);
          v40[0] = _NSConcreteStackBlock;
          v40[1] = 3221225472;
          v40[2] = sub_10001F850;
          v40[3] = &unk_100059360;
          v40[4] = &v45;
          v40[5] = &v51;
          v40[6] = &v61;
          v40[7] = &v55;
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_10001F8E8;
          v37[3] = &unk_100059388;
          v38 = v5;
          v39 = *(id *)(a1 + 64);
          objc_msgSend(v10, "downloadIdentifier:didReceiveChallenge:authChallengeHandler:withCompletion:", v12, v13, v40, v37);

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v79, 16);
    }
    while (v7);
  }

  v14 = dispatch_time(0, 30000000000);
  v15 = dispatch_group_wait(v5, v14);
  objc_msgSend((id)v46[5], "lock");
  v16 = v52;
  if (v15 && !*((_BYTE *)v52 + 24))
  {
    v17 = sub_100012964();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_100036C2C();

    v16 = v52;
  }
  if (!*((_BYTE *)v16 + 24))
  {
    *((_BYTE *)v16 + 24) = 1;
    objc_msgSend((id)v46[5], "unlock");
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_downloaderExtensionForApplicationIdentifier:cacheOnly:", *(_QWORD *)(a1 + 40), 0));
    v21 = v20;
    if (v20)
    {
      if ((objc_msgSend(v20, "sendAuthenticationChallenge:download:completionHandler:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72)) & 1) != 0)
      {
LABEL_35:

        goto LABEL_36;
      }
      v22 = sub_100012964();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_100036BBC();

      v24 = *(_QWORD *)(a1 + 72);
      v25 = 2;
LABEL_32:
      (*(void (**)(uint64_t, uint64_t, _QWORD))(v24 + 16))(v24, v25, 0);
      goto LABEL_35;
    }
    v26 = sub_100012964();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = *(_QWORD *)(a1 + 40);
      v29 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      v75 = v28;
      v76 = 2114;
      v77 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Cannot message extension for '%{public}@' to answer auth challenge, performing default handling for download: %{public}@", buf, 0x16u);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "protectionSpace"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "authenticationMethod"));
    if (objc_msgSend(v31, "isEqualToString:", NSURLAuthenticationMethodServerTrust))
    {
      v32 = objc_msgSend(*(id *)(a1 + 56), "previousFailureCount") == 0;

      if (v32)
      {
        v33 = *(_QWORD *)(a1 + 72);
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "protectionSpace"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLCredential credentialForTrust:](NSURLCredential, "credentialForTrust:", objc_msgSend(v34, "serverTrust")));
        (*(void (**)(uint64_t, _QWORD, void *))(v33 + 16))(v33, 0, v35);

        goto LABEL_34;
      }
    }
    else
    {

    }
    v36 = objc_msgSend(*(id *)(a1 + 56), "previousFailureCount");
    v24 = *(_QWORD *)(a1 + 72);
    if (v36)
    {
      v25 = 1;
      goto LABEL_32;
    }
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "proposedCredential"));
    (*(void (**)(uint64_t, _QWORD, void *))(v24 + 16))(v24, 0, v34);
LABEL_34:

    goto LABEL_35;
  }
  v19 = *(_QWORD *)(a1 + 72);
  if (v19)
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 16))(v19, v62[3], v56[5]);
  objc_msgSend((id)v46[5], "unlock");
LABEL_36:

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v68, 8);

}

void sub_10001F798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a61, 8);
  _Unwind_Resume(a1);
}

void sub_10001F814(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_connectionsForApplicationIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10001F850(_QWORD *a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  id v7;

  v7 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "lock");
  v6 = *(_QWORD *)(a1[5] + 8);
  if (!*(_BYTE *)(v6 + 24))
  {
    *(_BYTE *)(v6 + 24) = 1;
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = a2;
    objc_storeStrong((id *)(*(_QWORD *)(a1[7] + 8) + 40), a3);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "unlock");

}

void sub_10001F8E8(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_10001FA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_10001FAB0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_connectionsForApplicationIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10001FAEC(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v7, "isActive", (_QWORD)v9))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier"));
          objc_msgSend(v7, "downloadIdentifier:didWriteBytes:totalBytesWritten:totalBytesExpectedToWrite:", v8, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

id sub_10001FE70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateContentRequestTelemetryForCompletedDownload:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

id sub_10001FE80(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;

  v2 = sub_100012964();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Awaiting app install for %{public}@. Deferring failure delivery for %{public}@", (uint8_t *)&v8, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "unhandledDownloadEvents"));
  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "_serializeUndeliveredEvents");
  return objc_msgSend(*(id *)(a1 + 48), "_pokeScheduler");
}

void sub_10001FF5C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  NSObject *group;
  _QWORD v36[5];
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  id v40;
  uint64_t v41;
  id v42;
  _QWORD *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  uint64_t v47;
  id v48;
  _QWORD v49[5];
  id v50;
  NSObject *v51;
  id v52;
  uint64_t *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _QWORD block[5];
  id v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t (*v68)(uint64_t, uint64_t);
  void (*v69)(uint64_t);
  id v70;
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  uint64_t v74;
  _BYTE v75[128];

  v2 = sub_100012A44();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    sub_100036CCC();

  v65 = 0;
  v66 = &v65;
  v67 = 0x3032000000;
  v68 = sub_100019B4C;
  v69 = sub_100019B5C;
  v70 = 0;
  v61 = 0;
  v62 = &v61;
  v63 = 0x2020000000;
  v64 = 0;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000204D4;
  block[3] = &unk_100059258;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v60 = &v65;
  block[4] = v5;
  v59 = v6;
  dispatch_sync(v4, block);

  group = dispatch_group_create();
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v7 = (id)v66[5];
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v11, "isActive") & 1) != 0)
        {
          v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "asyncClientNotificationQueue"));
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_100020510;
          v49[3] = &unk_100059400;
          v49[4] = v11;
          v50 = *(id *)(a1 + 32);
          v13 = group;
          v51 = v13;
          v52 = *(id *)(a1 + 40);
          v53 = &v61;
          dispatch_group_async(v13, v12, v49);

        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v54, v75, 16);
    }
    while (v8);
  }

  v14 = dispatch_time(0, 120000000000);
  dispatch_group_wait(group, v14);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100020630;
  v44[3] = &unk_100059050;
  v45 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v46 = v15;
  v47 = v16;
  v48 = *(id *)(a1 + 64);
  v17 = objc_retainBlock(v44);
  if (!*((_BYTE *)v62 + 24))
  {
    if (objc_msgSend(*(id *)(a1 + 72), "allowsBackgroundActivity"))
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "_downloaderExtensionForApplicationIdentifier:cacheOnly:", *(_QWORD *)(a1 + 56), 0));
      if (v18)
      {
        v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "asyncClientNotificationQueue"));
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_10002071C;
        v37[3] = &unk_100059450;
        v18 = v18;
        v38 = v18;
        v39 = *(id *)(a1 + 32);
        v20 = *(id *)(a1 + 40);
        v21 = *(_QWORD *)(a1 + 48);
        v40 = v20;
        v41 = v21;
        v43 = v17;
        v42 = *(id *)(a1 + 64);
        dispatch_async(v19, v37);

      }
    }
    else
    {
      v22 = sub_100012964();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = *(_QWORD *)(a1 + 56);
        *(_DWORD *)buf = 136315394;
        v72 = "-[BAAgentCore download:failedWithError:]_block_invoke";
        v73 = 2114;
        v74 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s, Will not message extension for %{public}@ because background activity is disabled.", buf, 0x16u);
      }

      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "workQueue"));
      dispatch_async(v18, v17);
    }

  }
  v25 = sub_100012A44();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    sub_100036C9C(v26, v27, v28, v29, v30, v31, v32, v33);

  v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "workQueue"));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100020838;
  v36[3] = &unk_100058998;
  v36[4] = *(_QWORD *)(a1 + 48);
  dispatch_sync(v34, v36);

  _Block_object_dispose(&v61, 8);
  _Block_object_dispose(&v65, 8);

}

void sub_10002048C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Unwind_Resume(a1);
}

void sub_1000204D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_connectionsForApplicationIdentifier:", *(_QWORD *)(a1 + 40)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_100020510(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  objc_msgSend(v2, "syncDownloads:", v3);

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100020614;
  v7[3] = &unk_100058A60;
  v6 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 64);
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v4, "downloadIdentifier:didFailWithError:wasHandled:", v5, v6, v7);

}

void sub_100020614(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_100020630(uint64_t a1)
{
  BAUnhandledDownloadEvent *v2;
  void *v3;
  id v4;
  NSObject *v5;
  int v6;
  BAUnhandledDownloadEvent *v7;

  v2 = -[BAUnhandledDownloadEvent initWithEventType:download:error:]([BAUnhandledDownloadEvent alloc], "initWithEventType:download:error:", 2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "unhandledDownloadEvents"));
  objc_msgSend(v3, "addObject:", v2);

  objc_msgSend(*(id *)(a1 + 48), "_serializeUndeliveredEvents");
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Added undelivered event: %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

void sub_10002071C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000207D0;
  v7[3] = &unk_100059428;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 56);
  v8 = v5;
  v9 = v6;
  v11 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v3, "backgroundDownload:failedWithError:completionHandler:", v5, v4, v7);

}

void sub_1000207D0(uint64_t a1, char a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  if ((a2 & 1) == 0)
  {
    v3 = sub_1000128F4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100036D34();

    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "workQueue"));
    dispatch_async(v5, *(dispatch_block_t *)(a1 + 56));

  }
}

id sub_100020838(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_serializeDownloadQueues");
  return objc_msgSend(*(id *)(a1 + 32), "_pokeScheduler");
}

id sub_100020AF4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateContentRequestTelemetryForCompletedDownload:error:", *(_QWORD *)(a1 + 40), 0);
}

id sub_100020B04(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;

  v2 = sub_100012964();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier"));
    v5 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v4;
    v10 = 2114;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Awaiting app install for %{public}@. Deferring success delivery for %{public}@", (uint8_t *)&v8, 0x16u);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "unhandledDownloadEvents"));
  objc_msgSend(v6, "addObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "_serializeUndeliveredEvents");
  return objc_msgSend(*(id *)(a1 + 48), "_pokeScheduler");
}

void sub_100020BFC(id *a1)
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  dispatch_time_t v16;
  unsigned __int8 v17;
  id v18;
  id v19;
  _QWORD *v20;
  id v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  const char *v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  const char *v40;
  id v41;
  void *v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *group;
  _QWORD v47[5];
  id v48;
  _QWORD v49[4];
  NSObject *v50;
  id v51;
  id v52;
  id v53;
  _QWORD *v54;
  _QWORD v55[4];
  id v56;
  id v57;
  id v58;
  _QWORD v59[5];
  id v60;
  id v61;
  id v62;
  NSObject *v63;
  uint64_t *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD block[5];
  id v70;
  __int128 *p_buf;
  uint64_t v72;
  unsigned __int8 *v73;
  uint64_t v74;
  char v75;
  uint8_t v76[4];
  const char *v77;
  __int16 v78;
  void *v79;
  uint8_t v80[128];
  __int128 buf;
  uint64_t v82;
  uint64_t (*v83)(uint64_t, uint64_t);
  void (*v84)(uint64_t);
  id v85;

  v2 = sub_100012A44();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[4];
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Download did finish: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v82 = 0x3032000000;
  v83 = sub_100019B4C;
  v84 = sub_100019B5C;
  v85 = 0;
  v72 = 0;
  v73 = (unsigned __int8 *)&v72;
  v74 = 0x2020000000;
  v75 = 0;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000212E8;
  block[3] = &unk_100059258;
  v6 = a1[5];
  v7 = a1[6];
  p_buf = &buf;
  block[4] = v6;
  v70 = v7;
  dispatch_sync(v5, block);

  group = dispatch_group_create();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v8 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v12, "isActive") & 1) != 0)
        {
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "asyncClientNotificationQueue"));
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472;
          v59[2] = sub_100021344;
          v59[3] = &unk_1000594A0;
          v59[4] = v12;
          v14 = a1[4];
          v15 = a1[5];
          v60 = v14;
          v61 = v15;
          v62 = a1[7];
          v63 = group;
          v64 = &v72;
          dispatch_group_async(v63, v13, v59);

        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v65, v80, 16);
    }
    while (v9);
  }

  v16 = dispatch_time(0, 120000000000);
  dispatch_group_wait(group, v16);
  v17 = atomic_load(v73 + 24);
  if ((v17 & 1) != 0)
  {
    v28 = sub_100012964();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v30 = (const char *)a1[4];
      *(_DWORD *)v76 = 138543362;
      v77 = v30;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Result was handled by a client of BADownloadManager, removing download. %{public}@", v76, 0xCu);
    }

    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v33 = sub_100030230(a1[4], v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    objc_msgSend(v31, "removeItemAtURL:error:", v34, 0);

  }
  else
  {
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000215D0;
    v55[3] = &unk_100058E30;
    v18 = a1[4];
    v19 = a1[5];
    v56 = v18;
    v57 = v19;
    v58 = a1[7];
    v20 = objc_retainBlock(v55);
    if (objc_msgSend(a1[6], "allowsBackgroundActivity"))
    {
      v21 = a1[5];
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "applicationIdentifier"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "_downloaderExtensionForApplicationIdentifier:cacheOnly:", v22, 0));

      if (v23)
      {
        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "asyncClientNotificationQueue"));
        v49[0] = _NSConcreteStackBlock;
        v49[1] = 3221225472;
        v49[2] = sub_1000216C0;
        v49[3] = &unk_100059168;
        v50 = v23;
        v25 = a1[4];
        v26 = a1[5];
        v51 = v25;
        v52 = v26;
        v54 = v20;
        v53 = a1[7];
        dispatch_async(v24, v49);

        v27 = v50;
      }
      else
      {
        v38 = sub_1000128F4();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          sub_100036E14();

        v27 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v41 = sub_100030230(a1[4], v40);
        v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
        -[NSObject removeItemAtURL:error:](v27, "removeItemAtURL:error:", v42, 0);

      }
    }
    else
    {
      v35 = sub_100012964();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "applicationIdentifier"));
        *(_DWORD *)v76 = 136315394;
        v77 = "-[BAAgentCore download:finishedWithFileURL:]_block_invoke";
        v78 = 2114;
        v79 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s, Will not message extension for %{public}@ because background activity is disabled.", v76, 0x16u);

      }
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "workQueue"));
      dispatch_async(v23, v20);
    }

    v31 = v56;
  }

  v43 = sub_100012A44();
  v44 = objc_claimAutoreleasedReturnValue(v43);
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v76 = 0;
    _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Download did finish done.", v76, 2u);
  }

  v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "workQueue"));
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100021AB4;
  v47[3] = &unk_100058A10;
  v47[4] = a1[5];
  v48 = a1[7];
  dispatch_sync(v45, v47);

  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&buf, 8);

}

void sub_100021290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  uint64_t v59;

  _Block_object_dispose(&a59, 8);
  _Block_object_dispose((const void *)(v59 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1000212E8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "_connectionsForApplicationIdentifier:", v6));
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_100021344(uint64_t a1, const char *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  int *v20;
  char *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  char *v39;

  v3 = *(void **)(a1 + 32);
  v4 = sub_100030230(*(id *)(a1 + 40), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "extendClientSandboxForStagedURL:allowWrites:", v5, 0));

  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v30 = *(_QWORD *)(a1 + 40);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
    objc_msgSend(v7, "syncDownloads:", v8);

    dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
    v9 = *(void **)(a1 + 32);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000215B0;
    v26[3] = &unk_100059478;
    v11 = *(void **)(a1 + 64);
    v29 = *(_QWORD *)(a1 + 72);
    v27 = v11;
    v28 = *(id *)(a1 + 56);
    objc_msgSend(v9, "downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:", v10, v6, v26);

    v12 = v27;
  }
  else
  {
    v13 = sub_1000128F4();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(void **)(a1 + 40);
      v17 = sub_100030230(v16, v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationBundleIdentifier"));
      v20 = __error();
      v21 = strerror(*v20);
      *(_DWORD *)buf = 138544130;
      v33 = v16;
      v34 = 2114;
      v35 = v18;
      v36 = 2114;
      v37 = v19;
      v38 = 2082;
      v39 = v21;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Warning: No sandbox token issued for finished download: %{public}@ URL: %{public}@ for client: %{public}@. -- %{public}s", buf, 0x2Au);

    }
    v12 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v22 = sub_1000272FC(-107);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    sub_10002FBB8(v12, -1);
    v24 = *(void **)(a1 + 32);
    v31 = v12;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 1));
    objc_msgSend(v24, "syncDownloads:", v25);

    objc_msgSend(*(id *)(a1 + 48), "download:failedWithError:", v12, v23);
  }

}

void sub_1000215B0(uint64_t a1, int a2)
{
  if (a2)
    atomic_store(1u, (unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void sub_1000215D0(uint64_t a1)
{
  BAUnhandledDownloadEvent *v2;
  void *v3;
  id v4;
  NSObject *v5;
  int v6;
  BAUnhandledDownloadEvent *v7;

  v2 = -[BAUnhandledDownloadEvent initWithEventType:download:error:]([BAUnhandledDownloadEvent alloc], "initWithEventType:download:error:", 1, *(_QWORD *)(a1 + 32), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "unhandledDownloadEvents"));
  objc_msgSend(v3, "addObject:", v2);

  objc_msgSend(*(id *)(a1 + 40), "_serializeUndeliveredEvents");
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Added undelivered event: %{public}@", (uint8_t *)&v6, 0xCu);
  }

}

void sub_1000216C0(uint64_t a1, const char *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  const char *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;

  v3 = *(void **)(a1 + 32);
  v4 = sub_100030230(*(id *)(a1 + 40), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "extendClientSandboxForStagedURL:allowWrites:", v5, 0));

  if (v6)
  {
    v8 = *(void **)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100021988;
    v23[3] = &unk_100059428;
    v9 = v7;
    v10 = *(_QWORD *)(a1 + 48);
    v24 = v9;
    v25 = v10;
    v27 = *(id *)(a1 + 64);
    v26 = *(id *)(a1 + 56);
    objc_msgSend(v8, "backgroundDownload:finishedWithSandboxToken:completionHandler:", v9, v6, v23);

    v11 = v24;
  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v12 = sub_1000128F4();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = sub_100030230(v11, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
      *(_DWORD *)buf = 138543874;
      v34 = v11;
      v35 = 2114;
      v36 = v16;
      v37 = 2114;
      v38 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Warning: No sandbox token issued for extension for finished download: %{public}@ URL: %{public}@ for client: %{public}@", buf, 0x20u);

    }
    v18 = sub_1000272FC(-107);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    sub_10002FBB8(v11, -1);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100021920;
    v28[3] = &unk_100059428;
    v20 = *(void **)(a1 + 32);
    v21 = *(id *)(a1 + 40);
    v22 = *(_QWORD *)(a1 + 48);
    v29 = v21;
    v30 = v22;
    v32 = *(id *)(a1 + 64);
    v31 = *(id *)(a1 + 56);
    objc_msgSend(v20, "backgroundDownload:failedWithError:completionHandler:", v11, v19, v28);

  }
}

void sub_100021920(uint64_t a1, char a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  if ((a2 & 1) == 0)
  {
    v3 = sub_1000128F4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100036E78();

    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "workQueue"));
    dispatch_async(v5, *(dispatch_block_t *)(a1 + 56));

  }
}

void sub_100021988(id *a1, char a2)
{
  id v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;

  if ((a2 & 1) != 0)
  {
    v3 = sub_100012964();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = a1[4];
      v12 = 138543362;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Extension handled the background download, removing download. %{public}@", (uint8_t *)&v12, 0xCu);
    }

    v6 = objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = sub_100030230(a1[4], v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NSObject removeItemAtURL:error:](v6, "removeItemAtURL:error:", v9, 0);

  }
  else
  {
    v10 = sub_1000128F4();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_100036ED8();

    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "workQueue"));
    dispatch_async(v6, a1[7]);
  }

}

id sub_100021AB4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_serializeDownloadQueues");
  return objc_msgSend(*(id *)(a1 + 32), "_pokeScheduler");
}

void sub_100021CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100021CBC(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationInfoIfExistsForIdentifier:", *(_QWORD *)(a1 + 40)));
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_downloadQueueForIdentifier:create:error:", *(_QWORD *)(a1 + 40), 0, 0));
    v4 = v3;
    if (v3)
    {
      v12 = 0;
      v13 = 0;
      v5 = objc_msgSend(v3, "essentialAssetsStateWithSizeDownloaded:totalDownloadSize:", &v13, &v12);
      v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_essentialAssetsProgressDescriptorWithAppInfo:essentialAssetState:sizeDownloaded:totalDownloadSize:", v2, v5, v13, v12));
    }
    else
    {
      v6 = sub_10000B988([BAAppStoreProgressInfoDescriptor alloc], 1, -1, -1);
    }
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v6;

  }
  else
  {
    v7 = sub_10000B988([BAAppStoreProgressInfoDescriptor alloc], 0, -1, -1);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

void sub_100021F10(id *a1)
{
  id v2;
  NSObject *v3;
  const char *v4;
  id v5;
  id v6;
  id v7;
  _QWORD *v8;
  id *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  const char *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  int8x16_t v25;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  id v30;
  int8x16_t v31;
  id v32;
  _QWORD *v33;
  uint64_t v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;

  v2 = sub_100012A44();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (const char *)a1[4];
    *(_DWORD *)buf = 138543362;
    v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Download manifest did finish: %{public}@", buf, 0xCu);
  }

  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_100022308;
  v35[3] = &unk_1000594C8;
  v36 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  v37 = v5;
  v38 = v6;
  v39 = v7;
  v8 = objc_retainBlock(v35);
  v9 = a1 + 8;
  if ((objc_msgSend(a1[8], "allowsBackgroundActivity") & 1) != 0)
  {
    if ((objc_msgSend(*v9, "hasLaunchedApplication") & 1) != 0
      || (objc_msgSend(*v9, "permittedForInitialBackgroundActivity") & 1) != 0)
    {
      v10 = a1[6];
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[8], "applicationIdentifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_downloaderExtensionForApplicationIdentifier:cacheOnly:", v11, 0));

      if (v12)
      {
        v13 = sub_10000B428((uint64_t)a1[4]);
        v14 = v13;
        if (v13 != 1)
        {
          if (v13 == 7)
          {
            v14 = 3;
          }
          else if (v13 != 2)
          {
            v15 = sub_1000128F4();
            v16 = objc_claimAutoreleasedReturnValue(v15);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              sub_100036FCC();
LABEL_16:

            ((void (*)(_QWORD *, _QWORD))v8[2])(v8, 0);
LABEL_23:

            goto LABEL_24;
          }
        }
        v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(a1[6], "asyncClientNotificationQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100022490;
        block[3] = &unk_100059568;
        v27 = v12;
        v28 = a1[4];
        v33 = v8;
        v29 = a1[8];
        v34 = v14;
        v30 = a1[9];
        v25 = *(int8x16_t *)(a1 + 5);
        v24 = (id)v25.i64[0];
        v31 = vextq_s8(v25, v25, 8uLL);
        v32 = a1[7];
        dispatch_async(v23, block);

        goto LABEL_23;
      }
      v21 = sub_1000128F4();
      v16 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_100036F38(v9);
      goto LABEL_16;
    }
    v22 = sub_100012964();
    v18 = objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v9, "applicationIdentifier"));
      *(_DWORD *)buf = 136315394;
      v41 = "-[BAAgentCore downloadQueue:manifest:finishedWithFileURL:]_block_invoke";
      v42 = 2114;
      v43 = v19;
      v20 = "%s, Will not message extension for %{public}@. App not permitted for initial background activity.";
      goto LABEL_19;
    }
  }
  else
  {
    v17 = sub_100012964();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v9, "applicationIdentifier"));
      *(_DWORD *)buf = 136315394;
      v41 = "-[BAAgentCore downloadQueue:manifest:finishedWithFileURL:]_block_invoke_2";
      v42 = 2114;
      v43 = v19;
      v20 = "%s, Will not message extension for %{public}@ because background activity is disabled.";
LABEL_19:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);

    }
  }

  ((void (*)(_QWORD *, _QWORD))v8[2])(v8, 0);
LABEL_24:

}

void sub_100022308(uint64_t a1, char a2)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  uint64_t v17;

  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Removing manifest as extension processed the manifest. %{public}@", buf, 0xCu);
    }

  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100037088();

    objc_msgSend(*(id *)(a1 + 40), "scheduleContentRequestAborted");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v10 = sub_100030230(*(id *)(a1 + 32), v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v8, "removeItemAtURL:error:", v11, 0);

  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "workQueue"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100022488;
  v14[3] = &unk_100058A10;
  v13 = *(void **)(a1 + 56);
  v14[4] = *(_QWORD *)(a1 + 48);
  v15 = v13;
  dispatch_async(v12, v14);

}

id sub_100022488(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serializeDownloadQueues");
}

void sub_100022490(uint64_t a1, const char *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BAAppExtensionInfo *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  const char *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;

  v3 = *(void **)(a1 + 32);
  v4 = sub_100030230(*(id *)(a1 + 40), a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "extendClientSandboxForStagedURL:allowWrites:", v5, 0));

  if (v6)
  {
    v7 = -[BAAppExtensionInfo initWithApplicationInfo:]([BAAppExtensionInfo alloc], "initWithApplicationInfo:", *(_QWORD *)(a1 + 48));
    v8 = *(_QWORD *)(a1 + 96);
    v9 = *(void **)(a1 + 32);
    v11 = sub_100030230(*(id *)(a1 + 40), v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000227A8;
    v28[3] = &unk_100059540;
    v35 = *(id *)(a1 + 88);
    v29 = *(id *)(a1 + 56);
    v13 = *(id *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 96);
    v30 = v13;
    v36 = v14;
    v15 = *(id *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 64);
    v17 = *(void **)(a1 + 72);
    v31 = v15;
    v32 = v16;
    v33 = v17;
    v34 = *(id *)(a1 + 80);
    objc_msgSend(v9, "requestDownloadsWithContentRequest:manifestURL:extensionInfo:completion:", v8, v12, v7, v28);

    v18 = v35;
  }
  else
  {
    v19 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v20 = sub_1000128F4();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = sub_100030230(v19, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
      *(_DWORD *)buf = 138543874;
      v41 = v19;
      v42 = 2114;
      v43 = v24;
      v44 = 2114;
      v45 = v25;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Warning: No sandbox token issued for extension for finished download: %{public}@ URL: %{public}@ for client: %{public}@", buf, 0x20u);

    }
    v26 = sub_1000272FC(-107);
    v7 = (BAAppExtensionInfo *)objc_claimAutoreleasedReturnValue(v26);
    sub_10002FBB8(v19, -1);
    v27 = *(void **)(a1 + 32);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10002274C;
    v37[3] = &unk_1000594F0;
    v38 = v19;
    v39 = *(id *)(a1 + 88);
    v18 = v19;
    objc_msgSend(v27, "backgroundDownload:failedWithError:completionHandler:", v18, v7, v37);

  }
}

uint64_t sub_10002274C(uint64_t a1, char a2)
{
  id v3;
  NSObject *v4;

  if ((a2 & 1) == 0)
  {
    v3 = sub_1000128F4();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000370E8();

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void sub_1000227A8(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  char v19;

  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10002289C;
  v11[3] = &unk_100059518;
  v19 = a2;
  v6 = *(NSObject **)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 88);
  v12 = v7;
  v18 = v8;
  v13 = *(id *)(a1 + 48);
  v14 = v5;
  v9 = *(void **)(a1 + 64);
  v15 = *(_QWORD *)(a1 + 56);
  v16 = v9;
  v17 = *(id *)(a1 + 72);
  v10 = v5;
  dispatch_async(v6, v11);

}

void sub_10002289C(uint64_t a1)
{
  unsigned __int8 v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[4];
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  _QWORD block[4];
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  uint64_t v42;

  if (*(_BYTE *)(a1 + 88))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "initialRestrictionsAreEnforced"))
    {
      v2 = objc_msgSend(*(id *)(a1 + 40), "initialBackgroundCellularPolicy");
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v3 = *(id *)(a1 + 48);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(_QWORD *)v35 != v6)
              objc_enumerationMutation(v3);
            v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
            os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(v8, "downloadLock"));
            objc_msgSend(v8, "setApplicationInformationForRestrictedDownload:", *(_QWORD *)(a1 + 40));
            v9 = objc_msgSend(v8, "necessity");
            v10 = objc_msgSend(v8, "necessity");
            if (v9 == (id)1)
            {
              if ((v2 & 2) != 0)
                objc_msgSend(v8, "setPermitInitialCellularDownload:", 1);
              objc_msgSend(v8, "setIsForegroundDownload:", 1);
            }
            if (!v10)
            {
              if ((v2 & 1) != 0)
                objc_msgSend(v8, "setPermitInitialCellularDownload:", 1);
              objc_msgSend(v8, "setIsForegroundDownload:", 0);
            }
            os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(v8, "downloadLock"));
          }
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        }
        while (v5);
      }

    }
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "telemetryQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100022BA4;
    block[3] = &unk_100058C48;
    v33 = *(_QWORD *)(a1 + 80);
    v30 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    v13 = *(_QWORD *)(a1 + 56);
    v31 = v12;
    v32 = v13;
    dispatch_async(v11, block);

    v14 = *(void **)(a1 + 64);
    v15 = *(_QWORD *)(a1 + 80);
    v17 = *(_QWORD *)(a1 + 40);
    v16 = *(void **)(a1 + 48);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100022C2C;
    v24[3] = &unk_100059050;
    v25 = v16;
    v18 = *(id *)(a1 + 40);
    v19 = *(_QWORD *)(a1 + 56);
    v26 = v18;
    v27 = v19;
    v28 = *(id *)(a1 + 72);
    objc_msgSend(v14, "scheduleContentRequest:downloads:applicationInfo:completionHandler:", v15, v25, v17, v24);

    v20 = v30;
  }
  else
  {
    v21 = sub_100012964();
    v20 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 80);
      *(_DWORD *)buf = 138543618;
      v40 = v22;
      v41 = 2048;
      v42 = v23;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Client failed to enqueue requested downloads for manifest: %{public}@ with content request: %ld", buf, 0x16u);
    }
  }

}

void sub_100022BA4(uint64_t a1)
{
  BAContentRequestTelemetry *v2;
  uint64_t v3;
  void *v4;
  BAContentRequestTelemetry *v5;

  v2 = [BAContentRequestTelemetry alloc];
  v3 = *(_QWORD *)(a1 + 56);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationIdentifier"));
  v5 = -[BAContentRequestTelemetry initWithContentRequest:applicationIdentifier:installSource:downloads:](v2, "initWithContentRequest:applicationIdentifier:installSource:downloads:", v3, v4, objc_msgSend(*(id *)(a1 + 32), "installSource"), *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "setContentRequestTelemetry:forDownloads:", v5, *(_QWORD *)(a1 + 40));
}

void sub_100022C2C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  void *v13;

  v2 = sub_1000128F4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "count");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "applicationIdentifier"));
    *(_DWORD *)buf = 134349314;
    v11 = v4;
    v12 = 2114;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Scheduled content request downloads count: %{public}lu for client: %{public}@", buf, 0x16u);

  }
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "workQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100022D64;
  v8[3] = &unk_100058A10;
  v7 = *(void **)(a1 + 56);
  v8[4] = *(_QWORD *)(a1 + 48);
  v9 = v7;
  dispatch_async(v6, v8);

}

id sub_100022D64(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_pokeScheduler");
  return objc_msgSend(*(id *)(a1 + 32), "_serializeDownloadQueues");
}

void sub_100022E6C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_systemConnections"));
  if (objc_msgSend(v2, "count"))
  {
    v3 = *(void **)(a1 + 32);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationInfoIfExistsForIdentifier:", v4));

    if (v5)
      v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_essentialAssetsProgressDescriptorWithAppInfo:essentialAssetState:sizeDownloaded:totalDownloadSize:", v5, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72)));
    else
      v6 = sub_10000B988([BAAppStoreProgressInfoDescriptor alloc], 0, -1, -1);
    v7 = v6;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v2;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "identifier", (_QWORD)v15));
          objc_msgSend(v13, "reportProgressForIdentifier:progressInfo:", v14, v7);

          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
}

void sub_100023398(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  NSObject *v4;
  NSObject *v5;
  id (*v6)(uint64_t);
  void ***v7;
  void **v8;
  void **v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rulesEngine"));
  v3 = objc_msgSend(v2, "isValidTimeForDownloads");

  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "workQueue"));
  v5 = v4;
  if (v3)
  {
    v9 = _NSConcreteStackBlock;
    v6 = sub_10002344C;
    v7 = &v9;
  }
  else
  {
    v8 = _NSConcreteStackBlock;
    v6 = sub_100023454;
    v7 = &v8;
  }
  v7[1] = (void **)3221225472;
  v7[2] = (void **)v6;
  v7[3] = (void **)&unk_100058998;
  v7[4] = *(void ***)(a1 + 32);
  dispatch_async(v4, v7);

}

id sub_10002344C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleDownloads");
}

id sub_100023454(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pauseDownloads");
}

void sub_1000235BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100023C8C(uint64_t a1)
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  const __CFString *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *j;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  id v35;
  NSObject *v36;
  const __CFString *v37;
  id v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  void *v42;
  id v43;
  uint64_t v44;
  void *k;
  uint64_t v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  const __CFString *v54;
  id v55;
  NSObject *v56;
  id v57;
  NSObject *v58;
  void *v59;
  id v60;
  uint64_t v61;
  void *m;
  uint64_t v63;
  id v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  const __CFString *v71;
  id v72;
  NSObject *v73;
  id obj;
  id obja;
  id objb;
  id objc;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  _BYTE v95[128];
  _BYTE v96[128];
  uint8_t v97[128];
  uint8_t buf[4];
  const __CFString *v99;

  v2 = sub_1000128F4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Dumping debug agent state:", buf, 2u);
  }

  v4 = sub_1000128F4();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "rulesEngine"));
    v7 = objc_msgSend(v6, "isValidTimeForDownloads");
    v8 = CFSTR("NO");
    if (v7)
      v8 = CFSTR("YES");
    *(_DWORD *)buf = 138543362;
    v99 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Allowed time for downloads: %{public}@", buf, 0xCu);

  }
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationState"));
  objc_sync_enter(obj);
  v9 = sub_1000128F4();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "**** Application State Info ****", buf, 2u);
  }

  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationState"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v91;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v91 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * (_QWORD)i);
        v16 = sub_1000128F4();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "**** ---------------------- ****", buf, 2u);
        }

        v18 = objc_autoreleasePoolPush();
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "debugDescription"));
        v20 = sub_1000128F4();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v22 = (const __CFString *)objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
          *(_DWORD *)buf = 136315138;
          v99 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
        }

        objc_autoreleasePoolPop(v18);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v90, v97, 16);
    }
    while (v12);
  }

  v23 = sub_1000128F4();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "**** ---------------------- ****", buf, 2u);
  }

  objc_sync_exit(obj);
  obja = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connections"));
  objc_sync_enter(obja);
  v25 = sub_1000128F4();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "**** Connection State Info  ****", buf, 2u);
  }

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connections"));
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
  if (v28)
  {
    v29 = *(_QWORD *)v87;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(_QWORD *)v87 != v29)
          objc_enumerationMutation(v27);
        v31 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * (_QWORD)j);
        v32 = sub_1000128F4();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "**** ---------------------- ****", buf, 2u);
        }

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "debugDescription"));
        v35 = sub_1000128F4();
        v36 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          v37 = (const __CFString *)objc_msgSend(objc_retainAutorelease(v34), "UTF8String");
          *(_DWORD *)buf = 136315138;
          v99 = v37;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
        }

      }
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v86, v96, 16);
    }
    while (v28);
  }

  v38 = sub_1000128F4();
  v39 = objc_claimAutoreleasedReturnValue(v38);
  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "**** ---------------------- ****", buf, 2u);
  }

  objc_sync_exit(obja);
  objb = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionConnections"));
  objc_sync_enter(objb);
  v40 = sub_1000128F4();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "**** Extension Connection State Info ****", buf, 2u);
  }

  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionConnections"));
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
  if (v43)
  {
    v44 = *(_QWORD *)v83;
    do
    {
      for (k = 0; k != v43; k = (char *)k + 1)
      {
        if (*(_QWORD *)v83 != v44)
          objc_enumerationMutation(v42);
        v46 = *(_QWORD *)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)k);
        v47 = sub_1000128F4();
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_INFO, "**** ---------------------- ****", buf, 2u);
        }

        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionConnections"));
        v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "objectForKey:", v46));

        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "debugDescription"));
        v52 = sub_1000128F4();
        v53 = objc_claimAutoreleasedReturnValue(v52);
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          v54 = (const __CFString *)objc_msgSend(objc_retainAutorelease(v51), "UTF8String");
          *(_DWORD *)buf = 136315138;
          v99 = v54;
          _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
        }

      }
      v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
    }
    while (v43);
  }

  v55 = sub_1000128F4();
  v56 = objc_claimAutoreleasedReturnValue(v55);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "**** ------------------------------- ****", buf, 2u);
  }

  objc_sync_exit(objb);
  objc = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "downloadQueuesByClientIdentifier"));
  objc_sync_enter(objc);
  v57 = sub_1000128F4();
  v58 = objc_claimAutoreleasedReturnValue(v57);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "**** Download Queue State Info ****", buf, 2u);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "downloadQueuesByClientIdentifier"));
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
  if (v60)
  {
    v61 = *(_QWORD *)v79;
    do
    {
      for (m = 0; m != v60; m = (char *)m + 1)
      {
        if (*(_QWORD *)v79 != v61)
          objc_enumerationMutation(v59);
        v63 = *(_QWORD *)(*((_QWORD *)&v78 + 1) + 8 * (_QWORD)m);
        v64 = sub_1000128F4();
        v65 = objc_claimAutoreleasedReturnValue(v64);
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "**** ---------------------- ****", buf, 2u);
        }

        v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "downloadQueuesByClientIdentifier"));
        v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "objectForKey:", v63));
        v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "debugDescription"));

        v69 = sub_1000128F4();
        v70 = objc_claimAutoreleasedReturnValue(v69);
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          v71 = (const __CFString *)objc_msgSend(objc_retainAutorelease(v68), "UTF8String");
          *(_DWORD *)buf = 136315138;
          v99 = v71;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
        }

      }
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v78, v94, 16);
    }
    while (v60);
  }

  v72 = sub_1000128F4();
  v73 = objc_claimAutoreleasedReturnValue(v72);
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_INFO, "**** ------------------------------- ****", buf, 2u);
  }

  objc_sync_exit(objc);
}

void sub_100024624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

intptr_t sub_100024B1C(uint64_t a1, int a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  id v6;
  int v8;
  uint64_t v9;

  if (a2 != 3)
  {
    if (a2)
    {
      v6 = sub_1000128F4();
      v4 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_1000371D8();
    }
    else
    {
      v3 = sub_1000128F4();
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        v5 = *(_QWORD *)(a1 + 32);
        v8 = 138543362;
        v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Extension removed with launchd: %{public}@", (uint8_t *)&v8, 0xCu);
      }
    }

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100024C00(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_connectionsForApplicationIdentifier:", *(_QWORD *)(a1 + 40), 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "isApplication") & 1) == 0)
        {
          objc_msgSend(v7, "invalidate");
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connections"));
          objc_msgSend(v8, "removeObject:", v7);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

int64_t sub_100024EC0(id a1, BAAgentClientConnection *a2, BAAgentClientConnection *a3)
{
  BAAgentClientConnection *v4;
  BAAgentClientConnection *v5;
  int64_t v6;

  v4 = a2;
  v5 = a3;
  if (-[BAAgentClientConnection isApplication](v4, "isApplication")
    && !-[BAAgentClientConnection isApplication](v5, "isApplication"))
  {
    v6 = -1;
  }
  else
  {
    v6 = !-[BAAgentClientConnection isApplication](v4, "isApplication")
      && -[BAAgentClientConnection isApplication](v5, "isApplication");
  }

  return v6;
}

void sub_1000255DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_100025FD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100026290(uint64_t a1)
{
  CFTypeID v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  CFTypeRef cf;

  cf = 0;
  if (lockdown_receive_message(*(_QWORD *)(a1 + 48), &cf))
  {
    lockdown_disconnect(*(_QWORD *)(a1 + 48));
  }
  else
  {
    v2 = CFGetTypeID(cf);
    if (v2 == CFDataGetTypeID())
    {
      v4 = (void *)cf;
      v8 = 0;
      v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:](NSKeyedUnarchiver, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(BADeveloperDebugClientMessage, v3), cf, &v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = v8;
      if (v6)
        objc_msgSend(*(id *)(a1 + 32), "_processLockdownClientMessage:withConnection:withQueue:", v6, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      else
        lockdown_disconnect(*(_QWORD *)(a1 + 48));

    }
    else
    {
      lockdown_disconnect(*(_QWORD *)(a1 + 48));
      if (cf)
        CFRelease(cf);
    }
  }
}

id sub_100026850(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_serializeState");
}

void sub_100026910(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[8];
  _BYTE v23[128];

  v2 = sub_1000128F4();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NSProcessInfoPowerStateDidChangeNotification received.", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationState"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationState"));
  v6 = objc_msgSend(v5, "copy");

  objc_sync_exit(v4);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "applicationIdentifier", (_QWORD)v18));
        if ((objc_msgSend(v11, "allowsBackgroundActivity") & 1) != 0)
        {

          goto LABEL_17;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionConnections"));
        objc_sync_enter(v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "extensionConnections"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v12));

        objc_sync_exit(v13);
        if (v15)
          objc_msgSend(v15, "invalidate");
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_downloadQueueForIdentifier:create:error:", v12, 0, 0));
        v17 = v16;
        if (v16)
          objc_msgSend(v16, "cancelAllDownloads");

      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_17:

}

void sub_100026B38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100026C3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100026DEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100027220(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1000272B4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id sub_1000272C0(id a1)
{
  return objc_retainAutorelease(a1);
}

id sub_1000272F0(uint64_t a1)
{
  return objc_retainAutorelease(*(id *)(a1 + 32));
}

id sub_1000272FC(uint64_t a1)
{
  return sub_100027310(CFSTR("BAErrorDomain"), a1, 0);
}

id sub_100027310(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSErrorUserInfoKey v10;
  void *v11;

  v5 = a1;
  if (a3)
  {
    v10 = NSUnderlyingErrorKey;
    v11 = a3;
    v6 = a3;
    a3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));

  }
  sub_1000273EC(v5, a2, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  return v8;
}

id sub_1000273E4(void *a1, uint64_t a2)
{
  return sub_100027310(a1, a2, 0);
}

void sub_1000273EC(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;

  v5 = a1;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/System/Library/Frameworks/BackgroundAssets.framework"), 1));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a2));
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("BAErrorDomain")) & 1) != 0)
  {
    v10 = CFSTR("BAError");
LABEL_5:
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v9, 0, v10));
    if (v6)
      v12 = objc_msgSend(v6, "mutableCopy");
    else
      v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v13 = v12;
    objc_msgSend(v12, "setObject:forKey:", v11, NSLocalizedFailureReasonErrorKey);
    v14 = objc_msgSend(v13, "copy");
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v5, a2, v14));

    v16 = v15;
    return;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("BAURLDownloadErrorDomain")) & 1) != 0)
  {
    v10 = CFSTR("BAURLDownloadError");
    goto LABEL_5;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    sub_100037744();
  qword_1000654C8 = (uint64_t)"BUG IN BackgroundAssets: NSErrorWithBAErrorDomainCodeUserInfo() called with unsupported NSErrorDomain.";
  qword_1000654F8 = 6;
  __break(1u);
}

void sub_10002789C(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setDebugRuleValidity:", *(unsigned int *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    v5 = objc_opt_respondsToSelector(v4, "downloadTimeValidityDidChange");

    if ((v5 & 1) != 0)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
      objc_msgSend(v6, "downloadTimeValidityDidChange");

    }
  }
}

void sub_100027AA0(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_100027C2C(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

void sub_100027E88(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100027EA8(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  id v4;
  NSObject *v5;
  id *v6;
  id WeakRetained;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  uint8_t v14[16];

  v3 = a2;
  if (xpc_activity_get_state(v3) == 2)
  {
    if (xpc_activity_should_defer(v3) && xpc_activity_set_state(v3, 3))
    {
      v4 = sub_1000128F4();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Periodic check fired, but activity was deferred.", v14, 2u);
      }
      goto LABEL_9;
    }
    v6 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v6);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
    if (!v8)
    {

      goto LABEL_11;
    }
    v9 = (void *)v8;
    v10 = objc_loadWeakRetained(v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));
    v12 = objc_opt_respondsToSelector(v11, "doPeriodicUpdateCheck");

    if ((v12 & 1) != 0)
    {
      v5 = objc_loadWeakRetained(v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject delegate](v5, "delegate"));
      objc_msgSend(v13, "doPeriodicUpdateCheck");

LABEL_9:
    }
  }
LABEL_11:

}

void sub_100027FE4(id a1, OS_xpc_object *a2)
{
  const char *string;
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;

  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  v3 = sub_1000128F4();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = string;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received distnoted event: %s", (uint8_t *)&v5, 0xCu);
  }

}

void sub_100028120(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    v5 = objc_opt_respondsToSelector(v4, "downloadTimeValidityDidChange");

    if ((v5 & 1) != 0)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
      objc_msgSend(v6, "downloadTimeValidityDidChange");

    }
  }
}

void sub_100028684(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1000286B4(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  id *v21;
  id v22;
  unsigned __int8 v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "_downloadFailedWithError:", v6);
LABEL_3:

    goto LABEL_17;
  }
  if (v5)
  {
    v8 = sub_1000128F4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000377C8(v9, v10, v11, v12, v13, v14, v15, v16);

    v17 = objc_msgSend(objc_alloc((Class)CKQueryOperation), "initWithCursor:", v5);
    objc_msgSend(a1[4], "addOperation:", v17);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "stateLock"));
    objc_msgSend(v18, "lock");

    if ((objc_msgSend(a1[5], "recordFound") & 1) != 0)
    {
      v19 = objc_msgSend(a1[5], "assetFound");
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "stateLock"));
      objc_msgSend(v20, "unlock");

      v21 = a1 + 6;
      v22 = objc_loadWeakRetained(a1 + 6);
      WeakRetained = v22;
      if ((v19 & 1) != 0)
      {
        v23 = objc_msgSend(v22, "_consumeAvailableDownloadSize");

        v24 = objc_loadWeakRetained(v21);
        WeakRetained = v24;
        if ((v23 & 1) != 0)
        {
          objc_msgSend(v24, "_downloadActualAsset");
          goto LABEL_3;
        }
        v30 = 204;
      }
      else
      {
        v30 = -301;
      }
      v33 = sub_1000272FC(v30);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      objc_msgSend(WeakRetained, "_downloadFailedWithError:", v34);

      goto LABEL_3;
    }
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = sub_10002893C;
    v40 = sub_10002894C;
    v41 = 0;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "recordErrors"));
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100028954;
    v35[3] = &unk_1000596D0;
    v35[4] = &v36;
    objc_msgSend(v25, "enumerateKeysAndObjectsUsingBlock:", v35);

    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "stateLock"));
    objc_msgSend(v26, "unlock");

    v27 = v37[5];
    v28 = objc_loadWeakRetained(a1 + 6);
    v29 = v28;
    if (v27)
    {
      objc_msgSend(v28, "_downloadFailedWithError:", v37[5]);
    }
    else
    {
      v31 = sub_1000272FC(-300);
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      objc_msgSend(v29, "_downloadFailedWithError:", v32);

    }
    _Block_object_dispose(&v36, 8);

  }
LABEL_17:

}

void sub_100028924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002893C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002894C(uint64_t a1)
{

}

void sub_100028954(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9)
    objc_storeStrong(v8, a3);
  v10 = sub_100012964();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_1000377FC();

}

void sub_1000289DC(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateLock"));
  objc_msgSend(v9, "lock");

  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "recordErrors"));
    objc_msgSend(v11, "setObject:forKey:", v8, v16);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setRecordFound:", 1);
    v12 = objc_loadWeakRetained((id *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "download"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assetKey"));
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v14));

    if (WeakRetained)
    {
      objc_msgSend(*(id *)(a1 + 32), "setAssetFound:", 1);
      objc_msgSend(*(id *)(a1 + 32), "setAssetSize:", objc_msgSend(WeakRetained, "size"));
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateLock"));
  objc_msgSend(v15, "unlock");

}

void sub_100028BC0(uint64_t a1)
{
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v1, "downloadDidPause");

}

void sub_100028CB4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    v5 = objc_opt_respondsToSelector(v4, "downloadFailedWithError:");

    if ((v5 & 1) != 0)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
      objc_msgSend(v6, "downloadFailedWithError:", *(_QWORD *)(a1 + 40));

    }
  }
}

void sub_100028DE8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
    v5 = objc_opt_respondsToSelector(v4, "downloadSucceededWithURL:");

    if ((v5 & 1) != 0)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
      objc_msgSend(v6, "downloadSucceededWithURL:", *(_QWORD *)(a1 + 40));

    }
  }
}

void sub_100028FDC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_100028FFC(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x100028FA0);
}

void sub_1000291AC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1000291DC(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  _QWORD v39[5];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "_downloadFailedWithError:", v6);
LABEL_3:

    goto LABEL_17;
  }
  if (v5)
  {
    v8 = sub_1000128F4();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000377C8(v9, v10, v11, v12, v13, v14, v15, v16);

    v17 = objc_msgSend(objc_alloc((Class)CKQueryOperation), "initWithCursor:", v5);
    objc_msgSend(a1[4], "addOperation:", v17);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "stateLock"));
    objc_msgSend(v18, "lock");

    if ((objc_msgSend(a1[5], "recordFound") & 1) != 0)
    {
      v19 = objc_msgSend(a1[5], "assetFound");
      v20 = a1[5];
      if ((v19 & 1) != 0)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "assetURL"));

        v22 = a1[5];
        if (v21)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "assetURL"));
          v24 = objc_msgSend(v23, "copy");

          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "stateLock"));
          objc_msgSend(v25, "unlock");

          v26 = objc_loadWeakRetained(a1 + 6);
          objc_msgSend(v26, "_downloadSucceededWithURL:", v24);

          goto LABEL_17;
        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "stateLock"));
        objc_msgSend(v36, "unlock");

        WeakRetained = objc_loadWeakRetained(a1 + 6);
        v33 = -302;
      }
      else
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "stateLock"));
        objc_msgSend(v32, "unlock");

        WeakRetained = objc_loadWeakRetained(a1 + 6);
        v33 = -301;
      }
      v37 = sub_1000272FC(v33);
      v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
      objc_msgSend(WeakRetained, "_downloadFailedWithError:", v38);

      goto LABEL_3;
    }
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = sub_10002893C;
    v44 = sub_10002894C;
    v45 = 0;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "recordErrors"));
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000294BC;
    v39[3] = &unk_1000596D0;
    v39[4] = &v40;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v39);

    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[5], "stateLock"));
    objc_msgSend(v28, "unlock");

    v29 = v41[5];
    v30 = objc_loadWeakRetained(a1 + 6);
    v31 = v30;
    if (v29)
    {
      objc_msgSend(v30, "_downloadFailedWithError:", v41[5]);
    }
    else
    {
      v34 = sub_1000272FC(-300);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
      objc_msgSend(v31, "_downloadFailedWithError:", v35);

    }
    _Block_object_dispose(&v40, 8);

  }
LABEL_17:

}

void sub_1000294A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000294BC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(_QWORD *)(v7 + 40);
  v8 = (id *)(v7 + 40);
  if (!v9)
    objc_storeStrong(v8, a3);
  v10 = sub_100012964();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_1000377FC();

}

void sub_100029544(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateLock"));
  objc_msgSend(v9, "lock");

  if (v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "recordErrors"));
    objc_msgSend(v11, "setObject:forKey:", v8, v16);
LABEL_5:

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(a1 + 32), "setRecordFound:", 1);
  v12 = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "download"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "assetKey"));
  WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v14));

  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAssetFound:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "fileURL"));
    objc_msgSend(*(id *)(a1 + 32), "setAssetURL:", v11);
    goto LABEL_5;
  }
LABEL_6:

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "stateLock"));
  objc_msgSend(v15, "unlock");

}

void sub_100029C28(id a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  v2 = sub_100018310((uint64_t)NSSet);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v1, "unionSet:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[BADownload classesForSerialization](BADownload, "classesForSerialization"));
  objc_msgSend(v1, "unionSet:", v4);

  v9 = objc_opt_class(BAUnhandledDownloadEvent, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  objc_msgSend(v1, "addObjectsFromArray:", v6);

  v7 = objc_msgSend(v1, "copy");
  v8 = (void *)qword_1000655A8;
  qword_1000655A8 = (uint64_t)v7;

}

const __CFString *sub_10002A1F4(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("<Unknown>");
  if (a1 == 1)
    v1 = CFSTR("Essential");
  if (a1)
    return v1;
  else
    return CFSTR("Optional");
}

const __CFString *sub_10002A220(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("<Unknown>");
  else
    return *(&off_100059760 + a1 - 1);
}

void sub_10002A468(id a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.mt"));
  v2 = (void *)qword_1000655B8;
  qword_1000655B8 = (uint64_t)v1;

}

void sub_10002A4E4(id a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = objc_alloc_init((Class)NSMutableSet);
  v2 = (void *)qword_1000655C8;
  qword_1000655C8 = (uint64_t)v1;

  v3 = (void *)qword_1000655C8;
  v4 = sub_100018310((uint64_t)NSSet);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  objc_msgSend(v3, "unionSet:", v5);

  objc_msgSend((id)qword_1000655C8, "addObject:", objc_opt_class(NSURL, v6));
  objc_msgSend((id)qword_1000655C8, "addObject:", objc_opt_class(BAApplicationInfo, v7));
  objc_msgSend((id)qword_1000655C8, "addObject:", objc_opt_class(BAExtensionRuntime, v8));
}

void sub_10002C0F4(id a1, id a2)
{
  NSObject *v2;
  NSObject *v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = v2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002C16C;
  block[3] = &unk_100058F48;
  v6 = a2;
  v4 = v6;
  dispatch_async(v3, block);

}

uint64_t sub_10002C16C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10002D484(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x10002D38CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_10002DD70(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_10002E6AC(_Unwind_Exception *a1)
{
  os_unfair_lock_s *v1;

  os_unfair_lock_unlock(v1);
  _Unwind_Resume(a1);
}

void sub_10002E6D4(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "downloadDidBegin:", *(_QWORD *)(a1 + 32));

}

void sub_10002E96C(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "download:failedWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_10002EA80(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "downloadDidPause:", *(_QWORD *)(a1 + 32));

}

void sub_10002EC94(uint64_t a1)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "delegate"));
  objc_msgSend(v2, "download:finishedWithFileURL:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void sub_10002F06C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10002F188(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_10002F1C0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void sub_10002F1EC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void sub_10002F2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_10002FBB8(void *a1, uint64_t a2)
{
  _QWORD *obj;

  if (a1)
  {
    obj = a1;
    objc_sync_enter(obj);
    obj[4] = a2;
    objc_sync_exit(obj);

  }
}

void sub_10002FC00(void *a1, char *newValue)
{
  if (a1)
    objc_setProperty_atomic(a1, newValue, newValue, 80);
}

void sub_10002FC14(void *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *obj;

  if (a1)
  {
    v4 = objc_msgSend(a1, "necessity");
    if (a2
      || v4 != (id)1
      || (v6 = objc_opt_class(BAManifestDownload, v5), (objc_opt_isKindOfClass(a1, v6) & 1) != 0))
    {
      obj = a1;
      objc_sync_enter(obj);
      obj[6] = a2;
      objc_sync_exit(obj);

    }
    else
    {
      v7 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT);
      if (v7)
        sub_100037C58(v7, v8, v9, v10, v11, v12, v13, v14);
      qword_1000654C8 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: The provided fileSize for BADownload must be a posit"
                                 "ive number that matches the actual file size on the server.";
      __break(1u);
    }
  }
}

void sub_100030194(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000301A8(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  v1 = a1;
  objc_sync_enter(v1);
  v2 = v1[4];
  objc_sync_exit(v1);

  return v2;
}

uint64_t sub_1000301EC(void *a1)
{
  _QWORD *v1;
  uint64_t v2;

  if (!a1)
    return 0;
  v1 = a1;
  objc_sync_enter(v1);
  v2 = v1[6];
  objc_sync_exit(v1);

  return v2;
}

id sub_100030230(id result, const char *a2)
{
  if (result)
    return objc_getProperty(result, a2, 80, 1);
  return result;
}

void sub_10003046C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100031820(id a1)
{
  BABlockQueueManager *v1;
  void *v2;

  v1 = objc_opt_new(BABlockQueueManager);
  v2 = (void *)qword_1000655E0;
  qword_1000655E0 = (uint64_t)v1;

}

void sub_100031848(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_validateAndSetClientIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationBundleIdentifier"));

  if (v2)
  {
    v3 = (void *)qword_1000655E0;
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationBundleIdentifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "blockQueueWithIdentifier:", v5));
    objc_msgSend(*(id *)(a1 + 32), "setExclusiveAccessBlockQueue:", v4);

  }
}

void sub_100031968(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastExclusiveAccessBlockToken"));

  if (v2)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "exclusiveAccessBlockQueue"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "lastExclusiveAccessBlockToken"));
    objc_msgSend(v4, "drainSpecificWithToken:", v3);

  }
}

void sub_100031B04(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  if ((objc_msgSend(*(id *)(a1 + 32), "connectionIsValid") & 1) != 0)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationBundleIdentifier"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "downloadsForIdentifier:", v3));

    if (v4)
      v5 = (void *)v4;
    else
      v5 = &__NSArray0__struct;
    v6 = *(_QWORD *)(a1 + 40);
    if (!v6)
      goto LABEL_10;
    v9 = (uint64_t)v5;
    (*(void (**)(uint64_t))(v6 + 16))(v6);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (!v7)
      return;
    v8 = sub_1000272FC(56);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    (*(void (**)(uint64_t))(v7 + 16))(v7);
  }
  v5 = (void *)v9;
LABEL_10:

}

void sub_100031CA8(id *a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void (**v18)(id, _QWORD, id);
  id v19;
  id v20;
  void (**v21)(id, _QWORD, void *);
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;

  if ((objc_msgSend(a1[4], "connectionIsValid") & 1) != 0)
  {
    v3 = a1[5];
    v4 = objc_opt_class(BACloudKitDownload, v2);
    if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    {
      v5 = a1[4];
      v6 = a1[5];
      v25 = 0;
      v7 = objc_msgSend(v5, "_entitledForCloudKitWithDownload:outError:", v6, &v25);
      v8 = v25;
      v9 = v8;
      if ((v7 & 1) == 0)
      {
LABEL_14:
        v21 = (void (**)(id, _QWORD, void *))a1[6];
        if (v21)
          v21[2](v21, 0, v9);

        return;
      }

    }
    if ((objc_msgSend(a1[4], "isApplication") & 1) != 0
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "applicationBundleIdentifier")),
          v11 = +[BAApplicationInfo applicationForIdentifierAllowsBackgroundActivity:](BAApplicationInfo, "applicationForIdentifierAllowsBackgroundActivity:", v10), v10, (v11 & 1) != 0))
    {
      if (objc_msgSend(a1[4], "isApplication"))
      {
        if (objc_msgSend(a1[4], "isActive"))
        {
          os_unfair_lock_lock((os_unfair_lock_t)objc_msgSend(a1[5], "downloadLock"));
          objc_msgSend(a1[5], "setIsForegroundDownload:", 1);
          os_unfair_lock_unlock((os_unfair_lock_t)objc_msgSend(a1[5], "downloadLock"));
        }
      }
      v12 = a1[5];
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "applicationBundleIdentifier"));
      objc_msgSend(v12, "setApplicationIdentifier:", v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
      v15 = a1[5];
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "applicationBundleIdentifier"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1[4], "clientWorkQueue"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100031ED8;
      v23[3] = &unk_100059190;
      v24 = a1[6];
      objc_msgSend(v14, "scheduleDownload:forClientIdentifier:notifyQueue:completionBlock:", v15, v16, v17, v23);

      return;
    }
    v20 = sub_1000272FC(111);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v20);
    goto LABEL_14;
  }
  v18 = (void (**)(id, _QWORD, id))a1[6];
  if (v18)
  {
    v19 = sub_1000272FC(55);
    v22 = (id)objc_claimAutoreleasedReturnValue(v19);
    v18[2](v18, 0, v22);

  }
}

uint64_t sub_100031ED8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100031F90(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  if ((objc_msgSend(*(id *)(a1 + 32), "connectionIsValid") & 1) != 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "exclusiveAccessBlockQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000320C0;
    v6[3] = &unk_100059950;
    objc_copyWeak(&v8, &location);
    v7 = *(id *)(a1 + 40);
    objc_msgSend(v2, "enqueue:", v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = sub_1000272FC(55);
    v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v3 + 16))(v3, 0, v5, 0);

  }
}

void sub_10003209C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000320C0(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setLastExclusiveAccessBlockToken:", v9);

  v6 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v6 + 16))(v6, 1, 0, v9);
  }
  else
  {
    v7 = sub_1000272FC(-400);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, _QWORD, void *, id))(v6 + 16))(v6, 0, v8, v9);

  }
}

void sub_100032220(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  if ((objc_msgSend(*(id *)(a1 + 32), "connectionIsValid") & 1) != 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "exclusiveAccessBlockQueue"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100032354;
    v6[3] = &unk_100059950;
    objc_copyWeak(&v8, &location);
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v2, "enqueue:waitLimitDate:", v6, *(_QWORD *)(a1 + 40));

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = sub_1000272FC(55);
    v5 = (id)objc_claimAutoreleasedReturnValue(v4);
    (*(void (**)(uint64_t, _QWORD, id, _QWORD))(v3 + 16))(v3, 0, v5, 0);

  }
}

void sub_100032330(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100032354(uint64_t a1, int a2, void *a3)
{
  id WeakRetained;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setLastExclusiveAccessBlockToken:", v9);

  v6 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v6 + 16))(v6, 1, 0, v9);
  }
  else
  {
    v7 = sub_1000272FC(-400);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    (*(void (**)(uint64_t, _QWORD, void *, id))(v6 + 16))(v6, 0, v8, v9);

  }
}

void sub_100032490(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;

  v2 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "connectionIsValid"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "exclusiveAccessBlockQueue"));
    v5 = *(_QWORD *)(a1 + 40);
    v4 = a1 + 40;
    v6 = objc_msgSend(v3, "consumeToken:", v5);

    if ((v6 & 1) == 0)
    {
      v7 = sub_100012964();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100037D48(v4, v2);

    }
  }
}

void sub_100033384(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  if ((objc_msgSend(*(id *)(a1 + 32), "connectionIsValid") & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isApplication") & 1) != 0)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "isActive") & 1) != 0)
      {
        v2 = *(void **)(a1 + 40);
        v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationBundleIdentifier"));
        objc_msgSend(v2, "setApplicationIdentifier:", v3);

        v4 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
        v5 = *(_QWORD *)(a1 + 40);
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "applicationBundleIdentifier"));
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_1000334CC;
        v11[3] = &unk_100059190;
        v12 = *(id *)(a1 + 48);
        objc_msgSend(v4, "startForegroundDownload:forClientIdentifier:completionBlock:", v5, v6, v11);

        return;
      }
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 51;
    }
    else
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = 50;
    }
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = 55;
  }
  v9 = sub_1000272FC(v8);
  v10 = (id)objc_claimAutoreleasedReturnValue(v9);
  (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v10);

}

uint64_t sub_1000334CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000335A8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "applicationBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "downloadForIdentifier:forClientIdentifier:", v3, v4));

  if ((objc_msgSend(*(id *)(a1 + 40), "connectionIsValid") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BAAgentCore sharedCore](BAAgentCore, "sharedCore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "applicationBundleIdentifier"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000336D4;
    v10[3] = &unk_100059978;
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v6, "cancelDownload:forClientIdentifier:completionBlock:", v5, v7, v10);

  }
  else
  {
    v8 = sub_1000272FC(55);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v2, "download:failedWithError:", v5, v9);

  }
}

uint64_t sub_1000336D4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1000337C4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  const __CFString *v26;
  void *v27;

  if ((objc_msgSend(*(id *)(a1 + 32), "connectionIsValid") & 1) != 0)
  {
    v2 = sandbox_extension_consume(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
    if (v2 == -1)
    {
      v14 = *__error();
      v26 = CFSTR("FileURL");
      v15 = *(void **)(a1 + 48);
      v16 = v15;
      if (!v15)
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
      v27 = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v14, v17));

      if (!v15)
      v19 = *(_QWORD *)(a1 + 56);
      v20 = sub_100027310(CFSTR("BAErrorDomain"), -108, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      (*(void (**)(uint64_t, _QWORD, void *))(v19 + 16))(v19, 0, v21);

    }
    else
    {
      v3 = v2;
      v23 = 66564;
      if (fsctl((const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 48)), "fileSystemRepresentation"), 0xC0084A44uLL, &v23, 0))
      {
        v4 = *__error();
        v24 = CFSTR("FileURL");
        v5 = *(void **)(a1 + 48);
        v6 = v5;
        if (!v5)
          v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
        v25 = v6;
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, v4, v7));

        if (!v5)
        sandbox_extension_release(v3);
        v9 = *(_QWORD *)(a1 + 56);
        v10 = sub_100027310(CFSTR("BAErrorDomain"), -57, v8);
        v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v11);

      }
      else
      {
        sandbox_extension_release(v3);
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
      }
    }
  }
  else
  {
    v12 = *(_QWORD *)(a1 + 56);
    v13 = sub_1000272FC(55);
    v22 = (id)objc_claimAutoreleasedReturnValue(v13);
    (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);

  }
}

void sub_100033B1C(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  NSObject *v4;

  v2 = a2;
  v3 = sub_100012964();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_10003849C(v2);

}

void sub_100033C28(uint64_t a1)
{
  unsigned __int8 v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  unsigned __int8 v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "connectionIsValid");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100033CB0;
  v4[3] = &unk_1000599E8;
  v3 = *(NSObject **)(a1 + 40);
  v5 = *(id *)(a1 + 48);
  v6 = v2;
  dispatch_async(v3, v4);

}

uint64_t sub_100033CB0(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_100033D70(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100038524(a1, (uint64_t)v3);

}

void sub_100033E7C(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000385AC(a1, (uint64_t)v3);

}

void sub_100033F88(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100038634(a1, (uint64_t)v3);

}

void sub_1000340B4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000386BC(a1, (uint64_t)v3);

}

void sub_100034220(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void **v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));
  v5 = _NSConcreteStackBlock;
  v6 = 3221225472;
  v7 = sub_100034320;
  v8 = &unk_100058AD8;
  v10 = &v11;
  v9 = *(id *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &v5));
  objc_msgSend(v3, "downloadIdentifier:didReceiveChallenge:authChallengeHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v5, v6, v7, v8);

  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *((unsigned __int8 *)v12 + 24));

  _Block_object_dispose(&v11, 8);
}

void sub_100034308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100034320(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100038744(a1, (uint64_t)v3);

}

void sub_1000344B8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_1000387CC(a1, (uint64_t)v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_100034528(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100034660(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a2;
  v4 = sub_100012964();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    sub_100038854(a1, (uint64_t)v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t sub_1000346D0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100034A3C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100034A50(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_100034A60(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100034A80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005680((void *)&_mh_execute_header, &_os_log_default, a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  sub_100005690();
}

void sub_100034AF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005680((void *)&_mh_execute_header, &_os_log_default, a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  sub_100005690();
}

void sub_100034B68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005680((void *)&_mh_execute_header, &_os_log_default, a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  sub_100005690();
}

void sub_100034BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005680((void *)&_mh_execute_header, &_os_log_default, a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  sub_100005690();
}

void sub_100034C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005680((void *)&_mh_execute_header, &_os_log_default, a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  sub_100005690();
}

void sub_100034CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005680((void *)&_mh_execute_header, &_os_log_default, a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  sub_100005690();
}

void sub_100034D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005680((void *)&_mh_execute_header, &_os_log_default, a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  sub_100005690();
}

void sub_100034DAC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007614((void *)&_mh_execute_header, a2, a3, "Download %{public}@ rejected based on download allowance check.", a5, a6, a7, a8, 2u);
  sub_100005690();
}

void sub_100034E10(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100007614((void *)&_mh_execute_header, a2, a3, "Download %{public}@ rejected based on domain check.", a5, a6, a7, a8, 2u);
  sub_100005690();
}

void sub_100034E74()
{
  int v0;
  const char *v1;

  v0 = 136315138;
  v1 = "BAURLDownload returned an NSData, which is highly unexpected.";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN BackgroundAssets: %s", (uint8_t *)&v0, 0xCu);
  sub_100005690();
}

void sub_100034EF4(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "BAURLDownload+Agent: File data was returned, which is invalid. Daemon will crash. Download: %{public}@. Data: %{public}@", (uint8_t *)&v4, 0x16u);
  sub_100005690();
}

void sub_100034F78(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Download %{public}@ has no final size.", (uint8_t *)&v2, 0xCu);
}

void sub_100034FEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A5BC((void *)&_mh_execute_header, a1, a3, "Fatal: Wakeup extension errored out.\n", a5, a6, a7, a8, 0);
}

void sub_100035020(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A5BC((void *)&_mh_execute_header, a1, a3, "Fatal: Wakeup extension timed out.\n", a5, a6, a7, a8, 0);
}

void sub_100035054(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138543362;
  v5 = v3;
  sub_10000A5A4((void *)&_mh_execute_header, a2, a3, "Extension interrupted for identifier: %{public}@", (uint8_t *)&v4);
}

void sub_1000350C4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 138543362;
  v4 = a1;
  sub_10000A5A4((void *)&_mh_execute_header, a2, a3, "Fatal: Extension failed to send wakeup message. %{public}@", (uint8_t *)&v3);
}

void sub_100035130()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_10000A58C();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v2 = objc_msgSend((id)sub_10000A598(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000A54C();
  sub_10000A568((void *)&_mh_execute_header, v4, v5, "Failed in %s for: %{public}@. Unable to extend sandbox for manifest URL: %{public}@", v6, v7, v8, v9, 2u);

  sub_10000A57C();
}

void sub_1000351C8()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_10000A58C();
  v2 = objc_msgSend((id)sub_10000A5B0(v1), "identifier");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_10000A598(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10000A54C();
  sub_10000A568((void *)&_mh_execute_header, v5, v6, "Failed to send %s for: %{public}@ error: %{public}@", v7, v8, v9, v10, 2u);

  sub_10000A57C();
}

void sub_100035260()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_10000A58C();
  v2 = objc_msgSend((id)sub_10000A5B0(v1), "identifier");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_10000A598(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10000A54C();
  sub_10000A568((void *)&_mh_execute_header, v5, v6, "Failed to send %s for: %{public}@ error: %{public}@", v7, v8, v9, v10, 2u);

  sub_10000A57C();
}

void sub_1000352F8()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_10000A58C();
  v2 = objc_msgSend((id)sub_10000A5B0(v1), "identifier");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_10000A598(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10000A54C();
  sub_10000A568((void *)&_mh_execute_header, v5, v6, "Failed to send %s for: %{public}@ error: %{public}@", v7, v8, v9, v10, 2u);

  sub_10000A57C();
}

void sub_100035390()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_10000A58C();
  v2 = objc_msgSend((id)sub_10000A5B0(v1), "identifier");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_10000A598(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10000A54C();
  sub_10000A568((void *)&_mh_execute_header, v5, v6, "Failed to send %s for: %{public}@ error: %{public}@", v7, v8, v9, v10, 2u);

  sub_10000A57C();
}

void sub_100035428()
{
  void *v0;
  uint64_t v1;
  id v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_10000A58C();
  v2 = objc_msgSend((id)sub_10000A5B0(v1), "identifier");
  objc_claimAutoreleasedReturnValue(v2);
  v3 = objc_msgSend((id)sub_10000A598(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_10000A54C();
  sub_10000A568((void *)&_mh_execute_header, v5, v6, "Failed to send %s for: %{public}@ error: %{public}@", v7, v8, v9, v10, 2u);

  sub_10000A57C();
}

void sub_1000354C0(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "identifier"));
  v5 = 138543362;
  v6 = v3;
  sub_10000A5A4((void *)&_mh_execute_header, a2, v4, "Warning: Inbalanced decrement of extension wake assertion detected for identifier (%{public}@). File a radar.", (uint8_t *)&v5);

}

void sub_100035550(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to take power assertion for rules engine.", v1, 2u);
}

void sub_100035590(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to look up LS app proxy for %{public}@, cannot determine installation source.", (uint8_t *)&v2, 0xCu);
}

void sub_100035604(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Determining installation source for %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100035678()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DFB4();
  sub_10000A5BC((void *)&_mh_execute_header, v0, v1, "consume-extension-time was called without the required 2 arguments, ignoring.", v2, v3, v4, v5, v6);
  sub_10000DFAC();
}

void sub_1000356A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DFB4();
  sub_10000A5BC((void *)&_mh_execute_header, v0, v1, "reset-extension-time requires an identifier, ignoring.", v2, v3, v4, v5, v6);
  sub_10000DFAC();
}

void sub_1000356D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DFB4();
  sub_10000A5BC((void *)&_mh_execute_header, v0, v1, "reset-extension-time was called without the required singular identifier argument, ignoring.", v2, v3, v4, v5, v6);
  sub_10000DFAC();
}

void sub_1000356FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DFB4();
  sub_10000A5BC((void *)&_mh_execute_header, v0, v1, "send-telemetry-event requires a valid identifier, ignoring.", v2, v3, v4, v5, v6);
  sub_10000DFAC();
}

void sub_100035728()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DFB4();
  sub_10000A5BC((void *)&_mh_execute_header, v0, v1, "send-telemetry-event was called without specifying an application identifier.", v2, v3, v4, v5, v6);
  sub_10000DFAC();
}

void sub_100035754(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  v4 = 136446466;
  v5 = "-[BAAgentSystemConnection reportProgressForIdentifier:progressInfo:]_block_invoke";
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Message failed: %{public}s error: %{public}@", (uint8_t *)&v4, 0x16u);

}

void sub_1000357FC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "BAURLSession: Unable to create destination directory due to error: %@ - Falling back to BATemporaryDirectory()", (uint8_t *)&v2, 0xCu);
}

void sub_100035870(void *a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueIdentifier"));
  v3 = objc_msgSend((id)sub_10000A598(), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100017F40();
  sub_10000A568((void *)&_mh_execute_header, v5, v6, "Rejecting download (%{public}@ , %{public}@) because it is already scheduled in (%{public}@).", v7, v8, v9, v10, v11);

  sub_10000A57C();
}

void sub_100035918(void *a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "identifier"));
  objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "uniqueIdentifier"));
  v3 = objc_msgSend((id)sub_10000A598(), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100017F40();
  sub_10000A568((void *)&_mh_execute_header, v5, v6, "Rejecting download (%{public}@ , %{public}@) because [necessity==Essential]. App:(%{public}@).", v7, v8, v9, v10, v11);

  sub_10000A57C();
}

void sub_1000359C0()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000A58C();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v2 = objc_msgSend((id)sub_10000A598(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100017F18();
  sub_100017F04((void *)&_mh_execute_header, v4, v5, "Requested foreground on download that does not appear to be scheduled.\nDownload: %{public}@\nClient: %{public}@", v6, v7, v8, v9, v10);

  sub_100017F30();
}

void sub_100035A4C()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000A58C();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v2 = objc_msgSend((id)sub_10000A598(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100017F18();
  sub_100017F04((void *)&_mh_execute_header, v4, v5, "Requested foreground on download that is marked as essential.\nDownload: %{public}@\nClient: %{public}@", v6, v7, v8, v9, v10);

  sub_100017F30();
}

void sub_100035AD8()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000A58C();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v2 = objc_msgSend((id)sub_10000A598(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100017F18();
  sub_100017F04((void *)&_mh_execute_header, v4, v5, "Requested foreground on frozen queue for download: %{public}@\nClient: %{public}@", v6, v7, v8, v9, v10);

  sub_100017F30();
}

void sub_100035B64()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  sub_10000A58C();
  objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v2 = objc_msgSend((id)sub_10000A598(), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_100017F18();
  sub_100017F04((void *)&_mh_execute_header, v4, v5, "Requested foreground on an optional download representing an existing essential download. This will be ignored.\nDownload: %{public}@\nClient: %{public}@", v6, v7, v8, v9, v10);

  sub_100017F30();
}

void sub_100035BF0()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018248();
  sub_100018234((void *)&_mh_execute_header, v0, v1, "Failed to create BATemporaryDirectory() = '%@': %s");
  sub_100005690();
}

void sub_100035C50(uint64_t a1, unsigned __int16 *a2, os_log_t log)
{
  int v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;

  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "The BATemporaryDirectory() = '%@' is not a directory [mode:%o]. Recreating...", (uint8_t *)&v4, 0x12u);
  sub_100005690();
}

void sub_100035CD4()
{
  uint64_t v0;
  os_log_t v1;

  sub_100018248();
  sub_100018234((void *)&_mh_execute_header, v0, v1, "Unable to stat BATemporaryDirectory() = '%@': %s");
  sub_100005690();
}

void sub_100035D34(NSObject *a1)
{
  int v2;
  _DWORD v3[2];

  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Failed to read developer mode status: %{darwin.errno}d", (uint8_t *)v3, 8u);
  sub_100005690();
}

void sub_100035DBC(os_log_t log)
{
  int v1;
  const __CFString *v2;

  v1 = 138543362;
  v2 = CFSTR("com.apple.appstored");
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to synchronized CFPreferencesApp for %{public}@", (uint8_t *)&v1, 0xCu);
  sub_100005690();
}

void sub_100035E38(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to checkin to begin listening for lockdown clients. Error: %d", (uint8_t *)v2, 8u);
  sub_10000DFAC();
}

void sub_100035EA8(void *a1, NSObject *a2)
{
  void *v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  __int16 v8;
  unsigned int v9;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serviceName"));
  if (v4)
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "serviceName"));
  else
    v5 = CFSTR("???");
  v6 = 138543618;
  v7 = v5;
  v8 = 1026;
  v9 = objc_msgSend(a1, "processIdentifier");
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Connection to service: %{public}@ from pid:%{public}d has invalid service name.", (uint8_t *)&v6, 0x12u);
  if (v4)

  sub_100017F30();
}

void sub_100035F78(void *a1)
{
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  objc_msgSend(a1, "processIdentifier");
  sub_1000272C8();
  _os_log_error_impl(v1, v2, v3, v4, v5, 8u);
  sub_100005690();
}

void sub_100035FF4(uint64_t a1)
{
  void *v2;
  os_log_t v3;
  os_log_type_t v4;
  const char *v5;
  uint8_t *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 48), "processIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 56), "description"));
  sub_1000272C8();
  _os_log_error_impl(v2, v3, v4, v5, v6, 0x12u);

  sub_100017F30();
}

void sub_10003609C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Rejecting launch of extension for %{public}@ because an extension identity could not be created.", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_1000360FC(void *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description")));
  objc_msgSend(v3, "UTF8String");
  sub_100027238();
  sub_10000A5A4((void *)&_mh_execute_header, a2, v4, "Failed to get extension process: %{public}s", v5);

  sub_10002722C();
}

void sub_100036188(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A5BC((void *)&_mh_execute_header, a1, a3, "Extension representation failed to generate XPC connection with unknown error.", a5, a6, a7, a8, 0);
  sub_10000DFAC();
}

void sub_1000361B8(void *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description")));
  objc_msgSend(v3, "UTF8String");
  sub_100027238();
  sub_10000A5A4((void *)&_mh_execute_header, a2, v4, "Extension representation failed to generate XPC connection: %{public}s", v5);

  sub_10002722C();
}

void sub_100036244(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  sub_100027238();
  sub_10000A5A4((void *)&_mh_execute_header, a2, v4, "Rejected extension connection (%{public}@) for mismatched team id", v5);

  sub_10002722C();
}

void sub_1000362C8(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  sub_100027238();
  sub_10000A5A4((void *)&_mh_execute_header, a2, v4, "failed to establish connection for extension (%{public}@)", v5);

  sub_10002722C();
}

void sub_10003634C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Rejecting launching extension for %{public}@ because it has already run too long.", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_1000363AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Rejecting talking to extension %{public}@ because the background activity is not allowed.", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_10003640C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Event (Canceled) dropped for client (%{public}@) failed because there is no app-info matching the identifier.", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_10003646C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000A58C();
  objc_msgSend(sub_1000272C0(v0), "UTF8String");
  sub_100027244();
  sub_100017F04((void *)&_mh_execute_header, v1, v2, "Event (Canceled) failed for client (%{public}s) because an error occured. %{public}@", v3, v4, v5, v6, v7);
  sub_10002722C();
}

void sub_1000364D8()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100027274();
  sub_100027220((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unable to update application info. LSBundleRecord from identifier failed (bundle identifier: %{public}@) %{public}@", v1);
  sub_100005690();
}

void sub_100036540()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Unable to update application info, no info dictionary could be found from LSBundleRecord. (bundle identifier: %{public}@)", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_1000365A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Unable to update application info, bundle record returned is not an LSApplicationRecord. (bundle identifier: %{public}@)", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_100036600()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100027274();
  sub_100027220((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unable to update application info, cannot create NSBundle from path. (bundle identifier: %{public}@, url: %{public}@)", v1);
  sub_100005690();
}

void sub_100036668()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_100027274();
  sub_100027220((void *)&_mh_execute_header, v0, (uint64_t)v0, "Unable to update application info, no info dictionary could be found. (bundle identifier: %{public}@, path: %{public}@)", v1);
  sub_100005690();
}

void sub_1000366D0()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000A58C();
  objc_msgSend(sub_1000272C0(v0), "UTF8String");
  sub_1000272D8();
  sub_100017F04((void *)&_mh_execute_header, v1, v2, "Event (%ld) dropped for client (%{public}s) failed because client Info dictionary is not accessible or valid.", v3, v4, v5, v6, v7);
  sub_10002722C();
}

void sub_10003673C()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000A58C();
  objc_msgSend(objc_retainAutorelease(v0), "UTF8String");
  sub_100027298();
  sub_10000A568((void *)&_mh_execute_header, v1, v2, "Event (%ld) dropped for client (%{public}s) failed because client Info dictionary is missing its '%{public}@' key.", v3, v4, v5, v6, 2u);
}

void sub_1000367C8()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000A58C();
  objc_msgSend(sub_1000272C0(v0), "UTF8String");
  sub_1000272D8();
  sub_100017F04((void *)&_mh_execute_header, v1, v2, "Event (%ld) dropped for client (%{public}s) failed because the app and extension do not share any application groups.", v3, v4, v5, v6, v7);
  sub_10002722C();
}

void sub_100036834(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend(sub_1000272C0(a1), "UTF8String");
  sub_100027238();
  sub_10000A5A4((void *)&_mh_execute_header, a2, v3, "Duplicate Event (Installed) received for client (%{public}s), ignoring.", v4);
  sub_10002722C();
}

void sub_1000368A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000A58C();
  objc_msgSend(sub_1000272F0(v0), "UTF8String");
  sub_100027244();
  sub_100017F04((void *)&_mh_execute_header, v1, v2, "Event (Paused) failed for client (%{public}s) because an error occured. %{public}@", v3, v4, v5, v6, v7);
  sub_10002722C();
}

void sub_100036914()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_10000A58C();
  objc_msgSend(sub_1000272F0(v0), "UTF8String");
  sub_100027244();
  sub_100017F04((void *)&_mh_execute_header, v1, v2, "Event (Resumed) failed for client (%{public}s) because an error occured. %{public}@", v3, v4, v5, v6, v7);
  sub_10002722C();
}

void sub_100036980()
{
  uint64_t v0;
  void *v1;
  os_log_t v2;
  os_log_type_t v3;
  const char *v4;
  uint8_t *v5;

  sub_10000A58C();
  objc_msgSend(objc_retainAutorelease(*(id *)(v0 + 32)), "UTF8String");
  sub_100027298();
  sub_1000272C8();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x2Au);
}

void sub_100036A28(uint8_t *a1, void *a2, _QWORD *a3, NSObject *a4)
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "applicationIdentifier"));
  *(_DWORD *)a1 = 138543362;
  *a3 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, a4, OS_LOG_TYPE_ERROR, "Unable to observe extension for (%{public}@), the BAApplicationInfo is missing an extensionIdentity.", a1, 0xCu);

}

void sub_100036A9C()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  sub_10000A58C();
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v0, "identifier"));
  sub_100027244();
  sub_100017F04((void *)&_mh_execute_header, v2, v3, "Unable to get RBS state because fetching a LSBundleRecord for (%{public}@) failed. %{public}@", v4, v5, v6, v7, v8);

  sub_100017F30();
}

void sub_100036B18()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  sub_10000A58C();
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "identifier"));
  v4 = (objc_class *)objc_opt_class(v0, v3);
  v5 = NSStringFromClass(v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v5);
  sub_100017F04((void *)&_mh_execute_header, v6, v7, "Unable to get RBS state for extension (%{public}@). Containing bundle record is not an application record. (Class:%{public}@)", v8, v9, v10, v11, 2u);

  sub_100017F30();
}

void sub_100036BBC()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_10002725C();
  sub_100027220((void *)&_mh_execute_header, v0, (uint64_t)v0, "Cannot message extension for '%{public}@' to answer auth challenge, canceling challenge for download: %{public}@", v1);
  sub_100005690();
}

void sub_100036C2C()
{
  NSObject *v0;
  uint8_t v1[24];

  sub_10002725C();
  sub_100027220((void *)&_mh_execute_header, v0, (uint64_t)v0, "Timed out messaging client for '%{public}@' to answer auth challenge for download: %{public}@", v1);
  sub_100005690();
}

void sub_100036C9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A5BC((void *)&_mh_execute_header, a1, a3, "Download did fail done", a5, a6, a7, a8, 0);
  sub_10000DFAC();
}

void sub_100036CCC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_10002725C();
  sub_100027220((void *)&_mh_execute_header, v0, v1, "Download did fail: %{public}@ with error: %{public}@", v2);
  sub_100005690();
}

void sub_100036D34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000272B4(__stack_chk_guard);
  sub_10002728C();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Failed to notify anyone about failed download: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_100036D94()
{
  int v0;
  const char *v1;

  v0 = 136315138;
  v1 = "BAAgentCore received a finished file that was a BAManifestDownload. This is invalid.";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN BackgroundAssets: %s", (uint8_t *)&v0, 0xCu);
  sub_100005690();
}

void sub_100036E14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10002728C();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Failed to find extension for installed application, removing download. %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_100036E78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000272B4(__stack_chk_guard);
  sub_10002728C();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Failed to notify extension about failed manifest download: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_100036ED8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000272B4(__stack_chk_guard);
  sub_10002728C();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Failed to notify extension about finished download: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_100036F38(id *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a1, "applicationIdentifier"));
  sub_100017F04((void *)&_mh_execute_header, v1, v2, "%s, Failed to access extension for %{public}@.", v3, v4, v5, v6, 2u);

  sub_10002722C();
}

void sub_100036FCC()
{
  id *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  sub_10000A58C();
  sub_10000B428(*v1);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v0, "applicationIdentifier"));
  sub_10000A568((void *)&_mh_execute_header, v2, v3, "%s, Manifest received with unsupported application event %{public}ld for %{public}@.", v4, v5, v6, v7, 2u);

}

void sub_100037088()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000272B4(__stack_chk_guard);
  sub_10002728C();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Removing manifest download as extension did not handle manifest. %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_1000370E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000272B4(__stack_chk_guard);
  sub_10002728C();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Failed to notify extension about failed manifest download due to sandbox extension issue: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_100037148(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A5BC((void *)&_mh_execute_header, a1, a3, "Failed to clear configuration overrides.", a5, a6, a7, a8, 0);
  sub_10000DFAC();
}

void sub_100037178()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Failed to acquire termination assertion for extension: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_1000371D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000272B4(__stack_chk_guard);
  sub_10002728C();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Extension failed to be removed with launchd: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_100037238()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Failed to deserialize application state: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_100037298()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "failed to open application state URL: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_1000372F8(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  sub_10000A5A4((void *)&_mh_execute_header, a3, (uint64_t)a3, "Failed to load serialized application state with error: %{public}@", (uint8_t *)a2);

}

void sub_100037344()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Failed to deserialize download queues: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_1000373A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "failed to open download queue URL: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_100037404(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  sub_100027238();
  sub_10000A5A4((void *)&_mh_execute_header, a2, v4, "Failed to load serialized downloads with error: %{public}@", v5);

  sub_10002722C();
}

void sub_100037484()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Failed to deserialize events file: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_1000374E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "failed to open deserialize events URL: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_100037544(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "error"));
  sub_100027238();
  sub_10000A5A4((void *)&_mh_execute_header, a2, v4, "Failed to load deserialize events with error: %{public}@", v5);

  sub_10002722C();
}

void sub_1000375C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Failed to serialize download queues: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_100037624()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Failed to serialize application state: %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_100037684()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Unable to generate archived representation of BADeveloperDebugServerMessage. %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_1000376E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100027238();
  sub_100007614((void *)&_mh_execute_header, v0, v1, "Requested background activity for application identifier that is not known to BAAgentCore. %{public}@", v2, v3, v4, v5, v6);
  sub_100005690();
}

void sub_100037744()
{
  int v0;
  const char *v1;

  v0 = 136315138;
  v1 = "NSErrorWithBAErrorDomainCodeUserInfo() called with unsupported NSErrorDomain.";
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "BUG IN BackgroundAssets: %s", (uint8_t *)&v0, 0xCu);
}

void sub_1000377C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_10000A5BC((void *)&_mh_execute_header, a1, a3, "A cursor was returned, this is unexpected for 1 result; is the operation hung? This is why.",
    a5,
    a6,
    a7,
    a8,
    0);
}

void sub_1000377FC()
{
  uint64_t v0;
  os_log_t v1;

  sub_100027274();
  sub_100018234((void *)&_mh_execute_header, v0, v1, "CKRecordID: %{public}@ returned an error: %{public}@");
}

void sub_100037860(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005680((void *)&_mh_execute_header, &_os_log_default, a3, "BUG IN BackgroundAssets: %s", a5, a6, a7, a8, 2u);
}

void sub_1000378D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005680((void *)&_mh_execute_header, &_os_log_default, a3, "BUG IN BackgroundAssets: %s", a5, a6, a7, a8, 2u);
}

void sub_100037950()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100027238();
  sub_10000A5A4((void *)&_mh_execute_header, v0, v1, "Application identifier (%{public}@) is not valid Universal Type Identifier. Failing.", v2);
}

void sub_1000379B8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100027238();
  sub_10000A5A4((void *)&_mh_execute_header, v0, v1, "Failed to find represented extension point. (ID:%{public}@", v2);
}

void sub_100037A20(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bundleIdentifier"));
  sub_100027238();
  sub_10000A5A4((void *)&_mh_execute_header, a2, v4, "Extension (%{public}@) is not part of a application bundle. Failing.", v5);

}

void sub_100037AA8(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  uint64_t v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "bundleIdentifier"));
  sub_100027238();
  v7 = 2114;
  v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Application bundle (%{public}@) is not the same as the bundle id (%{public}@). Failing.", v6, 0x16u);

}

void sub_100037B50(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Download %{public}@ rejected as we are out of download allowance.", (uint8_t *)&v2, 0xCu);
}

void sub_100037BC4(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "applicationIdentifier"));
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Dropping download because application identifier is invalid: %{public}@", (uint8_t *)&v4, 0xCu);

}

void sub_100037C58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005680((void *)&_mh_execute_header, &_os_log_default, a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
}

void sub_100037CD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005680((void *)&_mh_execute_header, &_os_log_default, a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
}

void sub_100037D48(uint64_t a1, id *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*a2, "applicationBundleIdentifier"));
  sub_100034A70();
  sub_100017F04((void *)&_mh_execute_header, v3, v4, "Failed to consume token: %@ for client: %{public}@", v5, v6, v7, v8, 2u);

  sub_100017F30();
}

void sub_100037DD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DFB4();
  sub_10000A5BC((void *)&_mh_execute_header, v0, v1, "Failed to get executable path from audit token.", v2, v3, v4, v5, v6);
  sub_10000DFAC();
}

void sub_100037E00()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DFB4();
  sub_10000A5BC((void *)&_mh_execute_header, v0, v1, "Executable path from audit token is invalid or is of an empty length.", v2, v3, v4, v5, v6);
  sub_10000DFAC();
}

void sub_100037E2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DFB4();
  sub_10000A5BC((void *)&_mh_execute_header, v0, v1, "Unable to construct a SecTaskRef from client audit token.", v2, v3, v4, v5, v6);
  sub_10000DFAC();
}

void sub_100037E58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DFB4();
  sub_10000A5BC((void *)&_mh_execute_header, v0, v1, "Code signed Info.plist is nil", v2, v3, v4, v5, v6);
  sub_10000DFAC();
}

void sub_100037E84()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100027238();
  sub_10000A5A4((void *)&_mh_execute_header, v0, v1, "Failed to lookup LSBundleRecord for audit token. %{public}@", v2);
  sub_100005690();
}

void sub_100037EE8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100027238();
  sub_10000A5A4((void *)&_mh_execute_header, v0, v1, "Bundle identifier from LSApplicationRecord is nil. %{public}@", v2);
  sub_100005690();
}

void sub_100037F4C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "applicationBundleIdentifier"));
  sub_100027238();
  sub_100034A3C((void *)&_mh_execute_header, v2, v3, "Application (%{public}@) is not found in the LaunchServices database and cannot be used with BackgroundAssets.", v4, v5, v6, v7, v8);

  sub_10002722C();
}

void sub_100037FC4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "applicationBundleIdentifier"));
  sub_100027238();
  sub_100034A3C((void *)&_mh_execute_header, v2, v3, "Application (%{public}@) is not registered with FrontBoardServices and cannot be used with BackgroundAssets.", v4, v5, v6, v7, v8);

  sub_10002722C();
}

void sub_10003803C()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];

  sub_100027238();
  sub_10000A5A4((void *)&_mh_execute_header, v0, v1, "Client is missing signing identifier, client must be signed with an identifier to use BackgroundAssets. %{public}@", v2);
  sub_100005690();
}

void sub_1000380A0(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "clientBundleIdentifier"));
  sub_100027238();
  sub_100034A3C((void *)&_mh_execute_header, v2, v3, "Client bundle identifier (%{public}@) is not valid Universal Type Identifier. Disconnecting.", v4, v5, v6, v7, v8);

  sub_10002722C();
}

void sub_100038118(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "applicationBundleIdentifier"));
  sub_100027238();
  sub_100034A3C((void *)&_mh_execute_header, v2, v3, "App bundle identifier (%{public}@) is not valid Universal Type Identifier. Disconnecting.", v4, v5, v6, v7, v8);

  sub_10002722C();
}

void sub_100038190(void *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "applicationBundleIdentifier"));
  v4 = NSStringFromFBSApplicationTrustState(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  sub_100034A70();
  sub_100017F04((void *)&_mh_execute_header, v6, v7, "Application (%{public}@) is not trusted on this iOS device and cannot be used with BackgroundAssets. Trust State: %{public}@", v8, v9, v10, v11, 2u);

  sub_100017F30();
}

void sub_10003822C(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  NSString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100027238();
  sub_100034A3C((void *)&_mh_execute_header, v5, v6, "LSBundleRecord returned is not an expected LSApplicationRecord. Class:%{public}@", v7, v8, v9, v10, v11);

  sub_10002722C();
}

void sub_1000382A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DFB4();
  sub_10000A5BC((void *)&_mh_execute_header, v0, v1, "Code signed bundle identifier is nil", v2, v3, v4, v5, v6);
  sub_10000DFAC();
}

void sub_1000382D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DFB4();
  sub_10000A5BC((void *)&_mh_execute_header, v0, v1, "LSBundleRecord.bundleRecordForAuditToken returned a record without a bundle identifier.", v2, v3, v4, v5, v6);
  sub_10000DFAC();
}

void sub_100038300()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DFB4();
  sub_10000A5BC((void *)&_mh_execute_header, v0, v1, "App identifier is nil or 0 length", v2, v3, v4, v5, v6);
  sub_10000DFAC();
}

void sub_10003832C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DFB4();
  sub_10000A5BC((void *)&_mh_execute_header, v0, v1, "Failed to get application record. Falling back to last component removal.", v2, v3, v4, v5, v6);
  sub_10000DFAC();
}

void sub_100038358(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  NSString *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  v3 = NSStringFromClass(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  sub_100027238();
  sub_100034A3C((void *)&_mh_execute_header, v5, v6, "LSBundleRecord returned is not an expected LSApplicationExtensionRecord. Class:%{public}@", v7, v8, v9, v10, v11);

  sub_10002722C();
}

void sub_1000383D4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034A60((void *)&_mh_execute_header, a2, a3, "Failed to get client application code signing information, error OSStatus: %d", a5, a6, a7, a8, 0);
  sub_10000DFAC();
}

void sub_100038438(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100034A60((void *)&_mh_execute_header, a2, a3, "Failed to get client application static code object, error OSStatus: %d", a5, a6, a7, a8, 0);
  sub_10000DFAC();
}

void sub_10003849C(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description"));
  sub_100034A70();
  sub_100017F04((void *)&_mh_execute_header, v2, v3, "Failed to send %s. error: %{public}@", v4, v5, v6, v7, 2u);

  sub_10002722C();
}

void sub_100038524(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = objc_msgSend((id)sub_100034A50(a1, a2), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000A54C();
  sub_10000A568((void *)&_mh_execute_header, v4, v5, "Failed to send %s for: %{public}@ error: %{public}@", v6, v7, v8, v9, 2u);

  sub_10000A57C();
}

void sub_1000385AC(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = objc_msgSend((id)sub_100034A50(a1, a2), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000A54C();
  sub_10000A568((void *)&_mh_execute_header, v4, v5, "Failed to send %s for: %{public}@ error: %{public}@", v6, v7, v8, v9, 2u);

  sub_10000A57C();
}

void sub_100038634(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = objc_msgSend((id)sub_100034A50(a1, a2), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000A54C();
  sub_10000A568((void *)&_mh_execute_header, v4, v5, "Failed to send %s for: %{public}@ error: %{public}@", v6, v7, v8, v9, 2u);

  sub_10000A57C();
}

void sub_1000386BC(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = objc_msgSend((id)sub_100034A50(a1, a2), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000A54C();
  sub_10000A568((void *)&_mh_execute_header, v4, v5, "Failed to send %s for: %{public}@ error: %{public}@", v6, v7, v8, v9, 2u);

  sub_10000A57C();
}

void sub_100038744(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = objc_msgSend((id)sub_100034A50(a1, a2), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000A54C();
  sub_10000A568((void *)&_mh_execute_header, v4, v5, "Failed to send %s for: %{public}@ error: %{public}@", v6, v7, v8, v9, 2u);

  sub_10000A57C();
}

void sub_1000387CC(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = objc_msgSend((id)sub_100034A50(a1, a2), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000A54C();
  sub_10000A568((void *)&_mh_execute_header, v4, v5, "Failed to send %s for: %{public}@ error: %{public}@", v6, v7, v8, v9, 2u);

  sub_10000A57C();
}

void sub_100038854(uint64_t a1, uint64_t a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = objc_msgSend((id)sub_100034A50(a1, a2), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  sub_10000A54C();
  sub_10000A568((void *)&_mh_execute_header, v4, v5, "Failed to send %s for: %{public}@ error: %{public}@", v6, v7, v8, v9, 2u);

  sub_10000A57C();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLForDirectory_inDomain_appropriateForURL_create_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLForDirectory:inDomain:appropriateForURL:create:error:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend___enqueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__enqueue:");
}

id objc_msgSend___handleApplicationLaunchedWithInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__handleApplicationLaunchedWithInfo:");
}

id objc_msgSend___schedulingPermittedWithIdentifier_downloadQueue_appInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__schedulingPermittedWithIdentifier:downloadQueue:appInfo:error:");
}

id objc_msgSend__addActivityWithIdentifier_takePowerAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addActivityWithIdentifier:takePowerAssertion:");
}

id objc_msgSend__addDownload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_addDownload:");
}

id objc_msgSend__applicationIdentifierAllowsBackgroundActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_applicationIdentifierAllowsBackgroundActivity:");
}

id objc_msgSend__asyncAwaitLockdownClientMessage_waitQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_asyncAwaitLockdownClientMessage:waitQueue:");
}

id objc_msgSend__average_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_average:");
}

id objc_msgSend__baassets_stringByRemovingLastIdentifierComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baassets_stringByRemovingLastIdentifierComponent");
}

id objc_msgSend__baassets_validUTI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baassets_validUTI");
}

id objc_msgSend__baassets_validUTIWithWildcard(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_baassets_validUTIWithWildcard");
}

id objc_msgSend__backgroundActivityStateDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_backgroundActivityStateDidChange");
}

id objc_msgSend__cellularNetworkProhibitsDownloadUsingError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cellularNetworkProhibitsDownloadUsingError:");
}

id objc_msgSend__checkConnection_hasAllowedTeamIDForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkConnection:hasAllowedTeamIDForIdentifier:");
}

id objc_msgSend__checkForExit(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkForExit");
}

id objc_msgSend__checkIdentifierHasExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_checkIdentifierHasExtension:");
}

id objc_msgSend__clearState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_clearState");
}

id objc_msgSend__combineExistingError_newError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_combineExistingError:newError:");
}

id objc_msgSend__connectionReplyQueueForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectionReplyQueueForIdentifier:");
}

id objc_msgSend__connectionsForApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_connectionsForApplicationIdentifier:");
}

id objc_msgSend__consumeAllowanceShouldStopWithAdditionalBytes_downloadNecessity_isManifest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_consumeAllowanceShouldStopWithAdditionalBytes:downloadNecessity:isManifest:");
}

id objc_msgSend__consumeAvailableDownloadSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_consumeAvailableDownloadSize");
}

id objc_msgSend__debugConsumeTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_debugConsumeTime:");
}

id objc_msgSend__debugDownloadTime_clear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_debugDownloadTime:clear:");
}

id objc_msgSend__debugShutdown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_debugShutdown");
}

id objc_msgSend__decrement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_decrement");
}

id objc_msgSend__deleteDownloadQueueForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deleteDownloadQueueForIdentifier:");
}

id objc_msgSend__dequeueNext(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dequeueNext");
}

id objc_msgSend__deserializeApplicationList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deserializeApplicationList");
}

id objc_msgSend__deserializeDownloadQueues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deserializeDownloadQueues");
}

id objc_msgSend__deserializeState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deserializeState");
}

id objc_msgSend__deserializeUndeliveredEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deserializeUndeliveredEvents");
}

id objc_msgSend__downloadActualAsset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadActualAsset");
}

id objc_msgSend__downloadDidPause(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadDidPause");
}

id objc_msgSend__downloadFailedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadFailedWithError:");
}

id objc_msgSend__downloadQueueForIdentifier_create_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadQueueForIdentifier:create:error:");
}

id objc_msgSend__downloadSucceededWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadSucceededWithURL:");
}

id objc_msgSend__downloadWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadWithIdentifier:");
}

id objc_msgSend__downloadWithUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadWithUniqueIdentifier:");
}

id objc_msgSend__downloaderExtensionForApplicationIdentifier_cacheOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloaderExtensionForApplicationIdentifier:cacheOnly:");
}

id objc_msgSend__downloadsInProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_downloadsInProgress");
}

id objc_msgSend__entitledForCloudKitWithDownload_outError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_entitledForCloudKitWithDownload:outError:");
}

id objc_msgSend__essentialAssetState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_essentialAssetState");
}

id objc_msgSend__essentialAssetsProgressDescriptorWithAppInfo_essentialAssetState_sizeDownloaded_totalDownloadSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_essentialAssetsProgressDescriptorWithAppInfo:essentialAssetState:sizeDownloaded:totalDownloadSize:");
}

id objc_msgSend__formatMostFrequentError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_formatMostFrequentError");
}

id objc_msgSend__handleChallenge_authenticationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleChallenge:authenticationHandler:");
}

id objc_msgSend__handleDownloadCompletionWithFileLocation_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleDownloadCompletionWithFileLocation:response:");
}

id objc_msgSend__handleDownloadFailureWithError_resumeData_response_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleDownloadFailureWithError:resumeData:response:");
}

id objc_msgSend__handleProgressWithBytesReceived_totalBytesRecieved_totalDownloadSize_resuming_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_handleProgressWithBytesReceived:totalBytesRecieved:totalDownloadSize:resuming:");
}

id objc_msgSend__increment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_increment");
}

id objc_msgSend__informDelegateOfFailedDownloadWithError_silentFailure_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_informDelegateOfFailedDownloadWithError:silentFailure:");
}

id objc_msgSend__informDelegateOfPausedDownloadWithWillImmediatelyResume_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_informDelegateOfPausedDownloadWithWillImmediatelyResume:");
}

id objc_msgSend__initUniqueWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initUniqueWithURL:");
}

id objc_msgSend__median_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_median:");
}

id objc_msgSend__newOperationQuery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_newOperationQuery");
}

id objc_msgSend__pokeScheduler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pokeScheduler");
}

id objc_msgSend__populateAllowedDomainInfoWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_populateAllowedDomainInfoWithArray:");
}

id objc_msgSend__powerSourceHasChanged(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_powerSourceHasChanged");
}

id objc_msgSend__printDebugState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_printDebugState");
}

id objc_msgSend__processLockdownClientMessage_withConnection_withQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_processLockdownClientMessage:withConnection:withQueue:");
}

id objc_msgSend__remainingDownloadAllowanceWithNecessity_isManifest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remainingDownloadAllowanceWithNecessity:isManifest:");
}

id objc_msgSend__removeActivityAndPowerAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeActivityAndPowerAssertion");
}

id objc_msgSend__removeDownload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_removeDownload:");
}

id objc_msgSend__reportEssentialAssetStateAndProgress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reportEssentialAssetStateAndProgress");
}

id objc_msgSend__requestNetworkConsentWithApplication_userInitiated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestNetworkConsentWithApplication:userInitiated:");
}

id objc_msgSend__scheduleDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_scheduleDownloads");
}

id objc_msgSend__sendingMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_sendingMessage");
}

id objc_msgSend__serializableAllowedDomainInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_serializableAllowedDomainInfo");
}

id objc_msgSend__serializeApplicationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_serializeApplicationState");
}

id objc_msgSend__serializeDownloadQueues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_serializeDownloadQueues");
}

id objc_msgSend__serializeUndeliveredEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_serializeUndeliveredEvents");
}

id objc_msgSend__setClearBeforeShutdown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setClearBeforeShutdown");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setupConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupConnection");
}

id objc_msgSend__setupXPCActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupXPCActivity");
}

id objc_msgSend__shutdownAgent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_shutdownAgent");
}

id objc_msgSend__startDownloadWithDelegate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startDownloadWithDelegate:error:");
}

id objc_msgSend__startExitTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startExitTimer");
}

id objc_msgSend__systemConnections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_systemConnections");
}

id objc_msgSend__updateProcessMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateProcessMonitor");
}

id objc_msgSend__updateStateForAppBundleIdentifier_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateStateForAppBundleIdentifier:state:");
}

id objc_msgSend__updateStateForAppExtensionBundleIdentifier_appBundleIdentifier_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateStateForAppExtensionBundleIdentifier:appBundleIdentifier:state:");
}

id objc_msgSend__validateAndSetClientIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_validateAndSetClientIdentifier");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_acquireAssertionSync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireAssertionSync:");
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_activeDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeDownloads");
}

id objc_msgSend_activeManifestDownload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeManifestDownload");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addPort_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPort:forMode:");
}

id objc_msgSend_agentCore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "agentCore");
}

id objc_msgSend_allDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allDownloads");
}

id objc_msgSend_allDownloadsCompleted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allDownloadsCompleted");
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allHeaderFields");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowedDownloadDomainWildcards(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedDownloadDomainWildcards");
}

id objc_msgSend_allowedDownloadDomains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowedDownloadDomains");
}

id objc_msgSend_allowsBackgroundActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowsBackgroundActivity");
}

id objc_msgSend_allowsCellularAccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowsCellularAccess");
}

id objc_msgSend_allowsExpensiveNetworkAccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowsExpensiveNetworkAccess");
}

id objc_msgSend_amountDownloaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "amountDownloaded");
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appBundleIdentifier");
}

id objc_msgSend_appBundleURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appBundleURL");
}

id objc_msgSend_appInfoRecursiveLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appInfoRecursiveLock");
}

id objc_msgSend_appStoreMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appStoreMetadata");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationBundleIdentifier");
}

id objc_msgSend_applicationExtensionRecords(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationExtensionRecords");
}

id objc_msgSend_applicationExtensionState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationExtensionState");
}

id objc_msgSend_applicationExtensionStateForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationExtensionStateForIdentifier:");
}

id objc_msgSend_applicationForIdentifierAllowsBackgroundActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationForIdentifierAllowsBackgroundActivity:");
}

id objc_msgSend_applicationGroupIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationGroupIdentifier");
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIdentifier");
}

id objc_msgSend_applicationInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationInfo");
}

id objc_msgSend_applicationInfoForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationInfoForIdentifier:");
}

id objc_msgSend_applicationInfoIfExistsForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationInfoIfExistsForIdentifier:");
}

id objc_msgSend_applicationInstallCanceledWithIdentifier_userInitiated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationInstallCanceledWithIdentifier:userInitiated:");
}

id objc_msgSend_applicationInstalled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationInstalled");
}

id objc_msgSend_applicationInstallingWithUpdateInstall_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationInstallingWithUpdateInstall:");
}

id objc_msgSend_applicationLaunched(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationLaunched");
}

id objc_msgSend_applicationPlaceholderReadyWithIdentifier_placeholderBundleURL_userInitiated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationPlaceholderReadyWithIdentifier:placeholderBundleURL:userInitiated:");
}

id objc_msgSend_applicationPrepareWithDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationPrepareWithDescriptor:");
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_applicationSecurityGroups(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationSecurityGroups");
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationState");
}

id objc_msgSend_applicationStateForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationStateForIdentifier:");
}

id objc_msgSend_applicationTeamIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationTeamIdentifier");
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedDataWithRootObject:requiringSecureCoding:error:");
}

id objc_msgSend_archivedRepresentationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "archivedRepresentationWithError:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assetFound(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetFound");
}

id objc_msgSend_assetKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetKey");
}

id objc_msgSend_assetSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetSize");
}

id objc_msgSend_assetURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assetURL");
}

id objc_msgSend_asyncClientBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asyncClientBlock");
}

id objc_msgSend_asyncClientNotificationQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "asyncClientNotificationQueue");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auditToken");
}

id objc_msgSend_authenticationMethod(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticationMethod");
}

id objc_msgSend_automaticInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "automaticInstall");
}

id objc_msgSend_awaitingBlockCompletion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "awaitingBlockCompletion");
}

id objc_msgSend_awaitingConnectivityTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "awaitingConnectivityTimeout");
}

id objc_msgSend_awaitingConnectivityTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "awaitingConnectivityTimer");
}

id objc_msgSend_awaitingNetworkConsent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "awaitingNetworkConsent");
}

id objc_msgSend_baURLSessionDelegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "baURLSessionDelegate");
}

id objc_msgSend_backgroundDownload_failedWithError_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundDownload:failedWithError:completionHandler:");
}

id objc_msgSend_backgroundDownload_finishedWithSandboxToken_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundDownload:finishedWithSandboxToken:completionHandler:");
}

id objc_msgSend_backgroundSessionConfigurationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundSessionConfigurationWithIdentifier:");
}

id objc_msgSend_bailError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bailError");
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "block");
}

id objc_msgSend_blockFired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockFired");
}

id objc_msgSend_blockQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockQueue");
}

id objc_msgSend_blockQueueLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockQueueLock");
}

id objc_msgSend_blockQueueWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blockQueueWithIdentifier:");
}

id objc_msgSend_blocksAwaitingNetworkConsent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "blocksAwaitingNetworkConsent");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundle");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_bundleRecordForAuditToken_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleRecordForAuditToken:error:");
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleURL");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_callBlockWhenConnectionReady_onQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callBlockWhenConnectionReady:onQueue:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelAllDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAllDownloads");
}

id objc_msgSend_cancelAllDownloadsSilently(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelAllDownloadsSilently");
}

id objc_msgSend_cancelByProducingResumeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelByProducingResumeData:");
}

id objc_msgSend_cancelDownload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelDownload");
}

id objc_msgSend_cancelDownload_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelDownload:error:");
}

id objc_msgSend_cancelDownload_forClientIdentifier_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelDownload:forClientIdentifier:completionBlock:");
}

id objc_msgSend_cancelDownloadSilently(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelDownloadSilently");
}

id objc_msgSend_cancelWithResumeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelWithResumeData:");
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInsensitiveCompare:");
}

id objc_msgSend_cellular(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellular");
}

id objc_msgSend_cellularPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellularPolicy");
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterSetWithCharactersInString:");
}

id objc_msgSend_classesForSerialization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classesForSerialization");
}

id objc_msgSend_clearAllOverrides(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearAllOverrides");
}

id objc_msgSend_clientBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientBundleIdentifier");
}

id objc_msgSend_clientHandlerQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientHandlerQueue");
}

id objc_msgSend_clientProgressConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientProgressConfiguration");
}

id objc_msgSend_clientType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientType");
}

id objc_msgSend_clientWorkQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientWorkQueue");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_component_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "component:fromDate:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_connectionDisconnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionDisconnected:");
}

id objc_msgSend_connectionInvalidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionInvalidated");
}

id objc_msgSend_connectionIsValid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionIsValid");
}

id objc_msgSend_connectionLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionLock");
}

id objc_msgSend_connectionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionQueue");
}

id objc_msgSend_connectionReplyQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionReplyQueue");
}

id objc_msgSend_connections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connections");
}

id objc_msgSend_consumeAllowanceShouldStopWithAdditionalBytes_downloadNecessity_isManifest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "consumeAllowanceShouldStopWithAdditionalBytes:downloadNecessity:isManifest:");
}

id objc_msgSend_consumeToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "consumeToken:");
}

id objc_msgSend_container(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "container");
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerID");
}

id objc_msgSend_containerIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerIdentifier");
}

id objc_msgSend_containingBundleRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containingBundleRecord");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsValueForKey:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "context");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfBytesExpectedToReceive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countOfBytesExpectedToReceive");
}

id objc_msgSend_countOfBytesReceived(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countOfBytesReceived");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_credentialForTrust_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "credentialForTrust:");
}

id objc_msgSend_currentOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentOperation");
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRequest");
}

id objc_msgSend_currentRuntime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRuntime");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataTaskWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_database(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "database");
}

id objc_msgSend_databaseScope(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "databaseScope");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_debugClearState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugClearState");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugDescription");
}

id objc_msgSend_debugRuleValidity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "debugRuleValidity");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultContainer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultContainer");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultRecordZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultRecordZone");
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultSessionConfiguration");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_demoteAllForegroundDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "demoteAllForegroundDownloads");
}

id objc_msgSend_demoteToBackground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "demoteToBackground");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptor");
}

id objc_msgSend_descriptorWithAppBundleIdentifier_appStoreMetadata_client_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptorWithAppBundleIdentifier:appStoreMetadata:client:");
}

id objc_msgSend_destinationDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "destinationDirectory");
}

id objc_msgSend_determineInstallSourceIfUnsetFromAuditToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "determineInstallSourceIfUnsetFromAuditToken:");
}

id objc_msgSend_deviceIdentifierForVendor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceIdentifierForVendor");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantPast");
}

id objc_msgSend_doPeriodicUpdateCheck(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doPeriodicUpdateCheck");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domain");
}

id objc_msgSend_domainAllowlist(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domainAllowlist");
}

id objc_msgSend_download(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "download");
}

id objc_msgSend_download_didReceiveChallenge_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "download:didReceiveChallenge:completionHandler:");
}

id objc_msgSend_download_didResumeAtOffset_expectedTotalBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "download:didResumeAtOffset:expectedTotalBytes:");
}

id objc_msgSend_download_didWriteBytes_totalBytesWritten_totalBytesExpectedToWrite_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "download:didWriteBytes:totalBytesWritten:totalBytesExpectedToWrite:");
}

id objc_msgSend_download_failedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "download:failedWithError:");
}

id objc_msgSend_download_finishedWithFileURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "download:finishedWithFileURL:");
}

id objc_msgSend_downloadAllowance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadAllowance");
}

id objc_msgSend_downloadCachePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadCachePath");
}

id objc_msgSend_downloadDidBegin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadDidBegin:");
}

id objc_msgSend_downloadDidPause(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadDidPause");
}

id objc_msgSend_downloadDidPause_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadDidPause:");
}

id objc_msgSend_downloadError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadError");
}

id objc_msgSend_downloadFailedWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadFailedWithError:");
}

id objc_msgSend_downloadForIdentifier_forClientIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadForIdentifier:forClientIdentifier:");
}

id objc_msgSend_downloadIdentifier_didFailWithError_wasHandled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadIdentifier:didFailWithError:wasHandled:");
}

id objc_msgSend_downloadIdentifier_didReceiveChallenge_authChallengeHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadIdentifier:didReceiveChallenge:authChallengeHandler:");
}

id objc_msgSend_downloadIdentifier_didReceiveChallenge_authChallengeHandler_withCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadIdentifier:didReceiveChallenge:authChallengeHandler:withCompletion:");
}

id objc_msgSend_downloadIdentifier_didWriteBytes_totalBytesWritten_totalBytesExpectedToWrite_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadIdentifier:didWriteBytes:totalBytesWritten:totalBytesExpectedToWrite:");
}

id objc_msgSend_downloadIdentifierDidBegin_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadIdentifierDidBegin:");
}

id objc_msgSend_downloadIdentifierDidFinish_sandboxExtensionToken_wasHandled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadIdentifierDidFinish:sandboxExtensionToken:wasHandled:");
}

id objc_msgSend_downloadIdentifierDidPause_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadIdentifierDidPause:");
}

id objc_msgSend_downloadLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadLock");
}

id objc_msgSend_downloadManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadManager");
}

id objc_msgSend_downloadQueue_essentialAssetState_bytesWritten_totalBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadQueue:essentialAssetState:bytesWritten:totalBytes:");
}

id objc_msgSend_downloadQueue_manifest_finishedWithFileURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadQueue:manifest:finishedWithFileURL:");
}

id objc_msgSend_downloadQueue_permittedToStartDownloadsWithNecessity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadQueue:permittedToStartDownloadsWithNecessity:");
}

id objc_msgSend_downloadQueuesByClientIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadQueuesByClientIdentifier");
}

id objc_msgSend_downloadStartDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadStartDate");
}

id objc_msgSend_downloadSucceededWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadSucceededWithURL:");
}

id objc_msgSend_downloadTask(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadTask");
}

id objc_msgSend_downloadTaskWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadTaskWithRequest:");
}

id objc_msgSend_downloadTaskWithResumeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadTaskWithResumeData:");
}

id objc_msgSend_downloadTimeValidityDidChange(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadTimeValidityDidChange");
}

id objc_msgSend_downloadWithUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadWithUniqueIdentifier:");
}

id objc_msgSend_downloadedFileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadedFileSize");
}

id objc_msgSend_downloaderExtensionForApplicationIdentifier_cacheOnly_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloaderExtensionForApplicationIdentifier:cacheOnly:");
}

id objc_msgSend_downloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloads");
}

id objc_msgSend_downloadsForIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadsForIdentifier:");
}

id objc_msgSend_downloadsForRequest_manifestURL_manifestToken_extensionInfo_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downloadsForRequest:manifestURL:manifestToken:extensionInfo:completionHandler:");
}

id objc_msgSend_drain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drain");
}

id objc_msgSend_drainSpecificWithToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drainSpecificWithToken:");
}

id objc_msgSend_elapsedTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "elapsedTime");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodedData");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDate");
}

id objc_msgSend_endowmentNamespaces(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endowmentNamespaces");
}

id objc_msgSend_enqueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueue:");
}

id objc_msgSend_enqueue_waitLimitDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueue:waitLimitDate:");
}

id objc_msgSend_entitlementNamed_ofClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entitlementNamed:ofClass:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsWithOptions:usingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsWithOptions_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsWithOptions:usingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_essentialAmountDownloaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "essentialAmountDownloaded");
}

id objc_msgSend_essentialAssetDownloadAllowance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "essentialAssetDownloadAllowance");
}

id objc_msgSend_essentialAssetIdentifiersMonitored(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "essentialAssetIdentifiersMonitored");
}

id objc_msgSend_essentialAssetsBytesDownloaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "essentialAssetsBytesDownloaded");
}

id objc_msgSend_essentialAssetsBytesTotal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "essentialAssetsBytesTotal");
}

id objc_msgSend_essentialAssetsProgressDescriptorWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "essentialAssetsProgressDescriptorWithIdentifier:");
}

id objc_msgSend_essentialAssetsStateWithSizeDownloaded_totalDownloadSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "essentialAssetsStateWithSizeDownloaded:totalDownloadSize:");
}

id objc_msgSend_essentialAssetsWaitingOnContentRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "essentialAssetsWaitingOnContentRequest");
}

id objc_msgSend_essentialDownloadAllowance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "essentialDownloadAllowance");
}

id objc_msgSend_essentialMaxInstallSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "essentialMaxInstallSize");
}

id objc_msgSend_eventError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventError");
}

id objc_msgSend_eventName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventName");
}

id objc_msgSend_eventPayload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventPayload");
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventType");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_exclusiveAccessBlockQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exclusiveAccessBlockQueue");
}

id objc_msgSend_executeQueries_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeQueries:");
}

id objc_msgSend_executeWithSuccessfulDequeue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeWithSuccessfulDequeue:");
}

id objc_msgSend_exitEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exitEvent");
}

id objc_msgSend_exitTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exitTimer");
}

id objc_msgSend_expectedContentLength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "expectedContentLength");
}

id objc_msgSend_extendClientSandboxForStagedURL_allowWrites_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extendClientSandboxForStagedURL:allowWrites:");
}

id objc_msgSend_extensionActiveCalls(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionActiveCalls");
}

id objc_msgSend_extensionConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionConnection");
}

id objc_msgSend_extensionConnections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionConnections");
}

id objc_msgSend_extensionContainingApplicationList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionContainingApplicationList");
}

id objc_msgSend_extensionDisconnectedWithIdentifier_connectionProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionDisconnectedWithIdentifier:connectionProxy:");
}

id objc_msgSend_extensionExited(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionExited");
}

id objc_msgSend_extensionIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionIdentity");
}

id objc_msgSend_extensionPointIdentifierQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionPointIdentifierQuery:");
}

id objc_msgSend_extensionPointQueriesWithPostProcessing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionPointQueriesWithPostProcessing:");
}

id objc_msgSend_extensionPointRecord(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionPointRecord");
}

id objc_msgSend_extensionProcess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionProcess");
}

id objc_msgSend_extensionProcessWithConfiguration_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionProcessWithConfiguration:error:");
}

id objc_msgSend_extensionRuntime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionRuntime");
}

id objc_msgSend_extensionRuntimeEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionRuntimeEvents");
}

id objc_msgSend_extensionWakeAssertions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionWakeAssertions");
}

id objc_msgSend_extensionWillTerminate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionWillTerminate");
}

id objc_msgSend_failureReason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "failureReason");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileHandle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileHandle");
}

id objc_msgSend_filePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filePath");
}

id objc_msgSend_fileSizes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSizes");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURL");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishTasksAndInvalidate");
}

id objc_msgSend_fireByTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fireByTimer");
}

id objc_msgSend_fireDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fireDate");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_formatError_withCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatError:withCount:");
}

id objc_msgSend_freeze(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "freeze");
}

id objc_msgSend_frozen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frozen");
}

id objc_msgSend_fullDownloadSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullDownloadSize");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_groupContainerURLs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupContainerURLs");
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handle");
}

id objc_msgSend_handleApplicationEvent_identifier_bundleURLPath_userInitiated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleApplicationEvent:identifier:bundleURLPath:userInitiated:");
}

id objc_msgSend_handleApplicationLaunched_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleApplicationLaunched:");
}

id objc_msgSend_hasLaunchedApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasLaunchedApplication");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "host");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_identifiersToBlockQueues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifiersToBlockQueues");
}

id objc_msgSend_identifiersToDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifiersToDownloads");
}

id objc_msgSend_indexOfObject_inSortedRange_options_usingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObject:inSortedRange:options:usingComparator:");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initPrivatelyWithApplicationGroupIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initPrivatelyWithApplicationGroupIdentifier:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initWithApplicationIdentifier_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithApplicationIdentifier:delegate:");
}

id objc_msgSend_initWithApplicationInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithApplicationInfo:");
}

id objc_msgSend_initWithApplicationProxy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithApplicationProxy:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithContainerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainerID:");
}

id objc_msgSend_initWithContainerIdentifier_environment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContainerIdentifier:environment:");
}

id objc_msgSend_initWithContentRequest_applicationIdentifier_installSource_downloads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithContentRequest:applicationIdentifier:installSource:downloads:");
}

id objc_msgSend_initWithCursor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCursor:");
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDelegate:");
}

id objc_msgSend_initWithDownload_withDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDownload:withDelegate:");
}

id objc_msgSend_initWithEventType_download_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEventType:download:error:");
}

id objc_msgSend_initWithExplanation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExplanation:");
}

id objc_msgSend_initWithExtension_XPCConnection_applicationInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExtension:XPCConnection:applicationInfo:");
}

id objc_msgSend_initWithFileDescriptor_closeOnDealloc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:closeOnDealloc:");
}

id objc_msgSend_initWithFileDescriptor_originalPath_closeOnDealloc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:originalPath:closeOnDealloc:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_applicationTeamIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:applicationTeamIdentifier:");
}

id objc_msgSend_initWithIdentifier_recordType_expectedFieldKey_expectedFieldValue_assetKey_applicationGroupIdentifier_containerIdentifier_zoneID_databaseScope_priority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:recordType:expectedFieldKey:expectedFieldValue:assetKey:applicationGroupIdentifier:containerIdentifier:zoneID:databaseScope:priority:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithNSXPCConnection_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNSXPCConnection:error:");
}

id objc_msgSend_initWithNotifyQueue_withDestinationDirectory_uniqueFileName_inBackground_withAuthenticationHandler_withRedirectResponseHandler_withBytesReceivedHandler_usingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNotifyQueue:withDestinationDirectory:uniqueFileName:inBackground:withAuthenticationHandler:withRedirectResponseHandler:withBytesReceivedHandler:usingBlock:");
}

id objc_msgSend_initWithPersistentIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPersistentIdentifier:");
}

id objc_msgSend_initWithPredicate_context_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPredicate:context:");
}

id objc_msgSend_initWithQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQuery:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithRecordType_predicate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRecordType:predicate:");
}

id objc_msgSend_initWithResumeData_withDestinationDirectory_inBackground_withAuthenticationHandler_withRedirectResponseHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithResumeData:withDestinationDirectory:inBackground:withAuthenticationHandler:withRedirectResponseHandler:");
}

id objc_msgSend_initWithStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStartDate:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithToken_block_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithToken:block:");
}

id objc_msgSend_initWithURL_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:allowPlaceholder:error:");
}

id objc_msgSend_initWithURL_requireValid_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:requireValid:error:");
}

id objc_msgSend_initWithURLRequest_withDestinationDirectory_inBackground_withAuthenticationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURLRequest:withDestinationDirectory:inBackground:withAuthenticationHandler:");
}

id objc_msgSend_initWithVersionAllowed_failureExplanation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithVersionAllowed:failureExplanation:");
}

id objc_msgSend_initialBackgroundCellularPolicy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialBackgroundCellularPolicy");
}

id objc_msgSend_initialConnectivityTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialConnectivityTimeout");
}

id objc_msgSend_initialRestrictionsAreEnforced(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initialRestrictionsAreEnforced");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_installConnectivityTimerWithTimeout_task_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installConnectivityTimerWithTimeout:task:");
}

id objc_msgSend_installSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installSource");
}

id objc_msgSend_installationSourceFromAuditToken_applicationIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "installationSourceFromAuditToken:applicationIdentifier:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateAndCancel");
}

id objc_msgSend_invalidateBlockQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateBlockQueue:");
}

id objc_msgSend_invalidateExtensionWithAppInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateExtensionWithAppInfo:");
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invertedSet");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActive");
}

id objc_msgSend_isApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isApplication");
}

id objc_msgSend_isAutomaticAppUpdatesAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAutomaticAppUpdatesAllowed");
}

id objc_msgSend_isConnectedToPower(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnectedToPower");
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

id objc_msgSend_isForegroundDownload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isForegroundDownload");
}

id objc_msgSend_isLowPowerModeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLowPowerModeEnabled");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isMoreThan24HoursAgo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMoreThan24HoursAgo");
}

id objc_msgSend_isValidTimeForDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidTimeForDownloads");
}

id objc_msgSend_lastApplicationLaunchTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastApplicationLaunchTime");
}

id objc_msgSend_lastDownloadIsValidValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastDownloadIsValidValue");
}

id objc_msgSend_lastDownloadStartDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastDownloadStartDate");
}

id objc_msgSend_lastExclusiveAccessBlockToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastExclusiveAccessBlockToken");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_lastPeriodicCheckTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPeriodicCheckTime");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listener");
}

id objc_msgSend_listener_shouldAcceptNewClientConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listener:shouldAcceptNewClientConnection:");
}

id objc_msgSend_listener_shouldAcceptNewSPIConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listener:shouldAcceptNewSPIConnection:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_lockDownQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lockDownQueue");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_makeXPCConnectionWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "makeXPCConnectionWithError:");
}

id objc_msgSend_manifestURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manifestURL");
}

id objc_msgSend_masqueradeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "masqueradeIdentifier");
}

id objc_msgSend_maxInstallSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxInstallSize");
}

id objc_msgSend_messageOperation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageOperation");
}

id objc_msgSend_messageVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageVersion");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_mostRecentError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mostRecentError");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_necessity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "necessity");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberOfActiveDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfActiveDownloads");
}

id objc_msgSend_numberOfWaitingDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberOfWaitingDownloads");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_offsetInFile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "offsetInFile");
}

id objc_msgSend_operationConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "operationConfiguration");
}

id objc_msgSend_optionalAmountDownloaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optionalAmountDownloaded");
}

id objc_msgSend_optionalAssetDownloadAllowance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "optionalAssetDownloadAllowance");
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedSet");
}

id objc_msgSend_orderedSetWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orderedSetWithArray:");
}

id objc_msgSend_ordinalityOfUnit_inUnit_forDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ordinalityOfUnit:inUnit:forDate:");
}

id objc_msgSend_overridesForAppBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overridesForAppBundleIdentifier:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pauseAllDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseAllDownloads");
}

id objc_msgSend_pauseDownload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseDownload");
}

id objc_msgSend_pauseQueueWithIdentifier_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pauseQueueWithIdentifier:completionBlock:");
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payload");
}

id objc_msgSend_performAfterNetworkConsentProvided_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performAfterNetworkConsentProvided:queue:");
}

id objc_msgSend_performNetworkAccessFlowIfAllowed_ignoreForeground_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performNetworkAccessFlowIfAllowed:ignoreForeground:completion:");
}

id objc_msgSend_permitInitialCellularDownload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "permitInitialCellularDownload");
}

id objc_msgSend_permittedForInitialBackgroundActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "permittedForInitialBackgroundActivity");
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentIdentifier");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "port");
}

id objc_msgSend_powerAssertionID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerAssertionID");
}

id objc_msgSend_powerRunLoopSource(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerRunLoopSource");
}

id objc_msgSend_predicateMatchingBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateMatchingBundleIdentifier:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_previousFailureCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "previousFailureCount");
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "priority");
}

id objc_msgSend_privateCloudDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateCloudDatabase");
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processIdentifier");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_profileValidated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "profileValidated");
}

id objc_msgSend_progressState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "progressState");
}

id objc_msgSend_promoteToForeground(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "promoteToForeground");
}

id objc_msgSend_proposedCredential(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proposedCredential");
}

id objc_msgSend_protectionSpace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "protectionSpace");
}

id objc_msgSend_publicCloudDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publicCloudDatabase");
}

id objc_msgSend_query(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "query");
}

id objc_msgSend_queueRetainCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queueRetainCount");
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_receiveAppStoreProgressWithAppBundleIdentifier_progressInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveAppStoreProgressWithAppBundleIdentifier:progressInfo:");
}

id objc_msgSend_receivedAuthenticationChallenge_download_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedAuthenticationChallenge:download:completionHandler:");
}

id objc_msgSend_receivedInstalledNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedInstalledNotification");
}

id objc_msgSend_receivedInstallingNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedInstallingNotification");
}

id objc_msgSend_recordDownloadCompletion_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordDownloadCompletion:error:");
}

id objc_msgSend_recordErrors(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordErrors");
}

id objc_msgSend_recordFound(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordFound");
}

id objc_msgSend_remainingDownloadAllowanceWithNecessity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remainingDownloadAllowanceWithNecessity:");
}

id objc_msgSend_remainingDownloadAllowanceWithNecessity_isManifest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remainingDownloadAllowanceWithNecessity:isManifest:");
}

id objc_msgSend_remainingDownloadUniqueIdentifiers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remainingDownloadUniqueIdentifiers");
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeAppWithAppInfo_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAppWithAppInfo:error:");
}

id objc_msgSend_removeDownloadIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeDownloadIdentifier:");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_reportProgressForIdentifier_progressInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportProgressForIdentifier:progressInfo:");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "request");
}

id objc_msgSend_requestDownloadsWithContentRequest_manifestURL_extensionInfo_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestDownloadsWithContentRequest:manifestURL:extensionInfo:completion:");
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_resetExtensionRuntime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetExtensionRuntime");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "response");
}

id objc_msgSend_responseQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "responseQueue");
}

id objc_msgSend_restrictedDownloadSizeRemaining(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictedDownloadSizeRemaining");
}

id objc_msgSend_restrictedEssentialDownloadSizeRemaining(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restrictedEssentialDownloadSizeRemaining");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_resumeData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeData");
}

id objc_msgSend_resumeQueueWithIdentifier_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resumeQueueWithIdentifier:completionBlock:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_rulesEngine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rulesEngine");
}

id objc_msgSend_rulesEngineWorkQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rulesEngineWorkQueue");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_saveApplicationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveApplicationState");
}

id objc_msgSend_scanInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanInteger:");
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanLocation");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_scheduleContentRequest_downloads_applicationInfo_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleContentRequest:downloads:applicationInfo:completionHandler:");
}

id objc_msgSend_scheduleContentRequestAborted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleContentRequestAborted");
}

id objc_msgSend_scheduleDownload_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleDownload:completionHandler:");
}

id objc_msgSend_scheduleDownload_forClientIdentifier_notifyQueue_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheduleDownload:forClientIdentifier:notifyQueue:completionBlock:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_sendAuthenticationChallenge_download_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendAuthenticationChallenge:download:completionHandler:");
}

id objc_msgSend_sendContentRequestTelemetryEvent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendContentRequestTelemetryEvent:");
}

id objc_msgSend_sentTerminatonMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sentTerminatonMessage");
}

id objc_msgSend_sentWillTerminateMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sentWillTerminateMessage");
}

id objc_msgSend_serverTrust(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverTrust");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceName");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setActiveDownloads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveDownloads:");
}

id objc_msgSend_setActiveManifestDownload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setActiveManifestDownload:");
}

id objc_msgSend_setAgentCore_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAgentCore:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setAllowsExpensiveNetworkAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsExpensiveNetworkAccess:");
}

id objc_msgSend_setAmountDownloaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAmountDownloaded:");
}

id objc_msgSend_setAppInfoRecursiveLock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAppInfoRecursiveLock:");
}

id objc_msgSend_setApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationBundleIdentifier:");
}

id objc_msgSend_setApplicationBundleIdentifierOverrideForContainerAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationBundleIdentifierOverrideForContainerAccess:");
}

id objc_msgSend_setApplicationExtensionState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationExtensionState:");
}

id objc_msgSend_setApplicationGroupIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationGroupIdentifier:");
}

id objc_msgSend_setApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationIdentifier:");
}

id objc_msgSend_setApplicationInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationInfo:");
}

id objc_msgSend_setApplicationInformationForRestrictedDownload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationInformationForRestrictedDownload:");
}

id objc_msgSend_setApplicationState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationState:");
}

id objc_msgSend_setApplicationTeamIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationTeamIdentifier:");
}

id objc_msgSend_setAssetFound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetFound:");
}

id objc_msgSend_setAssetKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetKey:");
}

id objc_msgSend_setAssetSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetSize:");
}

id objc_msgSend_setAssetURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAssetURL:");
}

id objc_msgSend_setAsyncClientBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsyncClientBlock:");
}

id objc_msgSend_setAsyncClientNotificationQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAsyncClientNotificationQueue:");
}

id objc_msgSend_setAutomaticallyRetryNetworkFailures_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutomaticallyRetryNetworkFailures:");
}

id objc_msgSend_setAwaitingBlockCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwaitingBlockCompletion:");
}

id objc_msgSend_setAwaitingConnectivityTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwaitingConnectivityTimeout:");
}

id objc_msgSend_setAwaitingConnectivityTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwaitingConnectivityTimer:");
}

id objc_msgSend_setAwaitingNetworkConsent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAwaitingNetworkConsent:");
}

id objc_msgSend_setBaURLSessionDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBaURLSessionDelegate:");
}

id objc_msgSend_setBailError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBailError:");
}

id objc_msgSend_setByAddingObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObject:");
}

id objc_msgSend_setByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObjectsFromArray:");
}

id objc_msgSend_setByAddingObjectsFromSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setByAddingObjectsFromSet:");
}

id objc_msgSend_setCellularPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCellularPolicy:");
}

id objc_msgSend_setClass_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClass:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClasses:forSelector:argumentIndex:ofReply:");
}

id objc_msgSend_setClientBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientBundleIdentifier:");
}

id objc_msgSend_setClientHandlerQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientHandlerQueue:");
}

id objc_msgSend_setClientProgressConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientProgressConfiguration:");
}

id objc_msgSend_setClientWorkQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientWorkQueue:");
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConfiguration:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setConnectionIsValid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionIsValid:");
}

id objc_msgSend_setConnectionQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionQueue:");
}

id objc_msgSend_setConnectionReplyQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnectionReplyQueue:");
}

id objc_msgSend_setConnections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnections:");
}

id objc_msgSend_setContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContainer:");
}

id objc_msgSend_setContainerID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContainerID:");
}

id objc_msgSend_setContentRequestTelemetry_forDownloads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setContentRequestTelemetry:forDownloads:");
}

id objc_msgSend_setCurrentOperation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentOperation:");
}

id objc_msgSend_setCurrentRuntime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCurrentRuntime:");
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setData:");
}

id objc_msgSend_setDatabase_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDatabase:");
}

id objc_msgSend_setDatabaseScope_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDatabaseScope:");
}

id objc_msgSend_setDebugRuleValidity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDebugRuleValidity:");
}

id objc_msgSend_setDebugValidityTimeOverride_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDebugValidityTimeOverride:");
}

id objc_msgSend_setDecodingFailurePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDecodingFailurePolicy:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredKeys:");
}

id objc_msgSend_setDiscretionaryNetworkBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscretionaryNetworkBehavior:");
}

id objc_msgSend_setDomainAllowlist_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDomainAllowlist:");
}

id objc_msgSend_setDownload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownload:");
}

id objc_msgSend_setDownloadAllowance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadAllowance:");
}

id objc_msgSend_setDownloadCachePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadCachePath:");
}

id objc_msgSend_setDownloadError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadError:");
}

id objc_msgSend_setDownloadManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadManager:");
}

id objc_msgSend_setDownloadQueuesByClientIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadQueuesByClientIdentifier:");
}

id objc_msgSend_setDownloadStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadStartDate:");
}

id objc_msgSend_setDownloadTask_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadTask:");
}

id objc_msgSend_setDownloadedFileSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloadedFileSize:");
}

id objc_msgSend_setDownloads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDownloads:");
}

id objc_msgSend_setEndDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndDate:");
}

id objc_msgSend_setEndowmentNamespaces_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndowmentNamespaces:");
}

id objc_msgSend_setEssentialAmountDownloaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEssentialAmountDownloaded:");
}

id objc_msgSend_setEssentialAssetDownloadAllowance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEssentialAssetDownloadAllowance:");
}

id objc_msgSend_setEssentialAssetIdentifiersMonitored_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEssentialAssetIdentifiersMonitored:");
}

id objc_msgSend_setEssentialAssetsBytesDownloaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEssentialAssetsBytesDownloaded:");
}

id objc_msgSend_setEssentialAssetsBytesTotal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEssentialAssetsBytesTotal:");
}

id objc_msgSend_setEssentialAssetsWaitingOnContentRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEssentialAssetsWaitingOnContentRequest:");
}

id objc_msgSend_setEssentialDownloadAllowance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEssentialDownloadAllowance:");
}

id objc_msgSend_setEssentialMaxInstallSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEssentialMaxInstallSize:");
}

id objc_msgSend_setEventError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventError:");
}

id objc_msgSend_setEventPayload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEventPayload:");
}

id objc_msgSend_setEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEvents:");
}

id objc_msgSend_setExclusiveAccessBlockQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExclusiveAccessBlockQueue:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setExtensionActiveCalls_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtensionActiveCalls:");
}

id objc_msgSend_setExtensionConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtensionConnection:");
}

id objc_msgSend_setExtensionConnections_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtensionConnections:");
}

id objc_msgSend_setExtensionIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtensionIdentity:");
}

id objc_msgSend_setExtensionProcess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtensionProcess:");
}

id objc_msgSend_setExtensionRuntimeEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtensionRuntimeEvents:");
}

id objc_msgSend_setFileHandle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFileHandle:");
}

id objc_msgSend_setFireByTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFireByTimer:");
}

id objc_msgSend_setFrozen_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFrozen:");
}

id objc_msgSend_setFullDownloadSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFullDownloadSize:");
}

id objc_msgSend_setHasLaunchedApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHasLaunchedApplication:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIdentifiersToDownloads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdentifiersToDownloads:");
}

id objc_msgSend_setIncludePostprocessing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncludePostprocessing:");
}

id objc_msgSend_setInitialBackgroundCellularPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialBackgroundCellularPolicy:");
}

id objc_msgSend_setInitialConnectivityTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInitialConnectivityTimeout:");
}

id objc_msgSend_setInstallSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInstallSource:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsApplication_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsApplication:");
}

id objc_msgSend_setIsForegroundDownload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsForegroundDownload:");
}

id objc_msgSend_setLastApplicationLaunchTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastApplicationLaunchTime:");
}

id objc_msgSend_setLastDownloadIsValidValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastDownloadIsValidValue:");
}

id objc_msgSend_setLastDownloadStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastDownloadStartDate:");
}

id objc_msgSend_setLastExclusiveAccessBlockToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastExclusiveAccessBlockToken:");
}

id objc_msgSend_setLastPeriodicCheckTime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLastPeriodicCheckTime:");
}

id objc_msgSend_setListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setListener:");
}

id objc_msgSend_setLockDownQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLockDownQueue:");
}

id objc_msgSend_setManifestURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setManifestURL:");
}

id objc_msgSend_setMasqueradeIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMasqueradeIdentifier:");
}

id objc_msgSend_setMaxInstallSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaxInstallSize:");
}

id objc_msgSend_setMaximumTerminationResistance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMaximumTerminationResistance:");
}

id objc_msgSend_setMostRecentError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMostRecentError:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNecessity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNecessity:");
}

id objc_msgSend_setNetworkServiceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNetworkServiceType:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOperationConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOperationConfiguration:");
}

id objc_msgSend_setOptionalAmountDownloaded_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptionalAmountDownloaded:");
}

id objc_msgSend_setOptionalAssetDownloadAllowance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOptionalAssetDownloadAllowance:");
}

id objc_msgSend_setPermitInitialCellularDownload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPermitInitialCellularDownload:");
}

id objc_msgSend_setPermittedForInitialBackgroundActivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPermittedForInitialBackgroundActivity:");
}

id objc_msgSend_setPersistentIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPersistentIdentifier:");
}

id objc_msgSend_setPowerAssertionID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerAssertionID:");
}

id objc_msgSend_setPowerRunLoopSource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPowerRunLoopSource:");
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPriority:");
}

id objc_msgSend_setQualityOfService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQualityOfService:");
}

id objc_msgSend_setQuery_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQuery:");
}

id objc_msgSend_setQueryCompletionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryCompletionBlock:");
}

id objc_msgSend_setReceivedInstalledNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReceivedInstalledNotification:");
}

id objc_msgSend_setReceivedInstallingNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReceivedInstallingNotification:");
}

id objc_msgSend_setRecordErrors_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordErrors:");
}

id objc_msgSend_setRecordFound_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordFound:");
}

id objc_msgSend_setRecordMatchedBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecordMatchedBlock:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setReportType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReportType:");
}

id objc_msgSend_setRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRequest:");
}

id objc_msgSend_setResponse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResponse:");
}

id objc_msgSend_setResponseQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResponseQueue:");
}

id objc_msgSend_setRestrictedDownloadSizeRemaining_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRestrictedDownloadSizeRemaining:");
}

id objc_msgSend_setRestrictedEssentialDownloadSizeRemaining_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRestrictedEssentialDownloadSizeRemaining:");
}

id objc_msgSend_setResultsLimit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResultsLimit:");
}

id objc_msgSend_setResumeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setResumeData:");
}

id objc_msgSend_setRulesEngine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRulesEngine:");
}

id objc_msgSend_setRulesEngineWorkQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRulesEngineWorkQueue:");
}

id objc_msgSend_setSentTerminatonMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSentTerminatonMessage:");
}

id objc_msgSend_setSentWillTerminateMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSentWillTerminateMessage:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setShouldFetchAssetContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldFetchAssetContent:");
}

id objc_msgSend_setShutdownQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShutdownQueue:");
}

id objc_msgSend_setSigningIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSigningIdentifier:");
}

id objc_msgSend_setSpiListener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSpiListener:");
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartDate:");
}

id objc_msgSend_setStateDescriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateDescriptor:");
}

id objc_msgSend_setStateLock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStateLock:");
}

id objc_msgSend_setStopRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStopRequest:");
}

id objc_msgSend_setSyncSema_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSyncSema:");
}

id objc_msgSend_setTelemetryByDownloadUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTelemetryByDownloadUniqueIdentifier:");
}

id objc_msgSend_setTelemetryQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTelemetryQueue:");
}

id objc_msgSend_setTelephonyClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTelephonyClient:");
}

id objc_msgSend_setTerminationAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTerminationAssertion:");
}

id objc_msgSend_setTimeoutIntervalForRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutIntervalForRequest:");
}

id objc_msgSend_setTransaction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTransaction:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUnhandledDownloadEvents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnhandledDownloadEvents:");
}

id objc_msgSend_setUniqueIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUniqueIdentifier:");
}

id objc_msgSend_setUniqueIdentifiersToDownloads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUniqueIdentifiersToDownloads:");
}

id objc_msgSend_setUpdateHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdateHandler:");
}

id objc_msgSend_setUrlSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUrlSession:");
}

id objc_msgSend_setUseUniqueFileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUseUniqueFileName:");
}

id objc_msgSend_setUserForceQuitApp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserForceQuitApp:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setValues_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValues:");
}

id objc_msgSend_setWaitsForConnectivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitsForConnectivity:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setWorkQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWorkQueue:");
}

id objc_msgSend_setZoneID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setZoneID:");
}

id objc_msgSend_set_allowsRetryForBackgroundDataTasks_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_allowsRetryForBackgroundDataTasks:");
}

id objc_msgSend_set_sourceApplicationBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set_sourceApplicationBundleIdentifier:");
}

id objc_msgSend_sharedCloudDatabase(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCloudDatabase");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedCore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCore");
}

id objc_msgSend_shouldDoPeriodicCheck(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldDoPeriodicCheck");
}

id objc_msgSend_shouldLaunchExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldLaunchExtension");
}

id objc_msgSend_shouldReportBundleIDInTelemetry_date_deviceIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldReportBundleIDInTelemetry:date:deviceIdentifier:");
}

id objc_msgSend_shutdownQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutdownQueue");
}

id objc_msgSend_signingIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signingIdentifier");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "size");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingSelector:");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_spiListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spiListener");
}

id objc_msgSend_stagingDirectory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stagingDirectory");
}

id objc_msgSend_startAsyncDownloadNotifyingOnQueue_sessionConfiguration_bytesReceivedHandler_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startAsyncDownloadNotifyingOnQueue:sessionConfiguration:bytesReceivedHandler:completionHandler:");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_startDownloadWithDelegate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDownloadWithDelegate:error:");
}

id objc_msgSend_startDownloadWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDownloadWithError:");
}

id objc_msgSend_startForegroundDownload_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startForegroundDownload:completionHandler:");
}

id objc_msgSend_startForegroundDownload_forClientIdentifier_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startForegroundDownload:forClientIdentifier:completionBlock:");
}

id objc_msgSend_startNextDownload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startNextDownload");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stateLock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateLock");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_stopRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopRequest");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathExtension:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByStandardizingPath");
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByTrimmingCharactersInSet:");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_supportsSecureCoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsSecureCoding");
}

id objc_msgSend_syncDownloads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncDownloads:");
}

id objc_msgSend_syncSema(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncSema");
}

id objc_msgSend_synchronizeAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronizeAndReturnError:");
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_taskState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskState");
}

id objc_msgSend_telemetryByDownloadUniqueIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telemetryByDownloadUniqueIdentifier");
}

id objc_msgSend_telemetryQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telemetryQueue");
}

id objc_msgSend_telephonyClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telephonyClient");
}

id objc_msgSend_terminationAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "terminationAssertion");
}

id objc_msgSend_thaw(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "thaw");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "token");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_typeString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "typeString");
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClass:fromData:error:");
}

id objc_msgSend_unauthoritativeTrustState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unauthoritativeTrustState");
}

id objc_msgSend_unhandledDownloadEvents(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unhandledDownloadEvents");
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_uniqueErrorCounts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueErrorCounts");
}

id objc_msgSend_uniqueFileName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueFileName");
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueIdentifier");
}

id objc_msgSend_uniqueIdentifiersToDownloads(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uniqueIdentifiersToDownloads");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntegerValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateApplicationInformationForIdentifier_bundleURLPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateApplicationInformationForIdentifier:bundleURLPath:");
}

id objc_msgSend_updateApplicationWithInfoDictionary_applicationRecord_overrides_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateApplicationWithInfoDictionary:applicationRecord:overrides:");
}

id objc_msgSend_updateConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateConfiguration:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_urlRequest(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlRequest");
}

id objc_msgSend_urlSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlSession");
}

id objc_msgSend_useUniqueFileName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useUniqueFileName");
}

id objc_msgSend_userForceQuitApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userForceQuitApp");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInitiated");
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_versionAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "versionAllowed");
}

id objc_msgSend_waitsForConnectivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "waitsForConnectivity");
}

id objc_msgSend_wakeupForTokenWithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wakeupForTokenWithReply:");
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whitespaceAndNewlineCharacterSet");
}

id objc_msgSend_wifi(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifi");
}

id objc_msgSend_willLaunchExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willLaunchExtension");
}

id objc_msgSend_workQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "workQueue");
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_zoneID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoneID");
}
