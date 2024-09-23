@implementation PXPeopleBootstrapConfirmationPreviewViewController

- (PXPeopleBootstrapConfirmationPreviewViewController)initWithPerson:(id)a3 keyAsset:(id)a4 useLowMemoryMode:(BOOL)a5
{
  id v9;
  id v10;
  PXPeopleBootstrapConfirmationPreviewViewController *v11;
  PXPeopleBootstrapConfirmationPreviewViewController *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PXPeopleBootstrapConfirmationPreviewViewController;
  v11 = -[PXPeopleBootstrapConfirmationPreviewViewController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_person, a3);
    objc_storeStrong((id *)&v12->_keyAsset, a4);
    v12->_useLowMemoryMode = a5;
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelImageRequest:", -[PXPeopleBootstrapConfirmationPreviewViewController requestID](self, "requestID"));

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleBootstrapConfirmationPreviewViewController;
  -[PXPeopleBootstrapConfirmationPreviewViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  objc_msgSend(v3, "setContentMode:", 2);
  -[PXPeopleBootstrapConfirmationPreviewViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)PXPeopleBootstrapConfirmationPreviewViewController;
  -[PXPeopleBootstrapConfirmationPreviewViewController viewDidLoad](&v23, sel_viewDidLoad);
  -[PXPeopleBootstrapConfirmationPreviewViewController keyAsset](self, "keyAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPeopleBootstrapConfirmationPreviewViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayScale");
  v7 = v6;

  v8 = (double)(unint64_t)objc_msgSend(v4, "pixelWidth") / v7;
  v9 = (double)(unint64_t)objc_msgSend(v4, "pixelHeight") / v7;
  -[PXPeopleBootstrapConfirmationPreviewViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8, v9);
  -[PXPeopleBootstrapConfirmationPreviewViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationPreviewViewController.m"), 58, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.view"), v17);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPeopleBootstrapConfirmationPreviewViewController.m"), 58, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.view"), v17, v19);

    goto LABEL_6;
  }
LABEL_3:
  v11 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v11, "setSynchronous:", 0);
  objc_msgSend(v11, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v11, "setAllowSecondaryDegradedImage:", 1);
  objc_msgSend(v11, "setResizeMode:", 1);
  objc_msgSend(v11, "setDeliveryMode:", 0);
  objc_msgSend(v11, "setUseLowMemoryMode:", -[PXPeopleBootstrapConfirmationPreviewViewController useLowMemoryMode](self, "useLowMemoryMode"));
  objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __65__PXPeopleBootstrapConfirmationPreviewViewController_viewDidLoad__block_invoke;
  v20[3] = &unk_1E513F120;
  v21 = v10;
  v22 = v4;
  v13 = v4;
  v14 = v10;
  -[PXPeopleBootstrapConfirmationPreviewViewController setRequestID:](self, "setRequestID:", objc_msgSend(v12, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v13, 0, v11, v20, v8, v9));

}

- (PHPerson)person
{
  return self->_person;
}

- (PHAsset)keyAsset
{
  return self->_keyAsset;
}

- (BOOL)useLowMemoryMode
{
  return self->_useLowMemoryMode;
}

- (int)requestID
{
  return self->_requestID;
}

- (void)setRequestID:(int)a3
{
  self->_requestID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

void __65__PXPeopleBootstrapConfirmationPreviewViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __65__PXPeopleBootstrapConfirmationPreviewViewController_viewDidLoad__block_invoke_2;
  v14 = &unk_1E5148D08;
  v15 = *(id *)(a1 + 32);
  v6 = v5;
  v16 = v6;
  v7 = a3;
  dispatch_async(MEMORY[0x1E0C80D38], &v11);
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1BE8], v11, v12, v13, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    PLUIGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v18 = v10;
      v19 = 2112;
      v20 = v8;
      v21 = 2080;
      v22 = "-[PXPeopleBootstrapConfirmationPreviewViewController viewDidLoad]_block_invoke";
      _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "Error fetching image for asset UUID: %@ error: %@ function: %s", buf, 0x20u);

    }
  }

}

uint64_t __65__PXPeopleBootstrapConfirmationPreviewViewController_viewDidLoad__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setImage:", *(_QWORD *)(a1 + 40));
}

@end
