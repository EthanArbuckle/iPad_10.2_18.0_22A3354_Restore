@implementation OBPrivacyPresenter

void __72__OBPrivacyPresenter_PKPrivacy__pk_defaultPresentationActionForContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "pk_presenterForContext:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentingViewController:", v4);

  objc_msgSend(v5, "present");
}

@end
