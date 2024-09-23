@implementation MTGenericCell

+ (double)heightForWidth:(double)a3
{
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  if (objc_msgSend(a1, "showsArtwork"))
  {
    objc_msgSend(a1, "artworkSizeForViewWidth:", a3);
    return v5 + 13.0 + 13.0;
  }
  else
  {
    v7 = objc_msgSend(a1, "textStackViewClass");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultTitleFont"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "defaultSubtitleFont"));
    v10 = objc_msgSend(v7, "defaultTitleNumberOfLines") != (id)1;
    objc_msgSend(v8, "lineHeight");
    v12 = v11;
    objc_msgSend(v8, "mt_offsetFromCapHeightToAscent");
    v14 = v12 - v13 + 10.0;
    objc_msgSend(v7, "distanceBetweenLabelFramesWithTitleFont:subtitleFont:multilineTitle:", v8, v9, v10);
    v16 = v15 + v14;
    objc_msgSend(v9, "lineHeight");
    v18 = v17;
    objc_msgSend(v9, "mt_offsetFromLastBaselineToBottom");
    v6 = v16 + v18 - v19 + 10.0;

  }
  return v6;
}

+ (double)maxHeight
{
  double result;

  objc_msgSend(a1, "heightForWidth:", 1.79769313e308);
  return result;
}

+ (CGSize)artworkSizeForViewWidth:(double)a3
{
  double v3;
  double v4;
  CGSize result;

  +[MTEpisodeLockup artworkSizeForStyle:](MTEpisodeLockup, "artworkSizeForStyle:", +[MTEpisodeLockup styleForWidth:showsArtwork:](MTEpisodeLockup, "styleForWidth:showsArtwork:", objc_msgSend(a1, "showsArtwork"), a3));
  result.height = v4;
  result.width = v3;
  return result;
}

+ (BOOL)showsArtwork
{
  return 0;
}

+ (Class)textStackViewClass
{
  unsigned int v2;
  __objc2_class **v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "showsArtwork");
  v3 = &off_1004A4598;
  if (!v2)
    v3 = &off_1004A4440;
  v4 = objc_opt_class(*v3);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (MTGenericCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTGenericCell *v4;
  MTGenericCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTGenericCell;
  v4 = -[MTTableViewCell initWithStyle:reuseIdentifier:](&v7, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_hidesSideViewWhenEditing = 1;
    -[MTGenericCell configureSubviews](v4, "configureSubviews");
  }
  return v5;
}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "title"));

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  objc_msgSend(v5, "setTitle:", v4);

}

- (NSString)subtitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "subtitle"));

  return (NSString *)v3;
}

- (void)setSubtitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  objc_msgSend(v5, "setSubtitle:", v4);

}

- (NSString)artworkKey
{
  void *v3;
  void *v4;

  if (-[MTGenericCell showsArtwork](self, "showsArtwork"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell artworkView](self, "artworkView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "artworkKey"));

  }
  else
  {
    v4 = 0;
  }
  return (NSString *)v4;
}

- (void)setArtworkKey:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[MTGenericCell showsArtwork](self, "showsArtwork"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell artworkView](self, "artworkView"));
    objc_msgSend(v4, "setArtworkKey:", v5);

  }
}

- (void)setHidesSideViewWhenEditing:(BOOL)a3
{
  if (-[MTGenericCell hidesSideViewWhenEditing](self, "hidesSideViewWhenEditing") != a3)
  {
    self->_hidesSideViewWhenEditing = a3;
    -[MTGenericCell _updateSideViewHiddenForCurrentState](self, "_updateSideViewHiddenForCurrentState");
  }
}

- (void)configureSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  self->_showsArtwork = objc_msgSend((id)objc_opt_class(self), "showsArtwork");
  if (-[MTGenericCell showsArtwork](self, "showsArtwork"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell contentView](self, "contentView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell artworkView](self, "artworkView"));
    objc_msgSend(v3, "addSubview:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell contentView](self, "contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  objc_msgSend(v5, "addSubview:", v6);

  -[MTGenericCell updateFonts](self, "updateFonts");
  -[MTGenericCell updateColors](self, "updateColors");
  -[MTGenericCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)updateFonts
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  objc_msgSend(v3, "updateFonts");

  -[MTGenericCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)setShowsArtwork:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_showsArtwork != a3)
  {
    self->_showsArtwork = a3;
    if (a3)
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericCell contentView](self, "contentView"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell artworkView](self, "artworkView"));
      objc_msgSend(v5, "addSubview:", v4);

    }
    else
    {
      v5 = (id)objc_claimAutoreleasedReturnValue(-[MTGenericCell artworkView](self, "artworkView"));
      objc_msgSend(v5, "removeFromSuperview");
    }

  }
}

