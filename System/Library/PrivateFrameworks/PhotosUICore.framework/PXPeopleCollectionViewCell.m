@implementation PXPeopleCollectionViewCell

- (PXPeopleCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  char *v5;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  PXPeopleBadgeView *v28;
  void *v29;
  objc_super v31;

  height = a3.size.height;
  width = a3.size.width;
  v31.receiver = self;
  v31.super_class = (Class)PXPeopleCollectionViewCell;
  v5 = -[PXPeopleCollectionViewCell initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    if (initWithFrame__onceToken != -1)
      dispatch_once(&initWithFrame__onceToken, &__block_literal_global_32216);
    *((_QWORD *)v5 + 81) = 0;
    *((_QWORD *)v5 + 82) = 0;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)(v5 + 664) = _Q0;
    objc_msgSend(v5, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0DC3890]);
    v13 = (void *)*((_QWORD *)v5 + 87);
    *((_QWORD *)v5 + 87) = v12;

    objc_msgSend(*((id *)v5 + 87), "setContentMode:", 2);
    v14 = (void *)*((_QWORD *)v5 + 87);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternarySystemFillColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);

    objc_msgSend(*((id *)v5 + 87), "setClipsToBounds:", 1);
    objc_msgSend(*((id *)v5 + 87), "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (height >= width)
      v18 = width;
    else
      v18 = height;
    objc_msgSend(v16, "setCornerRadius:", v18 * 0.5);

    objc_msgSend(v11, "addSubview:", *((_QWORD *)v5 + 87));
    v19 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    objc_msgSend(v19, "setTextAlignment:", 1);
    objc_msgSend(v19, "setHidden:", 1);
    objc_msgSend(v19, "setText:", &stru_1E5149688);
    objc_msgSend(v19, "setFont:", initWithFrame__font);
    objc_msgSend(v11, "addSubview:", v19);
    v20 = (void *)*((_QWORD *)v5 + 92);
    *((_QWORD *)v5 + 92) = v19;
    v21 = v19;

    objc_msgSend(*((id *)v5 + 92), "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setShouldRasterize:", 1);

    objc_msgSend(v5, "traitCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "displayScale");
    v25 = v24;

    objc_msgSend(*((id *)v5 + 92), "layer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setRasterizationScale:", v25);

    v27 = (void *)*((_QWORD *)v5 + 88);
    *((_QWORD *)v5 + 88) = &stru_1E5149688;

    objc_msgSend(v5, "setSelectionStyle:", 1);
    v28 = objc_alloc_init(PXPeopleBadgeView);
    v29 = (void *)*((_QWORD *)v5 + 94);
    *((_QWORD *)v5 + 94) = v28;

    objc_msgSend(*((id *)v5 + 94), "setBadgeViewDelegate:", v5);
    objc_msgSend(v5, "addSubview:", *((_QWORD *)v5 + 94));

  }
  return (PXPeopleCollectionViewCell *)v5;
}

- (void)toggleFavorite:(id)a3
{
  id v4;

  -[PXPeopleCollectionViewCell peopleCellDelegate](self, "peopleCellDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toggleFavoriteForCell:", self);

}

