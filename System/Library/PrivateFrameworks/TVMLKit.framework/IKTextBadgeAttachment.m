@implementation IKTextBadgeAttachment

uint64_t __92__IKTextBadgeAttachment_TVMLKitAdditions__tv_resolveWithTextLayoutDirection_layoutObserver___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  id v7;
  id v8;
  uint64_t result;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(v4, "uiImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(WeakRetained, "tv_setImage:", v6);
  v7 = objc_loadWeakRetained(v3);
  objc_msgSend(v7, "tv_setResolving:", 0);

  v8 = objc_loadWeakRetained(v3);
  objc_msgSend(v8, "tv_setImageProxy:", 0);

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
