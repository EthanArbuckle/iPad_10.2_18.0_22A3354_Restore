@implementation SiriUIPlatterSectionHeaderTableViewCell

+ (CGSize)sizeThatFits:(CGSize)a3 text:(id)a4
{
  double v4;
  double v5;
  CGSize result;

  +[SiriUIPlatterSectionHeaderView sizeThatFits:text:](SiriUIPlatterSectionHeaderView, "sizeThatFits:text:", a4, a3.width, a3.height);
  result.height = v5;
  result.width = v4;
  return result;
}

- (SiriUIPlatterSectionHeaderTableViewCell)initWithText:(id)a3
{
  id v4;
  SiriUIPlatterSectionHeaderTableViewCell *v5;
  SiriUIPlatterSectionHeaderTableViewCell *v6;

  v4 = a3;
  v5 = -[SiriUIPlatterSectionHeaderTableViewCell initWithStyle:reuseIdentifier:](self, "initWithStyle:reuseIdentifier:", 0, 0);
  v6 = v5;
  if (v5)
    -[SiriUIPlatterSectionHeaderTableViewCell setText:](v5, "setText:", v4);

  return v6;
}

- (SiriUIPlatterSectionHeaderTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  SiriUIPlatterSectionHeaderTableViewCell *v4;
  SiriUIPlatterSectionHeaderView *v5;
  SiriUIPlatterSectionHeaderView *headerView;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SiriUIPlatterSectionHeaderTableViewCell;
  v4 = -[SiriUIPlatterSectionHeaderTableViewCell initWithStyle:reuseIdentifier:](&v9, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    v5 = -[SiriUIPlatterSectionHeaderView initWithText:visualEffect:]([SiriUIPlatterSectionHeaderView alloc], "initWithText:visualEffect:", 0, 0);
    headerView = v4->_headerView;
    v4->_headerView = v5;

    -[SiriUIPlatterSectionHeaderTableViewCell contentView](v4, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v4->_headerView);

  }
  return v4;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  CGFloat width;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  -[SiriUITextContainerView sizeThatFits:](self->_headerView, "sizeThatFits:", a3.width, 1.79769313e308);
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  SiriUIPlatterSectionHeaderView *headerView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIPlatterSectionHeaderTableViewCell;
  -[SiriUIPlatterSectionHeaderTableViewCell layoutSubviews](&v4, sel_layoutSubviews);
  headerView = self->_headerView;
  -[SiriUIPlatterSectionHeaderTableViewCell bounds](self, "bounds");
  -[SiriUIPlatterSectionHeaderView setFrame:](headerView, "setFrame:");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriUIPlatterSectionHeaderTableViewCell;
  -[SiriUIPlatterSectionHeaderTableViewCell prepareForReuse](&v3, sel_prepareForReuse);
  -[SiriUITextContainerView setText:](self->_headerView, "setText:", 0);
}

- (void)setText:(id)a3
{
  -[SiriUITextContainerView setText:](self->_headerView, "setText:", a3);
}

- (NSString)text
{
  return -[SiriUITextContainerView text](self->_headerView, "text");
}

- (void)setTextAlignment:(int64_t)a3
{
  -[SiriUIPlatterSectionHeaderView setTextAlignment:](self->_headerView, "setTextAlignment:", a3);
}

- (int64_t)textAlignment
{
  return -[SiriUITextContainerView textAlignment](self->_headerView, "textAlignment");
}

+ (id)_font
{
  return (id)objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
