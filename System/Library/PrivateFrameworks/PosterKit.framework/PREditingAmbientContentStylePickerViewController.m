@implementation PREditingAmbientContentStylePickerViewController

- (PREditingAmbientContentStylePickerViewController)initWithContentStylePickerConfiguration:(id)a3 width:(double)a4 changeHandler:(id)a5
{
  id v9;
  id v10;
  PREditingAmbientContentStylePickerViewController *v11;
  PREditingAmbientContentStylePickerViewController *v12;
  uint64_t v13;
  id changeHandler;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v9 = a3;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PREditingAmbientContentStylePickerViewController;
  v11 = -[PREditingAmbientContentStylePickerViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_stylePickerConfiguration, a3);
    v13 = objc_msgSend(v10, "copy");
    changeHandler = v12->_changeHandler;
    v12->_changeHandler = (id)v13;

    -[PREditingAmbientContentStylePickerViewController setPreferredContentSize:](v12, "setPreferredContentSize:", a4, 84.0);
    objc_msgSend(v9, "prompt");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[PREditingAmbientContentStylePickerViewController setTitle:](v12, "setTitle:", v15);
    }
    else
    {
      PRBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("EDIT_COLOR_PICKER_DEFAULT_PROMPT"), &stru_1E2186E08, CFSTR("PosterKit"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingAmbientContentStylePickerViewController setTitle:](v12, "setTitle:", v17);

    }
  }

  return v12;
}

