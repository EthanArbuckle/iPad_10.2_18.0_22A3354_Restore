@implementation _PREditingPosterContentStyleCoordinatorImpl

- (_PREditingPosterContentStyleCoordinatorImpl)initWithStyle:(id)a3
{
  id v5;
  _PREditingPosterContentStyleCoordinatorImpl *v6;
  _PREditingPosterContentStyleCoordinatorImpl *v7;
  double v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_PREditingPosterContentStyleCoordinatorImpl;
  v6 = -[_PREditingPosterContentStyleCoordinatorImpl init](&v10, sel_init);
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

  -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowsVariation");

  if (v4)
  {
    -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
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
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsVariation");

  if (v6)
  {
    if (self->_variation != a3)
    {
      self->_variation = a3;
      -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v8, "copyWithVariation:", a3);
      -[_PREditingPosterContentStyleCoordinatorImpl setStyle:](self, "setStyle:", v7);

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
    v4 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
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

- (PRPosterContentStyle)style
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
