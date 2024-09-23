@implementation PSGCircleSegmentedControl

- (id)_circleImageWithColor:(id)a3 fillColor:(id)a4 diameter:(double)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  CGFloat v11;
  void *v12;
  void *v13;
  CGSize v15;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;
  v15.width = a5;
  v15.height = a5;
  UIGraphicsBeginImageContextWithOptions(v15, 0, v11);

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPathWithOvalInRect:", 1.0, 1.0, a5 + -2.0, a5 + -2.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "set");
    objc_msgSend(v12, "fill");
  }
  objc_msgSend(v7, "set");
  objc_msgSend(v12, "stroke");
  UIGraphicsGetImageFromCurrentImageContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v13;
}

- (PSGCircleSegmentedControl)init
{
  PSGCircleSegmentedControl *v2;
  uint64_t v3;
  UIImage *activeImage;
  void *v5;
  uint64_t v6;
  UIImage *placeholderImage;
  uint64_t v8;
  PSGCircleSegmentedControl *v9;
  uint64_t v10;
  UIImage *buttonImage;
  PSGCircleSegmentedControl *v12;
  uint64_t v13;
  UIImage *highlightedImage;
  uint64_t v15;
  NSMutableArray *segmentPlaceholders;
  uint64_t v17;
  NSMutableArray *segments;
  uint64_t v19;
  NSMutableArray *selectedSegmentConstraints;
  uint64_t v21;
  NSMutableArray *segmentConstraints;
  uint64_t v23;
  UIStackView *stack;
  id v25;
  uint64_t v26;
  UILabel *label;
  UILabel *v28;
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
  void *v48;
  void *v49;
  double v50;
  void *v51;
  uint64_t v53;
  uint64_t v54;
  id (*v55)(uint64_t);
  void *v56;
  PSGCircleSegmentedControl *v57;
  _QWORD v58[4];
  PSGCircleSegmentedControl *v59;
  id v60;
  id location;
  objc_super v62;

  v62.receiver = self;
  v62.super_class = (Class)PSGCircleSegmentedControl;
  v2 = -[PSGCircleSegmentedControl init](&v62, sel_init);
  if (v2)
  {
    objc_initWeak(&location, v2);
    -[PSGCircleSegmentedControl styleSensitiveImage:](v2, "styleSensitiveImage:", &__block_literal_global_1);
    v3 = objc_claimAutoreleasedReturnValue();
    activeImage = v2->_activeImage;
    v2->_activeImage = (UIImage *)v3;

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.9, 1.0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage size](v2->_activeImage, "size");
    -[PSGCircleSegmentedControl _circleImageWithColor:fillColor:diameter:](v2, "_circleImageWithColor:fillColor:diameter:", v5, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    placeholderImage = v2->_placeholderImage;
    v2->_placeholderImage = (UIImage *)v6;

    v8 = MEMORY[0x24BDAC760];
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = __33__PSGCircleSegmentedControl_init__block_invoke_2;
    v58[3] = &unk_24F9C8138;
    objc_copyWeak(&v60, &location);
    v9 = v2;
    v59 = v9;
    -[PSGCircleSegmentedControl styleSensitiveImage:](v9, "styleSensitiveImage:", v58);
    v10 = objc_claimAutoreleasedReturnValue();
    buttonImage = v9->_buttonImage;
    v9->_buttonImage = (UIImage *)v10;

    v53 = v8;
    v54 = 3221225472;
    v55 = __33__PSGCircleSegmentedControl_init__block_invoke_3;
    v56 = &unk_24F9C8160;
    v12 = v9;
    v57 = v12;
    -[PSGCircleSegmentedControl styleSensitiveImage:](v12, "styleSensitiveImage:", &v53);
    v13 = objc_claimAutoreleasedReturnValue();
    highlightedImage = v12->_highlightedImage;
    v12->_highlightedImage = (UIImage *)v13;

    v15 = objc_opt_new();
    segmentPlaceholders = v12->_segmentPlaceholders;
    v12->_segmentPlaceholders = (NSMutableArray *)v15;

    v17 = objc_opt_new();
    segments = v12->_segments;
    v12->_segments = (NSMutableArray *)v17;

    v19 = objc_opt_new();
    selectedSegmentConstraints = v12->_selectedSegmentConstraints;
    v12->_selectedSegmentConstraints = (NSMutableArray *)v19;

    v21 = objc_opt_new();
    segmentConstraints = v12->_segmentConstraints;
    v12->_segmentConstraints = (NSMutableArray *)v21;

    v23 = objc_opt_new();
    stack = v12->_stack;
    v12->_stack = (UIStackView *)v23;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v12->_stack, "setTranslatesAutoresizingMaskIntoConstraints:", 0, v53, v54, v55, v56);
    -[UIStackView setDistribution:](v12->_stack, "setDistribution:", 3);
    -[UIStackView setAlignment:](v12->_stack, "setAlignment:", 3);
    -[PSGCircleSegmentedControl addSubview:](v12, "addSubview:", v12->_stack);
    v25 = objc_alloc(MEMORY[0x24BEBD708]);
    v26 = objc_msgSend(v25, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    label = v12->_label;
    v12->_label = (UILabel *)v26;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v12->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setTextAlignment:](v12->_label, "setTextAlignment:", 1);
    v28 = v12->_label;
    objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE1D0]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v28, "setFont:", v29);

    -[UILabel setNumberOfLines:](v12->_label, "setNumberOfLines:", 0);
    -[UILabel setAdjustsFontSizeToFitWidth:](v12->_label, "setAdjustsFontSizeToFitWidth:", 1);
    -[PSGCircleSegmentedControl addSubview:](v12, "addSubview:", v12->_label);
    -[UIStackView topAnchor](v12->_stack, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGCircleSegmentedControl topAnchor](v12, "topAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setActive:", 1);

    -[UIStackView leadingAnchor](v12->_stack, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGCircleSegmentedControl leadingAnchor](v12, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

    -[UIStackView trailingAnchor](v12->_stack, "trailingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGCircleSegmentedControl trailingAnchor](v12, "trailingAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setActive:", 1);

    -[UIStackView bottomAnchor](v12->_stack, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel topAnchor](v12->_label, "topAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setActive:", 1);

    -[UILabel leadingAnchor](v12->_label, "leadingAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGCircleSegmentedControl leadingAnchor](v12, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setActive:", 1);

    -[UILabel trailingAnchor](v12->_label, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGCircleSegmentedControl trailingAnchor](v12, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "constraintEqualToAnchor:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setActive:", 1);

    -[UILabel bottomAnchor](v12->_label, "bottomAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGCircleSegmentedControl bottomAnchor](v12, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage size](v2->_activeImage, "size");
    objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, -(v50 + 20.0));
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setActive:", 1);

    objc_destroyWeak(&v60);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __33__PSGCircleSegmentedControl_init__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = (void *)MEMORY[0x24BEBD640];
  PSG_BundleForGeneralSettingsUIFramework();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("HomeButtonSelector-sshb"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flatImageWithColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __33__PSGCircleSegmentedControl_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "size");
  objc_msgSend(WeakRetained, "_circleImageWithColor:fillColor:diameter:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __33__PSGCircleSegmentedControl_init__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "colorWithAlphaComponent:", 0.3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 536), "size");
  objc_msgSend(v2, "_circleImageWithColor:fillColor:diameter:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)styleSensitiveImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PSGCircleSegmentedControl *v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[3];

  v21 = self;
  v31[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)MEMORY[0x24BEBDAB0];
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v4, "traitCollectionWithDisplayScale:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x24BEBD648]);
  v8 = 0;
  v9 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  v10 = 1;
  do
  {
    v11 = v10;
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithUserInterfaceStyle:", *((_QWORD *)&xmmword_22E0592D0 + v8), v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __49__PSGCircleSegmentedControl_styleSensitiveImage___block_invoke;
    v22[3] = &unk_24F9C8188;
    v24 = &v25;
    v13 = v3;
    v23 = v13;
    objc_msgSend(v12, "performAsCurrentTraitCollection:", v22);
    v14 = v26[5];
    v15 = (void *)MEMORY[0x24BEBDAB0];
    v31[0] = v6;
    v31[1] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "traitCollectionWithTraitsFromCollections:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "registerImage:withTraitCollection:", v14, v17);

    v10 = 0;
    v8 = 1;
    v9 = v12;
  }
  while ((v11 & 1) != 0);
  -[PSGCircleSegmentedControl traitCollection](v21, "traitCollection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTraitCollection:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v25, 8);
  return v19;
}

void __49__PSGCircleSegmentedControl_styleSensitiveImage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setPositionConstraintsActive:(BOOL)a3 forButtonAtIndex:(unint64_t)a4
{
  _BOOL8 v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableArray objectAtIndexedSubscript:](self->_segmentConstraints, "objectAtIndexedSubscript:", a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "setActive:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)addSegmentWithTitle:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableArray *segmentConstraints;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BEBD668];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithImage:", self->_placeholderImage);
  -[NSMutableArray addObject:](self->_segmentPlaceholders, "addObject:", v6);
  -[UIStackView addArrangedSubview:](self->_stack, "addArrangedSubview:", v6);
  +[PSGCircleSegment buttonWithType:](PSGCircleSegment, "buttonWithType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:animated:", self->_buttonImage, 0);
  objc_msgSend(v7, "setImage:forState:", self->_highlightedImage, 1);
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v7, "setTitle:forState:", v5, 0);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, sel_segmentTapped_, 0x2000);
  -[NSMutableArray addObject:](self->_segments, "addObject:", v7);
  -[PSGCircleSegmentedControl addSubview:](self, "addSubview:", v7);
  objc_msgSend(v7, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  segmentConstraints = self->_segmentConstraints;
  v16[0] = v10;
  v16[1] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](segmentConstraints, "addObject:", v15);

  -[PSGCircleSegmentedControl setPositionConstraintsActive:forButtonAtIndex:](self, "setPositionConstraintsActive:forButtonAtIndex:", 1, -[NSMutableArray count](self->_segmentConstraints, "count") - 1);
}

- (void)setSelectedSegmentIndex:(unint64_t)a3
{
  PSGCircleSegment *v5;
  PSGCircleSegment **p_selectedSegment;
  uint64_t v7;
  uint64_t v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PSGCircleSegment *v19;
  void *v20;
  void *v21;
  NSMutableArray *selectedSegmentConstraints;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:");
  v5 = (PSGCircleSegment *)objc_claimAutoreleasedReturnValue();
  p_selectedSegment = &self->_selectedSegment;
  if (v5 != self->_selectedSegment)
  {
    v7 = -[NSMutableArray indexOfObject:](self->_segments, "indexOfObject:");
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v7;
      -[PSGCircleSegment setSelected:](*p_selectedSegment, "setSelected:", 0);
      -[PSGCircleSegment setUserInteractionEnabled:](*p_selectedSegment, "setUserInteractionEnabled:", 1);
      -[PSGCircleSegmentedControl setPositionConstraintsActive:forButtonAtIndex:](self, "setPositionConstraintsActive:forButtonAtIndex:", 1, v8);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = self->_selectedSegmentConstraints;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "setActive:", 0);
        }
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v11);
    }

    -[NSMutableArray removeAllObjects](self->_selectedSegmentConstraints, "removeAllObjects");
    objc_storeStrong((id *)&self->_selectedSegment, v5);
    -[PSGCircleSegment setSelected:](*p_selectedSegment, "setSelected:", 1);
    -[PSGCircleSegment setUserInteractionEnabled:](*p_selectedSegment, "setUserInteractionEnabled:", 0);
    -[PSGCircleSegmentedControl setPositionConstraintsActive:forButtonAtIndex:](self, "setPositionConstraintsActive:forButtonAtIndex:", 0, a3);
    selectedSegmentConstraints = self->_selectedSegmentConstraints;
    -[PSGCircleSegment centerXAnchor](*p_selectedSegment, "centerXAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGCircleSegmentedControl centerXAnchor](self, "centerXAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v16;
    -[PSGCircleSegment bottomAnchor](*p_selectedSegment, "bottomAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PSGCircleSegmentedControl bottomAnchor](self, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v18);
    v19 = v5;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v20;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v27, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObjectsFromArray:](selectedSegmentConstraints, "addObjectsFromArray:", v21);

    v5 = v19;
    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", self->_selectedSegmentConstraints);
  }

}

