@implementation PUFeedTitleCell

- (PUFeedTitleCell)initWithFrame:(CGRect)a3
{
  PUFeedTitleCell *v3;
  PUFeedTitleCell *v4;
  void *v5;
  PXSharedAlbumHeaderView *v6;
  PXSharedAlbumHeaderView *headerView;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PUFeedTitleCell;
  v3 = -[PUFeedTitleCell initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUFeedTitleCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (PXSharedAlbumHeaderView *)objc_alloc_init(MEMORY[0x1E0D7B950]);
    headerView = v4->_headerView;
    v4->_headerView = v6;

    -[PXSharedAlbumHeaderView setLayoutStyle:](v4->_headerView, "setLayoutStyle:", 1);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v4, sel__handleTap_);
    -[PXSharedAlbumHeaderView addGestureRecognizer:](v4->_headerView, "addGestureRecognizer:", v8);
    objc_msgSend(v5, "addSubview:", v4->_headerView);

  }
  return v4;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_contentInsets.left
    || a3.top != self->_contentInsets.top
    || a3.right != self->_contentInsets.right
    || a3.bottom != self->_contentInsets.bottom)
  {
    self->_contentInsets = a3;
    -[PUFeedTitleCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setCollectionViewType:(int64_t)a3
{
  if (self->_collectionViewType != a3)
  {
    self->_collectionViewType = a3;
    -[PUFeedTitleCell _updateHeaderTextColorStyle](self, "_updateHeaderTextColorStyle");
  }
}

- (void)setSectionInfo:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_sectionInfo, a3);
  v5 = a3;
  -[PUFeedTitleCell headerView](self, "headerView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSectionInfo:", v5);

}

- (void)setTappableArea:(unint64_t)a3
{
  id v4;

  if (self->_tappableArea != a3)
  {
    self->_tappableArea = a3;
    -[PUFeedTitleCell headerView](self, "headerView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTappableArea:", a3);

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFeedTitleCell;
  -[PUFeedTitleCell layoutSubviews](&v3, sel_layoutSubviews);
  -[PUFeedTitleCell bounds](self, "bounds");
  -[PUFeedTitleCell _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 1);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PUFeedTitleCell _performLayoutInRect:updateSubviewFrames:](self, "_performLayoutInRect:updateSubviewFrames:", 0, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUFeedTitleCell;
  -[PUFeedTitleCell prepareForReuse](&v3, sel_prepareForReuse);
  -[PUFeedTitleCell setContentInsets:](self, "setContentInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
  -[PUFeedTitleCell setCollectionViewType:](self, "setCollectionViewType:", 0);
  -[PUFeedTitleCell setTappableArea:](self, "setTappableArea:", 0);
  -[PUFeedTitleCell setSectionInfo:](self, "setSectionInfo:", 0);
}

- (void)_updateHeaderTextColorStyle
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v7;
  id v8;

  v3 = -[PUFeedTitleCell collectionViewType](self, "collectionViewType");
  -[PUFeedTitleCell traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v7 = v3 == 1 && v5 != 1;
  -[PUFeedTitleCell headerView](self, "headerView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTextColorStyle:", v7);

}

- (CGSize)_performLayoutInRect:(CGRect)a3 updateSubviewFrames:(BOOL)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double MaxX;
  double v26;
  double v27;
  double v28;
  double v29;
  CGSize result;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  height = a3.size.height;
  width = a3.size.width;
  -[PUFeedTitleCell traitCollection](self, "traitCollection", a3.origin.x, a3.origin.y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayScale");
  v10 = v9;

  if (v10 <= 0.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");

  }
  -[PUFeedTitleCell contentInsets](self, "contentInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[PUFeedTitleCell headerView](self, "headerView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sizeThatFits:", width - (v15 + v19), height - (v13 + v17));
  v22 = v21;
  v24 = v23;
  if (a4)
  {
    if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PUFeedTitleCell semanticContentAttribute](self, "semanticContentAttribute")) == 1)
    {
      -[PUFeedTitleCell bounds](self, "bounds");
      MaxX = CGRectGetMaxX(v31);
      v32.origin.x = v15;
      v32.origin.y = v13;
      v32.size.width = v22;
      v32.size.height = v24;
      v26 = MaxX - CGRectGetWidth(v32);
      v33.origin.x = v15;
      v33.origin.y = v13;
      v33.size.width = v22;
      v33.size.height = v24;
      v15 = v26 - CGRectGetMinX(v33);
    }
    PXRectRoundToPixel();
    objc_msgSend(v20, "setFrame:");
  }
  v34.origin.x = v15;
  v34.origin.y = v13;
  v34.size.width = v22;
  v34.size.height = v24;
  v27 = v17 + CGRectGetMaxY(v34);

  v28 = width;
  v29 = v27;
  result.height = v29;
  result.width = v28;
  return result;
}

- (void)_handleTap:(id)a3
{
  id v4;

  -[PUFeedCell delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "didTapFeedCell:", self);

}

- (UIEdgeInsets)contentInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInsets.top;
  left = self->_contentInsets.left;
  bottom = self->_contentInsets.bottom;
  right = self->_contentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)collectionViewType
{
  return self->_collectionViewType;
}

- (unint64_t)tappableArea
{
  return self->_tappableArea;
}

- (PXFeedSectionInfo)sectionInfo
{
  return self->_sectionInfo;
}

- (PXSharedAlbumHeaderView)headerView
{
  return self->_headerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_sectionInfo, 0);
}

@end
