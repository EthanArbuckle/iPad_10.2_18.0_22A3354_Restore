@implementation WFGlyphPicker

- (WFGlyphPicker)initWithControl:(int64_t)a3 glyphDimension:(double)a4 sectionInset:(UIEdgeInsets)a5
{
  return -[WFGlyphPicker initWithControl:glyphDimension:sectionInset:useSystemGlyphsOnly:useOutlineGlyphsOnly:](self, "initWithControl:glyphDimension:sectionInset:useSystemGlyphsOnly:useOutlineGlyphsOnly:", a3, 0, 0, a4, a5.top, a5.left, a5.bottom, a5.right);
}

- (WFGlyphPicker)initWithControl:(int64_t)a3 glyphDimension:(double)a4 sectionInset:(UIEdgeInsets)a5 useSystemGlyphsOnly:(BOOL)a6 useOutlineGlyphsOnly:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  WFGlyphPicker *v15;
  WFGlyphPicker *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  void *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  WFGlyphPickerCollectionView *v27;
  WFGlyphPickerCollectionView *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  UISegmentedControl *v38;
  UISegmentedControl *segmentedControl;
  UISegmentedControl *v40;
  WFGlyphPickerTabBar *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  WFGlyphPickerTabBar *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  UISegmentedControl *v64;
  void *v65;
  void *v66;
  void *v67;
  WFGlyphPicker *v68;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  UISegmentedControl *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  id v92;
  objc_super v93;
  _QWORD v94[7];
  _QWORD v95[3];
  _QWORD v96[8];
  _QWORD v97[5];

  v7 = a7;
  v8 = a6;
  right = a5.right;
  bottom = a5.bottom;
  left = a5.left;
  top = a5.top;
  v97[3] = *MEMORY[0x24BDAC8D0];
  v93.receiver = self;
  v93.super_class = (Class)WFGlyphPicker;
  v15 = -[WFGlyphPicker init](&v93, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_control = a3;
    v15->_glyphDimension = a4;
    v15->_sectionInset.top = top;
    v15->_sectionInset.left = left;
    v15->_sectionInset.bottom = bottom;
    v15->_sectionInset.right = right;
    v15->_useOutlineGlyphsOnly = v7;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGlyphPicker setBackgroundColor:](v16, "setBackgroundColor:", v17);

    v18 = (void *)objc_opt_new();
    v19 = 0;
    v20 = v8 && v7;
    while (v19 < objc_msgSend((id)objc_opt_class(), "numberOfSections"))
    {
      if (v20)
      {
        WFSystemOutlineGlyphCharactersInSection();
        v21 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v8)
          WFSystemGlyphCharactersInSection();
        else
          WFGlyphCharactersInSection();
        v21 = objc_claimAutoreleasedReturnValue();
      }
      v22 = (void *)v21;
      objc_msgSend(v18, "addObject:", v21);

      ++v19;
    }
    objc_storeStrong((id *)&v16->_glyphSections, v18);
    v23 = objc_alloc_init(MEMORY[0x24BEBD488]);
    -[WFGlyphPicker glyphDimension](v16, "glyphDimension");
    v25 = v24;
    -[WFGlyphPicker glyphDimension](v16, "glyphDimension");
    objc_msgSend(v23, "setItemSize:", v25, v26);
    objc_msgSend(v23, "setMinimumLineSpacing:", 4.0);
    objc_msgSend(v23, "setMinimumInteritemSpacing:", 4.0);
    objc_msgSend(v23, "setScrollDirection:", 1);
    -[WFGlyphPicker sectionInset](v16, "sectionInset");
    objc_msgSend(v23, "setSectionInset:");
    objc_storeWeak((id *)&v16->_collectionViewLayout, v23);
    v27 = [WFGlyphPickerCollectionView alloc];
    v28 = -[WFGlyphPickerCollectionView initWithFrame:collectionViewLayout:](v27, "initWithFrame:collectionViewLayout:", v23, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[WFGlyphPickerCollectionView setTranslatesAutoresizingMaskIntoConstraints:](v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[WFGlyphPickerCollectionView setDelegate:](v28, "setDelegate:", v16);
    -[WFGlyphPickerCollectionView setDataSource:](v28, "setDataSource:", v16);
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGlyphPickerCollectionView setBackgroundColor:](v28, "setBackgroundColor:", v29);

    -[WFGlyphPickerCollectionView setShowsHorizontalScrollIndicator:](v28, "setShowsHorizontalScrollIndicator:", 0);
    -[WFGlyphPickerCollectionView registerClass:forCellWithReuseIdentifier:](v28, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("Cell"));
    -[WFGlyphPicker addSubview:](v16, "addSubview:", v28);
    objc_storeWeak((id *)&v16->_collectionView, v28);
    -[WFGlyphPicker safeAreaLayoutGuide](v16, "safeAreaLayoutGuide");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[WFGlyphPicker control](v16, "control");
    if (v31)
    {
      if (v31 != 1)
      {
LABEL_16:
        v68 = v16;

        goto LABEL_17;
      }
      v92 = v23;
      v32 = objc_alloc(MEMORY[0x24BEBD938]);
      WFNameForGlyphSection();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v95[0] = v33;
      WFNameForGlyphSection();
      v34 = v30;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v95[1] = v35;
      WFNameForGlyphSection();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v95[2] = v36;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v95, 3);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (UISegmentedControl *)objc_msgSend(v32, "initWithItems:", v37);

      v30 = v34;
      -[UISegmentedControl addTarget:action:forControlEvents:](v38, "addTarget:action:forControlEvents:", v16, sel_pickedSegment_, 4096);
      -[UISegmentedControl setSelectedSegmentIndex:](v38, "setSelectedSegmentIndex:", 0);
      -[UISegmentedControl setTranslatesAutoresizingMaskIntoConstraints:](v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[WFGlyphPicker addSubview:](v16, "addSubview:", v38);
      segmentedControl = v16->_segmentedControl;
      v16->_segmentedControl = v38;
      v40 = v38;

      v72 = (void *)MEMORY[0x24BDD1628];
      -[UISegmentedControl topAnchor](v40, "topAnchor");
      v41 = (WFGlyphPickerTabBar *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "topAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGlyphPickerTabBar constraintEqualToAnchor:](v41, "constraintEqualToAnchor:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v94[0] = v43;
      -[UISegmentedControl leadingAnchor](v40, "leadingAnchor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leadingAnchor");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = v44;
      objc_msgSend(v44, "constraintEqualToAnchor:constant:", 16.0);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v94[1] = v89;
      -[UISegmentedControl trailingAnchor](v40, "trailingAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "trailingAnchor");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      v88 = v45;
      objc_msgSend(v45, "constraintEqualToAnchor:constant:", -16.0);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v94[2] = v86;
      -[WFGlyphPickerCollectionView topAnchor](v28, "topAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v40;
      -[UISegmentedControl bottomAnchor](v40, "bottomAnchor");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      v85 = v46;
      objc_msgSend(v46, "constraintEqualToAnchor:");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v94[3] = v83;
      -[WFGlyphPickerCollectionView leadingAnchor](v28, "leadingAnchor");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "leadingAnchor");
      v82 = v47;
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "constraintEqualToAnchor:");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v94[4] = v79;
      -[WFGlyphPickerCollectionView trailingAnchor](v28, "trailingAnchor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "trailingAnchor");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v78 = v48;
      objc_msgSend(v48, "constraintEqualToAnchor:");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v94[5] = v76;
      -[WFGlyphPickerCollectionView bottomAnchor](v28, "bottomAnchor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "bottomAnchor");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = v49;
      objc_msgSend(v49, "constraintEqualToAnchor:");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v94[6] = v50;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v94, 7);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v72, "activateConstraints:", v51);
    }
    else
    {
      v92 = v23;
      v52 = [WFGlyphPickerTabBar alloc];
      WFNameForGlyphSection();
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v97[0] = v53;
      WFNameForGlyphSection();
      v54 = v30;
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v97[1] = v55;
      WFNameForGlyphSection();
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v97[2] = v56;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v97, 3);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[WFGlyphPickerTabBar initWithTabNames:tabCharacters:](v52, "initWithTabNames:tabCharacters:", v57, &unk_24E631820);

      -[WFGlyphPickerTabBar setTranslatesAutoresizingMaskIntoConstraints:](v41, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[WFGlyphPickerTabBar setDelegate:](v41, "setDelegate:", v16);
      -[WFGlyphPicker addSubview:](v16, "addSubview:", v41);
      objc_storeWeak((id *)&v16->_tabBar, v41);
      v73 = (void *)MEMORY[0x24BDD1628];
      -[WFGlyphPickerCollectionView topAnchor](v28, "topAnchor");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "topAnchor");
      v71 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "constraintEqualToAnchor:", v71);
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      v96[0] = v91;
      -[WFGlyphPickerCollectionView leadingAnchor](v28, "leadingAnchor");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "leadingAnchor");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v58;
      objc_msgSend(v58, "constraintEqualToAnchor:");
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      v96[1] = v88;
      -[WFGlyphPickerCollectionView trailingAnchor](v28, "trailingAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "trailingAnchor");
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v59;
      objc_msgSend(v59, "constraintEqualToAnchor:");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v96[2] = v85;
      -[WFGlyphPickerCollectionView bottomAnchor](v28, "bottomAnchor");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGlyphPickerTabBar topAnchor](v41, "topAnchor");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      v84 = v60;
      objc_msgSend(v60, "constraintEqualToAnchor:");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v96[3] = v82;
      -[WFGlyphPickerTabBar leadingAnchor](v41, "leadingAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "leadingAnchor");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = v61;
      objc_msgSend(v61, "constraintEqualToAnchor:");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v96[4] = v78;
      -[WFGlyphPickerTabBar trailingAnchor](v41, "trailingAnchor");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "trailingAnchor");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v62;
      objc_msgSend(v62, "constraintEqualToAnchor:");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v96[5] = v75;
      -[WFGlyphPickerTabBar bottomAnchor](v41, "bottomAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "bottomAnchor");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = v63;
      objc_msgSend(v63, "constraintEqualToAnchor:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v96[6] = v51;
      -[WFGlyphPickerCollectionView trailingAnchor](v28, "trailingAnchor");
      v64 = (UISegmentedControl *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "trailingAnchor");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = v64;
      -[UISegmentedControl constraintEqualToAnchor:](v64, "constraintEqualToAnchor:", v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v96[7] = v66;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v96, 8);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "activateConstraints:", v67);

      v30 = v54;
      v42 = v70;

      v43 = (void *)v71;
    }

    v23 = v92;
    goto LABEL_16;
  }
