@implementation UIPrintMoreOptionsSection

- (UIPrintMoreOptionsSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4
{
  id v6;
  id v7;
  UIPrintMoreOptionsSection *v8;
  UIPrintMoreOptionsSection *v9;
  UIPrintCopiesOption *v10;
  UIPrintPageRangeOption *v11;
  UIPrintInColorOption *v12;
  UIPrintTwoSidedOption *v13;
  UIPrintPaperSizeOption *v14;
  UIPrintOrientationOption *v15;
  UIPrintScalingOption *v16;
  UIPrintImagePDFAnnotationsOption *v17;
  UIPrintAccountInfoOption *v18;
  objc_super v20;

  v6 = a3;
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)UIPrintMoreOptionsSection;
  v8 = -[UIPrintOptionSection initWithPrintInfo:printPanelViewController:](&v20, sel_initWithPrintInfo_printPanelViewController_, v6, v7);
  v9 = v8;
  if (v8)
  {
    -[UIPrintOptionSection setTitle:](v8, "setTitle:", &stru_1E9D97C98);
    v10 = -[UIPrintCopiesOption initWithPrintInfo:printPanelViewController:]([UIPrintCopiesOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintMoreOptionsSection setCopiesOption:](v9, "setCopiesOption:", v10);

    v11 = -[UIPrintPageRangeOption initWithPrintInfo:printPanelViewController:]([UIPrintPageRangeOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintMoreOptionsSection setPageRangeOption:](v9, "setPageRangeOption:", v11);

    v12 = -[UIPrintInColorOption initWithPrintInfo:printPanelViewController:]([UIPrintInColorOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintMoreOptionsSection setBlackWhiteOption:](v9, "setBlackWhiteOption:", v12);

    v13 = -[UIPrintTwoSidedOption initWithPrintInfo:printPanelViewController:]([UIPrintTwoSidedOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintMoreOptionsSection setTwoSidedOption:](v9, "setTwoSidedOption:", v13);

    v14 = -[UIPrintPaperSizeOption initWithPrintInfo:printPanelViewController:]([UIPrintPaperSizeOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintMoreOptionsSection setPaperSizePrintOption:](v9, "setPaperSizePrintOption:", v14);

    v15 = -[UIPrintOrientationOption initWithPrintInfo:printPanelViewController:]([UIPrintOrientationOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintMoreOptionsSection setOrientationPrintOption:](v9, "setOrientationPrintOption:", v15);

    v16 = -[UIPrintScalingOption initWithPrintInfo:printPanelViewController:]([UIPrintScalingOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintMoreOptionsSection setScalingPrintOption:](v9, "setScalingPrintOption:", v16);

    v17 = -[UIPrintImagePDFAnnotationsOption initWithPrintInfo:printPanelViewController:]([UIPrintImagePDFAnnotationsOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintMoreOptionsSection setImagePDFAnnotationsPrintOption:](v9, "setImagePDFAnnotationsPrintOption:", v17);

    v18 = -[UIPrintAccountInfoOption initWithPrintInfo:printPanelViewController:]([UIPrintAccountInfoOption alloc], "initWithPrintInfo:printPanelViewController:", v6, v7);
    -[UIPrintMoreOptionsSection setAccountInfoPrintOption:](v9, "setAccountInfoPrintOption:", v18);

    -[UIPrintMoreOptionsSection updatePrintOptionsList](v9, "updatePrintOptionsList");
  }

  return v9;
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
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  char v32;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintMoreOptionsSection copiesOption](self, "copiesOption");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "shouldShow");

  if (v5)
  {
    -[UIPrintMoreOptionsSection copiesOption](self, "copiesOption");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

  }
  -[UIPrintMoreOptionsSection pageRangeOption](self, "pageRangeOption");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldShow");

  if (v8)
  {
    -[UIPrintMoreOptionsSection pageRangeOption](self, "pageRangeOption");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v9);

  }
  -[UIPrintMoreOptionsSection blackWhiteOption](self, "blackWhiteOption");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldShow");

  if (v11)
  {
    -[UIPrintMoreOptionsSection blackWhiteOption](self, "blackWhiteOption");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v12);

  }
  -[UIPrintMoreOptionsSection twoSidedOption](self, "twoSidedOption");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "shouldShow");

  if (v14)
  {
    -[UIPrintMoreOptionsSection twoSidedOption](self, "twoSidedOption");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  -[UIPrintMoreOptionsSection paperSizePrintOption](self, "paperSizePrintOption");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "shouldShow");

  if (v17)
  {
    -[UIPrintMoreOptionsSection paperSizePrintOption](self, "paperSizePrintOption");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v18);

  }
  -[UIPrintMoreOptionsSection orientationPrintOption](self, "orientationPrintOption");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "shouldShow");

  if (v20)
  {
    -[UIPrintMoreOptionsSection orientationPrintOption](self, "orientationPrintOption");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  -[UIPrintMoreOptionsSection scalingPrintOption](self, "scalingPrintOption");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "shouldShow");

  if (v23)
  {
    -[UIPrintMoreOptionsSection scalingPrintOption](self, "scalingPrintOption");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v24);

  }
  -[UIPrintMoreOptionsSection imagePDFAnnotationsPrintOption](self, "imagePDFAnnotationsPrintOption");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "shouldShow");

  if (v26)
  {
    -[UIPrintMoreOptionsSection imagePDFAnnotationsPrintOption](self, "imagePDFAnnotationsPrintOption");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v27);

  }
  -[UIPrintMoreOptionsSection accountInfoPrintOption](self, "accountInfoPrintOption");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "shouldShow");

  if (v29)
  {
    -[UIPrintMoreOptionsSection accountInfoPrintOption](self, "accountInfoPrintOption");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v30);

  }
  -[UIPrintOptionSection printOptions](self, "printOptions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToArray:", v3);

  if ((v32 & 1) == 0)
    -[UIPrintOptionSection setPrintOptions:](self, "setPrintOptions:", v3);

  return v32 ^ 1;
}

