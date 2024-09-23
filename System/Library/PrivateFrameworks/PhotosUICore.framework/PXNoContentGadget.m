@implementation PXNoContentGadget

- (void)configureWithButtonTitle:(id)a3 buttonAction:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v7 = a4;
  if ((v10 != 0) != (v7 != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNoContentGadget+iOS.m"), 21, CFSTR("Button title and action must both be nil or non-nil"));

  }
  -[PXNoContentGadget noContentView](self, "noContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setButtonTitle:", v10);
  objc_msgSend(v8, "setButtonAction:", v7);

}

- (double)preferredHeightForViewController:(id)a3
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v21;
  objc_class *v22;
  void *v23;
  objc_class *v24;
  void *v25;

  v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_class *)objc_opt_class();
    NSStringFromClass(v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNoContentGadget+iOS.m"), 29, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("viewController"), v23, v25);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNoContentGadget+iOS.m"), 29, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("viewController"), v23);
  }

LABEL_3:
  objc_msgSend(v5, "collectionView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "adjustedContentInset");
  PXEdgeInsetsInsetRect();
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = fmin(v10, v12);

  v14 = -0.0;
  if (v8 < 0.0)
    v14 = v8;
  v15 = v14 + v13;
  -[PXNoContentGadget contentHeightAdjustment](self, "contentHeightAdjustment");
  v17 = v15 - v16;
  -[PXNoContentGadget minimumContentHeight](self, "minimumContentHeight");
  v19 = fmax(v17, v18);

  return v19;
}

- (PXNoContentGadget)init
{
  return -[PXNoContentGadget initWithLocalizedTitle:localizedMessage:](self, "initWithLocalizedTitle:localizedMessage:", &stru_1E5149688, &stru_1E5149688);
}

- (PXNoContentGadget)initWithLocalizedTitle:(id)a3 localizedMessage:(id)a4
{
  return -[PXNoContentGadget initWithLocalizedTitle:localizedMessage:minimumContentHeight:](self, "initWithLocalizedTitle:localizedMessage:minimumContentHeight:", a3, a4, 0.0);
}

- (PXNoContentGadget)initWithLocalizedTitle:(id)a3 localizedMessage:(id)a4 minimumContentHeight:(double)a5
{
  id v8;
  id v9;
  PXNoContentGadget *v10;
  uint64_t v11;
  NSString *title;
  uint64_t v13;
  NSString *message;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXNoContentGadget;
  v10 = -[PXNoContentGadget init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    title = v10->_title;
    v10->_title = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    message = v10->_message;
    v10->_message = (NSString *)v13;

    v10->_minimumContentHeight = a5;
  }

  return v10;
}

- (void)setTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *title;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_title;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      title = self->_title;
      self->_title = v6;

      -[_UIContentUnavailableView setTitle:](self->_noContentView, "setTitle:", v8);
    }
  }

}

- (void)setMessage:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *message;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_message;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      message = self->_message;
      self->_message = v6;

      -[_UIContentUnavailableView setMessage:](self->_noContentView, "setMessage:", v8);
    }
  }

}

- (void)setContentHeightAdjustment:(double)a3
{
  void *v4;
  char v5;
  id v6;

  if (self->_contentHeightAdjustment != a3)
  {
    self->_contentHeightAdjustment = a3;
    -[PXNoContentGadget delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[PXNoContentGadget delegate](self, "delegate");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "gadget:didChange:", self, 64);

    }
  }
}

- (unint64_t)gadgetType
{
  return 0;
}

- (unint64_t)gadgetCapabilities
{
  return 0;
}

- (unint64_t)accessoryButtonType
{
  return 0;
}

- (BOOL)hasLoadedContentData
{
  return 1;
}

- (Class)collectionViewItemClass
{
  return (Class)objc_opt_class();
}

- (void)prepareCollectionViewItem:(id)a3
{
  PXNoContentGadgetView *v5;
  PXNoContentGadgetView *noContentView;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;

  objc_msgSend(a3, "contentView");
  v5 = (PXNoContentGadgetView *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNoContentGadget.m"), 102, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collectionViewItem.contentView"), v10);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXNoContentGadgetView px_descriptionForAssertionMessage](v5, "px_descriptionForAssertionMessage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXNoContentGadget.m"), 102, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collectionViewItem.contentView"), v10, v12);

    goto LABEL_6;
  }
LABEL_3:
  noContentView = self->_noContentView;
  self->_noContentView = v5;

  -[PXNoContentGadget title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIContentUnavailableView setTitle:](self->_noContentView, "setTitle:", v7);

  -[PXNoContentGadget message](self, "message");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIContentUnavailableView setMessage:](self->_noContentView, "setMessage:", v13);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  width = a3.width;
  -[PXNoContentGadget delegate](self, "delegate", a3.width, a3.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gadgetViewControllerHostingGadget:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXNoContentGadget preferredHeightForViewController:](self, "preferredHeightForViewController:", v6);
  v8 = v7;
  -[PXNoContentGadget minimumContentHeight](self, "minimumContentHeight");
  v10 = fmax(v8, v9);

  v11 = width;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)setGadgetSpec:(id)a3
{
  objc_storeStrong((id *)&self->_gadgetSpec, a3);
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)message
{
  return self->_message;
}

- (double)contentHeightAdjustment
{
  return self->_contentHeightAdjustment;
}

- (PXNoContentGadgetView)noContentView
{
  return self->_noContentView;
}

- (void)setNoContentView:(id)a3
{
  objc_storeStrong((id *)&self->_noContentView, a3);
}

- (double)minimumContentHeight
{
  return self->_minimumContentHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_noContentView, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
}

@end
