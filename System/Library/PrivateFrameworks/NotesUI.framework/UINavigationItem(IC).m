@implementation UINavigationItem(IC)

- (void)ic_setTitle:()IC andSubtitle:
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)MEMORY[0x1E0DC3990];
  v7 = a4;
  v8 = a3;
  v9 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v10);

  objc_msgSend(v9, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v9, "setText:", v8);

  v11 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AA0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFont:", v12);

  objc_msgSend(v11, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v11, "setText:", v7);

  v13 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v16[0] = v9;
  v16[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithArrangedSubviews:", v14);

  objc_msgSend(v15, "setDistribution:", 4);
  objc_msgSend(v15, "setAlignment:", 3);
  objc_msgSend(v15, "setAxis:", 1);
  objc_msgSend(a1, "setTitleView:", v15);

}

@end
