@implementation PKPaymentSetupProductCategory(PKUIUtilities)

- (id)logoCachedImage:()PKUIUtilities
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  void (**v12)(id, _QWORD, void *);

  v4 = a3;
  objc_msgSend(a1, "imageAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "logoImage");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v6, 0, PKUIScreenScale());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      v4[2](v4, 0, v7);
  }
  else
  {
    objc_msgSend(a1, "imageAssetURLs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logoImageUrl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __64__PKPaymentSetupProductCategory_PKUIUtilities__logoCachedImage___block_invoke;
    v11[3] = &unk_1E3E632B8;
    v11[4] = a1;
    v12 = v4;
    PKCommonCachedImageFromURL(v9, v11);

    v7 = 0;
  }

  return v7;
}

@end
