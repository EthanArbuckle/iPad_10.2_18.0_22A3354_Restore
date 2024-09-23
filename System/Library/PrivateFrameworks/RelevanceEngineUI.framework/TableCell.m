@implementation TableCell

- (TableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TableCell;
  return -[TableCell initWithStyle:reuseIdentifier:](&v5, sel_initWithStyle_reuseIdentifier_, 0, a4);
}

- (void)prepareForReuse
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TableCell;
  -[TableCell prepareForReuse](&v4, sel_prepareForReuse);
  -[TableCell contentCell](self, "contentCell");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[TableCell setContentCell:](self, "setContentCell:", 0);
}

- (void)configureWithContent:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  void *v7;
  void *v8;
  double Width;
  void *v10;
  void *v11;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGRect v14;
  CGRect v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "style");
  if (v5 > 6)
  {
    v7 = 0;
  }
  else
  {
    v6 = objc_alloc(*off_24CF7A010[v5]);
    v7 = (void *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  objc_msgSend(v7, "configureWithContent:", v4);
  CGAffineTransformMakeScale(&v13, 2.0, 2.0);
  v12 = v13;
  objc_msgSend(v7, "setTransform:", &v12);
  -[TableCell contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  Width = CGRectGetWidth(v14);
  -[TableCell contentView](self, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, Width, CGRectGetHeight(v15));

  -[TableCell setContentCell:](self, "setContentCell:", v7);
  -[TableCell contentView](self, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v7);

}

- (void)layoutSubviews
{
  void *v3;
  double Width;
  void *v5;
  double Height;
  void *v7;
  objc_super v8;
  CGRect v9;
  CGRect v10;

  v8.receiver = self;
  v8.super_class = (Class)TableCell;
  -[TableCell layoutSubviews](&v8, sel_layoutSubviews);
  -[TableCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  Width = CGRectGetWidth(v9);
  -[TableCell contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  Height = CGRectGetHeight(v10);
  -[TableCell contentCell](self, "contentCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, Width, Height);

}

- (REUpNextBaseCell)contentCell
{
  return self->_contentCell;
}

- (void)setContentCell:(id)a3
{
  objc_storeStrong((id *)&self->_contentCell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentCell, 0);
}

@end
