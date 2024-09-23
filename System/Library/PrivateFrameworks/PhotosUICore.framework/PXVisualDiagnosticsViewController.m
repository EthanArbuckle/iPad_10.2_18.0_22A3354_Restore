@implementation PXVisualDiagnosticsViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_class *v5;
  id v6;
  PDFView *v7;
  PDFView *documentView;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v14;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)PXVisualDiagnosticsViewController;
  -[PXVisualDiagnosticsViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[PXVisualDiagnosticsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = &v16;
  v18 = 0x2050000000;
  v4 = (void *)getPDFViewClass_softClass;
  v19 = getPDFViewClass_softClass;
  if (!getPDFViewClass_softClass)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __getPDFViewClass_block_invoke;
    v15[3] = &unk_1E51482E0;
    v15[4] = &v16;
    __getPDFViewClass_block_invoke((uint64_t)v15);
    v4 = (void *)v17[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v16, 8);
  v6 = [v5 alloc];
  objc_msgSend(v3, "bounds");
  v7 = (PDFView *)objc_msgSend(v6, "initWithFrame:");
  documentView = self->_documentView;
  self->_documentView = v7;

  -[PDFView setAutoresizingMask:](self->_documentView, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->_documentView);
  -[PXVisualDiagnosticsViewController _updateDocumentView](self, "_updateDocumentView");
  -[PXVisualDiagnosticsViewController setTitle:](self, "setTitle:", CFSTR("Visual Diagnostics"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__handleDoneBarButtonItem_);
  -[PXVisualDiagnosticsViewController navigationItem](self, "navigationItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setLeftBarButtonItem:", v9);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel__handleActionBarButtonItem_);
  v20[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXVisualDiagnosticsViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItems:", v12);

}

- (void)setDocument:(id)a3
{
  PDFDocument *v4;
  PDFDocument *document;

  v4 = (PDFDocument *)objc_msgSend(a3, "copy");
  document = self->_document;
  self->_document = v4;

  -[PXVisualDiagnosticsViewController _invalidateDocumentView](self, "_invalidateDocumentView");
}

- (void)_updateDocumentView
{
  void *v3;
  id v4;

  -[PXVisualDiagnosticsViewController document](self, "document");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXVisualDiagnosticsViewController documentView](self, "documentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDocument:", v4);

}

- (void)_handleDoneBarButtonItem:(id)a3
{
  -[PXVisualDiagnosticsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_handleTapToRadarButton:(id)a3
{
  PXRadarConfiguration *v4;

  v4 = objc_alloc_init(PXRadarConfiguration);
  -[PXRadarConfiguration addDiagnosticProvider:](v4, "addDiagnosticProvider:", self);
  -[PXRadarConfiguration setComponent:](v4, "setComponent:", 1);
  -[PXRadarConfiguration setKeywordIDs:](v4, "setKeywordIDs:", &unk_1E53E8C28);
  -[PXRadarConfiguration setAttachmentsIncludeAnyUserAsset:](v4, "setAttachmentsIncludeAnyUserAsset:", 0);
  PXFileRadarWithConfiguration(v4);

}

- (void)_handleActionBarButtonItem:(id)a3
{
  id v4;
  id v5;
  void (**v6)(void *, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  _QWORD aBlock[4];
  id v22;

  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__PXVisualDiagnosticsViewController__handleActionBarButtonItem___block_invoke;
  aBlock[3] = &unk_1E51479C8;
  v22 = v4;
  v5 = v4;
  v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  -[PXVisualDiagnosticsViewController document](self, "document");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D96D28]), "initWithActivityItems:applicationActivities:", v5, 0);
  -[PXVisualDiagnosticsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  -[PXVisualDiagnosticsViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v10, "safeAreaInsets");
  v18 = v17;
  objc_msgSend(v9, "popoverPresentationController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setSourceView:", v10);

  objc_msgSend(v9, "popoverPresentationController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setSourceRect:", v12, v14, v16, v18);

}

- (void)collectTapToRadarDiagnosticsIntoContainer:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[PXVisualDiagnosticsViewController document](self, "document");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "documentURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addAttachment:", v5);

}

- (PDFDocument)document
{
  return self->_document;
}

- (PDFView)documentView
{
  return self->_documentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentView, 0);
  objc_storeStrong((id *)&self->_document, 0);
}

uint64_t __64__PXVisualDiagnosticsViewController__handleActionBarButtonItem___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

@end
