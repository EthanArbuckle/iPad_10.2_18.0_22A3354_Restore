@implementation BKAudiobookSlideOpenAnimator

- (double)coverFadeDuration
{
  return AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * 0.2;
}

- (BOOL)landscape
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  return v4 > v6;
}

- (BOOL)animatesCoverBounds
{
  return 1;
}

- (BOOL)wantsCoverShadow
{
  return !-[BKBookOpenAnimator skipZoomPhase](self, "skipZoomPhase");
}

- (BKAudiobookOpenTransitioning)audiobookViewController
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewController](self, "bookViewController"));
  v3 = objc_opt_class(UIViewController);
  v4 = BUClassAndProtocolCast(v2, v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  return (BKAudiobookOpenTransitioning *)v5;
}

- (void)setupViewsForZoom
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewController](self, "bookViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view"));
  objc_msgSend(v4, "setAlpha:", 0.0);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  objc_msgSend(v6, "addSubview:", v5);

}

- (void)animateZoomWithCompletion:(id)a3
{
  id v4;
  unsigned __int8 v5;
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
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[12];

  v4 = a3;
  v5 = -[BKBookOpenAnimator opening](self, "opening");
  -[BKBookOpenAnimator closedCoverFrame](self, "closedCoverFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[BKAudiobookSlideOpenAnimator zoomedCoverFrame](self, "zoomedCoverFrame");
  v18 = v17;
  if ((v5 & 1) != 0)
  {
    v19 = 1.0;
    v20 = 0.0;
    v30 = 0x3FA999999999999ALL;
    v17 = v13;
    v21 = v16;
    v16 = v11;
    v22 = v15;
    v15 = v9;
    v9 = v22;
    v23 = v14;
    v14 = v7;
    v7 = v23;
    v24 = 0.0;
  }
  else
  {
    v24 = 1.0;
    v30 = 0;
    v20 = 0.05;
    v19 = 0.0;
    v18 = v13;
    v21 = v11;
  }
  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:", v14, v15, v16, v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfTintView](self, "bookshelfTintView"));
  objc_msgSend(v25, "setAlpha:", v20);

  -[BKBookOpenAnimator setBookshelfAlpha:](self, "setBookshelfAlpha:", v19);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowView](self, "coverShadowView"));
  objc_msgSend(v26, "setAlpha:", v19);

  -[BKBookSlideOpenAnimator zoomDuration](self, "zoomDuration");
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookZoomRevealOpenAnimator zoomTimingFunction](self, "zoomTimingFunction"));
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000CC5E4;
  v31[3] = &unk_1008E9FF8;
  v31[4] = self;
  *(double *)&v31[5] = v7;
  *(double *)&v31[6] = v9;
  *(double *)&v31[7] = v21;
  *(double *)&v31[8] = v18;
  v31[9] = v30;
  *(double *)&v31[10] = v24;
  *(double *)&v31[11] = v24;
  +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v29, 0, v31, v4, v28, 0.0);

}

