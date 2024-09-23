@implementation BKEndOfBookCardTransitionAnimationController

- (BKEndOfBookCardTransitionAnimationController)initWithCompactViewController:(id)a3 cardViewController:(id)a4
{
  id v6;
  id v7;
  BKEndOfBookCardTransitionAnimationController *v8;
  BKEndOfBookCardTransitionAnimationController *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BKEndOfBookCardTransitionAnimationController;
  v8 = -[BKEndOfBookCardTransitionAnimationController init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_compactViewController, v6);
    objc_storeWeak((id *)&v9->_cardViewController, v7);
  }

  return v9;
}

- (BOOL)isCoverTransition
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;

  v3 = objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardContent](self, "cardContent"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactArtworkSource](self, "compactArtworkSource"));
    if (!v5)
    {
      v15 = 0;
LABEL_8:

      return v15;
    }
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardArtworkSource](self, "cardArtworkSource"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactArtworkSource](self, "compactArtworkSource"));
      v9 = objc_msgSend(v8, "isCover");

      if (!v9)
        return 1;
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactArtworkSource](self, "compactArtworkSource"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "refInstance"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardArtworkSource](self, "cardArtworkSource"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "refInstance"));
      v15 = objc_msgSend(v11, "isEqualToString:", v14);

      goto LABEL_8;
    }
  }
  return 0;
}

- (BOOL)isCompositeCompactArtwork
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactArtworkSource](self, "compactArtworkSource"));
  v3 = objc_msgSend(v2, "isCover") ^ 1;

  return v3;
}

- (void)setDropShadowView:(id)a3
{
  UIView *v5;
  UIView *v6;
  UIView **p_dropShadowView;
  UIView *dropShadowView;
  UIView *v9;

  v5 = (UIView *)a3;
  dropShadowView = self->_dropShadowView;
  p_dropShadowView = &self->_dropShadowView;
  v6 = dropShadowView;
  if (dropShadowView != v5)
  {
    v9 = v5;
    -[UIView removeFromSuperview](v6, "removeFromSuperview");
    objc_storeStrong((id *)p_dropShadowView, a3);
    v5 = v9;
  }

}

- (void)setSnapshotView:(id)a3
{
  _BKEndOfBookCardTransitionSnapshotView *v5;
  _BKEndOfBookCardTransitionSnapshotView *v6;
  _BKEndOfBookCardTransitionSnapshotView **p_snapshotView;
  _BKEndOfBookCardTransitionSnapshotView *snapshotView;
  _BKEndOfBookCardTransitionSnapshotView *v9;

  v5 = (_BKEndOfBookCardTransitionSnapshotView *)a3;
  snapshotView = self->_snapshotView;
  p_snapshotView = &self->_snapshotView;
  v6 = snapshotView;
  if (snapshotView != v5)
  {
    v9 = v5;
    -[_BKEndOfBookCardTransitionSnapshotView removeFromSuperview](v6, "removeFromSuperview");
    objc_storeStrong((id *)p_snapshotView, a3);
    v5 = v9;
  }

}

- (void)setCoverController:(id)a3
{
  BCSheetTransitionCoverController *v5;
  BCSheetTransitionCoverController *v6;
  BCSheetTransitionCoverController **p_coverController;
  BCSheetTransitionCoverController *coverController;
  void *v9;
  BCSheetTransitionCoverController *v10;

  v5 = (BCSheetTransitionCoverController *)a3;
  coverController = self->_coverController;
  p_coverController = &self->_coverController;
  v6 = coverController;
  if (coverController != v5)
  {
    v10 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BCSheetTransitionCoverController coverView](v6, "coverView"));
    objc_msgSend(v9, "removeFromSuperview");

    objc_storeStrong((id *)p_coverController, a3);
    v5 = v10;
  }

}

- (id)createCompactArtworkSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactViewController](self, "compactViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "feedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "artworkSourceInEntryWithIndex:refId:refInstance:isCover:", 0, CFSTR("featured-cover"), 0, 1));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactViewController](self, "compactViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "feedViewController"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "artworkSourceInEntryWithIndex:refId:refInstance:isCover:", 0, CFSTR("featured-artwork"), 0, 0));

  }
  return v7;
}

