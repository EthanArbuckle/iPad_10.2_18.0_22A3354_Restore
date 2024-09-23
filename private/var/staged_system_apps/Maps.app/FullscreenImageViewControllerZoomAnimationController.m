@implementation FullscreenImageViewControllerZoomAnimationController

- (FullscreenImageViewControllerZoomAnimationController)initWithOriginalImageView:(id)a3
{
  id v5;
  FullscreenImageViewControllerZoomAnimationController *v6;
  FullscreenImageViewControllerZoomAnimationController *v7;
  FullscreenImageViewControllerZoomAnimationController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FullscreenImageViewControllerZoomAnimationController;
  v6 = -[FullscreenImageViewControllerZoomAnimationController init](&v10, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalImageView, a3);
    v8 = v7;
  }

  return v7;
}

- (double)transitionDuration:(id)a3
{
  return 0.200000003;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  id v65;
  double v66;
  double v67;
  double v68;
  _QWORD v69[5];
  id v70;
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  CGRect v81;
  CGRect v82;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextFromViewControllerKey));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewControllerForKey:", UITransitionContextToViewControllerKey));
  v7 = objc_msgSend(v6, "isBeingPresented");
  if (v7)
    v8 = v6;
  else
    v8 = v5;
  v9 = v8;
  v10 = objc_opt_class(FullscreenImageViewController);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "contentView"));
    objc_msgSend(v11, "setAlpha:", 0.0);

    -[UIImageView setAlpha:](self->_originalImageView, "setAlpha:", 0.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    if (v7)
      objc_msgSend(v12, "addSubview:", v13);
    else
      objc_msgSend(v12, "sendSubviewToBack:", v13);

    v14 = objc_alloc((Class)UIImageView);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_originalImageView, "image"));
    v16 = objc_msgSend(v14, "initWithImage:", v15);

    objc_msgSend(v16, "setContentMode:", -[UIImageView contentMode](self->_originalImageView, "contentMode"));
    objc_msgSend(v16, "setClipsToBounds:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
    objc_msgSend(v17, "addSubview:", v16);

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
    -[UIImageView bounds](self->_originalImageView, "bounds");
    objc_msgSend(v18, "convertRect:fromView:", self->_originalImageView);
    v20 = v19;
    v66 = v22;
    v67 = v21;
    v68 = v23;

    if (v7)
    {
      objc_msgSend(v4, "finalFrameForViewController:", v6);
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v31 = v30;
    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containerView"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
      objc_msgSend(v33, "bounds");
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentView"));
      objc_msgSend(v32, "convertRect:fromView:", v42, v35, v37, v39, v41);
      v25 = v43;
      v27 = v44;
      v29 = v45;
      v31 = v46;

    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_originalImageView, "image"));
    objc_msgSend(v47, "size");
    v49 = v29 / v48;

    v50 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_originalImageView, "image"));
    objc_msgSend(v50, "size");
    v52 = v31 / v51;

    if (v49 >= v52)
      v49 = v52;
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_originalImageView, "image"));
    objc_msgSend(v53, "size");
    v55 = v49 * v54;
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_originalImageView, "image"));
    objc_msgSend(v56, "size");
    v58 = v49 * v57;

    v81.origin.x = v25;
    v81.origin.y = v27;
    v81.size.width = v29;
    v81.size.height = v31;
    v59 = CGRectGetMidX(v81) - v55 * 0.5;
    v82.origin.x = v25;
    v82.origin.y = v27;
    v82.size.width = v29;
    v82.size.height = v31;
    v60 = CGRectGetMidY(v82) - v58 * 0.5;
    if (v7)
    {
      objc_msgSend(v16, "setFrame:", v20, v67, v66, v68);
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
      objc_msgSend(v61, "setAlpha:", 0.0);

      v62 = 1.0;
    }
    else
    {
      objc_msgSend(v16, "setFrame:", v59, v60, v55, v58);
      v62 = 0.0;
      v58 = v68;
      v55 = v66;
      v60 = v67;
      v59 = v20;
    }
    -[FullscreenImageViewControllerZoomAnimationController transitionDuration:](self, "transitionDuration:", v4);
    v64 = v63;
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_100541060;
    v73[3] = &unk_1011BABB0;
    v74 = v9;
    v76 = v62;
    v75 = v16;
    v77 = v59;
    v78 = v60;
    v79 = v55;
    v80 = v58;
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1005410B0;
    v69[3] = &unk_1011BABD8;
    v69[4] = self;
    v70 = v74;
    v71 = v75;
    v72 = v4;
    v65 = v75;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v73, v69, v64, 0.0);

  }
  else
  {
    objc_msgSend(v4, "completeTransition:", 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalImageView, 0);
}

@end
