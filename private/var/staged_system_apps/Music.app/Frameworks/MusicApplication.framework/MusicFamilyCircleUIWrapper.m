@implementation MusicFamilyCircleUIWrapper

+ (id)newFamilyMessageGroup
{
  void *v2;
  objc_class *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getFAFamilyMessageGroupClass_softClass;
  v9 = getFAFamilyMessageGroupClass_softClass;
  if (!getFAFamilyMessageGroupClass_softClass)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = __getFAFamilyMessageGroupClass_block_invoke;
    v5[3] = &unk_1339000;
    v5[4] = &v6;
    __getFAFamilyMessageGroupClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return objc_alloc_init(v3);
}

+ (void)presentFamilyCircleSheet:(id)a3 withParameters:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  objc_class *v13;
  id v14;
  id *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  char *v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  void **v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4;
  v31 = __Block_byref_object_dispose__4;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v10 = (void *)getFACircleStateControllerClass_softClass;
  v41 = getFACircleStateControllerClass_softClass;
  if (!getFACircleStateControllerClass_softClass)
  {
    v33 = _NSConcreteStackBlock;
    v34 = 3221225472;
    v35 = (uint64_t)__getFACircleStateControllerClass_block_invoke;
    v36 = &unk_1339000;
    v37 = &v38;
    __getFACircleStateControllerClass_block_invoke((uint64_t)&v33);
    v10 = (void *)v39[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v38, 8);
  v32 = objc_msgSend([v11 alloc], "initWithPresenter:", v7);
  objc_msgSend((id)v28[5], "setPresentationType:", 2);
  v38 = 0;
  v39 = &v38;
  v40 = 0x2050000000;
  v12 = (void *)getFACircleContextClass_softClass;
  v41 = getFACircleContextClass_softClass;
  if (!getFACircleContextClass_softClass)
  {
    v33 = _NSConcreteStackBlock;
    v34 = 3221225472;
    v35 = (uint64_t)__getFACircleContextClass_block_invoke;
    v36 = &unk_1339000;
    v37 = &v38;
    __getFACircleContextClass_block_invoke((uint64_t)&v33);
    v12 = (void *)v39[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v38, 8);
  v14 = [v13 alloc];
  v33 = 0;
  v34 = (uint64_t)&v33;
  v35 = 0x2020000000;
  v15 = (id *)getFACircleEventTypeInitiateSymbolLoc_ptr;
  v36 = (void *)getFACircleEventTypeInitiateSymbolLoc_ptr;
  if (!getFACircleEventTypeInitiateSymbolLoc_ptr)
  {
    v16 = (void *)FamilyCircleUILibrary();
    v15 = (id *)dlsym(v16, "FACircleEventTypeInitiate");
    *(_QWORD *)(v34 + 24) = v15;
    getFACircleEventTypeInitiateSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v33, 8);
  if (v15)
  {
    v17 = *v15;
    v18 = objc_msgSend(v14, "initWithEventType:", v17);

    objc_msgSend(v18, "setClientName:", CFSTR("AppleMusic"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleIdentifier"));
    objc_msgSend(v18, "setClientBundleID:", v20);

    objc_msgSend(v18, "setAdditionalParameters:", v8);
    objc_msgSend(v18, "setActivityIndicatorStyle:", 0);
    v21 = (void *)v28[5];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = __88__MusicFamilyCircleUIWrapper_presentFamilyCircleSheet_withParameters_completionHandler___block_invoke;
    v24[3] = &unk_133A400;
    v22 = v9;
    v25 = v22;
    v26 = &v27;
    objc_msgSend(v21, "performWithContext:completion:", v18, v24);

    _Block_object_dispose(&v27, 8);
  }
  else
  {
    v23 = dlerror();
    abort_report_np("%s", v23);
    __break(1u);
  }
}

void __88__MusicFamilyCircleUIWrapper_presentFamilyCircleSheet_withParameters_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __88__MusicFamilyCircleUIWrapper_presentFamilyCircleSheet_withParameters_completionHandler___block_invoke_2;
  v4[3] = &unk_133A3D8;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

void __88__MusicFamilyCircleUIWrapper_presentFamilyCircleSheet_withParameters_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

}

@end
