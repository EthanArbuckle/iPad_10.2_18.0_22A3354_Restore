@implementation STHorizontallySegmentedView

- (STHorizontallySegmentedView)initWithVibrancy:(BOOL)a3 maximumNumberOfLines:(unint64_t)a4 truncateLabels:(BOOL)a5
{
  STHorizontallySegmentedView *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STHorizontallySegmentedView;
  v8 = -[STHorizontallySegmentedView initWithFrame:](&v10, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v8->_useVibrancy = a3;
  v8->_maximumNumberOfLines = a4;
  v8->_truncateLabels = a5;
  -[STHorizontallySegmentedView _stHorizontallySegmentedViewCommonInit](v8, "_stHorizontallySegmentedViewCommonInit");
  return v8;
}

- (STHorizontallySegmentedView)initWithCoder:(id)a3
{
  STHorizontallySegmentedView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STHorizontallySegmentedView;
  v3 = -[STHorizontallySegmentedView initWithCoder:](&v5, sel_initWithCoder_, a3);
  -[STHorizontallySegmentedView _stHorizontallySegmentedViewCommonInit](v3, "_stHorizontallySegmentedViewCommonInit");
  return v3;
}

- (void)_stHorizontallySegmentedViewCommonInit
{
  NSNumber *numberOfLines;
  NSArray *segmentItems;
  NSArray *v5;
  NSMutableArray *v6;
  NSMutableArray *segmentViews;
  NSArray *segmentConstraints;

  numberOfLines = self->_numberOfLines;
  self->_numberOfLines = (NSNumber *)&unk_24DBBE988;

  self->_previousWidth = 0.0;
  segmentItems = self->_segmentItems;
  v5 = (NSArray *)MEMORY[0x24BDBD1A8];
  self->_segmentItems = (NSArray *)MEMORY[0x24BDBD1A8];

  v6 = (NSMutableArray *)objc_opt_new();
  segmentViews = self->_segmentViews;
  self->_segmentViews = v6;

  segmentConstraints = self->_segmentConstraints;
  self->_segmentConstraints = v5;

}

- (STHorizontallySegmentedView)init
{
  return -[STHorizontallySegmentedView initWithVibrancy:maximumNumberOfLines:truncateLabels:](self, "initWithVibrancy:maximumNumberOfLines:truncateLabels:", 0, 0, 0);
}

- (void)setSegmentItems:(id)a3
{
  NSArray *v4;
  NSArray *segmentItems;
  BOOL v6;
  NSArray *v7;
  NSArray *v8;
  BOOL v9;
  BOOL v10;
  void *v11;
  unint64_t v12;
  id v13;
  unint64_t v14;
  void *v15;
  NSArray *v16;
  _QWORD v17[4];
  id v18;
  STHorizontallySegmentedView *v19;
  unint64_t v20;
  BOOL v21;
  BOOL v22;

  v4 = (NSArray *)a3;
  segmentItems = self->_segmentItems;
  if (segmentItems != v4)
  {
    v16 = v4;
    v6 = -[NSArray isEqualToArray:](segmentItems, "isEqualToArray:", v4);
    v4 = v16;
    if (!v6)
    {
      v7 = (NSArray *)-[NSArray copy](v16, "copy");
      v8 = self->_segmentItems;
      self->_segmentItems = v7;

      v9 = -[STHorizontallySegmentedView useVibrancy](self, "useVibrancy");
      v10 = -[STHorizontallySegmentedView truncateLabels](self, "truncateLabels");
      -[STHorizontallySegmentedView segmentViews](self, "segmentViews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __47__STHorizontallySegmentedView_setSegmentItems___block_invoke;
      v17[3] = &unk_24DB87390;
      v20 = v12;
      v13 = v11;
      v21 = v9;
      v22 = v10;
      v18 = v13;
      v19 = self;
      -[NSArray enumerateObjectsUsingBlock:](v16, "enumerateObjectsUsingBlock:", v17);
      v14 = -[NSArray count](v16, "count");
      if (v12 > v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", v14, v12 - v14);
        objc_msgSend(v13, "enumerateObjectsAtIndexes:options:usingBlock:", v15, 0, &__block_literal_global_10);
        objc_msgSend(v13, "removeObjectsAtIndexes:", v15);

      }
      -[STHorizontallySegmentedView _setUpConstraints](self, "_setUpConstraints");

      v4 = v16;
    }
  }

}

void __47__STHorizontallySegmentedView_setSegmentItems___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  id v6;
  id v7;
  STSegmentView *v8;

  if (*(_QWORD *)(a1 + 48) <= a3)
  {
    v7 = a2;
    v8 = -[STSegmentView initWithItem:useVibrancy:truncateLabels:]([STSegmentView alloc], "initWithItem:useVibrancy:truncateLabels:", v7, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57));

    -[STSegmentView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(*(id *)(a1 + 40), "addSubview:", v8);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
  }
  else
  {
    v5 = *(void **)(a1 + 32);
    v6 = a2;
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v8 = (STSegmentView *)objc_claimAutoreleasedReturnValue();
    -[STSegmentView setItem:](v8, "setItem:", v6);

  }
}

uint64_t __47__STHorizontallySegmentedView_setSegmentItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  objc_super v5;
  CGRect v6;

  if (!-[STHorizontallySegmentedView useVibrancy](self, "useVibrancy"))
  {
    -[STHorizontallySegmentedView previousWidth](self, "previousWidth");
    v4 = v3;
    -[STHorizontallySegmentedView frame](self, "frame");
    if (v4 != CGRectGetWidth(v6))
      -[STHorizontallySegmentedView _setUpConstraints](self, "_setUpConstraints");
  }
  v5.receiver = self;
  v5.super_class = (Class)STHorizontallySegmentedView;
  -[STHorizontallySegmentedView layoutSubviews](&v5, sel_layoutSubviews);
}

