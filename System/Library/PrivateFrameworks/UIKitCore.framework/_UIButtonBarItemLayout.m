@implementation _UIButtonBarItemLayout

- (void)dirtyLayoutForPlainAppearanceChange:(BOOL)a3 doneAppearanceChanged:(BOOL)a4
{
  _BOOL4 v4;
  UIBarButtonItemStyle v7;
  BOOL v8;
  _BOOL4 v9;

  v4 = a4;
  v7 = -[UIBarButtonItem style](self->_item, "style");
  if (v7)
    v8 = 0;
  else
    v8 = a3;
  v9 = v7 == UIBarButtonItemStyleDone && v4;
  if (v8 || v9)
    -[_UIButtonBarLayout setDirty:](self, "setDirty:", 1);
}

- (void)_addLayoutViews:(id)a3
{
  _UITAMICAdaptorView *itemViewWrapper;

  itemViewWrapper = self->_itemViewWrapper;
  if (!itemViewWrapper)
    itemViewWrapper = (_UITAMICAdaptorView *)self->_itemView;
  objc_msgSend(a3, "addObject:", itemViewWrapper);
}

- (void)_addConstraintsToActivate:(id)a3 toDeactivate:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  char v10;
  BOOL v11;
  NSLayoutConstraint *groupSameSize;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[UIBarButtonItem _width](self->_item, "_width");
  if (v7 <= 0.0)
    v8 = 0.0;
  else
    v8 = v7;
  v9 = v14;
  if (v7 <= 0.0)
  {
    if (!-[UIBarButtonItem isCustomViewItem](self->_item, "isCustomViewItem")
      || (v10 = -[_UIButtonBarLayoutMetricsData allowsViewWrappers](self->super._layoutMetrics, "allowsViewWrappers"),
          v9 = v14,
          (v10 & 1) == 0))
    {
      v9 = v6;
    }
  }
  objc_msgSend(v9, "addObject:", self->_requestedSize);
  if (self->_maximumAlignmentSize)
    objc_msgSend(v14, "addObject:");
  v11 = v8 != 0.0 || !self->_useGroupSizing;
  if (!v11 && !-[UIBarButtonItem isCustomViewItem](self->_item, "isCustomViewItem"))
  {
    groupSameSize = self->_groupSameSize;
    v13 = v14;
    goto LABEL_18;
  }
  groupSameSize = self->_groupSameSize;
  if (groupSameSize)
  {
    v13 = v6;
LABEL_18:
    objc_msgSend(v13, "addObject:", groupSameSize);
  }

}

