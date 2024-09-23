@implementation UIPrintScaleDownOnlyOption

- (id)printOptionTableViewCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("ScaleDownOnlyPrintOption"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Scale Down Only"), CFSTR("Scale Down Only"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v3, "setSelectionStyle:", 0);
  createPrintKitUISwitch(*MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption printInfo](self, "printInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOn:", objc_msgSend(v8, "scaleDownOnly"));

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_updateValue_, 4096);
  objc_msgSend(v3, "setAccessoryView:", v7);
  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v3);

  return v3;
}

- (BOOL)shouldShow
{
  void *v2;
  char v3;

  -[UIPrintOption printInfo](self, "printInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scaleToFit");

  return v3;
}

- (void)updateValue:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "isOn");
  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScaleDownOnly:", v4);

}

- (id)summary
{
  void *v2;
  void *v3;
  void *v4;

  -[UIPrintOption printInfo](self, "printInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "scaleDownOnly"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Scale Down Only"), CFSTR("Scale Down Only"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