- (id)createCardArtworkSource
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = objc_opt_class(BSUIFeedViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardViewController](self, "cardViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardNavigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
  v7 = BUDynamicCast(v3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sheetTransitioningCardContentArtworkSourceInEntryWithIndex:", 1));
  return v9;
}

- (void)hideCovers
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactUnhideBlock](self, "compactUnhideBlock"));
  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactArtworkSource](self, "compactArtworkSource"));
    v5 = objc_msgSend(v4, "isCover");

    if (!v5)
      goto LABEL_5;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactArtworkSource](self, "compactArtworkSource"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "hide"));
    -[BKEndOfBookCardTransitionAnimationController setCompactUnhideBlock:](self, "setCompactUnhideBlock:", v6);

  }
LABEL_5:
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardUnhideBlock](self, "cardUnhideBlock"));
  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardArtworkSource](self, "cardArtworkSource"));
    v9 = objc_msgSend(v8, "isCover");

    if (!v9)
      return;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardArtworkSource](self, "cardArtworkSource"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hide"));
    -[BKEndOfBookCardTransitionAnimationController setCardUnhideBlock:](self, "setCardUnhideBlock:", v10);

    v7 = v11;
  }

}

- (void)unhideCovers
{
  uint64_t v3;
  void *v4;
  void (**v5)(void);

  v3 = objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactUnhideBlock](self, "compactUnhideBlock"));
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  -[BKEndOfBookCardTransitionAnimationController setCompactUnhideBlock:](self, "setCompactUnhideBlock:", 0);

  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardUnhideBlock](self, "cardUnhideBlock"));
  if (v5)
    v5[2]();
  -[BKEndOfBookCardTransitionAnimationController setCardUnhideBlock:](self, "setCardUnhideBlock:", 0);

}

- (void)_setupCardDropShadowForPresented:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController dropShadowView](self, "dropShadowView"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactViewController](self, "compactViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dropShadowView"));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
    v9 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cornerCurve"));
    objc_msgSend(v10, "setCornerCurve:", v11);

    objc_msgSend(v8, "cornerRadius");
    objc_msgSend(v10, "setCornerRadius:");
    objc_msgSend(v8, "shadowOffset");
    objc_msgSend(v10, "setShadowOffset:");
    objc_msgSend(v8, "shadowRadius");
    objc_msgSend(v10, "setShadowRadius:");
    objc_msgSend(v10, "setShadowColor:", objc_msgSend(v8, "shadowColor"));
    objc_msgSend(v8, "shadowOpacity");
    objc_msgSend(v10, "setShadowOpacity:");
    objc_msgSend(v10, "setShadowPathIsBounds:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardViewController](self, "cardViewController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "presentationController"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "containerView"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardViewController](self, "cardViewController"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "presentationController"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "presentedView"));

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));
    if (v18 == v14)
      objc_msgSend(v14, "insertSubview:belowSubview:", v9, v17);
    else
      objc_msgSend(v14, "insertSubview:atIndex:", v9, 0);
    -[BKEndOfBookCardTransitionAnimationController setDropShadowView:](self, "setDropShadowView:", v9);

  }
  if (v3)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardViewController](self, "cardViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardViewController](self, "cardViewController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "presentationController"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "containerView"));
  }
  else
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactViewController](self, "compactViewController"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "dropShadowView"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardViewController](self, "cardViewController"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "bc_ancestorFullScreenPresentingViewController"));
    v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "view"));
  }
  v25 = (void *)v23;

  objc_msgSend(v20, "bounds");
  objc_msgSend(v25, "convertRect:fromView:", v20);
  v27 = v26;
  v29 = v28;
  v31 = v30;
  v33 = v32;

  v34 = (id)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController dropShadowView](self, "dropShadowView"));
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);
  objc_msgSend(v34, "setAlpha:", (double)!v3);

}

- (void)prepareForPresentation:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardViewController](self, "cardViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitioningCardContent"));

  if (v5)
  {
    -[BKEndOfBookCardTransitionAnimationController setCardContent:](self, "setCardContent:", v5);
    -[BKEndOfBookCardTransitionAnimationController _prepareForPresentation:](self, "_prepareForPresentation:", v8);
  }
  else
  {
    v6 = objc_retainBlock(v8);
    v7 = v6;
    if (v6)
      (*((void (**)(id))v6 + 2))(v6);

  }
}

