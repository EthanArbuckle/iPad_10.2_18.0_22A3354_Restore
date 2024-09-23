@implementation SYActivationContextForUserActivity

void __SYActivationContextForUserActivity_block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2050000000;
  v2 = (void *)getUIWindowClass_softClass;
  v13 = getUIWindowClass_softClass;
  if (!getUIWindowClass_softClass)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __getUIWindowClass_block_invoke;
    v9[3] = &unk_1E757B260;
    v9[4] = &v10;
    __getUIWindowClass_block_invoke((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v10, 8);
  objc_msgSend(v3, "_applicationKeyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CALayerGetContext();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CALayerGetRenderId();

    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "contextId");
  }

}

@end
