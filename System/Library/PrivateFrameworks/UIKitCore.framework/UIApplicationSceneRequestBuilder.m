@implementation UIApplicationSceneRequestBuilder

void __93___UIApplicationSceneRequestBuilder_buildWorkspaceRequestOptionsForRequest_withContinuation___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "actions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "addObject:", v8);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setActions:", v7);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end
