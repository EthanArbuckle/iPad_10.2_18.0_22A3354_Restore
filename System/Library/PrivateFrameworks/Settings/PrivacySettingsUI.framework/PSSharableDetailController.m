@implementation PSSharableDetailController

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PSSharableDetailController;
  -[PSDetailController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  v4 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v4, "configureWithOpaqueBackground");
  -[PSSharableDetailController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStandardAppearance:", v4);

  -[PSSharableDetailController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCompactAppearance:", v4);

  -[PSSharableDetailController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setScrollEdgeAppearance:", v4);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 9, self, sel_shareLog);
  -[PSSharableDetailController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRightBarButtonItem:", v8);

}

- (void)shareLog
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[7];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  -[PSSharableDetailController specifier](self, "specifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertyForKey:", *MEMORY[0x1E0D80438]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0D96D28]);
    v16[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithActivityItems:applicationActivities:", v7, 0);

    v9 = *MEMORY[0x1E0D96DC8];
    v15[0] = *MEMORY[0x1E0D96D90];
    v15[1] = v9;
    v10 = *MEMORY[0x1E0D96E08];
    v15[2] = *MEMORY[0x1E0D96D80];
    v15[3] = v10;
    v15[4] = *MEMORY[0x1E0D96E00];
    v15[5] = CFSTR("com.apple.mobilenotes.SharingExtension");
    v15[6] = CFSTR("com.apple.reminders.RemindersEditorExtension");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExcludedActivityTypes:", v11);

    -[PSSharableDetailController navigationItem](self, "navigationItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "rightBarButtonItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "popoverPresentationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBarButtonItem:", v13);

    -[PSSharableDetailController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
  }

}

@end
