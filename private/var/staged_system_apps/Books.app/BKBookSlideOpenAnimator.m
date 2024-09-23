@implementation BKBookSlideOpenAnimator

- (double)duration
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[BKBookSlideOpenAnimator zoomDuration](self, "zoomDuration");
  v4 = v3;
  -[BKBookSlideOpenAnimator revealDuration](self, "revealDuration");
  v6 = v4 + v5;
  -[BKBookSlideOpenAnimator accessoryFadeDuration](self, "accessoryFadeDuration");
  return v6 + v7;
}

- (double)zoomDuration
{
  return AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * 0.65;
}

- (double)revealDuration
{
  return AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * 0.65;
}

- (double)accessoryFadeDuration
{
  return AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * 0.3;
}

- (double)minibarSlideDuration
{
  return AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * 0.2;
}

- (double)zoomedContentScale
{
  double Height;
  void *v4;
  double v5;
  CGRect v7;
  CGRect v8;

  -[BKBookOpenAnimator zoomedCoverFrame](self, "zoomedCoverFrame");
  Height = CGRectGetHeight(v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  objc_msgSend(v4, "bounds");
  v5 = Height / CGRectGetHeight(v8);

  return v5;
}

- (double)contentTintFadeDuration
{
  return AudiobookNowPlayingTouchViewController.transitionToolbarAlpha()() * 0.5;
}

- (double)minSecondHalfDelayOnOpen
{
  return 0.4;
}

- (double)minSecondHalfDelayOnClose
{
  return 0.0;
}

- (void)_teardownContentViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookSlideOpenAnimator fullBookSnapshot](self, "fullBookSnapshot"));
  objc_msgSend(v3, "removeFromSuperview");

  -[BKBookSlideOpenAnimator setFullBookSnapshot:](self, "setFullBookSnapshot:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookSlideOpenAnimator contentTintView](self, "contentTintView"));
  objc_msgSend(v4, "removeFromSuperview");

  -[BKBookSlideOpenAnimator setContentTintView:](self, "setContentTintView:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookSlideOpenAnimator contentSnapshot](self, "contentSnapshot"));
  objc_msgSend(v5, "removeFromSuperview");

  -[BKBookSlideOpenAnimator setContentSnapshot:](self, "setContentSnapshot:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookSlideOpenAnimator contentContainerView](self, "contentContainerView"));
  objc_msgSend(v6, "removeFromSuperview");

  -[BKBookSlideOpenAnimator setContentContainerView:](self, "setContentContainerView:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookSlideOpenAnimator contentClipView](self, "contentClipView"));
  objc_msgSend(v7, "removeFromSuperview");

  -[BKBookSlideOpenAnimator setContentClipView:](self, "setContentClipView:", 0);
}

- (void)teardownViews:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[BKBookSlideOpenAnimator _teardownContentViews](self, "_teardownContentViews");
  v5.receiver = self;
  v5.super_class = (Class)BKBookSlideOpenAnimator;
  -[BKBookZoomRevealOpenAnimator teardownViews:](&v5, "teardownViews:", v3);
}

- (void)setupViewsForZoom
{
  void *v3;
  void *v4;
  id v5;

  -[BKBookSlideOpenAnimator _teardownContentViews](self, "_teardownContentViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookContainerView](self, "bookContainerView"));
  objc_msgSend(v3, "setAlpha:", 0.0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  objc_msgSend(v5, "addSubview:", v4);

}

- (void)animateZoomWithCompletion:(id)a3
{
  id v4;
  unsigned int v5;
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
  unsigned int v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  uint64_t v42;
  _QWORD v43[5];
  _QWORD v44[12];

  v4 = a3;
  v5 = -[BKBookOpenAnimator opening](self, "opening");
  -[BKBookOpenAnimator closedCoverFrame](self, "closedCoverFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[BKBookOpenAnimator zoomedCoverFrame](self, "zoomedCoverFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[BKBookSlideOpenAnimator zoomDuration](self, "zoomDuration");
  -[BKBookOpenAnimator animateNavigationBarWithDuration:delay:](self, "animateNavigationBarWithDuration:delay:", v22 * 0.5, 0.0);
  if ((v5 & 1) != 0)
  {
    v41 = v15;
    v42 = 0x3FA999999999999ALL;
    v37 = v11;
    v38 = v13;
    v23 = v17;
    v17 = v9;
    v15 = v7;
    v40 = 0.0;
    v39 = 1.0;
    v11 = v19;
    v24 = v23;
    v25 = -[BKBookOpenAnimator fadeInCover](self, "fadeInCover", 0);
  }
  else
  {
    v42 = 0;
    v37 = v19;
    v38 = v21;
    v39 = 0.0;
    v40 = 0.05;
    v41 = v7;
    v24 = v9;
    v21 = v13;
    v25 = -[BKBookOpenAnimator fadeInCover](self, "fadeInCover", 1.0);
  }
  v26 = 0.0;
  if ((v25 & v5) != 0)
    v27 = 0.0;
  else
    v27 = 1.0;
  if ((-[BKBookOpenAnimator fadeInCover](self, "fadeInCover") & (v5 ^ 1)) == 0)
    v26 = 1.0;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  objc_msgSend(v28, "setAlpha:", v27);

  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:", v15, v17, v37, v38);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfTintView](self, "bookshelfTintView"));
  objc_msgSend(v29, "setAlpha:", v40);

  -[BKBookOpenAnimator setBookshelfAlpha:](self, "setBookshelfAlpha:", v39);
  -[BKBookSlideOpenAnimator zoomDuration](self, "zoomDuration");
  v31 = v30;
  -[BKBookSlideOpenAnimator minibarSlideDuration](self, "minibarSlideDuration");
  -[BKBookOpenAnimator minibarKeyFrameAnimationWithDuration:hide:show:completion:](self, "minibarKeyFrameAnimationWithDuration:hide:show:completion:", 0, v31, v32, -1.0);
  -[BKBookSlideOpenAnimator zoomDuration](self, "zoomDuration");
  v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookZoomRevealOpenAnimator zoomTimingFunction](self, "zoomTimingFunction"));
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_1000F1060;
  v44[3] = &unk_1008E9FF8;
  v44[4] = self;
  *(double *)&v44[5] = v26;
  *(double *)&v44[6] = v41;
  *(double *)&v44[7] = v24;
  *(double *)&v44[8] = v11;
  *(double *)&v44[9] = v21;
  v44[10] = v42;
  v44[11] = v36;
  +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v35, 0, v44, v4, v34, 0.0);

  -[BKBookSlideOpenAnimator zoomDuration](self, "zoomDuration");
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_1000F10DC;
  v43[3] = &unk_1008E72C0;
  v43[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v43);
}

- (void)setupViewsForReveal
{
  unsigned int v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  __n128 v23;
  double v24;
  UIView *v25;
  UIView *contentClipView;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  __n128 v31;
  UIView *v32;
  UIView *contentContainerView;
  UIView *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  UIView *v52;
  UIView *contentSnapshot;
  id v54;
  UIView *v55;
  UIView *contentTintView;
  void *v57;
  void *v58;
  void *v59;
  UIView *v60;
  UIView *fullBookSnapshot;
  void *v62;
  void *v63;
  unsigned int v64;
  double v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  double v74;
  double v75;
  __n128 v76;
  void *v77;
  void *v78;
  id v79;

  if (-[BKBookOpenAnimator opening](self, "opening")
    && !-[BKBookZoomRevealOpenAnimator contentLoaded](self, "contentLoaded"))
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookSlideOpenAnimator.m", 185, "-[BKBookSlideOpenAnimator setupViewsForReveal]", "!self.opening || self.contentLoaded", CFSTR("Revealing content before book is loaded!"));
  }
  v3 = -[BKBookOpenAnimator rightToLeft](self, "rightToLeft");
  -[BKBookOpenAnimator setBookshelfAlpha:](self, "setBookshelfAlpha:", 0.0);
  v79 = (id)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookViewController](self, "bookViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "transitionContentView"));
  if (!v4)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/BKBookSlideOpenAnimator.m", 196, "-[BKBookSlideOpenAnimator setupViewsForReveal]", "contentView", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  -[BKBookOpenAnimator coverAspectRatio](self, "coverAspectRatio");
  v11 = v9 * v10;
  v12 = v7 + v9 * v10;
  v13 = -(v9 * v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  objc_msgSend(v4, "frame");
  v16 = v15;
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "view"));
  objc_msgSend(v14, "convertPoint:fromView:", v19, v16, v18);
  v21 = v20;

  v22 = objc_alloc((Class)UIView);
  if (v3)
    v23.n128_f64[0] = 0.0;
  else
    v23.n128_f64[0] = v13;
  if (v3)
    v24 = 0.0;
  else
    v24 = v11;
  CGRectMakeWithOriginSize(v23, v21, v12, v9);
  v25 = (UIView *)objc_msgSend(v22, "initWithFrame:");
  contentClipView = self->_contentClipView;
  self->_contentClipView = v25;

  -[UIView setClipsToBounds:](self->_contentClipView, "setClipsToBounds:", 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookSlideOpenAnimator contentClipView](self, "contentClipView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfTintView](self, "bookshelfTintView"));
  objc_msgSend(v27, "insertSubview:aboveSubview:", v28, v29);

  v30 = objc_alloc((Class)UIView);
  v31.n128_f64[0] = v24;
  CGRectMakeWithOriginSize(v31, 0.0, v7, v9);
  v32 = (UIView *)objc_msgSend(v30, "initWithFrame:");
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v32;

  -[UIView addSubview:](self->_contentClipView, "addSubview:", self->_contentContainerView);
  v34 = self->_contentContainerView;
  objc_msgSend(v4, "frame");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  -[UIView convertRect:fromView:](v34, "convertRect:fromView:", v43, v36, v38, v40, v42);
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v51 = v50;

  v52 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "snapshotViewAfterScreenUpdates:", 0));
  contentSnapshot = self->_contentSnapshot;
  self->_contentSnapshot = v52;

  -[UIView setFrame:](self->_contentSnapshot, "setFrame:", v45, v47, v49, v51);
  -[UIView addSubview:](self->_contentContainerView, "addSubview:", self->_contentSnapshot);
  v54 = objc_alloc((Class)UIView);
  -[UIView bounds](self->_contentSnapshot, "bounds");
  v55 = (UIView *)objc_msgSend(v54, "initWithFrame:");
  contentTintView = self->_contentTintView;
  self->_contentTintView = v55;

  v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[UIView setBackgroundColor:](self->_contentTintView, "setBackgroundColor:", v57);

  -[UIView addSubview:](self->_contentSnapshot, "addSubview:", self->_contentTintView);
  -[UIView setAutoresizingMask:](self->_contentTintView, "setAutoresizingMask:", 18);
  if ((objc_opt_respondsToSelector(v79, "transitionContentBackgroundColor") & 1) != 0)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "transitionContentBackgroundColor"));
    -[UIView setBackgroundColor:](self->_contentContainerView, "setBackgroundColor:", v58);

  }
  if ((objc_opt_respondsToSelector(v79, "transitionContentViewIsFullBookView") & 1) == 0
    || (objc_msgSend(v79, "transitionContentViewIsFullBookView") & 1) == 0)
  {
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "view"));
    v60 = (UIView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "snapshotViewAfterScreenUpdates:", 0));
    fullBookSnapshot = self->_fullBookSnapshot;
    self->_fullBookSnapshot = v60;

    v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "view"));
    objc_msgSend(v62, "frame");
    -[UIView setFrame:](self->_fullBookSnapshot, "setFrame:");

    v63 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
    objc_msgSend(v63, "addSubview:", self->_fullBookSnapshot);

    v64 = -[BKBookOpenAnimator opening](self, "opening");
    v65 = 1.0;
    if (v64)
      v65 = 0.0;
    -[UIView setAlpha:](self->_fullBookSnapshot, "setAlpha:", v65);
  }
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookContainerView](self, "bookContainerView"));
  objc_msgSend(v66, "setAlpha:", 0.0);

  if (!v3)
    v7 = v13;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  objc_msgSend(v4, "frame");
  v69 = v68;
  v71 = v70;
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "view"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "superview"));
  objc_msgSend(v67, "convertPoint:fromView:", v73, v69, v71);
  v75 = v74;

  v76.n128_f64[0] = v7;
  CGRectMakeWithOriginSize(v76, v75, v11, v9);
  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:");
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator containerView](self, "containerView"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  objc_msgSend(v77, "addSubview:", v78);

}

