@implementation PREditingAmbientColorPickerViewController

- (PREditingAmbientColorPickerViewController)initWithColorPickerConfiguration:(id)a3 width:(double)a4 changeHandler:(id)a5
{
  id v9;
  id v10;
  PREditingAmbientColorPickerViewController *v11;
  PREditingAmbientColorPickerViewController *v12;
  uint64_t v13;
  id changeHandler;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v9 = a3;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PREditingAmbientColorPickerViewController;
  v11 = -[PREditingAmbientColorPickerViewController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_colorPickerConfiguration, a3);
    v13 = objc_msgSend(v10, "copy");
    changeHandler = v12->_changeHandler;
    v12->_changeHandler = (id)v13;

    -[PREditingAmbientColorPickerViewController setPreferredContentSize:](v12, "setPreferredContentSize:", a4, 64.0);
    objc_msgSend(v9, "prompt");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[PREditingAmbientColorPickerViewController setTitle:](v12, "setTitle:", v15);
    }
    else
    {
      PRBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("EDIT_COLOR_PICKER_DEFAULT_PROMPT"), &stru_1E2186E08, CFSTR("PosterKit"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PREditingAmbientColorPickerViewController setTitle:](v12, "setTitle:", v17);

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
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  PREditorColorPickerConstantColor *v15;
  PREditingColorItem *v16;
  PREditingColorItemView *v17;
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
  id v46;
  id obj;
  id obja;
  id v49;
  PREditingAmbientColorPickerViewController *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[8];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v46 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v3 = objc_alloc_init(MEMORY[0x1E0DC3C28]);
  objc_msgSend(v3, "setContentInset:", 0.0, 20.0, 20.0, 20.0);
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "setShowsHorizontalScrollIndicator:", 0);
  v45 = v3;
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v4, "setAxis:", 0);
  objc_msgSend(v4, "setAlignment:", 1);
  objc_msgSend(v4, "setSpacing:", 14.0);
  v5 = v4;
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v50 = self;
  -[PREditingAmbientColorPickerViewController colorPickerConfiguration](self, "colorPickerConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedColor");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = objc_msgSend(v6, "context");
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v44 = v6;
  objc_msgSend(v6, "colorPalette");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "colors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v53;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v53 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v13);
        v15 = -[PREditorColorPickerConstantColor initWithColor:initialVariation:]([PREditorColorPickerConstantColor alloc], "initWithColor:initialVariation:", v14, 0.0);
        v16 = -[PREditingColorItem initWithPickerColor:variation:context:]([PREditingColorItem alloc], "initWithPickerColor:variation:context:", v15, v7, 0.0);
        v17 = -[PREditingColorItemView initWithColorItem:]([PREditingColorItemView alloc], "initWithColorItem:", v16);
        if (v51 && objc_msgSend(v14, "isEquivalentToColor:", v51))
          -[PRSelectableEditingItemView setSelected:](v17, "setSelected:", 1);
        objc_msgSend(v49, "addObject:", v17);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v50, sel_didTapColorItemView_);
        -[PREditingColorItemView addGestureRecognizer:](v17, "addGestureRecognizer:", v18);
        objc_msgSend(v5, "addArrangedSubview:", v17);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
    }
    while (v11);
  }

  objc_msgSend(v45, "addSubview:", v5);
  objc_msgSend(v46, "addSubview:", v45);
  v34 = (void *)MEMORY[0x1E0CB3718];
  objc_msgSend(v5, "leadingAnchor");
  obja = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(obja, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v42;
  objc_msgSend(v5, "trailingAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "trailingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v39;
  objc_msgSend(v5, "topAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v56[2] = v36;
  objc_msgSend(v5, "bottomAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v56[3] = v32;
  objc_msgSend(v46, "leadingAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "leadingAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v56[4] = v29;
  objc_msgSend(v46, "trailingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "trailingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintEqualToAnchor:", v27);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v56[5] = v19;
  objc_msgSend(v46, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v56[6] = v22;
  objc_msgSend(v46, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "bottomAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v56[7] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "activateConstraints:", v26);

  -[PREditingAmbientColorPickerViewController setView:](v50, "setView:", v46);
}

- (void)didTapColorItemView:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditingAmbientColorPickerViewController didSelectColorItem:](self, "didSelectColorItem:", v4);
  -[PREditingAmbientColorPickerViewController selectedItemView](self, "selectedItemView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", 0);

  objc_msgSend(v6, "setSelected:", 1);
  -[PREditingAmbientColorPickerViewController setSelectedItemView:](self, "setSelectedItemView:", v6);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditingAmbientColorPickerViewController;
  -[PREditingAmbientColorPickerViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[PREditingAmbientColorPickerViewController setNeedsScrollToSelectedItem:](self, "setNeedsScrollToSelectedItem:", 1);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PREditingAmbientColorPickerViewController;
  -[PREditingAmbientColorPickerViewController viewDidLayoutSubviews](&v4, sel_viewDidLayoutSubviews);
  if (-[PREditingAmbientColorPickerViewController needsScrollToSelectedItem](self, "needsScrollToSelectedItem"))
  {
    -[PREditingAmbientColorPickerViewController stackView](self, "stackView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layoutIfNeeded");

    -[PREditingAmbientColorPickerViewController scrollToSelectedItemAnimated:](self, "scrollToSelectedItemAnimated:", 0);
    -[PREditingAmbientColorPickerViewController setNeedsScrollToSelectedItem:](self, "setNeedsScrollToSelectedItem:", 0);
  }
}

- (void)didSelectColorItem:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  objc_msgSend(a3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "color");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[PREditingAmbientColorPickerViewController changeHandler](self, "changeHandler");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id))v5)[2](v5, v6);

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
  -[PREditingAmbientColorPickerViewController selectedItemView](self, "selectedItemView");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[PREditingAmbientColorPickerViewController scrollView](self, "scrollView");
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
  -[PREditingAmbientColorPickerViewController scrollView](self, "scrollView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setContentOffset:animated:", v3, v16, v6);

}

- (PREditorColorPickerConfiguration)colorPickerConfiguration
{
  return self->_colorPickerConfiguration;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (PREditingColorItemView)selectedItemView
{
  return self->_selectedItemView;
}

- (void)setSelectedItemView:(id)a3
{
  objc_storeStrong((id *)&self->_selectedItemView, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
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
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_selectedItemView, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong((id *)&self->_colorPickerConfiguration, 0);
}

@end
