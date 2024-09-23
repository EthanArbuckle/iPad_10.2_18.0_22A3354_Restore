@implementation UIView(CACOnboardingAdditions)

- (void)addBottomBorderWithColor:()CACOnboardingAdditions thickness:margins:
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v8 = (objc_class *)MEMORY[0x24BEBDB00];
  v9 = a5;
  v10 = [v8 alloc];
  v15 = (id)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v15, "setBackgroundColor:", v9);

  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(a1, "addSubview:", v15);
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 8, 0, 0, 8, 1.0, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addConstraint:", v11);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 4, 0, a1, 4, 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addConstraint:", v12);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 4, 0, a1, 4, 1.0, a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addConstraint:", v13);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v15, 4, 0, a1, 4, 1.0, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "addConstraint:", v14);

}

@end
