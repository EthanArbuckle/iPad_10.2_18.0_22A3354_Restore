@implementation STCandyBarView

- (STCandyBarView)initWithVibrancy:(BOOL)a3
{
  STCandyBarView *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STCandyBarView;
  result = -[STCandyBarView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  result->_useVibrancy = a3;
  return result;
}

- (id)capImageWithHeight:(double)a3 leadingLineCap:(int)a4 trailingLineCap:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[8];
  int v24;
  int v25;
  BOOL v26;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  if (capImageWithHeight_leadingLineCap_trailingLineCap__onceToken != -1)
    dispatch_once(&capImageWithHeight_leadingLineCap_trailingLineCap__onceToken, &__block_literal_global_2);
  v9 = objc_msgSend(MEMORY[0x24BEBDB00], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[STCandyBarView semanticContentAttribute](self, "semanticContentAttribute"));
  v10 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@-%@-%@"), v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)capImageWithHeight_leadingLineCap_trailingLineCap__capImages, "objectForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = v15;
  }
  else
  {
    v17 = v9 == 1;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD618]), "initWithSize:", a3 + a3, a3);
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __68__STCandyBarView_capImageWithHeight_leadingLineCap_trailingLineCap___block_invoke_2;
    v23[3] = &__block_descriptor_73_e40_v16__0__UIGraphicsImageRendererContext_8l;
    *(double *)&v23[4] = a3;
    *(double *)&v23[5] = a3 + a3;
    *(double *)&v23[6] = a3;
    *(double *)&v23[7] = a3 * 0.5;
    v26 = v17;
    v24 = v5;
    v25 = v6;
    objc_msgSend(v18, "imageWithActions:", v23);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "imageWithRenderingMode:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "resizableImageWithCapInsets:resizingMode:", 1, 0.0, a3 * 0.5, 0.0, a3 * 0.5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)capImageWithHeight_leadingLineCap_trailingLineCap__capImages, "setObject:forKey:", v21, v14);
    v16 = v21;

  }
  return v16;
}

void __68__STCandyBarView_capImageWithHeight_leadingLineCap_trailingLineCap___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)capImageWithHeight_leadingLineCap_trailingLineCap__capImages;
  capImageWithHeight_leadingLineCap_trailingLineCap__capImages = v0;

}

void __68__STCandyBarView_capImageWithHeight_leadingLineCap_trailingLineCap___block_invoke_2(uint64_t a1, void *a2)
{
  CGContext *v3;
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  CGContextSetLineWidth(v3, *(CGFloat *)(a1 + 32));
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetStrokeColorWithColor(v3, (CGColorRef)objc_msgSend(v4, "CGColor"));

  v5 = *(double *)(a1 + 40) * 0.5;
  v6 = *(double *)(a1 + 56);
  CGContextBeginPath(v3);
  if (*(_BYTE *)(a1 + 72))
    v7 = 64;
  else
    v7 = 68;
  CGContextSetLineCap(v3, *(CGLineCap *)(a1 + v7));
  CGContextMoveToPoint(v3, v5 - v6, *(double *)(a1 + 48) * 0.5);
  CGContextAddLineToPoint(v3, v5, *(double *)(a1 + 48) * 0.5);
  CGContextStrokePath(v3);
  CGContextBeginPath(v3);
  if (*(_BYTE *)(a1 + 72))
    v8 = 68;
  else
    v8 = 64;
  CGContextSetLineCap(v3, *(CGLineCap *)(a1 + v8));
  CGContextMoveToPoint(v3, v5, *(double *)(a1 + 48) * 0.5);
  CGContextAddLineToPoint(v3, v5 + v6, *(double *)(a1 + 48) * 0.5);
  CGContextStrokePath(v3);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STCandyBarView;
  -[STCandyBarView layoutSubviews](&v3, sel_layoutSubviews);
  -[STCandyBarView updateSectionViewImages](self, "updateSectionViewImages");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BEBE9C8];
  v3 = 6.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)updateConstraints
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  STCandyBarView *v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)STCandyBarView;
  -[STCandyBarView updateConstraints](&v22, sel_updateConstraints);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[STCandyBarView usageItems](self, "usageItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "totalUsage");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "doubleValue");
        v7 = v7 + v10;

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  if (v7 < 1.0)
    v7 = 1.0;
  -[STCandyBarView viewItems](self, "viewItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCandyBarView usageItems](self, "usageItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __35__STCandyBarView_updateConstraints__block_invoke;
  v14[3] = &unk_24DB869D8;
  v15 = v11;
  v16 = self;
  v17 = v7;
  v13 = v11;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v14);

}

