@implementation BKScrubberCalloutView

- (BKScrubberCalloutView)initWithFrame:(CGRect)a3 style:(unint64_t)a4
{
  BKScrubberCalloutView *v5;
  BKScrubberCalloutView *v6;
  void *v7;
  id v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKScrubberCalloutView;
  v5 = -[BKScrubberCalloutView initWithFrame:](&v10, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_style = a4;
    v5->_shouldDisplayPageInfo = 1;
    -[BKScrubberCalloutView _stylize](v5, "_stylize");
    -[BKScrubberCalloutView setAlpha:](v6, "setAlpha:", 0.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v8 = -[BKScrubberCalloutView registerForTraitChanges:withAction:](v6, "registerForTraitChanges:withAction:", v7, "_traitCollectionDidChange:previousTraitCollection:");

  }
  return v6;
}

- (BKScrubberCalloutView)initWithFrame:(CGRect)a3
{
  return -[BKScrubberCalloutView initWithFrame:style:](self, "initWithFrame:style:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BKScrubberCalloutView)initWithCoder:(id)a3
{
  return -[BKScrubberCalloutView initWithFrame:style:](self, "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (void)dealloc
{
  UIView *contentView;
  UILabel *title;
  UILabel *subtitle;
  UIView *pageView;
  objc_super v7;

  contentView = self->_contentView;
  self->_contentView = 0;

  title = self->_title;
  self->_title = 0;

  subtitle = self->_subtitle;
  self->_subtitle = 0;

  pageView = self->_pageView;
  self->_pageView = 0;

  v7.receiver = self;
  v7.super_class = (Class)BKScrubberCalloutView;
  -[BKScrubberCalloutView dealloc](&v7, "dealloc");
}

- (void)addToViewController:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  objc_msgSend(v4, "addSubview:", self);

}

- (void)setIsShowing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  double v7;
  double v8;
  double v9;
  _QWORD *v10;
  void *v11;
  _QWORD v12[5];

  v4 = a4;
  v5 = a3;
  v7 = (double)a3;
  -[BKScrubberCalloutView alpha](self, "alpha");
  if (v8 != v7)
  {
    if (v5)
    {
      -[BKScrubberCalloutView setAlpha:](self, "setAlpha:", 1.0);
    }
    else
    {
      -[BKScrubberCalloutView alpha](self, "alpha");
      if (v9 == 1.0)
      {
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_CD734;
        v12[3] = &unk_28B960;
        v12[4] = self;
        v10 = objc_retainBlock(v12);
        v11 = v10;
        if (v4)
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v10, 0, 0.2, 0.3);
        else
          ((void (*)(_QWORD *))v10[2])(v10);

      }
    }
  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKScrubberCalloutView;
  -[BKScrubberCalloutView layoutSubviews](&v3, "layoutSubviews");
  -[BKScrubberCalloutView layoutContent](self, "layoutContent");
  -[BKScrubberCalloutView bringSubviewToFront:](self, "bringSubviewToFront:", self->_contentView);
}

- (void)setBackgroundColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_contentView, "setBackgroundColor:", a3);
}

- (UILabel)title
{
  UILabel *title;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;

  title = self->_title;
  if (!title)
  {
    v4 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_title;
    self->_title = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UILabel setBackgroundColor:](self->_title, "setBackgroundColor:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_title, "setTextColor:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleHeadline));
    -[UILabel setFont:](self->_title, "setFont:", v8);

    -[UILabel setTextAlignment:](self->_title, "setTextAlignment:", 1);
    v9 = -[BKScrubberCalloutView shouldDisplayPageInfo](self, "shouldDisplayPageInfo");
    title = self->_title;
    if (v9)
    {
      -[UIView addSubview:](self->_contentView, "addSubview:", title);
      title = self->_title;
    }
  }
  return title;
}

- (id)createPageLabel
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v2, "setBackgroundColor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksSecondaryLabelColor](UIColor, "bc_booksSecondaryLabelColor"));
  objc_msgSend(v2, "setTextColor:", v4);

  objc_msgSend(v2, "setTextAlignment:", 1);
  return v2;
}

