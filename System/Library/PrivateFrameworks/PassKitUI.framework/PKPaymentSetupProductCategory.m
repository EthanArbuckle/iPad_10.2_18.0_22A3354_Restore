@implementation PKPaymentSetupProductCategory

void __64__PKPaymentSetupProductCategory_PKUIUtilities__logoCachedImage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLogoImage:", objc_msgSend(objc_retainAutorelease(v7), "CGImage"));

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

@end
