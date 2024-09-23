id sub_100004A34(uint64_t a1, int a2)
{
  void *v3;
  const CFBooleanRef *v4;
  CFBooleanRef v6;

  v3 = *(void **)(a1 + 32);
  v4 = &kCFBooleanTrue;
  if (!a2)
    v4 = &kCFBooleanFalse;
  v6 = *v4;
  objc_msgSend(v3, "callWithArguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  return objc_msgSend(*(id *)(a1 + 32), "setThisObject:", 0);
}

uint64_t sub_100004AD4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
    NSLog(CFSTR("Failed to enable cloud library with error: %@"), a2);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

id sub_100004CB4(uint64_t a1, int a2)
{
  void *v3;
  const CFBooleanRef *v4;
  CFBooleanRef v6;

  v3 = *(void **)(a1 + 32);
  v4 = &kCFBooleanTrue;
  if (!a2)
    v4 = &kCFBooleanFalse;
  v6 = *v4;
  objc_msgSend(v3, "callWithArguments:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  return objc_msgSend(*(id *)(a1 + 32), "setThisObject:", 0);
}

uint64_t sub_100004D54(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
    NSLog(CFSTR("Failed to disable cloud library with error: %@"), a2);
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 == 0);
  return result;
}

void sub_10000501C(id a1)
{
  MusicStoreFlowScriptingClientController *v1;
  void *v2;
  MusicStoreFlowViewControllerFactory *v3;
  id v4;

  +[MusicSubscriptionStatusHacks setupSubscriptionStatusHacks](MusicSubscriptionStatusHacks, "setupSubscriptionStatusHacks");
  v1 = objc_alloc_init(MusicStoreFlowScriptingClientController);
  v2 = (void *)qword_100011BB0;
  qword_100011BB0 = (uint64_t)v1;

  v4 = objc_alloc_init((Class)SUClientInterface);
  objc_msgSend(v4, "setClientIdentifier:", ISClientIdentifierMusicPlayer);
  v3 = objc_alloc_init(MusicStoreFlowViewControllerFactory);
  objc_msgSend(v4, "setViewControllerFactory:", v3);
  objc_msgSend((id)qword_100011BB0, "setClientInterface:", v4);
  +[SUClientController setSharedController:](SUClientController, "setSharedController:", qword_100011BB0);

}

void sub_100005AB0(id a1)
{
  objc_class *v1;
  _QWORD *v2;
  void (*v3)(void);
  objc_method *InstanceMethod;
  const char *TypeEncoding;
  IMP v6;
  _QWORD *v7;
  void (*v8)(void);
  objc_method *v9;
  const char *v10;
  IMP v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v1 = (objc_class *)objc_opt_class(SSVSubscriptionStatusCoordinator);
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100005C40;
  v17[3] = &unk_10000C460;
  v17[4] = &v18;
  v17[5] = "getStatusWithOptions:statusBlock:";
  v2 = objc_retainBlock(v17);
  v3 = imp_implementationWithBlock(v2);
  InstanceMethod = class_getInstanceMethod(v1, "getStatusWithOptions:statusBlock:");
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  v6 = class_replaceMethod(v1, "getStatusWithOptions:statusBlock:", v3, TypeEncoding);

  v19[3] = (uint64_t)v6;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100005D18;
  v12[3] = &unk_10000C4A8;
  v12[4] = &v13;
  v12[5] = "modifyLastKnownStatusUsingBlock:";
  v7 = objc_retainBlock(v12);
  v8 = imp_implementationWithBlock(v7);
  v9 = class_getInstanceMethod(v1, "modifyLastKnownStatusUsingBlock:");
  v10 = method_getTypeEncoding(v9);
  v11 = class_replaceMethod(v1, "modifyLastKnownStatusUsingBlock:", v8, v10);

  v14[3] = (uint64_t)v11;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v18, 8);
}

