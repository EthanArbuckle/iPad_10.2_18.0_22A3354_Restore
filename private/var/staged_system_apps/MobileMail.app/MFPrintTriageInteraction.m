@implementation MFPrintTriageInteraction

+ (id)interactionWithContentRequest:(id)a3 scene:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v12;

  v8 = a5;
  v12.receiver = a1;
  v12.super_class = (Class)&OBJC_METACLASS___MFPrintTriageInteraction;
  v9 = objc_msgSendSuper2(&v12, "interactionWithContentRequest:scene:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v10, "setPrinterDelegate:", v8);

  return v10;
}

- (void)_performInteraction_Internal
{
  void *v3;
  MFMessagePrinter *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  void *v10;
  MFMessagePrinter *v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction contentRequest](self, "contentRequest"));

  if (v3)
  {
    v4 = [MFMessagePrinter alloc];
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction contentRequest](self, "contentRequest"));
    v11 = -[MFMessagePrinter initWithContentRequest:](v4, "initWithContentRequest:", v5);

  }
  else
  {
    v11 = 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFPrintTriageInteraction printerDelegate](self, "printerDelegate"));
  -[MFMessagePrinter setDelegate:](v11, "setDelegate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction presentationSource](self, "presentationSource"));
  v8 = objc_opt_class(UIBarButtonItem);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction presentationSource](self, "presentationSource"));
    -[MFMessagePrinter presentPrintPopoverFromBarButtonItem:](v11, "presentPrintPopoverFromBarButtonItem:", v10);

  }
  else
  {
    -[MFMessagePrinter presentPrintSheet](v11, "presentPrintSheet");
  }

}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PRINT"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerPrint;
}

- (id)_iconImageName
{
  return MFImageGlyphPrint;
}

- (id)_previewImageName
{
  return MFImageGlyphPrint;
}

- (MFMessagePrinterDelegate)printerDelegate
{
  return (MFMessagePrinterDelegate *)objc_loadWeakRetained((id *)&self->_printerDelegate);
}

- (void)setPrinterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_printerDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_printerDelegate);
}

@end