- (void)_setUpConstraints
{
  void *v2;
  double Width;
  unint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
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
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  _QWORD v71[4];
  id v72;
  id v73;
  STHorizontallySegmentedView *v74;
  id v75;
  _QWORD *v76;
  uint64_t *v77;
  int64x2_t v78;
  unint64_t v79;
  double v80;
  _QWORD v81[4];
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  uint64_t v91;
  CGRect v92;

  v91 = *MEMORY[0x24BDAC8D0];
  -[STHorizontallySegmentedView segmentViews](self, "segmentViews");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "firstObject");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v68;
  if (v68)
  {
    -[STHorizontallySegmentedView frame](self, "frame");
    Width = CGRectGetWidth(v92);
    -[STHorizontallySegmentedView setPreviousWidth:](self, "setPreviousWidth:");
    v4 = -[STHorizontallySegmentedView maximumNumberOfLines](self, "maximumNumberOfLines");
    if (v4 == 1 || Width <= 0.0)
      Width = 1.79769313e308;
    v6 = (void *)objc_opt_new();
    objc_msgSend(v68, "topAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STHorizontallySegmentedView topAnchor](self, "topAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

    objc_msgSend(v68, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STHorizontallySegmentedView leadingAnchor](self, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v12);

    v82 = 0;
    v83 = &v82;
    v84 = 0x2020000000;
    v85 = 1;
    v81[0] = 0;
    v81[1] = v81;
    v81[2] = 0x2020000000;
    *(double *)&v81[3] = Width;
    v13 = (void *)objc_opt_new();
    v14 = objc_msgSend(v69, "count");
    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15E0]), "initWithIndexesInRange:", 1, v14 - 1);
    v71[0] = MEMORY[0x24BDAC760];
    v71[1] = 3221225472;
    v71[2] = __48__STHorizontallySegmentedView__setUpConstraints__block_invoke;
    v71[3] = &unk_24DB873F8;
    v16 = v69;
    v78 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    v72 = v16;
    v76 = v81;
    v77 = &v82;
    v17 = v6;
    v73 = v17;
    v74 = self;
    v18 = v13;
    v75 = v18;
    v79 = v4;
    v80 = Width;
    objc_msgSend(v16, "enumerateObjectsAtIndexes:options:usingBlock:", v15, 0, v71);
    v66 = (void *)v15;
    objc_msgSend(v16, "lastObject");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v83[3] == 1 && v14 == 2)
    {
      v19 = (void *)objc_opt_new();
      -[STHorizontallySegmentedView addLayoutGuide:](self, "addLayoutGuide:", v19);
      objc_msgSend(v18, "addObject:", v19);
      objc_msgSend(v19, "topAnchor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "topAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v22);

      objc_msgSend(v19, "leadingAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "trailingAnchor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v25);

      objc_msgSend(v19, "bottomAnchor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "bottomAnchor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "constraintEqualToAnchor:", v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v28);

      v29 = (void *)objc_opt_new();
      -[STHorizontallySegmentedView addLayoutGuide:](self, "addLayoutGuide:", v29);
      objc_msgSend(v18, "addObject:", v29);
      objc_msgSend(v29, "topAnchor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "topAnchor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "constraintEqualToAnchor:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v32);

      objc_msgSend(v29, "leadingAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "trailingAnchor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v35);

      objc_msgSend(v29, "bottomAnchor");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "bottomAnchor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "constraintEqualToAnchor:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v38);

      objc_msgSend(v29, "bottomAnchor");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[STHorizontallySegmentedView bottomAnchor](self, "bottomAnchor");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "constraintEqualToAnchor:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v41);

      objc_msgSend(v29, "trailingAnchor");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[STHorizontallySegmentedView trailingAnchor](self, "trailingAnchor");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "constraintEqualToAnchor:", v43);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v44);

    }
    else
    {
      objc_msgSend(v67, "bottomAnchor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[STHorizontallySegmentedView bottomAnchor](self, "bottomAnchor");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "constraintEqualToAnchor:", v46);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v47);

      objc_msgSend(v67, "trailingAnchor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[STHorizontallySegmentedView trailingAnchor](self, "trailingAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "constraintEqualToAnchor:", v29);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addObject:", v42);
    }

    v48 = v18;
    v49 = v17;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v89 = 0u;
    v50 = v48;
    v51 = 0;
    v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
    if (v52)
    {
      v53 = *(_QWORD *)v87;
      do
      {
        v54 = 0;
        v55 = v51;
        do
        {
          if (*(_QWORD *)v87 != v53)
            objc_enumerationMutation(v50);
          v51 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v54);
          objc_msgSend(v51, "widthAnchor");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "constraintGreaterThanOrEqualToConstant:", 8.0);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "addObject:", v57);

          if (v55)
          {
            objc_msgSend(v55, "widthAnchor");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "widthAnchor");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v58, "constraintEqualToAnchor:", v59);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "addObject:", v60);

            v61 = v51;
          }
          else
          {
            v62 = v51;
          }
          ++v54;
          v55 = v51;
        }
        while (v52 != v54);
        v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v86, v90, 16);
      }
      while (v52);
    }

    v63 = (void *)MEMORY[0x24BDD1628];
    -[STHorizontallySegmentedView segmentConstraints](self, "segmentConstraints");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "deactivateConstraints:", v64);

    objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v49);
    -[STHorizontallySegmentedView setSegmentConstraints:](self, "setSegmentConstraints:", v49);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v83[3]);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[STHorizontallySegmentedView setNumberOfLines:](self, "setNumberOfLines:", v65);

    _Block_object_dispose(v81, 8);
    _Block_object_dispose(&v82, 8);

    v2 = v68;
  }

}

