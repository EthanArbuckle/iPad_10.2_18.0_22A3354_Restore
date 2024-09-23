@implementation PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView

- (PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView)initWithFrame:(CGRect)a3
{
  PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView *v3;
  PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  UILabel *v10;
  UILabel *titleLabel;
  void *v12;
  UILabel *v13;
  UILabel *subtitleLabel;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView;
  v3 = -[PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView bounds](v3, "bounds");
    v6 = v5;
    -[PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView bounds](v4, "bounds");
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 3.0, v6, v7 + -4.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v9);

    -[PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView addSubview:](v4, "addSubview:", v8);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v10;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_titleLabel, "setTextColor:", v12);

    -[PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView addSubview:](v4, "addSubview:", v4->_titleLabel);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_subtitleLabel, "setTextColor:", v15);

    -[PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView addSubview:](v4, "addSubview:", v4->_subtitleLabel);
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView;
  -[PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView layoutSubviews](&v7, sel_layoutSubviews);
  -[PUCurationTragicFailureInHighlightsGridDebugDebugViewSectionHeaderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5 * 0.5 + -3.0;
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", 4.0, 4.0);
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", 4.0, 21.0, v4, v6);
}

- (void)setTitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_title, a3);
  v5 = a3;
  -[UILabel setText:](self->_titleLabel, "setText:", v5);

}

- (void)setSubtitle:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_subtitle, a3);
  v5 = a3;
  -[UILabel setText:](self->_subtitleLabel, "setText:", v5);

}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
