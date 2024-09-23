@implementation UIPrintScaleToFitOption

- (id)printOptionTableViewCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("ScaleToFitPrintOption"));
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Scale to fit paper size"), CFSTR("Scale to fit paper size"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v5);

  objc_msgSend(v3, "setSelectionStyle:", 0);
  createPrintKitUISwitch(*MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption printInfo](self, "printInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOn:", objc_msgSend(v8, "scaleToFit"));

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_updateValue_, 4096);
  objc_msgSend(v3, "setAccessoryView:", v7);
  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v3);

  return v3;
}

- (BOOL)shouldShow
{
  return 0;
}

- (void)updateValue:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "isOn");
  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setScaleToFit:", v4);

}

- (id)summary
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[UIPrintOption printInfo](self, "printInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scaleToFit");
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("Scale to Fit");
  else
    v6 = CFSTR("No Scaling");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, v6, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
