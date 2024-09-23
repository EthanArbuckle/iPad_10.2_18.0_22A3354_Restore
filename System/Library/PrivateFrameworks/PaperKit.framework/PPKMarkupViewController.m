@implementation PPKMarkupViewController

- (PPKMarkupViewController)init
{
  PPKMarkupViewController *v2;
  PPKMarkupViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PPKMarkupViewController;
  v2 = -[PPKMarkupViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PPKMarkupViewController _ppkMarkupViewControllerCommonInit](v2, "_ppkMarkupViewControllerCommonInit");
  return v3;
}

- (PPKMarkupViewController)initWithCoder:(id)a3
{
  PPKMarkupViewController *v3;
  PPKMarkupViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PPKMarkupViewController;
  v3 = -[PPKMarkupViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[PPKMarkupViewController _ppkMarkupViewControllerCommonInit](v3, "_ppkMarkupViewControllerCommonInit");
  return v4;
}

- (PPKMarkupViewController)initWithImageAnalysisEnabled:(BOOL)a3
{
  _BOOL8 v3;
  PPKMarkupViewController *v4;
  PPKMarkupViewController *v5;
  void *v6;

  v3 = a3;
  v4 = -[PPKMarkupViewController init](self, "init");
  v5 = v4;
  if (v4)
  {
    -[PPKMarkupViewController markupContainerVC](v4, "markupContainerVC");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setIsImageAnalysisEnabled:", v3);

  }
  return v5;
}

- (void)_ppkMarkupViewControllerCommonInit
{
  PPKMarkupContainerViewController *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc_init(PPKMarkupContainerViewController);
  -[PPKMarkupViewController setMarkupContainerVC:](self, "setMarkupContainerVC:", v3);

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPdfBackgroundColor:", v6);

}

- (void)viewDidLoad
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
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  uint64_t v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)PPKMarkupViewController;
  -[PPKMarkupViewController viewDidLoad](&v26, sel_viewDidLoad);
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKMarkupViewController addChildViewController:](self, "addChildViewController:", v3);

  -[PPKMarkupViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addSubview:", v6);
  objc_msgSend(v6, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToAnchor:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v22;
  objc_msgSend(v6, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v7;
  objc_msgSend(v6, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v4;
  objc_msgSend(v4, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v10;
  objc_msgSend(v6, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKMarkupViewController setFullViewLayoutConstraints:](self, "setFullViewLayoutConstraints:", v14);

  v15 = (void *)MEMORY[0x1E0CB3718];
  -[PPKMarkupViewController fullViewLayoutConstraints](self, "fullViewLayoutConstraints");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v16);

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "didMoveToParentViewController:", self);

  -[PPKMarkupViewController updateContentInsets](self, "updateContentInsets");
  v27 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)-[PPKMarkupViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v18, sel_horizontalSizeClassDidChange);

}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "documentIsLocked");

  if ((v4 & 1) != 0)
    return 0;
  -[PPKMarkupViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = objc_msgSend(v6, "controllerCanBecomeFirstResponder:", self);
  }
  else
  {
    -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "canBecomeFirstResponder");

  }
  return v5;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)canResignFirstResponder
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canResignFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3;
}

- (UIFindInteraction)_findInteraction
{
  void *v2;
  void *v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "findInteraction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIFindInteraction *)v3;
}

- (void)_setFindInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFindInteractionEnabled:", v3);

}

- (BOOL)_findInteractionEnabled
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "findInteractionEnabled");

  return v3;
}

- (void)setData:(id)a3 withArchivedModelData:(id)a4
{
  -[PPKMarkupViewController loadWithData:archivedModelData:placeholderImage:completionHandler:](self, "loadWithData:archivedModelData:placeholderImage:completionHandler:", a3, a4, 0, 0);
}

- (void)setData:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5
{
  -[PPKMarkupViewController loadWithData:archivedModelData:placeholderImage:completionHandler:](self, "loadWithData:archivedModelData:placeholderImage:completionHandler:", a3, a4, a5, 0);
}

- (void)setImage:(id)a3 withArchivedModelData:(id)a4
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NotImplementedMethod"), CFSTR("PaperKit does not support setImage: methods yet, please use setFileURL: instead."));
}

- (void)setImage:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("NotImplementedMethod"), CFSTR("PaperKit does not support setImage: methods yet, please use setFileURL: instead."), a5);
}

- (void)setFileURL:(id)a3 withArchivedModelData:(id)a4 placeholderImage:(id)a5
{
  -[PPKMarkupViewController loadWithURL:archivedModelData:placeholderImage:completionHandler:](self, "loadWithURL:archivedModelData:placeholderImage:completionHandler:", a3, a4, a5, 0);
}

