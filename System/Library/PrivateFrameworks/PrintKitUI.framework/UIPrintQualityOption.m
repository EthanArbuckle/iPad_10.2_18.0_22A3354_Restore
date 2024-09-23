@implementation UIPrintQualityOption

- (UIPrintQualityOption)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  UIPrintQualityOption *v4;
  void *v5;
  void *v6;
  UIPrintQualityView *v7;
  void *v8;
  UIPrintQualityView *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIPrintQualityOption;
  v4 = -[UIPrintOption initWithPrintInfo:printPanelViewController:](&v13, sel_initWithPrintInfo_printPanelViewController_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Print Quality"), CFSTR("Print Quality"), CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOption setTitle:](v4, "setTitle:", v6);

    v7 = [UIPrintQualityView alloc];
    -[UIPrintOption printInfo](v4, "printInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UIPrintQualityView initWithFrame:printInfo:](v7, "initWithFrame:printInfo:", v8, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UIPrintQualityOption setPrintQualityView:](v4, "setPrintQualityView:", v9);

    -[UIPrintQualityOption currentPrinterChanged](v4, "currentPrinterChanged");
    -[UIPrintOption printInfo](v4, "printInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:forKeyPath:options:context:", v4, 0x1E9D98878, 0, 0);

    -[UIPrintOption printInfo](v4, "printInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:forKeyPath:options:context:", v4, 0x1E9D986F8, 0, 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, 0x1E9D98878);

  -[UIPrintOption printInfo](self, "printInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, 0x1E9D986F8);

  v5.receiver = self;
  v5.super_class = (Class)UIPrintQualityOption;
  -[UIPrintQualityOption dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  UIPrintQualityOption *v11;

  v7 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __71__UIPrintQualityOption_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v9[3] = &unk_1E9D96E78;
  v10 = v7;
  v11 = self;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __71__UIPrintQualityOption_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", 0x1E9D986F8);
  v3 = *(void **)(a1 + 40);
  if (v2)
    return objc_msgSend(v3, "currentPrinterChanged");
  else
    return objc_msgSend(v3, "updateFromPrintInfo");
}

- (NSArray)printQualities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *qualities;

  if (!self->_qualities)
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentPrinter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "printerInfoDict");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UIPrintOption printInfo](self, "printInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentPrinter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "supportedQualities");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      qualities = self->_qualities;
      self->_qualities = v8;

    }
  }
  return self->_qualities;
}

- (void)updateFromPrintInfo
{
  id v3;

  -[UIPrintQualityOption summaryString](self, "summaryString");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPrintOption setSummary:](self, "setSummary:", v3);

}

- (void)currentPrinterChanged
{
  -[UIPrintQualityOption setPrintQualities:](self, "setPrintQualities:", 0);
  -[UIPrintQualityOption updateFromPrintInfo](self, "updateFromPrintInfo");
}

- (BOOL)shouldShow
{
  void *v2;
  BOOL v3;

  -[UIPrintQualityOption printQualities](self, "printQualities");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  v23[4] = *MEMORY[0x1E0C80C00];
  -[UIPrintOption printPanelViewController](self, "printPanelViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "printOptionsTableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("UIPrintQualityCell"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("UIPrintQualityCell"));
    -[UIPrintQualityOption printQualityView](self, "printQualityView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setUserInteractionEnabled:", 1);
    objc_msgSend(v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);

    v8 = (void *)MEMORY[0x1E0CB3718];
    v19 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "superview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 3, 0, v22, 15, 1.0, 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v21;
    v9 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "superview");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 5, 0, v20, 5, 1.0, 0.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v10;
    v11 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 6, 0, v12, 6, 1.0, 0.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v13;
    v14 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v6, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v6, 4, 0, v15, 4, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activateConstraints:", v17);

  }
  objc_msgSend(v5, "setSelectionStyle:", 0);
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);
  -[UIPrintOption setTableViewCell:](self, "setTableViewCell:", v5);

  return v5;
}

- (id)shortSummary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[UIPrintOption printInfo](self, "printInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "quality");

  if (v4 == 3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("Draft");
  }
  else
  {
    -[UIPrintOption printInfo](self, "printInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "quality");

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v9 == 5)
      v7 = CFSTR("Best");
    else
      v7 = CFSTR("Normal");
  }
  objc_msgSend(v5, "localizedStringForKey:value:table:", v7, v7, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)summaryString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("%@ Quality"), CFSTR("%@ Quality"), CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintQualityOption shortSummary](self, "shortSummary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)didSelectPrintOption
{
  id v2;

  -[UIPrintOption tableViewCell](self, "tableViewCell");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "printOptionCellTapped");

}

- (NSArray)qualities
{
  return self->_qualities;
}

- (void)setQualities:(id)a3
{
  objc_storeStrong((id *)&self->_qualities, a3);
}

- (void)setPrintQualities:(id)a3
{
  objc_storeStrong((id *)&self->_printQualities, a3);
}

- (UIPrintQualityView)printQualityView
{
  return self->_printQualityView;
}

- (void)setPrintQualityView:(id)a3
{
  objc_storeStrong((id *)&self->_printQualityView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_printQualityView, 0);
  objc_storeStrong((id *)&self->_printQualities, 0);
  objc_storeStrong((id *)&self->_qualities, 0);
}

@end
