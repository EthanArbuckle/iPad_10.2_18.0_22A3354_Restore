@implementation _PREditingPosterContentVibrantMonochromeStyleCoordinatorImpl

- (void)setContentsLuminance:(double)a3
{
  PRPosterContentVibrantMonochromeStyle *v5;
  UIView *itemView;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PREditingPosterContentVibrantMonochromeStyleCoordinatorImpl;
  -[_PREditingPosterContentStyleCoordinatorImpl setContentsLuminance:](&v8, sel_setContentsLuminance_);
  v5 = -[PRPosterContentVibrantMonochromeStyle initWithBackgroundType:]([PRPosterContentVibrantMonochromeStyle alloc], "initWithBackgroundType:", a3 <= 0.9);
  -[_PREditingPosterContentStyleCoordinatorImpl setStyle:](self, "setStyle:", v5);
  itemView = self->_itemView;
  -[PRPosterContentVibrantMonochromeStyle effectiveColor](v5, "effectiveColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](itemView, "setBackgroundColor:", v7);

}

- (double)itemViewLuminance
{
  void *v2;
  double v3;

  -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "backgroundType"))
    v3 = 1.0;
  else
    v3 = 0.0;

  return v3;
}

- (id)itemView
{
  UIView *itemView;
  void *v4;
  UIView *v5;
  void *v6;
  UIView *v7;

  itemView = self->_itemView;
  if (!itemView)
  {
    -[_PREditingPosterContentStyleCoordinatorImpl style](self, "style");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    objc_msgSend(v4, "effectiveColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v5, "setBackgroundColor:", v6);
    v7 = self->_itemView;
    self->_itemView = v5;

    itemView = self->_itemView;
  }
  return itemView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemView, 0);
}

@end