LABEL_17:

  return v16;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFGlyphPicker;
  -[WFGlyphPicker layoutSubviews](&v7, sel_layoutSubviews);
  -[WFGlyphPicker collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForSelectedItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFGlyphPicker collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v5, 0, 16);

  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WFGlyphPicker;
  v4 = a3;
  -[WFGlyphPicker traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  -[WFGlyphPicker traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __42__WFGlyphPicker_traitCollectionDidChange___block_invoke;
    v8[3] = &unk_24E604D88;
    v8[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "performWithoutAnimation:", v8);
  }
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFGlyphPicker;
  -[WFGlyphPicker safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[WFGlyphPicker setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSelectedGlyphCharacter:(unsigned __int16)a3
{
  void *v4;
  id v5;

  self->_selectedGlyphCharacter = a3;
  -[WFGlyphPicker indexPathForGlyphCharacter:](self, "indexPathForGlyphCharacter:");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[WFGlyphPicker collectionView](self, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectItemAtIndexPath:animated:scrollPosition:", v5, 0, 16);

  }
}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFGlyphPicker glyphSections](self, "glyphSections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[WFGlyphPicker glyphSections](self, "glyphSections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("Cell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[WFGlyphPicker glyphCharacterAtIndexPath:](self, "glyphCharacterAtIndexPath:", v6);

  objc_msgSend(v7, "setGlyphCharacter:", v8);
  objc_msgSend(v7, "setOutline:", -[WFGlyphPicker useOutlineGlyphsOnly](self, "useOutlineGlyphsOnly"));
  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;

  self->_selectedGlyphCharacter = -[WFGlyphPicker glyphCharacterAtIndexPath:](self, "glyphCharacterAtIndexPath:", a4);
  -[WFGlyphPicker delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "glyphPicker:didSelectGlyphWithCharacter:", self, self->_selectedGlyphCharacter);

}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!-[WFGlyphPicker lastEvent](self, "lastEvent"))
  {
    v7 = (void *)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v6, "indexPathsForVisibleItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v12), "section"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "allObjects");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __67__WFGlyphPicker_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke;
    v21[3] = &unk_24E603420;
    v22 = v7;
    v15 = v7;
    objc_msgSend(v14, "sortedArrayUsingComparator:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    v19 = -[WFGlyphPicker control](self, "control");
    if (v19 == 1)
    {
      -[WFGlyphPicker segmentedControl](self, "segmentedControl");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setSelectedSegmentIndex:", v18);
    }
    else
    {
      if (v19)
      {
LABEL_14:

        goto LABEL_15;
      }
      -[WFGlyphPicker tabBar](self, "tabBar");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setSelectedTabIndex:", v18);
    }

    goto LABEL_14;
  }
LABEL_15:

}

- (void)scrollViewDidScroll:(id)a3
{
  -[WFGlyphPicker setLastEvent:](self, "setLastEvent:", 0);
}

- (unsigned)glyphCharacterAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[WFGlyphPicker glyphSections](self, "glyphSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "item");
  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v4) = objc_msgSend(v8, "unsignedIntegerValue");

  return (unsigned __int16)v4;
}

- (id)indexPathForGlyphCharacter:(unsigned __int16)a3
{
  void *v4;
  id v5;
  _QWORD v7[5];
  unsigned __int16 v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  -[WFGlyphPicker glyphSections](self, "glyphSections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__WFGlyphPicker_indexPathForGlyphCharacter___block_invoke;
  v7[3] = &unk_24E603448;
  v8 = a3;
  v7[4] = &v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  v5 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v5;
}

- (void)pickedSegment:(id)a3
{
  -[WFGlyphPicker scrollToSection:](self, "scrollToSection:", objc_msgSend(a3, "selectedSegmentIndex"));
  -[WFGlyphPicker setLastEvent:](self, "setLastEvent:", 1);
}

- (void)glyphPickerTabBar:(id)a3 didSelectTabAtIndex:(unint64_t)a4
{
  -[WFGlyphPicker scrollToSection:](self, "scrollToSection:", a4);
  -[WFGlyphPicker setLastEvent:](self, "setLastEvent:", 2);
}

- (void)scrollToSection:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "shouldReverseLayoutDirection"))
    v6 = 32;
  else
    v6 = 8;

  -[WFGlyphPicker collectionView](self, "collectionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scrollToItemAtIndexPath:atScrollPosition:animated:", v7, v6, 0);

}

