@implementation DividedMonthListAnimator

- (void)animateToMonthWithCompletion:(id)a3 inContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  CGFloat v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  double v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  uint64_t v48;
  double v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  id v91;
  uint64_t v92;
  void *v93;
  id v94;
  _QWORD v95[4];
  id v96;
  DividedMonthListAnimator *v97;
  _QWORD v98[5];
  id v99;
  _QWORD v100[7];
  _QWORD v101[5];
  id v102;
  char v103;
  _QWORD v104[6];
  CGRect v105;

  v6 = a3;
  v7 = a4;
  if (-[CompactMonthListAnimator animating](self, "animating"))
    -[CompactMonthListAnimator _haltAnimations](self, "_haltAnimations");
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "containerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
  objc_msgSend(v10, "frame");
  v12 = v11;
  v14 = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  objc_msgSend(v15, "frameOfListView");
  v16 = CGRectGetMinY(v105) + -63.0 + -17.0;

  -[CompactMonthListAnimator setAnimating:](self, "setAnimating:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "dateLabel"));
  objc_msgSend(v18, "setHidden:", 1);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "animatableDateLabel"));
  objc_msgSend(v20, "setAlpha:", 0.0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "dayInitialsHeaderView"));
  objc_msgSend(v22, "setAlpha:", 0.0);

  -[CompactMonthListAnimator weekDayInitialsMonth](self, "weekDayInitialsMonth");
  v24 = v23;
  -[CompactMonthListAnimator weekDayInitialsMonth](self, "weekDayInitialsMonth");
  v26 = v25;
  -[CompactMonthListAnimator weekDayInitialsMonth](self, "weekDayInitialsMonth");
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "dayInitialsHeaderView"));
  objc_msgSend(v30, "setFrame:", v24, 0.0, v26, v28);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  LOBYTE(v29) = objc_msgSend(v31, "dividerLineVisible");

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  objc_msgSend(v32, "setDividerLineVisible:", 0);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  objc_msgSend(v33, "setSuppressLayout:", 1);

  v35 = springAnimationDuration(v34);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = sub_100067028;
  v104[3] = &unk_1001B2538;
  v104[4] = self;
  v37 = navigationAnimationsPreferringFRR(v104);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  v101[0] = _NSConcreteStackBlock;
  v101[1] = 3221225472;
  v101[2] = sub_10006710C;
  v101[3] = &unk_1001B3430;
  v103 = (char)v29;
  v101[4] = self;
  v102 = v6;
  v39 = v6;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v36, v38, v101, v35, 0.0);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "view"));
  objc_msgSend(v41, "frame");
  v43 = v42;
  v45 = v44;

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "view"));
  objc_msgSend(v47, "setFrame:", 0.0, -v16, v43, v45);

  v49 = springAnimationDuration(v48);
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_100067200;
  v100[3] = &unk_1001B2810;
  v100[4] = self;
  v100[5] = v12;
  v100[6] = v14;
  v51 = navigationAnimationsPreferringFRR(v100);
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v50, v52, 0, v49, 0.0);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "view"));
  objc_msgSend(v54, "setHidden:", 1);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "view"));
  objc_msgSend(v56, "frame");
  v58 = v57;
  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "view"));
  objc_msgSend(v60, "frame");
  v62 = v61;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "view"));
  objc_msgSend(v64, "setFrame:", 0.0, 0.0, v58, v62);

  v65 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "view"));
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "snapshotViewAfterScreenUpdates:", 0));

  v68 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "view"));
  objc_msgSend(v8, "insertSubview:aboveSubview:", v67, v69);

  objc_msgSend(v67, "frame");
  v71 = v70;
  v73 = v72;
  v75 = v74;
  v77 = v76;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "view"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "superview"));
  objc_msgSend(v8, "convertRect:fromView:", v80, v71, v73, v75, v77);
  v82 = v81;
  v84 = v83;
  v86 = v85;
  v88 = v87;

  v89 = springAnimationDuration(objc_msgSend(v67, "setFrame:", v82, v84, v86, v88));
  v90 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v98[0] = _NSConcreteStackBlock;
  v98[1] = 3221225472;
  v98[2] = sub_1000672A8;
  v98[3] = &unk_1001B26A0;
  v98[4] = self;
  v91 = v67;
  v99 = v91;
  v92 = navigationAnimationsPreferringFRR(v98);
  v93 = (void *)objc_claimAutoreleasedReturnValue(v92);
  v95[0] = _NSConcreteStackBlock;
  v95[1] = 3221225472;
  v95[2] = sub_1000673C4;
  v95[3] = &unk_1001B2F58;
  v96 = v91;
  v97 = self;
  v94 = v91;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v90, v93, v95, v89, 0.0);

}

