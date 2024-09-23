@implementation STBarView

- (STBarView)initWithDataPoint:(id)a3 useVibrancy:(BOOL)a4
{
  id v7;
  STBarView *v8;
  STBarView *v9;
  uint64_t v10;
  UIView *darkenedView;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)STBarView;
  v8 = -[STBarView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v9 = v8;
  if (v8)
  {
    v8->_useVibrancy = a4;
    objc_storeStrong((id *)&v8->_dataPoint, a3);
    -[STBarView setUpSections](v9, "setUpSections");
    v10 = objc_opt_new();
    darkenedView = v9->_darkenedView;
    v9->_darkenedView = (UIView *)v10;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9->_darkenedView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9->_darkenedView, "setBackgroundColor:", v12);

    -[UIView setAlpha:](v9->_darkenedView, "setAlpha:", 0.15);
    -[UIView setHidden:](v9->_darkenedView, "setHidden:", 1);
    -[STBarView addSubview:](v9, "addSubview:", v9->_darkenedView);
    _NSDictionaryOfVariableBindings(CFSTR("_darkenedView"), v9->_darkenedView, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_darkenedView]|"), 0, 0, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1628], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_darkenedView]|"), 0, 0, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activateConstraints:", v17);

    -[STBarView _setContinuousCornerRadius:](v9, "_setContinuousCornerRadius:", 2.0);
    -[STBarView layer](v9, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMaskedCorners:", 3);

    -[STBarView setClipsToBounds:](v9, "setClipsToBounds:", 1);
  }

  return v9;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STBarView;
  -[STBarView traitCollectionDidChange:](&v19, sel_traitCollectionDidChange_, v4);
  if (-[STBarView useVibrancy](self, "useVibrancy"))
  {
    if (!v4
      || (v5 = objc_msgSend(v4, "userInterfaceStyle"),
          -[STBarView traitCollection](self, "traitCollection"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "userInterfaceStyle"),
          v6,
          v5 != v7))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      -[STBarView sectionViews](self, "sectionViews", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
            objc_msgSend(v13, "backgroundColor");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[STUsageColors updateVibrancyStylingForView:withUsageColor:](STUsageColors, "updateVibrancyStylingForView:withUsageColor:", v13, v14);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        }
        while (v10);
      }

    }
  }

}

- (void)setDataPoint:(id)a3
{
  STUsageReportGraphDataPoint *v5;
  STUsageReportGraphDataPoint *dataPoint;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  STUsageReportGraphDataPoint *v11;

  v5 = (STUsageReportGraphDataPoint *)a3;
  dataPoint = self->_dataPoint;
  if (dataPoint != v5)
  {
    v11 = v5;
    -[STUsageReportGraphDataPoint segments](dataPoint, "segments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    -[STUsageReportGraphDataPoint segments](v11, "segments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    objc_storeStrong((id *)&self->_dataPoint, a3);
    if (v8 == v10)
      -[STBarView setUpSectionHeightConstraints](self, "setUpSectionHeightConstraints");
    else
      -[STBarView setUpSections](self, "setUpSections");
    v5 = v11;
  }

}

- (void)setColor:(id)a3
{
  UIColor *v4;
  UIColor *color;
  char v6;
  UIColor *v7;
  UIColor *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  UIColor *v13;
  _QWORD v14[4];
  UIColor *v15;
  id v16;
  STBarView *v17;

  v4 = (UIColor *)a3;
  color = self->_color;
  if (color != v4)
  {
    v13 = v4;
    v6 = -[UIColor isEqual:](color, "isEqual:", v4);
    v4 = v13;
    if ((v6 & 1) == 0)
    {
      v7 = (UIColor *)-[UIColor copy](v13, "copy");
      v8 = self->_color;
      self->_color = v7;

      -[STBarView dataPoint](self, "dataPoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "segments");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[STBarView sectionViews](self, "sectionViews");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __22__STBarView_setColor___block_invoke;
      v14[3] = &unk_24DB86920;
      v15 = v13;
      v16 = v10;
      v17 = self;
      v12 = v10;
      objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

      v4 = v13;
    }
  }

}

void __22__STBarView_setColor___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "color");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "setBackgroundColor:", v6);
  if (objc_msgSend(*(id *)(a1 + 48), "useVibrancy"))
    +[STUsageColors updateVibrancyStylingForView:withUsageColor:](STUsageColors, "updateVibrancyStylingForView:withUsageColor:", v8, v6);

}

- (BOOL)isDarkened
{
  void *v2;
  char v3;

  -[STBarView darkenedView](self, "darkenedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHidden") ^ 1;

  return v3;
}

- (void)setDarkened:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[STBarView darkenedView](self, "darkenedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    -[STBarView bringSubviewToFront:](self, "bringSubviewToFront:", v5);
    v5 = v6;
  }
  objc_msgSend(v5, "setHidden:", !v3);

}

