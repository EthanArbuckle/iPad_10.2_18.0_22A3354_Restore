@implementation PXGadgetSectionHeaderUIView

- (PXGadgetSectionHeaderUIView)initWithFrame:(CGRect)a3
{
  PXGadgetSectionHeaderUIView *v3;
  UIView *v4;
  UIView *divider;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXGadgetSectionHeaderUIView;
  v3 = -[PXGadgetSectionHeaderUIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    divider = v3->_divider;
    v3->_divider = v4;

    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v3->_divider, "setBackgroundColor:", v6);

    -[PXGadgetSectionHeaderUIView addSubview:](v3, "addSubview:", v3->_divider);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, sel_contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)PXGadgetSectionHeaderUIView;
  -[PXGadgetSectionHeaderUIView dealloc](&v4, sel_dealloc);
}

- (void)setHeaderModel:(id)a3
{
  PXGadgetSectionHeader **p_headerModel;
  PXGadgetSectionHeader *v6;
  PXGadgetSectionHeader *v7;
  char v8;
  PXGadgetSectionHeader *v9;
  void *v10;
  void *v11;
  PXGadgetSectionHeader *v12;

  v12 = (PXGadgetSectionHeader *)a3;
  p_headerModel = &self->_headerModel;
  v6 = self->_headerModel;
  if (v6 == v12)
  {

LABEL_7:
    v9 = v12;
    goto LABEL_8;
  }
  v7 = v6;
  v8 = -[PXGadgetSectionHeader isEqual:](v6, "isEqual:", v12);

  v9 = v12;
  if ((v8 & 1) == 0)
  {
    -[PXGadgetSectionHeader unregisterChangeObserver:context:](*p_headerModel, "unregisterChangeObserver:context:", self, PXGadgetSectionHeaderObservationContext);
    objc_storeStrong((id *)&self->_headerModel, a3);
    -[PXGadgetSectionHeader registerChangeObserver:context:](*p_headerModel, "registerChangeObserver:context:", self, PXGadgetSectionHeaderObservationContext);
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 3) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGadgetSectionHeaderUIView setHeaderModel:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXGadgetSectionHeaderUIView.m"), 100, CFSTR("invalidating %lu after it already has been updated"), 3);

      abort();
    }
    self->_updateFlags.needsUpdate |= 3uLL;
    -[PXGadgetSectionHeaderUIView setNeedsLayout](self, "setNeedsLayout");
    goto LABEL_7;
  }
LABEL_8:

}

- (UILabel)titleLabel
{
  UILabel **p_titleLabel;
  UILabel *v4;
  id v5;
  void *v6;

  p_titleLabel = &self->_titleLabel;
  v4 = self->_titleLabel;
  if (!v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3990]);
    v4 = (UILabel *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UILabel setTextAlignment:](v4, "setTextAlignment:", 4);
    -[UILabel setAdjustsFontSizeToFitWidth:](v4, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4, "setTextColor:", v6);

    objc_storeStrong((id *)p_titleLabel, v4);
    -[PXGadgetSectionHeaderUIView addSubview:](self, "addSubview:", v4);
  }
  return v4;
}

- (void)_updateTitle
{
  id v3;

  -[PXGadgetSectionHeaderUIView titleLabel](self, "titleLabel");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGadgetSectionHeaderUIView configureTitleLabel:](self, "configureTitleLabel:", v3);

}

- (void)configureTitleLabel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *v9;
  _BOOL4 IsAccessibilityCategory;
  id v11;

  v11 = a3;
  -[PXGadgetSectionHeaderUIView headerModel](self, "headerModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 1);
    objc_msgSend(v4, "headerFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFont:", v6);

    objc_msgSend(v11, "setHidden:", 0);
    objc_msgSend(v11, "setNumberOfLines:", 1);
    objc_msgSend(v11, "setText:", v5);
    -[PXGadgetSectionHeaderUIView headerModel](self, "headerModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "wantsMultilineTitle"))
    {

LABEL_6:
      objc_msgSend(v11, "setAdjustsFontSizeToFitWidth:", 0);
      objc_msgSend(v11, "setLineBreakMode:", 0);
      objc_msgSend(v11, "setNumberOfLines:", 0);
      goto LABEL_7;
    }
    -[PXGadgetSectionHeaderUIView traitCollection](self, "traitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferredContentSizeCategory");
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9);

    if (IsAccessibilityCategory)
      goto LABEL_6;
  }
  else
  {
    objc_msgSend(v11, "setHidden:", 1);
  }