- (void)_prepareForPresentation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
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
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  os_signpost_id_t v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  NSObject *v40;
  os_signpost_id_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  id v46;
  _QWORD *v47;
  NSObject *v48;
  id v49;
  void *v50;
  unsigned __int8 v51;
  dispatch_queue_global_t global_queue;
  NSObject *v53;
  id v54;
  NSObject *v55;
  id v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  _QWORD v61[5];
  _QWORD v62[4];
  NSObject *v63;
  id v64;
  os_signpost_id_t v65;
  unsigned __int8 v66;
  _QWORD v67[4];
  id v68;
  NSObject *v69;
  _QWORD v70[4];
  id v71;
  uint8_t buf[16];
  _QWORD block[4];
  id v74;
  _QWORD v75[4];
  NSObject *v76;
  _QWORD v77[4];
  id v78;

  v59 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactViewController](self, "compactViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardViewController](self, "cardViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController createCompactArtworkSource](self, "createCompactArtworkSource"));
  -[BKEndOfBookCardTransitionAnimationController setCompactArtworkSource:](self, "setCompactArtworkSource:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bc_windowForViewController"));
  objc_msgSend(v5, "preferredContentSize");
  v8 = _UISheetFormSize(v7);
  v10 = v9;
  v11 = CGRectMakeWithSize(v8, v9);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v18, "setBounds:", v11, v13, v15, v17);

  v19 = objc_opt_class(BSUIFeedViewController);
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardNavigationController"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topViewController"));
  v22 = BUDynamicCast(v19, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "scrollView"));
  objc_msgSend(v24, "setContentOffset:", 0.0, 0.0);

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactViewController](self, "compactViewController"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "tui_effectiveSyncLayoutController"));
  objc_msgSend(v23, "configureWithSyncLayoutController:", v26);

  v27 = v4;
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "im_firstVisibleChildConformingToProtocol:includePresented:", &OBJC_PROTOCOL___BCCardStackTransitioningCoverHost, 0));
  if (v58)
  {
    v77[0] = _NSConcreteStackBlock;
    v77[1] = 3221225472;
    v77[2] = sub_1001BB2F8;
    v77[3] = &unk_1008E72C0;
    v78 = v5;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v77);

  }
  v60 = v5;
  v28 = dispatch_group_create();
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardContent](self, "cardContent"));
  dispatch_group_enter(v28);
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472;
  v75[2] = sub_1001BB328;
  v75[3] = &unk_1008E72C0;
  v30 = v28;
  v76 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "cardStackTransitionSuspendUpdatesAssertionUntilContentExceedsHeightWithCompletion:", v75));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "cardStackTransitionSuspendLayoutAssertion"));
  -[BKEndOfBookCardTransitionAnimationController setSuspendLayoutAssertion:](self, "setSuspendLayoutAssertion:", v32);

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BB330;
  block[3] = &unk_1008E72C0;
  v74 = v31;
  v56 = v31;
  v57 = v30;
  dispatch_group_notify(v30, (dispatch_queue_t)&_dispatch_main_q, block);
  v33 = BCAugmentedExperienceSignpost();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  v35 = os_signpost_id_generate(v34);

  v36 = BCAugmentedExperienceSignpost();
  v37 = objc_claimAutoreleasedReturnValue(v36);
  v38 = v37;
  if (v35 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v38, OS_SIGNPOST_INTERVAL_BEGIN, v35, "EOB.CardAnimation.prepareForOpen", ", buf, 2u);
  }

  v39 = BCAugmentedExperienceSignpost();
  v40 = objc_claimAutoreleasedReturnValue(v39);
  v41 = os_signpost_id_generate(v40);

  v42 = BCAugmentedExperienceSignpost();
  v43 = objc_claimAutoreleasedReturnValue(v42);
  v44 = v43;
  if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v44, OS_SIGNPOST_INTERVAL_BEGIN, v41, "EOB.CardAnimation.prepareForOpen.wait", ", buf, 2u);
  }

  kdebug_trace(725354648, 0, 0, 0, 0);
  v45 = dispatch_group_create();
  dispatch_group_enter(v45);
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_1001BB3F0;
  v70[3] = &unk_1008EE820;
  v71 = v7;
  v46 = v7;
  v47 = objc_retainBlock(v70);
  v67[0] = _NSConcreteStackBlock;
  v67[1] = 3221225472;
  v67[2] = sub_1001BB450;
  v67[3] = &unk_1008E7338;
  v68 = v29;
  v48 = v45;
  v69 = v48;
  v49 = v29;
  objc_msgSend(v49, "sheetTransitioningCardContentPrepareForOpenWithViewController:viewSize:overrideTraitsBlock:numEntries:completion:", v4, v47, 3, v67, v8, v10);
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v51 = objc_msgSend(v50, "isRunningTest");

  global_queue = dispatch_get_global_queue(25, 0);
  v53 = objc_claimAutoreleasedReturnValue(global_queue);
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1001BB500;
  v62[3] = &unk_1008ED620;
  v66 = v51;
  v63 = v48;
  v64 = v59;
  v65 = v41;
  v54 = v59;
  v55 = v48;
  dispatch_async(v53, v62);

  v61[0] = _NSConcreteStackBlock;
  v61[1] = 3221225472;
  v61[2] = sub_1001BB6C4;
  v61[3] = &unk_1008E7458;
  v61[4] = v35;
  dispatch_group_notify(v55, (dispatch_queue_t)&_dispatch_main_q, v61);

}