- (UILabel)subtitle
{
  UILabel *subtitle;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  subtitle = self->_subtitle;
  if (!subtitle)
  {
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView createPageLabel](self, "createPageLabel"));
    v5 = self->_subtitle;
    self->_subtitle = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView _subtitleFont](self, "_subtitleFont"));
    -[UILabel setFont:](self->_subtitle, "setFont:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[UILabel setTextColor:](self->_subtitle, "setTextColor:", v7);

    v8 = -[BKScrubberCalloutView shouldDisplayPageInfo](self, "shouldDisplayPageInfo");
    subtitle = self->_subtitle;
    if (v8)
    {
      -[UIView addSubview:](self->_contentView, "addSubview:", subtitle);
      subtitle = self->_subtitle;
    }
  }
  return subtitle;
}

- (UILabel)leftPageLabel
{
  UILabel *leftPageLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  unsigned int v7;

  leftPageLabel = self->_leftPageLabel;
  if (!leftPageLabel)
  {
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView createPageLabel](self, "createPageLabel"));
    v5 = self->_leftPageLabel;
    self->_leftPageLabel = v4;

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_leftPageLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_leftPageLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView _pageLabelFont](self, "_pageLabelFont"));
    -[UILabel setFont:](self->_leftPageLabel, "setFont:", v6);

    v7 = -[BKScrubberCalloutView shouldDisplayPageInfo](self, "shouldDisplayPageInfo");
    leftPageLabel = self->_leftPageLabel;
    if (v7)
    {
      -[UIView addSubview:](self->_contentView, "addSubview:", leftPageLabel);
      leftPageLabel = self->_leftPageLabel;
    }
  }
  return leftPageLabel;
}

- (UILabel)rightPageLabel
{
  UILabel *rightPageLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;
  unsigned int v7;

  rightPageLabel = self->_rightPageLabel;
  if (!rightPageLabel)
  {
    v4 = (UILabel *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView createPageLabel](self, "createPageLabel"));
    v5 = self->_rightPageLabel;
    self->_rightPageLabel = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView _pageLabelFont](self, "_pageLabelFont"));
    -[UILabel setFont:](self->_rightPageLabel, "setFont:", v6);

    -[UILabel setAdjustsFontSizeToFitWidth:](self->_rightPageLabel, "setAdjustsFontSizeToFitWidth:", 1);
    -[UILabel setAdjustsFontForContentSizeCategory:](self->_rightPageLabel, "setAdjustsFontForContentSizeCategory:", 1);
    v7 = -[BKScrubberCalloutView shouldDisplayPageInfo](self, "shouldDisplayPageInfo");
    rightPageLabel = self->_rightPageLabel;
    if (v7)
    {
      -[UIView addSubview:](self->_contentView, "addSubview:", rightPageLabel);
      rightPageLabel = self->_rightPageLabel;
    }
  }
  return rightPageLabel;
}

- (void)setPageView:(id)a3
{
  UIView *v5;
  UIView **p_pageView;
  UIView *pageView;
  UIView *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  p_pageView = &self->_pageView;
  pageView = self->_pageView;
  if (pageView != v5)
  {
    v9 = v5;
    -[UIView removeFromSuperview](pageView, "removeFromSuperview");
    v8 = *p_pageView;
    *p_pageView = 0;

    objc_storeStrong((id *)&self->_pageView, a3);
    if (*p_pageView)
      -[UIView addSubview:](self->_contentView, "addSubview:");
    -[BKScrubberCalloutView setNeedsLayout](self, "setNeedsLayout");
    v5 = v9;
  }

}