- (BOOL)_shouldBeDirty
{
  _UIButtonBarItemLayout *v2;
  UIView *v3;

  v2 = self;
  -[UIBarButtonItem view](self->_item, "view");
  v3 = (UIView *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 != v2->_itemView;

  return (char)v2;
}

- (double)minimumLayoutWidthGivenMinimumSpaceWidth:(double)a3
{
  _UITAMICAdaptorView *itemViewWrapper;
  _UITAMICAdaptorView *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[_UIButtonBarItemLayout _updateItemView](self, "_updateItemView", a3);
  itemViewWrapper = self->_itemViewWrapper;
  if (!itemViewWrapper)
    itemViewWrapper = (_UITAMICAdaptorView *)self->_itemView;
  v5 = itemViewWrapper;
  -[UIView _widthForButtonBarItemLayout](v5, "_widthForButtonBarItemLayout");
  v7 = v6;
  -[UIBarButtonItem _width](self->_item, "_width");
  v9 = v8;

  if (v9 >= v7)
    return v9;
  else
    return v7;
}

- (void)_updateItemViewSizing
{
  _UITAMICAdaptorView *itemViewWrapper;
  double v4;
  double v5;
  NSLayoutConstraint *requestedSize;
  _UITAMICAdaptorView *v7;
  void *v8;
  NSLayoutConstraint *v9;
  NSLayoutConstraint *v10;
  double v11;
  void *v12;
  void *v13;
  NSLayoutConstraint *v14;
  NSLayoutConstraint *maximumAlignmentSize;
  double v16;
  _UITAMICAdaptorView *v17;

  itemViewWrapper = self->_itemViewWrapper;
  if (!itemViewWrapper)
    itemViewWrapper = (_UITAMICAdaptorView *)self->_itemView;
  v17 = itemViewWrapper;
  -[UIBarButtonItem _width](self->_item, "_width");
  v5 = fmax(v4, 0.0);
  requestedSize = self->_requestedSize;
  if (requestedSize
    && (-[NSLayoutConstraint firstItem](requestedSize, "firstItem"),
        v7 = (_UITAMICAdaptorView *)objc_claimAutoreleasedReturnValue(),
        v7,
        requestedSize = self->_requestedSize,
        v17 == v7))
  {
    -[NSLayoutConstraint constant](requestedSize, "constant");
    if (vabdd_f64(v16, v5) > 2.22044605e-16)
      -[NSLayoutConstraint setConstant:](self->_requestedSize, "setConstant:", v5);
  }
  else
  {
    -[NSLayoutConstraint setActive:](requestedSize, "setActive:", 0);
    -[UIView widthAnchor](v17, "widthAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToConstant:", v5);
    v9 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v10 = self->_requestedSize;
    self->_requestedSize = v9;

    -[UIView _setWantsAutolayout](v17, "_setWantsAutolayout");
    LODWORD(v11) = 1143930880;
    -[NSLayoutConstraint setPriority:](self->_requestedSize, "setPriority:", v11);
  }
  -[UIView heightAnchor](v17, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((!-[_UIButtonBarLayoutMetricsData allowsViewWrappers](self->super._layoutMetrics, "allowsViewWrappers")|| !-[UIBarButtonItem isCustomViewItem](self->_item, "isCustomViewItem"))&& !self->_maximumAlignmentSize)
  {
    -[_UIButtonBarLayoutMetricsData verticalSizeGuide](self->super._layoutMetrics, "verticalSizeGuide");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    maximumAlignmentSize = self->_maximumAlignmentSize;
    self->_maximumAlignmentSize = v14;

  }
}

- (void)_updateItemView
{
  UIView **p_itemView;
  void *v4;
  void *v5;
  NSLayoutConstraint *requestedSize;
  NSLayoutConstraint *maximumAlignmentSize;
  NSLayoutConstraint *groupSameSize;
  NSLayoutConstraint *popoverGuideLeading;
  NSLayoutConstraint *popoverGuideTrailing;
  _UITAMICAdaptorView *itemViewWrapper;
  UIView *obj;

  p_itemView = &self->_itemView;
  (*((void (**)(void))self->_itemViewGenerator + 2))();
  obj = (UIView *)objc_claimAutoreleasedReturnValue();
  if (obj != *p_itemView)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (self->_requestedSize)
      objc_msgSend(v4, "addObject:");
    if (self->_maximumAlignmentSize)
      objc_msgSend(v5, "addObject:");
    if (self->_groupSameSize)
      objc_msgSend(v5, "addObject:");
    if (self->_popoverGuideLeading)
      objc_msgSend(v5, "addObject:");
    if (self->_popoverGuideTrailing)
      objc_msgSend(v5, "addObject:");
    objc_msgSend(MEMORY[0x1E0D156E0], "deactivateConstraints:", v5);
    requestedSize = self->_requestedSize;
    self->_requestedSize = 0;

    maximumAlignmentSize = self->_maximumAlignmentSize;
    self->_maximumAlignmentSize = 0;

    groupSameSize = self->_groupSameSize;
    self->_groupSameSize = 0;

    popoverGuideLeading = self->_popoverGuideLeading;
    self->_popoverGuideLeading = 0;

    popoverGuideTrailing = self->_popoverGuideTrailing;
    self->_popoverGuideTrailing = 0;

    objc_storeStrong((id *)&self->_itemView, obj);
  }
  if (-[UIBarButtonItem isCustomViewItem](self->_item, "isCustomViewItem"))
  {
    -[_UIButtonBarItemLayout _updateCustomView](self, "_updateCustomView");
    -[_UIButtonBarItemLayout _updateItemViewSizing](self, "_updateItemViewSizing");
  }
  else
  {
    itemViewWrapper = self->_itemViewWrapper;
    self->_itemViewWrapper = 0;

  }
}

- (void)_configure
{
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *groupSameSize;
  double v8;
  void *v9;

  -[_UIButtonBarItemLayout _updateItemView](self, "_updateItemView");
  -[UIBarButtonItem setView:](self->_item, "setView:", self->_itemView);
  if (!self->_itemView)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIButtonBarLayout.m"), 555, CFSTR("cannot configure an item layout for a nil view"));

  }
  -[_UIButtonBarItemLayout _updateItemViewSizing](self, "_updateItemViewSizing");
  if (self->_useGroupSizing && !self->_groupSameSize)
  {
    -[UIView widthAnchor](self->_itemView, "widthAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIButtonBarLayoutMetricsData groupSizeGuide](self->super._layoutMetrics, "groupSizeGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "constraintEqualToAnchor:", v5);
    v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    groupSameSize = self->_groupSameSize;
    self->_groupSameSize = v6;

    LODWORD(v8) = 1143111680;
    -[NSLayoutConstraint setPriority:](self->_groupSameSize, "setPriority:", v8);

  }
  -[NSLayoutConstraint setIdentifier:](self->_requestedSize, "setIdentifier:", CFSTR("UIButtonBar.requestedSize"));
  -[NSLayoutConstraint setIdentifier:](self->_maximumAlignmentSize, "setIdentifier:", CFSTR("UIButtonBar.maximumAlignmentSize"));
  -[NSLayoutConstraint setIdentifier:](self->_groupSameSize, "setIdentifier:", CFSTR("UIButtonBar.groupSize"));
}

