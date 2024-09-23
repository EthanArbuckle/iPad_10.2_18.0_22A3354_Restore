@implementation SiriUIPlatterSectionHeaderCollectionViewCell

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

- (SiriUIPlatterSectionHeaderCollectionViewCell)initWithFrame:(CGRect)a3
{
  SiriUIPlatterSectionHeaderCollectionViewCell *v3;
  SiriUIPlatterSectionHeaderView *v4;
  SiriUIPlatterSectionHeaderView *headerView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SiriUIPlatterSectionHeaderCollectionViewCell;
  v3 = -[SiriUIContentCollectionViewCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = -[SiriUITextContainerView initWithText:]([SiriUIPlatterSectionHeaderView alloc], "initWithText:", 0);
    headerView = v3->_headerView;
    v3->_headerView = v4;

    -[SiriUIPlatterSectionHeaderCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_headerView);

    -[SiriUIContentCollectionViewCell setKeylineType:](v3, "setKeylineType:", 0);
  }
  return v3;
}

- (void)layoutSubviews
{
  SiriUIPlatterSectionHeaderView *headerView;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SiriUIPlatterSectionHeaderCollectionViewCell;
  -[SiriUIContentCollectionViewCell layoutSubviews](&v4, sel_layoutSubviews);
  headerView = self->_headerView;
  -[SiriUIPlatterSectionHeaderCollectionViewCell bounds](self, "bounds");
  -[SiriUIPlatterSectionHeaderView setFrame:](headerView, "setFrame:");
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SiriUIPlatterSectionHeaderCollectionViewCell;
  -[SiriUIContentCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