void __48__STHorizontallySegmentedView__setUpConstraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
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
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  double v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
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
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3 - 1;
  v7 = v5;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeThatFits:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  v10 = v9;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                          + 24)
                                                              - (v9
                                                               + 8.0);
  objc_msgSend(v7, "sizeThatFits:", *(double *)(a1 + 80), *(double *)(a1 + 88));
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) >= v11)
  {
    objc_msgSend(v8, "widthAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToConstant:", v10);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v44) = 1144750080;
    objc_msgSend(v43, "setPriority:", v44);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v43);
    v45 = a1;
    v46 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(v45 + 48), "addLayoutGuide:", v46);
    objc_msgSend(*(id *)(v45 + 56), "addObject:", v46);
    v47 = *(void **)(v45 + 40);
    objc_msgSend(v46, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToAnchor:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v50);

    v51 = *(void **)(v45 + 40);
    objc_msgSend(v46, "leadingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trailingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintEqualToAnchor:", v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "addObject:", v54);

    v55 = *(void **)(v45 + 40);
    objc_msgSend(v46, "bottomAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v57);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "addObject:", v58);

    v59 = *(void **)(v45 + 40);
    objc_msgSend(v7, "topAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "topAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "addObject:", v62);

    v63 = *(void **)(v45 + 40);
    objc_msgSend(v7, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "trailingAnchor");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "constraintEqualToAnchor:", v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "addObject:", v66);

    v67 = *(void **)(v45 + 40);
    objc_msgSend(v7, "bottomAnchor");
    v68 = v8;
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "bottomAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "constraintEqualToAnchor:", v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "addObject:", v71);

  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
    v12 = *(void **)(a1 + 40);
    objc_msgSend(v7, "topAnchor");
    v13 = a1;
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 2.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v16);

    v17 = *(void **)(v13 + 40);
    v75 = v7;
    objc_msgSend(v7, "leadingAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v13 + 48), "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObject:", v20);

    v21 = *(void **)(v13 + 40);
    v74 = v8;
    objc_msgSend(v8, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v13 + 48), "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v24);

    v25 = *(void **)(v13 + 56);
    v73 = v13;
    v26 = *(void **)(v13 + 40);
    v27 = v25;
    v28 = v26;
    v76 = 0u;
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
    if (v29)
    {
      v30 = v29;
      v31 = 0;
      v32 = *(_QWORD *)v77;
      do
      {
        v33 = 0;
        v34 = v31;
        do
        {
          if (*(_QWORD *)v77 != v32)
            objc_enumerationMutation(v27);
          v31 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v33);
          objc_msgSend(v31, "widthAnchor");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "constraintGreaterThanOrEqualToConstant:", 8.0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v36);

          if (v34)
          {
            objc_msgSend(v34, "widthAnchor");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "widthAnchor");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "constraintEqualToAnchor:", v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "addObject:", v39);

            v40 = v31;
          }
          else
          {
            v41 = v31;
          }
          ++v33;
          v34 = v31;
        }
        while (v30 != v33);
        v30 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
      }
      while (v30);
    }
    else
    {
      v31 = 0;
    }

    objc_msgSend(*(id *)(v73 + 56), "removeAllObjects");
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v73 + 72) + 8) + 24) == *(_QWORD *)(v73 + 96))
      v72 = 0x7FEFFFFFFFFFFFFFLL;
    else
      v72 = *(_QWORD *)(v73 + 104);
    v68 = v74;
    v7 = v75;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v73 + 64) + 8) + 24) = v72;
  }

}

- (NSArray)segmentItems
{
  return self->_segmentItems;
}

- (NSNumber)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(id)a3
{
  objc_storeStrong((id *)&self->_numberOfLines, a3);
}

- (unint64_t)maximumNumberOfLines
{
  return self->_maximumNumberOfLines;
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (BOOL)truncateLabels
{
  return self->_truncateLabels;
}

- (double)previousWidth
{
  return self->_previousWidth;
}

- (void)setPreviousWidth:(double)a3
{
  self->_previousWidth = a3;
}

- (NSMutableArray)segmentViews
{
  return self->_segmentViews;
}

- (NSArray)segmentConstraints
{
  return self->_segmentConstraints;
}

- (void)setSegmentConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentConstraints, 0);
  objc_storeStrong((id *)&self->_segmentViews, 0);
  objc_storeStrong((id *)&self->_numberOfLines, 0);
  objc_storeStrong((id *)&self->_segmentItems, 0);
}

@end
