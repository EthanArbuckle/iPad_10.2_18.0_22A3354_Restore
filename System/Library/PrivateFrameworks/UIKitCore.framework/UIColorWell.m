@implementation UIColorWell

- (void)_commonInit
{
  _UIColorWellVisualStyle *v3;
  _UIColorWellVisualStyle *style;
  _UIColorWellVisualStyle *v5;
  UIDragInteraction *v6;
  UIDragInteraction *dragInteraction;
  UIDropInteraction *v8;
  UIDropInteraction *dropInteraction;

  self->_supportsAlpha = 1;
  +[UIColorWell styleForColorWell:](UIColorWell, "styleForColorWell:", self);
  v3 = (_UIColorWellVisualStyle *)objc_claimAutoreleasedReturnValue();
  style = self->_style;
  self->_style = v3;

  -[_UIColorWellVisualStyle setSupportsAlpha:](self->_style, "setSupportsAlpha:", self->_supportsAlpha);
  v5 = self->_style;
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](v5, "setFrame:");
  -[UIView addSubview:](self, "addSubview:", self->_style);
  if (-[_UIColorWellVisualStyle wantsSystemDragAndDrop](self->_style, "wantsSystemDragAndDrop"))
  {
    v6 = -[UIDragInteraction initWithDelegate:]([UIDragInteraction alloc], "initWithDelegate:", self);
    dragInteraction = self->_dragInteraction;
    self->_dragInteraction = v6;

    -[UIView addInteraction:](self, "addInteraction:", self->_dragInteraction);
    v8 = -[UIDropInteraction initWithDelegate:]([UIDropInteraction alloc], "initWithDelegate:", self);
    dropInteraction = self->_dropInteraction;
    self->_dropInteraction = v8;

    -[UIView addInteraction:](self, "addInteraction:", self->_dropInteraction);
  }
}

- (UIColorWell)initWithFrame:(CGRect)a3
{
  UIColorWell *v3;
  UIColorWell *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIColorWell;
  v3 = -[UIControl initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[UIColorWell _commonInit](v3, "_commonInit");
  return v4;
}

- (UIColorWell)initWithCoder:(id)a3
{
  id v4;
  UIColorWell *v5;
  UIColorWell *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIColorWell;
  v5 = -[UIControl initWithCoder:](&v10, sel_initWithCoder_, v4);
  v6 = v5;
  if (v5)
  {
    -[UIColorWell _commonInit](v5, "_commonInit");
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIColorWellColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColorWell setSelectedColor:](v6, "setSelectedColor:", v7);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UIColorWellTitle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColorWell setPickerTitle:](v6, "setPickerTitle:", v8);
    -[UIColorWell setSupportsAlpha:](v6, "setSupportsAlpha:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("UIColorWellSupportsAlpha")));

  }
  return v6;
}

- (void)_populateArchivedSubviews:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UIColorWell;
  -[UIView _populateArchivedSubviews:](&v5, sel__populateArchivedSubviews_, v4);
  if (self->_style)
    objc_msgSend(v4, "removeObject:");

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIColorWell;
  v4 = a3;
  -[UIControl encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_selectedColor, CFSTR("UIColorWellColor"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, CFSTR("UIColorWellTitle"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsAlpha, CFSTR("UIColorWellSupportsAlpha"));

}

- (void)setPickerTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[_UIColorWellVisualStyle setPickerTitle:](self->_style, "setPickerTitle:", v5);

}

- (void)setSupportsAlpha:(BOOL)supportsAlpha
{
  self->_supportsAlpha = supportsAlpha;
  -[_UIColorWellVisualStyle setSupportsAlpha:](self->_style, "setSupportsAlpha:");
}

- (void)setSelectedColor:(UIColor *)selectedColor
{
  -[UIColorWell _setSelectedColor:notifyingStyle:notifyingUIPicker:sendingAction:](self, "_setSelectedColor:notifyingStyle:notifyingUIPicker:sendingAction:", selectedColor, 1, 1, 0);
}

- (void)_setSelectedColor:(id)a3 notifyingStyle:(BOOL)a4 notifyingUIPicker:(BOOL)a5 sendingAction:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  id WeakRetained;
  id v12;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v12 = a3;
  -[UIColorWell willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("selectedColor"));
  objc_storeStrong((id *)&self->_selectedColor, a3);
  -[UIColorWell didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("selectedColor"));
  if (!v8)
  {
    if (!v7)
      goto LABEL_3;
LABEL_7:
    WeakRetained = objc_loadWeakRetained((id *)&self->_colorPicker);
    objc_msgSend(WeakRetained, "_setSelectedColor:", v12);

    if (!v6)
      goto LABEL_5;
    goto LABEL_4;
  }
  -[_UIColorWellVisualStyle setSelectedColor:](self->_style, "setSelectedColor:", v12);
  if (v7)
    goto LABEL_7;
LABEL_3:
  if (v6)
LABEL_4:
    -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
LABEL_5:

}