- (void)setFileURL:(id)a3 withArchivedModelData:(id)a4
{
  -[PPKMarkupViewController setFileURL:withArchivedModelData:placeholderImage:](self, "setFileURL:withArchivedModelData:placeholderImage:", a3, a4, 0);
}

- (void)loadWithData:(id)a3 archivedModelData:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[PPKMarkupViewController _contentTypeForData:](PPKMarkupViewController, "_contentTypeForData:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKMarkupViewController setSourceContentType:](self, "setSourceContentType:", v14);

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__PPKMarkupViewController_loadWithData_archivedModelData_placeholderImage_completionHandler___block_invoke;
  v17[3] = &unk_1EA838FC8;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "loadFromData:with:placeholderImage:completionHandler:", v13, v12, v11, v17);

}

uint64_t __93__PPKMarkupViewController_loadWithData_archivedModelData_placeholderImage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)loadWithURL:(id)a3 archivedModelData:(id)a4 placeholderImage:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[PPKMarkupViewController _contentTypeForURL:](PPKMarkupViewController, "_contentTypeForURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKMarkupViewController setSourceContentType:](self, "setSourceContentType:", v14);

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __92__PPKMarkupViewController_loadWithURL_archivedModelData_placeholderImage_completionHandler___block_invoke;
  v17[3] = &unk_1EA838FC8;
  v18 = v10;
  v16 = v10;
  objc_msgSend(v15, "loadFromURL:with:placeholderImage:completionHandler:", v13, v12, v11, v17);

}

uint64_t __92__PPKMarkupViewController_loadWithURL_archivedModelData_placeholderImage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)writeToURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKMarkupViewController outputContentType](self, "outputContentType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "writeTo:imageType:error:embeddingSourceImageAndEditModel:options:", v9, v11, a5, 1, v8);

  return (char)a5;
}

- (BOOL)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;

  v6 = a4;
  v8 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKMarkupViewController outputContentType](self, "outputContentType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "writeTo:imageType:error:embeddingSourceImageAndEditModel:", v8, v10, a5, v6);

  return (char)a5;
}

- (BOOL)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 contentType:(id)a5 error:(id *)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;

  v7 = a4;
  v10 = a5;
  v11 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "writeTo:imageType:error:embeddingSourceImageAndEditModel:", v11, v10, a6, v7);

  return (char)a6;
}

- (void)writeToURL:(id)a3 embeddingSourceImageAndEditModel:(BOOL)a4 contentType:(id)a5 options:(id)a6 completionHandler:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v9 = a4;
  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "writeTo:imageType:embeddingSourceImageAndEditModel:options:completionHandler:", v15, v14, v9, v13, v12);

}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKMarkupViewController outputContentType](self, "outputContentType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "writeTo:imageType:error:embeddingSourceImageAndEditModel:", v6, v8, a4, 1);

  return (char)a4;
}

- (id)dataRepresentationWithError:(id *)a3
{
  void *v4;
  void *v5;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataRepresentationWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)createArchivedModelData
{
  void *v2;
  void *v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "archivedModelData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dataRepresentationEmbeddingSourceImageAndEditModel:(BOOL)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)encryptPrivateMetadata
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "encryptPrivateMetadata");

  return v3;
}

- (void)setEncryptPrivateMetadata:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEncryptPrivateMetadata:", v3);

  self->_encryptPrivateMetadata = v3;
}

- (UIScrollView)contentViewScrollView
{
  void *v2;
  void *v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentViewScrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIScrollView *)v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (BOOL)annotationEditingEnabled
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "annotationEditingEnabled");

  return v3;
}