void sub_100005C28(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_100005C40(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void (*v12)(id, _QWORD, id, id);
  id v13;

  v13 = a2;
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", SSVSubscriptionStatusOptionIgnoreCache));
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ICMusicSubscriptionStatusController sharedStatusController](ICMusicSubscriptionStatusController, "sharedStatusController"));
    objc_msgSend(v11, "invalidateCachedSubscriptionStatusWithCompletionHandler:", &stru_10000C438);

  }
  v12 = *(void (**)(id, _QWORD, id, id))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v12)
    v12(v13, *(_QWORD *)(a1 + 40), v7, v8);

}

void sub_100005D18(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t, _QWORD);
  id v3;

  v2 = *(void (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    v2(a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[ICMusicSubscriptionStatusController sharedStatusController](ICMusicSubscriptionStatusController, "sharedStatusController"));
  objc_msgSend(v3, "invalidateCachedSubscriptionStatusWithCompletionHandler:", &stru_10000C480);

}

void sub_100006350(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10000636C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (v8)
    {
      objc_msgSend(WeakRetained, "_reloadWithCloudServiceSetupURL:forReloadContext:", v8, *(_QWORD *)(a1 + 32));
    }
    else
    {
      NSLog(CFSTR("Error: Failed to resolve cloud service setup URL for %@. %@"), *(_QWORD *)(a1 + 40), v5);
      objc_msgSend(v7, "_didFinishLoadingWithSuccess:error:", 0, v5);
    }
  }

}

uint64_t sub_10000669C(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t sub_100006764(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100006C54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  char isKindOfClass;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v9 = a3;
  v5 = a2;
  v6 = objc_opt_class(NSString);
  isKindOfClass = objc_opt_isKindOfClass(v5, v6);

  if ((isKindOfClass & 1) != 0)
  {
    v8 = objc_opt_class(NSDictionary);
    if ((objc_opt_isKindOfClass(v9, v8) & 1) != 0)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100006D28;
      v10[3] = &unk_10000C520;
      v11 = *(id *)(a1 + 32);
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v10);

    }
  }

}

void sub_100006D28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v11, v6) & 1) != 0)
  {
    v7 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      v8 = *(void **)(a1 + 32);
      v9 = v5;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lowercaseString"));
      objc_msgSend(v8, "setObject:forKey:", v9, v10);

    }
  }

}

id sub_100006DD8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "name"));
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t sub_100006FC8(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_10000758C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000075B8(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000076B8;
  v9[3] = &unk_10000C570;
  objc_copyWeak(&v15, a1 + 7);
  v10 = v6;
  v11 = a1[4];
  v12 = a1[5];
  v13 = v5;
  v14 = a1[6];
  v7 = v5;
  v8 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v9);

  objc_destroyWeak(&v15);
}

void sub_1000076B8(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void);
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSErrorUserInfoKey v15;
  const __CFString *v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *(void **)(a1 + 32);
    if (!v4)
    {
      v12 = (void *)objc_opt_class(WeakRetained);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 48), "queryItems"));
      v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_cloudServiceSetupURLForAction:queryItems:bagDictionary:", v13, v14, *(_QWORD *)(a1 + 56)));

      if (v5)
      {
        v8 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
LABEL_9:
        v8();

        goto LABEL_10;
      }
      v4 = *(void **)(a1 + 32);
    }
    v5 = v4;
    if (!*(_QWORD *)(a1 + 32))
    {
      v6 = SSError(SSErrorDomain, 124, 0, 0);
      v7 = objc_claimAutoreleasedReturnValue(v6);

      v5 = (id)v7;
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
    goto LABEL_9;
  }
  v9 = *(_QWORD *)(a1 + 64);
  v15 = NSLocalizedDescriptionKey;
  v16 = CFSTR("Unexpected.");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSCocoaErrorDomain, 0, v10));
  (*(void (**)(uint64_t, _QWORD, void *))(v9 + 16))(v9, 0, v11);

LABEL_10:
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URL");
}

