@implementation PXUIAssetBadgeView

- (PXUIAssetBadgeView)initWithFrame:(CGRect)a3
{
  PXUIAssetBadgeView *v3;
  PXUIAssetBadgeView *v4;
  void *v5;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXUIAssetBadgeView;
  v3 = -[PXUIAssetBadgeView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PXUIAssetBadgeView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupBlending:", 0);
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);
    __asm { FMOV            V0.2D, #5.0 }
    v4->_bottomElementsPadding = _Q0;

  }
  return v4;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $CD15A5584032E2AC3142AF227CE50D87 *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->menuForBadges = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->userDidSelectBadges = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->dismissPresentedViewController = objc_opt_respondsToSelector() & 1;
  }

}

- (void)prepareForReuse
{
  -[PXUIAssetBadgeView _removeViewsFromGroup:](self, "_removeViewsFromGroup:", self->_topLeftPrimaryGroup);
  -[PXUIAssetBadgeView _removeViewsFromGroup:](self, "_removeViewsFromGroup:", self->_topLeftSecondaryGroup);
  -[PXUIAssetBadgeView _removeViewsFromGroup:](self, "_removeViewsFromGroup:", self->_topRightGroup);
  -[PXUIAssetBadgeView _invalidate](self, "_invalidate");
}

- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3
{
  PXAssetBadgeInfo *p_badgeInfo;
  __int128 v6;
  PXAssetBadgeInfo badgeInfo;
  PXAssetBadgeInfo v8;

  p_badgeInfo = &self->_badgeInfo;
  v8 = *a3;
  badgeInfo = self->_badgeInfo;
  if ((PXAssetBadgeInfoEqualToBadgeInfo() & 1) == 0)
  {
    v6 = *(_OWORD *)&a3->count;
    *(_OWORD *)&p_badgeInfo->badges = *(_OWORD *)&a3->badges;
    *(_OWORD *)&p_badgeInfo->count = v6;
    -[PXUIAssetBadgeView _invalidate](self, "_invalidate", *(_OWORD *)&badgeInfo.badges, *(_OWORD *)&badgeInfo.count, *(_OWORD *)&v8.badges, *(_OWORD *)&v8.count);
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[PXUIAssetBadgeView _invalidate](self, "_invalidate");
  }
}

- (void)setOverContent:(BOOL)a3
{
  if (self->_overContent != a3)
  {
    self->_overContent = a3;
    -[PXUIAssetBadgeView _invalidate](self, "_invalidate");
  }
}

- (void)setContentWidth:(double)a3
{
  if (self->_contentWidth != a3)
  {
    self->_contentWidth = a3;
    -[PXUIAssetBadgeView _invalidate](self, "_invalidate");
  }
}

- (BOOL)_wantsBottomLabel
{
  double v3;

  -[PXUIAssetBadgeView badgeInfo](self, "badgeInfo");
  return v3 > 0.0;
}

