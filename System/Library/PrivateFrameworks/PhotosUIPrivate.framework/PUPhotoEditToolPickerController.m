@implementation PUPhotoEditToolPickerController

- (PUPhotoEditToolPickerController)initWithLayoutDirection:(int64_t)a3 style:(int64_t)a4 blurredBackground:(BOOL)a5
{
  PUPhotoEditToolPickerController *v8;
  PUPhotoEditToolPickerController *v9;
  PUPhotoEditToolPickerSpec *v10;
  PUPhotoEditToolPickerSpec *toolPickerSpec;
  PUPhotoEditToolPickerController *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PUPhotoEditToolPickerController;
  v8 = -[PUPhotoEditToolPickerController initWithNibName:bundle:](&v14, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    v8->_layoutDirection = a3;
    v8->_style = a4;
    v10 = objc_alloc_init(PUPhotoEditToolPickerSpec);
    toolPickerSpec = v9->_toolPickerSpec;
    v9->_toolPickerSpec = v10;

    v9->_blurredBackground = a5;
    v12 = v9;
  }

  return v9;
}

- (void)loadView
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v6 = (id)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PUPhotoEditToolPickerController setView:](self, "setView:", v6);
  if (-[PUPhotoEditToolPickerController blurredBackground](self, "blurredBackground"))
  {
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithBlurRadius:", 12.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v4);
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "setClipsToBounds:", 1);
    objc_msgSend(v6, "addSubview:", v5);
    -[PUPhotoEditToolPickerController setBlurEffectView:](self, "setBlurEffectView:", v5);

  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotoEditToolPickerController;
  -[PUPhotoEditToolPickerController viewDidLoad](&v3, sel_viewDidLoad);
  -[PUPhotoEditToolPickerController setLayoutDirection:](self, "setLayoutDirection:", self->_layoutDirection);
}

- (void)setLayoutDirection:(int64_t)a3
{
  id v3;

  self->_layoutDirection = a3;
  -[PUPhotoEditToolPickerController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setNeedsUpdateConstraints");

}

- (void)setStyle:(int64_t)a3
{
  id v3;

  if (self->_style != a3)
  {
    self->_style = a3;
    -[PUPhotoEditToolPickerController view](self, "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNeedsUpdateConstraints");

  }
}

- (void)setToolButtons:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  NSArray *toolButtons;
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
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  id v25;
  void *v26;
  id v27;
  PUPhotoEditToolPickerController *val;
  _QWORD v29[4];
  id v30[5];
  id location;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  val = self;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v4 = self->_toolButtons;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v37 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "removeFromSuperview", v27);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v5);
  }

  v8 = objc_msgSend(v27, "copy");
  toolButtons = val->_toolButtons;
  val->_toolButtons = (NSArray *)v8;

  -[PUPhotoEditToolPickerController toolPickerSpec](val, "toolPickerSpec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "toolButtonPointerInteractionHighlightPadding");

  PXEdgeInsetsMake();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[PUPhotoEditToolPickerController contentView](val, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = val->_toolButtons;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v21)
  {
    v22 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v20);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        objc_msgSend(v19, "addSubview:", v24, v27);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v25 = v24;
          objc_initWeak(&location, val);
          v29[0] = MEMORY[0x1E0C809B0];
          v29[1] = 3221225472;
          v29[2] = __50__PUPhotoEditToolPickerController_setToolButtons___block_invoke;
          v29[3] = &unk_1E58A1E58;
          v30[1] = v12;
          v30[2] = v14;
          v30[3] = v16;
          v30[4] = v18;
          objc_copyWeak(v30, &location);
          objc_msgSend(v25, "setPointerStyleProvider:", v29);
          objc_destroyWeak(v30);
          objc_destroyWeak(&location);

        }
      }
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v21);
  }

  -[PUPhotoEditToolPickerController view](val, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setNeedsUpdateConstraints");

}

- (void)setBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_backgroundColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backgroundColor, a3);
    -[PUPhotoEditToolPickerController _updateBackgroundColor](self, "_updateBackgroundColor");
    v5 = v6;
  }

}

- (void)_updateBackgroundColor
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[PUPhotoEditToolPickerController blurredBackground](self, "blurredBackground");
  -[PUPhotoEditToolPickerController backgroundColor](self, "backgroundColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PUPhotoEditToolPickerController blurEffectView](self, "blurEffectView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v6);

    -[PUPhotoEditToolPickerController view](self, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", 0);
  }
  else
  {
    -[PUPhotoEditToolPickerController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v6);

  }
}