- (BOOL)_hasPDFContent
{
  void *v2;
  char v3;

  -[PPKMarkupViewController sourceContentType](self, "sourceContentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC570]);

  return v3;
}

- (BOOL)needsToolPickerContentInsetActiveForTraitCollection:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (-[PPKMarkupViewController annotationEditingEnabled](self, "annotationEditingEnabled"))
  {
    if (objc_msgSend(v4, "userInterfaceIdiom"))
      v5 = objc_msgSend(v4, "horizontalSizeClass") == 1;
    else
      v5 = 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PPKMarkupViewController;
  -[PPKMarkupViewController viewSafeAreaInsetsDidChange](&v13, sel_viewSafeAreaInsetsDidChange);
  -[PPKMarkupViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKMarkupViewController activeMinimumContentInsetsForTraitCollection:](self, "activeMinimumContentInsetsForTraitCollection:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMinimumContentInsets:", v5, v7, v9, v11);

}

- (UIEdgeInsets)activeMinimumContentInsetsForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  v4 = a3;
  if (-[PPKMarkupViewController annotationEditingEnabled](self, "annotationEditingEnabled"))
  {
    -[PPKMarkupViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeAreaInsets");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    if (-[PPKMarkupViewController needsToolPickerContentInsetActiveForTraitCollection:](self, "needsToolPickerContentInsetActiveForTraitCollection:", v4))
    {
      v11 = v11 + 75.0;
    }
  }
  else
  {
    v7 = *MEMORY[0x1E0DC49E8];
    v9 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v11 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (void)updateContentInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  id v20;

  -[PPKMarkupViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPKMarkupViewController activeMinimumContentInsetsForTraitCollection:](self, "activeMinimumContentInsetsForTraitCollection:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMinimumContentInsets:", v5, v7, v9, v11);

  v14 = *MEMORY[0x1E0DC49E8];
  v13 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v16 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v15 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "annotationEditingEnabled") & 1) != 0)
  {
    -[PPKMarkupViewController traitCollection](self, "traitCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[PPKMarkupViewController needsToolPickerContentInsetActiveForTraitCollection:](self, "needsToolPickerContentInsetActiveForTraitCollection:", v18);

    if (v19)
    {
      v15 = 0.0;
      v16 = 75.0;
      v13 = 0.0;
      v14 = 0.0;
    }
  }
  else
  {

  }
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAdditionalSafeAreaInsets:", v14, v13, v16, v15);

}

- (void)viewIsAppearing:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PPKMarkupViewController;
  -[PPKMarkupViewController viewIsAppearing:](&v4, sel_viewIsAppearing_, a3);
  -[PPKMarkupViewController updateContentInsets](self, "updateContentInsets");
}

- (void)setAnnotationEditingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAnnotationEditingEnabled:", v3);

  -[PPKMarkupViewController updateContentInsets](self, "updateContentInsets");
}

- (void)setFormFillingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFormFillingEnabled:", v3);

}

- (void)setFormFillingEnabled:(BOOL)a3 didUseBanner:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFormFillingEnabled:didUseBanner:", v5, v4);

}

- (BOOL)formFillingEnabled
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "formFillingEnabled");

  return v3;
}

- (BOOL)toolbarHidden
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "toolbarHidden");

  return v3;
}

- (void)setToolbarHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToolbarHidden:", v3);

}

- (void)setToolbarHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC", a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarHidden:", v4);

}

- (BOOL)pencilAlwaysDraws
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pencilAlwaysDraws");

  return v3;
}

- (void)setPencilAlwaysDraws:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPencilAlwaysDraws:", v3);

}

+ (id)supportedOutputTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)*MEMORY[0x1E0CEC570], "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v4;
  objc_msgSend((id)*MEMORY[0x1E0CEC600], "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGSize)adjustedSourceImageSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)undoManager
{
  void *v2;
  void *v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAllEditingDisabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllEditingDisabled:", v3);

}

- (BOOL)shouldAllowEditingContents:(id)a3
{
  return 1;
}

- (UTType)outputContentType
{
  void *v2;
  void *v3;
  id v4;
  void *v6;

  -[PPKMarkupViewController sourceContentType](self, "sourceContentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x1E0CEC570];
  if (objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC570])
    || (v3 = (void *)*MEMORY[0x1E0CEC580], objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC580]))
    || (v3 = (void *)*MEMORY[0x1E0CEC600], objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC600]))
    || (v3 = (void *)*MEMORY[0x1E0CEC530], objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC530]))
    || objc_msgSend(v2, "conformsToType:", *MEMORY[0x1E0CEC520]))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v2, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSLog(CFSTR("%s: NULL outputContentType for sourceContentType: %@"), "-[PPKMarkupViewController outputContentType]", v6);

    v4 = 0;
  }

  return (UTType *)v4;
}