- (BOOL)keyboardShowing
{
  void *v3;
  char v4;
  void *v5;

  -[UIPrintMoreOptionsSection copiesOption](self, "copiesOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "keyboardShowing") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[UIPrintMoreOptionsSection scalingPrintOption](self, "scalingPrintOption");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "keyboardShowing");

  }
  return v4;
}

- (void)dismissKeyboard
{
  void *v3;
  id v4;

  -[UIPrintMoreOptionsSection copiesOption](self, "copiesOption");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissKeyboard");

  -[UIPrintMoreOptionsSection scalingPrintOption](self, "scalingPrintOption");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissKeyboard");

}

- (UIPrintCopiesOption)copiesOption
{
  return self->_copiesOption;
}

- (void)setCopiesOption:(id)a3
{
  objc_storeStrong((id *)&self->_copiesOption, a3);
}

- (UIPrintPageRangeOption)pageRangeOption
{
  return self->_pageRangeOption;
}

- (void)setPageRangeOption:(id)a3
{
  objc_storeStrong((id *)&self->_pageRangeOption, a3);
}

- (UIPrintInColorOption)blackWhiteOption
{
  return self->_blackWhiteOption;
}

- (void)setBlackWhiteOption:(id)a3
{
  objc_storeStrong((id *)&self->_blackWhiteOption, a3);
}

- (UIPrintTwoSidedOption)twoSidedOption
{
  return self->_twoSidedOption;
}

- (void)setTwoSidedOption:(id)a3
{
  objc_storeStrong((id *)&self->_twoSidedOption, a3);
}

- (UIPrintPaperSizeOption)paperSizePrintOption
{
  return self->_paperSizePrintOption;
}

- (void)setPaperSizePrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_paperSizePrintOption, a3);
}

- (UIPrintOrientationOption)orientationPrintOption
{
  return self->_orientationPrintOption;
}

- (void)setOrientationPrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_orientationPrintOption, a3);
}

- (UIPrintScalingOption)scalingPrintOption
{
  return self->_scalingPrintOption;
}

- (void)setScalingPrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_scalingPrintOption, a3);
}

- (UIPrintImagePDFAnnotationsOption)imagePDFAnnotationsPrintOption
{
  return self->_imagePDFAnnotationsPrintOption;
}

- (void)setImagePDFAnnotationsPrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_imagePDFAnnotationsPrintOption, a3);
}

- (UIPrintAccountInfoOption)accountInfoPrintOption
{
  return self->_accountInfoPrintOption;
}

- (void)setAccountInfoPrintOption:(id)a3
{
  objc_storeStrong((id *)&self->_accountInfoPrintOption, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountInfoPrintOption, 0);
  objc_storeStrong((id *)&self->_imagePDFAnnotationsPrintOption, 0);
  objc_storeStrong((id *)&self->_scalingPrintOption, 0);
  objc_storeStrong((id *)&self->_orientationPrintOption, 0);
  objc_storeStrong((id *)&self->_paperSizePrintOption, 0);
  objc_storeStrong((id *)&self->_twoSidedOption, 0);
  objc_storeStrong((id *)&self->_blackWhiteOption, 0);
  objc_storeStrong((id *)&self->_pageRangeOption, 0);
  objc_storeStrong((id *)&self->_copiesOption, 0);
}

@end
