@implementation TabSelectionPresentationAnimationController

- (TabSelectionPresentationAnimationController)initWithSourceView:(id)a3
{
  id v5;
  TabSelectionPresentationAnimationController *v6;
  TabSelectionPresentationAnimationController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TabSelectionPresentationAnimationController;
  v6 = -[TabSelectionPresentationAnimationController init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sourceView, a3);

  return v7;
}

- (void)animateTransition:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double x;
  double v15;
  double y;
  double v17;
  double width;
  double v19;
  double height;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  __int128 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  double v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _OWORD v79[8];
  _OWORD v80[8];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  CGRect v97;
  CGRect v98;

  v4 = a3;
  -[TabSelectionPresentationAnimationController transitionDuration:](self, "transitionDuration:", v4);
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewForKey:", UITransitionContextToViewKey));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TabSelectionPresentationAnimationController sourceView](self, "sourceView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "window"));
  v12 = objc_claimAutoreleasedReturnValue(-[TabSelectionPresentationAnimationController sourceView](self, "sourceView"));
  objc_msgSend((id)v12, "frame");
  objc_msgSend(v11, "convertRect:toView:", v9);
  x = v13;
  y = v15;
  width = v17;
  height = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TabSelectionPresentationAnimationController sourceView](self, "sourceView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "superview"));
  v23 = objc_opt_class(UIScrollView);
  LOBYTE(v12) = objc_opt_isKindOfClass(v22, v23);

  if ((v12 & 1) != 0)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TabSelectionPresentationAnimationController sourceView](self, "sourceView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "superview"));

    objc_msgSend(v25, "contentOffset");
    v27 = -v26;
    v29 = -v28;
    v97.origin.x = x;
    v97.origin.y = y;
    v97.size.width = width;
    v97.size.height = height;
    v98 = CGRectOffset(v97, v27, v29);
    x = v98.origin.x;
    y = v98.origin.y;
    width = v98.size.width;
    height = v98.size.height;

  }
  *(_QWORD *)&v30 = -1;
  *((_QWORD *)&v30 + 1) = -1;
  v95 = v30;
  v96 = v30;
  v93 = v30;
  v94 = v30;
  v91 = v30;
  v92 = v30;
  v89 = v30;
  v90 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[TabSelectionPresentationAnimationController sourceView](self, "sourceView"));
  v32 = v31;
  if (v31)
  {
    objc_msgSend(v31, "transform3D");
  }
  else
  {
    v95 = 0u;
    v96 = 0u;
    v93 = 0u;
    v94 = 0u;
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TabSelectionPresentationAnimationController sourceView](self, "sourceView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "layer"));
  v61 = v6;
  objc_msgSend(v34, "anchorPoint");
  v36 = v35;
  v38 = v37;

  objc_msgSend(v4, "finalFrameForViewController:", v8);
  v59 = v40;
  v60 = v39;
  v42 = v41;
  v44 = v43;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[TabSelectionPresentationAnimationController sourceView](self, "sourceView"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "superview"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "layer"));
  v48 = v47;
  if (v47)
  {
    objc_msgSend(v47, "sublayerTransform");
  }
  else
  {
    v87 = 0u;
    v88 = 0u;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "layer"));
  v80[4] = v85;
  v80[5] = v86;
  v80[6] = v87;
  v80[7] = v88;
  v80[0] = v81;
  v80[1] = v82;
  v80[2] = v83;
  v80[3] = v84;
  objc_msgSend(v49, "setSublayerTransform:", v80);

  objc_msgSend(v9, "addSubview:", v7);
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[TabSelectionPresentationAnimationController sourceView](self, "sourceView"));
  objc_msgSend(v50, "setHidden:", 1);

  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v51, "setAnchorPoint:", v36, v38);

  v79[4] = v93;
  v79[5] = v94;
  v79[6] = v95;
  v79[7] = v96;
  v79[0] = v89;
  v79[1] = v90;
  v79[2] = v91;
  v79[3] = v92;
  objc_msgSend(v7, "setTransform3D:", v79);
  objc_msgSend(v7, "setFrame:", x, y, width, height);
  objc_msgSend(v7, "layoutIfNeeded");
  v65[0] = _NSConcreteStackBlock;
  v65[1] = 3221225472;
  v65[2] = sub_1001DD744;
  v65[3] = &unk_100523998;
  v52 = v7;
  v66 = v52;
  v67 = v60;
  v68 = v42;
  v69 = v44;
  v70 = v59;
  v53 = *(_OWORD *)&CATransform3DIdentity.m33;
  v75 = *(_OWORD *)&CATransform3DIdentity.m31;
  v76 = v53;
  v54 = *(_OWORD *)&CATransform3DIdentity.m43;
  v77 = *(_OWORD *)&CATransform3DIdentity.m41;
  v78 = v54;
  v55 = *(_OWORD *)&CATransform3DIdentity.m13;
  v71 = *(_OWORD *)&CATransform3DIdentity.m11;
  v72 = v55;
  v56 = *(_OWORD *)&CATransform3DIdentity.m23;
  v73 = *(_OWORD *)&CATransform3DIdentity.m21;
  v74 = v56;
  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1001DD7BC;
  v62[3] = &unk_10051D8F8;
  v57 = v4;
  v63 = v57;
  v58 = v8;
  v64 = v58;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v65, v62, v61, 0.0);

}

- (double)transitionDuration:(id)a3
{
  return 0.22;
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  objc_storeStrong((id *)&self->_sourceView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end
