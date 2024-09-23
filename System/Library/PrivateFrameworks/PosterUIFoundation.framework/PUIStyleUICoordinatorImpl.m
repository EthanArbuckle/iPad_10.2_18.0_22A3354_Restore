@implementation PUIStyleUICoordinatorImpl

- (PUIStyleUICoordinatorImpl)initWithStyle:(id)a3
{
  id v5;
  PUIStyleUICoordinatorImpl *v6;
  PUIStyleUICoordinatorImpl *v7;
  double v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PUIStyleUICoordinatorImpl;
  v6 = -[PUIStyleUICoordinatorImpl init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_style, a3);
    if (objc_msgSend(v5, "allowsVariation"))
    {
      objc_msgSend(v5, "variation");
      v7->_variation = v8;
    }
  }

  return v7;
}

- (id)variationSupportingStyle
{
  void *v3;
  int v4;
  void *v5;

  -[PUIStyleUICoordinatorImpl style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsVariation");

  if (v4)
  {
    -[PUIStyleUICoordinatorImpl style](self, "style");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)setVariation:(double)a3
{
  -[PUIStyleUICoordinatorImpl setVariation:updateStyle:](self, "setVariation:updateStyle:", 1, a3);
}

- (void)setVariation:(double)a3 updateStyle:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v4 = a4;
  -[PUIStyleUICoordinatorImpl style](self, "style");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "allowsVariation");

  if (v8 && self->_variation != a3)
  {
    self->_variation = a3;
    if (v4)
    {
      -[PUIStyleUICoordinatorImpl style](self, "style");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v10, "copyWithVariation:", a3);
      -[PUIStyleUICoordinatorImpl setStyle:](self, "setStyle:", v9);

    }
  }
}

- (double)itemViewLuminance
{
  return 0.5;
}

- (UIView)itemView
{
  UIView *itemView;
  UIView *v4;
  UIView *v5;

  itemView = self->_itemView;
  if (!itemView)
  {
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    v5 = self->_itemView;
    self->_itemView = v4;

    itemView = self->_itemView;
  }
  return itemView;
}

- (UIView)variationSliderThumbView
{
  return 0;
}

- (UIView)variationSliderTrackView
{
  return 0;
}

- (double)contentsLuminance
{
  return self->_contentsLuminance;
}

- (void)setContentsLuminance:(double)a3
{
  self->_contentsLuminance = a3;
}

- (double)variation
{
  return self->_variation;
}

- (PUIStyle)style
{
  return self->_style;
}

- (void)setStyle:(id)a3
{
  objc_storeStrong((id *)&self->_style, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end