- (unint64_t)_controlEventsForActionTriggered
{
  return 4096;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedWidth
{
  return 1;
}

- (BOOL)_contentHuggingDefault_isUsuallyFixedHeight
{
  return 1;
}

- (CGSize)_intrinsicSizeWithinSize:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[_UIColorWellVisualStyle intrinsicSizeWithinSize:](self->_style, "intrinsicSizeWithinSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  _UIColorWellVisualStyle *style;
  double Width;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)UIColorWell;
  -[UIView layoutSubviews](&v9, sel_layoutSubviews);
  if (-[_UIColorWellVisualStyle wantsExtraTouchInsets](self->_style, "wantsExtraTouchInsets"))
  {
    -[UIView bounds](self, "bounds");
    if (v3 + -44.0 <= 0.0)
      v5 = (v3 + -44.0) * 0.5;
    else
      v5 = 0.0;
    if (v4 + -44.0 <= 0.0)
      v6 = (v4 + -44.0) * 0.5;
    else
      v6 = 0.0;
    -[UIView _setTouchInsets:](self, "_setTouchInsets:", v6, v5, v6, v5);
  }
  style = self->_style;
  -[UIView frame](self, "frame");
  Width = CGRectGetWidth(v10);
  -[UIView frame](self, "frame");
  -[UIView setFrame:](style, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v11));
}

- (void)styleDidSelectColor:(id)a3
{
  -[UIColorWell _setSelectedColor:notifyingStyle:notifyingUIPicker:sendingAction:](self, "_setSelectedColor:notifyingStyle:notifyingUIPicker:sendingAction:", a3, 0, 0, 1);
}

- (void)styleRequestedColorPickerPresentation
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  UIColorPickerViewController *obj;

  obj = objc_alloc_init(UIColorPickerViewController);
  -[UIColorPickerViewController _setSelectedColor:](obj, "_setSelectedColor:", self->_selectedColor);
  -[UIColorPickerViewController setSupportsAlpha:](obj, "setSupportsAlpha:", self->_supportsAlpha);
  -[UIColorPickerViewController setTitle:](obj, "setTitle:", self->_title);
  -[UIColorPickerViewController setDelegate:](obj, "setDelegate:", self);
  -[UIViewController setModalPresentationStyle:](obj, "setModalPresentationStyle:", 7);
  -[UIViewController popoverPresentationController](obj, "popoverPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceView:", self);

  -[UIColorWell _delegate](self, "_delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIColorWell _delegate](self, "_delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_colorWell:willPresentColorPickerViewController:", self, obj);

  }
  -[UIView _viewControllerForAncestor](self, "_viewControllerForAncestor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentViewController:animated:completion:", obj, 1, 0);

  objc_storeWeak((id *)&self->_colorPicker, obj);
}

- (void)colorPickerViewController:(id)a3 didSelectColor:(id)a4 continuously:(BOOL)a5
{
  -[UIColorWell _setSelectedColor:notifyingStyle:notifyingUIPicker:sendingAction:](self, "_setSelectedColor:notifyingStyle:notifyingUIPicker:sendingAction:", a4, 1, 0, 1);
}

- (void)_colorPickerViewControllerDidDeselectColor:(id)a3
{
  -[UIColorWell _setSelectedColor:notifyingStyle:notifyingUIPicker:sendingAction:](self, "_setSelectedColor:notifyingStyle:notifyingUIPicker:sendingAction:", 0, 1, 0, 1);
}

- (void)_colorPickerViewControllerDidShowEyedropper:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[UIColorWell _delegate](self, "_delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIColorWell _delegate](self, "_delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_colorWellDidShowEyedropper:", self);

  }
}

- (void)_colorPickerViewControllerDidHideEyedropper:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[UIColorWell _delegate](self, "_delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[UIColorWell _delegate](self, "_delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_colorWellDidHideEyedropper:", self);

  }
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  UIDragItem *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc(MEMORY[0x1E0CB36C8]);
  -[UIColorWell selectedColor](self, "selectedColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithObject:", v6);

  v8 = -[UIDragItem initWithItemProvider:]([UIDragItem alloc], "initWithItemProvider:", v7);
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  UITargetedDragPreview *v6;
  _UIColorWellVisualStyle *style;
  void *v8;
  UITargetedDragPreview *v9;

  v6 = [UITargetedDragPreview alloc];
  style = self->_style;
  -[_UIColorWellVisualStyle dragPreviewParameters](style, "dragPreviewParameters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UITargetedPreview initWithView:parameters:](v6, "initWithView:parameters:", style, v8);

  return v9;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v4;
  void *v5;
  char v6;

  v4 = a4;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "canLoadObjectsOfClass:", v5);

  return v6;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  return -[UIDropProposal initWithDropOperation:]([UIDropProposal alloc], "initWithDropOperation:", 2);
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[5];

  v5 = a4;
  v6 = objc_opt_class();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__UIColorWell_dropInteraction_performDrop___block_invoke;
  v8[3] = &unk_1E16B1548;
  v8[4] = self;
  v7 = (id)objc_msgSend(v5, "loadObjectsOfClass:completion:", v6, v8);

}

void __43__UIColorWell_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setSelectedColor:notifyingStyle:notifyingUIPicker:sendingAction:", v3, 1, 1, 1);

}

+ (id)styleForColorWell:(id)a3
{
  id v3;
  void *v4;
  _UIColorWelliOSVisualStyle *v5;

  v3 = a3;
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInterfaceIdiom");

  v5 = -[_UIColorWelliOSVisualStyle initWithColorWell:]([_UIColorWelliOSVisualStyle alloc], "initWithColorWell:", v3);
  return v5;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)supportsAlpha
{
  return self->_supportsAlpha;
}

- (_UIColorWellDelegate)_delegate
{
  return (_UIColorWellDelegate *)objc_loadWeakRetained((id *)&self->__delegate);
}

- (void)set_delegate:(id)a3
{
  objc_storeWeak((id *)&self->__delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__delegate);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_dragInteraction, 0);
  objc_destroyWeak((id *)&self->_colorPicker);
  objc_storeStrong((id *)&self->_style, 0);
}

@end
