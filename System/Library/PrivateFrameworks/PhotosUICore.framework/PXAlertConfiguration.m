@implementation PXAlertConfiguration

- (void)notImplementedWithTrackingRadar:(int64_t)a3
{
  id v4;

  +[PXPlaceholder featureNotImplementedWithTrackingRadar:](PXPlaceholder, "featureNotImplementedWithTrackingRadar:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAlertConfiguration configureForPlaceholder:](self, "configureForPlaceholder:", v4);

}

- (void)featureNotEnabledWithDocumentationURLString:(id)a3
{
  id v4;

  +[PXPlaceholder featureNotEnabledWithDocumentationURLString:](PXPlaceholder, "featureNotEnabledWithDocumentationURLString:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAlertConfiguration configureForPlaceholder:](self, "configureForPlaceholder:", v4);

}

- (void)configureForPlaceholder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlertConfiguration setTitle:](self, "setTitle:", v5);

  objc_msgSend(v4, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlertConfiguration setMessage:](self, "setMessage:", v6);

  objc_msgSend(v4, "fallbackActionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63__PXAlertConfiguration_PXPlaceholder__configureForPlaceholder___block_invoke;
    v8[3] = &unk_1E5149198;
    v9 = v4;
    -[PXAlertConfiguration addActionWithTitle:style:action:](self, "addActionWithTitle:style:action:", v7, 0, v8);

  }
  -[PXAlertConfiguration addActionWithTitle:style:action:](self, "addActionWithTitle:style:action:", CFSTR("OK"), 1, 0);

}

uint64_t __63__PXAlertConfiguration_PXPlaceholder__configureForPlaceholder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performFallbackAction");
}

- (PXAlertConfiguration)init
{
  PXAlertConfiguration *v2;
  NSMutableArray *v3;
  NSMutableArray *actions;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXAlertConfiguration;
  v2 = -[PXAlertConfiguration init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    actions = v2->_actions;
    v2->_actions = v3;

    v2->_style = 1;
  }
  return v2;
}

- (void)addActionWithTitle:(id)a3 style:(int64_t)a4 action:(id)a5
{
  NSMutableArray *actions;
  id v8;
  id v9;
  PXAlertAction *v10;

  actions = self->_actions;
  v8 = a5;
  v9 = a3;
  v10 = -[PXAlertAction initWithTitle:style:action:]([PXAlertAction alloc], "initWithTitle:style:action:", v9, a4, v8);

  -[NSMutableArray addObject:](actions, "addObject:", v10);
}

- (void)addActions:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_actions, "addObjectsFromArray:", a3);
}

- (void)configureForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v4 = a3;
  objc_msgSend(v4, "localizedFailureReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXAlertConfiguration setTitle:](self, "setTitle:", v5);
  }
  else
  {
    objc_msgSend(v4, "localizedDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAlertConfiguration setTitle:](self, "setTitle:", v6);

  }
  objc_msgSend(v4, "localizedRecoverySuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlertConfiguration setMessage:](self, "setMessage:", v7);

  objc_msgSend(v4, "localizedRecoveryOptions");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recoveryAttempter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__PXAlertConfiguration_configureForError___block_invoke;
  v13[3] = &unk_1E5130E28;
  v13[4] = self;
  v14 = v8;
  v15 = v4;
  v9 = v4;
  v10 = v8;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v13);
  PXLocalizedStringFromTable(CFSTR("PXOK"), CFSTR("PhotosUICore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlertConfiguration addActionWithTitle:style:action:](self, "addActionWithTitle:style:action:", v11, 1, 0);

}

- (PXAlertConfiguration)initWithError:(id)a3
{
  id v4;
  PXAlertConfiguration *v5;

  v4 = a3;
  v5 = -[PXAlertConfiguration init](self, "init");
  -[PXAlertConfiguration configureForError:](v5, "configureForError:", v4);

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[PXAlertConfiguration title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v5);

  -[PXAlertConfiguration message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMessage:", v6);

  objc_msgSend(v4, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAlertConfiguration actions](self, "actions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setArray:", v8);

  objc_msgSend(v4, "setStyle:", -[PXAlertConfiguration style](self, "style"));
  -[PXAlertConfiguration sourceItem](self, "sourceItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceItem:", v9);

  -[PXAlertConfiguration contentViewController](self, "contentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentViewController:", v10);

  -[PXAlertConfiguration headerContentViewController](self, "headerContentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHeaderContentViewController:", v11);

  -[PXAlertConfiguration completionHandler](self, "completionHandler");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompletionHandler:", v12);

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (UIPopoverPresentationControllerSourceItem)sourceItem
{
  return (UIPopoverPresentationControllerSourceItem *)objc_loadWeakRetained((id *)&self->_sourceItem);
}

- (void)setSourceItem:(id)a3
{
  objc_storeWeak((id *)&self->_sourceItem, a3);
}

- (UIViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_contentViewController, a3);
}

- (UIViewController)headerContentViewController
{
  return self->_headerContentViewController;
}

- (void)setHeaderContentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_headerContentViewController, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_headerContentViewController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak((id *)&self->_sourceItem);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __42__PXAlertConfiguration_configureForError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__PXAlertConfiguration_configureForError___block_invoke_2;
  v7[3] = &unk_1E5145560;
  v6 = *(void **)(a1 + 32);
  v8 = *(id *)(a1 + 40);
  v9 = *(id *)(a1 + 48);
  v10 = a3;
  objc_msgSend(v6, "addActionWithTitle:style:action:", a2, 0, v7);

}

uint64_t __42__PXAlertConfiguration_configureForError___block_invoke_2(_QWORD *a1)
{
  char v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  v2 = objc_opt_respondsToSelector();
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  if ((v2 & 1) != 0)
    return objc_msgSend(v3, "attemptRecoveryFromError:optionIndex:delegate:didRecoverSelector:contextInfo:", v4, v5, 0, 0, 0);
  else
    return objc_msgSend(v3, "attemptRecoveryFromError:optionIndex:", v4, v5);
}

@end