id objc_msgSend_URLRequestProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLRequestProperties");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__activateStoreFlowServiceViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_activateStoreFlowServiceViewController:");
}

id objc_msgSend__cloudServiceSetupURLForAction_queryItems_bagDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cloudServiceSetupURLForAction:queryItems:bagDictionary:");
}

id objc_msgSend__correspondingStoreFlowServiceViewControllerForViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_correspondingStoreFlowServiceViewControllerForViewController:");
}

id objc_msgSend__didFinishLoadingWithSuccess_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_didFinishLoadingWithSuccess:error:");
}

id objc_msgSend__dismissCloudServiceSetupViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_dismissCloudServiceSetupViewControllerAnimated:completion:");
}

id objc_msgSend__loadStorePageViewControllerWithCloudServiceSetupURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_loadStorePageViewControllerWithCloudServiceSetupURL:");
}

id objc_msgSend__reloadForAppearance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reloadForAppearance:");
}

id objc_msgSend__reloadWithCloudServiceSetupURL_forReloadContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_reloadWithCloudServiceSetupURL:forReloadContext:");
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_remoteViewControllerProxy");
}

id objc_msgSend__requestCloudServiceSetupURLFromActiveReloadContextWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_requestCloudServiceSetupURLFromActiveReloadContextWithCompletionHandler:");
}

id objc_msgSend__rootViewControllerForViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_rootViewControllerForViewController:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "action");
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

id objc_msgSend_addPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addPointer:");
}

id objc_msgSend_adjustedTargetForSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "adjustedTargetForSelector:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applicationIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationIdentifier");
}

id objc_msgSend_applicationVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationVersion");
}

id objc_msgSend_applyCloudServiceSetupConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applyCloudServiceSetupConfiguration:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_becomeActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becomeActive");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_callWithArguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callWithArguments:");
}

id objc_msgSend_checkInScriptObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkInScriptObject:");
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clientInterface");
}

id objc_msgSend_cloudServiceSetupURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cloudServiceSetupURL");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyDefaultScriptProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyDefaultScriptProperties");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_decodeIntegerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeIntegerForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didFinishLoadingWithSuccess_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didFinishLoadingWithSuccess:error:");
}

id objc_msgSend_disableCloudLibraryWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableCloudLibraryWithCompletionHandler:");
}

id objc_msgSend_dismissCloudServiceSetupViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissCloudServiceSetupViewControllerAnimated:completion:");
}

id objc_msgSend_dismissSafariViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissSafariViewControllerAnimated:completion:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_enableCloudLibraryWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableCloudLibraryWithOptions:completionHandler:");
}

id objc_msgSend_encodeInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInteger:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_gradientWithColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gradientWithColor:");
}

id objc_msgSend_indexOfObjectPassingTest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexOfObjectPassingTest:");
}

id objc_msgSend_initWithExternalAccountURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithExternalAccountURL:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithScriptObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithScriptObject:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:resolvingAgainstBaseURL:");
}

id objc_msgSend_invalidateCachedSubscriptionStatusWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateCachedSubscriptionStatusWithCompletionHandler:");
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isActive");
}

id objc_msgSend_isCloudLibraryEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCloudLibraryEnabled");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isSafeExternalURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSafeExternalURL");
}

id objc_msgSend_isSkLoaded(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSkLoaded");
}

id objc_msgSend_isSkLoading(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSkLoading");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lock");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_overrideCreditCardPresentationWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "overrideCreditCardPresentationWithCompletion:");
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parentViewController");
}

id objc_msgSend_pointerAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointerAtIndex:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_presentSafariViewControllerWithURL_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentSafariViewControllerWithURL:animated:completion:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryItems");
}

id objc_msgSend_referrerURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "referrerURL");
}