- (CGSize)contentSizeForThumbnailAspectRatio:(double)a3 spread:(BOOL)a4
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  if (!a4)
  {
    if (a3 >= 1.0)
    {
      if (a3 == 1.0)
      {
        v7 = 146.0;
        v6 = 146.0;
        goto LABEL_16;
      }
      if (a3 > 1.56)
      {
        v6 = 194.0;
        goto LABEL_13;
      }
      v7 = 124.0;
    }
    else
    {
      if (a3 > 0.64)
      {
        v6 = 124.0;
        goto LABEL_13;
      }
      v7 = 194.0;
    }
    v6 = a3 * v7;
    goto LABEL_16;
  }
  v5 = a3 + a3;
  if (v5 > 1.56451613)
  {
    a3 = v5 * 0.5;
    v6 = 97.0;
LABEL_13:
    v7 = v6 / a3;
    goto LABEL_16;
  }
  v7 = 124.0;
  v6 = v5 * 124.0 * 0.5;
LABEL_16:
  if ((-[BKScrubberCalloutView im_isCompactWidth](self, "im_isCompactWidth") & 1) == 0
    && (-[BKScrubberCalloutView im_isCompactHeight](self, "im_isCompactHeight") & 1) == 0)
  {
    v7 = v7 * 1.25;
    v6 = v6 * 1.25;
  }
  v8 = v6;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)thumbnailSizeForAspectRatio:(double)a3 showSpreads:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[BKScrubberCalloutView contentSizeForThumbnailAspectRatio:spread:](self, "contentSizeForThumbnailAspectRatio:spread:", a4, a3);
  v6 = ceil(v4 + -10.0);
  v7 = ceil(v5 + -10.0);
  result.height = v7;
  result.width = v6;
  return result;
}

- (CGSize)contentSize
{
  double height;
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
  double v16;
  double v17;
  double v18;
  UIView *pageView;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unsigned int v26;
  double v27;
  double v28;
  double v29;
  unsigned int v30;
  double v31;
  double v32;
  double v33;
  CGSize result;

  height = CGSizeZero.height;
  -[UILabel sizeThatFits:](self->_title, "sizeThatFits:", CGSizeZero.width, height);
  v5 = v4;
  v7 = v6;
  -[UILabel sizeThatFits:](self->_subtitle, "sizeThatFits:", CGSizeZero.width, height);
  v9 = v8;
  v11 = v10;
  -[UILabel sizeThatFits:](self->_leftPageLabel, "sizeThatFits:", CGSizeZero.width, height);
  v13 = v12;
  v15 = v14;
  -[UILabel sizeThatFits:](self->_rightPageLabel, "sizeThatFits:", CGSizeZero.width, height);
  v17 = fmax(fmax(v9, v13), v16);
  v18 = fmax(fmax(v11, v15), v16);
  pageView = self->_pageView;
  if (pageView)
  {
    -[UIView frame](self->_pageView, "frame");
    -[UIView sizeThatFits:](pageView, "sizeThatFits:", v20, v21);
    v23 = v22;
    v25 = v24;
    v26 = -[BKScrubberCalloutView shouldDisplayPageInfo](self, "shouldDisplayPageInfo");
    v27 = fmax(v17, v23);
    if (!v26)
      v27 = v23;
    v28 = v25 + 10.0;
    v29 = v27 + 10.0;
    v30 = -[BKScrubberCalloutView shouldDisplayPageInfo](self, "shouldDisplayPageInfo");
    v31 = fmax(v18, 27.0) + v28;
    if (v30)
      v32 = v31;
    else
      v32 = v28;
  }
  else
  {
    v29 = ceil(fmax(v5, v17) + 40.0);
    v32 = ceil(v7 + v18 + 13.0);
  }
  v33 = v29;
  result.height = v32;
  result.width = v33;
  return result;
}

