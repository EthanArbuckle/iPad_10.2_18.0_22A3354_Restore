@implementation PXSampleGadget

- (PXSampleGadget)init
{
  return -[PXSampleGadget initWithMininumHeight:](self, "initWithMininumHeight:", 100.0);
}

- (PXSampleGadget)initWithMininumHeight:(double)a3
{
  PXSampleGadget *v4;
  double v5;
  double v6;
  uint64_t v7;
  UIColor *backgroundColor;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXSampleGadget;
  v4 = -[PXSampleGadget init](&v10, sel_init);
  if (v4)
  {
    v4->_preferredHeight = (unint64_t)((double)arc4random_uniform(0x96u) + a3);
    v4->_preferredExpandedHeight = (unint64_t)((double)arc4random_uniform(0x96u)
                                                    + a3
                                                    + (double)v4->_preferredHeight);
    v5 = (double)arc4random_uniform(0x100u) * 0.00390625;
    v6 = (double)arc4random_uniform(0x80u) * 0.00390625 + 0.5;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v5, v6, (double)arc4random_uniform(0x80u) * 0.00390625 + 0.5, 1.0);
    v7 = objc_claimAutoreleasedReturnValue();
    backgroundColor = v4->_backgroundColor;
    v4->_backgroundColor = (UIColor *)v7;

  }
  return v4;
}

- (CGRect)view:(id)a3 colorFrameForBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[PXSampleGadget gadgetSpec](self, "gadgetSpec", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "shouldInsetAllContent") && objc_msgSend(v8, "scrollAxis") == 1)
  {
    objc_msgSend(v8, "contentInsets");
    PXEdgeInsetsInsetRect();
    x = v9;
    y = v10;
    width = v11;
    height = v12;
  }

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (unint64_t)gadgetType
{
  return 7;
}

- (unint64_t)gadgetCapabilities
{
  return 2;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  unint64_t v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  if (-[PXSampleGadget expanded](self, "expanded", a3.width, a3.height))
    v5 = -[PXSampleGadget preferredExpandedHeight](self, "preferredExpandedHeight");
  else
    v5 = -[PXSampleGadget preferredHeight](self, "preferredHeight");
  v6 = (double)v5;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (Class)collectionViewItemClass
{
  return (Class)objc_opt_class();
}

- (void)prepareCollectionViewItem:(id)a3
{
  void *v5;
  objc_class *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSampleGadget.m"), 88, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("collectionViewItem"), v7);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSampleGadget.m"), 88, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("collectionViewItem"), v7, v9);

    goto LABEL_6;
  }
LABEL_3:
  -[PXSampleGadget _prepareView:](self, "_prepareView:", v10);

}

- (void)_prepareView:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setColor:", self->_backgroundColor);

}

- (void)userDidSelectAccessoryButton:(id)a3
{
  void *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];

  if (-[PXSampleGadget accessoryButtonType](self, "accessoryButtonType", a3) == 4)
  {
    -[PXSampleGadget delegate](self, "delegate");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "gadget:didChange:", self, 32);

    return;
  }
  if (-[PXSampleGadget accessoryButtonType](self, "accessoryButtonType") == 1)
  {
    -[PXSampleGadget setExpanded:](self, "setExpanded:", -[PXSampleGadget expanded](self, "expanded") ^ 1);
    -[PXSampleGadget delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __47__PXSampleGadget_userDidSelectAccessoryButton___block_invoke;
    v12[3] = &unk_1E5149198;
    v12[4] = self;
    v6 = v12;
  }
  else
  {
    if (-[PXSampleGadget accessoryButtonType](self, "accessoryButtonType") != 3)
      return;
    v7 = (void *)MEMORY[0x1E0CB3940];
    -[PXSampleGadget gadgetTitle](self, "gadgetTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@s"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSampleGadget setGadgetTitle:](self, "setGadgetTitle:", v9);

    -[PXSampleGadget delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __47__PXSampleGadget_userDidSelectAccessoryButton___block_invoke_2;
    v11[3] = &unk_1E5149198;
    v11[4] = self;
    v6 = v11;
  }
  objc_msgSend(v4, "gadget:animateChanges:", self, v6);

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

- (unint64_t)accessoryButtonType
{
  return self->_accessoryButtonType;
}

- (void)setAccessoryButtonType:(unint64_t)a3
{
  self->_accessoryButtonType = a3;
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (void)setGadgetSpec:(id)a3
{
  objc_storeStrong((id *)&self->_gadgetSpec, a3);
}

- (NSString)gadgetTitle
{
  return self->_gadgetTitle;
}

- (void)setGadgetTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)preferredHeight
{
  return self->_preferredHeight;
}

- (void)setPreferredHeight:(unint64_t)a3
{
  self->_preferredHeight = a3;
}

- (unint64_t)preferredExpandedHeight
{
  return self->_preferredExpandedHeight;
}

- (void)setPreferredExpandedHeight:(unint64_t)a3
{
  self->_preferredExpandedHeight = a3;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_gadgetTitle, 0);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __47__PXSampleGadget_userDidSelectAccessoryButton___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gadget:didChange:", *(_QWORD *)(a1 + 32), 64);

}

void __47__PXSampleGadget_userDidSelectAccessoryButton___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gadget:didChange:", *(_QWORD *)(a1 + 32), 1);

}

@end
