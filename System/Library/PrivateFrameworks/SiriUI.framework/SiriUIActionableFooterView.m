@implementation SiriUIActionableFooterView

- (SiriUIActionableFooterView)initWithFrame:(CGRect)a3
{
  SiriUIActionableFooterView *v3;
  uint64_t v4;
  UIButton *button;
  void *v6;
  uint64_t v7;
  SiriUIKeyline *keyline;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SiriUIActionableFooterView;
  v3 = -[SiriUIActionableFooterView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[SiriUIContentButton buttonWithLightWeightFont](SiriUIContentButton, "buttonWithLightWeightFont");
    v4 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v4;

    -[UIButton addTarget:action:forControlEvents:](v3->_button, "addTarget:action:forControlEvents:", v3, sel__buttonTapped_, 64);
    -[UIButton titleLabel](v3->_button, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", 0);

    -[UIButton setContentHorizontalAlignment:](v3->_button, "setContentHorizontalAlignment:", 1);
    -[UIButton setTitleEdgeInsets:](v3->_button, "setTitleEdgeInsets:", 0.0, 30.0, 0.0, 0.0);
    +[SiriUIKeyline keylineWithKeylineType:](SiriUIKeyline, "keylineWithKeylineType:", 2);
    v7 = objc_claimAutoreleasedReturnValue();
    keyline = v3->_keyline;
    v3->_keyline = (SiriUIKeyline *)v7;

    -[SiriUIActionableFooterView addSubview:](v3, "addSubview:", v3->_button);
  }
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[SiriUIActionableFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIButton setFrame:](self->_button, "setFrame:");
  v7 = *MEMORY[0x24BDBF090];
  v8 = *(double *)(MEMORY[0x24BDBF090] + 8);
  -[SiriUIKeyline sizeThatFits:](self->_keyline, "sizeThatFits:", v4, v6);
  -[SiriUIKeyline setFrame:](self->_keyline, "setFrame:", v7, v8, v9, v10);
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[UIButton titleLabel](self->_button, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  -[UIButton setTitle:forState:](self->_button, "setTitle:forState:", a3, 0);
}

- (void)setHasKeyline:(BOOL)a3
{
  if (self->_hasKeyline != a3)
  {
    self->_hasKeyline = a3;
    if (a3)
      -[SiriUIActionableFooterView addSubview:](self, "addSubview:", self->_keyline);
    else
      -[SiriUIKeyline removeFromSuperview](self->_keyline, "removeFromSuperview");
  }
}

- (void)setSnippetViewController:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  int v7;
  id v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_snippetViewController);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_storeWeak((id *)&self->_snippetViewController, obj);
    v7 = objc_msgSend(obj, "conformsToProtocol:", &unk_254F58728);

    v5 = obj;
    if (v7)
    {
      v8 = objc_loadWeakRetained((id *)&self->_snippetViewController);
      -[SiriUIActionableFooterView setDelegate:](self, "setDelegate:", v8);

      v5 = obj;
    }
  }

}

- (void)_buttonTapped:(id)a3
{
  id v4;

  -[SiriUIActionableFooterView delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerViewTapped:", self);

}

+ (double)defaultHeight
{
  return 44.0;
}

- (UIEdgeInsets)edgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x24BDF7718];
  v3 = *(double *)(MEMORY[0x24BDF7718] + 8);
  v4 = *(double *)(MEMORY[0x24BDF7718] + 16);
  v5 = *(double *)(MEMORY[0x24BDF7718] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)snippetViewController
{
  return objc_loadWeakRetained((id *)&self->_snippetViewController);
}

- (SiriUIActionableFooterViewDelegate)delegate
{
  return (SiriUIActionableFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)hasKeyline
{
  return self->_hasKeyline;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_snippetViewController);
  objc_storeStrong((id *)&self->_keyline, 0);
  objc_storeStrong((id *)&self->_button, 0);
}

@end
