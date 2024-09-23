@implementation MFTransferSplitViewDismissalAnimationController

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  double v39;
  id v40;
  id v41;
  id v42;
  id v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  double v62;
  uint64_t v63;
  double v64;
  uint64_t v65;
  double v66;
  uint64_t v67;
  double v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;

  v4 = a3;
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "view"));
  objc_msgSend(v5, "addSubview:", v6);

  objc_msgSend(v4, "finalFrameForViewController:", v52);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "viewControllerForColumn:", 0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "view"));

  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "snapshotViewAfterScreenUpdates:", 0));
  objc_msgSend(v5, "addSubview:");
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "viewControllerForColumn:", 1));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "view"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "snapshotViewAfterScreenUpdates:", 0));
  objc_msgSend(v5, "addSubview:", v19);
  v20 = objc_msgSend(v5, "_shouldReverseLayoutDirection");
  sub_1001B61F0(v19, v20 ^ 1);
  objc_msgSend(v16, "bounds");
  objc_msgSend(v16, "convertRect:toView:", v5);
  v22 = v21;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  objc_msgSend(v53, "setFrame:");
  v45 = v28;
  v46 = v24;
  v47 = v14;
  v48 = v12;
  v49 = v10;
  v50 = v8;
  objc_msgSend(v18, "bounds");
  objc_msgSend(v18, "convertRect:toView:", v5);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  objc_msgSend(v19, "setFrame:");
  if (v20)
    v37 = v26;
  else
    v37 = -v26;
  if (v20)
    v38 = v26 + v34;
  else
    v38 = -(v26 + v34);
  objc_msgSend(v16, "setAlpha:", 0.0);
  objc_msgSend(v18, "setAlpha:", 0.0);
  -[MFTransferSplitViewDismissalAnimationController transitionDuration:](self, "transitionDuration:", v4);
  v44 = v39;
  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472;
  v58[2] = sub_1001B6978;
  v58[3] = &unk_100522E50;
  v59 = v53;
  v62 = v22 + v37;
  v63 = v46;
  v64 = v26;
  v65 = v45;
  v60 = v19;
  v66 = v30 + v38;
  v67 = v32;
  v68 = v34;
  v69 = v36;
  v40 = v52;
  v61 = v40;
  v70 = v50;
  v71 = v49;
  v72 = v48;
  v73 = v47;
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1001B6A10;
  v54[3] = &unk_10051D830;
  v41 = v59;
  v55 = v41;
  v42 = v60;
  v56 = v42;
  v43 = v4;
  v57 = v43;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v58, v54, v44, 0.0, 1.0, 0.0);

}

@end