- (void)performChanges:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  _QWORD v9[5];
  void (**v10)(_QWORD);

  v4 = a4;
  v6 = (void (**)(_QWORD))a3;
  v7 = v6;
  if (v6)
  {
    if (v4)
    {
      v8 = (void *)MEMORY[0x1E0DC3F10];
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __46__PXUIAssetBadgeView_performChanges_animated___block_invoke;
      v9[3] = &unk_1E5148CE0;
      v9[4] = self;
      v10 = v6;
      objc_msgSend(v8, "transitionWithView:duration:options:animations:completion:", self, 5242886, v9, 0, 0.3);

    }
    else
    {
      v6[2](v6);
    }
  }

}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXUIAssetBadgeView frame](self, "frame");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)PXUIAssetBadgeView;
    -[PXUIAssetBadgeView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    -[PXUIAssetBadgeView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXUIAssetBadgeView;
  -[PXUIAssetBadgeView layoutSubviews](&v3, sel_layoutSubviews);
  -[PXUIAssetBadgeView _updateIfNeeded](self, "_updateIfNeeded");
  -[PXUIAssetBadgeView _layoutTopGroup:](self, "_layoutTopGroup:", self->_topLeftPrimaryGroup);
  -[PXUIAssetBadgeView _layoutTopGroup:](self, "_layoutTopGroup:", self->_topLeftSecondaryGroup);
  -[PXUIAssetBadgeView _layoutTopGroup:](self, "_layoutTopGroup:", self->_topRightGroup);
  -[PXUIAssetBadgeView _layoutBottomCornersImages](self, "_layoutBottomCornersImages");
  -[PXUIAssetBadgeView _layoutBottomLabel](self, "_layoutBottomLabel");
}

- (void)_layoutTopGroup:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(v3, "backgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    objc_msgSend(v3, "button");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

    objc_msgSend(v3, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "imageFrame");
    objc_msgSend(v14, "setFrame:");

    objc_msgSend(v3, "chevronImageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "chevronImageFrame");
    objc_msgSend(v15, "setFrame:");

    objc_msgSend(v3, "label");
    v24 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "labelFrame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);
  }
}

- (void)_removeViewsFromGroup:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v8 = a3;
    objc_msgSend(v8, "backgroundView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(v8, "setBackgroundView:", 0);
    objc_msgSend(v8, "button");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    objc_msgSend(v8, "setButton:", 0);
    objc_msgSend(v8, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeFromSuperview");

    objc_msgSend(v8, "setImageView:", 0);
    objc_msgSend(v8, "chevronImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeFromSuperview");

    objc_msgSend(v8, "setChevronImageView:", 0);
    objc_msgSend(v8, "label");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    objc_msgSend(v8, "setLabel:", 0);
  }
}

- (void)_layoutBottomCornersImages
{
  void *v3;
  void *v4;
  BOOL v5;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  char v15;
  CGFloat *v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double MinX;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double width;
  double height;
  double v53;
  id v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  -[_PXUIAssetBadgeImageView image](self->_bottomLeadingImageView, "image");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  -[_PXUIAssetBadgeImageView image](self->_bottomSpatialBadgeImageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PXUIAssetBadgeImageView image](self->_bottomTrailingImageView, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v54)
    v5 = 0;
  else
    v5 = v4 == 0;
  if (!v5 || v3 != 0)
  {
    width = self->_bottomElementsPadding.width;
    height = self->_bottomElementsPadding.height;
    -[PXUIAssetBadgeView bounds](self, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = -[PXUIAssetBadgeView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v16 = (CGFloat *)MEMORY[0x1E0C9D648];
    v53 = v8;
    if (v54)
    {
      v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      objc_msgSend(v54, "size");
      v19 = v18;
      v21 = v20;
      if ((v15 & 1) != 0)
      {
        v22 = *v16;
        v55.origin.x = v8;
        v55.origin.y = v10;
        v55.size.width = v12;
        v55.size.height = v14;
        v23 = CGRectGetMaxX(v55) - width;
        v56.origin.x = v22;
        v56.origin.y = v17;
        v56.size.width = v19;
        v56.size.height = v21;
        v24 = v23 - CGRectGetWidth(v56);
        v8 = v53;
      }
      else
      {
        v57.origin.x = v8;
        v57.origin.y = v10;
        v57.size.width = v12;
        v57.size.height = v14;
        v24 = width + CGRectGetMinX(v57);
      }
      v58.origin.x = v8;
      v58.origin.y = v10;
      v58.size.width = v12;
      v58.size.height = v14;
      v25 = CGRectGetMaxY(v58) - height;
      v59.origin.x = v24;
      v59.origin.y = v17;
      v59.size.width = v19;
      v59.size.height = v21;
      v26 = v25 - CGRectGetHeight(v59);
      v8 = v53;
      -[_PXUIAssetBadgeImageView setFrame:](self->_bottomLeadingImageView, "setFrame:", v24, v26, v19, v21);
    }
    if (v3)
    {
      v27 = v16[1];
      objc_msgSend(v3, "size");
      v29 = v28;
      v31 = v30;
      if ((v15 & 1) != 0)
      {
        v32 = *v16;
        v60.origin.x = v8;
        v60.origin.y = v10;
        v60.size.width = v12;
        v60.size.height = v14;
        v33 = CGRectGetMaxX(v60) - width;
        -[_PXUIAssetBadgeImageView frame](self->_bottomLeadingImageView, "frame");
        v35 = v33 - v34;
        v61.origin.x = v32;
        v61.origin.y = v27;
        v61.size.width = v29;
        v61.size.height = v31;
        v36 = v35 - CGRectGetWidth(v61);
        v8 = v53;
      }
      else
      {
        v62.origin.x = v8;
        v62.origin.y = v10;
        v62.size.width = v12;
        v62.size.height = v14;
        MinX = CGRectGetMinX(v62);
        -[_PXUIAssetBadgeImageView frame](self->_bottomLeadingImageView, "frame");
        v36 = width + MinX + v38;
      }
      v63.origin.x = v8;
      v63.origin.y = v10;
      v63.size.width = v12;
      v63.size.height = v14;
      v39 = CGRectGetMaxY(v63) - height;
      v64.origin.x = v36;
      v64.origin.y = v27;
      v64.size.width = v29;
      v64.size.height = v31;
      v40 = v39 - CGRectGetHeight(v64);
      v8 = v53;
      -[_PXUIAssetBadgeImageView setFrame:](self->_bottomSpatialBadgeImageView, "setFrame:", v36, v40, v29, v31);
    }
    if (v4)
    {
      v41 = v16[1];
      objc_msgSend(v4, "size");
      v43 = v42;
      v45 = v44;
      if (-[PXUIAssetBadgeView style](self, "style") == 7
        || (-[PXUIAssetBadgeView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) != 0)
      {
        v65.origin.x = v8;
        v65.origin.y = v10;
        v65.size.width = v12;
        v65.size.height = v14;
        v46 = width + CGRectGetMinX(v65);
      }
      else
      {
        v47 = *v16;
        v66.origin.x = v8;
        v66.origin.y = v10;
        v66.size.width = v12;
        v66.size.height = v14;
        v48 = CGRectGetMaxX(v66) - width;
        v67.origin.x = v47;
        v67.origin.y = v41;
        v67.size.width = v43;
        v67.size.height = v45;
        v49 = v48 - CGRectGetWidth(v67);
        v8 = v53;
        v46 = v49 + -2.0;
      }
      v68.origin.x = v8;
      v68.origin.y = v10;
      v68.size.width = v12;
      v68.size.height = v14;
      v50 = CGRectGetMaxY(v68) - height;
      v69.origin.x = v46;
      v69.origin.y = v41;
      v69.size.width = v43;
      v69.size.height = v45;
      -[_PXUIAssetBadgeImageView setFrame:](self->_bottomTrailingImageView, "setFrame:", v46, v50 - CGRectGetHeight(v69) + -4.0, v43, v45);
    }
  }

}

- (void)_layoutBottomLabel
{
  UILabel *bottomLabel;
  double width;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat rect;
  double rect_8;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  bottomLabel = self->_bottomLabel;
  if (bottomLabel && (-[UILabel isHidden](bottomLabel, "isHidden") & 1) == 0)
  {
    width = self->_bottomElementsPadding.width;
    rect_8 = self->_bottomElementsPadding.height + -2.0;
    -[PXUIAssetBadgeView bounds](self, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[UILabel frame](self->_bottomLabel, "frame");
    rect = v13;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    if (-[PXUIAssetBadgeView style](self, "style") == 7
      || (-[PXUIAssetBadgeView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection") & 1) != 0)
    {
      v25.origin.x = v6;
      v25.origin.y = v8;
      v25.size.width = v10;
      v25.size.height = v12;
      v20 = width + CGRectGetMinX(v25);
    }
    else
    {
      v26.origin.x = v6;
      v26.origin.y = v8;
      v26.size.width = v10;
      v26.size.height = v12;
      v21 = CGRectGetMaxX(v26) - width;
      v27.origin.x = rect;
      v27.origin.y = v15;
      v27.size.width = v17;
      v27.size.height = v19;
      v20 = v21 - CGRectGetWidth(v27);
    }
    v28.origin.x = v6;
    v28.origin.y = v8;
    v28.size.width = v10;
    v28.size.height = v12;
    v22 = CGRectGetMaxY(v28) - rect_8;
    v29.origin.x = v20;
    v29.origin.y = v15;
    v29.size.width = v17;
    v29.size.height = v19;
    -[UILabel setFrame:](self->_bottomLabel, "setFrame:", v20, v22 - CGRectGetHeight(v29), v17, v19);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double height;
  CGSize result;

  -[PXUIAssetBadgeView _updateIfNeeded](self, "_updateIfNeeded", a3.width, a3.height);
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[PXUIAssetBadgeView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)_handleButton:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  _PXUIAssetBadgeTopGroup *topLeftPrimaryGroup;
  _PXUIAssetBadgeTopGroup *topLeftSecondaryGroup;
  _PXUIAssetBadgeTopGroup *topRightGroup;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v4 = a3;
  -[_PXUIAssetBadgeTopGroup button](self->_topLeftPrimaryGroup, "button");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    topLeftPrimaryGroup = self->_topLeftPrimaryGroup;
    if (topLeftPrimaryGroup)
    {
      -[_PXUIAssetBadgeTopGroup badgeInfo](topLeftPrimaryGroup, "badgeInfo");
      v8 = v20;
    }
    else
    {
      v8 = 0;
      v20 = 0u;
      v21 = 0u;
    }
  }
  else
  {
    -[_PXUIAssetBadgeTopGroup button](self->_topLeftSecondaryGroup, "button");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      topLeftSecondaryGroup = self->_topLeftSecondaryGroup;
      if (topLeftSecondaryGroup)
      {
        -[_PXUIAssetBadgeTopGroup badgeInfo](topLeftSecondaryGroup, "badgeInfo");
        v8 = v18;
      }
      else
      {
        v8 = 0;
        v18 = 0u;
        v19 = 0u;
      }
    }
    else
    {
      -[_PXUIAssetBadgeTopGroup button](self->_topRightGroup, "button");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        topRightGroup = self->_topRightGroup;
        if (topRightGroup)
        {
          -[_PXUIAssetBadgeTopGroup badgeInfo](topRightGroup, "badgeInfo");
          v8 = v16;
        }
        else
        {
          v8 = 0;
          v16 = 0u;
          v17 = 0u;
        }
      }
      else
      {
        v8 = 0;
      }
    }
  }
  if (self->_delegateRespondsTo.userDidSelectBadges)
  {
    -[PXUIAssetBadgeView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assetBadgeView:userDidSelectBadges:", self, v8);

  }
  if (self->_delegateRespondsTo.dismissPresentedViewController)
  {
    -[PXUIAssetBadgeView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __36__PXUIAssetBadgeView__handleButton___block_invoke;
    v14[3] = &unk_1E5149198;
    v15 = v4;
    objc_msgSend(v13, "assetBadgeView:dismissAnyPresentedViewControllerWithCompletion:", self, v14);

  }
}

- (void)_setBackgroundImage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PXUIAssetBadgeView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "setContentsGravity:", CFSTR("resize"));
  v7 = objc_retainAutorelease(v4);
  objc_msgSend(v6, "setContents:", objc_msgSend(v7, "CGImage"));

}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.topLeftElements
      || self->_needsUpdateFlags.topRightElements
      || self->_needsUpdateFlags.bottomLeadingImage
      || self->_needsUpdateFlags.bottomSpatialBadgeImage
      || self->_needsUpdateFlags.bottomTrailingImage
      || self->_needsUpdateFlags.bottomLabel
      || self->_needsUpdateFlags.background
      || self->_needsUpdateFlags.contentSize;
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingUpdate)
    -[PXUIAssetBadgeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateIfNeeded
{
  BOOL isPerformingUpdate;

  if (-[PXUIAssetBadgeView _needsUpdate](self, "_needsUpdate"))
  {
    isPerformingUpdate = self->_isPerformingUpdate;
    self->_isPerformingUpdate = 1;
    -[PXUIAssetBadgeView _updateTopLeftElementsIfNeeded](self, "_updateTopLeftElementsIfNeeded");
    -[PXUIAssetBadgeView _updateTopRightElementsIfNeeded](self, "_updateTopRightElementsIfNeeded");
    -[PXUIAssetBadgeView _updateBottomLeadingImageIfNeeded](self, "_updateBottomLeadingImageIfNeeded");
    -[PXUIAssetBadgeView _updateBottomSpatialBadgeImageIfNeeded](self, "_updateBottomSpatialBadgeImageIfNeeded");
    -[PXUIAssetBadgeView _updateBottomTrailingImageIfNeeded](self, "_updateBottomTrailingImageIfNeeded");
    -[PXUIAssetBadgeView _updateBottomLabelIfNeeded](self, "_updateBottomLabelIfNeeded");
    -[PXUIAssetBadgeView _updateBackgroundIfNeeded](self, "_updateBackgroundIfNeeded");
    -[PXUIAssetBadgeView _updateContentSizeIfNeeded](self, "_updateContentSizeIfNeeded");
    self->_isPerformingUpdate = isPerformingUpdate;
  }
}

- (void)_invalidate
{
  -[PXUIAssetBadgeView _invalidateTopLeftElements](self, "_invalidateTopLeftElements");
  -[PXUIAssetBadgeView _invalidateTopRightElements](self, "_invalidateTopRightElements");
  -[PXUIAssetBadgeView _invalidateBottomLeadingImage](self, "_invalidateBottomLeadingImage");
  -[PXUIAssetBadgeView _invalidateBottomSpatialBadgeImage](self, "_invalidateBottomSpatialBadgeImage");
  -[PXUIAssetBadgeView _invalidateBottomTrailingImage](self, "_invalidateBottomTrailingImage");
  -[PXUIAssetBadgeView _invalidateBottomLabel](self, "_invalidateBottomLabel");
  -[PXUIAssetBadgeView _invalidateBackground](self, "_invalidateBackground");
  -[PXUIAssetBadgeView _invalidateContentSize](self, "_invalidateContentSize");
}

- (void)_invalidateTopLeftElements
{
  self->_needsUpdateFlags.topLeftElements = 1;
  -[PXUIAssetBadgeView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateTopRightElements
{
  self->_needsUpdateFlags.topRightElements = 1;
  -[PXUIAssetBadgeView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateTopLeftElementsIfNeeded
{
  _PXUIAssetBadgeTopGroup *topLeftPrimaryGroup;
  _PXUIAssetBadgeTopGroup *v4;
  _PXUIAssetBadgeTopGroup *topLeftSecondaryGroup;
  _PXUIAssetBadgeTopGroup *v6;
  CGFloat v7;
  _PXUIAssetBadgeTopGroup *v8;
  _PXUIAssetBadgeTopGroup *v9;
  _PXUIAssetBadgeTopGroup *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  if (self->_needsUpdateFlags.topLeftElements)
  {
    self->_needsUpdateFlags.topLeftElements = 0;
    v17 = 0u;
    v18 = 0u;
    -[PXUIAssetBadgeView badgeInfo](self, "badgeInfo");
    v15 = 0u;
    v16 = 0u;
    v13 = v17;
    v14 = v18;
    +[PXBadgeHelper topLeftPrimaryBadgeInfoForBadgeInfo:](PXBadgeHelper, "topLeftPrimaryBadgeInfoForBadgeInfo:", &v13);
    v13 = 0u;
    v14 = 0u;
    v11 = v17;
    v12 = v18;
    +[PXBadgeHelper topLeftSecondaryBadgeInfoForBadgeInfo:](PXBadgeHelper, "topLeftSecondaryBadgeInfoForBadgeInfo:", &v11);
    topLeftPrimaryGroup = self->_topLeftPrimaryGroup;
    v11 = v15;
    v12 = v16;
    -[PXUIAssetBadgeView _updateTopGroup:withBadgeInfo:](self, "_updateTopGroup:withBadgeInfo:", topLeftPrimaryGroup, &v11);
    v4 = (_PXUIAssetBadgeTopGroup *)objc_claimAutoreleasedReturnValue();
    topLeftSecondaryGroup = self->_topLeftSecondaryGroup;
    v11 = v13;
    v12 = v14;
    -[PXUIAssetBadgeView _updateTopGroup:withBadgeInfo:](self, "_updateTopGroup:withBadgeInfo:", topLeftSecondaryGroup, &v11);
    v6 = (_PXUIAssetBadgeTopGroup *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v11 = v15;
      v12 = v16;
      if ((PXAssetBadgeInfoIsNull() & 1) == 0)
      {
        -[_PXUIAssetBadgeTopGroup frame](v4, "frame");
        v7 = CGRectGetMaxX(v19) + 5.0;
        -[_PXUIAssetBadgeTopGroup frame](v6, "frame");
        v21 = CGRectOffset(v20, v7, 0.0);
        -[_PXUIAssetBadgeTopGroup setFrame:](v6, "setFrame:", v21.origin.x, v21.origin.y, v21.size.width, v21.size.height);
        -[_PXUIAssetBadgeTopGroup imageFrame](v6, "imageFrame");
        v23 = CGRectOffset(v22, v7, 0.0);
        -[_PXUIAssetBadgeTopGroup setImageFrame:](v6, "setImageFrame:", v23.origin.x, v23.origin.y, v23.size.width, v23.size.height);
        -[_PXUIAssetBadgeTopGroup labelFrame](v6, "labelFrame");
        v25 = CGRectOffset(v24, v7, 0.0);
        -[_PXUIAssetBadgeTopGroup setLabelFrame:](v6, "setLabelFrame:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
      }
    }
    v8 = self->_topLeftPrimaryGroup;
    self->_topLeftPrimaryGroup = v4;
    v9 = v4;

    v10 = self->_topLeftSecondaryGroup;
    self->_topLeftSecondaryGroup = v6;

  }
}

- (void)_updateTopRightElementsIfNeeded
{
  _PXUIAssetBadgeTopGroup *topRightGroup;
  _PXUIAssetBadgeTopGroup *v4;
  double contentWidth;
  double v6;
  CGFloat v7;
  _PXUIAssetBadgeTopGroup *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  if (self->_needsUpdateFlags.topRightElements)
  {
    self->_needsUpdateFlags.topRightElements = 0;
    v13 = 0u;
    v14 = 0u;
    -[PXUIAssetBadgeView badgeInfo](self, "badgeInfo");
    v11 = 0u;
    v12 = 0u;
    v9 = v13;
    v10 = v14;
    +[PXBadgeHelper topRightBadgeInfoForBadgeInfo:](PXBadgeHelper, "topRightBadgeInfoForBadgeInfo:", &v9);
    topRightGroup = self->_topRightGroup;
    v9 = v11;
    v10 = v12;
    -[PXUIAssetBadgeView _updateTopGroup:withBadgeInfo:](self, "_updateTopGroup:withBadgeInfo:", topRightGroup, &v9);
    v4 = (_PXUIAssetBadgeTopGroup *)objc_claimAutoreleasedReturnValue();
    contentWidth = self->_contentWidth;
    -[_PXUIAssetBadgeTopGroup frame](v4, "frame");
    v7 = contentWidth - v6;
    -[_PXUIAssetBadgeTopGroup frame](v4, "frame");
    v16 = CGRectOffset(v15, v7, 0.0);
    -[_PXUIAssetBadgeTopGroup setFrame:](v4, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    -[_PXUIAssetBadgeTopGroup imageFrame](v4, "imageFrame");
    v18 = CGRectOffset(v17, v7, 0.0);
    -[_PXUIAssetBadgeTopGroup setImageFrame:](v4, "setImageFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
    -[_PXUIAssetBadgeTopGroup labelFrame](v4, "labelFrame");
    v20 = CGRectOffset(v19, v7, 0.0);
    -[_PXUIAssetBadgeTopGroup setLabelFrame:](v4, "setLabelFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
    -[_PXUIAssetBadgeTopGroup chevronImageFrame](v4, "chevronImageFrame");
    v22 = CGRectOffset(v21, v7, 0.0);
    -[_PXUIAssetBadgeTopGroup setChevronImageFrame:](v4, "setChevronImageFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
    v8 = self->_topRightGroup;
    self->_topRightGroup = v4;

  }
}

- (id)_updateTopGroup:(id)a3 withBadgeInfo:(PXAssetBadgeInfo *)a4
{
  _PXUIAssetBadgeTopGroup *v6;
  int64_t v7;
  _BOOL8 v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  _PXUIAssetBadgeTopGroup *v13;
  __int128 v14;
  int IsToggleable;
  __int128 v16;
  int IsActionable;
  __int128 v18;
  int IsActionableDisabled;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  double v25;
  __int128 v26;
  char IsToggledOn;
  int v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  __objc2_class *v32;
  void *v33;
  char v34;
  __int128 v35;
  uint64_t v36;
  id v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  void *v53;
  int v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  int v63;
  objc_class *v64;
  id v65;
  id v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  void *v72;
  void *v73;
  int v74;
  id WeakRetained;
  void *v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  CGFloat v82;
  double v83;
  CGFloat v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  CGFloat MaxX;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double MaxY;
  CGFloat width;
  CGFloat height;
  void *v104;
  void *v105;
  double v106;
  CGFloat v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  CGFloat v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  void *v127;
  CGFloat v128;
  CGFloat v129;
  CGFloat v130;
  CGFloat v131;
  CGFloat v132;
  CGFloat v133;
  CGFloat v134;
  CGFloat v135;
  CGFloat v136;
  CGFloat v137;
  CGFloat v138;
  CGFloat v139;
  CGFloat v140;
  CGFloat v141;
  CGFloat v142;
  CGFloat v143;
  CGFloat v144;
  CGFloat v145;
  CGFloat v146;
  CGFloat v147;
  CGFloat y;
  double v150;
  CGFloat x;
  CGFloat v152;
  void *v153;
  CGFloat v154;
  CGFloat v155;
  CGFloat r1;
  void *v157;
  void *v158;
  double v159;
  double v160;
  double v161;
  double v162;
  int v163;
  double v164;
  int v165;
  CGFloat v166;
  int v167;
  CGFloat v168;
  double v169;
  int v170;
  double v171;
  uint64_t v172;
  PXUIAssetBadgeView *v173;
  double v174;
  int v175;
  double v176;
  __int128 v177;
  __int128 v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;
  CGRect v190;
  CGRect v191;

  v6 = (_PXUIAssetBadgeTopGroup *)a3;
  v7 = -[PXUIAssetBadgeView style](self, "style");
  v173 = self;
  v8 = -[PXUIAssetBadgeView isOverContent](self, "isOverContent");
  if ((unint64_t)(v7 - 3) > 3)
  {
    v12 = 0;
    v10 = 0;
  }
  else
  {
    v9 = *(_OWORD *)&a4->count;
    v177 = *(_OWORD *)&a4->badges;
    v178 = v9;
    +[PXBadgeHelper imageForBadgeInfo:style:isOverContent:](PXBadgeHelper, "imageForBadgeInfo:style:isOverContent:", &v177, v7, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_OWORD *)&a4->count;
    v177 = *(_OWORD *)&a4->badges;
    v178 = v11;
    +[PXBadgeHelper textForBadgeInfo:style:](PXBadgeHelper, "textForBadgeInfo:style:", &v177, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v6;
  v14 = *(_OWORD *)&a4->count;
  v177 = *(_OWORD *)&a4->badges;
  v178 = v14;
  IsToggleable = PXAssetBadgeInfoIsToggleable();
  v16 = *(_OWORD *)&a4->count;
  v177 = *(_OWORD *)&a4->badges;
  v178 = v16;
  IsActionable = PXAssetBadgeInfoIsActionable();
  v18 = *(_OWORD *)&a4->count;
  v177 = *(_OWORD *)&a4->badges;
  v178 = v18;
  IsActionableDisabled = PXAssetBadgeInfoIsActionableDisabled();
  v165 = IsActionable & (IsActionableDisabled ^ 1);
  v158 = v12;
  v20 = objc_msgSend(v12, "length");
  v21 = (void *)v10;
  v163 = IsToggleable | v165;
  if (v10)
    v22 = 1;
  else
    v22 = IsToggleable | v165;
  v172 = v20;
  if (v20)
    v23 = 1;
  else
    v23 = v22;
  if (v7 == 5)
    v24 = 0;
  else
    v24 = v23;
  if (IsActionable)
    v25 = 3.0;
  else
    v25 = 2.0;
  v167 = v24;
  if (!IsToggleable)
  {
    v28 = IsActionable;
    if (IsActionable)
    {
      if ((IsActionableDisabled & 1) != 0)
        +[PXUIInteractiveBadgeTheme disabledActionableBadgeTheme](PXUIInteractiveBadgeTheme, "disabledActionableBadgeTheme");
      else
        +[PXUIInteractiveBadgeTheme actionableBadgeTheme](PXUIInteractiveBadgeTheme, "actionableBadgeTheme");
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((v24 & 1) != 0)
        v32 = PXUIDefaultBadgeTheme;
      else
        v32 = PXUINoBackgroundBadgeTheme;
      -[__objc2_class sharedBadgeTheme](v32, "sharedBadgeTheme");
      v29 = objc_claimAutoreleasedReturnValue();
    }
    v33 = (void *)v29;
    goto LABEL_38;
  }
  v26 = *(_OWORD *)&a4->count;
  v177 = *(_OWORD *)&a4->badges;
  v178 = v26;
  IsToggledOn = PXAssetBadgeInfoIsToggledOn();
  if ((a4->badges & 0x100000) == 0)
  {
    if ((IsToggledOn & 1) != 0)
      +[PXUIInteractiveBadgeTheme sharedToggledOnBadgeTheme](PXUIInteractiveBadgeTheme, "sharedToggledOnBadgeTheme");
    else
      +[PXUIInteractiveBadgeTheme sharedToggledOffBadgeTheme](PXUIInteractiveBadgeTheme, "sharedToggledOffBadgeTheme");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = IsActionable;
LABEL_38:
    v30 = v21;
    goto LABEL_41;
  }
  v28 = IsActionable;
  v30 = (void *)v10;
  if (v8)
  {
    if ((IsToggledOn & 1) != 0)
      +[PXUIInteractiveWithBorderBadgeTheme sharedToggledOnOverContentBadgeTheme](PXUIInteractiveWithBorderBadgeTheme, "sharedToggledOnOverContentBadgeTheme");
    else
      +[PXUIInteractiveWithBorderBadgeTheme sharedToggledOffOverContentBadgeTheme](PXUIInteractiveWithBorderBadgeTheme, "sharedToggledOffOverContentBadgeTheme");
  }
  else if ((IsToggledOn & 1) != 0)
  {
    +[PXUIInteractiveWithBorderBadgeTheme sharedToggledOnBadgeTheme](PXUIInteractiveWithBorderBadgeTheme, "sharedToggledOnBadgeTheme");
  }
  else
  {
    +[PXUIInteractiveWithBorderBadgeTheme sharedToggledOffBadgeTheme](PXUIInteractiveWithBorderBadgeTheme, "sharedToggledOffBadgeTheme");
  }
  v31 = objc_claimAutoreleasedReturnValue();
  v33 = (void *)v31;
LABEL_41:
  v175 = v28 | IsActionableDisabled;
  v34 = v23 ^ 1;
  if (v13)
    v34 = 1;
  if ((v34 & 1) == 0)
    v13 = objc_alloc_init(_PXUIAssetBadgeTopGroup);
  v35 = *(_OWORD *)&a4->count;
  v177 = *(_OWORD *)&a4->badges;
  v178 = v35;
  -[_PXUIAssetBadgeTopGroup setBadgeInfo:](v13, "setBadgeInfo:", &v177);
  -[_PXUIAssetBadgeTopGroup imageView](v13, "imageView");
  v36 = objc_claimAutoreleasedReturnValue();
  v37 = (id)v36;
  if (v30)
  {
    v38 = v36 == 0;
    if (!v36)
    {
      v37 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      -[PXUIAssetBadgeView addSubview:](v173, "addSubview:", v37);
      -[_PXUIAssetBadgeTopGroup setImageView:](v13, "setImageView:", v37);
    }
    objc_msgSend(v33, "imageConfiguration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setSymbolConfiguration:", v39);

    objc_msgSend(v33, "imageAlpha");
    objc_msgSend(v37, "setAlpha:");
    objc_msgSend(v33, "imageTintColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setTintColor:", v40);

    objc_msgSend(v37, "layer");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "imageCompositingFilter");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "setCompositingFilter:", v42);

    objc_msgSend(v37, "setImage:", v30);
    objc_msgSend(v37, "sizeToFit");
  }
  else
  {
    v38 = 0;
  }
  objc_msgSend(v37, "setHidden:", v30 == 0);
  -[_PXUIAssetBadgeTopGroup chevronImageView](v13, "chevronImageView");
  v43 = objc_claimAutoreleasedReturnValue();
  v44 = (id)v43;
  if (v175)
  {
    if (!v43)
    {
      v44 = objc_alloc_init(MEMORY[0x1E0DC3890]);
      -[PXUIAssetBadgeView addSubview:](v173, "addSubview:", v44);
      -[_PXUIAssetBadgeTopGroup setChevronImageView:](v13, "setChevronImageView:", v44);
      v38 = 1;
    }
    objc_msgSend(v33, "imageConfiguration");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setSymbolConfiguration:", v45);

    objc_msgSend(v33, "imageAlpha");
    objc_msgSend(v44, "setAlpha:");
    objc_msgSend(v33, "afterLabelImageTintColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setTintColor:", v46);

    objc_msgSend(v44, "layer");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "imageCompositingFilter");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "setCompositingFilter:", v48);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.down"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setImage:", v49);

    objc_msgSend(v44, "sizeToFit");
  }
  v50 = v172;
  objc_msgSend(v44, "setHidden:", v175 ^ 1u);
  -[_PXUIAssetBadgeTopGroup label](v13, "label");
  v51 = objc_claimAutoreleasedReturnValue();
  v52 = (id)v51;
  v170 = v38;
  if (v172)
  {
    v53 = v30;
    v54 = v28;
    if (!v51)
    {
      v52 = objc_alloc_init(MEMORY[0x1E0DC3990]);
      -[PXUIAssetBadgeView addSubview:](v173, "addSubview:", v52);
      -[_PXUIAssetBadgeTopGroup setLabel:](v13, "setLabel:", v52);
      objc_msgSend(v52, "setTextAlignment:", 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setBackgroundColor:", v55);

      v170 = 1;
    }
    objc_msgSend(v33, "labelFont");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setFont:", v56);

    objc_msgSend(v33, "labelAlpha");
    objc_msgSend(v52, "setAlpha:");
    objc_msgSend(v33, "labelTextColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v52;
    if (v57)
    {
      objc_msgSend(v52, "setTextColor:", v57);
    }
    else
    {
      objc_msgSend(v52, "tintColor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setTextColor:", v59);

      v52 = v58;
    }

    objc_msgSend(v52, "layer");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "labelCompositingFilter");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setCompositingFilter:", v61);

    v52 = v58;
    objc_msgSend(v58, "setText:", v158);
    objc_msgSend(v58, "sizeToFit");
    v28 = v54;
    v30 = v53;
    v50 = v172;
  }
  objc_msgSend(v52, "setHidden:", v50 == 0);
  -[_PXUIAssetBadgeTopGroup backgroundView](v13, "backgroundView");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v167;
  v157 = v37;
  if (v167)
  {
    v64 = (objc_class *)objc_msgSend(v33, "backgroundViewClass");
    if (v62)
    {
      if ((objc_class *)objc_opt_class() == v64)
      {
LABEL_69:
        objc_msgSend(v33, "backgroundColor");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setBackgroundColor:", v68);

        objc_msgSend(v62, "layer");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "backgroundCornerRadius");
        objc_msgSend(v69, "setCornerRadius:");

        objc_msgSend(v62, "layer");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "backgroundBorderColor");
        v71 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v70, "setBorderColor:", objc_msgSend(v71, "CGColor"));

        objc_msgSend(v62, "layer");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "backgroundBorderWidth");
        objc_msgSend(v72, "setBorderWidth:");

        objc_msgSend(v33, "backgroundAlpha");
        objc_msgSend(v62, "setAlpha:");
        v63 = v167;
        goto LABEL_70;
      }
      objc_msgSend(v62, "removeFromSuperview");

      -[_PXUIAssetBadgeTopGroup setBackgroundView:](v13, "setBackgroundView:", 0);
    }
    if (v64 == (objc_class *)objc_opt_class())
    {
      v66 = objc_alloc(MEMORY[0x1E0DC3F58]);
      objc_msgSend(v33, "backgroundBlurEffect");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (id)objc_msgSend(v66, "initWithEffect:", v67);

    }
    else
    {
      v65 = objc_alloc_init(v64);
    }
    v170 = 1;
    objc_msgSend(v65, "setClipsToBounds:", 1);
    -[PXUIAssetBadgeView addSubview:](v173, "addSubview:", v65);
    -[_PXUIAssetBadgeTopGroup setBackgroundView:](v13, "setBackgroundView:", v65);
    v62 = v65;
    goto LABEL_69;
  }
LABEL_70:
  objc_msgSend(v62, "setHidden:", v63 ^ 1u);
  -[_PXUIAssetBadgeTopGroup button](v13, "button");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  v74 = v163;
  if (v73)
    v74 = 0;
  if (v74 == 1)
  {
    +[PXUIButton buttonWithType:](PXUIButton, "buttonWithType:", 0);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXUIAssetBadgeView addSubview:](v173, "addSubview:", v73);
    -[_PXUIAssetBadgeTopGroup setButton:](v13, "setButton:", v73);
    v170 = 1;
  }
  v153 = v44;
  if (v165)
  {
    if (v173->_delegateRespondsTo.menuForBadges)
    {
      WeakRetained = objc_loadWeakRetained((id *)&v173->_delegate);
      objc_msgSend(WeakRetained, "assetBadgeView:menuForBadges:", v173, a4->badges);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v76 = 0;
    }
    objc_msgSend(v73, "setMenu:", v76);
    objc_msgSend(v73, "setShowsMenuAsPrimaryAction:", !v173->_delegateRespondsTo.dismissPresentedViewController);

  }
  else
  {
    objc_msgSend(v73, "setMenu:", 0);
    objc_msgSend(v73, "setShowsMenuAsPrimaryAction:", 0);
  }
  objc_msgSend(v73, "addTarget:action:forControlEvents:", v173, sel__handleButton_, 24576);
  objc_msgSend(v73, "setHidden:", v163 ^ 1u);
  if (v170)
  {
    if (v62)
      -[PXUIAssetBadgeView sendSubviewToBack:](v173, "sendSubviewToBack:", v62);
    if (v73)
      -[PXUIAssetBadgeView bringSubviewToFront:](v173, "bringSubviewToFront:", v73);
  }
  v159 = v25;
  v77 = *MEMORY[0x1E0C9D648];
  v78 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v79 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v80 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v155 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  r1 = v79;
  v154 = v78;
  if (v30)
  {
    objc_msgSend(v157, "frame");
    v82 = v81;
    v84 = v83;
    v85 = 8.0;
    if (!v175)
      v85 = v80;
    if (v172)
    {
      objc_msgSend(v52, "frame", v85);
      v87 = v86;
      v89 = v88;
      v179.origin.x = 5.0;
      v90 = v159;
      v179.origin.y = v159;
      v174 = v82;
      v179.size.width = v82;
      v166 = v84;
      v179.size.height = v84;
      MaxX = CGRectGetMaxX(v179);
      v92 = v89;
      v93 = v87;
      v94 = v159 + MaxX;
      v168 = v159;
      v171 = 5.0;
      v95 = v78;
      v96 = v155;
      v79 = r1;
LABEL_92:
      v161 = v94;
      v162 = v92;
      v99 = v94;
      v100 = v90;
      v164 = v93;
      MaxY = CGRectGetMaxY(*(CGRect *)(&v93 - 2));
      y = v95;
      v160 = v90;
      x = v77;
      width = v79;
      height = v96;
      goto LABEL_95;
    }
    v171 = 5.0;
    v97 = v159;
    v98 = 5.0;
    v96 = v155;
  }
  else
  {
    v171 = *MEMORY[0x1E0C9D648];
    v97 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v82 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v84 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v98 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    v96 = v84;
    if (v172)
    {
      objc_msgSend(v52, "frame", v97);
      v94 = 5.0;
      v174 = v79;
      v95 = v154;
      v166 = v84;
      v168 = v154;
      v171 = v77;
      v90 = v159;
      goto LABEL_92;
    }
  }
  v174 = v82;
  v166 = v84;
  v168 = v97;
  +[PXUIAssetBadgeView measuringLabel](PXUIAssetBadgeView, "measuringLabel", *(_QWORD *)&v98);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "labelFont");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "setFont:", v105);

  objc_msgSend(v104, "sizeToFit");
  objc_msgSend(v104, "frame");
  width = v180.size.width;
  height = v180.size.height;
  y = v180.origin.y;
  x = v180.origin.x;
  v106 = v159 + CGRectGetHeight(v180);

  MaxY = v106;
  v160 = v154;
  v161 = v77;
  v162 = v96;
  v164 = v79;
  v90 = v159;
  v95 = v154;
LABEL_95:
  v107 = v79;
  v152 = v77;
  if (v175)
  {
    v108 = MaxY;
    objc_msgSend(v153, "frame");
    v107 = v109;
    v96 = v110;
    if (!v30 || v172)
    {
      if (v172)
      {
        v113 = v160;
        v112 = v161;
        v115 = v162;
        v114 = v164;
      }
      else
      {
        v113 = y;
        v112 = x;
        v114 = width;
        v115 = height;
      }
      v111 = CGRectGetMaxX(*(CGRect *)&v112);
    }
    else
    {
      v111 = v171 + v174;
    }
    v77 = v90 + v111;
    v95 = v90;
    MaxY = v108;
  }
  v116 = v95;
  v117 = v77;
  v118 = v90;
  v119 = v90 + MaxY;
  if (v30)
  {
    v181.origin.y = v168;
    v181.origin.x = v171;
    v120 = v174;
    v181.size.width = v174;
    v121 = v166;
    v181.size.height = v166;
    v122 = v119 - CGRectGetHeight(v181);
    v123 = 4.0;
    if (v28)
      v123 = 6.0;
    v124 = v118 / v123 * v122;
  }
  else
  {
    v120 = v174;
    v121 = v166;
    v124 = v168;
  }
  v150 = v107;
  if (v175)
  {
    v182.origin.x = v117;
    v182.origin.y = v116;
    v182.size.width = v107;
    v182.size.height = v96;
    v125 = v119 - CGRectGetHeight(v182);
    v126 = 4.0;
    if (v28)
      v126 = 6.0;
    v176 = v159 / v126 * v125;
    v127 = v153;
  }
  else
  {
    v127 = v153;
    v176 = v116;
  }
  sub_1A7AE3F38();
  PXEdgeInsetsInsetRect();
  v189.origin.x = v128;
  v189.origin.y = v129;
  v189.size.width = v130;
  v189.size.height = v131;
  v183.origin.x = v152;
  v183.origin.y = v154;
  v183.size.height = v155;
  v183.size.width = r1;
  v184 = CGRectUnion(v183, v189);
  v132 = v184.origin.x;
  v169 = v124;
  v133 = v184.origin.y;
  v134 = v184.size.width;
  v135 = v184.size.height;
  sub_1A7AE3F38();
  PXEdgeInsetsInsetRect();
  v190.origin.x = v136;
  v190.origin.y = v137;
  v190.size.width = v138;
  v190.size.height = v139;
  v185.origin.x = v132;
  v185.origin.y = v133;
  v185.size.width = v134;
  v185.size.height = v135;
  v186 = CGRectUnion(v185, v190);
  v140 = v186.origin.x;
  v141 = v186.origin.y;
  v142 = v186.size.width;
  v143 = v186.size.height;
  sub_1A7AE3F38();
  PXEdgeInsetsInsetRect();
  v191.origin.x = v144;
  v191.origin.y = v145;
  v191.size.width = v146;
  v191.size.height = v147;
  v187.origin.x = v140;
  v187.origin.y = v141;
  v187.size.width = v142;
  v187.size.height = v143;
  v188 = CGRectUnion(v187, v191);
  -[_PXUIAssetBadgeTopGroup setFrame:](v13, "setFrame:", v188.origin.x, v188.origin.y, v188.size.width, v188.size.height);
  -[_PXUIAssetBadgeTopGroup setImageFrame:](v13, "setImageFrame:", v171, v169, v120, v121);
  -[_PXUIAssetBadgeTopGroup setLabelFrame:](v13, "setLabelFrame:", v161, v160, v164, v162);
  -[_PXUIAssetBadgeTopGroup setChevronImageFrame:](v13, "setChevronImageFrame:", v117, v176, v150, v96);

  return v13;
}

- (void)_invalidateBottomLeadingImage
{
  self->_needsUpdateFlags.bottomLeadingImage = 1;
  -[PXUIAssetBadgeView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_invalidateBottomSpatialBadgeImage
{
  self->_needsUpdateFlags.bottomSpatialBadgeImage = 1;
  -[PXUIAssetBadgeView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateBottomLeadingImageIfNeeded
{
  int64_t v3;
  uint64_t v4;
  void *v5;
  _PXUIAssetBadgeImageView *v6;
  _PXUIAssetBadgeImageView *bottomLeadingImageView;
  char v8;

  if (self->_needsUpdateFlags.bottomLeadingImage)
  {
    self->_needsUpdateFlags.bottomLeadingImage = 0;
    -[PXUIAssetBadgeView badgeInfo](self, "badgeInfo");
    if ((v8 & 1) != 0)
    {
      v3 = -[PXUIAssetBadgeView style](self, "style");
      if (v3 == 2)
      {
        +[PXBadgeHelper favoritesCollectionBadgeImage](PXBadgeHelper, "favoritesCollectionBadgeImage");
        v4 = objc_claimAutoreleasedReturnValue();
LABEL_10:
        v5 = (void *)v4;
        if (v4)
        {
          if (!self->_bottomLeadingImageView)
          {
            v6 = objc_alloc_init(_PXUIAssetBadgeImageView);
            bottomLeadingImageView = self->_bottomLeadingImageView;
            self->_bottomLeadingImageView = v6;

            -[PXUIAssetBadgeView addSubview:](self, "addSubview:", self->_bottomLeadingImageView);
          }
        }
        goto LABEL_7;
      }
      if (v3 == 1)
      {
        +[PXBadgeHelper favoriteBadgeImage](PXBadgeHelper, "favoriteBadgeImage");
        v4 = objc_claimAutoreleasedReturnValue();
        goto LABEL_10;
      }
    }
    v5 = 0;
LABEL_7:
    -[_PXUIAssetBadgeImageView setImage:](self->_bottomLeadingImageView, "setImage:", v5);

  }
}

- (void)_updateBottomSpatialBadgeImageIfNeeded
{
  void *v3;
  _PXUIAssetBadgeImageView *v4;
  _PXUIAssetBadgeImageView *bottomSpatialBadgeImageView;
  char v6;

  if (self->_needsUpdateFlags.bottomSpatialBadgeImage)
  {
    self->_needsUpdateFlags.bottomSpatialBadgeImage = 0;
    -[PXUIAssetBadgeView badgeInfo](self, "badgeInfo");
    if ((v6 & 2) != 0 && -[PXUIAssetBadgeView style](self, "style") == 1)
    {
      +[PXBadgeHelper(iOS) spatialBadgeImage](PXBadgeHelper, "spatialBadgeImage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        if (!self->_bottomSpatialBadgeImageView)
        {
          v4 = objc_alloc_init(_PXUIAssetBadgeImageView);
          bottomSpatialBadgeImageView = self->_bottomSpatialBadgeImageView;
          self->_bottomSpatialBadgeImageView = v4;

          -[PXUIAssetBadgeView addSubview:](self, "addSubview:", self->_bottomSpatialBadgeImageView);
        }
      }
    }
    else
    {
      v3 = 0;
    }
    -[_PXUIAssetBadgeImageView setImage:](self->_bottomSpatialBadgeImageView, "setImage:", v3);
    -[_PXUIAssetBadgeImageView sizeToFit](self->_bottomSpatialBadgeImageView, "sizeToFit");

  }
}

- (void)_invalidateBottomTrailingImage
{
  self->_needsUpdateFlags.bottomTrailingImage = 1;
  -[PXUIAssetBadgeView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateBottomTrailingImageIfNeeded
{
  int64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  _PXUIAssetBadgeImageView *v8;
  _PXUIAssetBadgeImageView *bottomTrailingImageView;
  int v10;

  if (self->_needsUpdateFlags.bottomTrailingImage)
  {
    self->_needsUpdateFlags.bottomTrailingImage = 0;
    if (-[PXUIAssetBadgeView _wantsBottomLabel](self, "_wantsBottomLabel"))
      goto LABEL_11;
    v3 = -[PXUIAssetBadgeView style](self, "style");
    if (v3 != 7 && v3 != 1)
      goto LABEL_11;
    -[PXUIAssetBadgeView badgeInfo](self, "badgeInfo");
    if ((v10 & 0x180) != 0)
    {
      +[PXAssetVariationsSettings sharedInstance](PXAssetVariationsSettings, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "showLoopBadges");

      if (v5)
      {
        +[PXBadgeHelper loopingBadgeImage](PXBadgeHelper, "loopingBadgeImage");
        v6 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
    }
    if ((v10 & 2) != 0)
    {
      +[PXBadgeHelper panoramaBadgeImage](PXBadgeHelper, "panoramaBadgeImage");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else if ((v10 & 0x20) != 0)
    {
      +[PXBadgeHelper cloudBadgeImage](PXBadgeHelper, "cloudBadgeImage");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((v10 & 0x80000000) == 0)
      {
LABEL_11:
        v7 = 0;
LABEL_12:
        -[_PXUIAssetBadgeImageView setImage:](self->_bottomTrailingImageView, "setImage:", v7);

        return;
      }
      +[PXBadgeHelper contentSyndicationBadgeImage](PXBadgeHelper, "contentSyndicationBadgeImage");
      v6 = objc_claimAutoreleasedReturnValue();
    }
LABEL_17:
    v7 = (void *)v6;
    if (v6)
    {
      if (!self->_bottomTrailingImageView)
      {
        v8 = objc_alloc_init(_PXUIAssetBadgeImageView);
        bottomTrailingImageView = self->_bottomTrailingImageView;
        self->_bottomTrailingImageView = v8;

        -[PXUIAssetBadgeView addSubview:](self, "addSubview:", self->_bottomTrailingImageView);
      }
    }
    goto LABEL_12;
  }
}

- (void)_invalidateBottomLabel
{
  self->_needsUpdateFlags.bottomLabel = 1;
  -[PXUIAssetBadgeView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateBottomLabelIfNeeded
{
  UILabel *v3;
  UILabel *bottomLabel;
  UILabel *v5;
  void *v6;
  UILabel *v7;
  void *v8;
  UILabel *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  if (self->_needsUpdateFlags.bottomLabel)
  {
    self->_needsUpdateFlags.bottomLabel = 0;
    if (-[PXUIAssetBadgeView _wantsBottomLabel](self, "_wantsBottomLabel"))
    {
      if (!self->_bottomLabel)
      {
        v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
        bottomLabel = self->_bottomLabel;
        self->_bottomLabel = v3;

        v5 = self->_bottomLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setBackgroundColor:](v5, "setBackgroundColor:", v6);

        v7 = self->_bottomLabel;
        objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setFont:](v7, "setFont:", v8);

        v9 = self->_bottomLabel;
        objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[UILabel setTextColor:](v9, "setTextColor:", v10);

        -[UILabel setTextAlignment:](self->_bottomLabel, "setTextAlignment:", 4);
        -[PXUIAssetBadgeView addSubview:](self, "addSubview:", self->_bottomLabel);
      }
      -[PXUIAssetBadgeView badgeInfo](self, "badgeInfo");
      PXLocalizedVideoDuration();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel text](self->_bottomLabel, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", v11);

      if ((v13 & 1) == 0)
      {
        -[UILabel setText:](self->_bottomLabel, "setText:", v11);
        -[UILabel sizeToFit](self->_bottomLabel, "sizeToFit");
      }

    }
    -[UILabel setHidden:](self->_bottomLabel, "setHidden:", -[PXUIAssetBadgeView _wantsBottomLabel](self, "_wantsBottomLabel") ^ 1);
  }
}

- (void)_invalidateBackground
{
  self->_needsUpdateFlags.background = 1;
  -[PXUIAssetBadgeView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateBackgroundIfNeeded
{
  int64_t v3;
  void *v4;

  if (self->_needsUpdateFlags.background)
  {
    self->_needsUpdateFlags.background = 0;
    -[PXUIAssetBadgeView badgeInfo](self, "badgeInfo");
    v3 = -[PXUIAssetBadgeView style](self, "style");
    if (v3 == 7 || v3 == 1)
    {
      +[PXAssetVariationsSettings sharedInstance](PXAssetVariationsSettings, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "showLoopBadges");

    }
    -[PXUIAssetBadgeView _setBackgroundImage:](self, "_setBackgroundImage:", 0);

  }
}

- (void)_invalidateContentSize
{
  self->_needsUpdateFlags.contentSize = 1;
  -[PXUIAssetBadgeView _setNeedsUpdate](self, "_setNeedsUpdate");
}

- (void)_updateContentSizeIfNeeded
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  _PXUIAssetBadgeTopGroup *topLeftPrimaryGroup;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _PXUIAssetBadgeTopGroup *topLeftSecondaryGroup;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  _PXUIAssetBadgeTopGroup *topRightGroup;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  if (self->_needsUpdateFlags.contentSize)
  {
    self->_needsUpdateFlags.contentSize = 0;
    x = *MEMORY[0x1E0C9D648];
    y = *(double *)(MEMORY[0x1E0C9D648] + 8);
    width = *(double *)(MEMORY[0x1E0C9D648] + 16);
    height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    topLeftPrimaryGroup = self->_topLeftPrimaryGroup;
    if (topLeftPrimaryGroup)
    {
      -[_PXUIAssetBadgeTopGroup badgeInfo](topLeftPrimaryGroup, "badgeInfo");
      if ((PXAssetBadgeInfoIsNull() & 1) == 0)
      {
        -[_PXUIAssetBadgeTopGroup frame](self->_topLeftPrimaryGroup, "frame");
        v28.origin.x = v8;
        v28.origin.y = v9;
        v28.size.width = v10;
        v28.size.height = v11;
        v22.origin.x = x;
        v22.origin.y = y;
        v22.size.width = width;
        v22.size.height = height;
        v23 = CGRectUnion(v22, v28);
        x = v23.origin.x;
        y = v23.origin.y;
        width = v23.size.width;
        height = v23.size.height;
      }
    }
    topLeftSecondaryGroup = self->_topLeftSecondaryGroup;
    if (topLeftSecondaryGroup)
    {
      -[_PXUIAssetBadgeTopGroup badgeInfo](topLeftSecondaryGroup, "badgeInfo");
      if ((PXAssetBadgeInfoIsNull() & 1) == 0)
      {
        -[_PXUIAssetBadgeTopGroup frame](self->_topLeftSecondaryGroup, "frame");
        v29.origin.x = v13;
        v29.origin.y = v14;
        v29.size.width = v15;
        v29.size.height = v16;
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        v25 = CGRectUnion(v24, v29);
        x = v25.origin.x;
        y = v25.origin.y;
        width = v25.size.width;
        height = v25.size.height;
      }
    }
    topRightGroup = self->_topRightGroup;
    if (topRightGroup)
    {
      -[_PXUIAssetBadgeTopGroup badgeInfo](topRightGroup, "badgeInfo");
      if ((PXAssetBadgeInfoIsNull() & 1) == 0)
      {
        -[_PXUIAssetBadgeTopGroup frame](self->_topRightGroup, "frame");
        v30.origin.x = v18;
        v30.origin.y = v19;
        v30.size.width = v20;
        v30.size.height = v21;
        v26.origin.x = x;
        v26.origin.y = y;
        v26.size.width = width;
        v26.size.height = height;
        v27 = CGRectUnion(v26, v30);
        width = v27.size.width;
        height = v27.size.height;
      }
    }
    self->_contentSize.width = width;
    self->_contentSize.height = height;
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  y = a3.y;
  x = a3.x;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PXUIAssetBadgeView;
  if (-[PXUIAssetBadgeView pointInside:withEvent:](&v20, sel_pointInside_withEvent_, v7, x, y))
  {
    v8 = 1;
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[PXUIAssetBadgeView subviews](self, "subviews", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[PXUIAssetBadgeView convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
          if ((objc_msgSend(v14, "pointInside:withEvent:", v7) & 1) != 0)
          {
            v8 = 1;
            goto LABEL_13;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v11)
          continue;
        break;
      }
    }
    v8 = 0;
LABEL_13:

  }
  return v8;
}

- (PXUIAssetBadgeViewDelegate)delegate
{
  return (PXUIAssetBadgeViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXAssetBadgeInfo)badgeInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[17].fileSize;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&self[17].duration;
  *(_OWORD *)&retstr->count = v3;
  return self;
}

- (int64_t)style
{
  return self->_style;
}

- (BOOL)isOverContent
{
  return self->_overContent;
}

- (double)contentWidth
{
  return self->_contentWidth;
}

- (CGSize)bottomElementsPadding
{
  double width;
  double height;
  CGSize result;

  width = self->_bottomElementsPadding.width;
  height = self->_bottomElementsPadding.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBottomElementsPadding:(CGSize)a3
{
  self->_bottomElementsPadding = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_bottomTrailingImageView, 0);
  objc_storeStrong((id *)&self->_bottomSpatialBadgeImageView, 0);
  objc_storeStrong((id *)&self->_bottomLeadingImageView, 0);
  objc_storeStrong((id *)&self->_topRightGroup, 0);
  objc_storeStrong((id *)&self->_topLeftSecondaryGroup, 0);
  objc_storeStrong((id *)&self->_topLeftPrimaryGroup, 0);
}

void __36__PXUIAssetBadgeView__handleButton___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "contextMenuInteraction");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_presentMenuAtLocation:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

}

uint64_t __46__PXUIAssetBadgeView_performChanges_animated___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

+ (void)preloadResourcesForStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) <= 2 && preloadResourcesForStyle__onceToken != -1)
    dispatch_once(&preloadResourcesForStyle__onceToken, &__block_literal_global_291166);
  if (a3 == 7)
  {
    if (preloadResourcesForStyle__onceToken_139 != -1)
      dispatch_once(&preloadResourcesForStyle__onceToken_139, &__block_literal_global_140_291169);
  }
  else if (a3 == 6)
  {
    if (preloadResourcesForStyle__onceToken_136[0] != -1)
      dispatch_once(preloadResourcesForStyle__onceToken_136, &__block_literal_global_137_291168);
  }
  else if (a3 == 1 && preloadResourcesForStyle__onceToken_131 != -1)
  {
    dispatch_once(&preloadResourcesForStyle__onceToken_131, &__block_literal_global_132_291167);
  }
}

+ (double)preferredHeightForStyle:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 1) <= 6)
    return dbl_1A7C0C000[a3 - 1];
  return result;
}

+ (id)measuringLabel
{
  if (measuringLabel_onceToken != -1)
    dispatch_once(&measuringLabel_onceToken, &__block_literal_global_142_291165);
  return (id)measuringLabel_measuringLabel;
}

+ (id)badgeSizeCacheKeyValueFromBadgeInfo:(PXAssetBadgeInfo *)a3 contentWidth:(double)a4
{
  _QWORD v5[4];

  v5[0] = a3->badges;
  v5[1] = *(_QWORD *)&a3->duration;
  v5[2] = a3->count;
  *(double *)&v5[3] = a4;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B18]), "initWithBytes:objCType:", v5, "{_PXBadgeSizeCacheKey=Qdqd}");
}

+ (CGSize)sizeForBadgeInfo:(PXAssetBadgeInfo *)a3 contentWidth:(double)a4
{
  __int128 v6;
  double v7;
  double v8;
  void *v9;
  __int128 v10;
  void *v11;
  void *v12;
  __int128 v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _QWORD v20[4];
  __int128 v21;
  __int128 v22;
  double v23;
  __int128 v24;
  __int128 v25;
  CGSize result;

  v6 = *(_OWORD *)&a3->count;
  v24 = *(_OWORD *)&a3->badges;
  v25 = v6;
  if (PXAssetBadgeInfoIsNull())
  {
    v7 = *MEMORY[0x1E0C9D820];
    v8 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    if (sizeForBadgeInfo_contentWidth__onceToken != -1)
      dispatch_once(&sizeForBadgeInfo_contentWidth__onceToken, &__block_literal_global_179_291158);
    v9 = (void *)objc_opt_class();
    v10 = *(_OWORD *)&a3->count;
    v24 = *(_OWORD *)&a3->badges;
    v25 = v10;
    objc_msgSend(v9, "badgeSizeCacheKeyValueFromBadgeInfo:contentWidth:", &v24, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)sizeForBadgeInfo_contentWidth__sizeCache, "objectForKey:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      if (sizeForBadgeInfo_contentWidth__onceToken_181 != -1)
        dispatch_once(&sizeForBadgeInfo_contentWidth__onceToken_181, &__block_literal_global_182_291159);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __52__PXUIAssetBadgeView_sizeForBadgeInfo_contentWidth___block_invoke_3;
      v20[3] = &__block_descriptor_72_e5_v8__0l;
      v13 = *(_OWORD *)&a3->count;
      v21 = *(_OWORD *)&a3->badges;
      v22 = v13;
      v23 = a4;
      objc_msgSend((id)sizeForBadgeInfo_contentWidth__measuringBadgeView, "performChanges:animated:", v20, 0);
      objc_msgSend((id)sizeForBadgeInfo_contentWidth__measuringBadgeView, "sizeToFit");
      objc_msgSend((id)sizeForBadgeInfo_contentWidth__measuringBadgeView, "bounds");
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGSize:", v14, v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)sizeForBadgeInfo_contentWidth__sizeCache, "setObject:forKey:", v12, v11);
    }
    objc_msgSend(v12, "CGSizeValue");
    v7 = v16;
    v8 = v17;

  }
  v18 = v7;
  v19 = v8;
  result.height = v19;
  result.width = v18;
  return result;
}

uint64_t __52__PXUIAssetBadgeView_sizeForBadgeInfo_contentWidth___block_invoke_3(uint64_t a1)
{
  __int128 v2;
  _OWORD v4[2];

  v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  objc_msgSend((id)sizeForBadgeInfo_contentWidth__measuringBadgeView, "setBadgeInfo:", v4);
  objc_msgSend((id)sizeForBadgeInfo_contentWidth__measuringBadgeView, "setStyle:", 3);
  objc_msgSend((id)sizeForBadgeInfo_contentWidth__measuringBadgeView, "setOverContent:", 0);
  return objc_msgSend((id)sizeForBadgeInfo_contentWidth__measuringBadgeView, "setContentWidth:", *(double *)(a1 + 64));
}

void __52__PXUIAssetBadgeView_sizeForBadgeInfo_contentWidth___block_invoke_2()
{
  PXUIAssetBadgeView *v0;
  uint64_t v1;
  void *v2;

  v0 = [PXUIAssetBadgeView alloc];
  v1 = -[PXUIAssetBadgeView initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v2 = (void *)sizeForBadgeInfo_contentWidth__measuringBadgeView;
  sizeForBadgeInfo_contentWidth__measuringBadgeView = v1;

}

uint64_t __52__PXUIAssetBadgeView_sizeForBadgeInfo_contentWidth___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)sizeForBadgeInfo_contentWidth__sizeCache;
  sizeForBadgeInfo_contentWidth__sizeCache = (uint64_t)v0;

  return objc_msgSend((id)sizeForBadgeInfo_contentWidth__sizeCache, "setCountLimit:", 42);
}

void __36__PXUIAssetBadgeView_measuringLabel__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;

  v0 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  v1 = (void *)measuringLabel_measuringLabel;
  measuringLabel_measuringLabel = (uint64_t)v0;

  PXAssetBadgeInfoCreateWithBadges();
  +[PXBadgeHelper textForBadgeInfo:style:](PXBadgeHelper, "textForBadgeInfo:style:", &v3, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)measuringLabel_measuringLabel, "setText:", v2);

}

void __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_10()
{
  id v0;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scheduleMainQueueTask:", &__block_literal_global_141_291171);

}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_11()
{
  return +[PXBadgeHelper gradientImage](PXBadgeHelper, "gradientImage");
}

void __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_8()
{
  id v0;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scheduleMainQueueTask:", &__block_literal_global_138_291172);

}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_9()
{
  return +[PXBadgeHelper livePhotoBadgeShadowedImage](PXBadgeHelper, "livePhotoBadgeShadowedImage");
}

void __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_4()
{
  void *v0;
  void *v1;
  id v2;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scheduleMainQueueTask:", &__block_literal_global_133_291173);

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheduleMainQueueTask:", &__block_literal_global_134_291174);

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scheduleMainQueueTask:", &__block_literal_global_135_291175);

}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_7()
{
  return +[PXBadgeHelper cloudBadgeImage](PXBadgeHelper, "cloudBadgeImage");
}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_6()
{
  return +[PXBadgeHelper loopingBadgeImage](PXBadgeHelper, "loopingBadgeImage");
}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_5()
{
  return +[PXBadgeHelper gradientImage](PXBadgeHelper, "gradientImage");
}

void __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke()
{
  void *v0;
  id v1;

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scheduleMainQueueTask:", &__block_literal_global_128_291176);

  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "scheduleMainQueueTask:", &__block_literal_global_130_291177);

}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_3()
{
  return +[PXBadgeHelper autoReframingImage](PXBadgeHelper, "autoReframingImage");
}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_2()
{
  return +[PXBadgeHelper livePhotoBadgeShadowedImage](PXBadgeHelper, "livePhotoBadgeShadowedImage");
}

@end
