@implementation MusicSubscriptionStatusHacks

+ (void)setupSubscriptionStatusHacks
{
  if (setupSubscriptionStatusHacks_sOnceToken != -1)
    dispatch_once(&setupSubscriptionStatusHacks_sOnceToken, &__block_literal_global_6);
}

void __60__MusicSubscriptionStatusHacks_setupSubscriptionStatusHacks__block_invoke(id a1)
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
  v17[2] = __60__MusicSubscriptionStatusHacks_setupSubscriptionStatusHacks__block_invoke_2;
  v17[3] = &unk_1339608;
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
  v12[2] = __60__MusicSubscriptionStatusHacks_setupSubscriptionStatusHacks__block_invoke_4;
  v12[3] = &unk_1339650;
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

void __60__MusicSubscriptionStatusHacks_setupSubscriptionStatusHacks__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
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
    objc_msgSend(v11, "invalidateCachedSubscriptionStatusWithCompletionHandler:", &__block_literal_global_3);

  }
  v12 = *(void (**)(id, _QWORD, id, id))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v12)
    v12(v13, *(_QWORD *)(a1 + 40), v7, v8);

}

void __60__MusicSubscriptionStatusHacks_setupSubscriptionStatusHacks__block_invoke_4(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t, _QWORD);
  id v3;

  v2 = *(void (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (v2)
    v2(a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue(+[ICMusicSubscriptionStatusController sharedStatusController](ICMusicSubscriptionStatusController, "sharedStatusController"));
  objc_msgSend(v3, "invalidateCachedSubscriptionStatusWithCompletionHandler:", &__block_literal_global_7);

}

@end