LABEL_7:

}

- (void)_updateAccessoryButton
{
  id v3;

  -[PXGadgetSectionHeaderUIView accessoryButton](self, "accessoryButton");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGadgetSectionHeaderUIView configureAccessoryButton:](self, "configureAccessoryButton:", v3);

}

- (void)configureAccessoryButton:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id obj;

  obj = a3;
  if (!obj)
  {
    +[PXRightAlignedButton buttonWithType:](PXRightAlignedButton, "buttonWithType:", 1);
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setTag:", 0);
    objc_msgSend(obj, "addTarget:action:forControlEvents:", self, sel__buttonPressed, 64);
    objc_msgSend(obj, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTextAlignment:", 2);

    objc_msgSend(obj, "setContentHorizontalAlignment:", 5);
    objc_msgSend(obj, "setExclusiveTouch:", 1);
    objc_msgSend(obj, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentMode:", 1);

    objc_storeStrong((id *)&self->_accessoryButton, obj);
    -[PXGadgetSectionHeaderUIView accessoryButton](self, "accessoryButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGadgetSectionHeaderUIView addSubview:](self, "addSubview:", v6);

  }
  -[PXGadgetSectionHeaderUIView headerModel](self, "headerModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "shouldShowAccessoryButton");
  if (v8)
  {
    objc_msgSend(v7, "buttonImage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setImage:forState:", v9, 0);

    objc_msgSend(v7, "buttonTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "setTitle:forState:", v10, 0);

    objc_msgSend(v7, "buttonFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(obj, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFont:", v11);

  }
  objc_msgSend(obj, "setHidden:", v8 ^ 1u);

}

- (void)layoutSubviews
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  char v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  char v53;
  objc_super v54;

  v54.receiver = self;
  v54.super_class = (Class)PXGadgetSectionHeaderUIView;
  -[PXGadgetSectionHeaderUIView layoutSubviews](&v54, sel_layoutSubviews);
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGadgetSectionHeaderUIView layoutSubviews]");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("PXGadgetSectionHeaderUIView.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 1;
    self->_updateFlags.updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXGadgetSectionHeaderUIView _updateTitle](self, "_updateTitle");
      if (!self->_updateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGadgetSectionHeaderUIView layoutSubviews]");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("PXGadgetSectionHeaderUIView.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    self->_updateFlags.updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXGadgetSectionHeaderUIView _updateAccessoryButton](self, "_updateAccessoryButton");
      v5 = p_updateFlags->needsUpdate;
    }
    self->_updateFlags.isPerformingUpdate = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGadgetSectionHeaderUIView layoutSubviews]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("PXGadgetSectionHeaderUIView.m"), 193, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  -[PXGadgetSectionHeaderUIView headerModel](self, "headerModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetSectionHeaderUIView headerModel](self, "headerModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "edgeInsets");
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[PXGadgetSectionHeaderUIView titleLabel](self, "titleLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetSectionHeaderUIView accessoryButton](self, "accessoryButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetSectionHeaderUIView divider](self, "divider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGadgetSectionHeaderUIView bounds](self, "bounds");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  if (v15 && (objc_msgSend(v15, "isHidden") & 1) == 0)
  {
    objc_msgSend(v15, "sizeToFit");
    v25 = 1;
  }
  else
  {
    v25 = 0;
  }
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __45__PXGadgetSectionHeaderUIView_layoutSubviews__block_invoke;
  v36[3] = &unk_1E5146358;
  v36[4] = self;
  v37 = v6;
  v53 = v25;
  v41 = v11 + v18;
  v42 = v9 + v20;
  v43 = v22 - (v11 + v13);
  v44 = v24 - (v9 + 0.0);
  v38 = v15;
  v39 = v14;
  v45 = v18;
  v46 = v20;
  v47 = v22;
  v48 = v24;
  v49 = v9;
  v50 = v11;
  v51 = 0;
  v52 = v13;
  v40 = v16;
  v26 = v16;
  v27 = v14;
  v28 = v15;
  v29 = v6;
  +[PXViewLayoutHelper performLayoutWithinView:usingBlock:](PXViewLayoutHelper, "performLayoutWithinView:usingBlock:", self, v36);

}

