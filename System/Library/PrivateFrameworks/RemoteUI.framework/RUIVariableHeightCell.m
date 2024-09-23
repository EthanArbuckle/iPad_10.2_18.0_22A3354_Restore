@implementation RUIVariableHeightCell

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  void *v19;
  NSString *v20;
  BOOL IsAccessibilityCategory;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  uint64_t v35;
  double v36;
  double MaxX;
  double v38;
  double v39;
  double v40;
  double v41;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat rect;
  objc_super v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v56.receiver = self;
  v56.super_class = (Class)RUIVariableHeightCell;
  -[RemoteUITableViewCell layoutSubviews](&v56, sel_layoutSubviews);
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIVariableHeightCell textLabel](self, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIVariableHeightCell detailTextLabel](self, "detailTextLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_isNaturallyRTL"))
  {

    v7 = 1;
    v8 = 2;
  }
  else
  {
    objc_msgSend(v5, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "_isNaturallyRTL");

    if (v7)
      v8 = 2;
    else
      v8 = 0;
  }
  objc_msgSend(v5, "setTextAlignment:", v8);
  if (self->_detailTextAlignment)
    objc_msgSend(v5, "setTextAlignment:");
  -[RUIVariableHeightCell layoutManager](self, "layoutManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[RUIVariableHeightCell frame](self, "frame");
  objc_msgSend(v10, "textRectForCell:rowWidth:forSizing:", self, 0, CGRectGetWidth(v57));
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;

  -[RUIVariableHeightCell traitCollection](self, "traitCollection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "preferredContentSizeCategory");
  v20 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v20);

  objc_msgSend(v4, "frame");
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v4, "setFrame:");
    objc_msgSend(v5, "frame");
    v23 = v22;
    v25 = v24;
    objc_msgSend(v4, "frame");
    v12 = v26;
    v27 = v5;
  }
  else
  {
    objc_msgSend(v5, "frame");
    rect = v18;
    v53 = v14;
    if (v5)
    {
      objc_msgSend(v4, "text");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0.0;
      if (objc_msgSend(v32, "length"))
      {
        -[RUIVariableHeightCell textFieldOffset](self, "textFieldOffset");
        v33 = v34;
      }

      -[RUIVariableHeightCell textFieldOffset](self, "textFieldOffset");
      -[RUIVariableHeightCell sizeForTextLabel:width:](self, "sizeForTextLabel:width:", v4);
      v51 = v35;
      v25 = v36;
      v58.origin.x = v12;
      v58.origin.y = v14;
      v58.size.width = v16;
      v58.size.height = rect;
      MaxX = CGRectGetMaxX(v58);
      if (v7)
        v38 = 0.0;
      else
        v38 = v12;
      v39 = MaxX - v38 - v33;
      -[RUIVariableHeightCell sizeForTextLabel:width:](self, "sizeForTextLabel:width:", v5, v39, v51);
      v54 = v41;
      if (v39 < v40 || self->_detailTextAlignment == 0)
        v43 = v40;
      else
        v43 = v39;
      objc_msgSend(v3, "scaledValueForValue:", 11.5);
      v45 = RUIRoundToPixel(v44);
      if (v7)
      {
        v59.origin.x = v12;
        v59.origin.y = v14;
        v59.size.width = v16;
        v59.size.height = rect;
        v46 = CGRectGetMaxX(v59) - v43 - v33;
      }
      else
      {
        v46 = v12 + v33;
      }
      v48 = v52;
    }
    else
    {
      v46 = v28;
      v45 = v29;
      v43 = v30;
      v54 = v31;
      v60.origin.x = v12;
      v60.origin.y = v14;
      v60.size.width = v16;
      v60.size.height = v18;
      -[RUIVariableHeightCell sizeForTextLabel:width:](self, "sizeForTextLabel:width:", v4, CGRectGetWidth(v60));
      v48 = v47;
      v25 = v49;
    }
    objc_msgSend(v3, "scaledValueForValue:", 11.5);
    v23 = RUIRoundToPixel(v50);
    if (v7)
    {
      v61.origin.x = v12;
      v61.origin.y = v53;
      v61.size.width = v16;
      v61.size.height = rect;
      v12 = CGRectGetMaxX(v61) - v48;
    }
    objc_msgSend(v5, "setFrame:", v46, v45, v43, v54);
    v16 = v48;
    v27 = v4;
  }
  objc_msgSend(v27, "setFrame:", v12, v23, v16, v25);

}

- (CGSize)sizeForTextLabel:(id)a3 width:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  _QWORD v16[2];
  CGSize result;

  v16[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *MEMORY[0x24BEBB360];
  objc_msgSend(v5, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundingRectWithSize:options:attributes:context:", 1, v8, 0, a4, 1.79769313e308);
  v10 = v9;
  v12 = v11;

  v13 = v10;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (double)height
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  NSString *v21;
  _BOOL4 IsAccessibilityCategory;
  double v23;
  double v24;

  -[RUIVariableHeightCell layoutIfNeeded](self, "layoutIfNeeded");
  objc_msgSend(MEMORY[0x24BEBD5F0], "metricsForTextStyle:", *MEMORY[0x24BEBE1D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scaledValueForValue:", 11.5);
  v5 = RUIRoundToPixel(v4);
  -[RUIVariableHeightCell textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  v9 = 0.0;
  v10 = 0.0;
  if (v8)
  {
    -[RUIVariableHeightCell textLabel](self, "textLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIVariableHeightCell textLabel](self, "textLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "size");
    -[RUIVariableHeightCell sizeForTextLabel:width:](self, "sizeForTextLabel:width:", v11);
    v10 = RUIRoundToPixel(v13 + v5 * 2.0);

  }
  -[RUIVariableHeightCell detailTextLabel](self, "detailTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");

  if (v16)
  {
    -[RUIVariableHeightCell detailTextLabel](self, "detailTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUIVariableHeightCell detailTextLabel](self, "detailTextLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "size");
    -[RUIVariableHeightCell sizeForTextLabel:width:](self, "sizeForTextLabel:width:", v17);
    v9 = RUIRoundToPixel(v19 + v5 * 2.0);

  }
  -[RUIVariableHeightCell traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "preferredContentSizeCategory");
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v21);
  if (v10 >= v9)
    v23 = v10;
  else
    v23 = v9;
  if (IsAccessibilityCategory)
    v24 = v10 + v9;
  else
    v24 = v23;

  return v24;
}

- (BOOL)supportsAccessory
{
  return self->_supportsAccessory;
}

- (void)setSupportsAccessory:(BOOL)a3
{
  self->_supportsAccessory = a3;
}

- (int64_t)detailTextAlignment
{
  return self->_detailTextAlignment;
}

- (void)setDetailTextAlignment:(int64_t)a3
{
  self->_detailTextAlignment = a3;
}

@end