- (void)setupViewsForReveal
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  -[BKBookOpenAnimator closedCoverFrame](self, "closedCoverFrame");
  v4 = v3;
  v6 = v5;
  v9 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", v7, v8, v3, v5);
  -[BKAudiobookSlideOpenAnimator setContentClipView:](self, "setContentClipView:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator contentClipView](self, "contentClipView"));
  objc_msgSend(v10, "setClipsToBounds:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator contentClipView](self, "contentClipView"));
  objc_msgSend(v11, "addSubview:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewController](self, "bookViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  objc_msgSend(v14, "layoutIfNeeded");

  v49 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator audiobookViewController](self, "audiobookViewController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "transitionCoverViews"));
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", &stru_1008EA038);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewController](self, "bookViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "transitionContentView"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "snapshotViewAfterScreenUpdates:", 1));
  -[BKAudiobookSlideOpenAnimator setContentView:](self, "setContentView:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "transitionCoverViews"));
  objc_msgSend(v19, "enumerateObjectsUsingBlock:", &stru_1008EA058);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator contentView](self, "contentView"));
  objc_msgSend(v20, "frame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;

  -[BKAudiobookSlideOpenAnimator setContentFrame:](self, "setContentFrame:", v22, v24, v26, v28);
  if (-[BKAudiobookSlideOpenAnimator landscape](self, "landscape"))
    v22 = (v4 - v26) * 0.5;
  else
    v24 = (v6 - v28) * 0.5;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator contentView](self, "contentView", (v4 - v26) * 0.5));
  objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator contentClipView](self, "contentClipView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator contentView](self, "contentView"));
  objc_msgSend(v30, "addSubview:", v31);

  if (!-[BKBookOpenAnimator skipZoomPhase](self, "skipZoomPhase"))
  {
    -[BKAudiobookSlideOpenAnimator zoomedCoverFrame](self, "zoomedCoverFrame");
    v4 = v32;
    v6 = v33;
  }
  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:", CGRectMakeWithSize(v4, v6));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "layer"));
  objc_msgSend(v35, "setMasksToBounds:", 1);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator contentClipView](self, "contentClipView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  objc_msgSend(v36, "addSubview:", v37);

  v38 = objc_alloc((Class)UIImageView);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator audiobookViewController](self, "audiobookViewController"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "transitionCurrentCoverImage"));
  v41 = objc_msgSend(v38, "initWithImage:", v40);

  objc_msgSend(v41, "setClipsToBounds:", 1);
  objc_msgSend(v41, "setContentMode:", -[BKAudiobookSlideOpenAnimator coverContentMode](self, "coverContentMode"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  objc_msgSend(v42, "bounds");
  objc_msgSend(v41, "setFrame:", CGRectMakeWithSize(v43, v44));

  objc_msgSend(v41, "setAutoresizingMask:", 18);
  objc_msgSend(v41, "setAlpha:", 0.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImageView](self, "coverImageView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "superview"));

  if (!v46)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKAudiobookSlideOpenAnimator.m", 178, "-[BKAudiobookSlideOpenAnimator setupViewsForReveal]", "coverParent", 0);
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverImageView](self, "coverImageView"));
  objc_msgSend(v46, "insertSubview:aboveSubview:", v41, v47);

  -[BKAudiobookSlideOpenAnimator setCurrentCoverView:](self, "setCurrentCoverView:", v41);
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverShadowView](self, "coverShadowView"));
  objc_msgSend(v48, "setAlpha:", 0.0);

}

- (void)animateRevealWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];
  _QWORD *v24;
  id v25;
  _QWORD v26[5];
  Block_layout *v27;
  id v28;
  _QWORD v29[5];
  id v30;

  v4 = a3;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000CCDEC;
  v29[3] = &unk_1008E7338;
  v29[4] = self;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator audiobookViewController](self, "audiobookViewController"));
  v30 = v5;
  v6 = objc_retainBlock(v29);
  if (-[BKBookOpenAnimator opening](self, "opening"))
  {
    -[BKAudiobookSlideOpenAnimator revealDuration](self, "revealDuration");
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookZoomRevealOpenAnimator revealTimingFunction](self, "revealTimingFunction"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000CCF0C;
    v26[3] = &unk_1008EA0A0;
    v26[4] = self;
    v27 = &stru_1008EA078;
    v28 = v4;
    +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v9, 0, v6, v26, v8, 0.0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator audiobookViewController](self, "audiobookViewController"));
    objc_msgSend(v10, "coverCornerRadius");
    v12 = v11;

    +[CATransaction begin](CATransaction, "begin");
    -[BKAudiobookSlideOpenAnimator revealDuration](self, "revealDuration");
    +[CATransaction setAnimationDuration:](CATransaction, "setAnimationDuration:");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookZoomRevealOpenAnimator revealTimingFunction](self, "revealTimingFunction"));
    +[CATransaction setAnimationTimingFunction:](CATransaction, "setAnimationTimingFunction:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("cornerRadius")));
    if (-[BKBookOpenAnimator opening](self, "opening"))
    {
      objc_msgSend(v14, "setFromValue:", &off_10092ED18);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
      objc_msgSend(v14, "setFromValue:", v19);

    }
    v17 = (id *)&v27;
    v18 = &v28;
    if (-[BKBookOpenAnimator opening](self, "opening"))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
      objc_msgSend(v14, "setToValue:", v20);

    }
    else
    {
      objc_msgSend(v14, "setToValue:", &off_10092ED18);
    }
    objc_msgSend(v14, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v14, "setRemovedOnCompletion:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
    objc_msgSend(v22, "addAnimation:forKey:", v14, CFSTR("cornerRadius"));

    +[CATransaction commit](CATransaction, "commit");
  }
  else
  {
    -[BKAudiobookSlideOpenAnimator coverFadeDuration](self, "coverFadeDuration");
    v16 = v15;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_1000CCF40;
    v23[3] = &unk_1008EA0A0;
    v23[4] = self;
    v17 = (id *)&v24;
    v24 = v6;
    v18 = &v25;
    v25 = v4;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", &stru_1008EA078, v23, v16);
  }

}

