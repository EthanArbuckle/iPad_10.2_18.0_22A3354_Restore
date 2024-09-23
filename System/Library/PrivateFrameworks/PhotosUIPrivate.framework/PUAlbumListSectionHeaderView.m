@implementation PUAlbumListSectionHeaderView

- (PUAlbumListSectionHeaderView)initWithFrame:(CGRect)a3
{
  PUAlbumListSectionHeaderView *v3;
  UILabel *v4;
  UILabel *titleLabel;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PUAlbumListSectionHeaderView;
  v3 = -[PUAlbumListSectionHeaderView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    titleLabel = v3->__titleLabel;
    v3->__titleLabel = v4;

    +[PUInterfaceManager currentTheme](PUInterfaceManager, "currentTheme");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "configureAlbumListSectionTitleLabel:", v3->__titleLabel);
    -[PUAlbumListSectionHeaderView addSubview:](v3, "addSubview:", v3->__titleLabel);

  }
  return v3;
}

- (void)setSectionHeaderInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_sectionHeaderInsets.left
    || a3.top != self->_sectionHeaderInsets.top
    || a3.right != self->_sectionHeaderInsets.right
    || a3.bottom != self->_sectionHeaderInsets.bottom)
  {
    self->_sectionHeaderInsets = a3;
    -[PUAlbumListSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSectionHeaderTitle:(id)a3
{
  NSString *v4;
  NSString *v5;
  BOOL v6;
  NSString *v7;
  NSString *sectionHeaderTitle;
  void *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_sectionHeaderTitle != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      sectionHeaderTitle = self->_sectionHeaderTitle;
      self->_sectionHeaderTitle = v7;

      -[PUAlbumListSectionHeaderView _titleLabel](self, "_titleLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setText:", v10);

      -[PUAlbumListSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
      v5 = v10;
    }
  }

}

- (void)setSectionHeaderTitleFont:(id)a3
{
  void *v5;
  UIFont *v6;

  v6 = (UIFont *)a3;
  if (self->_sectionHeaderTitleFont != v6)
  {
    objc_storeStrong((id *)&self->_sectionHeaderTitleFont, a3);
    -[PUAlbumListSectionHeaderView _titleLabel](self, "_titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

    -[PUAlbumListSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)layoutSubviews
{
  void *v3;
  char v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double MinX;
  CGFloat MaxY;
  objc_super v31;
  CGRect v32;

  v31.receiver = self;
  v31.super_class = (Class)PUAlbumListSectionHeaderView;
  -[PUAlbumListSectionHeaderView layoutSubviews](&v31, sel_layoutSubviews);
  -[PUAlbumListSectionHeaderView _titleLabel](self, "_titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PUAlbumListSectionHeaderView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  -[PUAlbumListSectionHeaderView bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[PUAlbumListSectionHeaderView sectionHeaderInsets](self, "sectionHeaderInsets");
  v14 = v6 + v13;
  v16 = v8 + v15;
  v18 = v10 - (v13 + v17);
  v20 = v12 - (v15 + v19);
  objc_msgSend(v3, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v22 = v21;
  v24 = v23;
  v25 = v14;
  v26 = v16;
  v27 = v18;
  v28 = v20;
  if ((v4 & 1) != 0)
    MinX = CGRectGetMaxX(*(CGRect *)&v25) - v22;
  else
    MinX = CGRectGetMinX(*(CGRect *)&v25);
  v32.origin.x = v14;
  v32.origin.y = v16;
  v32.size.width = v18;
  v32.size.height = v20;
  MaxY = CGRectGetMaxY(v32);
  objc_msgSend(v3, "setFrame:", PURoundRectToPixel(MinX, MaxY - v24, v22, v24));

}

- (NSString)sectionHeaderTitle
{
  return self->_sectionHeaderTitle;
}

- (UIFont)sectionHeaderTitleFont
{
  return self->_sectionHeaderTitleFont;
}

- (UIEdgeInsets)sectionHeaderInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_sectionHeaderInsets.top;
  left = self->_sectionHeaderInsets.left;
  bottom = self->_sectionHeaderInsets.bottom;
  right = self->_sectionHeaderInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UILabel)_titleLabel
{
  return self->__titleLabel;
}

- (NSArray)_constraints
{
  return self->__constraints;
}

- (void)_setConstraints:(id)a3
{
  objc_storeStrong((id *)&self->__constraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__constraints, 0);
  objc_storeStrong((id *)&self->__titleLabel, 0);
  objc_storeStrong((id *)&self->_sectionHeaderTitleFont, 0);
  objc_storeStrong((id *)&self->_sectionHeaderTitle, 0);
}

@end