+ (id)_contentTypeForImageSource:(CGImageSource *)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    CGImageSourceGetType(a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)_contentTypeForURL:(id)a3
{
  CGImageSourceRef v3;
  CGImageSourceRef v4;
  void *v5;

  v3 = CGImageSourceCreateWithURL((CFURLRef)a3, 0);
  if (v3)
  {
    v4 = v3;
    +[PPKMarkupViewController _contentTypeForImageSource:](PPKMarkupViewController, "_contentTypeForImageSource:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)_contentTypeForData:(id)a3
{
  CGImageSourceRef v3;
  CGImageSourceRef v4;
  void *v5;

  v3 = CGImageSourceCreateWithData((CFDataRef)a3, 0);
  if (v3)
  {
    v4 = v3;
    +[PPKMarkupViewController _contentTypeForImageSource:](PPKMarkupViewController, "_contentTypeForImageSource:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (BOOL)_isInLowMemoryEnvironment
{
  if (_isInLowMemoryEnvironment_onceToken != -1)
    dispatch_once(&_isInLowMemoryEnvironment_onceToken, &__block_literal_global);
  return _isInLowMemoryEnvironment_sIsLowMemoryEnvironment;
}

void __52__PPKMarkupViewController__isInLowMemoryEnvironment__block_invoke()
{
  void *v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arguments");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "firstObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
    _isInLowMemoryEnvironment_sIsLowMemoryEnvironment = objc_msgSend(v1, "containsString:", CFSTR(".appex/"));

}

- (void)setHostProcessBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_hostProcessBundleIdentifier, a3);
}

- (NSString)hostProcessBundleIdentifier
{
  NSString *hostProcessBundleIdentifier;
  void *v4;
  NSString *v5;
  NSString *v6;

  hostProcessBundleIdentifier = self->_hostProcessBundleIdentifier;
  if (!hostProcessBundleIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_hostProcessBundleIdentifier;
    self->_hostProcessBundleIdentifier = v5;

    hostProcessBundleIdentifier = self->_hostProcessBundleIdentifier;
  }
  return hostProcessBundleIdentifier;
}

- (id)_markupBlackColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0901960784, 0.0901960784, 0.0901960784, 1.0);
}

+ (id)cleanImageMetadataFromData:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend(getMUImageReaderClass(), "cleanImageMetadataFromData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)hasPrivateImageMetadata:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  v4 = objc_msgSend(getMUImageReaderClass(), "hasPrivateImageMetadata:", v3);

  return v4;
}

- (BOOL)isTouchInThumbnailView:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isTouchInThumbnailView:", v4);

  return v6;
}

- (void)setShowThumbnailViewForMultipage:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowThumbnailViewForMultipage:", v3);

}

- (BOOL)showThumbnailViewForMultipage
{
  void *v2;
  char v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showThumbnailViewForMultipage");

  return v3;
}

- (void)setImageDescription:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImageDescription:", v4);

}

- (NSString)imageDescription
{
  void *v2;
  void *v3;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)validateRedo:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "validateRedo:", v4);

  return v6;
}

- (BOOL)validateUndo:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "validateUndo:", v4);

  return v6;
}

- (void)undo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "undo:", v4);

}

- (void)redo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "redo:", v4);

}

- (void)revert
{
  id v2;

  -[PPKMarkupViewController markupContainerVC](self, "markupContainerVC");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "revert:", 0);

}

- (BOOL)markupContainerViewController:(id)a3 shouldOpenLink:(id)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a4;
  -[PPKMarkupViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v7 = objc_msgSend(v6, "controller:shouldOpenLinkAtURL:", self, v5);
  else
    v7 = 1;

  return v7;
}

- (void)markupContainerViewController:(id)a3 wantsToEnterFullscreen:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;

  v4 = a4;
  -[PPKMarkupViewController delegate](self, "delegate", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    v9 = (void *)v6;
    v8 = objc_opt_respondsToSelector();
    v7 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "markupViewController:didChangeShowingSignaturesUI:", self, v4);
      v7 = v9;
    }
  }

}

- (PDFDocument)pdfDocument
{
  return 0;
}

- (PDFView)pdfView
{
  return 0;
}

- (UIView)pageLabelView
{
  return 0;
}

