@implementation NSUserActivity

void __97__NSUserActivity_PhotosUICore__px_requestActivityWithActivityType_titleProvider_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD block[4];
  id v5;
  id v6;
  id v7;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__NSUserActivity_PhotosUICore__px_requestActivityWithActivityType_titleProvider_completionBlock___block_invoke_3;
  block[3] = &unk_1E5145688;
  v5 = *(id *)(a1 + 32);
  v6 = v2;
  v7 = *(id *)(a1 + 48);
  v3 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __97__NSUserActivity_PhotosUICore__px_requestActivityWithActivityType_titleProvider_completionBlock___block_invoke_3(_QWORD *a1)
{
  id v2;

  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5920]), "initWithActivityType:", a1[4]);
  objc_msgSend(v2, "setTitle:", a1[5]);
  (*(void (**)(void))(a1[6] + 16))();

}

void __97__NSUserActivity_PhotosUICore__px_requestActivityWithActivityType_titleProvider_completionBlock___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.photosuicore.user-activity-title", v2);
  v1 = (void *)px_requestActivityWithActivityType_titleProvider_completionBlock__queue;
  px_requestActivityWithActivityType_titleProvider_completionBlock__queue = (uint64_t)v0;

}

@end
