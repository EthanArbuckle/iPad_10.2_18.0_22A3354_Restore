@implementation _UITAMICAdaptorView

- (void)layoutSubviews
{
  objc_super v3;

  self->_inLayout = 1;
  v3.receiver = self;
  v3.super_class = (Class)_UITAMICAdaptorView;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_view, "setFrame:");
  self->_inLayout = 0;
}

- (UIView)view
{
  return self->_view;
}

- (void)setSizingPriority:(float)a3
{
  double v4;

  if (self->_sizingPriority != a3)
  {
    self->_sizingPriority = a3;
    -[NSLayoutConstraint setPriority:](self->_width, "setPriority:");
    *(float *)&v4 = self->_sizingPriority;
    -[NSLayoutConstraint setPriority:](self->_height, "setPriority:", v4);
  }
}

- (_UITAMICAdaptorView)initWithView:(id)a3
{
  id v6;
  _UITAMICAdaptorView *v7;
  _UITAMICAdaptorView *v8;
  void *v9;
  uint64_t v10;
  NSLayoutConstraint *width;
  float sizingPriority;
  double v13;
  void *v14;
  uint64_t v15;
  NSLayoutConstraint *height;
  double v17;
  void *v19;
  objc_super v20;

  v6 = a3;
  if ((objc_msgSend(v6, "translatesAutoresizingMaskIntoConstraints") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UITAMICAdaptorView.m"), 50, CFSTR("_UITAMICAdaptorView only works with views that have .translatesAutoresizingMaskIntoConstraints=YES (%@)"), v6);

  }
  objc_msgSend(v6, "frame");
  v20.receiver = self;
  v20.super_class = (Class)_UITAMICAdaptorView;
  v7 = -[UIView initWithFrame:](&v20, sel_initWithFrame_);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_view, a3);
    -[UIView addSubview:](v8, "addSubview:", v8->_view);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setAutoresizesSubviews:](v8, "setAutoresizesSubviews:", 0);
    v8->_sizingPriority = 900.0;
    -[UIView widthAnchor](v8, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToConstant:", 0.0);
    v10 = objc_claimAutoreleasedReturnValue();
    width = v8->_width;
    v8->_width = (NSLayoutConstraint *)v10;

    sizingPriority = v8->_sizingPriority;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "contentCompressionResistancePriorityForAxis:", 0);
      *(float *)&v13 = fmaxf(*(float *)&v13, 51.0);
      if (*(float *)&v13 <= 999.0)
        sizingPriority = *(float *)&v13;
      else
        sizingPriority = 999.0;
    }
    *(float *)&v13 = sizingPriority;
    -[NSLayoutConstraint setPriority:](v8->_width, "setPriority:", v13);
    -[NSLayoutConstraint setActive:](v8->_width, "setActive:", 1);
    -[UIView heightAnchor](v8, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToConstant:", 0.0);
    v15 = objc_claimAutoreleasedReturnValue();
    height = v8->_height;
    v8->_height = (NSLayoutConstraint *)v15;

    *(float *)&v17 = v8->_sizingPriority;
    -[NSLayoutConstraint setPriority:](v8->_height, "setPriority:", v17);
    -[NSLayoutConstraint setActive:](v8->_height, "setActive:", 1);
  }

  return v8;
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a4;
  if (self->_view == v5 && !self->_inLayout)
  {
    v6 = v5;
    -[_UITAMICAdaptorView updateForAvailableSize](self, "updateForAvailableSize");
    v5 = v6;
  }

}

+ (BOOL)shouldWrapView:(id)a3
{
  id v3;
  BOOL v4;
  char v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  int v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  int v16;
  char v17;

  v3 = a3;
  if ((objc_msgSend(v3, "_hasLayoutArrangements") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    if (UIApp)
    {
      v5 = 0;
    }
    else
    {
      v6 = *MEMORY[0x1E0C9D820];
      v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
      objc_msgSend(v3, "systemLayoutSizeFittingSize:", *MEMORY[0x1E0C9D820], v7);
      v9 = v8;
      v11 = v10;
      v12 = objc_msgSend(v3, "_wantsAutolayout");
      v13 = v11 == v7 && v9 == v6;
      if (v12)
        v5 = v13;
      else
        v5 = 0;
    }
    objc_msgSend(v3, "_constraintsExceptingSubviewAutoresizingConstraints");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    v16 = objc_msgSend(v3, "translatesAutoresizingMaskIntoConstraints");
    if (v15)
      v17 = v5;
    else
      v17 = 1;
    if (v16)
      v4 = v17;
    else
      v4 = 0;
  }

  return v4;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height;
  double width;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[_UITAMICAdaptorView _updateTraitsAndLayoutSizeIfNecessary](self, "_updateTraitsAndLayoutSizeIfNecessary");
  v14.receiver = self;
  v14.super_class = (Class)_UITAMICAdaptorView;
  *(float *)&v10 = a4;
  *(float *)&v11 = a5;
  -[UIView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v14, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v10, v11);
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)_updateTraitsAndLayoutSizeIfNecessary
{
  void *v3;

  if ((*((_QWORD *)&self->super._viewFlags + 1) & 0x800000000000) != 0)
  {
    -[UIView _window](self, "_window");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[UIView updateTraitsIfNeeded](self, "updateTraitsIfNeeded");
      -[_UITAMICAdaptorView updateForAvailableSize](self, "updateForAvailableSize");
    }
  }
}

- (void)didMoveToWindow
{
  id v3;

  -[UIView window](self, "window");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UITAMICAdaptorView updateForAvailableSize](self, "updateForAvailableSize");
    -[UIView _addGeometryChangeObserver:](&self->_view->super.super.isa, self);
  }
  else
  {
    -[UIView _removeGeometryChangeObserver:](&self->_view->super.super.isa, self);
  }

}

- (void)updateForAvailableSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  id WeakRetained;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v19;

  self->_inLayout = 1;
  -[UIView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v19 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "availableSizeForAdaptor:proposedSize:", self, v4, v6);
    v4 = v8;
    v6 = v9;
  }
  -[UIView systemLayoutSizeFittingSize:](self->_view, "systemLayoutSizeFittingSize:", v4, v6);
  v11 = v10;
  v13 = v12;
  -[UIView frame](self->_view, "frame");
  if (v14 >= v11)
    v16 = v14;
  else
    v16 = v11;
  if (v15 >= v13)
    v17 = v15;
  else
    v17 = v13;
  if (v16 != self->_layoutSize.width || v17 != self->_layoutSize.height)
  {
    self->_layoutSize.width = v16;
    self->_layoutSize.height = v17;
    -[NSLayoutConstraint setConstant:](self->_width, "setConstant:");
    -[NSLayoutConstraint setConstant:](self->_height, "setConstant:", self->_layoutSize.height);
  }
  self->_inLayout = 0;

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_height, 0);
  objc_storeStrong((id *)&self->_width, 0);
  objc_storeStrong((id *)&self->_view, 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  -[_UITAMICAdaptorView _updateTraitsAndLayoutSizeIfNecessary](self, "_updateTraitsAndLayoutSizeIfNecessary", a3.width, a3.height);
  width = self->_layoutSize.width;
  height = self->_layoutSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (float)sizingPriority
{
  return self->_sizingPriority;
}

- (_UITAMICAdaptorViewDelegate)delegate
{
  return (_UITAMICAdaptorViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

@end
