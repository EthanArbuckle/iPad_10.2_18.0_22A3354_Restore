@implementation UITableViewIndexVisualStyle_iOS

+ (id)containerViewForTableViewIndex:(id)a3
{
  return 0;
}

- (UITableViewIndexVisualStyle_iOS)initWithTableViewIndex:(id)a3
{
  id v3;
  UITableViewIndexVisualStyle_iOS *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)UITableViewIndexVisualStyle_iOS;
  v3 = a3;
  v4 = -[UITableViewIndexVisualStyle_iOS init](&v7, sel_init);
  -[UITableViewIndexVisualStyle_iOS setTableViewIndex:](v4, "setTableViewIndex:", v3, v7.receiver, v7.super_class);

  objc_msgSend(off_1E167A828, "boldSystemFontOfSize:", 11.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableViewIndexVisualStyle_iOS setFont:](v4, "setFont:", v5);

  -[UITableViewIndexVisualStyle_iOS setVerticalTextHeightEstimate:](v4, "setVerticalTextHeightEstimate:", 0.0);
  return v4;
}

- (void)setFont:(id)a3
{
  UIFont *v5;
  UIFont *v6;

  v5 = (UIFont *)a3;
  if (self->_font != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_font, a3);
    -[UITableViewIndexVisualStyle_iOS setVerticalTextHeightEstimate:](self, "setVerticalTextHeightEstimate:", 0.0);
    v5 = v6;
  }

}

- (double)indexWidth
{
  void *v2;
  void *v3;
  double v4;

  -[UITableViewIndexVisualStyle_iOS tableViewIndex](self, "tableViewIndex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = _UIDefaultIndexBarWidthForTraitCollection(v3);
  return v4;
}

- (double)_lineSpacingForCurrentIdiom
{
  void *v2;
  void *v3;
  double v4;

  -[UITableViewIndexVisualStyle_iOS tableViewIndex](self, "tableViewIndex");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "userInterfaceIdiom") & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v4 = 16.0;
  else
    v4 = 6.0;

  return v4;
}

- (double)minLineSpacing
{
  void *v3;
  void *v4;
  const __CFAttributedString *v5;
  const __CTLine *v6;
  const __CTLine *v7;
  double v8;
  double v9;
  double v10;
  uint64_t v12;
  _QWORD v13[2];
  CGRect BoundsWithOptions;

  v13[1] = *MEMORY[0x1E0C80C00];
  if (self->_verticalTextHeightEstimate == 0.0)
  {
    v12 = *(_QWORD *)off_1E1678D90;
    -[UITableViewIndexVisualStyle_iOS font](self, "font");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", 0x1E1787D00, v4);
    v6 = CTLineCreateWithAttributedString(v5);
    if (v6)
    {
      v7 = v6;
      BoundsWithOptions = CTLineGetBoundsWithOptions(v6, 8uLL);
      -[UITableViewIndexVisualStyle_iOS setVerticalTextHeightEstimate:](self, "setVerticalTextHeightEstimate:", BoundsWithOptions.size.height, BoundsWithOptions.origin.y, BoundsWithOptions.size.width);
      CFRelease(v7);
    }

  }
  -[UITableViewIndexVisualStyle_iOS verticalTextHeightEstimate](self, "verticalTextHeightEstimate");
  v9 = v8;
  -[UITableViewIndexVisualStyle_iOS _lineSpacingForCurrentIdiom](self, "_lineSpacingForCurrentIdiom");
  return v9 + v10;
}

- (void)legibilityWeightOrPreferredContentSizeUpdated
{
  self->_verticalTextHeightEstimate = 0.0;
}

- (UITableViewIndex)tableViewIndex
{
  return (UITableViewIndex *)objc_loadWeakRetained((id *)&self->_tableViewIndex);
}

- (void)setTableViewIndex:(id)a3
{
  objc_storeWeak((id *)&self->_tableViewIndex, a3);
}

- (UIFont)font
{
  return self->_font;
}

- (double)verticalTextHeightEstimate
{
  return self->_verticalTextHeightEstimate;
}

- (void)setVerticalTextHeightEstimate:(double)a3
{
  self->_verticalTextHeightEstimate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
  objc_destroyWeak((id *)&self->_tableViewIndex);
}

@end