- (void)setSideView:(id)a3
{
  UIView *v5;
  UIView *sideView;
  unsigned __int8 v7;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  sideView = self->_sideView;
  if (sideView != v5)
  {
    v9 = v5;
    v7 = -[UIView isEqual:](sideView, "isEqual:", v5);
    v5 = v9;
    if ((v7 & 1) == 0)
    {
      -[UIView removeFromSuperview](self->_sideView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_sideView, a3);
      if (v9)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell contentView](self, "contentView"));
        objc_msgSend(v8, "addSubview:", v9);

      }
      -[MTGenericCell setNeedsLayout](self, "setNeedsLayout");
      v5 = v9;
    }
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
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unsigned int v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  objc_super v40;

  v40.receiver = self;
  v40.super_class = (Class)MTGenericCell;
  -[MTTableViewCell layoutSubviews](&v40, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell contentView](self, "contentView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  -[MTGenericCell artworkFrameForContentViewSize:](self, "artworkFrameForContentViewSize:", v5, v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell artworkView](self, "artworkView"));
  v38 = v11;
  v39 = v9;
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  -[MTGenericCell sideViewFrameForContentViewSize:](self, "sideViewFrameForContentViewSize:", v5, v7);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = -[MTGenericCell _isSideViewHidden](self, "_isSideViewHidden");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell sideView](self, "sideView"));
  v27 = v26;
  if (v25)
  {
    v28 = 0.0;
  }
  else
  {
    objc_msgSend(v26, "setFrame:", v18, v20, v22, v24);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell sideView](self, "sideView"));
    v27 = v26;
    v28 = 1.0;
  }
  objc_msgSend(v26, "setAlpha:", v28);

  -[MTGenericCell textStackFrameForContentViewSize:artworkFrame:sideViewFrame:](self, "textStackFrameForContentViewSize:artworkFrame:sideViewFrame:", v5, v7, v39, v38, v13, v15, *(_QWORD *)&v18, *(_QWORD *)&v20, *(_QWORD *)&v22, *(_QWORD *)&v24);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  objc_msgSend((id)objc_opt_class(self), "heightForWidth:", a3.width);
  v5 = v4;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTGenericCell;
  -[MTTableViewCell prepareForReuse](&v3, "prepareForReuse");
  if (-[MTGenericCell showsArtwork](self, "showsArtwork"))
    -[MTGenericCell setArtworkKey:](self, "setArtworkKey:", 0);
  -[MTGenericCell _updateSideViewHiddenForCurrentState](self, "_updateSideViewHiddenForCurrentState");
  -[MTGenericCell updateFonts](self, "updateFonts");
}

- (void)willTransitionToState:(unint64_t)a3
{
  objc_super v5;

  -[MTGenericCell _updateSideViewHiddenForState:](self, "_updateSideViewHiddenForState:");
  v5.receiver = self;
  v5.super_class = (Class)MTGenericCell;
  -[MTGenericCell willTransitionToState:](&v5, "willTransitionToState:", a3);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MTGenericCell;
  -[MTTableViewCell setEnabled:](&v7, "setEnabled:");
  -[MTGenericCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  objc_msgSend(v5, "setEnabled:", v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell artworkView](self, "artworkView"));
  objc_msgSend(v6, "setEnabled:", v3);

}

- (CGRect)artworkFrameForContentViewSize:(CGSize)a3
{
  double height;
  double width;
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
  CGRect result;

  height = a3.height;
  width = a3.width;
  objc_msgSend((id)objc_opt_class(self), "artworkSizeForViewWidth:", a3.width);
  v7 = v6;
  v9 = v8;
  -[MTGenericCell layoutMargins](self, "layoutMargins");
  v11 = v10;
  if (-[MTGenericCell mt_isRTL](self, "mt_isRTL"))
    v12 = width - v11 - v7;
  else
    v12 = v11;
  v13 = IMRoundToPixel((height - v9) * 0.5);
  v14 = v12;
  v15 = v7;
  v16 = v9;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (CGRect)sideViewFrameForContentViewSize:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  unsigned int v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  height = a3.height;
  width = a3.width;
  -[MTGenericCell layoutMargins](self, "layoutMargins");
  v7 = v6;
  if (-[MTGenericCell _isSideViewHidden](self, "_isSideViewHidden"))
  {
    v8 = CGSizeZero.width;
    v9 = CGSizeZero.height;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell sideView](self, "sideView"));
    objc_msgSend(v10, "frame");
    v8 = v11;
    v9 = v12;

  }
  v13 = IMRoundToPixel((height - v9) * 0.5);
  v14 = -[MTGenericCell mt_isRTL](self, "mt_isRTL");
  v15 = width - v7 - v8;
  if (v14)
    v15 = v7;
  v16 = v13;
  v17 = v8;
  v18 = v9;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)textStackFrameForContentViewSize:(CGSize)a3 artworkFrame:(CGRect)a4 sideViewFrame:(CGRect)a5
{
  double width;
  double y;
  double x;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double height;
  double v21;
  CGRect result;

  height = a4.size.height;
  v21 = a3.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[MTGenericCell textViewMinXForArtworkFrame:sideViewFrame:](self, "textViewMinXForArtworkFrame:sideViewFrame:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v10 = v9;
  -[MTGenericCell textViewMaxXForArtworkFrame:sideViewFrame:](self, "textViewMaxXForArtworkFrame:sideViewFrame:", x, y, width, height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v12 = v11 - v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTGenericCell textStackView](self, "textStackView"));
  objc_msgSend(v13, "sizeThatFits:", v12, 1.79769313e308);
  v15 = v14;

  v16 = IMRoundToPixel((v21 - v15) * 0.5);
  v17 = v10;
  v18 = v12;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v16;
  result.origin.x = v17;
  return result;
}

