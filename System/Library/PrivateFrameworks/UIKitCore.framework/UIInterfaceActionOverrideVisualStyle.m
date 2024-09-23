@implementation UIInterfaceActionOverrideVisualStyle

+ (id)styleOverride
{
  id v2;
  UIInterfaceActionConcreteVisualStyle *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  v3 = objc_alloc_init(UIInterfaceActionConcreteVisualStyle);
  v4 = (void *)objc_msgSend(v2, "initWithConcreteVisualStyle:", v3);

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UIInterfaceActionOverrideVisualStyle;
  v4 = -[UIInterfaceActionVisualStyle copyWithZone:](&v12, sel_copyWithZone_, a3);
  v5 = -[UIInterfaceActionSeparatorAttributes copy](self->_customSeparatorAttributes, "copy");
  v6 = (void *)v4[7];
  v4[7] = v5;

  v7 = -[UIInterfaceActionHighlightAttributes copy](self->_customActionHighlightAttributes, "copy");
  v8 = (void *)v4[8];
  v4[8] = v7;

  v9 = objc_msgSend(self->_customTitleLabelFontProviderForViewState, "copy");
  v10 = (void *)v4[9];
  v4[9] = v9;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  UIInterfaceActionSeparatorAttributes *customSeparatorAttributes;
  UIInterfaceActionSeparatorAttributes *v7;
  UIInterfaceActionHighlightAttributes *customActionHighlightAttributes;
  void *v9;
  char v10;
  UIInterfaceActionSeparatorAttributes *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIInterfaceActionOverrideVisualStyle;
  if (-[UIInterfaceActionVisualStyle isEqual:](&v14, sel_isEqual_, v4))
  {
    v5 = v4;
    customSeparatorAttributes = self->_customSeparatorAttributes;
    objc_msgSend(v5, "customSeparatorAttributes");
    v7 = (UIInterfaceActionSeparatorAttributes *)objc_claimAutoreleasedReturnValue();
    if (customSeparatorAttributes == v7)
    {
      v10 = 1;
    }
    else
    {
      customActionHighlightAttributes = self->_customActionHighlightAttributes;
      objc_msgSend(v5, "customActionHighlightAttributes");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[UIInterfaceActionHighlightAttributes isEqual:](customActionHighlightAttributes, "isEqual:", v9))
      {
        v10 = 1;
      }
      else
      {
        v11 = self->_customSeparatorAttributes;
        objc_msgSend(v5, "customSeparatorAttributes");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[UIInterfaceActionSeparatorAttributes isEqual:](v11, "isEqual:", v12);

      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)newActionBackgroundViewForViewState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "isHighlighted")
    && (-[UIInterfaceActionOverrideVisualStyle customActionHighlightAttributes](self, "customActionHighlightAttributes"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    -[UIInterfaceActionOverrideVisualStyle customActionHighlightAttributes](self, "customActionHighlightAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "newBackgroundHighlightView");

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UIInterfaceActionOverrideVisualStyle;
    v7 = -[UIInterfaceActionVisualStyle newActionBackgroundViewForViewState:](&v11, sel_newActionBackgroundViewForViewState_, v4);
  }
  -[UIInterfaceActionOverrideVisualStyle customSelectionHighlightContinuousCornerRadius](self, "customSelectionHighlightContinuousCornerRadius");
  if (v7)
  {
    v9 = v8;
    if (objc_msgSend(v4, "isHighlighted"))
    {
      if (v9 > 0.0)
      {
        objc_msgSend(v7, "setClipsToBounds:", 1);
        objc_msgSend(v7, "_setContinuousCornerRadius:", v9);
        objc_msgSend(v7, "setRoundedCornerPosition:", objc_msgSend(v4, "visualCornerPosition"));
      }
    }
  }

  return v7;
}

- (id)newActionSeparatorViewForGroupViewState:(id)a3
{
  id v4;
  void *v5;
  id v6;
  double v7;
  objc_super v9;

  v4 = a3;
  -[UIInterfaceActionOverrideVisualStyle customSeparatorAttributes](self, "customSeparatorAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "newSeparatorView");

  if (!v6)
  {
    v9.receiver = self;
    v9.super_class = (Class)UIInterfaceActionOverrideVisualStyle;
    v6 = -[UIInterfaceActionVisualStyle newActionSeparatorViewForGroupViewState:](&v9, sel_newActionSeparatorViewForGroupViewState_, v4);
  }
  if (self->_alignActionSeparatorLeadingEdgeWithContent)
  {
    -[UIInterfaceActionVisualStyle contentMargin](self, "contentMargin");
    objc_msgSend(v6, "setHorizontalLineLeadingInset:", v7);
  }

  return v6;
}

- (id)actionTitleLabelFontForViewState:(id)a3
{
  id v4;
  void (**customTitleLabelFontProviderForViewState)(id, id);
  void *v6;
  objc_super v8;

  v4 = a3;
  customTitleLabelFontProviderForViewState = (void (**)(id, id))self->_customTitleLabelFontProviderForViewState;
  if (!customTitleLabelFontProviderForViewState
    || (customTitleLabelFontProviderForViewState[2](customTitleLabelFontProviderForViewState, v4),
        (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v8.receiver = self;
    v8.super_class = (Class)UIInterfaceActionOverrideVisualStyle;
    -[UIInterfaceActionVisualStyle actionTitleLabelFontForViewState:](&v8, sel_actionTitleLabelFontForViewState_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (double)customSelectionHighlightContinuousCornerRadius
{
  return self->_customSelectionHighlightContinuousCornerRadius;
}

- (void)setCustomSelectionHighlightContinuousCornerRadius:(double)a3
{
  self->_customSelectionHighlightContinuousCornerRadius = a3;
}

- (BOOL)alignActionSeparatorLeadingEdgeWithContent
{
  return self->_alignActionSeparatorLeadingEdgeWithContent;
}

- (void)setAlignActionSeparatorLeadingEdgeWithContent:(BOOL)a3
{
  self->_alignActionSeparatorLeadingEdgeWithContent = a3;
}

- (UIInterfaceActionSeparatorAttributes)customSeparatorAttributes
{
  return self->_customSeparatorAttributes;
}

- (void)setCustomSeparatorAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_customSeparatorAttributes, a3);
}

- (UIInterfaceActionHighlightAttributes)customActionHighlightAttributes
{
  return self->_customActionHighlightAttributes;
}

- (void)setCustomActionHighlightAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_customActionHighlightAttributes, a3);
}

- (id)customTitleLabelFontProviderForViewState
{
  return self->_customTitleLabelFontProviderForViewState;
}

- (void)setCustomTitleLabelFontProviderForViewState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_customTitleLabelFontProviderForViewState, 0);
  objc_storeStrong((id *)&self->_customActionHighlightAttributes, 0);
  objc_storeStrong((id *)&self->_customSeparatorAttributes, 0);
}

@end