- (void)_buttonPressed
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  id v5;

  -[PXGadgetSectionHeaderUIView headerModel](self, "headerModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessoryButtonPressed");
  v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  -[PXGadgetSectionHeaderUIView accessoryButton](self, "accessoryButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v3)[2](v3, v4);

}

- (void)contentSizeCategoryDidChangeNotification:(id)a3
{
  id v4;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t updated;
  _BOOL4 willPerformUpdate;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
      goto LABEL_7;
LABEL_5:
    updated = self->_updateFlags.updated;
    if ((updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGadgetSectionHeaderUIView contentSizeCategoryDidChangeNotification:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXGadgetSectionHeaderUIView.m"), 332, CFSTR("invalidating %lu after it already has been updated"), 1);
    }
    else
    {
      p_updateFlags->needsUpdate = needsUpdate | 1;
      if ((updated & 2) == 0)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 3;
        goto LABEL_8;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGadgetSectionHeaderUIView contentSizeCategoryDidChangeNotification:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXGadgetSectionHeaderUIView.m"), 333, CFSTR("invalidating %lu after it already has been updated"), 2);
    }

    abort();
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 3;
  if (!willPerformUpdate)
  {
    v11 = v4;
    -[PXGadgetSectionHeaderUIView setNeedsLayout](self, "setNeedsLayout");
    v4 = v11;
  }
LABEL_8:

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v6 = a4;
  v9 = a3;
  if ((void *)PXGadgetSectionHeaderObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGadgetSectionHeaderUIView.m"), 353, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if ((v6 & 1) != 0)
  {
    if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGadgetSectionHeaderUIView observable:didChange:context:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXGadgetSectionHeaderUIView.m"), 344, CFSTR("invalidating %lu after it already has been updated"), 1);
      goto LABEL_17;
    }
    needsUpdate |= 1uLL;
    p_updateFlags->needsUpdate = needsUpdate;
  }
  if ((v6 & 2) == 0)
  {
    if (!needsUpdate)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (self->_updateFlags.isPerformingUpdate && (self->_updateFlags.updated & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXGadgetSectionHeaderUIView observable:didChange:context:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXGadgetSectionHeaderUIView.m"), 347, CFSTR("invalidating %lu after it already has been updated"), 2);
LABEL_17:

    abort();
  }
  p_updateFlags->needsUpdate = needsUpdate | 2;
LABEL_12:
  v15 = v9;
  -[PXGadgetSectionHeaderUIView setNeedsLayout](self, "setNeedsLayout");
  v9 = v15;
LABEL_13:

}

- (UIButton)accessoryButton
{
  return self->_accessoryButton;
}

- (UIView)divider
{
  return self->_divider;
}

- (PXGadgetSectionHeader)headerModel
{
  return self->_headerModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerModel, 0);
  objc_storeStrong((id *)&self->_divider, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

void __45__PXGadgetSectionHeaderUIView_layoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  NSString *v5;
  _BOOL4 IsAccessibilityCategory;
  void *v7;
  int v8;
  uint64_t v9;
  double v10;
  CGFloat *v11;
  CGFloat *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat *v18;
  uint64_t v19;
  CGFloat *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double MinX;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  _BOOL4 v34;
  double Height;
  void *v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double MaxX;
  double v56;
  double width;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  uint64_t v72;
  CGRect *v73;
  double v74;
  double v75;
  double v76;
  double MaxY;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  void *v83;
  uint64_t v84;
  BOOL v85;
  int v86;
  _BOOL4 v87;
  int v88;
  id v89;
  _OWORD v90[3];
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;
  CGRect v100;
  CGRect v101;
  CGRect v102;
  CGRect v103;

  v89 = a2;
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v5);

  objc_msgSend(*(id *)(a1 + 32), "headerModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "wantsMultilineTitle") | IsAccessibilityCategory;

  v9 = objc_msgSend(*(id *)(a1 + 32), "effectiveUserInterfaceLayoutDirection");
  v88 = objc_msgSend(*(id *)(a1 + 40), "shouldShowDivider");
  v10 = 0.0;
  if (*(_BYTE *)(a1 + 168) && !IsAccessibilityCategory)
  {
    objc_msgSend(*(id *)(a1 + 48), "bounds", 0.0);
    v10 = fmax(CGRectGetWidth(v95), 66.0) + 16.0;
  }
  v11 = (CGFloat *)(a1 + 88);
  v12 = (CGFloat *)(a1 + 96);
  v13 = *(double *)(a1 + 88) - v10;
  objc_msgSend(*(id *)(a1 + 56), "sizeThatFits:", v13, *(double *)(a1 + 96));
  v15 = v14;
  v17 = v16;
  v18 = (CGFloat *)(a1 + 80);
  v19 = *(_QWORD *)(a1 + 80);
  v20 = (CGFloat *)(a1 + 72);
  v21 = *(_QWORD *)(a1 + 72);
  v22 = fmin(v13, v15);
  v23 = *(_QWORD *)(a1 + 88);
  v24 = *(_QWORD *)(a1 + 96);
  if (v9 == 1)
    MinX = CGRectGetMaxX(*(CGRect *)&v21) - v22;
  else
    MinX = CGRectGetMinX(*(CGRect *)&v21);
  objc_msgSend(*(id *)(a1 + 56), "font");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "lineHeight");
  v28 = ceil(v27);

  if (v8)
    v29 = v17;
  else
    v29 = v28;
  objc_msgSend(*(id *)(a1 + 40), "titleBottomSpacing");
  v31 = v30;
  v32 = CGRectGetMaxY(*(CGRect *)(a1 + 72)) - v30;
  if (v8)
  {
    v33 = v32 - v17;
    if (*(_BYTE *)(a1 + 168))
      v34 = IsAccessibilityCategory;
    else
      v34 = 0;
    if (v34)
    {
      objc_msgSend(*(id *)(a1 + 48), "bounds");
      Height = CGRectGetHeight(v96);
      objc_msgSend(*(id *)(a1 + 48), "titleLabel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "_baselineOffsetFromBottom");
      v38 = v33 - (Height - v37);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "_baselineOffsetFromBottom");
      v38 = v33 + v41;
    }
  }
  else
  {
    objc_msgSend(v89, "firstBaselineOfView:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 56), "frame");
    objc_msgSend(v3, "displayScale");
    if (v39 > 0.0)
    {
      objc_msgSend(v3, "displayScale");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "scale");

    }
    PXFloatRoundToPixel();
    v38 = v32 - v42;
  }
  objc_msgSend(*(id *)(a1 + 56), "setFrame:", MinX, v38, v22, v29);
  if (*(_BYTE *)(a1 + 168))
  {
    objc_msgSend(*(id *)(a1 + 48), "bounds");
    v44 = v43;
    v46 = v45;
    v48 = v47;
    v50 = v49;
    v51 = *(_QWORD *)(a1 + 72);
    v52 = *(_QWORD *)(a1 + 80);
    v53 = *(_QWORD *)(a1 + 88);
    v54 = *(_QWORD *)(a1 + 96);
    if (IsAccessibilityCategory)
    {
      if (v9 == 1)
      {
        MaxX = CGRectGetMaxX(*(CGRect *)&v51);
        objc_msgSend(*(id *)(a1 + 48), "bounds");
        v56 = MaxX - CGRectGetWidth(v97);
      }
      else
      {
        v56 = CGRectGetMinX(*(CGRect *)&v51);
      }
      objc_msgSend(*(id *)(a1 + 48), "frame");
      width = v98.size.width;
      v58 = v98.size.height;
      v98.origin.x = v56;
      v59 = CGRectGetHeight(v98);
      objc_msgSend(*(id *)(a1 + 48), "titleLabel");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "_baselineOffsetFromBottom");
      v62 = v59 - v61;

      objc_msgSend(*(id *)(a1 + 48), "setFrame:", v56, CGRectGetMaxY(*(CGRect *)(a1 + 72)) - v31 - v62, width, v58);
    }
    else
    {
      if (v9 == 1)
      {
        v64 = CGRectGetMinX(*(CGRect *)&v51);
      }
      else
      {
        v63 = CGRectGetMaxX(*(CGRect *)&v51);
        objc_msgSend(*(id *)(a1 + 48), "bounds");
        v64 = v63 - CGRectGetWidth(v99);
      }
      objc_msgSend(*(id *)(a1 + 48), "frame");
      v66 = v65;
      v68 = v67;
      objc_msgSend(*(id *)(a1 + 56), "bounds");
      v69 = CGRectGetHeight(v100);
      v101.origin.x = v44;
      v101.origin.y = v46;
      v101.size.width = v48;
      v101.size.height = v50;
      v70 = CGRectGetHeight(v101);
      if (v69 >= v70)
        v71 = v70;
      else
        v71 = v69;
      objc_msgSend(*(id *)(a1 + 48), "setFrame:", v64, v66, v68, v71);
      v90[0] = vdupq_n_s64(0x7FF8000000000000uLL);
      v90[1] = v90[0];
      v90[2] = v90[0];
      v91 = v90[0];
      v92 = v90[0];
      v93 = v90[0];
      v94 = v90[0];
      objc_msgSend(v89, "firstBaselineOfView:", *(_QWORD *)(a1 + 56));
      *(_QWORD *)&v91 = v72;
      objc_msgSend(v89, "layoutView:withAttributes:", *(_QWORD *)(a1 + 48), v90);
    }
  }
  v73 = (CGRect *)(a1 + 104);
  if (v9 != 1)
    v73 = (CGRect *)(a1 + 72);
  v74 = CGRectGetMinX(*v73);
  objc_msgSend(v3, "displayScale");
  v102.origin.y = *v18;
  v102.size.width = *v11;
  v102.size.height = *v12;
  v76 = 1.0 / v75;
  v102.origin.x = *v20;
  MaxY = CGRectGetMaxY(v102);
  if (v88)
  {
    objc_msgSend(v89, "firstBaselineOfView:", *(_QWORD *)(a1 + 56), MaxY);
    v79 = v78;
    objc_msgSend(*(id *)(a1 + 40), "titleHeight");
    v81 = v79 - v80;
  }
  else
  {
    v81 = MaxY - v76;
  }
  v103.origin.x = *v20;
  v103.origin.y = *v18;
  v103.size.width = *v11;
  v103.size.height = *v12;
  v82 = CGRectGetWidth(v103);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v83, "statusBarOrientation");

  if (objc_msgSend(v3, "userInterfaceIdiom"))
    v85 = 0;
  else
    v85 = v84 == 1;
  v86 = v85;
  v87 = objc_msgSend(v3, "userInterfaceIdiom") == 1 && objc_msgSend(v3, "horizontalSizeClass") == 1;
  if ((v86 | v87) == 1)
  {
    v82 = CGRectGetWidth(*(CGRect *)(a1 + 104)) - *(double *)(a1 + 144);
  }
  else if (v9 == 1)
  {
    v74 = *(double *)(a1 + 144);
  }
  objc_msgSend(*(id *)(a1 + 64), "setFrame:", v74, v81, v82, v76);
  objc_msgSend(*(id *)(a1 + 64), "setHidden:", v88 ^ 1u);

}