- (double)textViewMinXForArtworkFrame:(CGRect)a3 sideViewFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double MaxX;
  _BOOL4 IsEmpty;
  double v14;
  CGRect v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  if (!-[MTGenericCell mt_isRTL](self, "mt_isRTL"))
  {
    x = v11;
    y = v10;
    width = v9;
    height = v8;
  }
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MaxX = CGRectGetMaxX(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  IsEmpty = CGRectIsEmpty(v17);
  v14 = 10.0;
  if (IsEmpty)
    v14 = 0.0;
  return MaxX + v14;
}

- (double)textViewMaxXForArtworkFrame:(CGRect)a3 sideViewFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double MinX;
  _BOOL4 IsEmpty;
  double v14;
  CGRect v16;
  CGRect v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.size.height;
  v9 = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  if (-[MTGenericCell mt_isRTL](self, "mt_isRTL"))
  {
    x = v11;
    y = v10;
    width = v9;
    height = v8;
  }
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  MinX = CGRectGetMinX(v16);
  v17.origin.x = x;
  v17.origin.y = y;
  v17.size.width = width;
  v17.size.height = height;
  IsEmpty = CGRectIsEmpty(v17);
  v14 = 10.0;
  if (IsEmpty)
    v14 = 0.0;
  return MinX - v14;
}

- (void)_updateSideViewHiddenForCurrentState
{
  -[MTGenericCell _updateSideViewHiddenForState:](self, "_updateSideViewHiddenForState:", -[MTGenericCell currentStateMask](self, "currentStateMask"));
}

- (void)_updateSideViewHiddenForState:(unint64_t)a3
{
  _BOOL8 v4;

  v4 = (a3 & 1) != 0 && -[MTGenericCell hidesSideViewWhenEditing](self, "hidesSideViewWhenEditing");
  -[MTGenericCell _setSideViewHidden:](self, "_setSideViewHidden:", v4);
}

- (void)_setSideViewHidden:(BOOL)a3
{
  if (-[MTGenericCell _isSideViewHidden](self, "_isSideViewHidden") != a3)
  {
    self->_sideViewHidden = a3;
    -[MTGenericCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (MTArtworkView)artworkView
{
  MTArtworkView *artworkView;
  MTArtworkView *v4;
  MTArtworkView *v5;

  artworkView = self->_artworkView;
  if (!artworkView)
  {
    v4 = objc_opt_new(MTArtworkView);
    v5 = self->_artworkView;
    self->_artworkView = v4;

    artworkView = self->_artworkView;
  }
  return artworkView;
}

- (MTLabelStackView)textStackView
{
  MTLabelStackView *textStackView;
  id v4;
  MTLabelStackView *v5;
  MTLabelStackView *v6;

  textStackView = self->_textStackView;
  if (!textStackView)
  {
    v4 = objc_msgSend((id)objc_opt_class(self), "textStackViewClass");
    v5 = (MTLabelStackView *)objc_opt_new(v4);
    v6 = self->_textStackView;
    self->_textStackView = v5;

    textStackView = self->_textStackView;
  }
  return textStackView;
}

- (UIView)sideView
{
  return self->_sideView;
}

- (BOOL)hidesSideViewWhenEditing
{
  return self->_hidesSideViewWhenEditing;
}

- (void)setArtworkView:(id)a3
{
  objc_storeStrong((id *)&self->_artworkView, a3);
}

- (void)setTextStackView:(id)a3
{
  objc_storeStrong((id *)&self->_textStackView, a3);
}

- (BOOL)_isSideViewHidden
{
  return self->_sideViewHidden;
}

- (BOOL)showsArtwork
{
  return self->_showsArtwork;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStackView, 0);
  objc_storeStrong((id *)&self->_artworkView, 0);
  objc_storeStrong((id *)&self->_sideView, 0);
}

@end