- (NSString)outputType
{
  void *v2;
  void *v3;

  -[PPKMarkupViewController outputContentType](self, "outputContentType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setData:(id)a3
{
  -[PPKMarkupViewController setData:withArchivedModelData:](self, "setData:withArchivedModelData:", a3, 0);
}

- (void)setFileURL:(id)a3
{
  -[PPKMarkupViewController setFileURL:withArchivedModelData:](self, "setFileURL:withArchivedModelData:", a3, 0);
}

- (void)setImage:(id)a3
{
  -[PPKMarkupViewController setImage:withArchivedModelData:](self, "setImage:withArchivedModelData:", a3, 0);
}

- (NSUndoManager)akUndoManager
{
  return self->_akUndoManager;
}

- (void)setAkUndoManager:(id)a3
{
  objc_storeStrong((id *)&self->_akUndoManager, a3);
}

- (BOOL)allEditingDisabled
{
  return self->_allEditingDisabled;
}

- (BOOL)allowsThumbnailViewPageReordering
{
  return self->_allowsThumbnailViewPageReordering;
}

- (void)setAllowsThumbnailViewPageReordering:(BOOL)a3
{
  self->_allowsThumbnailViewPageReordering = a3;
}

- (AKController)annotationController
{
  return self->_annotationController;
}

- (BOOL)centersIgnoringContentInsets
{
  return self->_centersIgnoringContentInsets;
}

- (void)setCentersIgnoringContentInsets:(BOOL)a3
{
  self->_centersIgnoringContentInsets = a3;
}

- (MUContentViewControllerProtocol)contentViewController
{
  return (MUContentViewControllerProtocol *)objc_getProperty(self, a2, 1000, 1);
}

- (unint64_t)currentPDFPageIndex
{
  return self->_currentPDFPageIndex;
}

- (void)setCurrentPDFPageIndex:(unint64_t)a3
{
  self->_currentPDFPageIndex = a3;
}

- (MarkupViewControllerDelegate)delegate
{
  return (MarkupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)fixedThumbnailView
{
  return self->_fixedThumbnailView;
}

- (void)setFixedThumbnailView:(BOOL)a3
{
  self->_fixedThumbnailView = a3;
}

- (BOOL)forcesPDFViewTopAlignment
{
  return self->_forcesPDFViewTopAlignment;
}

- (void)setForcesPDFViewTopAlignment:(BOOL)a3
{
  self->_forcesPDFViewTopAlignment = a3;
}

- (UIView)imageViewCombinedContentView
{
  return self->_imageViewCombinedContentView;
}

- (unint64_t)inkStyle
{
  return self->_inkStyle;
}

- (void)setInkStyle:(unint64_t)a3
{
  self->_inkStyle = a3;
}

- (UINavigationBar)navBar
{
  return self->_navBar;
}

- (void)setNavBar:(id)a3
{
  objc_storeStrong((id *)&self->_navBar, a3);
}

- (BOOL)isNavigationModeHorizontal
{
  return self->_navigationModeHorizontal;
}

- (void)setNavigationModeHorizontal:(BOOL)a3
{
  self->_navigationModeHorizontal = a3;
}

- (BOOL)isShapeDetectionEnabled
{
  return self->_shapeDetectionEnabled;
}

- (void)setShapeDetectionEnabled:(BOOL)a3
{
  self->_shapeDetectionEnabled = a3;
}

- (BOOL)showShareButtonInToolbar
{
  return self->_showShareButtonInToolbar;
}

- (void)setShowShareButtonInToolbar:(BOOL)a3
{
  self->_showShareButtonInToolbar = a3;
}

- (BOOL)isThumbnailViewHidden
{
  return self->_thumbnailViewHidden;
}

- (void)setThumbnailViewHidden:(BOOL)a3
{
  self->_thumbnailViewHidden = a3;
}

- (UIView)toolbar
{
  return self->_toolbar;
}

- (int64_t)toolbarPosition
{
  return self->_toolbarPosition;
}

- (void)setToolbarPosition:(int64_t)a3
{
  self->_toolbarPosition = a3;
}

- (int64_t)thumbnailViewStyle
{
  return self->_thumbnailViewStyle;
}

- (void)setThumbnailViewStyle:(int64_t)a3
{
  self->_thumbnailViewStyle = a3;
}

- (BOOL)isToolbarHidden
{
  return self->_toolbarHidden;
}

- (NSArray)fullViewLayoutConstraints
{
  return self->_fullViewLayoutConstraints;
}

- (void)setFullViewLayoutConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_fullViewLayoutConstraints, a3);
}

- (PPKMarkupContainerViewController)markupContainerVC
{
  return self->_markupContainerVC;
}

- (void)setMarkupContainerVC:(id)a3
{
  objc_storeStrong((id *)&self->_markupContainerVC, a3);
}

- (UTType)sourceContentType
{
  return self->_sourceContentType;
}

- (void)setSourceContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceContentType, 0);
  objc_storeStrong((id *)&self->_markupContainerVC, 0);
  objc_storeStrong((id *)&self->_fullViewLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
  objc_storeStrong((id *)&self->_navBar, 0);
  objc_storeStrong((id *)&self->_imageViewCombinedContentView, 0);
  objc_storeStrong((id *)&self->_hostProcessBundleIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_annotationController, 0);
  objc_storeStrong((id *)&self->_akUndoManager, 0);
}

@end