- (void)animateRevealWithCompletion:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  _QWORD *v7;
  unsigned int v8;
  unsigned int v9;
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
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  __n128 v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double CenterNoRounding;
  double v57;
  double v58;
  __n128 v59;
  uint64_t v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  const CGAffineTransform *v69;
  __int128 v70;
  __int128 v71;
  double v72;
  double v73;
  double v74;
  double v75;
  void *v76;
  UIView *fullBookSnapshot;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  void *v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  uint64_t v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double sx;
  _QWORD v127[5];
  _QWORD v128[6];
  _QWORD v129[6];
  _QWORD v130[6];
  _QWORD v131[15];
  __int128 v132;
  __int128 v133;
  __int128 v134;
  CGAffineTransform v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  CGAffineTransform v139;
  CGAffineTransform v140;
  _QWORD v141[4];
  id v142;
  _QWORD *v143;
  _QWORD v144[5];
  _QWORD v145[4];
  CGRect v146;

  v4 = a3;
  v145[0] = 0;
  v145[1] = v145;
  v145[2] = 0x2020000000;
  v145[3] = 0;
  v144[0] = _NSConcreteStackBlock;
  v144[1] = 3221225472;
  v144[2] = sub_1000F1D60;
  v144[3] = &unk_1008E7BE8;
  v144[4] = v145;
  v5 = objc_retainBlock(v144);
  v141[0] = _NSConcreteStackBlock;
  v141[1] = 3221225472;
  v141[2] = sub_1000F1D78;
  v141[3] = &unk_1008E8CA0;
  v143 = v145;
  v6 = v4;
  v142 = v6;
  v7 = objc_retainBlock(v141);
  v8 = -[BKBookOpenAnimator opening](self, "opening");
  v9 = -[BKBookOpenAnimator rightToLeft](self, "rightToLeft");
  -[BKBookSlideOpenAnimator zoomedContentScale](self, "zoomedContentScale");
  sx = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator coverContainerView](self, "coverContainerView"));
  v125 = IMActionSafeRectForRect(objc_msgSend(v11, "frame"));
  v13 = v12;
  v15 = v14;
  v17 = v16;

  -[BKBookOpenAnimator zoomedCoverFrame](self, "zoomedCoverFrame");
  v22 = v18;
  v23 = v19;
  v24 = v20;
  v25 = v21;
  if (v8)
    v26 = v18;
  else
    v26 = v125;
  if (v8)
    v27 = v19;
  else
    v27 = v13;
  v112 = v27;
  v113 = v26;
  if (v8)
    v28 = v20;
  else
    v28 = v15;
  if (v8)
    v29 = v21;
  else
    v29 = v17;
  v110 = v29;
  v111 = v28;
  if ((v8 & 1) == 0)
  {
    v17 = v21;
    v15 = v20;
    v13 = v19;
    v125 = v22;
  }
  v107 = v13;
  v108 = v15;
  -[UIView frame](self->_contentClipView, "frame");
  v120 = v31;
  v122 = v30;
  v116 = v33;
  v118 = v32;
  -[UIView frame](self->_contentContainerView, "frame");
  v114 = v35;
  v115 = v34;
  v37 = v36;
  v39 = v38;
  v105 = v17;
  v40.n128_f64[0] = CGSizeScale(v36, v38, sx);
  v124 = v41;
  v42 = v40.n128_f64[0];
  v43 = v24 + v40.n128_f64[0];
  if (v9)
  {
    v146.origin.x = v22;
    v146.origin.y = v23;
    v146.size.width = v24;
    v146.size.height = v25;
    v22 = CGRectGetMaxX(v146) - v43;
  }
  v40.n128_f64[0] = v22;
  v44 = CGRectMakeWithOriginSize(v40, v23, v43, v124);
  if (v8)
    v49 = v45;
  else
    v49 = v122;
  if (v8)
    v50 = v46;
  else
    v50 = v120;
  v109 = v50;
  if (v8)
    v51 = v47;
  else
    v51 = v118;
  if (v8)
    v52 = v48;
  else
    v52 = v116;
  if ((v8 & 1) != 0)
    v45 = v122;
  v123 = v45;
  if ((v8 & 1) != 0)
    v53 = v120;
  else
    v53 = v46;
  if ((v8 & 1) != 0)
    v54 = v118;
  else
    v54 = v47;
  v119 = v54;
  v121 = v53;
  if ((v8 & 1) != 0)
    v55 = v116;
  else
    v55 = v48;
  v117 = v55;
  CenterNoRounding = CGRectGetCenterNoRounding(v44, v115, v114, v37, v39);
  v58 = v57;
  v59.n128_f64[0] = v24 - v42 - sx * 20.0;
  if (v9)
    v59.n128_f64[0] = sx * 20.0 + v43 - v24;
  v60 = CGRectMakeWithOriginSize(v59, 0.0, v42, v124);
  v65 = CGRectGetCenterNoRounding(v60, v61, v62, v63, v64);
  if (v8)
    v67 = v65;
  else
    v67 = CenterNoRounding;
  if (v8)
    v68 = v66;
  else
    v68 = v58;
  if (!v8)
    CenterNoRounding = v65;
  memset(&v140.c, 0, 32);
  if (!v8)
    v58 = v66;
  *(_OWORD *)&v140.a = 0uLL;
  CGAffineTransformMakeScale(&v140, sx, sx);
  if (v8)
  {
    v139 = v140;
    v69 = &CGAffineTransformIdentity;
  }
  else
  {
    v70 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&v139.a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&v139.c = v70;
    *(_OWORD *)&v139.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
    v69 = &v140;
  }
  v71 = *(_OWORD *)&v69->c;
  v136 = *(_OWORD *)&v69->a;
  v137 = v71;
  v138 = *(_OWORD *)&v69->tx;
  -[BKBookOpenAnimator moveCoverToFrame:](self, "moveCoverToFrame:", v113, v112, v111, v110, *(_QWORD *)&v105);
  -[UIView setFrame:](self->_contentClipView, "setFrame:", v49, v109, v51, v52);
  -[UIView setCenter:](self->_contentContainerView, "setCenter:", v67, v68);
  v135 = v139;
  -[UIView setTransform:](self->_contentContainerView, "setTransform:", &v135);
  ((void (*)(_QWORD *))v5[2])(v5);
  -[BKBookSlideOpenAnimator revealDuration](self, "revealDuration");
  v73 = v72;
  v74 = 0.0;
  if ((v8 & 1) == 0)
  {
    -[BKBookSlideOpenAnimator accessoryFadeDuration](self, "accessoryFadeDuration");
    v74 = v75;
  }
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookZoomRevealOpenAnimator revealTimingFunction](self, "revealTimingFunction"));
  v131[0] = _NSConcreteStackBlock;
  v131[1] = 3221225472;
  v131[2] = sub_1000F1DB0;
  v131[3] = &unk_1008EAB50;
  v131[4] = self;
  *(double *)&v131[5] = v125;
  *(double *)&v131[6] = v107;
  *(double *)&v131[7] = v108;
  v131[8] = v106;
  *(double *)&v131[9] = v123;
  *(double *)&v131[10] = v121;
  *(double *)&v131[11] = v119;
  *(double *)&v131[12] = v117;
  *(double *)&v131[13] = CenterNoRounding;
  *(double *)&v131[14] = v58;
  v134 = v138;
  v133 = v137;
  v132 = v136;
  +[UIView animateWithDuration:delay:timingFunction:options:animations:completion:](UIView, "animateWithDuration:delay:timingFunction:options:animations:completion:", v76, 0, v131, v7, v73, v74);

  fullBookSnapshot = self->_fullBookSnapshot;
  if (fullBookSnapshot)
  {
    if (v8)
      v78 = 0.0;
    else
      v78 = 1.0;
    if (v8)
      v79 = 1.0;
    else
      v79 = 0.0;
    -[UIView setAlpha:](fullBookSnapshot, "setAlpha:", v78);
    ((void (*)(_QWORD *))v5[2])(v5);
    -[BKBookSlideOpenAnimator accessoryFadeDuration](self, "accessoryFadeDuration");
    v81 = v80;
    v82 = 0.0;
    if (v8)
    {
      -[BKBookSlideOpenAnimator revealDuration](self, "revealDuration");
      v82 = v83;
    }
    v130[0] = _NSConcreteStackBlock;
    v130[1] = 3221225472;
    v130[2] = sub_1000F1E3C;
    v130[3] = &unk_1008E8CC8;
    v130[4] = self;
    *(double *)&v130[5] = v79;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v130, v7, v81, v82);
  }
  if (v8)
    v84 = 0.7;
  else
    v84 = 0.05;
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookOpenAnimator bookshelfTintView](self, "bookshelfTintView"));
  v86 = v85;
  if (v8)
    v87 = 0.05;
  else
    v87 = 0.7;
  objc_msgSend(v85, "setAlpha:", v87);

  ((void (*)(_QWORD *))v5[2])(v5);
  -[BKBookSlideOpenAnimator revealDuration](self, "revealDuration");
  v89 = v88;
  v90 = 0.0;
  if ((v8 & 1) == 0)
  {
    -[BKBookSlideOpenAnimator accessoryFadeDuration](self, "accessoryFadeDuration");
    v90 = v91;
  }
  v129[0] = _NSConcreteStackBlock;
  v129[1] = 3221225472;
  v129[2] = sub_1000F1E54;
  v129[3] = &unk_1008E8CC8;
  v129[4] = self;
  *(double *)&v129[5] = v84;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v129, v7, v89, v90);
  if (v8)
    v92 = 0.25;
  else
    v92 = 0.0;
  if (v8)
    v93 = 0.0;
  else
    v93 = 0.25;
  -[UIView setAlpha:](self->_contentTintView, "setAlpha:", v92);
  ((void (*)(_QWORD *))v5[2])(v5);
  -[BKBookSlideOpenAnimator contentTintFadeDuration](self, "contentTintFadeDuration");
  v95 = v94;
  v96 = 0.0;
  if ((v8 & 1) == 0)
  {
    -[BKBookSlideOpenAnimator revealDuration](self, "revealDuration");
    v98 = v97;
    -[BKBookSlideOpenAnimator accessoryFadeDuration](self, "accessoryFadeDuration");
    v100 = v99;
    -[BKBookSlideOpenAnimator contentTintFadeDuration](self, "contentTintFadeDuration");
    v96 = v98 + v100 - v101;
  }
  v128[0] = _NSConcreteStackBlock;
  v128[1] = 3221225472;
  v128[2] = sub_1000F1E94;
  v128[3] = &unk_1008E8CC8;
  v128[4] = self;
  *(double *)&v128[5] = v93;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v128, v7, v95, v96);
  ((void (*)(_QWORD *))v5[2])(v5);
  -[BKBookSlideOpenAnimator revealDuration](self, "revealDuration");
  v103 = v102;
  -[BKBookSlideOpenAnimator minibarSlideDuration](self, "minibarSlideDuration");
  -[BKBookOpenAnimator minibarKeyFrameAnimationWithDuration:hide:show:completion:](self, "minibarKeyFrameAnimationWithDuration:hide:show:completion:", v7, v103, -1.0, v104);
  -[BKBookSlideOpenAnimator revealDuration](self, "revealDuration");
  v127[0] = _NSConcreteStackBlock;
  v127[1] = 3221225472;
  v127[2] = sub_1000F1EAC;
  v127[3] = &unk_1008E72C0;
  v127[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v127);

  _Block_object_dispose(v145, 8);
}

- (UIView)contentSnapshot
{
  return self->_contentSnapshot;
}

- (void)setContentSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_contentSnapshot, a3);
}

- (UIView)fullBookSnapshot
{
  return self->_fullBookSnapshot;
}

- (void)setFullBookSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_fullBookSnapshot, a3);
}

- (UIView)contentClipView
{
  return self->_contentClipView;
}

- (void)setContentClipView:(id)a3
{
  objc_storeStrong((id *)&self->_contentClipView, a3);
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (void)setContentContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_contentContainerView, a3);
}

- (UIView)contentTintView
{
  return self->_contentTintView;
}

- (void)setContentTintView:(id)a3
{
  objc_storeStrong((id *)&self->_contentTintView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentTintView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_contentClipView, 0);
  objc_storeStrong((id *)&self->_fullBookSnapshot, 0);
  objc_storeStrong((id *)&self->_contentSnapshot, 0);
}

@end
