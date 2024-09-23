@implementation MFTransferSplitViewPresentationAnimationController

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
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
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  id v40;
  double v41;
  double v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[4];
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;

  v4 = a3;
  v63 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey, v5));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "rootViewController"));
  v62 = v6;
  v60 = (void *)objc_opt_new(UISlidingBarConfiguration);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v60, "setBorderColor:", v7);

  objc_msgSend(v5, "setConfiguration:", v60);
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));
  objc_msgSend(v59, "addSubview:", v8);

  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllerForColumn:", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "view"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "snapshotViewAfterScreenUpdates:", 0));

  v57 = (void *)v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllerForColumn:", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "view"));

  v67 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "superview"));
  objc_msgSend(v13, "insertSubview:below:", v10, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "superview"));
  objc_msgSend(v14, "setClipsToBounds:", 1);

  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "viewControllerForColumn:", 1));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "view"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "snapshotViewAfterScreenUpdates:", 0));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "viewControllerForColumn:", 1));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "view"));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));
  objc_msgSend(v18, "insertSubview:below:", v66, v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "superview"));
  objc_msgSend(v19, "setClipsToBounds:", 1);

  v20 = objc_msgSend(v59, "_shouldReverseLayoutDirection");
  sub_1001B61F0(v17, v20 ^ 1);
  objc_msgSend(v12, "frame");
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v17, "frame");
  v64 = v30;
  v65 = v29;
  v32 = v31;
  v34 = v33;
  v35 = -v26;
  if (v20)
    v35 = v26;
  objc_msgSend(v12, "setFrame:", v22 + v35, v24, v26, v28);
  v36 = v26 + v34;
  if (!v20)
    v36 = -(v26 + v34);
  objc_msgSend(v17, "setFrame:", v32 + v36, v65, v34, v64);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "messageDetailNavController"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "view"));
  objc_msgSend(v38, "setAlpha:", 0.0);
  v39 = v22;

  v40 = objc_alloc((Class)UIViewPropertyAnimator);
  -[MFTransferSplitViewPresentationAnimationController transitionDuration:](self, "transitionDuration:", v4);
  v42 = v41;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_1001B6374;
  v80[3] = &unk_100522DD8;
  v55 = v67;
  v81 = v55;
  v83 = v39;
  v84 = v24;
  v85 = v26;
  v86 = v28;
  v43 = v17;
  v82 = v43;
  v87 = v32;
  v88 = v65;
  v89 = v34;
  v90 = v64;
  v44 = objc_msgSend(v40, "initWithDuration:dampingRatio:animations:", v80, v42, 1.0);
  v45 = objc_alloc((Class)UIViewPropertyAnimator);
  v78[0] = _NSConcreteStackBlock;
  v78[1] = 3221225472;
  v78[2] = sub_1001B63AC;
  v78[3] = &unk_10051AA98;
  v46 = v43;
  v79 = v46;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_1001B63FC;
  v76[3] = &unk_100522E00;
  v47 = objc_msgSend(v45, "initWithDuration:curve:animations:", 2, v78, 0.2);
  v77 = v47;
  objc_msgSend(v44, "addCompletion:", v76);
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1001B6404;
  v68[3] = &unk_100522E28;
  v48 = v57;
  v69 = v48;
  v49 = v66;
  v70 = v49;
  v50 = v46;
  v71 = v50;
  v51 = v62;
  v72 = v51;
  v52 = v60;
  v73 = v52;
  v53 = v5;
  v74 = v53;
  v54 = v63;
  v75 = v54;
  objc_msgSend(v47, "addCompletion:", v68);
  objc_msgSend(v44, "startAnimation");

}

@end
