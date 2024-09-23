@implementation WFColorPicker

- (WFColorPicker)initWithFrame:(CGRect)a3
{
  WFColorPicker *v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  WFColorPicker *v20;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  objc_super v30;
  _QWORD v31[5];

  v31[4] = *MEMORY[0x24BDAC8D0];
  v30.receiver = self;
  v30.super_class = (Class)WFColorPicker;
  v3 = -[WFColorPicker initWithFrame:](&v30, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFColorPicker setBackgroundColor:](v3, "setBackgroundColor:", v4);

    objc_msgSend(MEMORY[0x24BEC1398], "workflowPalette");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFColorPicker setColors:](v3, "setColors:", v5);

    objc_msgSend(MEMORY[0x24BEC1398], "workflowPaletteNames");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFColorPicker setColorNames:](v3, "setColorNames:", v6);

    v29 = objc_alloc_init(MEMORY[0x24BEBD488]);
    v7 = objc_alloc(MEMORY[0x24BEBD450]);
    v8 = (void *)objc_msgSend(v7, "initWithFrame:collectionViewLayout:", v29, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    objc_msgSend(v8, "setScrollEnabled:", 0);
    objc_msgSend(v8, "setDelaysContentTouches:", 0);
    objc_msgSend(v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v8, "setDelegate:", v3);
    objc_msgSend(v8, "setDataSource:", v3);
    objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("CellIdentifier"));
    -[WFColorPicker addSubview:](v3, "addSubview:", v8);
    -[WFColorPicker setColorCollectionView:](v3, "setColorCollectionView:", v8);
    v22 = (void *)MEMORY[0x24BDD1628];
    objc_msgSend(v8, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFColorPicker topAnchor](v3, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:", v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v26;
    objc_msgSend(v8, "leadingAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFColorPicker leadingAnchor](v3, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v24);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v23;
    objc_msgSend(v8, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFColorPicker trailingAnchor](v3, "trailingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v12;
    objc_msgSend(v8, "bottomAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFColorPicker safeAreaLayoutGuide](v3, "safeAreaLayoutGuide");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bottomAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v17);

    LODWORD(v18) = 1144750080;
    -[WFColorPicker setContentCompressionResistancePriority:forAxis:](v3, "setContentCompressionResistancePriority:forAxis:", 1, v18);
    LODWORD(v19) = 1144750080;
    -[WFColorPicker setContentHuggingPriority:forAxis:](v3, "setContentHuggingPriority:forAxis:", 1, v19);
    v20 = v3;

  }
  return v3;
}

- (void)layoutSubviews
{
  double Height;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;
  CGRect v12;

  v11.receiver = self;
  v11.super_class = (Class)WFColorPicker;
  -[WFColorPicker layoutSubviews](&v11, sel_layoutSubviews);
  -[WFColorPicker bounds](self, "bounds");
  Height = CGRectGetHeight(v12);
  -[WFColorPicker safeAreaInsets](self, "safeAreaInsets");
  v5 = Height - v4;
  v6 = Height - v4 + -195.000007;
  v7 = floor(v6 * 0.230769232) + 45.0;
  if (v6 >= 0.0)
    v8 = 45.0;
  else
    v8 = v7;
  -[WFColorPicker colorCollectionView](self, "colorCollectionView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "collectionViewLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setItemSize:", v8, v8);
  objc_msgSend(v10, "setMinimumLineSpacing:", v8 / 3.0);
  objc_msgSend(v10, "setMinimumInteritemSpacing:", v8 / 3.0);
  objc_msgSend(v10, "setSectionInset:", v5 + v8 * -4.0, v8 / 3.0, v8 / 3.0, v8 / 3.0);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x24BEBE9C8];
  v3 = 205.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WFColorPicker;
  -[WFColorPicker safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[WFColorPicker setNeedsLayout](self, "setNeedsLayout");
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[WFColorPicker colors](self, "colors", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("CellIdentifier"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFColorPicker colors](self, "colors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "item"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "paletteGradient");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setGradient:", v10);

  -[WFColorPicker colorNames](self, "colorNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "item");

  objc_msgSend(v11, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setColorName:", v13);

  return v7;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  WFColor *v8;
  WFColor *selectedColor;
  void *v10;
  id v11;

  v5 = a4;
  -[WFColorPicker colors](self, "colors");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "item");

  objc_msgSend((id)v6, "objectAtIndexedSubscript:", v7);
  v8 = (WFColor *)objc_claimAutoreleasedReturnValue();
  selectedColor = self->_selectedColor;
  self->_selectedColor = v8;

  -[WFColorPicker delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[WFColorPicker delegate](self, "delegate");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "colorPicker:didSelectColor:", self, self->_selectedColor);

  }
}

- (void)setSelectedColor:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_storeStrong((id *)&self->_selectedColor, a3);
  v5 = a3;
  -[WFColorPicker colorCollectionView](self, "colorCollectionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD15D8];
  -[WFColorPicker colors](self, "colors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForItem:inSection:", objc_msgSend(v7, "indexOfObject:", v5), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "selectItemAtIndexPath:animated:scrollPosition:", v8, 0, 0);
}

- (WFColor)selectedColor
{
  return self->_selectedColor;
}

- (WFColorPickerDelegate)delegate
{
  return (WFColorPickerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)colors
{
  return self->_colors;
}

- (void)setColors:(id)a3
{
  objc_storeStrong((id *)&self->_colors, a3);
}

- (NSArray)colorNames
{
  return self->_colorNames;
}

- (void)setColorNames:(id)a3
{
  objc_storeStrong((id *)&self->_colorNames, a3);
}

- (UICollectionView)colorCollectionView
{
  return self->_colorCollectionView;
}

- (void)setColorCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_colorCollectionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorCollectionView, 0);
  objc_storeStrong((id *)&self->_colorNames, 0);
  objc_storeStrong((id *)&self->_colors, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectedColor, 0);
}

@end
