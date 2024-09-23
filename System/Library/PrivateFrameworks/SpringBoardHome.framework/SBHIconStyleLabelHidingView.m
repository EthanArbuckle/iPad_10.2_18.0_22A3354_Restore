@implementation SBHIconStyleLabelHidingView

- (SBHIconStyleLabelHidingView)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  SBHIconStyleLabelHidingView *v7;
  SBHIconStyleLabelHidingView *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHIconStyleLabelHidingView;
  v7 = -[SBHIconStyleLabelHidingView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v8 = v7;
  if (v7)
  {
    v7->_animationCount = 0;
    -[SBHIconStyleLabelHidingView _setupViewsForTarget:action:](v7, "_setupViewsForTarget:action:", v6, a4);
  }

  return v8;
}

- (void)sizeToFit
{
  -[UISegmentedControl sizeToFit](self->_segmentedControl, "sizeToFit");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UISegmentedControl sizeThatFits:](self->_segmentedControl, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double v5;
  double v6;
  CGSize result;

  -[UISegmentedControl systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self->_segmentedControl, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3.width, a3.height);
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setShouldUseLargeIcons:(BOOL)a3
{
  if (self->_shouldUseLargeIcons != a3)
  {
    -[SBHIconStyleLabelHidingView willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("shouldUseLargeIcons"));
    self->_shouldUseLargeIcons = a3;
    -[SBHIconStyleLabelHidingView didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("shouldUseLargeIcons"));
    -[SBHIconStyleLabelHidingView _layoutSegmentedControl](self, "_layoutSegmentedControl");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHIconStyleLabelHidingView;
  -[SBHIconStyleLabelHidingView layoutSubviews](&v3, sel_layoutSubviews);
  -[SBHIconStyleLabelHidingView _layoutSegmentedControl](self, "_layoutSegmentedControl");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[UISegmentedControl intrinsicContentSize](self->_segmentedControl, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_layoutSegmentedControl
{
  UISegmentedControl *segmentedControl;

  -[UISegmentedControl setSelectedSegmentIndex:](self->_segmentedControl, "setSelectedSegmentIndex:", -[SBHIconStyleLabelHidingView shouldUseLargeIcons](self, "shouldUseLargeIcons"));
  segmentedControl = self->_segmentedControl;
  -[SBHIconStyleLabelHidingView bounds](self, "bounds");
  -[UISegmentedControl setFrame:](segmentedControl, "setFrame:");
}

- (void)_setupViewsForTarget:(id)a3 action:(SEL)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _SBHIconStyleLabelHidingSegmentedControl *v17;
  UISegmentedControl *v18;
  UISegmentedControl *segmentedControl;
  SEL v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  id location;

  v6 = a3;
  if (!self->_segmentedControl)
  {
    v20 = a4;
    objc_initWeak(&location, self);
    v7 = (void *)MEMORY[0x1E0DC3428];
    SBHBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("LABEL_HIDING_VIEW_SMALL"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __59__SBHIconStyleLabelHidingView__setupViewsForTarget_action___block_invoke;
    v23[3] = &unk_1E8D87688;
    objc_copyWeak(&v24, &location);
    objc_msgSend(v7, "actionWithTitle:image:identifier:handler:", v9, 0, 0, v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0DC3428];
    SBHBundle();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("LABEL_HIDING_VIEW_LARGE"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    v21[1] = 3221225472;
    v21[2] = __59__SBHIconStyleLabelHidingView__setupViewsForTarget_action___block_invoke_2;
    v21[3] = &unk_1E8D87688;
    objc_copyWeak(&v22, &location);
    objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v14, 0, 0, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", v11, v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = [_SBHIconStyleLabelHidingSegmentedControl alloc];
    v18 = -[_SBHIconStyleLabelHidingSegmentedControl initWithFrame:actions:](v17, "initWithFrame:actions:", v16, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    segmentedControl = self->_segmentedControl;
    self->_segmentedControl = v18;

    -[UISegmentedControl sizeToFit](self->_segmentedControl, "sizeToFit");
    -[UISegmentedControl addTarget:action:forControlEvents:](self->_segmentedControl, "addTarget:action:forControlEvents:", v6, v20, 4096);
    -[SBHIconStyleLabelHidingView addSubview:](self, "addSubview:", self->_segmentedControl);
    -[UISegmentedControl bounds](self->_segmentedControl, "bounds");
    -[SBHIconStyleLabelHidingView setFrame:](self, "setFrame:");

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

}

void __59__SBHIconStyleLabelHidingView__setupViewsForTarget_action___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateShouldLabelsBeHidden:", 0);

}

void __59__SBHIconStyleLabelHidingView__setupViewsForTarget_action___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateShouldLabelsBeHidden:", 1);

}

- (BOOL)shouldUseLargeIcons
{
  return self->_shouldUseLargeIcons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentedControl, 0);
}

@end