- (void)layoutContent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double height;
  double v12;
  double v13;
  double v14;
  double v15;
  UIVisualEffectView *blurView;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  UIView *pageView;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  double MaxY;
  double v48;
  UILabel *leftPageLabel;
  void *v50;
  void *v51;
  unsigned int v52;
  UIView *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;

  -[BKScrubberCalloutView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  height = CGSizeZero.height;
  -[UILabel sizeThatFits:](self->_title, "sizeThatFits:", CGSizeZero.width, height);
  v13 = v12;
  -[UILabel sizeThatFits:](self->_subtitle, "sizeThatFits:", CGSizeZero.width, height);
  v15 = v14;
  blurView = self->_blurView;
  if (!blurView)
    blurView = (UIVisualEffectView *)self->_contentView;
  -[UIVisualEffectView setFrame:](blurView, "setFrame:", v4, v6, v8, v10);
  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setValue:forKey:](CATransaction, "setValue:forKey:", kCFBooleanTrue, kCATransactionDisableActions);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView layer](self, "layer"));
  objc_msgSend(v17, "bounds");
  -[CALayer setFrame:](self->_shadowLayer, "setFrame:");

  -[CALayer bounds](self->_shadowLayer, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  -[UIView _continuousCornerRadius](self->_contentView, "_continuousCornerRadius");
  v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v19, v21, v23, v25, v26)));
  -[CALayer setShadowPath:](self->_shadowLayer, "setShadowPath:", objc_msgSend(v27, "CGPath"));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView layer](self, "layer"));
  objc_msgSend(v28, "bounds");
  -[CALayer setFrame:](self->_outerBorderLayer, "setFrame:");

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView layer](self, "layer"));
  objc_msgSend(v29, "bounds");
  v59 = CGRectInset(v58, 0.5, 0.5);
  -[CALayer setFrame:](self->_innerBorderLayer, "setFrame:", v59.origin.x, v59.origin.y, v59.size.width, v59.size.height);

  if ((char *)-[BKScrubberCalloutView _effectiveStyle](self, "_effectiveStyle") == (char *)&dword_0 + 2)
  {
    if (-[BKScrubberCalloutView _useWideRadiusRoundedCorners](self, "_useWideRadiusRoundedCorners"))
      v30 = 16.0;
    else
      v30 = 6.0;
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView blurView](self, "blurView"));
    objc_msgSend(v31, "_setContinuousCornerRadius:", v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView shadowLayer](self, "shadowLayer"));
    objc_msgSend(v32, "setCornerRadius:", v30);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView outerBorderLayer](self, "outerBorderLayer"));
    objc_msgSend(v33, "setCornerRadius:", v30);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView innerBorderLayer](self, "innerBorderLayer"));
    objc_msgSend(v34, "setCornerRadius:", v30 + -1.0);

  }
  +[CATransaction commit](CATransaction, "commit");
  pageView = self->_pageView;
  if (pageView)
  {
    if (self->_leftPageLabel)
    {
      if (self->_rightPageLabel)
        v36 = 2.0;
      else
        v36 = 1.0;
    }
    else
    {
      v36 = 1.0;
    }
    -[UIView bounds](self->_pageView, "bounds");
    -[UIView sizeThatFits:](pageView, "sizeThatFits:", v42, v43);
    v61.size.width = v44;
    v61.size.height = v45;
    v46 = 5.0;
    v61.origin.x = fmax((v8 - v44) * 0.5, 5.0);
    v61.origin.y = 5.0;
    v62 = CGRectIntegral(v61);
    -[UIView setFrame:](self->_pageView, "setFrame:", v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);
    -[UIView frame](self->_pageView, "frame");
    MaxY = CGRectGetMaxY(v63);
    -[UILabel setFrame:](self->_subtitle, "setFrame:", 5.0, MaxY, v8 + -10.0, v15 + 5.0);
    v48 = v8 / v36 + -10.0;
    -[UILabel setFrame:](self->_leftPageLabel, "setFrame:", 5.0, MaxY, v48, v10 - MaxY);
    leftPageLabel = self->_leftPageLabel;
    if (leftPageLabel)
    {
      -[UILabel frame](leftPageLabel, "frame");
      v46 = CGRectGetMaxX(v64) + 5.0;
    }
    -[UILabel setFrame:](self->_rightPageLabel, "setFrame:", v46, MaxY, v48, v10 - MaxY);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView stringForRightPageLabel](self, "stringForRightPageLabel"));
    -[UILabel setText:](self->_rightPageLabel, "setText:", v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView stringForLeftPageLabel](self, "stringForLeftPageLabel"));
    -[UILabel setText:](self->_leftPageLabel, "setText:", v51);

    -[UIView setClipsToBounds:](self->_pageView, "setClipsToBounds:", 1);
    v52 = -[BKScrubberCalloutView _useWideRadiusRoundedCorners](self, "_useWideRadiusRoundedCorners");
    v53 = self->_pageView;
    if (v52)
    {
      -[UIView _setContinuousCornerRadius:](v53, "_setContinuousCornerRadius:", 10.0);
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_pageView, "layer"));
      objc_msgSend(v54, "setBorderWidth:", 1.0);

      v55 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksQuaternaryLabelColor](UIColor, "bc_booksQuaternaryLabelColor")));
      v56 = objc_msgSend(v55, "CGColor");
      v57 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_pageView, "layer"));
      objc_msgSend(v57, "setBorderColor:", v56);

    }
    else
    {
      -[UIView _setContinuousCornerRadius:](v53, "_setContinuousCornerRadius:", 0.0);
      v55 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_pageView, "layer"));
      objc_msgSend(v55, "setBorderWidth:", 0.0);
    }

    -[UIView setNeedsLayout](self->_pageView, "setNeedsLayout");
  }
  else
  {
    -[BKScrubberCalloutView frame](self, "frame");
    if (v8 >= v37 + -40.0)
      v38 = v37 + -40.0;
    else
      v38 = v8;
    -[UILabel setFrame:](self->_title, "setFrame:", 20.0, 5.0, v38, v13);
    -[UILabel frame](self->_title, "frame");
    v39 = CGRectGetMaxY(v60) + 1.0;
    -[BKScrubberCalloutView frame](self, "frame");
    if (v8 >= v40 + -40.0)
      v41 = v40 + -40.0;
    else
      v41 = v8;
    -[UILabel setFrame:](self->_subtitle, "setFrame:", 20.0, v39, v41, v15);
  }
}

