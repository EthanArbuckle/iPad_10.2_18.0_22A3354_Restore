@implementation PUFeedStackCell

- (PUFeedStackCell)initWithFrame:(CGRect)a3
{
  PUFeedStackCell *v3;
  PUStackView *v4;
  PUStackView *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUFeedStackCell;
  v3 = -[PUFeedStackCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [PUStackView alloc];
    -[PUFeedStackCell bounds](v3, "bounds");
    v5 = -[PUStackView initWithFrame:](v4, "initWithFrame:");
    -[PUFeedStackCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v5);

    -[PUFeedStackCell setStackView:](v3, "setStackView:", v5);
  }
  return v3;
}

- (void)prepareForReuse
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUFeedStackCell;
  -[PUFeedStackCell prepareForReuse](&v7, sel_prepareForReuse);
  -[PUFeedStackCell stackView](self, "stackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[PUStackView maximumNumberOfVisibleItemsForStyle:](PUStackView, "maximumNumberOfVisibleItemsForStyle:", objc_msgSend(v3, "style"));
  if (v4 >= 1)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      objc_msgSend(v3, "setImageHidden:forItemAtIndex:", 0, i);
  }

}

- (void)setStackOffset:(UIOffset)a3
{
  if (a3.horizontal != self->_stackOffset.horizontal || a3.vertical != self->_stackOffset.vertical)
  {
    self->_stackOffset = a3;
    -[PUFeedStackCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;

  v20.receiver = self;
  v20.super_class = (Class)PUFeedStackCell;
  -[PUFeedStackCell layoutSubviews](&v20, sel_layoutSubviews);
  -[PUFeedStackCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[PUFeedStackCell stackView](self, "stackView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stackSize");
  v14 = v13;
  -[PUFeedStackCell stackOffset](self, "stackOffset");
  v16 = v15;
  v18 = v17;
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  v19 = v16 + (CGRectGetWidth(v21) - v14) * 0.5;
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
  objc_msgSend(v12, "setStackOffset:", v19, v18);

}

- (PUStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (UIOffset)stackOffset
{
  double horizontal;
  double vertical;
  UIOffset result;

  horizontal = self->_stackOffset.horizontal;
  vertical = self->_stackOffset.vertical;
  result.vertical = vertical;
  result.horizontal = horizontal;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
