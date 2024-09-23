@implementation UIImage(TPTelephonyUIUtilities)

+ (id)_tpImageNamed:()TPTelephonyUIUtilities inBundle:compatibleWithTraitCollection:
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v8)
  {
    TelephonyUIBundle();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
      goto LABEL_3;
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  if (!v7)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:compatibleWithTraitCollection:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v10;
}

+ (id)tpImageNamed:()TPTelephonyUIUtilities inBundle:
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0DC3870];
  v6 = (void *)MEMORY[0x1E0DC3BF8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_tpImageNamed:inBundle:compatibleWithTraitCollection:", v8, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