- (void)prepareForDismissal
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001BB7A4;
  v2[3] = &unk_1008E72C0;
  v2[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v2);
}

- (void)setupAnimationsForPresentation
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  __int128 v13;
  void *v14;
  void *v15;
  _QWORD block[5];
  _OWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  id v22;
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactViewController](self, "compactViewController"));
  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x3010000000;
  v42 = 0;
  v43 = 0;
  v41 = &unk_1007DCE8E;
  v31 = 0;
  v32 = &v31;
  v33 = 0x5010000000;
  v34 = &unk_1007DCE8E;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v27 = 0;
  v28 = (double *)&v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001BBA68;
  v21[3] = &unk_1008EE848;
  v21[4] = self;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardViewController](self, "cardViewController"));
  v22 = v4;
  v24 = &v27;
  v5 = v3;
  v23 = v5;
  v25 = &v38;
  v26 = &v31;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v21);
  -[BKEndOfBookCardTransitionAnimationController _setupCardDropShadowForPresented:](self, "_setupCardDropShadowForPresented:", 1);
  objc_msgSend(v4, "updateCardSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController snapshotView](self, "snapshotView"));
  objc_msgSend(v6, "setupConstraintsToSuperview");

  v7 = v28[3];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController snapshotView](self, "snapshotView"));
  objc_msgSend(v8, "setSnapshotTopOffset:", v7);

  if (-[BKEndOfBookCardTransitionAnimationController isCoverTransition](self, "isCoverTransition"))
  {
    v9 = v39[4];
    v10 = v39[5];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController coverController](self, "coverController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "coverView"));
    objc_msgSend(v12, "setCenter:", v9, v10);

    v13 = *((_OWORD *)v32 + 3);
    v18 = *((_OWORD *)v32 + 2);
    v19 = v13;
    v20 = *((_OWORD *)v32 + 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController coverController](self, "coverController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "coverView"));
    v17[0] = v18;
    v17[1] = v19;
    v17[2] = v20;
    objc_msgSend(v15, "setTransform:", v17);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BBFC0;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v38, 8);

}

- (void)setupAnimationsForDismissal
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
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
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  __int128 v30;
  void *v31;
  void *v32;
  _QWORD block[5];
  _OWORD v34[3];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[5];
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactViewController](self, "compactViewController"));
  v50 = 0;
  v51 = (double *)&v50;
  v52 = 0x3010000000;
  v54 = 0;
  v55 = 0;
  v53 = &unk_1007DCE8E;
  v43 = 0;
  v44 = &v43;
  v45 = 0x5010000000;
  v46 = &unk_1007DCE8E;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_1001BC2F4;
  v38[3] = &unk_1008EE870;
  v38[4] = self;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardViewController](self, "cardViewController"));
  v39 = v4;
  v5 = v3;
  v40 = v5;
  v41 = &v50;
  v42 = &v43;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v38);
  -[BKEndOfBookCardTransitionAnimationController _setupCardDropShadowForPresented:](self, "_setupCardDropShadowForPresented:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController snapshotView](self, "snapshotView"));
  objc_msgSend(v6, "setupConstraintsToSuperview");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController snapshotView](self, "snapshotView"));
  objc_msgSend(v7, "snapshotTopOffset");
  v9 = v8;

  if (v9 != 0.0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardNavigationController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController snapshotView](self, "snapshotView"));
    objc_msgSend(v20, "snapshotTopOffset");
    v22 = v21;

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardNavigationController"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "view"));
    objc_msgSend(v24, "setFrame:", v13, v15 - v22, v17, v19);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController snapshotView](self, "snapshotView"));
    objc_msgSend(v25, "setSnapshotTopOffset:", 0.0);

  }
  if (-[BKEndOfBookCardTransitionAnimationController isCoverTransition](self, "isCoverTransition"))
  {
    v26 = v51[4];
    v27 = v51[5];
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController coverController](self, "coverController"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "coverView"));
    objc_msgSend(v29, "setCenter:", v26, v27);

    v30 = *((_OWORD *)v44 + 3);
    v35 = *((_OWORD *)v44 + 2);
    v36 = v30;
    v37 = *((_OWORD *)v44 + 4);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController coverController](self, "coverController"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "coverView"));
    v34[0] = v35;
    v34[1] = v36;
    v34[2] = v37;
    objc_msgSend(v32, "setTransform:", v34);

  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BC710;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v50, 8);

}