- (void)setLeftPageText:(id)a3 shortenString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  UILabel *leftPageLabel;
  UILabel *v12;

  v6 = a4;
  -[BKScrubberCalloutView setLeftPageString:](self, "setLeftPageString:", a3);
  -[BKScrubberCalloutView setLeftPageShortenString:](self, "setLeftPageShortenString:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView leftPageString](self, "leftPageString"));
  if (objc_msgSend(v7, "length"))
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView leftPageShortenString](self, "leftPageShortenString"));
    v9 = objc_msgSend(v8, "length");

    if (!v9)
    {
      -[UILabel removeFromSuperview](self->_leftPageLabel, "removeFromSuperview");
      leftPageLabel = self->_leftPageLabel;
      self->_leftPageLabel = 0;
      goto LABEL_5;
    }
  }
  v12 = (UILabel *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView stringForLeftPageLabel](self, "stringForLeftPageLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView leftPageLabel](self, "leftPageLabel"));
  objc_msgSend(v10, "setText:", v12);

  leftPageLabel = v12;
LABEL_5:

}

- (void)setRightPageText:(id)a3 shortenString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  UILabel *rightPageLabel;
  UILabel *v12;

  v6 = a4;
  -[BKScrubberCalloutView setRightPageString:](self, "setRightPageString:", a3);
  -[BKScrubberCalloutView setRightPageShortenString:](self, "setRightPageShortenString:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView rightPageString](self, "rightPageString"));
  if (objc_msgSend(v7, "length"))
  {

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView rightPageShortenString](self, "rightPageShortenString"));
    v9 = objc_msgSend(v8, "length");

    if (!v9)
    {
      -[UILabel removeFromSuperview](self->_rightPageLabel, "removeFromSuperview");
      rightPageLabel = self->_rightPageLabel;
      self->_rightPageLabel = 0;
      goto LABEL_5;
    }
  }
  v12 = (UILabel *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView stringForRightPageLabel](self, "stringForRightPageLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView rightPageLabel](self, "rightPageLabel"));
  objc_msgSend(v10, "setText:", v12);

  rightPageLabel = v12;
LABEL_5:

}