- (UIView)contentView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (id)-[PUPhotoEditToolPickerController view](self, "view");
  -[PUPhotoEditToolPickerController blurEffectView](self, "blurEffectView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[PUPhotoEditToolPickerController view](self, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return (UIView *)v8;
}

- (void)updateViewConstraints
{
  PUPhotoEditToolPickerController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
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
  void *v48;
  void *v49;
  void *v50;
  id obj;
  id obja;
  PUPhotoEditToolPickerController *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  objc_super v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  _BYTE v64[128];
  uint64_t v65;

  v2 = self;
  v65 = *MEMORY[0x1E0C80C00];
  -[PUPhotoEditToolPickerController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotoEditToolPickerController toolButtonConstraints](v2, "toolButtonConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PUPhotoEditToolPickerController toolButtonConstraints](v2, "toolButtonConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeConstraints:", v5);

    -[PUPhotoEditToolPickerController setToolButtonConstraints:](v2, "setToolButtonConstraints:", 0);
  }
  v6 = (void *)objc_opt_new();
  -[PUPhotoEditToolPickerController toolButtons](v2, "toolButtons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastObject");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoEditToolPickerController toolPickerSpec](v2, "toolPickerSpec");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[PUPhotoEditToolPickerController toolButtons](v2, "toolButtons");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  v53 = v2;
  if (!v8)
  {
    v10 = 0;
    goto LABEL_24;
  }
  v9 = v8;
  v10 = 0;
  v54 = *(_QWORD *)v60;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      v12 = v10;
      if (*(_QWORD *)v60 != v54)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
      objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      if (-[PUPhotoEditToolPickerController layoutDirection](v2, "layoutDirection"))
      {
        objc_msgSend(v13, "topAnchor");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v12, "bottomAnchor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoEditToolPickerController toolButtons](v2, "toolButtons");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "interToolVerticalSpacingForToolCount:", objc_msgSend(v16, "count"));
          objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v17);

        }
        else
        {
          objc_msgSend(v3, "topAnchor");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "toolParentViewEdgeSpacing");
          objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v16);
        }

        objc_msgSend(v13, "leftAnchor");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "leftAnchor");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "constraintEqualToAnchor:constant:", v21, 23.0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v22);

        objc_msgSend(v13, "rightAnchor");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "rightAnchor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, -23.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v25);

        v2 = v53;
        if (v13 == v57)
        {
          objc_msgSend(v57, "bottomAnchor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "bottomAnchor");
          v27 = objc_claimAutoreleasedReturnValue();
LABEL_19:
          v32 = (void *)v27;
          objc_msgSend(v56, "toolParentViewEdgeSpacing");
          objc_msgSend(v26, "constraintEqualToAnchor:constant:", v32, -v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v34);

        }
      }
      else
      {
        objc_msgSend(v13, "leftAnchor");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v12, "rightAnchor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "interToolSpacing");
        }
        else
        {
          objc_msgSend(v3, "leftAnchor");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "toolParentViewEdgeSpacing");
        }
        objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v28);

        objc_msgSend(v13, "centerYAnchor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "centerYAnchor");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "constraintEqualToAnchor:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v31);

        if (v13 == v57)
        {
          objc_msgSend(v57, "rightAnchor");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "rightAnchor");
          v27 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }
      v10 = v13;

    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  }
  while (v9);
