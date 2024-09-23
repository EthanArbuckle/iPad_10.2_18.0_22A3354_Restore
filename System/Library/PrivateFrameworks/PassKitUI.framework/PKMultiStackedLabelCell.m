@implementation PKMultiStackedLabelCell

- (void)setSources:(id)a3
{
  id v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  PKIconTextLabel *v18;
  void *v19;
  void *v20;
  PKIconTextLabel *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  PKMultiStackedLabelCell *v27;
  id v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_sources, a3);
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v26 = 872;
    v6 = self->_textLabels;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v35;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v35 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * v10++), "removeFromSuperview", v26);
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      }
      while (v8);
    }

    v27 = self;
    -[PKMultiStackedLabelCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v28 = v5;
    obj = v5;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v31;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v16);
          v18 = [PKIconTextLabel alloc];
          objc_msgSend(v17, "text");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "icon");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[PKIconTextLabel initWithText:icon:](v18, "initWithText:icon:", v19, v20);

          objc_msgSend(v17, "textColor");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKIconTextLabel setTextColor:](v21, "setTextColor:", v22);

          objc_msgSend(v17, "font");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKIconTextLabel setTextFont:](v21, "setTextFont:", v23);

          objc_msgSend(v11, "addSubview:", v21);
          objc_msgSend(v12, "addObject:", v21);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      }
      while (v14);
    }

    v24 = objc_msgSend(v12, "copy");
    v25 = *(Class *)((char *)&v27->super.super.super.super.super.super.isa + v26);
    *(Class *)((char *)&v27->super.super.super.super.super.super.isa + v26) = (Class)v24;

    -[PKMultiStackedLabelCell setNeedsLayout](v27, "setNeedsLayout");
    v5 = v28;
  }

}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKMultiStackedLabelCell;
  -[PKMultiStackedLabelCell layoutSubviews](&v4, sel_layoutSubviews);
  -[PKMultiStackedLabelCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PKMultiStackedLabelCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PKMultiStackedLabelCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double height;
  double width;
  double y;
  double x;
  double v10;
  double v11;
  CGFloat v12;
  unint64_t v13;
  double v14;
  void *v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double paddingBetweenRows;
  double v26;
  double v27;
  CGRect v28;
  CGRect slice;
  CGSize result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = PKTableViewCellTextInset();
  v11 = x + v10;
  v12 = width - (v10 + PKTableViewCellTextInset());
  -[PKMultiStackedLabelCell _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v28.size.width = v12;
  v28.size.height = height + -30.0;
  if (-[NSArray count](self->_textLabels, "count", *(_QWORD *)&v11, y + 15.0))
  {
    v13 = 0;
    memset(&slice, 0, sizeof(slice));
    v14 = 0.0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_textLabels, "objectAtIndexedSubscript:", v13);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sizeThatFits:", v28.size.width, v28.size.height);
      CGRectDivide(v28, &slice, &v28, v16, CGRectMinYEdge);
      PKContentAlignmentMake();
      PKSizeAlignedInRect();
      v18 = v17;
      v20 = v19;
      v22 = v21;
      v24 = v23;
      CGRectDivide(v28, &slice, &v28, self->_paddingBetweenRows, CGRectMinYEdge);
      paddingBetweenRows = self->_paddingBetweenRows;
      if (!a4)
        objc_msgSend(v15, "setFrame:", v18, v20, v22, v24);
      v14 = v14 + v24 + paddingBetweenRows;

      ++v13;
    }
    while (v13 < -[NSArray count](self->_textLabels, "count"));
    v26 = v14 + 30.0;
  }
  else
  {
    v26 = 30.0;
  }
  v27 = width;
  result.height = v26;
  result.width = v27;
  return result;
}

- (void)prepareForReuse
{
  NSArray *textLabels;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKMultiStackedLabelCell;
  -[PKMultiStackedLabelCell prepareForReuse](&v4, sel_prepareForReuse);
  textLabels = self->_textLabels;
  self->_textLabels = 0;

}

- (NSArray)sources
{
  return self->_sources;
}

- (double)paddingBetweenRows
{
  return self->_paddingBetweenRows;
}

- (void)setPaddingBetweenRows:(double)a3
{
  self->_paddingBetweenRows = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_textLabels, 0);
}

@end
