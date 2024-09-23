@implementation UIPrintScalingSection

- (UIPrintScalingSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6;
  id v7;
  UIPrintScalingSection *v8;
  void *v9;
  void *v10;
  UIPrintScaleToFitOption *v11;
  UIPrintScaleDownOnlyOption *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIPrintScalingSection;
  v8 = -[UIPrintOptionSection initWithPrintInfo:printPanelViewController:](&v14, sel_initWithPrintInfo_printPanelViewController_, v6, v7);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Scaling"), CFSTR("Scaling"), CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOptionSection setTitle:](v8, "setTitle:", v10);

    v11 = -[UIPrintOption initWithPrintInfo:printPanelViewController:]([UIPrintScaleToFitOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintScalingSection setScaleToFitPrintOption:](v8, "setScaleToFitPrintOption:", v11);

    v12 = -[UIPrintOption initWithPrintInfo:printPanelViewController:]([UIPrintScaleDownOnlyOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintScalingSection setScaleDownOnlyPrintOption:](v8, "setScaleDownOnlyPrintOption:", v12);

    -[UIPrintScalingSection updatePrintOptionsList](v8, "updatePrintOptionsList");
  }

  return v8;
}

- (BOOL)updatePrintOptionsList
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintScalingSection scaleToFitPrintOption](self, "scaleToFitPrintOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShow");

  if (v5)
  {
    -[UIPrintScalingSection scaleToFitPrintOption](self, "scaleToFitPrintOption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[UIPrintScalingSection scaleDownOnlyPrintOption](self, "scaleDownOnlyPrintOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldShow");

  if (v8)
  {
    -[UIPrintScalingSection scaleDownOnlyPrintOption](self, "scaleDownOnlyPrintOption");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[UIPrintOptionSection printOptions](self, "printOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToArray:", v3);

  if ((v11 & 1) == 0)
    -[UIPrintOptionSection setPrintOptions:](self, "setPrintOptions:", v3);

  return v11 ^ 1;
}

- (void)scaleToFitChanged
{
  void *v3;
  id v4;

  -[UIPrintScalingSection updatePrintOptionsList](self, "updatePrintOptionsList");
  -[UIPrintOptionSection printPanelViewController](self, "printPanelViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "printOptionsTableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (UIPrintScaleToFitOption)scaleToFitPrintOption
{
  return self->_scaleToFitPrintOption;
}

- (void)setScaleToFitPrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_scaleToFitPrintOption, a3);
}

- (UIPrintScaleDownOnlyOption)scaleDownOnlyPrintOption
{
  return self->_scaleDownOnlyPrintOption;
}

- (void)setScaleDownOnlyPrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_scaleDownOnlyPrintOption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaleDownOnlyPrintOption, 0);
  objc_storeStrong((id *)&self->_scaleToFitPrintOption, 0);
}

@end
