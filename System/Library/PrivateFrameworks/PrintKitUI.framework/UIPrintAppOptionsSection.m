@implementation UIPrintAppOptionsSection

- (UIPrintAppOptionsSection)initWithPrintInfo:(id)a3 printPanelViewController:(id)a4 appOptionsViewController:(id)a5
{
  id v8;
  id v9;
  UIPrintAppOptionsSection *v10;
  UIPrintAppOptionsSection *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v9 = a5;
  v20.receiver = self;
  v20.super_class = (Class)UIPrintAppOptionsSection;
  v10 = -[UIPrintOptionSection initWithPrintInfo:printPanelViewController:](&v20, sel_initWithPrintInfo_printPanelViewController_, v8, a4);
  v11 = v10;
  if (v10)
  {
    -[UIPrintAppOptionsSection setAppOptionsViewController:](v10, "setAppOptionsViewController:", v9);
    -[UIPrintAppOptionsSection appOptionsViewController](v11, "appOptionsViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPrintInfo:", v8);

    objc_msgSend(v9, "title");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIPrintOptionSection setTitle:](v11, "setTitle:", v13);

    -[UIPrintOptionSection title](v11, "title");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForInfoDictionaryKey:", CFSTR("CFBundleDisplayName"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIPrintOptionSection setTitle:](v11, "setTitle:", v16);

    }
    -[UIPrintAppOptionsSection appOptionsViewController](v11, "appOptionsViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:forKeyPath:options:context:", v11, CFSTR("summary"), 0, 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v11, sel_thumbnailsNeedUpdate_, CFSTR("UIPrintThumbnailsNeedUpdateNotification"), v9);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIPrintAppOptionsSection appOptionsViewController](self, "appOptionsViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("summary"));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)UIPrintAppOptionsSection;
  -[UIPrintAppOptionsSection dealloc](&v5, sel_dealloc);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("summary"), a4, a5, a6))
    -[UIPrintOptionSection updateSectionSummary](self, "updateSectionSummary");
}

- (void)thumbnailsNeedUpdate:(id)a3
{
  id v3;

  -[UIPrintOptionSection printPanelViewController](self, "printPanelViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetPreviewPages");

}

- (id)summaryString
{
  void *v2;
  void *v3;

  -[UIPrintAppOptionsSection appOptionsViewController](self, "appOptionsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "summary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)didSelectPrintOptionSection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UIPrintOptionSection printPanelViewController](self, "printPanelViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UIPrintAppOptionsSection appOptionsViewController](self, "appOptionsViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addPrintShareButtonsToNavItem:", v4);

  objc_msgSend(v7, "printOptionsNavController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPrintAppOptionsSection appOptionsViewController](self, "appOptionsViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (UIPrintAppOptionsProtocol)appOptionsViewController
{
  return self->_appOptionsViewController;
}

- (void)setAppOptionsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_appOptionsViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appOptionsViewController, 0);
}

@end
