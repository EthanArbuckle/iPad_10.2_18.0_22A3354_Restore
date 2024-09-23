@implementation UIPrintStandardOptionsSection

- (UIPrintStandardOptionsSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6;
  id v7;
  UIPrintStandardOptionsSection *v8;
  UIPrintStandardOptionsSection *v9;
  UIPrinterSelectionOption *v10;
  UIPrintPresetsOption *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UIPrintStandardOptionsSection;
  v8 = -[UIPrintOptionSection initWithPrintInfo:printPanelViewController:](&v14, sel_initWithPrintInfo_printPanelViewController_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[UIPrintOptionSection setTitle:](v8, "setTitle:", &stru_1E9D97C98);
    v10 = -[UIPrinterSelectionOption initWithPrintInfo:printPanelViewController:]([UIPrinterSelectionOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintStandardOptionsSection setPrinterSelectionOption:](v9, "setPrinterSelectionOption:", v10);

    v11 = -[UIPrintPresetsOption initWithPrintInfo:printPanelViewController:]([UIPrintPresetsOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintStandardOptionsSection setPresetsOption:](v9, "setPresetsOption:", v11);

    -[UIPrintStandardOptionsSection updatePrintOptionsList](v9, "updatePrintOptionsList");
    -[UIPrintStandardOptionsSection presetsOption](v9, "presetsOption");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:forKeyPath:options:context:", v9, CFSTR("shouldShow"), 0, 0);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIPrintStandardOptionsSection presetsOption](self, "presetsOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("shouldShow"));

  v4.receiver = self;
  v4.super_class = (Class)UIPrintStandardOptionsSection;
  -[UIPrintStandardOptionsSection dealloc](&v4, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__UIPrintStandardOptionsSection_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __80__UIPrintStandardOptionsSection_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePrintOptionsList");
}

- (BOOL)updatePrintOptionsList
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  char v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintStandardOptionsSection printerSelectionOption](self, "printerSelectionOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[UIPrintStandardOptionsSection presetsOption](self, "presetsOption");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldShow");

  if (v6)
  {
    -[UIPrintStandardOptionsSection presetsOption](self, "presetsOption");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[UIPrintOptionSection printOptions](self, "printOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToArray:", v3);

  if ((v9 & 1) == 0)
    -[UIPrintOptionSection setPrintOptions:](self, "setPrintOptions:", v3);

  return v9 ^ 1;
}

- (void)setShowContactingPrinter:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[UIPrintStandardOptionsSection printerSelectionOption](self, "printerSelectionOption");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowContactingPrinter:", v3);

}

- (UIPrinterSelectionOption)printerSelectionOption
{
  return self->_printerSelectionOption;
}

- (void)setPrinterSelectionOption:(id)a3
{
  objc_storeStrong((id *)&self->_printerSelectionOption, a3);
}

- (UIPrintPresetsOption)presetsOption
{
  return self->_presetsOption;
}

- (void)setPresetsOption:(id)a3
{
  objc_storeStrong((id *)&self->_presetsOption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presetsOption, 0);
  objc_storeStrong((id *)&self->_printerSelectionOption, 0);
}

@end