- (id)stringForLeftPageLabel
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  NSAttributedStringKey v15;
  void *v16;

  if (self->_leftPageLabel)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView leftPageString](self, "leftPageString"));
    v15 = NSFontAttributeName;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_leftPageLabel, "font"));
    v16 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    objc_msgSend(v3, "sizeWithAttributes:", v5);
    v7 = v6;

    -[UILabel bounds](self->_leftPageLabel, "bounds");
    if (v7 >= v8
      && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView leftPageShortenString](self, "leftPageShortenString")),
          v9,
          v9))
    {
      v10 = objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView leftPageShortenString](self, "leftPageShortenString"));
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView leftPageString](self, "leftPageString"));
    }
    v11 = (__CFString *)v10;
  }
  else
  {
    v11 = 0;
  }
  if (v11)
    v12 = v11;
  else
    v12 = &stru_296430;
  v13 = v12;

  return v13;
}

- (id)stringForRightPageLabel
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  NSAttributedStringKey v15;
  void *v16;

  if (self->_rightPageLabel)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView rightPageString](self, "rightPageString"));
    v15 = NSFontAttributeName;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_rightPageLabel, "font"));
    v16 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    objc_msgSend(v3, "sizeWithAttributes:", v5);
    v7 = v6;

    -[UILabel bounds](self->_rightPageLabel, "bounds");
    if (v7 >= v8
      && (v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView rightPageShortenString](self, "rightPageShortenString")),
          v9,
          v9))
    {
      v10 = objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView rightPageShortenString](self, "rightPageShortenString"));
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView rightPageString](self, "rightPageString"));
    }
    v11 = (__CFString *)v10;
  }
  else
  {
    v11 = 0;
  }
  if (v11)
    v12 = v11;
  else
    v12 = &stru_296430;
  v13 = v12;

  return v13;
}

- (id)_subtitleFont
{
  void *v2;

  if (self->_usesMonospacedDigitFontForSubtitle)
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:", 10.0, UIFontWeightRegular));
  else
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 10.0));
  return v2;
}

- (id)_pageLabelFont
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  if (self->_usesMonospacedDigitFontForSubtitle)
    v2 = objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:", 15.0, UIFontWeightSemibold));
  else
    v2 = objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 15.0, UIFontWeightSemibold));
  v3 = (void *)v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontMetrics metricsForTextStyle:](UIFontMetrics, "metricsForTextStyle:", UIFontTextStyleHeadline));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scaledFontForFont:", v3));

  return v5;
}

- (void)setUsesMonospacedDigitFontForSubtitle:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_usesMonospacedDigitFontForSubtitle != a3)
  {
    self->_usesMonospacedDigitFontForSubtitle = a3;
    if (self->_subtitle)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView _subtitleFont](self, "_subtitleFont"));
      -[UILabel setFont:](self->_subtitle, "setFont:", v4);

    }
    if (self->_leftPageLabel)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView _pageLabelFont](self, "_pageLabelFont"));
      -[UILabel setFont:](self->_leftPageLabel, "setFont:", v5);

    }
    if (self->_rightPageLabel)
    {
      v6 = (id)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView _pageLabelFont](self, "_pageLabelFont"));
      -[UILabel setFont:](self->_rightPageLabel, "setFont:", v6);

    }
  }
}

- (void)_traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView outerBorderColor](self, "outerBorderColor", a3, a4)));
  v6 = objc_msgSend(v5, "CGColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView outerBorderLayer](self, "outerBorderLayer"));
  objc_msgSend(v7, "setBorderColor:", v6);

  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView innerBorderColor](self, "innerBorderColor")));
  v9 = objc_msgSend(v8, "CGColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView innerBorderLayer](self, "innerBorderLayer"));
  objc_msgSend(v10, "setBorderColor:", v9);

  v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView shadowColor](self, "shadowColor")));
  v11 = objc_msgSend(v13, "CGColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView shadowLayer](self, "shadowLayer"));
  objc_msgSend(v12, "setShadowColor:", v11);

}