- (void)loadView
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  PREditingPosterContentStyleCoordinator *v16;
  PREditingContentStyleItemView *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id obj;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[8];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v48 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
  objc_msgSend(v3, "setContentInset:", 20.0, 20.0, 20.0, 20.0);
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v47 = v3;
  objc_storeStrong((id *)&self->_scrollView, v3);
  v4 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v4, "setAxis:", 0);
  objc_msgSend(v4, "setAlignment:", 1);
  objc_msgSend(v4, "setSpacing:", 14.0);
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = v4;
  objc_storeStrong((id *)&self->_stackView, v4);
  -[PREditingAmbientContentStylePickerViewController stylePickerConfiguration](self, "stylePickerConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v6;
  objc_msgSend(v6, "stylePalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "styles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v52;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v52 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v13);
        -[PREditingAmbientContentStylePickerViewController delegate](self, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "coordinatorForContentStyle:forAmbientStylePicker:", v14, self);
        v16 = (PREditingPosterContentStyleCoordinator *)objc_claimAutoreleasedReturnValue();

        if (v16
          || (v16 = -[PREditingPosterContentStyleCoordinator initWithInitialStyle:suggested:]([PREditingPosterContentStyleCoordinator alloc], "initWithInitialStyle:suggested:", v14, 0)) != 0)
        {
          objc_msgSend(v50, "addObject:", v16);
          v17 = -[PREditingContentStyleItemView initWithContentStyleCoordinator:]([PREditingContentStyleItemView alloc], "initWithContentStyleCoordinator:", v16);
          if (v7 && objc_msgSend(v14, "isEqual:", v7))
          {
            -[PRSelectableEditingItemView setSelected:](v17, "setSelected:", 1);
            objc_storeStrong((id *)&self->_selectedItemView, v17);
          }
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapContentStyleItemView_);
          -[PREditingContentStyleItemView addGestureRecognizer:](v17, "addGestureRecognizer:", v18);
          objc_msgSend(v5, "addArrangedSubview:", v17);

        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    }
    while (v11);
  }

  objc_msgSend(v47, "addSubview:", v5);
  objc_msgSend(v48, "addSubview:", v47);
  v35 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v5, "leadingAnchor");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "constraintEqualToAnchor:", v44);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = v43;
  objc_msgSend(v5, "trailingAnchor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "constraintEqualToAnchor:", v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v40;
  v25 = v5;
  objc_msgSend(v5, "topAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55[2] = v37;
  objc_msgSend(v5, "bottomAnchor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v55[3] = v33;
  objc_msgSend(v48, "leadingAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55[4] = v30;
  objc_msgSend(v48, "trailingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v28);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v55[5] = v27;
  objc_msgSend(v48, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v55[6] = v20;
  objc_msgSend(v48, "bottomAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "bottomAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[7] = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "activateConstraints:", v24);

  -[PREditingAmbientContentStylePickerViewController setView:](self, "setView:", v48);
}

- (void)didTapContentStyleItemView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "view");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentStyleCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PREditingAmbientContentStylePickerViewController didSelectStyle:](self, "didSelectStyle:", v5);
  -[PREditingAmbientContentStylePickerViewController selectedItemView](self, "selectedItemView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelected:", 0);

  objc_msgSend(v7, "setSelected:", 1);
  -[PREditingAmbientContentStylePickerViewController setSelectedItemView:](self, "setSelectedItemView:", v7);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditingAmbientContentStylePickerViewController;
  -[PREditingAmbientContentStylePickerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PREditingAmbientContentStylePickerViewController setNeedsScrollToSelectedItem:](self, "setNeedsScrollToSelectedItem:", 1);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditingAmbientContentStylePickerViewController;
  -[PREditingAmbientContentStylePickerViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  if (-[PREditingAmbientContentStylePickerViewController needsScrollToSelectedItem](self, "needsScrollToSelectedItem"))
  {
    -[PREditingAmbientContentStylePickerViewController stackView](self, "stackView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

    -[PREditingAmbientContentStylePickerViewController scrollToSelectedItemAnimated:](self, "scrollToSelectedItemAnimated:", 0);
    -[PREditingAmbientContentStylePickerViewController setNeedsScrollToSelectedItem:](self, "setNeedsScrollToSelectedItem:", 0);
  }
}

- (void)didSelectStyle:(id)a3
{
  id v4;
  void (**v5)(id, id);

  v4 = a3;
  -[PREditingAmbientContentStylePickerViewController changeHandler](self, "changeHandler");
  v5 = (void (**)(id, id))objc_claimAutoreleasedReturnValue();
  v5[2](v5, v4);

}

- (void)scrollToSelectedItemAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;

  v3 = a3;
  v5 = (double *)MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PREditingAmbientContentStylePickerViewController selectedItemView](self, "selectedItemView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditingAmbientContentStylePickerViewController scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  if (v18)
  {
    v9 = v8;
    objc_msgSend(v18, "frame");
    v11 = v10;
    objc_msgSend(v18, "bounds");
    v13 = v11 + (v9 - v12) * -0.5;
    objc_msgSend(v7, "contentSize");
    v15 = v14 - (v9 + -20.0);
    if (v15 >= v13)
      v15 = v13;
    v16 = fmax(v15, -20.0);
  }
  else
  {
    v16 = *v5;
  }
  -[PREditingAmbientContentStylePickerViewController scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentOffset:animated:", v3, v16, v6);

}

- (PREditingAmbientContentStylePickerViewControllerDelegate)delegate
{
  return (PREditingAmbientContentStylePickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (PREditorContentStylePickerConfiguration)stylePickerConfiguration
{
  return self->_stylePickerConfiguration;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (NSArray)styleCoordinators
{
  return self->_styleCoordinators;
}

- (void)setStyleCoordinators:(id)a3
{
  objc_storeStrong((id *)&self->_styleCoordinators, a3);
}

- (PREditingContentStyleItemView)selectedItemView
{
  return self->_selectedItemView;
}

- (void)setSelectedItemView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedItemView, a3);
}

- (PRPosterContentStyle)selectedContentStyle
{
  return self->_selectedContentStyle;
}

- (void)setSelectedContentStyle:(id)a3
{
  objc_storeStrong((id *)&self->_selectedContentStyle, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (BOOL)needsScrollToSelectedItem
{
  return self->_needsScrollToSelectedItem;
}

- (void)setNeedsScrollToSelectedItem:(BOOL)a3
{
  self->_needsScrollToSelectedItem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_selectedContentStyle, 0);
  objc_storeStrong((id *)&self->_selectedItemView, 0);
  objc_storeStrong((id *)&self->_styleCoordinators, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_stylePickerConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