- (void)finalizeAnimationsForPresentation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[BKEndOfBookCardTransitionAnimationController setSuspendLayoutAssertion:](self, "setSuspendLayoutAssertion:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardContent](self, "cardContent"));
  objc_msgSend(v5, "cardStackTransitioningCardContentFinalizeForOpen");

  -[BKEndOfBookCardTransitionAnimationController setCardContent:](self, "setCardContent:", 0);
  -[BKEndOfBookCardTransitionAnimationController _finalizePresentation:](self, "_finalizePresentation:", v3);
}

- (void)finalizeAnimationsForDismissal:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardContent](self, "cardContent"));
  objc_msgSend(v5, "cardStackTransitioningCardContentFinalizeForDismiss");

  -[BKEndOfBookCardTransitionAnimationController setCardContent:](self, "setCardContent:", 0);
  -[BKEndOfBookCardTransitionAnimationController _finalizePresentation:](self, "_finalizePresentation:", !v3);
}

- (double)_cardInitialTopOffset
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
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

  v3 = objc_opt_class(BSUIFeedViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardViewController](self, "cardViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cardNavigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topViewController"));
  v7 = BUDynamicCast(v3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController cardContent](self, "cardContent"));
  v10 = 0.0;
  if (v9 && v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "entries"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uuid"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUIRenderReferenceQuery queryWithUUID:uid:refId:refInstance:](TUIRenderReferenceQuery, "queryWithUUID:uid:refId:refInstance:", v14, 0, CFSTR("root-box"), 0));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "renderReferencesMatchingQuery:", v15));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allKeys"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));

    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v18));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));

      if (v20)
      {
        objc_msgSend(v20, "size");
        v10 = v21;

      }
    }

  }
  return v10;
}

- (void)_animateContentCrossfade:(BOOL)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _BOOL4 v7;
  void *v9;
  id v10;
  id v11;
  id v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[5];
  BOOL v20;
  _QWORD v21[5];
  BOOL v22;

  v7 = a3;
  LODWORD(v3) = 1051260355;
  LODWORD(v5) = 1059816735;
  LODWORD(v4) = 0;
  LODWORD(v6) = 1.0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v3, v4, v5, v6));
  v10 = objc_msgSend(objc_alloc((Class)UICubicTimingParameters), "initWithCustomCurve:", v9);
  v11 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v10, 0.12);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1001BCB18;
  v21[3] = &unk_1008E83C0;
  v21[4] = self;
  v22 = v7;
  objc_msgSend(v11, "addAnimations:", v21);
  v12 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:timingParameters:", v10, 0.17);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001BCBCC;
  v19[3] = &unk_1008E83C0;
  v19[4] = self;
  v20 = v7;
  objc_msgSend(v12, "addAnimations:", v19);
  if (v7)
  {
    objc_msgSend(v11, "startAnimation");
    v13 = 0.1;
    v14 = v12;
  }
  else
  {
    +[UITransitionView defaultDurationForTransition:](UITransitionView, "defaultDurationForTransition:", 8);
    v16 = v15;
    objc_msgSend(v12, "duration");
    objc_msgSend(v12, "startAnimationAfterDelay:", v16 - v17 + -0.2);
    objc_msgSend(v11, "duration");
    v13 = v16 - v18 + -0.1;
    v14 = v11;
  }
  objc_msgSend(v14, "startAnimationAfterDelay:", v13);

}