- (BOOL)_useWideRadiusRoundedCorners
{
  return self->_pageView != 0;
}

- (unint64_t)_effectiveStyle
{
  unint64_t result;

  result = -[BKScrubberCalloutView style](self, "style");
  if (result <= 1)
    return 1;
  return result;
}

- (void)_stylize
{
  void *v3;
  UIVisualEffectView *v4;
  UIVisualEffectView *blurView;
  void *v6;
  UIView *v7;
  UIView *contentView;
  NSBundle *v9;
  void *v10;
  void *v11;
  NSBundle *v12;
  void *v13;
  void *v14;
  NSBundle *v15;
  void *v16;
  void *v17;
  CALayer *v18;
  double v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  UIView *v30;
  UIView *v31;
  void *v32;
  id v33;

  if ((char *)-[BKScrubberCalloutView _effectiveStyle](self, "_effectiveStyle") == (char *)&dword_0 + 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[BKScrubberCalloutView setBackgroundColor:](self, "setBackgroundColor:", v3);

    v33 = (id)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 8));
    v4 = (UIVisualEffectView *)objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v33);
    blurView = self->_blurView;
    self->_blurView = v4;

    -[UIVisualEffectView setContentMode:](self->_blurView, "setContentMode:", 0);
    -[UIVisualEffectView setTranslatesAutoresizingMaskIntoConstraints:](self->_blurView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView bounds](self->_contentView, "bounds");
    -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:");
    -[UIVisualEffectView setAlpha:](self->_blurView, "setAlpha:", 1.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_blurView, "layer"));
    objc_msgSend(v6, "setMasksToBounds:", 1);

    -[UIVisualEffectView setClipsToBounds:](self->_blurView, "setClipsToBounds:", 1);
    v7 = (UIView *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView contentView](self->_blurView, "contentView"));
    contentView = self->_contentView;
    self->_contentView = v7;

    -[BKScrubberCalloutView addSubview:](self, "addSubview:", self->_blurView);
    v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:inBundle:compatibleWithTraitCollection:](UIColor, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("BKScrubberCalloutPopFloatOuterBorderColor"), v10, 0));
    -[BKScrubberCalloutView setOuterBorderColor:](self, "setOuterBorderColor:", v11);

    v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:inBundle:compatibleWithTraitCollection:](UIColor, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("BKScrubberCalloutPopFloatInnerBorderColor"), v13, 0));
    -[BKScrubberCalloutView setInnerBorderColor:](self, "setInnerBorderColor:", v14);

    v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:inBundle:compatibleWithTraitCollection:](UIColor, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("BKScrubberCalloutPopFloatShadowColor"), v16, 0));
    -[BKScrubberCalloutView setShadowColor:](self, "setShadowColor:", v17);

    v18 = objc_opt_new(CALayer);
    -[CALayer setMasksToBounds:](v18, "setMasksToBounds:", 0);
    LODWORD(v19) = 1.0;
    -[CALayer setShadowOpacity:](v18, "setShadowOpacity:", v19);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView shadowColor](self, "shadowColor")));
    -[CALayer setShadowColor:](v18, "setShadowColor:", objc_msgSend(v20, "CGColor"));

    -[CALayer setShadowOffset:](v18, "setShadowOffset:", 0.0, 4.0);
    -[CALayer setShadowRadius:](v18, "setShadowRadius:", 16.0);
    -[CALayer setCornerCurve:](v18, "setCornerCurve:", kCACornerCurveContinuous);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView layer](self, "layer"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_blurView, "layer"));
    objc_msgSend(v21, "insertSublayer:below:", v18, v22);

    -[BKScrubberCalloutView setShadowLayer:](self, "setShadowLayer:", v18);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    objc_msgSend(v23, "setBorderWidth:", 0.5);
    v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView outerBorderColor](self, "outerBorderColor")));
    objc_msgSend(v23, "setBorderColor:", objc_msgSend(v24, "CGColor"));

    objc_msgSend(v23, "setCornerCurve:", kCACornerCurveContinuous);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView layer](self, "layer"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIVisualEffectView layer](self->_blurView, "layer"));
    objc_msgSend(v25, "insertSublayer:above:", v23, v26);

    -[BKScrubberCalloutView setOuterBorderLayer:](self, "setOuterBorderLayer:", v23);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    objc_msgSend(v27, "setBorderWidth:", 1.0);
    v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView innerBorderColor](self, "innerBorderColor")));
    objc_msgSend(v27, "setBorderColor:", objc_msgSend(v28, "CGColor"));

    objc_msgSend(v27, "setCornerCurve:", kCACornerCurveContinuous);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKScrubberCalloutView layer](self, "layer"));
    objc_msgSend(v29, "insertSublayer:below:", v27, v23);

    -[BKScrubberCalloutView setInnerBorderLayer:](self, "setInnerBorderLayer:", v27);
  }
  else
  {
    v30 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v31 = self->_contentView;
    self->_contentView = v30;

    -[UIView setOpaque:](self->_contentView, "setOpaque:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.15, 0.15, 0.13, 1.0));
    -[BKScrubberCalloutView setBackgroundColor:](self, "setBackgroundColor:", v32);

    -[UIView _setContinuousCornerRadius:](self->_contentView, "_setContinuousCornerRadius:", 16.0);
    -[BKScrubberCalloutView addSubview:](self, "addSubview:", self->_contentView);
  }
}

