@implementation SKUICommentHeaderViewController

- (SKUICommentHeaderViewController)initWithTitle:(id)a3
{
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SKUICommentHeaderViewController *v14;
  SKUICommentHeaderViewController *v15;
  objc_super v17;

  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        -[SKUICommentHeaderViewController initWithTitle:].cold.1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)SKUICommentHeaderViewController;
  v14 = -[SKUICommentHeaderViewController initWithNibName:bundle:](&v17, sel_initWithNibName_bundle_, 0, 0);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_title, a3);

  return v15;
}

- (void)viewDidLoad
{
  id v3;
  UILabel *v4;
  UILabel *titleLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SKUICommentHeaderViewController;
  -[SKUICommentHeaderViewController viewDidLoad](&v11, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3990]);
  v4 = (UILabel *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  titleLabel = self->_titleLabel;
  self->_titleLabel = v4;

  -[UILabel setText:](self->_titleLabel, "setText:", self->_title);
  v6 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v6, "setTextColor:", v7);

  v8 = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 18.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v8, "setFont:", v9);

  -[SKUICommentHeaderViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", self->_titleLabel);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;
  CGRect v16;

  v15.receiver = self;
  v15.super_class = (Class)SKUICommentHeaderViewController;
  -[SKUICommentHeaderViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  -[SKUICommentHeaderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UILabel frame](self->_titleLabel, "frame");
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", CGRectGetWidth(v16) + -10.0 + -10.0, v11);
  v13 = v12;
  *(float *)&v12 = (v11 - v14) * 0.5;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 10.0, floorf(*(float *)&v12), v13, v14);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)initWithTitle:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
