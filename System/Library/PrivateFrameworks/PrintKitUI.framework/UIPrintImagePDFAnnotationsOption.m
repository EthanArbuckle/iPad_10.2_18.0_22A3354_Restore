@implementation UIPrintImagePDFAnnotationsOption

- (UIPrintImagePDFAnnotationsOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintImagePDFAnnotationsOption *v4;
  UIPrintImagePDFAnnotationsOption *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIPrintImagePDFAnnotationsOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v8, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UIPrintOption printInfo](v4, "printInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:forKeyPath:options:context:", v5, 0x1E9D986D8, 0, 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D986D8);

  v4.receiver = self;
  v4.super_class = (Class)UIPrintImagePDFAnnotationsOption;
  -[UIPrintImagePDFAnnotationsOption dealloc](&v4, sel_dealloc);
}

- (BOOL)shouldShow
{
  void *v2;
  char v3;

  -[UIPrintOption printInfo](self, "printInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pdfAnnotationsAvailable");

  return v3;
}

- (id)printOptionTableViewCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionsTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintOptionCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Print PDF Annotations"), CFSTR("Print PDF Annotations"), CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v8);

  objc_msgSend(v5, "setContentConfiguration:", v6);
  objc_msgSend(v5, "setSelectionStyle:", 0);
  createPrintKitUISwitch(*MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintImagePDFAnnotationsOption setImagePDFAnnotationsSwitch:](self, "setImagePDFAnnotationsSwitch:", v9);

  -[UIPrintOption printInfo](self, "printInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "imagePDFAnnotations");
  -[UIPrintImagePDFAnnotationsOption imagePDFAnnotationsSwitch](self, "imagePDFAnnotationsSwitch");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setOn:", v11);

  -[UIPrintImagePDFAnnotationsOption imagePDFAnnotationsSwitch](self, "imagePDFAnnotationsSwitch");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTarget:action:forControlEvents:", self, sel_changeImagePDFAnnotations_, 4096);

  -[UIPrintImagePDFAnnotationsOption imagePDFAnnotationsSwitch](self, "imagePDFAnnotationsSwitch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessoryView:", v14);

  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);
  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__UIPrintImagePDFAnnotationsOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  block[3] = &unk_1E9D96D90;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __83__UIPrintImagePDFAnnotationsOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateFromPrintInfo");
}

- (void)updateFromPrintInfo
{
  uint64_t v3;
  void *v4;
  id v5;

  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v5, "imagePDFAnnotations");
  -[UIPrintImagePDFAnnotationsOption imagePDFAnnotationsSwitch](self, "imagePDFAnnotationsSwitch");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOn:", v3);

}

- (void)changeImagePDFAnnotations:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "isOn");
  -[UIPrintOption printInfo](self, "printInfo");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImagePDFAnnotations:", v4);

}

- (id)summary
{
  void *v2;
  void *v3;
  void *v4;

  -[UIPrintOption printInfo](self, "printInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "imagePDFAnnotations"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Print PDF Annotations"), CFSTR("Print PDF Annotations"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (UISwitch)imagePDFAnnotationsSwitch
{
  return self->_imagePDFAnnotationsSwitch;
}

- (void)setImagePDFAnnotationsSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_imagePDFAnnotationsSwitch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imagePDFAnnotationsSwitch, 0);
}

@end
