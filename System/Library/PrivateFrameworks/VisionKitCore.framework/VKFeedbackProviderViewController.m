@implementation VKFeedbackProviderViewController

- (VKFeedbackProviderViewController)initWithOptions:(unint64_t)a3 attachments:(id)a4
{
  id v7;
  VKFeedbackProviderViewController *v8;
  VKFeedbackProviderViewController *v9;
  uint64_t v10;
  NSMutableSet *selectedAttachments;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)VKFeedbackProviderViewController;
  v8 = -[VKFeedbackProviderViewController init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_attachments, a4);
    v9->_options = a3;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v7, "count"));
    selectedAttachments = v9->_selectedAttachments;
    v9->_selectedAttachments = (NSMutableSet *)v10;

  }
  return v9;
}

- (void)loadView
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CEABB0]);
  -[VKFeedbackProviderViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKFeedbackProviderViewController;
  -[VKFeedbackProviderViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[VKFeedbackProviderViewController _createContentView](self, "_createContentView");
}

- (void)dealloc
{
  UIWindow *window;
  objc_super v4;

  -[UIWindow resignKeyWindow](self->_window, "resignKeyWindow");
  window = self->_window;
  self->_window = 0;

  v4.receiver = self;
  v4.super_class = (Class)VKFeedbackProviderViewController;
  -[VKFeedbackProviderViewController dealloc](&v4, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_createContentView
{
  id v3;
  unint64_t options;
  void *v5;
  void *v6;
  unint64_t v7;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CEA9E0]);
  objc_msgSend(v3, "setAxis:", 1);
  objc_msgSend(v3, "setDistribution:", 0);
  objc_msgSend(v3, "setAlignment:", 1);
  objc_msgSend(v3, "setSpacing:", 10.0);
  options = self->_options;
  if ((options & 4) != 0)
  {
    -[VKFeedbackProviderViewController _contentRowButtonWithTitle:tag:allowToggle:](self, "_contentRowButtonWithTitle:tag:allowToggle:", CFSTR("Sysdiagnose"), -1, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addArrangedSubview:", v5);

    options = self->_options;
  }
  if ((options & 1) != 0)
  {
    -[VKFeedbackProviderViewController _contentRowButtonWithTitle:tag:allowToggle:](self, "_contentRowButtonWithTitle:tag:allowToggle:", CFSTR("Screenshot"), -2, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addArrangedSubview:", v6);

  }
  if (-[NSArray count](self->_attachments, "count"))
  {
    v7 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_attachments, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet addObject:](self->_selectedAttachments, "addObject:", v8);
      objc_msgSend(v8, "label");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKFeedbackProviderViewController _contentRowButtonWithTitle:tag:allowToggle:](self, "_contentRowButtonWithTitle:tag:allowToggle:", v9, v7, objc_msgSend(v8, "isOptional"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addArrangedSubview:", v10);

      ++v7;
    }
    while (v7 < -[NSArray count](self->_attachments, "count"));
  }
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VKFeedbackProviderViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v3);

  v22 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v3, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKFeedbackProviderViewController view](self, "view");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v27, 2.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  -[VKFeedbackProviderViewController view](self, "view");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "trailingAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "constraintEqualToSystemSpacingAfterAnchor:multiplier:", v23, 2.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v21;
  objc_msgSend(v3, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKFeedbackProviderViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v15;
  -[VKFeedbackProviderViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bottomAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v18, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "activateConstraints:", v20);

}

- (id)_contentRowButtonWithTitle:(id)a3 tag:(int64_t)a4 allowToggle:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0CEA3A8];
  v9 = a3;
  objc_msgSend(v8, "plainButtonConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImagePadding:", 8.0);
  objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConfiguration:", v10);
  objc_msgSend(v11, "setTitle:forState:", v9, 0);

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("circle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:forState:", v12, 0);

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:", CFSTR("checkmark.circle.fill"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:forState:", v13, 4);

  objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTitleColor:forState:", v14, 0);

  objc_msgSend(v11, "setSelected:", 1);
  if (v5)
  {
    objc_msgSend(v11, "addTarget:action:forControlEvents:", self, sel__toggleContentRowButton_, 64);
  }
  else
  {
    objc_msgSend(v11, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTintColor:", v15);

  }
  objc_msgSend(v11, "setTag:", a4);

  return v11;
}

- (void)_toggleContentRowButton:(id)a3
{
  int v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t options;
  void *v10;
  NSMutableSet *selectedAttachments;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "isSelected");
  v5 = v4;
  objc_msgSend(v12, "setSelected:", v4 ^ 1u);
  v6 = objc_msgSend(v12, "tag");
  if (v6 == -2)
  {
    options = self->_options;
    if ((v5 & 1) != 0)
      v8 = options & 0xFFFFFFFFFFFFFFFELL;
    else
      v8 = options | 1;
    goto LABEL_11;
  }
  if (v6 == -1)
  {
    v7 = self->_options;
    if ((v5 & 1) != 0)
      v8 = v7 & 0xFFFFFFFFFFFFFFFBLL;
    else
      v8 = v7 | 4;
LABEL_11:
    self->_options = v8;
    goto LABEL_14;
  }
  -[NSArray objectAtIndexedSubscript:](self->_attachments, "objectAtIndexedSubscript:", objc_msgSend(v12, "tag"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  selectedAttachments = self->_selectedAttachments;
  if ((v5 & 1) != 0)
    -[NSMutableSet removeObject:](selectedAttachments, "removeObject:", v10);
  else
    -[NSMutableSet addObject:](selectedAttachments, "addObject:", v10);

LABEL_14:
}

- (void)present
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2E0D000, log, OS_LOG_TYPE_ERROR, "Unable to find suitable active window scene or root view controller to present feedback provider alert controller.", v1, 2u);
}

uint64_t __43__VKFeedbackProviderViewController_present__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "feedbackProviderViewControllerDidCancel:", *(_QWORD *)(a1 + 40));
}

void __43__VKFeedbackProviderViewController_present__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 976);
  objc_msgSend(*(id *)(v2 + 984), "allObjects");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "feedbackProviderViewController:submitWithOptions:attachments:", v2, v3, v4);

}

uint64_t __43__VKFeedbackProviderViewController_present__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (VKFeedbackProviderViewControllerDelegate)delegate
{
  return (VKFeedbackProviderViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_selectedAttachments, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
}

@end