- (void)_removeTransitioningViews
{
  -[BKEndOfBookCardTransitionAnimationController setDropShadowView:](self, "setDropShadowView:", 0);
  -[BKEndOfBookCardTransitionAnimationController setSnapshotView:](self, "setSnapshotView:", 0);
  -[BKEndOfBookCardTransitionAnimationController setCoverController:](self, "setCoverController:", 0);
  -[BKEndOfBookCardTransitionAnimationController setCompactArtworkSource:](self, "setCompactArtworkSource:", 0);
  -[BKEndOfBookCardTransitionAnimationController setCardArtworkSource:](self, "setCardArtworkSource:", 0);
}

- (void)_finalizePresentation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEndOfBookCardTransitionAnimationController compactViewController](self, "compactViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v6, "setHidden:", v3);

  -[BKEndOfBookCardTransitionAnimationController unhideCovers](self, "unhideCovers");
  -[BKEndOfBookCardTransitionAnimationController _removeTransitioningViews](self, "_removeTransitioningViews");
}

- (void)dealloc
{
  objc_super v3;

  -[BKEndOfBookCardTransitionAnimationController unhideCovers](self, "unhideCovers");
  -[BKEndOfBookCardTransitionAnimationController _removeTransitioningViews](self, "_removeTransitioningViews");
  v3.receiver = self;
  v3.super_class = (Class)BKEndOfBookCardTransitionAnimationController;
  -[BKEndOfBookCardTransitionAnimationController dealloc](&v3, "dealloc");
}

- (UIView)dropShadowView
{
  return self->_dropShadowView;
}

- (_BKEndOfBookCardTransitionSnapshotView)snapshotView
{
  return self->_snapshotView;
}

- (BCSheetTransitionCoverController)coverController
{
  return self->_coverController;
}

- (BKEndOfBookCompactViewController)compactViewController
{
  return (BKEndOfBookCompactViewController *)objc_loadWeakRetained((id *)&self->_compactViewController);
}

- (void)setCompactViewController:(id)a3
{
  objc_storeWeak((id *)&self->_compactViewController, a3);
}

- (BKEndOfBookCardViewController)cardViewController
{
  return (BKEndOfBookCardViewController *)objc_loadWeakRetained((id *)&self->_cardViewController);
}

- (void)setCardViewController:(id)a3
{
  objc_storeWeak((id *)&self->_cardViewController, a3);
}

- (BCSheetTransitioningCardContent)cardContent
{
  return self->_cardContent;
}

- (void)setCardContent:(id)a3
{
  objc_storeStrong((id *)&self->_cardContent, a3);
}

- (BCSheetTransitioningArtworkSource)compactArtworkSource
{
  return self->_compactArtworkSource;
}

- (void)setCompactArtworkSource:(id)a3
{
  objc_storeStrong((id *)&self->_compactArtworkSource, a3);
}

- (BCSheetTransitioningArtworkSource)cardArtworkSource
{
  return self->_cardArtworkSource;
}

- (void)setCardArtworkSource:(id)a3
{
  objc_storeStrong((id *)&self->_cardArtworkSource, a3);
}

- (TUIAssertion)suspendLayoutAssertion
{
  return self->_suspendLayoutAssertion;
}

- (void)setSuspendLayoutAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_suspendLayoutAssertion, a3);
}

- (id)compactUnhideBlock
{
  return self->_compactUnhideBlock;
}

- (void)setCompactUnhideBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)cardUnhideBlock
{
  return self->_cardUnhideBlock;
}

- (void)setCardUnhideBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cardUnhideBlock, 0);
  objc_storeStrong(&self->_compactUnhideBlock, 0);
  objc_storeStrong((id *)&self->_suspendLayoutAssertion, 0);
  objc_storeStrong((id *)&self->_cardArtworkSource, 0);
  objc_storeStrong((id *)&self->_compactArtworkSource, 0);
  objc_storeStrong((id *)&self->_cardContent, 0);
  objc_destroyWeak((id *)&self->_cardViewController);
  objc_destroyWeak((id *)&self->_compactViewController);
  objc_storeStrong((id *)&self->_coverController, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_dropShadowView, 0);
}

@end