- (void)segmentTapped:(id)a3
{
  unint64_t v4;
  id v5;

  v4 = -[NSMutableArray indexOfObject:](self->_segments, "indexOfObject:", a3);
  if (v4 < -[NSMutableArray count](self->_segments, "count"))
  {
    -[PSGCircleSegmentedControl selectSegmentAtIndex:](self, "selectSegmentAtIndex:", v4);
    -[PSGCircleSegmentedControl delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "segmentedControl:didSelectSegmentAtIndex:", self, v4);

  }
}

- (void)selectSegmentAtIndex:(unint64_t)a3
{
  void *v5;
  PSGCircleSegment *selectedSegment;
  void *v7;
  PSGCircleSegment *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  PSGCircleSegmentedControl *v13;
  unint64_t v14;

  if (-[NSMutableArray indexOfObject:](self->_segments, "indexOfObject:", self->_selectedSegment) != a3)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_segments, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    selectedSegment = self->_selectedSegment;
    v7 = (void *)MEMORY[0x24BEBDB00];
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __50__PSGCircleSegmentedControl_selectSegmentAtIndex___block_invoke;
    v12 = &unk_24F9C7F68;
    v13 = self;
    v14 = a3;
    v8 = selectedSegment;
    objc_msgSend(v7, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, &v9, 0, 0.5, 0.0, 0.7, 0.0);
    objc_msgSend(v5, "setImage:animated:", self->_activeImage, 1, v9, v10, v11, v12, v13, v14);
    -[PSGCircleSegment setImage:animated:](v8, "setImage:animated:", self->_buttonImage, 1);

  }
}

uint64_t __50__PSGCircleSegmentedControl_selectSegmentAtIndex___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSelectedSegmentIndex:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (PSGCircleSegmentedControlDelegate)delegate
{
  return (PSGCircleSegmentedControlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeImage, 0);
  objc_storeStrong((id *)&self->_highlightedImage, 0);
  objc_storeStrong((id *)&self->_buttonImage, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_selectedSegmentConstraints, 0);
  objc_storeStrong((id *)&self->_segmentConstraints, 0);
  objc_storeStrong((id *)&self->_selectedSegment, 0);
  objc_storeStrong((id *)&self->_stack, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_segmentPlaceholders, 0);
}

@end