- (void)setFavorite:(BOOL)a3
{
  if (self->_favorite != a3)
  {
    self->_favorite = a3;
    -[PXPeopleCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXPeopleCollectionViewCell;
  -[PXPeopleCollectionViewCell layoutSubviews](&v10, sel_layoutSubviews);
  -[PXPeopleCollectionViewCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[PXPeopleCollectionViewCell avatarView](self, "avatarView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, v5, v5);
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v5 * 0.5);

  -[PXPeopleCollectionViewCell highlightOverlayView](self, "highlightOverlayView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v5, v5);
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCornerRadius:", v5 * 0.5);

  -[PXPeopleCollectionViewCell _updateTitleAndFavoriteBadgeForLayoutChange](self, "_updateTitleAndFavoriteBadgeForLayoutChange");
  -[PXPeopleCollectionViewCell _updateFocusRingForced:](self, "_updateFocusRingForced:", 0);

}

- (void)prepareForReuse
{
  NSString *name;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleCollectionViewCell;
  -[PXPeopleCollectionViewCell prepareForReuse](&v4, sel_prepareForReuse);
  -[UIImageView setImage:](self->_avatarView, "setImage:", 0);
  name = self->_name;
  self->_name = (NSString *)&stru_1E5149688;

  -[UILabel setText:](self->_nameLabel, "setText:", &stru_1E5149688);
  -[UILabel setHidden:](self->_nameLabel, "setHidden:", 1);
  -[PXPeopleCollectionViewCell setHidden:](self, "setHidden:", 0);
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  PXPeopleCollectionViewCell *v7;
  PXPeopleCollectionViewCell *v8;
  PXPeopleCollectionViewCell *v9;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXPeopleCollectionViewCell;
  -[PXPeopleCollectionViewCell didUpdateFocusInContext:withAnimationCoordinator:](&v10, sel_didUpdateFocusInContext_withAnimationCoordinator_, v6, a4);
  objc_msgSend(v6, "nextFocusedItem");
  v7 = (PXPeopleCollectionViewCell *)objc_claimAutoreleasedReturnValue();
  if (v7 == self)
  {

LABEL_5:
    -[PXPeopleCollectionViewCell _updateFocusRingForced:](self, "_updateFocusRingForced:", 1);
    goto LABEL_6;
  }
  v8 = v7;
  objc_msgSend(v6, "previouslyFocusedItem");
  v9 = (PXPeopleCollectionViewCell *)objc_claimAutoreleasedReturnValue();

  if (v9 == self)
    goto LABEL_5;
LABEL_6:

}

- (id)focusEffect
{
  return 0;
}

- (void)setName:(id)a3
{
  NSString *v5;
  BOOL v6;
  NSString *v7;
  void *v8;
  uint64_t v9;
  NSString *v10;

  v5 = (NSString *)a3;
  v10 = v5;
  if (self->_name != v5 || (v6 = -[NSString isEqualToString:](v5, "isEqualToString:", v5), v7 = v10, !v6))
  {
    objc_storeStrong((id *)&self->_name, a3);
    -[PXPeopleCollectionViewCell nameLabel](self, "nameLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSString length](v10, "length");
    if (v9)
      objc_msgSend(v8, "setText:", v10);
    objc_msgSend(v8, "setHidden:", v9 == 0);
    -[PXPeopleCollectionViewCell setNeedsLayout](self, "setNeedsLayout");

    v7 = v10;
  }

}

- (void)setImage:(id)a3
{
  -[PXPeopleCollectionViewCell setImage:normalizedFaceRect:](self, "setImage:normalizedFaceRect:", a3, self->_unitRect.origin.x, self->_unitRect.origin.y, self->_unitRect.size.width, self->_unitRect.size.height);
}

- (void)setImage:(id)a3 normalizedFaceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  CGRect v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  -[PXPeopleCollectionViewCell avatarView](self, "avatarView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "image");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 != v13)
  {
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    if (CGRectEqualToRect(self->_unitRect, v14))
      v11 = 2;
    else
      v11 = 1;
    objc_msgSend(v9, "setImage:", v13);
    objc_msgSend(v9, "setContentMode:", v11);
    objc_msgSend(v9, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setContentsRect:", x, y, width, height);

    -[PXPeopleCollectionViewCell setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[PXPeopleCollectionViewCell avatarView](self, "avatarView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setTextAlpha:(double)a3
{
  id v4;

  self->_textAlpha = a3;
  -[PXPeopleCollectionViewCell nameLabel](self, "nameLabel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", self->_textAlpha);

}

- (void)setSelected:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPeopleCollectionViewCell;
  -[PXPeopleCollectionViewCell setSelected:](&v4, sel_setSelected_, a3);
  -[PXPeopleCollectionViewCell _updateSelection](self, "_updateSelection");
}

- (void)setSelectionStyle:(unint64_t)a3
{
  id v5;
  void *v6;
  id v7;

  self->_selectionStyle = a3;
  -[PXPeopleCollectionViewCell highlightOverlayView](self, "highlightOverlayView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);
  if (a3 == 1 && !v7)
  {
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[UIImageView frame](self->_avatarView, "frame");
    v7 = (id)objc_msgSend(v5, "initWithFrame:");
    objc_msgSend(v7, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBackgroundColor:", v6);

    objc_msgSend(v7, "setAlpha:", 0.5);
    objc_msgSend(v7, "setHidden:", 1);
    -[PXPeopleCollectionViewCell addSubview:](self, "addSubview:", v7);
    -[PXPeopleCollectionViewCell setHighlightOverlayView:](self, "setHighlightOverlayView:", v7);
    -[PXPeopleCollectionViewCell bringSubviewToFront:](self, "bringSubviewToFront:", v7);
  }
  -[PXPeopleCollectionViewCell _updateSelection](self, "_updateSelection");

}

- (NSUUID)uuid
{
  NSUUID *uuid;
  NSUUID *v4;
  NSUUID *v5;

  uuid = self->_uuid;
  if (!uuid)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }
  return uuid;
}

- (void)_updateSelection
{
  int v3;
  unint64_t v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  v3 = -[PXPeopleCollectionViewCell isSelected](self, "isSelected");
  v4 = -[PXPeopleCollectionViewCell selectionStyle](self, "selectionStyle");
  if (v4 == 1)
  {
    -[PXPeopleCollectionViewCell highlightOverlayView](self, "highlightOverlayView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v3 ^ 1u);

    -[PXPeopleCollectionViewCell avatarView](self, "avatarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1.0;
LABEL_8:
    objc_msgSend(v6, "setAlpha:", v8);

    goto LABEL_9;
  }
  if (!v4)
  {
    if (v3)
      v5 = 0.75;
    else
      v5 = 1.0;
    -[PXPeopleCollectionViewCell avatarView](self, "avatarView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v5;
    goto LABEL_8;
  }
LABEL_9:
  -[PXPeopleCollectionViewCell _updateBadgeViewState](self, "_updateBadgeViewState");
}

- (CGPoint)_computeCircumferenceMultipliersForAngle:(double)a3
{
  __double2 v3;
  double v4;
  double v5;
  CGPoint result;

  v3 = __sincos_stret(a3 * 0.0174532925);
  v4 = (1.0 - v3.__sinval) * 0.5;
  v5 = (v3.__cosval + 1.0) * 0.5;
  result.y = v4;
  result.x = v5;
  return result;
}

- (void)_updateTitleAndFavoriteBadgeForLayoutChange
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  _BOOL4 v12;
  double v13;
  double MaxY;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  CGRect v32;

  -[PXPeopleCollectionViewCell bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXPeopleCollectionViewCell badgeView](self, "badgeView");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPeopleCollectionViewCell traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v12 = -[PXPeopleCollectionViewCell isFavorite](self, "isFavorite");
  -[PXPeopleCollectionViewCell _updateBadgeViewState](self, "_updateBadgeViewState");
  if (v12)
    v13 = 29.0;
  else
    v13 = 24.0;
  v32.origin.x = v4;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  MaxY = CGRectGetMaxY(v32);
  -[PXPeopleCollectionViewCell avatarView](self, "avatarView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = MaxY - v16;

  -[PXPeopleCollectionViewCell _computeCircumferenceMultipliersForAngle:](self, "_computeCircumferenceMultipliersForAngle:", dbl_1A7C0C350[objc_msgSend(v11, "layoutDirection") == 1]);
  v19 = v18;
  v21 = v20;
  objc_msgSend(v31, "setFrame:", 0.0, 0.0, v13, v13);
  -[PXPeopleCollectionViewCell avatarView](self, "avatarView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v24 = v19 * v23;
  -[PXPeopleCollectionViewCell avatarView](self, "avatarView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  objc_msgSend(v31, "setCenter:", v24, v21 * v26);

  -[PXPeopleCollectionViewCell nameLabel](self, "nameLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "font");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "lineHeight");
  PXFloatCeilingToPixel();
  v30 = v29;

  objc_msgSend(v27, "setFrame:", 0.0, MaxY - v17, v8, v30 + 10.0);
}

- (void)_updateBadgeViewState
{
  _BOOL4 v3;
  unint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  PXPeopleBadgeViewConfiguration *v8;
  PXPeopleBadgeViewConfiguration *v9;
  void *v10;
  id v11;

  v3 = -[PXPeopleCollectionViewCell isFavorite](self, "isFavorite");
  v4 = -[PXPeopleCollectionViewCell selectionStyle](self, "selectionStyle");
  if (v4 == 1)
  {
    if (v3)
      v7 = 1;
    else
      v7 = 3;
  }
  else if (v4)
  {
    v7 = 0;
  }
  else
  {
    v5 = -[PXPeopleCollectionViewCell isSelected](self, "isSelected");
    v6 = 4;
    if (v3)
      v6 = 2;
    if (v5)
      v7 = 5;
    else
      v7 = v6;
  }
  v8 = [PXPeopleBadgeViewConfiguration alloc];
  -[PXPeopleCollectionViewCell traitCollection](self, "traitCollection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v9 = -[PXPeopleBadgeViewConfiguration initWithState:displayScale:badgeViewDelegate:](v8, "initWithState:displayScale:badgeViewDelegate:", v7, self);
  -[PXPeopleCollectionViewCell badgeView](self, "badgeView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserData:", v9);

}

- (void)_updateFocusRingForced:(BOOL)a3
{
  _QWORD v4[5];

  if (a3 || -[PXPeopleCollectionViewCell isFocused](self, "isFocused"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__PXPeopleCollectionViewCell__updateFocusRingForced___block_invoke;
    v4[3] = &unk_1E512EF78;
    v4[4] = self;
    +[PXFocusRing updateView:infoProviderBlock:](PXFocusRing, "updateView:infoProviderBlock:", self, v4);
  }
}

- (UIImageView)avatarView
{
  return self->_avatarView;
}

- (NSString)name
{
  return self->_name;
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (unint64_t)selectionStyle
{
  return self->_selectionStyle;
}

- (PXPeopleCollectionViewCellDelegate)peopleCellDelegate
{
  return (PXPeopleCollectionViewCellDelegate *)objc_loadWeakRetained((id *)&self->_peopleCellDelegate);
}

- (void)setPeopleCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_peopleCellDelegate, a3);
}

- (BOOL)ppt_fullImageLoaded
{
  return self->_ppt_fullImageLoaded;
}

- (void)setPpt_fullImageLoaded:(BOOL)a3
{
  self->_ppt_fullImageLoaded = a3;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
  objc_storeStrong((id *)&self->_nameLabel, a3);
}

- (UIView)highlightOverlayView
{
  return self->_highlightOverlayView;
}

- (void)setHighlightOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_highlightOverlayView, a3);
}

- (PXPeopleBadgeView)badgeView
{
  return self->_badgeView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_highlightOverlayView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_destroyWeak((id *)&self->_peopleCellDelegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

id __53__PXPeopleCollectionViewCell__updateFocusRingForced___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "avatarView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cornerRadius");
  v4 = v3;
  objc_msgSend(v1, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cornerCurve");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXFocusInfo focusInfoWithView:cornerRadius:cornerCurve:](PXFocusInfo, "focusInfoWithView:cornerRadius:cornerCurve:", v1, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __44__PXPeopleCollectionViewCell_initWithFrame___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontSize");
  objc_msgSend(v0, "systemFontOfSize:");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)initWithFrame__font;
  initWithFrame__font = v1;

}

@end
