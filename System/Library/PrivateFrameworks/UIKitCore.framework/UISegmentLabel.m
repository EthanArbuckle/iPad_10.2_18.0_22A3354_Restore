@implementation UISegmentLabel

- (id)_associatedScalingLabel
{
  return objc_loadWeakRetained((id *)&self->_associatedLabel);
}

- (id)_disabledFontColor
{
  void *v3;
  void *v4;
  objc_super v6;

  -[UISegmentLabel _parentSegment](self, "_parentSegment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disabledTextColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)UISegmentLabel;
    -[UILabel _disabledFontColor](&v6, sel__disabledFontColor);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_parentSegment
{
  UISegmentLabel *v2;
  UISegmentLabel *v3;
  UISegmentLabel *v4;

  v2 = self;
  while (1)
  {
    v3 = v2;
    -[UIView superview](v2, "superview");
    v2 = (UISegmentLabel *)objc_claimAutoreleasedReturnValue();

    if (!v2)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v2;
      break;
    }
  }

  return v2;
}

- (UISegmentLabel)init
{
  UISegmentLabel *v2;
  UISegmentLabel *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UISegmentLabel;
  v2 = -[UIView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[UIView setBackgroundColor:](v2, "setBackgroundColor:", 0);
    -[UIView setOpaque:](v3, "setOpaque:", 0);
    -[UILabel _setMinimumFontSize:](v3, "_setMinimumFontSize:", 9.0);
    -[UILabel setTextAlignment:](v3, "setTextAlignment:", 1);
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_associatedLabel);
}

- (void)setAssociatedLabel:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_associatedLabel);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_associatedLabel, obj);
    -[UILabel setNeedsDisplay](self, "setNeedsDisplay");
    v5 = obj;
  }

}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("contents")) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UISegmentLabel;
    v5 = -[UIView _shouldAnimatePropertyWithKey:](&v7, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v5;
}

- (UILabel)associatedLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_associatedLabel);
}

@end