- (void)setUpSections
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  STBarView *v24;
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  -[STBarView sectionViews](self, "sectionViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v37;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v37 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * v6++), "removeFromSuperview");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v4);
  }

  -[STBarView dataPoint](self, "dataPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "segments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "count");
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v9);
  if (v9)
    v11 = v9 - 1;
  else
    v11 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v11);
  -[STBarView heightAnchor](self, "heightAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBarView color](self, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__0;
  v34 = __Block_byref_object_dispose__0;
  v35 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __26__STBarView_setUpSections__block_invoke;
  v22[3] = &unk_24DB86948;
  v15 = v14;
  v23 = v15;
  v24 = self;
  v28 = &v30;
  v29 = v9;
  v16 = v13;
  v25 = v16;
  v17 = v12;
  v26 = v17;
  v18 = v10;
  v27 = v18;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v22);
  objc_msgSend((id)v31[5], "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBarView topAnchor](self, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "constraintEqualToAnchor:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setActive:", 1);

  -[STBarView setSectionViews:](self, "setSectionViews:", v18);
  -[STBarView setSectionHeightConstraints:](self, "setSectionHeightConstraints:", v17);

  _Block_object_dispose(&v30, 8);
}

void __26__STBarView_setUpSections__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  double v27;
  uint64_t v28;
  void *v29;
  id v30;
  id v31;

  v31 = a2;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v31, "color");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(v5, "setBackgroundColor:", v7);
  if (objc_msgSend(*(id *)(a1 + 40), "useVibrancy"))
    +[STUsageColors updateVibrancyStylingForView:withUsageColor:](STUsageColors, "updateVibrancyStylingForView:withUsageColor:", v5, v8);
  objc_msgSend(*(id *)(a1 + 40), "addSubview:", v5);
  objc_msgSend(v5, "leadingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "leadingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setActive:", 1);

  objc_msgSend(v5, "trailingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "trailingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  v15 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  objc_msgSend(v5, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "topAnchor");
  else
    objc_msgSend(*(id *)(a1 + 40), "bottomAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setActive:", 1);

  if (*(_QWORD *)(a1 + 80) - 1 > a3)
  {
    objc_msgSend(v31, "amountAsPercentageOfDataPointTotal");
    v20 = v19;
    v21 = *(void **)(a1 + 48);
    v22 = *(id *)(a1 + 56);
    v23 = v21;
    v24 = v5;
    objc_msgSend(v24, "heightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:multiplier:", v23, v20);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v27) = 1144750080;
    objc_msgSend(v26, "setPriority:", v27);
    objc_msgSend(v26, "setActive:", 1);
    objc_msgSend(v22, "addObject:", v26);

  }
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v5);
  v28 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v29 = *(void **)(v28 + 40);
  *(_QWORD *)(v28 + 40) = v5;
  v30 = v5;

}

- (void)setUpSectionHeightConstraints
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, unint64_t);
  void *v22;
  id v23;
  id v24;
  STBarView *v25;
  id v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[STBarView sectionHeightConstraints](self, "sectionHeightConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v7++), "setActive:", 0);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v5);
  }

  -[STBarView dataPoint](self, "dataPoint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "segments");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "count");
  -[STBarView sectionViews](self, "sectionViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBarView heightAnchor](self, "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[STBarView color](self, "color");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v10);
  v19 = MEMORY[0x24BDAC760];
  v20 = 3221225472;
  v21 = __42__STBarView_setUpSectionHeightConstraints__block_invoke;
  v22 = &unk_24DB86970;
  v23 = v11;
  v24 = v13;
  v25 = self;
  v26 = v12;
  v27 = v14;
  v28 = v10;
  v15 = v14;
  v16 = v12;
  v17 = v13;
  v18 = v11;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v19);
  -[STBarView setSectionHeightConstraints:](self, "setSectionHeightConstraints:", v15, v19, v20, v21, v22);

}

void __42__STBarView_setUpSectionHeightConstraints__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  id v17;

  v17 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v17, "color");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;
  objc_msgSend(v5, "setBackgroundColor:", v7);
  if (objc_msgSend(*(id *)(a1 + 48), "useVibrancy"))
    +[STUsageColors updateVibrancyStylingForView:withUsageColor:](STUsageColors, "updateVibrancyStylingForView:withUsageColor:", v5, v8);
  if (*(_QWORD *)(a1 + 72) - 1 > a3)
  {
    objc_msgSend(v17, "amountAsPercentageOfDataPointTotal");
    v10 = v9;
    v11 = *(void **)(a1 + 56);
    v12 = *(id *)(a1 + 64);
    v13 = v11;
    objc_msgSend(v5, "heightAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:multiplier:", v13, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v16) = 1144750080;
    objc_msgSend(v15, "setPriority:", v16);
    objc_msgSend(v15, "setActive:", 1);
    objc_msgSend(v12, "addObject:", v15);

  }
}

- (STUsageReportGraphDataPoint)dataPoint
{
  return self->_dataPoint;
}

- (UIColor)color
{
  return self->_color;
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (NSArray)sectionViews
{
  return self->_sectionViews;
}

- (void)setSectionViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (NSArray)sectionHeightConstraints
{
  return self->_sectionHeightConstraints;
}

- (void)setSectionHeightConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (UIView)darkenedView
{
  return (UIView *)objc_getProperty(self, a2, 456, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_darkenedView, 0);
  objc_storeStrong((id *)&self->_sectionHeightConstraints, 0);
  objc_storeStrong((id *)&self->_sectionViews, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_dataPoint, 0);
}

@end