+ (double)preferredHeightForText:(id)a3 buttonType:(unint64_t)a4 fittingWidth:(double)a5 style:(unint64_t)a6 dividerHidden:(BOOL)a7 isAccessibilitySize:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL8 v9;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v8 = a8;
  v9 = a7;
  v13 = a3;
  +[PXGadgetSectionHeaderUIView _preferredSizeOfButtonWithType:width:](PXGadgetSectionHeaderUIView, "_preferredSizeOfButtonWithType:width:", a4, a5);
  v15 = v14;
  v17 = fmax(v16, 66.0) + 16.0;
  if (v8)
    v17 = 0.0;
  +[PXGadgetSectionHeaderUIView _preferredHeightForText:fittingWidth:style:dividerHidden:](PXGadgetSectionHeaderUIView, "_preferredHeightForText:fittingWidth:style:dividerHidden:", v13, a6, v9, a5 - v17);
  v19 = v18;

  +[PXGadgetSpec sectionHeaderTitleBottomSpacingForStyle:](PXGadgetSpec, "sectionHeaderTitleBottomSpacingForStyle:", a6);
  v21 = v19 + v20;
  if (!v9)
  {
    +[PXGadgetSpec sectionHeaderTopSpacingForStyle:](PXGadgetSpec, "sectionHeaderTopSpacingForStyle:", a6);
    v21 = v21 + v22;
  }
  v23 = -0.0;
  if (v8)
    v23 = v15;
  return v23 + v21;
}