void __35__STCandyBarView_updateConstraints__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  id v18;

  v18 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widthConstraint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "widthConstraint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setActive:", 0);

    objc_msgSend(v5, "sectionView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widthAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "totalUsage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "doubleValue");
    v13 = *(double *)(a1 + 48);
    if (v13 < 1.0)
      v13 = 1.0;
    objc_msgSend(v9, "constraintEqualToAnchor:multiplier:", v10, v12 / v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWidthConstraint:", v14);

    objc_msgSend(v5, "widthConstraint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v16) = 1144750080;
    objc_msgSend(v15, "setPriority:", v16);

    objc_msgSend(v5, "widthConstraint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);

  }
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
  uint64_t v12;
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
  v19.super_class = (Class)STCandyBarView;
  -[STCandyBarView traitCollectionDidChange:](&v19, sel_traitCollectionDidChange_, v4);
  if (-[STCandyBarView useVibrancy](self, "useVibrancy"))
  {
    if (!v4
      || (v5 = objc_msgSend(v4, "userInterfaceStyle"),
          -[STCandyBarView traitCollection](self, "traitCollection"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "userInterfaceStyle"),
          v6,
          v5 != v7))
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      -[STCandyBarView viewItems](self, "viewItems", 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v16;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v16 != v11)
              objc_enumerationMutation(v8);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "sectionView");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "tintColor");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            +[STUsageColors updateVibrancyStylingForView:withUsageColor:](STUsageColors, "updateVibrancyStylingForView:withUsageColor:", v13, v14);

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        }
        while (v10);
      }

    }
  }

}

- (void)updateSectionViewImages
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  STCandyBarView *v10;

  -[STCandyBarView usageItems](self, "usageItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCandyBarView viewItems](self, "viewItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__STCandyBarView_updateSectionViewImages__block_invoke;
  v7[3] = &unk_24DB86A00;
  v8 = v4;
  v9 = v3;
  v10 = self;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v7);

}

void __41__STCandyBarView_updateSectionViewImages__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sectionView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 == a3)
  {
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    v7 = *(void **)(a1 + 48);
    objc_msgSend(v7, "frame");
    v8 = v7;
    v10 = v9;
    if (v6 == 1)
      v11 = 1;
    else
      v11 = 2;
    v14 = 1;
  }
  else
  {
    v12 = *(void **)(a1 + 48);
    objc_msgSend(v12, "frame");
    v10 = v13;
    v8 = v12;
    if (a3)
      v11 = 2;
    else
      v11 = 1;
    v14 = 2;
  }
  objc_msgSend(v8, "capImageWithHeight:leadingLineCap:trailingLineCap:", v11, v14, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v15);

}

- (NSArray)usageItems
{
  return self->_usageItems;
}

