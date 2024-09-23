@implementation PKVirtualCard(PassSnapshot)

- (id)_largeAppleCardIcon
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3870];
  PKPassKitUIFoundationBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("AppleCardAutoFillCreditCardIconLarge"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_genericCardIcon
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC3870];
  PKPassKitUIFoundationBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:", CFSTR("GenericAutofill"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)cardArtworkWithSize:()PassSnapshot completion:
{
  void (**v8)(id, uint64_t);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  void *v17;
  void (**v18)(id, uint64_t);
  double v19;
  double v20;

  v8 = a5;
  if (v8)
  {
    v9 = objc_msgSend(a1, "type");
    switch(v9)
    {
      case 0:
        objc_msgSend(a1, "_genericCardIcon");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v14 = (void *)v10;
        v8[2](v8, v10);

        break;
      case 2:
        +[PKPassSnapshotter sharedInstance](PKPassSnapshotter, "sharedInstance");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc_init(MEMORY[0x1E0D672B0]);
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __62__PKVirtualCard_PassSnapshot__cardArtworkWithSize_completion___block_invoke;
        v15[3] = &unk_1E3E6A208;
        v16 = v11;
        v19 = a2;
        v20 = a3;
        v17 = a1;
        v18 = v8;
        v13 = v11;
        objc_msgSend(v12, "paymentPassForVirtualCard:completion:", a1, v15);

        break;
      case 1:
        if (a2 <= 40.0)
          objc_msgSend(a1, "_smallAppleCardIcon");
        else
          objc_msgSend(a1, "_largeAppleCardIcon");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
    }
  }

}

@end
