@implementation UIInputSwitcherSegmentControl

- (UIInputSwitcherSegmentControl)initWithFrame:(CGRect)a3
{
  UIInputSwitcherSegmentControl *v3;
  UIStackView *v4;
  uint64_t v5;
  UIStackView *stackView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIInputSwitcherSegmentControl;
  v3 = -[UIControl initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [UIStackView alloc];
    v5 = -[UIStackView initWithArrangedSubviews:](v4, "initWithArrangedSubviews:", MEMORY[0x1E0C9AA60]);
    stackView = v3->_stackView;
    v3->_stackView = (UIStackView *)v5;

    -[UIStackView setAxis:](v3->_stackView, "setAxis:", 0);
    -[UIStackView setDistribution:](v3->_stackView, "setDistribution:", 1);
    -[UIStackView setAlignment:](v3->_stackView, "setAlignment:", 3);
    -[UIStackView setSpacing:](v3->_stackView, "setSpacing:", 9.0);
    -[UIView setSemanticContentAttribute:](v3->_stackView, "setSemanticContentAttribute:", 2);
    -[UIView addSubview:](v3, "addSubview:", v3->_stackView);
  }
  return v3;
}

- (void)setSelectedSegmentIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;

  self->_selectedSegmentIndex = a3;
  -[UIInputSwitcherSegmentControl stackView](self, "stackView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = 0;
    do
    {
      -[UIInputSwitcherSegmentControl stackView](self, "stackView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "arrangedSubviews");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "setSelected:", a3 == v8);
      ++v8;
      -[UIInputSwitcherSegmentControl stackView](self, "stackView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "arrangedSubviews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

    }
    while (v8 < v14);
  }
  -[UIControl sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 4096);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIInputSwitcherSegmentControl;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_stackView, "setFrame:");
}

- (void)_removeAllSegmentViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[UIInputSwitcherSegmentControl stackView](self, "stackView", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[UIInputSwitcherSegmentControl stackView](self, "stackView");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "removeArrangedSubview:", v9);

        objc_msgSend(v9, "removeFromSuperview");
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)_populateSegmentViewsWithCount:(unint64_t)a3
{
  unint64_t v3;
  double v5;
  double v6;
  double v7;
  double v8;
  UIInputSwitcherTableCellSegmentView *v9;
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

  if (a3)
  {
    v3 = a3;
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    do
    {
      v9 = -[UIInputSwitcherTableCellSegmentView initWithFrame:]([UIInputSwitcherTableCellSegmentView alloc], "initWithFrame:", v5, v6, v7, v8);
      -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIInputSwitcherSegmentControl stackView](self, "stackView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addArrangedSubview:", v9);

      -[UIInputSwitcherTableCellSegmentView backgroundView](v9, "backgroundView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setRoundedCorners:", -1);

      -[UIInputSwitcherTableCellSegmentView setUsesDarkTheme:](v9, "setUsesDarkTheme:", -[UIInputSwitcherSegmentControl usesDarkTheme](self, "usesDarkTheme"));
      -[UIView topAnchor](v9, "topAnchor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputSwitcherSegmentControl stackView](self, "stackView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "topAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "constraintEqualToAnchor:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setActive:", 1);

      -[UIView bottomAnchor](v9, "bottomAnchor");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIInputSwitcherSegmentControl stackView](self, "stackView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bottomAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "constraintEqualToAnchor:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setActive:", 1);

      --v3;
    }
    while (v3);
  }
}

- (void)setSegmentTitles:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[UIInputSwitcherSegmentControl _removeAllSegmentViews](self, "_removeAllSegmentViews");
  -[UIInputSwitcherSegmentControl _populateSegmentViewsWithCount:](self, "_populateSegmentViewsWithCount:", objc_msgSend(v4, "count"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__UIInputSwitcherSegmentControl_setSegmentTitles___block_invoke;
  v5[3] = &unk_1E16B8630;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __50__UIInputSwitcherSegmentControl_setSegmentTitles___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "stackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrangedSubviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v5);

}

- (void)setSegmentImages:(id)a3
{
  id v4;
  _QWORD v5[5];

  v4 = a3;
  -[UIInputSwitcherSegmentControl _removeAllSegmentViews](self, "_removeAllSegmentViews");
  -[UIInputSwitcherSegmentControl _populateSegmentViewsWithCount:](self, "_populateSegmentViewsWithCount:", objc_msgSend(v4, "count"));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__UIInputSwitcherSegmentControl_setSegmentImages___block_invoke;
  v5[3] = &unk_1E16CD558;
  v5[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void __50__UIInputSwitcherSegmentControl_setSegmentImages___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "stackView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrangedSubviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "imageView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v5);

}

- (void)updateSelectionWithPoint:(CGPoint)a3
{
  double x;
  double v5;
  unint64_t v6;

  x = a3.x;
  -[UIView bounds](self, "bounds", a3.x, a3.y);
  v6 = (uint64_t)(x / (v5 / (double)-[UIInputSwitcherSegmentControl numberOfSegments](self, "numberOfSegments")));
  if (-[UIInputSwitcherSegmentControl numberOfSegments](self, "numberOfSegments") > v6)
    -[UIInputSwitcherSegmentControl setSelectedSegmentIndex:](self, "setSelectedSegmentIndex:", v6);
}

- (unint64_t)numberOfSegments
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[UIInputSwitcherSegmentControl stackView](self, "stackView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (BOOL)shouldTrack
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInView:", self);
  -[UIInputSwitcherSegmentControl updateSelectionWithPoint:](self, "updateSelectionWithPoint:");

  v9.receiver = self;
  v9.super_class = (Class)UIInputSwitcherSegmentControl;
  -[UIControl touchesBegan:withEvent:](&v9, sel_touchesBegan_withEvent_, v7, v6);

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locationInView:", self);
  -[UIInputSwitcherSegmentControl updateSelectionWithPoint:](self, "updateSelectionWithPoint:");

  v9.receiver = self;
  v9.super_class = (Class)UIInputSwitcherSegmentControl;
  -[UIControl touchesMoved:withEvent:](&v9, sel_touchesMoved_withEvent_, v7, v6);

}

- (int64_t)selectedSegmentIndex
{
  return self->_selectedSegmentIndex;
}

- (NSArray)segmentTitles
{
  return self->_segmentTitles;
}

- (NSArray)segmentImages
{
  return self->_segmentImages;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (BOOL)usesDarkTheme
{
  return self->_usesDarkTheme;
}

- (void)setUsesDarkTheme:(BOOL)a3
{
  self->_usesDarkTheme = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_segmentImages, 0);
  objc_storeStrong((id *)&self->_segmentTitles, 0);
}

@end