- (void)setUsageItems:(id)a3
{
  id v4;
  NSUInteger v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSArray *v16;
  NSArray *usageItems;
  _QWORD v18[5];
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  void *v26;
  STCandyBarView *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[NSArray count](self->_usageItems, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    -[STCandyBarView viewItems](self, "viewItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __32__STCandyBarView_setUsageItems___block_invoke;
    v25[3] = &unk_24DB86A28;
    v26 = v6;
    v27 = self;
    v7 = v6;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v25);
    -[STCandyBarView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    v8 = v26;
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[STCandyBarView viewItems](self, "viewItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v13), "sectionView");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "removeFromSuperview");

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
      }
      while (v11);
    }

    v15 = (void *)objc_opt_new();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __32__STCandyBarView_setUsageItems___block_invoke_2;
    v18[3] = &unk_24DB86A00;
    v18[4] = self;
    v19 = v15;
    v20 = v4;
    v7 = v15;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v18);
    -[STCandyBarView updateSectionViewImages](self, "updateSectionViewImages");
    -[STCandyBarView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[STCandyBarView setViewItems:](self, "setViewItems:", v7);

    v8 = v19;
  }

  v16 = (NSArray *)objc_msgSend(v4, "copy");
  usageItems = self->_usageItems;
  self->_usageItems = v16;

}

void __32__STCandyBarView_setUsageItems___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "color");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "sectionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTintColor:", v7);
  if (objc_msgSend(*(id *)(a1 + 40), "useVibrancy"))
    +[STUsageColors updateVibrancyStylingForView:withUsageColor:](STUsageColors, "updateVibrancyStylingForView:withUsageColor:", v8, v7);

}

void __32__STCandyBarView_setUsageItems___block_invoke_2(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  id v28;

  v5 = a2;
  v28 = (id)objc_opt_new();
  objc_msgSend(v5, "color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v28, "sectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTintColor:", v6);
  if (objc_msgSend(a1[4], "useVibrancy"))
    +[STUsageColors updateVibrancyStylingForView:withUsageColor:](STUsageColors, "updateVibrancyStylingForView:withUsageColor:", v7, v6);
  objc_msgSend(a1[4], "addSubview:", v7);
  objc_msgSend(v7, "centerYAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "centerYAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  objc_msgSend(v7, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "heightAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setActive:", 1);

  objc_msgSend(a1[5], "lastObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "leadingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v14, "sectionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17, 2.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

  }
  else
  {
    objc_msgSend(a1[4], "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setActive:", 1);
  }

  if (objc_msgSend(a1[6], "count") - 1 == a3)
  {
    objc_msgSend(v7, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setActive:", 1);

  }
  else
  {
    objc_msgSend(v28, "sectionView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "widthAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "widthAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWidthConstraint:", v25);

    objc_msgSend(v28, "widthConstraint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v27) = 1144750080;
    objc_msgSend(v26, "setPriority:", v27);

    objc_msgSend(v28, "widthConstraint");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setActive:", 1);
  }

  objc_msgSend(a1[5], "addObject:", v28);
}

- (void)setUsageItems:(id)a3 animated:(BOOL)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];

  v6 = a3;
  v9 = v6;
  if (a4)
  {
    -[STCandyBarView usageItems](self, "usageItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");

    -[STCandyBarView setUsageItems:](self, "setUsageItems:", v9);
    if (v8)
    {
      -[STCandyBarView layoutIfNeeded](self, "layoutIfNeeded");
      -[STCandyBarView updateConstraintsIfNeeded](self, "updateConstraintsIfNeeded");
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __41__STCandyBarView_setUsageItems_animated___block_invoke;
      v10[3] = &unk_24DB86440;
      v10[4] = self;
      objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v10, &__block_literal_global_39, 0.6, 0.0, 0.9, 0.0);
    }
  }
  else
  {
    -[STCandyBarView setUsageItems:](self, "setUsageItems:", v6);

  }
}

uint64_t __41__STCandyBarView_setUsageItems_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)useVibrancy
{
  return self->_useVibrancy;
}

- (NSArray)viewItems
{
  return self->_viewItems;
}

- (void)setViewItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 432);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewItems, 0);
  objc_storeStrong((id *)&self->_usageItems, 0);
}

@end