LABEL_24:

  -[PUPhotoEditToolPickerController blurEffectView](v2, "blurEffectView");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[PUPhotoEditToolPickerController blurEffectView](v2, "blurEffectView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "leftAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leftAnchor");
    obja = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "constraintEqualToAnchor:", obja);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v50;
    -[PUPhotoEditToolPickerController blurEffectView](v2, "blurEffectView");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "rightAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rightAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v47);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v45;
    -[PUPhotoEditToolPickerController blurEffectView](v2, "blurEffectView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "topAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v63[2] = v37;
    -[PUPhotoEditToolPickerController blurEffectView](v2, "blurEffectView");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v63[3] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 4);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v42);

    v2 = v53;
  }
  -[PUPhotoEditToolPickerController setToolButtonConstraints:](v2, "setToolButtonConstraints:", v6);
  objc_msgSend(v3, "addConstraints:", v6);
  v58.receiver = v2;
  v58.super_class = (Class)PUPhotoEditToolPickerController;
  -[PUPhotoEditToolPickerController updateViewConstraints](&v58, sel_updateViewConstraints);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PUPhotoEditToolPickerController;
  -[PUPhotoEditToolPickerController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  -[PUPhotoEditToolPickerController toolPickerSpec](self, "toolPickerSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "currentLayoutStyle");

  if (v4 == 4)
  {
    -[PUPhotoEditToolPickerController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerRadius:", 20.0);

    v7 = *MEMORY[0x1E0CD2A68];
    -[PUPhotoEditToolPickerController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCornerCurve:", v7);

    -[PUPhotoEditToolPickerController blurEffectView](self, "blurEffectView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[PUPhotoEditToolPickerController blurEffectView](self, "blurEffectView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCornerRadius:", 20.0);

      -[PUPhotoEditToolPickerController blurEffectView](self, "blurEffectView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCornerCurve:", v7);

    }
  }
}

- (void)setSelectedToolTag:(int64_t)a3
{
  if (-[PUPhotoEditToolPickerController selectedToolTag](self, "selectedToolTag") != a3)
    self->_selectedToolTag = a3;
}

- (void)setParentSpec:(id)a3
{
  id v5;
  void *v6;
  _QWORD v7[5];

  objc_storeStrong((id *)&self->_parentSpec, a3);
  v5 = a3;
  -[PUPhotoEditToolPickerController toolPickerSpec](self, "toolPickerSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PUPhotoEditToolPickerController_setParentSpec___block_invoke;
  v7[3] = &unk_1E58ABD10;
  v7[4] = self;
  objc_msgSend(v6, "performChanges:", v7);

  -[PUPhotoEditToolPickerController updateViewConstraints](self, "updateViewConstraints");
}

- (int64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (int64_t)style
{
  return self->_style;
}

- (NSArray)toolButtons
{
  return self->_toolButtons;
}

- (int64_t)selectedToolTag
{
  return self->_selectedToolTag;
}

- (PUViewControllerSpec)parentSpec
{
  return self->_parentSpec;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (NSArray)toolButtonConstraints
{
  return self->_toolButtonConstraints;
}

- (void)setToolButtonConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_toolButtonConstraints, a3);
}

- (UIView)selectionIndicatorView
{
  return self->_selectionIndicatorView;
}

- (void)setSelectionIndicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_selectionIndicatorView, a3);
}

- (NSArray)selectionIndicatorConstraints
{
  return self->_selectionIndicatorConstraints;
}

- (void)setSelectionIndicatorConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_selectionIndicatorConstraints, a3);
}

- (double)interToolSpacing
{
  return self->_interToolSpacing;
}

- (void)setInterToolSpacing:(double)a3
{
  self->_interToolSpacing = a3;
}

- (PUPhotoEditToolPickerSpec)toolPickerSpec
{
  return self->_toolPickerSpec;
}

- (void)setToolPickerSpec:(id)a3
{
  objc_storeStrong((id *)&self->_toolPickerSpec, a3);
}

- (UIVisualEffectView)blurEffectView
{
  return self->_blurEffectView;
}

- (void)setBlurEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_blurEffectView, a3);
}

- (BOOL)blurredBackground
{
  return self->_blurredBackground;
}

- (void)setBlurredBackground:(BOOL)a3
{
  self->_blurredBackground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurEffectView, 0);
  objc_storeStrong((id *)&self->_toolPickerSpec, 0);
  objc_storeStrong((id *)&self->_selectionIndicatorConstraints, 0);
  objc_storeStrong((id *)&self->_selectionIndicatorView, 0);
  objc_storeStrong((id *)&self->_toolButtonConstraints, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_parentSpec, 0);
  objc_storeStrong((id *)&self->_toolButtons, 0);
}

void __49__PUPhotoEditToolPickerController_setParentSpec___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "toolPickerSpec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTraitCollection:", v3);

  objc_msgSend(*(id *)(a1 + 32), "toolPickerSpec");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1008), "layoutReferenceSize");
  objc_msgSend(v4, "setLayoutReferenceSize:");

}

id __50__PUPhotoEditToolPickerController_setToolButtons___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;

  v5 = a3;
  objc_msgSend(a2, "frame");
  PXEdgeInsetsInsetRect();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = (void *)MEMORY[0x1E0DC3B30];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cornerRadius");
  objc_msgSend(v14, "shapeWithRoundedRect:cornerRadius:", v7, v9, v11, v13, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3B38], "styleWithEffect:shape:", v5, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end