- (id)_animateView:(id)a3 toPosition:(CGPoint)a4
{
  uint64_t v4;
  void *v5;

  v4 = springAnimateViewPosition(a3, 1, 0, (__n128)a4, *(__n128 *)&a4.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  preferredNavigationAnimationFrameRateRange();
  objc_msgSend(v5, "setPreferredFrameRateRange:");
  return v5;
}

- (void)animateToListWithCompletion:(id)a3 inContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  CGFloat v12;
  void *v13;
  void *v14;
  dispatch_time_t v15;
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
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  double v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  double v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  dispatch_time_t v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  double MinY;
  void *v83;
  void *v84;
  CGFloat v85;
  CGFloat Height;
  void *v87;
  double v88;
  void *v89;
  id v90;
  uint64_t v91;
  void *v92;
  id v93;
  void *v94;
  id v95;
  id v96;
  _QWORD v97[5];
  id v98;
  _QWORD v99[4];
  id v100;
  CATransform3D v101;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v104;
  _QWORD v105[5];
  _QWORD v106[4];
  id v107;
  DividedMonthListAnimator *v108;
  _QWORD v109[4];
  id v110;
  CGFloat v111;
  _QWORD v112[5];
  id v113;
  char v114;
  _QWORD v115[5];
  _QWORD block[7];
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;

  v95 = a3;
  v6 = a4;
  if (-[CompactMonthListAnimator animating](self, "animating"))
    -[CompactMonthListAnimator _haltAnimations](self, "_haltAnimations");
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "containerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "frame");
  v10 = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  objc_msgSend(v11, "frameOfListView");
  v12 = CGRectGetMinY(v117) + -63.0 + -17.0;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "view"));
  objc_msgSend(v14, "setAlpha:", 1.0);

  v15 = dispatch_time(0, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100067BFC;
  block[3] = &unk_1001B2538;
  block[4] = self;
  dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "snapshotViewAfterScreenUpdates:", 0));

  objc_msgSend(v94, "addSubview:", v18);
  objc_msgSend(v18, "setAlpha:", 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "view"));
  objc_msgSend(v20, "frame");
  v22 = v21;
  v24 = v23;

  objc_msgSend(v18, "setFrame:", v10, 0.0, v22, v24);
  -[CompactMonthListAnimator setAnimating:](self, "setAnimating:", 1);
  -[CompactMonthListAnimator weekDayInitialsMonth](self, "weekDayInitialsMonth");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "dayInitialsHeaderView"));
  objc_msgSend(v34, "setFrame:", v26, v28, v30, v32);

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dayInitialsHeaderView"));
  objc_msgSend(v36, "setAlpha:", 1.0);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "dateLabel"));
  objc_msgSend(v38, "setHidden:", 1);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "animatableDateLabel"));
  objc_msgSend(v40, "setAlpha:", 1.0);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  LOBYTE(v39) = objc_msgSend(v41, "dividerLineVisible");

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  objc_msgSend(v42, "setDividerLineVisible:", 0);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator paletteView](self, "paletteView"));
  objc_msgSend(v43, "setSuppressLayout:", 1);

  v45 = springAnimationDuration(v44);
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v115[0] = _NSConcreteStackBlock;
  v115[1] = 3221225472;
  v115[2] = sub_100067C48;
  v115[3] = &unk_1001B2538;
  v115[4] = self;
  v47 = navigationAnimationsPreferringFRR(v115);
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  v112[0] = _NSConcreteStackBlock;
  v112[1] = 3221225472;
  v112[2] = sub_100067D38;
  v112[3] = &unk_1001B3430;
  v114 = (char)v39;
  v112[4] = self;
  v113 = v95;
  v96 = v95;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v46, v48, v112, v45, 0.0);

  v50 = springAnimationDuration(v49);
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v109[0] = _NSConcreteStackBlock;
  v109[1] = 3221225472;
  v109[2] = sub_100067E58;
  v109[3] = &unk_1001B2838;
  v52 = v18;
  v110 = v52;
  v111 = v12;
  v53 = navigationAnimationsPreferringFRR(v109);
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);
  v106[0] = _NSConcreteStackBlock;
  v106[1] = 3221225472;
  v106[2] = sub_100067E98;
  v106[3] = &unk_1001B2F58;
  v107 = v52;
  v108 = self;
  v55 = v52;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v51, v54, v106, v50, 0.0);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "view"));
  objc_msgSend(v57, "setHidden:", 0);

  v58 = dispatch_time(0, 0);
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_100067EF0;
  v105[3] = &unk_1001B2538;
  v105[4] = self;
  dispatch_after(v58, (dispatch_queue_t)&_dispatch_main_q, v105);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "view"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "snapshotViewAfterScreenUpdates:", 1));

  objc_msgSend(v94, "addSubview:", v61);
  objc_msgSend(v61, "frame");
  v63 = v62;
  v65 = v64;
  v67 = v66;
  v69 = v68;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator listViewController](self, "listViewController"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "view"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "superview"));
  objc_msgSend(v94, "convertRect:fromView:", v72, v63, v65, v67, v69);
  v74 = v73;
  v76 = v75;
  v78 = v77;
  v80 = v79;

  objc_msgSend(v61, "setFrame:", v74, v76, v78, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  objc_msgSend(v81, "frameOfListView");
  MinY = CGRectGetMinY(v118);
  v83 = (void *)objc_claimAutoreleasedReturnValue(-[CompactMonthListAnimator monthViewController](self, "monthViewController"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "view"));
  objc_msgSend(v84, "frame");
  v85 = MinY / CGRectGetHeight(v119);

  objc_msgSend(v61, "frame");
  Height = CGRectGetHeight(v120);
  CATransform3DMakeTranslation(&a, 0.0, Height * 0.5, 0.0);
  CATransform3DMakeScale(&b, 1.0, v85, 1.0);
  CATransform3DConcat(&v104, &a, &b);
  v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "layer"));
  v101 = v104;
  objc_msgSend(v87, "setTransform:", &v101);

  v88 = springAnimationDuration(objc_msgSend(v61, "setAlpha:", 0.0));
  v89 = (void *)objc_claimAutoreleasedReturnValue(+[SpringFactory sharedFactory](SpringFactory, "sharedFactory"));
  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472;
  v99[2] = sub_100067FE8;
  v99[3] = &unk_1001B2538;
  v90 = v61;
  v100 = v90;
  v91 = navigationAnimationsPreferringFRR(v99);
  v92 = (void *)objc_claimAutoreleasedReturnValue(v91);
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_10006805C;
  v97[3] = &unk_1001B2F58;
  v97[4] = self;
  v98 = v90;
  v93 = v90;
  +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393216, v89, v92, v97, v88, 0.0);

}

@end
