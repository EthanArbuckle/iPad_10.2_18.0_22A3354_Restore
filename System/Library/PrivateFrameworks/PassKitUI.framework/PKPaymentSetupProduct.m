@implementation PKPaymentSetupProduct

void __63__PKPaymentSetupProduct_PKUIUtilities__digitalCardCachedImage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else if (*(_QWORD *)(a1 + 32)
         || (objc_msgSend(*(id *)(a1 + 40), "paymentOptions"),
             v6 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v6, "firstObject"),
             v7 = (void *)objc_claimAutoreleasedReturnValue(),
             v8 = objc_msgSend(v7, "cardType"),
             v7,
             v6,
             v8 != 103))
  {
    PKUIDynamicImageNamed(CFSTR("Placeholder_transit_card"), CFSTR("Placeholder_transit_card_Dark"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKUIImageNamed(CFSTR("SuicaCard"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v5;
  objc_msgSend(*(id *)(a1 + 40), "imageAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "setDigitalCardImage:", objc_msgSend(v11, "CGImage"));

  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, 1, v13);

}

void __63__PKPaymentSetupProduct_PKUIUtilities__plasticCardCachedImage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else if (*(_QWORD *)(a1 + 32)
         || (objc_msgSend(*(id *)(a1 + 40), "paymentOptions"),
             v6 = (void *)objc_claimAutoreleasedReturnValue(),
             objc_msgSend(v6, "firstObject"),
             v7 = (void *)objc_claimAutoreleasedReturnValue(),
             v8 = objc_msgSend(v7, "cardType"),
             v7,
             v6,
             v8 != 103))
  {
    PKUIDynamicImageNamed(CFSTR("Placeholder_transit_card"), CFSTR("Placeholder_transit_card_Dark"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PKUIImageNamed(CFSTR("SuicaCard"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v5;
  objc_msgSend(*(id *)(a1 + 40), "imageAssets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v10, "setPlasticCardImage:", objc_msgSend(v11, "CGImage"));

  v12 = *(_QWORD *)(a1 + 48);
  if (v12)
    (*(void (**)(uint64_t, uint64_t, id))(v12 + 16))(v12, 1, v13);

}

void __79__PKPaymentSetupProduct_PKUIUtilities__thumbnailCachedImageForSize_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageAssets");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setThumbnailImage:", objc_msgSend(objc_retainAutorelease(v7), "CGImage"));

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, a2, v7);

}

void __56__PKPaymentSetupProduct_PKUIUtilities__logoCachedImage___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "imageAssets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setLogoImage:", objc_msgSend(objc_retainAutorelease(v6), "CGImage"));

  }
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, 1, v6);

}

@end
