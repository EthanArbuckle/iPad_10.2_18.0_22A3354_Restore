@implementation _UIContextMenuDismissToWindowSceneActivationAnimation

+ (id)animationWithUIController:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setMenuUIController:", v3);

  return v4;
}

- (void)animateAlongsideScenePlatter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v40;
  double MinY;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  double v56;
  double v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  _QWORD v62[4];
  id v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v4 = a3;
  -[_UIContextMenuDismissToWindowSceneActivationAnimation menuUIController](self, "menuUIController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "platterContainerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);

  -[_UIContextMenuDismissToWindowSceneActivationAnimation menuUIController](self, "menuUIController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentPlatterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIContextMenuDismissToWindowSceneActivationAnimation menuUIController](self, "menuUIController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "menuView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v67[0] = MEMORY[0x1E0C809B0];
    v67[1] = 3221225472;
    v67[2] = __86___UIContextMenuDismissToWindowSceneActivationAnimation_animateAlongsideScenePlatter___block_invoke;
    v67[3] = &unk_1E16B1B28;
    v12 = v8;
    v68 = v12;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v67);
    objc_msgSend(v4, "_velocityForKey:", CFSTR("position"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v10, "_setVelocity:forKey:", v13, CFSTR("position"));
    v66 = 0;
    v64 = 0u;
    v65 = 0u;
    -[_UIContextMenuDismissToWindowSceneActivationAnimation menuUIController](self, "menuUIController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "anchor");
    }
    else
    {
      v66 = 0;
      v64 = 0u;
      v65 = 0u;
    }

    objc_msgSend(v10, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
    objc_msgSend(v4, "superview");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "convertRect:fromView:", v26, v19, v21, v23, v25);
    v60 = v28;
    v61 = v27;
    v58 = v30;
    v59 = v29;

    v31 = v64 - 1;
    v32 = 0.5;
    v33 = 0.5;
    if ((unint64_t)(v64 - 1) <= 7)
    {
      v32 = dbl_186681430[v31];
      v33 = dbl_186681470[v31];
    }
    switch(*((_QWORD *)&v64 + 1))
    {
      case 1:
        v32 = 0.0;
        break;
      case 2:
        v33 = 0.0;
        break;
      case 4:
        v32 = 1.0;
        break;
      case 8:
        v33 = 1.0;
        break;
      default:
        break;
    }
    v56 = v33;
    v57 = v32;
    v34 = v32;
    objc_msgSend(v12, "frame");
    x = v69.origin.x;
    y = v69.origin.y;
    width = v69.size.width;
    height = v69.size.height;
    MinX = CGRectGetMinX(v69);
    v70.origin.x = x;
    v70.origin.y = y;
    v70.size.width = width;
    v70.size.height = height;
    v40 = MinX + v33 * CGRectGetWidth(v70);
    v71.origin.x = x;
    v71.origin.y = y;
    v71.size.width = width;
    v71.size.height = height;
    MinY = CGRectGetMinY(v71);
    v72.origin.x = x;
    v72.origin.y = y;
    v72.size.width = width;
    v72.size.height = height;
    v42 = MinY + v34 * CGRectGetHeight(v72);
    objc_msgSend(v10, "center");
    v44 = v43 - v40;
    objc_msgSend(v10, "center");
    v46 = v45 - v42;
    v73.origin.x = v61;
    v73.origin.y = v60;
    v73.size.width = v59;
    v73.size.height = v58;
    v47 = CGRectGetMinX(v73);
    v74.origin.x = v61;
    v74.origin.y = v60;
    v74.size.width = v59;
    v74.size.height = v58;
    v48 = v44 + v47 + v56 * CGRectGetWidth(v74);
    v75.origin.x = v61;
    v75.origin.y = v60;
    v75.size.width = v59;
    v75.size.height = v58;
    v49 = CGRectGetMinY(v75);
    v76.origin.x = v61;
    v76.origin.y = v60;
    v76.size.width = v59;
    v76.size.height = v58;
    objc_msgSend(v10, "setCenter:", v48, v46 + v49 + v57 * CGRectGetHeight(v76));

  }
  +[_UIWindowSceneActivationSettingsDomain rootSettings](_UIWindowSceneActivationSettingsDomain, "rootSettings");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "morphMenuDismissal");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "springAnimationBehavior");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v11;
  v62[1] = 3221225472;
  v62[2] = __86___UIContextMenuDismissToWindowSceneActivationAnimation_animateAlongsideScenePlatter___block_invoke_2;
  v62[3] = &unk_1E16B1B28;
  v63 = v10;
  v53 = v10;
  +[UIView _animateUsingSpringBehavior:tracking:animations:completion:](UIView, "_animateUsingSpringBehavior:tracking:animations:completion:", v52, 0, v62, 0);

  -[_UIContextMenuDismissToWindowSceneActivationAnimation menuUIController](self, "menuUIController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "backgroundEffectView");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setAlpha:", 0.0);

}

- (_UIContextMenuUIController)menuUIController
{
  return self->_menuUIController;
}

- (void)setMenuUIController:(id)a3
{
  objc_storeStrong((id *)&self->_menuUIController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuUIController, 0);
}

@end