- (void)animationsDidFinish
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator currentCoverView](self, "currentCoverView"));
  objc_msgSend(v3, "removeFromSuperview");

  -[BKAudiobookSlideOpenAnimator setCurrentCoverView:](self, "setCurrentCoverView:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator contentView](self, "contentView"));
  objc_msgSend(v4, "removeFromSuperview");

  -[BKAudiobookSlideOpenAnimator setContentView:](self, "setContentView:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator contentClipView](self, "contentClipView"));
  objc_msgSend(v5, "removeFromSuperview");

  -[BKAudiobookSlideOpenAnimator setContentClipView:](self, "setContentClipView:", 0);
  v6.receiver = self;
  v6.super_class = (Class)BKAudiobookSlideOpenAnimator;
  -[BKBookOpenAnimator animationsDidFinish](&v6, "animationsDidFinish");
}

- (CGRect)zoomedCoverFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
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
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator audiobookViewController](self, "audiobookViewController"));
  objc_msgSend(v8, "transitionCoverFrame");
  v10 = v9;
  v12 = v11;

  v13 = CGSizeScaleThatFitsInCGSize(v10, v12, v5, v7);
  v14 = CGSizeScale(v10, v12, v13);
  v16 = CGRectMakeWithSize(v14, v15);
  CGRectCenterRectInRect(v16);
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (double)revealDuration
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKAudiobookSlideOpenAnimator;
  -[BKBookSlideOpenAnimator revealDuration](&v3, "revealDuration");
  return result;
}

- (int64_t)coverContentMode
{
  void *v3;
  void *v4;
  int64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator audiobookViewController](self, "audiobookViewController"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAudiobookSlideOpenAnimator audiobookViewController](self, "audiobookViewController"));
    v5 = (int64_t)objc_msgSend(v4, "coverContentMode");

  }
  else
  {
    v5 = 2;
  }

  return v5;
}

- (UIView)currentCoverView
{
  return self->_currentCoverView;
}

- (void)setCurrentCoverView:(id)a3
{
  objc_storeStrong((id *)&self->_currentCoverView, a3);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
  objc_storeStrong((id *)&self->_contentView, a3);
}

- (CGRect)contentFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentFrame.origin.x;
  y = self->_contentFrame.origin.y;
  width = self->_contentFrame.size.width;
  height = self->_contentFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setContentFrame:(CGRect)a3
{
  self->_contentFrame = a3;
}

- (UIView)contentClipView
{
  return self->_contentClipView;
}

- (void)setContentClipView:(id)a3
{
  objc_storeStrong((id *)&self->_contentClipView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentClipView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_currentCoverView, 0);
}

@end