- (UIView)pageView
{
  return self->_pageView;
}

- (NSString)leftPageString
{
  return self->_leftPageString;
}

- (void)setLeftPageString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)leftPageShortenString
{
  return self->_leftPageShortenString;
}

- (void)setLeftPageShortenString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)rightPageString
{
  return self->_rightPageString;
}

- (void)setRightPageString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)rightPageShortenString
{
  return self->_rightPageShortenString;
}

- (void)setRightPageShortenString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)usesMonospacedDigitFontForSubtitle
{
  return self->_usesMonospacedDigitFontForSubtitle;
}

- (BOOL)shouldDisplayPageInfo
{
  return self->_shouldDisplayPageInfo;
}

- (void)setShouldDisplayPageInfo:(BOOL)a3
{
  self->_shouldDisplayPageInfo = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (CALayer)shadowLayer
{
  return self->_shadowLayer;
}

- (void)setShadowLayer:(id)a3
{
  objc_storeStrong((id *)&self->_shadowLayer, a3);
}

- (CALayer)outerBorderLayer
{
  return self->_outerBorderLayer;
}

- (void)setOuterBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_outerBorderLayer, a3);
}

- (CALayer)innerBorderLayer
{
  return self->_innerBorderLayer;
}

- (void)setInnerBorderLayer:(id)a3
{
  objc_storeStrong((id *)&self->_innerBorderLayer, a3);
}

- (UIColor)outerBorderColor
{
  return self->_outerBorderColor;
}

- (void)setOuterBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_outerBorderColor, a3);
}

- (UIColor)innerBorderColor
{
  return self->_innerBorderColor;
}

- (void)setInnerBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_innerBorderColor, a3);
}

- (UIColor)shadowColor
{
  return self->_shadowColor;
}

- (void)setShadowColor:(id)a3
{
  objc_storeStrong((id *)&self->_shadowColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowColor, 0);
  objc_storeStrong((id *)&self->_innerBorderColor, 0);
  objc_storeStrong((id *)&self->_outerBorderColor, 0);
  objc_storeStrong((id *)&self->_innerBorderLayer, 0);
  objc_storeStrong((id *)&self->_outerBorderLayer, 0);
  objc_storeStrong((id *)&self->_shadowLayer, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_rightPageShortenString, 0);
  objc_storeStrong((id *)&self->_rightPageString, 0);
  objc_storeStrong((id *)&self->_leftPageShortenString, 0);
  objc_storeStrong((id *)&self->_leftPageString, 0);
  objc_storeStrong((id *)&self->_rightPageLabel, 0);
  objc_storeStrong((id *)&self->_leftPageLabel, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_pageView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