+ (double)_heightThatFitsFirstToLastBaselineWithText:(id)a3 width:(double)a4 font:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v7 = a5;
  v8 = a3;
  +[PXGadgetSectionHeaderUIView _sizingLabel](PXGadgetSectionHeaderUIView, "_sizingLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v7);
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v9, "sizeThatFits:", a4, 0.0);
  v11 = v10;
  objc_msgSend(v7, "lineHeight");
  v13 = v12;

  v14 = llround(v11 / v13);
  objc_msgSend(v9, "_firstBaselineOffsetFromTop");
  v16 = v15;
  objc_msgSend(v9, "_baselineOffsetFromBottom");
  v18 = v11 - (v16 + v17);
  if (v14 == 1)
    v19 = 0.0;
  else
    v19 = v18;

  return v19;
}

+ (double)_preferredHeightForText:(id)a3 fittingWidth:(double)a4 style:(unint64_t)a5 dividerHidden:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v6 = a6;
  v9 = a3;
  if (a5 > 6)
  {
    v10 = 0;
  }
  else
  {
    MEMORY[0x1A85CC970](qword_1A7C0BD90[a5], 32770, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[PXGadgetSpec sectionHeaderTitleHeightForStyle:dividerHidden:](PXGadgetSpec, "sectionHeaderTitleHeightForStyle:dividerHidden:", a5, v6);
  v12 = v11;
  +[PXGadgetSectionHeaderUIView _heightThatFitsFirstToLastBaselineWithText:width:font:](PXGadgetSectionHeaderUIView, "_heightThatFitsFirstToLastBaselineWithText:width:font:", v9, v10, a4);
  v14 = v12 + v13;

  return v14;
}

+ (CGSize)_preferredSizeOfButtonWithType:(unint64_t)a3 width:(double)a4
{
  void *v6;
  void *v7;
  __CFString *v8;
  double v9;
  double v10;
  __CFString *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  if (a3)
  {
    +[PXGadgetSectionHeaderUIView _sizingButton](PXGadgetSectionHeaderUIView, "_sizingButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXGadgetSectionHeader buttonImageForButtonType:](PXGadgetSectionHeader, "buttonImageForButtonType:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 6)
    {
      v11 = CFSTR("Dummy-Text");
    }
    else
    {
      if (a3 == 5)
      {
        v8 = CFSTR("PXGadgetAccessoryButtonTypeClear");
      }
      else
      {
        if (a3 != 1)
        {
          v11 = &stru_1E5149688;
          goto LABEL_11;
        }
        v8 = CFSTR("PXForYouSeeAllGenericButtonTitle");
      }
      PXLocalizedStringFromTable(v8, CFSTR("PhotosUICore"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
LABEL_11:
    objc_msgSend(v6, "setImage:forState:", v7, 0);
    objc_msgSend(v6, "setTitle:forState:", v11, 0);
    objc_msgSend(v6, "sizeThatFits:", a4, 0.0);
    v9 = v12;
    v10 = v13;

    goto LABEL_12;
  }
  v9 = *MEMORY[0x1E0C9D820];
  v10 = *(double *)(MEMORY[0x1E0C9D820] + 8);
LABEL_12:
  v14 = v9;
  v15 = v10;
  result.height = v15;
  result.width = v14;
  return result;
}

+ (id)_sizingLabel
{
  if (_sizingLabel_onceToken != -1)
    dispatch_once(&_sizingLabel_onceToken, &__block_literal_global_290332);
  return (id)_sizingLabel_sharedSizingLabel;
}

+ (id)_sizingButton
{
  if (_sizingButton_onceToken != -1)
    dispatch_once(&_sizingButton_onceToken, &__block_literal_global_171_290330);
  return (id)_sizingButton_sharedSizingButton;
}

+ (id)_accessoryButtonFont
{
  return (id)PXCappedFontWithTextStyle();
}

void __44__PXGadgetSectionHeaderUIView__sizingButton__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  +[PXRightAlignedButton buttonWithType:](PXRightAlignedButton, "buttonWithType:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_sizingButton_sharedSizingButton;
  _sizingButton_sharedSizingButton = v0;

  objc_msgSend((id)_sizingButton_sharedSizingButton, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAdjustsFontForContentSizeCategory:", 1);

  +[PXGadgetSectionHeaderUIView _accessoryButtonFont](PXGadgetSectionHeaderUIView, "_accessoryButtonFont");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_sizingButton_sharedSizingButton, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

}

uint64_t __43__PXGadgetSectionHeaderUIView__sizingLabel__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  v1 = (void *)_sizingLabel_sharedSizingLabel;
  _sizingLabel_sharedSizingLabel = (uint64_t)v0;

  objc_msgSend((id)_sizingLabel_sharedSizingLabel, "setNumberOfLines:", 0);
  return objc_msgSend((id)_sizingLabel_sharedSizingLabel, "setLineBreakMode:", 0);
}

@end