- (WFGlyphPickerDelegate)delegate
{
  return (WFGlyphPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unsigned)selectedGlyphCharacter
{
  return self->_selectedGlyphCharacter;
}

- (UISegmentedControl)segmentedControl
{
  return self->_segmentedControl;
}

- (void)setSegmentedControl:(id)a3
{
  objc_storeStrong((id *)&self->_segmentedControl, a3);
}

- (UIEdgeInsets)sectionInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionInset.top;
  left = self->_sectionInset.left;
  bottom = self->_sectionInset.bottom;
  right = self->_sectionInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSectionInset:(UIEdgeInsets)a3
{
  self->_sectionInset = a3;
}

- (double)glyphDimension
{
  return self->_glyphDimension;
}

- (void)setGlyphDimension:(double)a3
{
  self->_glyphDimension = a3;
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (void)setCollectionView:(id)a3
{
  objc_storeWeak((id *)&self->_collectionView, a3);
}

- (UICollectionViewFlowLayout)collectionViewLayout
{
  return (UICollectionViewFlowLayout *)objc_loadWeakRetained((id *)&self->_collectionViewLayout);
}

- (void)setCollectionViewLayout:(id)a3
{
  objc_storeWeak((id *)&self->_collectionViewLayout, a3);
}

- (NSArray)glyphSections
{
  return self->_glyphSections;
}

- (void)setGlyphSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (int64_t)control
{
  return self->_control;
}

- (void)setControl:(int64_t)a3
{
  self->_control = a3;
}

- (WFGlyphPickerTabBar)tabBar
{
  return (WFGlyphPickerTabBar *)objc_loadWeakRetained((id *)&self->_tabBar);
}

- (void)setTabBar:(id)a3
{
  objc_storeWeak((id *)&self->_tabBar, a3);
}

- (BOOL)useOutlineGlyphsOnly
{
  return self->_useOutlineGlyphsOnly;
}

- (void)setUseOutlineGlyphsOnly:(BOOL)a3
{
  self->_useOutlineGlyphsOnly = a3;
}

- (int64_t)lastEvent
{
  return self->_lastEvent;
}

- (void)setLastEvent:(int64_t)a3
{
  self->_lastEvent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_glyphSections, 0);
  objc_destroyWeak((id *)&self->_collectionViewLayout);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_segmentedControl, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __44__WFGlyphPicker_indexPathForGlyphCharacter___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = *(unsigned __int16 *)(a1 + 40);
  v9 = a2;
  objc_msgSend(v7, "numberWithUnsignedShort:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "indexOfObject:", v10);

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForItem:inSection:", v11, a3);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a4 = 1;
  }
}

uint64_t __67__WFGlyphPicker_collectionView_willDisplayCell_forItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "countForObject:", a2);
  v8 = objc_msgSend(*(id *)(a1 + 32), "countForObject:", v6);

  return v7 - v8;
}

void __42__WFGlyphPicker_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "collectionView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadData");

}

+ (unint64_t)numberOfSections
{
  return 3;
}

@end
