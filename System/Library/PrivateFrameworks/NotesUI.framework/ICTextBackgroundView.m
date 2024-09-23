@implementation ICTextBackgroundView

- (ICTextBackgroundView)initWithFrame:(CGRect)a3
{
  ICTextBackgroundView *v3;
  ICTextBackgroundView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICTextBackgroundView;
  v3 = -[ICTextBackgroundView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[ICTextBackgroundView createLayout](v3, "createLayout");
  return v4;
}

- (ICTextBackgroundView)initWithCoder:(id)a3
{
  ICTextBackgroundView *v3;
  ICTextBackgroundView *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICTextBackgroundView;
  v3 = -[ICTextBackgroundView initWithCoder:](&v10, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    -[ICTextBackgroundView createLayout](v3, "createLayout");
    v9.receiver = v4;
    v9.super_class = (Class)ICTextBackgroundView;
    -[ICTextBackgroundView backgroundColor](&v9, sel_backgroundColor);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTextBackgroundView contentView](v4, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v8.receiver = v4;
    v8.super_class = (Class)ICTextBackgroundView;
    -[ICTextBackgroundView setBackgroundColor:](&v8, sel_setBackgroundColor_, 0);
  }
  return v4;
}

- (void)createLayout
{
  id v3;

  -[ICTextBackgroundView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 0);
  -[ICTextBackgroundView contentView](self, "contentView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICTextBackgroundView addSubview:](self, "addSubview:", v3);

}

- (id)backgroundColor
{
  void *v2;
  void *v3;

  -[ICTextBackgroundView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ICTextBackgroundView contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (UIView)contentView
{
  UIView *contentView;
  UIView *v4;
  UIView *v5;

  contentView = self->_contentView;
  if (!contentView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v5 = self->_contentView;
    self->_contentView = v4;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setUserInteractionEnabled:](self->_contentView, "setUserInteractionEnabled:", 0);
    contentView = self->_contentView;
  }
  return contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