id objc_msgSend_registerStoreFlowServiceViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerStoreFlowServiceViewController:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePointerAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removePointerAtIndex:");
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceCharactersInRange:withString:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_requestAccessToBagUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestAccessToBagUsingBlock:");
}

id objc_msgSend_requestWebScriptReloadWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWebScriptReloadWithContext:");
}

id objc_msgSend_resignActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resignActive");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scheme");
}

id objc_msgSend_serializedUserInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedUserInfo");
}

id objc_msgSend_setApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationIdentifier:");
}

id objc_msgSend_setApplicationVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationVersion:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setCanMoveToOverlay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCanMoveToOverlay:");
}

id objc_msgSend_setClientIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientIdentifier:");
}

id objc_msgSend_setClientInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClientInterface:");
}

id objc_msgSend_setDefaultBackgroundGradient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultBackgroundGradient:");
}

id objc_msgSend_setNavigationBarHidden_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNavigationBarHidden:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setPlaceholderBackgroundGradient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPlaceholderBackgroundGradient:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setReferrerURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReferrerURL:");
}

id objc_msgSend_setReferringUserAgent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReferringUserAgent:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setScriptProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScriptProperties:");
}

id objc_msgSend_setScriptUserInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setScriptUserInfo:");
}

id objc_msgSend_setSharedController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSharedController:");
}

id objc_msgSend_setShouldLoadProgressively_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldLoadProgressively:");
}

id objc_msgSend_setShouldShowFormAccessory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldShowFormAccessory:");
}

id objc_msgSend_setShouldShowLoadingView_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldShowLoadingView:");
}

id objc_msgSend_setThisObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setThisObject:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setURLRequestProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setURLRequestProperties:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setViewControllerFactory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllerFactory:");
}

id objc_msgSend_setViewControllers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setViewControllers:");
}

id objc_msgSend_setVisible_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVisible:");
}

id objc_msgSend_setupSubscriptionStatusHacks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupSubscriptionStatusHacks");
}

id objc_msgSend_sharedBagLoadingController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedBagLoadingController");
}

id objc_msgSend_sharedCloudController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedCloudController");
}

id objc_msgSend_sharedScriptingClientController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedScriptingClientController");
}

id objc_msgSend_sharedStatusController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedStatusController");
}

id objc_msgSend_sourceApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceApplicationBundleIdentifier");
}

id objc_msgSend_storeFlowScriptingClientController_overrideCreditCardPresentationWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeFlowScriptingClientController:overrideCreditCardPresentationWithCompletion:");
}

id objc_msgSend_storeFlowScriptingClientController_requestsDismissingSafariViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeFlowScriptingClientController:requestsDismissingSafariViewControllerAnimated:completion:");
}

id objc_msgSend_storeFlowScriptingClientController_requestsDismissingViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeFlowScriptingClientController:requestsDismissingViewController:animated:completion:");
}

id objc_msgSend_storeFlowScriptingClientController_requestsPresentingSafariViewControllerWithURL_animated_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeFlowScriptingClientController:requestsPresentingSafariViewControllerWithURL:animated:completion:");
}

id objc_msgSend_storeFlowScriptingClientController_requestsPresentingViewController_animated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeFlowScriptingClientController:requestsPresentingViewController:animated:");
}

id objc_msgSend_storeFlowServiceViewControllerDidDisappear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeFlowServiceViewControllerDidDisappear:");
}

id objc_msgSend_storeFlowServiceViewControllerDidLoad_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeFlowServiceViewControllerDidLoad:");
}

id objc_msgSend_storeFlowServiceViewControllerWillAppear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeFlowServiceViewControllerWillAppear:");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_targetsFinanceApplication(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "targetsFinanceApplication");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_unregisterStoreFlowServiceViewController_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterStoreFlowServiceViewController:");
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakObjectsHashTable");
}

id objc_msgSend_weakObjectsPointerArray(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "weakObjectsPointerArray");
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "whiteColor");
}
