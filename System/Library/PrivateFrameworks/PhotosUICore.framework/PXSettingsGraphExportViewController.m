@implementation PXSettingsGraphExportViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXSettingsGraphExportViewController;
  -[PXSettingsGraphExportViewController viewDidLoad](&v5, sel_viewDidLoad);
  self->_exportGraphOnViewDidAppear = 1;
  -[PXSettingsGraphExportViewController setTitle:](self, "setTitle:", CFSTR("Export Graph"));
  -[PXSettingsGraphExportViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXSettingsGraphExportViewController;
  -[PXSettingsGraphExportViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (self->_exportGraphOnViewDidAppear)
  {
    self->_exportGraphOnViewDidAppear = 0;
    -[PXSettingsGraphExportViewController _exportGraph](self, "_exportGraph");
  }
}

- (void)mailComposeController:(id)a3 didFinishWithResult:(int64_t)a4 error:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __87__PXSettingsGraphExportViewController_mailComposeController_didFinishWithResult_error___block_invoke;
  v5[3] = &unk_1E5149198;
  v5[4] = self;
  -[PXSettingsGraphExportViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v5, a5);
}

- (void)_exportGraph
{
  char v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = objc_msgSend(getMFMailComposeViewControllerClass(), "canSendMail");
  v4 = MEMORY[0x1E0C809B0];
  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Privacy Warning"), CFSTR("By sending this email, you agree on sharing your photos metadata, and all its associated calendar, contact and social events"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __51__PXSettingsGraphExportViewController__exportGraph__block_invoke;
    v9[3] = &unk_1E5144530;
    v9[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Agree"), 0, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Email"), CFSTR("Can't send email, do you have an account setup?"), 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __51__PXSettingsGraphExportViewController__exportGraph__block_invoke_3;
  v8[3] = &unk_1E5144530;
  v8[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v7);
  -[PXSettingsGraphExportViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);

}

void __51__PXSettingsGraphExportViewController__exportGraph__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v2, "exportGraphForPurpose:error:", CFSTR("default"), &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;

  if (v3)
    v5 = v4 == 0;
  else
    v5 = 0;
  if (v5)
  {
    v9 = objc_alloc_init((Class)getMFMailComposeViewControllerClass());
    objc_msgSend(v9, "setMailComposeDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PhotosGraph] Graph Export"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSubject:", v11);

    objc_msgSend(v9, "setToRecipients:", &unk_1E53E87C0);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v3, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addAttachmentData:mimeType:fileName:", v12, CFSTR("application/octet-stream"), v13);

      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot attach graph at path %@"), v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("ERROR: %@"), v14);
    }
    objc_msgSend(v9, "setMessageBody:isHTML:", v14, 0);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v9, 1, 0);

  }
  else
  {
    v6 = (void *)MEMORY[0x1E0DC3450];
    objc_msgSend(v4, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("Can't send email, the graph failed to export. Error: "), "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", CFSTR("Failed to export graph"), v8, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__PXSettingsGraphExportViewController__exportGraph__block_invoke_2;
    v15[3] = &unk_1E5144530;
    v15[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("Cancel"), 1, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addAction:", v10);
    objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v9, 1, 0);

  }
}

void __51__PXSettingsGraphExportViewController__exportGraph__block_invoke_3(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

void __51__PXSettingsGraphExportViewController__exportGraph__block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

void __87__PXSettingsGraphExportViewController_mailComposeController_didFinishWithResult_error___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

@end
