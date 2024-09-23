@implementation SKUIHorizontalLockupCollectionViewCell

- (SKUIHorizontalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  SKUIHorizontalLockupCollectionViewCell *v16;
  SKUIHorizontalLockupView *v17;
  uint64_t v18;
  SKUIHorizontalLockupView *lockupView;
  void *v20;
  objc_super v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[SKUIHorizontalLockupCollectionViewCell initWithFrame:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v22.receiver = self;
  v22.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  v16 = -[SKUICollectionViewCell initWithFrame:](&v22, sel_initWithFrame_, x, y, width, height);
  if (v16)
  {
    v17 = [SKUIHorizontalLockupView alloc];
    -[SKUIHorizontalLockupCollectionViewCell bounds](v16, "bounds");
    v18 = -[SKUIHorizontalLockupView initWithFrame:](v17, "initWithFrame:");
    lockupView = v16->_lockupView;
    v16->_lockupView = (SKUIHorizontalLockupView *)v18;

    -[SKUIHorizontalLockupCollectionViewCell contentView](v16, "contentView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addSubview:", v16->_lockupView);

  }
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[UIButton removeTarget:action:forControlEvents:](self->_actionButton, "removeTarget:action:forControlEvents:", self, 0, 4095);
  -[SKUICellScrollView setDelegate:](self->_actionsScrollView, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  -[SKUIHorizontalLockupCollectionViewCell dealloc](&v3, sel_dealloc);
}

- (void)hideDeleteButton
{
  -[SKUICellScrollView setContentOffset:animated:](self->_actionsScrollView, "setContentOffset:animated:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (BOOL)isDeleteButtonHidden
{
  SKUICellScrollView *actionsScrollView;
  double v3;
  BOOL result;

  actionsScrollView = self->_actionsScrollView;
  result = 1;
  if (actionsScrollView)
  {
    -[SKUICellScrollView contentOffset](actionsScrollView, "contentOffset");
    if (v3 > 0.0)
      return 0;
  }
  return result;
}

- (BOOL)isScrollingCellToHideActionButton
{
  SKUICellScrollView *actionsScrollView;
  double v4;
  double v5;
  double v6;
  double v7;
  BOOL result;

  actionsScrollView = self->_actionsScrollView;
  result = 0;
  if (actionsScrollView)
  {
    -[SKUICellScrollView contentOffset](actionsScrollView, "contentOffset");
    if (v4 != 0.0)
    {
      -[SKUICellScrollView contentOffset](self->_actionsScrollView, "contentOffset");
      v6 = v5;
      -[UIButton frame](self->_actionButton, "frame");
      if (v6 < v7)
        return 1;
    }
  }
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInset.left
    || a3.top != self->_contentInset.top
    || a3.right != self->_contentInset.right
    || a3.bottom != self->_contentInset.bottom)
  {
    self->_contentInset = a3;
    -[SKUIHorizontalLockupCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  if ((((self->_editModeControl == 0) ^ a3) & 1) == 0)
  {
    if (a3)
      -[SKUIHorizontalLockupCollectionViewCell _addEditControlAnimated:](self, "_addEditControlAnimated:", a4);
    else
      -[SKUIHorizontalLockupCollectionViewCell _removeEditControlAnimated:](self, "_removeEditControlAnimated:", a4);
    -[SKUICellScrollView setContentOffset:animated:](self->_actionsScrollView, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    -[SKUICellScrollView setScrollEnabled:](self->_actionsScrollView, "setScrollEnabled:", -[SKUIHorizontalLockupCollectionViewCell _isActionsScrollViewEnabled](self, "_isActionsScrollViewEnabled"));
  }
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  UIColor *v5;
  UIColor *lockupViewBackgroundColor;
  objc_super v7;

  v4 = a3;
  objc_msgSend(v4, "backgroundColor");
  v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
  lockupViewBackgroundColor = self->_lockupViewBackgroundColor;
  self->_lockupViewBackgroundColor = v5;

  if (self->_lockupViewBackgroundColor)
    -[SKUIHorizontalLockupView setBackgroundColor:](self->_lockupView, "setBackgroundColor:");
  v7.receiver = self;
  v7.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  -[SKUICollectionViewCell applyLayoutAttributes:](&v7, sel_applyLayoutAttributes_, v4);

}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  double result;

  +[SKUIHorizontalLockupView maximumPerspectiveHeightForSize:](SKUIHorizontalLockupView, "maximumPerspectiveHeightForSize:", a3.width, a3.height);
  return result;
}

- (void)setPerspectiveTargetView:(id)a3
{
  SKUIHorizontalLockupView *lockupView;
  id v4;

  lockupView = self->_lockupView;
  v4 = a3;
  -[SKUIHorizontalLockupView setPerspectiveTargetView:](lockupView, "setPerspectiveTargetView:", v4);

}

- (void)setVanishingPoint:(CGPoint)a3
{
  -[SKUIHorizontalLockupView setVanishingPoint:](self->_lockupView, "setVanishingPoint:", a3.x, a3.y);
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  -[SKUIHorizontalLockupView updateForChangedDistanceFromVanishingPoint](self->_lockupView, "updateForChangedDistanceFromVanishingPoint");
}

+ (BOOL)prefetchResourcesForViewElement:(id)a3 reason:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIHorizontalLockupCollectionViewCell prefetchResourcesForViewElement:reason:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  v17 = +[SKUIHorizontalLockupView prefetchResourcesForViewElement:reason:context:](SKUIHorizontalLockupView, "prefetchResourcesForViewElement:reason:context:", v7, a4, v8);

  return v17;
}

+ (CGSize)preferredSizeForViewElement:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  v6 = a4;
  v7 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    +[SKUIHorizontalLockupCollectionViewCell preferredSizeForViewElement:context:].cold.1();
  }
  objc_msgSend(v6, "defaultItemWidthForViewElement:", v7);
  objc_msgSend(a1, "sizeThatFitsWidth:viewElement:context:", v7, v6);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

+ (void)requestLayoutForViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a3;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIHorizontalLockupCollectionViewCell requestLayoutForViewElement:width:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  +[SKUIHorizontalLockupView requestLayoutForViewElement:width:context:](SKUIHorizontalLockupView, "requestLayoutForViewElement:width:context:", v7, v8, a4);

}

+ (CGSize)sizeThatFitsWidth:(double)a3 viewElement:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  v7 = a4;
  v8 = a5;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v9)
        +[SKUIHorizontalLockupCollectionViewCell sizeThatFitsWidth:viewElement:context:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  +[SKUIHorizontalLockupView sizeThatFitsWidth:viewElement:context:](SKUIHorizontalLockupView, "sizeThatFitsWidth:viewElement:context:", v7, v8, a3);
  v18 = v17;
  v20 = v19;

  v21 = v18;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

- (void)reloadWithViewElement:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  void *v9;
  int v10;
  SKUICheckboxInputViewElement *v11;
  SKUICheckboxInputViewElement *editModeCheckboxElement;
  _BOOL8 v13;
  UIImageView *editModeControl;
  void *v15;
  void *v16;
  UIColor *v17;
  UIColor *lockupViewBackgroundColor;
  id v19;

  v19 = a3;
  v8 = a5;
  -[SKUIHorizontalLockupCollectionViewCell _reloadActionsScrollViewWithViewElement:context:](self, "_reloadActionsScrollViewWithViewElement:context:", v19, v8);
  objc_msgSend(v8, "aggregateValueForKey:", CFSTR("SKUIHorizontalLockupShowsEditModeKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  objc_msgSend(v19, "firstChildForElementType:", 18);
  v11 = (SKUICheckboxInputViewElement *)objc_claimAutoreleasedReturnValue();
  editModeCheckboxElement = self->_editModeCheckboxElement;
  self->_editModeCheckboxElement = v11;

  if (v10)
    v13 = self->_editModeCheckboxElement != 0;
  else
    v13 = 0;
  -[SKUIHorizontalLockupCollectionViewCell setEditing:animated:](self, "setEditing:animated:", v13, 0);
  editModeControl = self->_editModeControl;
  if (editModeControl)
  {
    -[SKUIHorizontalLockupCollectionViewCell _editControlImage](self, "_editControlImage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](editModeControl, "setImage:", v15);

  }
  -[SKUICellScrollView setContentOffset:animated:](self->_actionsScrollView, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[SKUICellScrollView setScrollEnabled:](self->_actionsScrollView, "setScrollEnabled:", -[SKUIHorizontalLockupCollectionViewCell _isActionsScrollViewEnabled](self, "_isActionsScrollViewEnabled"));
  -[SKUIHorizontalLockupView reloadWithViewElement:width:context:](self->_lockupView, "reloadWithViewElement:width:context:", v19, v8, a4);
  if (!self->_lockupViewBackgroundColor)
  {
    -[SKUIHorizontalLockupView preferredBackgroundColor](self->_lockupView, "preferredBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[SKUIHorizontalLockupView preferredBackgroundColor](self->_lockupView, "preferredBackgroundColor");
      v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
      lockupViewBackgroundColor = self->_lockupViewBackgroundColor;
      self->_lockupViewBackgroundColor = v17;

    }
  }

}

- (BOOL)setImage:(id)a3 forArtworkRequest:(id)a4 context:(id)a5
{
  return -[SKUIHorizontalLockupView setImage:forArtworkRequest:context:](self->_lockupView, "setImage:forArtworkRequest:context:", a3, a4, a5);
}

- (BOOL)updateWithItemState:(id)a3 context:(id)a4 animated:(BOOL)a5
{
  return -[SKUIHorizontalLockupView updateWithItemState:context:animated:](self->_lockupView, "updateWithItemState:context:animated:", a3, a4, a5);
}

- (id)viewForElementIdentifier:(id)a3
{
  return -[SKUIHorizontalLockupView viewForElementIdentifier:](self->_lockupView, "viewForElementIdentifier:", a3);
}

- (void)setHighlighted:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  -[SKUICollectionViewCell setHighlighted:](&v4, sel_setHighlighted_, a3);
  if (!self->_editModeControl)
    -[SKUIHorizontalLockupCollectionViewCell _reloadHighlightBackgroundView](self, "_reloadHighlightBackgroundView");
}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  -[SKUICollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  if (!self->_editModeControl)
    -[SKUIHorizontalLockupCollectionViewCell _reloadHighlightBackgroundView](self, "_reloadHighlightBackgroundView");
}

- (void)layoutSubviews
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
  UIImageView *editModeControl;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  float v18;
  CGFloat v19;
  SKUICellScrollView *actionsScrollView;
  double v21;
  CGFloat v22;
  CGFloat MaxX;
  CGFloat v24;
  double v25;
  UIButton *actionButton;
  UIButton *v27;
  double v28;
  SKUIHorizontalLockupView *lockupView;
  CGFloat v30;
  objc_super v31;
  CGRect v32;
  CGRect v33;

  v31.receiver = self;
  v31.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  -[SKUICollectionViewCell layoutSubviews](&v31, sel_layoutSubviews);
  -[SKUIHorizontalLockupCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  editModeControl = self->_editModeControl;
  v30 = v5;
  if (editModeControl)
  {
    -[UIImageView frame](editModeControl, "frame");
    v14 = v13;
    v16 = v15;
    v17 = v5 + 15.0;
    v18 = v7 + (v11 - v15) * 0.5;
    v19 = floorf(v18);
    -[UIImageView setFrame:](self->_editModeControl, "setFrame:", v17, v19);
    v32.origin.x = v17;
    v32.origin.y = v19;
    v32.size.width = v14;
    v32.size.height = v16;
    v5 = CGRectGetMaxX(v32) + 15.0 - self->_contentInset.left;
  }
  -[SKUIHorizontalLockupView setContentInset:](self->_lockupView, "setContentInset:", self->_contentInset.top, self->_contentInset.left, self->_contentInset.bottom, self->_contentInset.right);
  actionsScrollView = self->_actionsScrollView;
  if (actionsScrollView)
  {
    -[SKUICellScrollView setFrame:](actionsScrollView, "setFrame:", v5, v7, v9, v11);
    -[SKUIHorizontalLockupView setFrame:](self->_lockupView, "setFrame:", 0.0, v7, v9, v11);
    -[UIButton frame](self->_actionButton, "frame");
    v22 = v21;
    v33.origin.x = 0.0;
    v33.origin.y = v7;
    v33.size.width = v9;
    v33.size.height = v11;
    MaxX = CGRectGetMaxX(v33);
    -[UIButton sizeThatFits:](self->_actionButton, "sizeThatFits:", 1.79769313e308, v11);
    v25 = v24;
    actionButton = self->_actionButton;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(MaxX, v22, v24, v11, v30, v7, v9, v11);
    -[UIButton setFrame:](actionButton, "setFrame:");
    v27 = self->_actionButton;
    -[SKUICellScrollView contentOffset](self->_actionsScrollView, "contentOffset");
    -[UIButton setHidden:](v27, "setHidden:", v28 < 0.00000011920929);
    -[SKUICellScrollView setContentSize:](self->_actionsScrollView, "setContentSize:", v9 + v25, v11);
  }
  else
  {
    lockupView = self->_lockupView;
    SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(v5, v7, v9, v11, v30, v7, v9, v11);
    -[SKUIHorizontalLockupView setFrame:](lockupView, "setFrame:");
  }
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  -[SKUIHorizontalLockupCollectionViewCell setSemanticContentAttribute:](&v5, sel_setSemanticContentAttribute_);
  -[SKUIHorizontalLockupView setSemanticContentAttribute:](self->_lockupView, "setSemanticContentAttribute:", a3);
  -[SKUICellScrollView setSemanticContentAttribute:](self->_actionsScrollView, "setSemanticContentAttribute:", a3);
  -[UIButton setSemanticContentAttribute:](self->_actionButton, "setSemanticContentAttribute:", a3);
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SKUIHorizontalLockupCollectionViewCell;
  -[SKUICollectionViewCell setBackgroundColor:](&v4, sel_setBackgroundColor_, a3);
  -[SKUIHorizontalLockupCollectionViewCell _reloadLockupViewBackgroundColor](self, "_reloadLockupViewBackgroundColor");
}

- (void)_actionButtonAction:(id)a3
{
  -[SKUIButtonViewElement dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:](self->_actionButtonViewElement, "dispatchEventOfType:canBubble:isCancelable:extraInfo:completionBlock:", 2, 1, 1, 0, 0);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v4 = a3;
  SKUICollectionViewForView(self);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOffset");
  v7 = v6;

  if (v7 == 0.0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v9, "indexPathForCell:", self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "collectionView:didEndEditingItemAtIndexPath:", v9, v8);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double MaxX;
  double v17;
  void *v18;
  id v19;
  CGRect v20;

  v19 = a3;
  objc_msgSend(v19, "contentOffset");
  v5 = v4;
  SKUICollectionViewForView(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 <= 0.0
    || (objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v6, "indexPathForCell:", self),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v7, "collectionView:canScrollCellAtIndexPath:", v6, v8),
        v8,
        (v9 & 1) == 0))
  {
    objc_msgSend(v19, "setContentOffset:animated:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }
  else
  {
    -[UIButton frame](self->_actionButton, "frame");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    -[SKUIHorizontalLockupView frame](self->_lockupView, "frame");
    MaxX = CGRectGetMaxX(v20);
    v17 = v5 - v13;
    if (v5 < v13)
      v17 = -0.0;
    -[UIButton setFrame:](self->_actionButton, "setFrame:", MaxX + v17, v11, v13, v15);
    -[UIButton setHidden:](self->_actionButton, "setHidden:", v5 < 0.00000011920929);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "indexPathForCell:", self);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionView:willBeginEditingItemAtIndexPath:", v6, v18);

    }
  }

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double v7;
  double y;
  id v9;

  v9 = a3;
  -[UIButton frame](self->_actionButton, "frame");
  y = a5->y;
  if (v7 * 0.5 <= a5->x)
  {
    objc_msgSend(v9, "setContentOffset:animated:", 1, v7, y);
  }
  else
  {
    objc_msgSend(v9, "setContentOffset:animated:", 1, 0.0, y);
    -[SKUIHorizontalLockupCollectionViewCell scrollViewDidEndScrollingAnimation:](self, "scrollViewDidEndScrollingAnimation:", v9);
  }

}

- (void)_addEditControlAnimated:(BOOL)a3
{
  id v5;
  void *v6;
  UIImageView *v7;
  UIImageView *editModeControl;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double *v16;
  _QWORD v17[6];
  uint64_t v18;
  double *v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;

  v5 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[SKUIHorizontalLockupCollectionViewCell _editControlImage](self, "_editControlImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (UIImageView *)objc_msgSend(v5, "initWithImage:", v6);
  editModeControl = self->_editModeControl;
  self->_editModeControl = v7;

  -[SKUIHorizontalLockupCollectionViewCell contentView](self, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_editModeControl);
  if (a3)
  {
    objc_msgSend(v9, "bounds");
    v11 = v10;
    v18 = 0;
    v19 = (double *)&v18;
    v20 = 0x4010000000;
    v21 = &unk_1BBF15257;
    v22 = 0u;
    v23 = 0u;
    -[UIImageView frame](self->_editModeControl, "frame");
    *(_QWORD *)&v22 = v12;
    *((_QWORD *)&v22 + 1) = v13;
    *(_QWORD *)&v23 = v14;
    *((_QWORD *)&v23 + 1) = v15;
    v16 = v19;
    *(float *)&v13 = (v11 - v19[7]) * 0.5;
    v19[4] = -v19[6];
    v16[5] = floorf(*(float *)&v13);
    -[UIImageView setFrame:](self->_editModeControl, "setFrame:");
    -[SKUIHorizontalLockupCollectionViewCell layoutIfNeeded](self, "layoutIfNeeded");
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __66__SKUIHorizontalLockupCollectionViewCell__addEditControlAnimated___block_invoke;
    v17[3] = &unk_1E73A0270;
    v17[4] = self;
    v17[5] = &v18;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v17, 0.3);
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    -[SKUIHorizontalLockupCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

void __66__SKUIHorizontalLockupCollectionViewCell__addEditControlAnimated___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  id v7;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = 0x402E000000000000;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 832), "setFrame:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 784);
  if (!v3)
    v3 = *(void **)(v2 + 848);
  v7 = v3;
  objc_msgSend(v7, "frame");
  objc_msgSend(v7, "setFrame:", CGRectGetMaxX(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32))+ 15.0- *(double *)(*(_QWORD *)(a1 + 32) + 800), v4, v5, v6);

}

- (id)_attributedStringForActionButton:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "buttonTitleStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "style");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  SKUIViewElementFontWithStyle(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    SKUIFontPreferredFontForTextStyle(1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "tintColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v10, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "buttonText");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "attributedStringWithDefaultFont:foregroundColor:style:", v11, v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_editControlImage
{
  SKUICheckboxInputViewElement *editModeCheckboxElement;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  editModeCheckboxElement = self->_editModeCheckboxElement;
  if (editModeCheckboxElement)
  {
    if (-[SKUICheckboxInputViewElement isSelected](editModeCheckboxElement, "isSelected"))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_kitImageNamed:withTrait:", CFSTR("UITintedCircularButtonCheckmark"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUICheckboxInputViewElement style](self->_editModeCheckboxElement, "style");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      SKUIViewElementPlainColorWithStyle(v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
        objc_msgSend(v4, "_flatImageWithColor:", v6);
      else
        objc_msgSend(v4, "imageWithRenderingMode:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "_imageThatSuppressesAccessibilityHairlineThickening");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[SKUIHorizontalLockupCollectionViewCell backgroundColor](self, "backgroundColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      SKUIBorderColorWithBackgroundColor(v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3870], "_kitImageNamed:withTrait:", CFSTR("UIRemoveControlMultiNotCheckedImage"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_flatImageWithColor:", v6);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v10;

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_highlightBackgroundColor
{
  void *v2;
  void *v3;
  float v4;
  uint64_t v5;
  void *v6;

  -[SKUIHorizontalLockupCollectionViewCell backgroundColor](self, "backgroundColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    switch(SKUIColorSchemeStyleForColor(v2))
    {
      case 0:
      case 2:
        v4 = -0.1;
        goto LABEL_6;
      case 1:
      case 3:
        v4 = 0.2;
LABEL_6:
        SKUIColorByAdjustingBrightness(v3, v4);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_7;
      default:
        v6 = 0;
        goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.9, 1.0);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = (void *)v5;
LABEL_8:

  return v6;
}

- (BOOL)_isActionsScrollViewEnabled
{
  return !self->_editModeControl && self->_actionButtonViewElement != 0;
}

- (void)_reloadActionsScrollViewWithViewElement:(id)a3 context:(id)a4
{
  void *v6;
  SKUIButtonViewElement *v7;
  SKUIButtonViewElement *actionButtonViewElement;
  SKUICellScrollView *v9;
  SKUICellScrollView *v10;
  SKUICellScrollView *actionsScrollView;
  SKUICellScrollView *v12;
  void *v13;
  SKUIHorizontalLockupView *lockupView;
  void *v15;
  UIButton *v16;
  UIButton *actionButton;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UIButton *v22;
  void *v23;
  id v24;

  v24 = a4;
  objc_msgSend(a3, "firstChildForElementType:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstChildForElementType:", 12);
  v7 = (SKUIButtonViewElement *)objc_claimAutoreleasedReturnValue();
  actionButtonViewElement = self->_actionButtonViewElement;
  self->_actionButtonViewElement = v7;

  if (self->_actionButtonViewElement)
  {
    if (!self->_actionsScrollView)
    {
      v9 = [SKUICellScrollView alloc];
      -[SKUIHorizontalLockupView frame](self->_lockupView, "frame");
      v10 = -[SKUICellScrollView initWithFrame:](v9, "initWithFrame:");
      actionsScrollView = self->_actionsScrollView;
      self->_actionsScrollView = v10;

      v12 = self->_actionsScrollView;
      -[SKUIHorizontalLockupView backgroundColor](self->_lockupView, "backgroundColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKUICellScrollView setBackgroundColor:](v12, "setBackgroundColor:", v13);

      -[SKUICellScrollView setDelegate:](self->_actionsScrollView, "setDelegate:", self);
      -[SKUICellScrollView setScrollsToTop:](self->_actionsScrollView, "setScrollsToTop:", 0);
      -[SKUICellScrollView setShowsHorizontalScrollIndicator:](self->_actionsScrollView, "setShowsHorizontalScrollIndicator:", 0);
      lockupView = self->_lockupView;
      -[SKUICellScrollView bounds](self->_actionsScrollView, "bounds");
      -[SKUIHorizontalLockupView setFrame:](lockupView, "setFrame:");
      -[SKUICellScrollView addSubview:](self->_actionsScrollView, "addSubview:", self->_lockupView);
      -[SKUIHorizontalLockupCollectionViewCell contentView](self, "contentView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "addSubview:", self->_actionsScrollView);

    }
    if (!self->_actionButton)
    {
      v16 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
      actionButton = self->_actionButton;
      self->_actionButton = v16;

      -[UIButton addTarget:action:forControlEvents:](self->_actionButton, "addTarget:action:forControlEvents:", self, sel__actionButtonAction_, 64);
      -[UIButton setContentEdgeInsets:](self->_actionButton, "setContentEdgeInsets:", 0.0, 15.0, 0.0, 15.0);
      -[UIButton setHidden:](self->_actionButton, "setHidden:", 1);
      -[UIButton titleLabel](self->_actionButton, "titleLabel");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTextAlignment:", 1);

    }
    -[SKUIButtonViewElement style](self->_actionButtonViewElement, "style");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "ikBackgroundColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "color");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v22 = self->_actionButton;
    -[SKUIHorizontalLockupCollectionViewCell _attributedStringForActionButton:context:](self, "_attributedStringForActionButton:context:", self->_actionButtonViewElement, v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setAttributedTitle:forState:](v22, "setAttributedTitle:forState:", v23, 0);

    -[UIButton setBackgroundColor:](self->_actionButton, "setBackgroundColor:", v21);
    -[SKUICellScrollView addSubview:](self->_actionsScrollView, "addSubview:", self->_actionButton);

  }
  else
  {
    -[UIButton setHidden:](self->_actionButton, "setHidden:", 1);
  }

}

- (void)_reloadHighlightBackgroundView
{
  UIView *highlightBackgroundView;
  double v4;
  double v5;
  double v6;
  double v7;
  UIView *v8;
  UIView *v9;
  UIView *v10;
  void *v11;
  UIView *v12;
  UIView *v13;
  UIView *v14;
  void *v15;
  UIView *v16;
  _QWORD v17[4];
  UIView *v18;
  id v19;
  id location;

  if ((-[SKUIHorizontalLockupCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
    || -[SKUIHorizontalLockupCollectionViewCell isSelected](self, "isSelected"))
  {
    highlightBackgroundView = self->_highlightBackgroundView;
    if (!highlightBackgroundView)
    {
      -[SKUIHorizontalLockupCollectionViewCell bounds](self, "bounds");
      v8 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
      v9 = self->_highlightBackgroundView;
      self->_highlightBackgroundView = v8;

      v10 = self->_highlightBackgroundView;
      -[SKUIHorizontalLockupCollectionViewCell _highlightBackgroundColor](self, "_highlightBackgroundColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

      highlightBackgroundView = self->_highlightBackgroundView;
    }
    -[SKUIHorizontalLockupCollectionViewCell insertSubview:atIndex:](self, "insertSubview:atIndex:", highlightBackgroundView, 0);
    -[SKUIHorizontalLockupCollectionViewCell _reloadLockupViewBackgroundColor](self, "_reloadLockupViewBackgroundColor");
  }
  else
  {
    v12 = self->_highlightBackgroundView;
    if (v12)
    {
      v13 = v12;
      v14 = self->_highlightBackgroundView;
      self->_highlightBackgroundView = 0;

      objc_initWeak(&location, self);
      objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
      v15 = (void *)MEMORY[0x1E0CD28B0];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __72__SKUIHorizontalLockupCollectionViewCell__reloadHighlightBackgroundView__block_invoke;
      v17[3] = &unk_1E739FE78;
      v16 = v13;
      v18 = v16;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v15, "setCompletionBlock:", v17);
      -[UIView setAlpha:](v16, "setAlpha:", 0.0);
      objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
      objc_destroyWeak(&v19);

      objc_destroyWeak(&location);
    }
  }
}

void __72__SKUIHorizontalLockupCollectionViewCell__reloadHighlightBackgroundView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_reloadLockupViewBackgroundColor");

}

- (void)_reloadLockupViewBackgroundColor
{
  SKUIHorizontalLockupView *lockupView;
  void *v4;
  void *v5;
  SKUICellScrollView *actionsScrollView;
  void *v7;
  id v8;

  -[SKUIHorizontalLockupView metadataBackgroundView](self->_lockupView, "metadataBackgroundView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((-[SKUIHorizontalLockupCollectionViewCell isHighlighted](self, "isHighlighted") & 1) != 0
    || (-[SKUIHorizontalLockupCollectionViewCell isSelected](self, "isSelected") & 1) != 0
    || self->_highlightBackgroundView)
  {
    lockupView = self->_lockupView;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIHorizontalLockupView setBackgroundColor:](lockupView, "setBackgroundColor:", v4);

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setBackgroundColor:", v5);

    }
  }
  else if (self->_lockupViewBackgroundColor)
  {
    -[SKUIHorizontalLockupView setBackgroundColor:](self->_lockupView, "setBackgroundColor:");
    if (v8)
      objc_msgSend(v8, "setBackgroundColor:", self->_lockupViewBackgroundColor);
  }
  actionsScrollView = self->_actionsScrollView;
  -[SKUIHorizontalLockupView backgroundColor](self->_lockupView, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUICellScrollView setBackgroundColor:](actionsScrollView, "setBackgroundColor:", v7);

}

- (void)_removeEditControlAnimated:(BOOL)a3
{
  UIImageView *v5;
  UIImageView *editModeControl;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[4];
  UIImageView *v19;
  _QWORD v20[4];
  UIImageView *v21;
  SKUIHorizontalLockupCollectionViewCell *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v5 = self->_editModeControl;
  editModeControl = self->_editModeControl;
  self->_editModeControl = 0;

  if (a3)
  {
    -[SKUIHorizontalLockupCollectionViewCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v16 = (void *)MEMORY[0x1E0DC3F10];
    v17 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __69__SKUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke;
    v20[3] = &unk_1E73A6188;
    v21 = v5;
    v22 = self;
    v23 = v9;
    v24 = v11;
    v25 = v13;
    v26 = v15;
    v18[0] = v17;
    v18[1] = 3221225472;
    v18[2] = __69__SKUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke_2;
    v18[3] = &unk_1E73A0108;
    v19 = v21;
    objc_msgSend(v16, "animateWithDuration:animations:completion:", v20, v18, 0.3);

  }
  else
  {
    -[UIImageView removeFromSuperview](v5, "removeFromSuperview");
    -[SKUIHorizontalLockupCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

uint64_t __69__SKUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(a1 + 32), "frame");
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", -v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 784), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 848), "setFrame:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __69__SKUIHorizontalLockupCollectionViewCell__removeEditControlAnimated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockupViewBackgroundColor, 0);
  objc_storeStrong((id *)&self->_lockupView, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundView, 0);
  objc_storeStrong((id *)&self->_editModeControl, 0);
  objc_storeStrong((id *)&self->_editModeCheckboxElement, 0);
  objc_storeStrong((id *)&self->_actionsScrollView, 0);
  objc_storeStrong((id *)&self->_actionButtonViewElement, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
}

- (void)initWithFrame:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)prefetchResourcesForViewElement:(uint64_t)a3 reason:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)preferredSizeForViewElement:context:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "+[SKUIHorizontalLockupCollectionViewCell preferredSizeForViewElement:context:]";
  OUTLINED_FUNCTION_1();
}

+ (void)requestLayoutForViewElement:(uint64_t)a3 width:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)sizeThatFitsWidth:(uint64_t)a3 viewElement:(uint64_t)a4 context:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