- (void)_updateCustomView
{
  UIView *v3;
  UIView *itemView;
  _UITAMICAdaptorView *itemViewWrapper;
  _UITAMICAdaptorView *v6;
  _UITAMICAdaptorView *v7;
  _UITAMICAdaptorView *v8;

  if (-[_UIButtonBarLayoutMetricsData allowsViewWrappers](self->super._layoutMetrics, "allowsViewWrappers")&& +[_UITAMICAdaptorView shouldWrapView:](_UITAMICAdaptorView, "shouldWrapView:", self->_itemView))
  {
    -[_UITAMICAdaptorView view](self->_itemViewWrapper, "view");
    v3 = (UIView *)objc_claimAutoreleasedReturnValue();
    itemView = self->_itemView;

    if (v3 != itemView)
    {
      itemViewWrapper = self->_itemViewWrapper;
      self->_itemViewWrapper = 0;

    }
    if (!self->_itemViewWrapper)
    {
      v7 = -[_UITAMICAdaptorView initWithView:]([_UITAMICAdaptorView alloc], "initWithView:", self->_itemView);
      v8 = self->_itemViewWrapper;
      self->_itemViewWrapper = v7;

      -[_UIButtonBarLayout setDirty:](self, "setDirty:", 1);
    }
  }
  else
  {
    -[_UIButtonBarLayout setDirty:](self, "setDirty:", self->_itemViewWrapper != 0);
    v6 = self->_itemViewWrapper;
    self->_itemViewWrapper = 0;

  }
}

- (void)setUseGroupSizing:(BOOL)a3
{
  if (self->_useGroupSizing != a3)
  {
    self->_useGroupSizing = a3;
    -[_UIButtonBarLayout setDirty:](self, "setDirty:", 1);
  }
}

- (void)setItemViewGenerator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (_UIButtonBarItemLayout)initWithLayoutMetrics:(id)a3 barButtonItem:(id)a4
{
  id v7;
  _UIButtonBarItemLayout *v8;
  _UIButtonBarItemLayout *v9;
  uint64_t v10;
  UIView *itemView;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIButtonBarItemLayout;
  v8 = -[_UIButtonBarLayout initWithLayoutMetrics:](&v13, sel_initWithLayoutMetrics_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_item, a4);
    -[UIBarButtonItem view](v9->_item, "view");
    v10 = objc_claimAutoreleasedReturnValue();
    itemView = v9->_itemView;
    v9->_itemView = (UIView *)v10;

  }
  return v9;
}

- (BOOL)suppressSpacing
{
  return self->_suppressSpacing;
}

- (BOOL)shouldHorizontallyCenterView:(id)a3
{
  _UITAMICAdaptorView *itemViewWrapper;

  itemViewWrapper = self->_itemViewWrapper;
  if (!itemViewWrapper)
    itemViewWrapper = (_UITAMICAdaptorView *)self->_itemView;
  return itemViewWrapper == a3 && -[UIBarButtonItem _wantsThreeUp](self->_item, "_wantsThreeUp");
}

- (id)barButtonItem
{
  return self->_item;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemViewGenerator, 0);
  objc_storeStrong((id *)&self->_popoverGuideHeight, 0);
  objc_storeStrong((id *)&self->_popoverGuideTop, 0);
  objc_storeStrong((id *)&self->_popoverGuideTrailing, 0);
  objc_storeStrong((id *)&self->_popoverGuideLeading, 0);
  objc_storeStrong((id *)&self->_groupSameSize, 0);
  objc_storeStrong((id *)&self->_maximumAlignmentSize, 0);
  objc_storeStrong((id *)&self->_requestedSize, 0);
  objc_storeStrong((id *)&self->_itemViewWrapper, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (_UIButtonBarItemLayout)initWithLayoutMetrics:(id)a3
{
  -[_UIButtonBarItemLayout doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  UIBarButtonItem *item;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_UIButtonBarItemLayout;
  -[_UIButtonBarLayout description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (self->_groupSameSize)
    objc_msgSend(v4, "appendString:", CFSTR(" usesGroupSizing"));
  item = self->_item;
  -[UIBarButtonItem view](item, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" item=%p view=%p requestedSize=%p maximumAlignmentSize=%p groupSameSize=%p"), item, v6, self->_requestedSize, self->_maximumAlignmentSize, self->_groupSameSize);

  return v4;
}

- (BOOL)useGroupSizing
{
  return self->_useGroupSizing;
}

- (void)setSuppressSpacing:(BOOL)a3
{
  self->_suppressSpacing = a3;
}

- (id)itemViewGenerator
{
  return self->_itemViewGenerator;
}

@end
