@implementation _UIPreviewInteractionCrossBlurViewControllerTransition

- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (-[_UIPreviewInteractionCrossBlurViewControllerTransition isDismissTransition](self, "isDismissTransition"))
    -[_UIPreviewInteractionCrossBlurViewControllerTransition prepareDisappearanceTransitionFromView:toView:containerView:](self, "prepareDisappearanceTransitionFromView:toView:containerView:", v10, v9, v8);
  else
    -[_UIPreviewInteractionCrossBlurViewControllerTransition prepareAppearanceTransitionFromView:toView:containerView:](self, "prepareAppearanceTransitionFromView:toView:containerView:", v10, v9, v8);

}

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  if (-[_UIPreviewInteractionCrossBlurViewControllerTransition isDismissTransition](self, "isDismissTransition"))
    -[_UIPreviewInteractionCrossBlurViewControllerTransition performDisappearanceTransitionFromView:toView:containerView:](self, "performDisappearanceTransitionFromView:toView:containerView:", v10, v9, v8);
  else
    -[_UIPreviewInteractionCrossBlurViewControllerTransition performAppearanceTransitionFromView:toView:containerView:](self, "performAppearanceTransitionFromView:toView:containerView:", v10, v9, v8);

}

- (void)prepareAppearanceTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double Height;
  double MidX;
  CGFloat v27;
  double MidY;
  CGFloat v29;
  id v30;
  CGFloat v31;
  CGFloat rect_8;
  __int128 v33;
  double sx;
  CGAffineTransform v35;
  CGAffineTransform v36;
  CGAffineTransform v37;
  CGAffineTransform v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "frame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  rect_8 = v23;

  v39.origin.x = v18;
  v39.origin.y = v20;
  v39.size.width = v22;
  v39.size.height = v24;
  Height = CGRectGetHeight(v39);
  v40.origin.x = v10;
  v40.origin.y = v12;
  v31 = v14;
  v40.size.width = v14;
  v40.size.height = v16;
  sx = Height / CGRectGetHeight(v40);
  v33 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v37.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v37.c = v33;
  *(_OWORD *)&v37.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v41.origin.x = v18;
  v41.origin.y = v20;
  v41.size.width = v22;
  v41.size.height = rect_8;
  MidX = CGRectGetMidX(v41);
  v42.origin.x = v10;
  v42.origin.y = v12;
  v42.size.width = v14;
  v42.size.height = v16;
  v27 = MidX - CGRectGetMidX(v42);
  v43.origin.x = v18;
  v43.origin.y = v20;
  v43.size.width = v22;
  v43.size.height = rect_8;
  MidY = CGRectGetMidY(v43);
  v44.origin.x = v10;
  v44.origin.y = v12;
  v44.size.width = v31;
  v44.size.height = v16;
  v29 = CGRectGetMidY(v44);
  *(_OWORD *)&v38.a = *(_OWORD *)&v37.a;
  *(_OWORD *)&v38.c = v33;
  *(_OWORD *)&v38.tx = *(_OWORD *)&v37.tx;
  CGAffineTransformTranslate(&v37, &v38, v27, MidY - v29);
  v36 = v37;
  CGAffineTransformScale(&v38, &v36, sx, sx);
  v37 = v38;
  v45.origin.x = v10;
  v45.origin.y = v12;
  v45.size.width = v31;
  v45.size.height = v16;
  self->_initialPlatterRect = CGRectApplyAffineTransform(v45, &v37);
  self->_finalPlatterRect.origin.x = v10;
  self->_finalPlatterRect.origin.y = v12;
  self->_finalPlatterRect.size.width = v31;
  self->_finalPlatterRect.size.height = v16;
  v35 = v38;
  objc_msgSend(v7, "setTransform:", &v35);
  v30 = v7;
  objc_msgSend(v30, "setBlurRadius:", 128.0);
  objc_msgSend(v30, "setDropShadowEnabled:", 0);
  objc_msgSend(v30, "setAlpha:", 0.0);

}

- (void)performAppearanceTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v7;
  id v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double MidX;
  CGFloat v18;
  double MidY;
  CGFloat v20;
  double Width;
  CGFloat v22;
  double Height;
  CGFloat v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _OWORD v32[3];
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGAffineTransform v35;
  CGAffineTransform v36;
  _QWORD v37[2];
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  v37[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v31 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v36.a = *MEMORY[0x1E0C9BAA8];
  v30 = *(_OWORD *)&v36.a;
  *(_OWORD *)&v36.c = v31;
  *(_OWORD *)&v36.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v29 = *(_OWORD *)&v36.tx;
  MidX = CGRectGetMidX(self->_finalPlatterRect);
  v38.origin.x = v10;
  v38.origin.y = v12;
  v38.size.width = v14;
  v38.size.height = v16;
  v18 = MidX - CGRectGetMidX(v38);
  MidY = CGRectGetMidY(self->_finalPlatterRect);
  v39.origin.x = v10;
  v39.origin.y = v12;
  v39.size.width = v14;
  v39.size.height = v16;
  v20 = CGRectGetMidY(v39);
  *(_OWORD *)&v35.a = *(_OWORD *)&v36.a;
  *(_OWORD *)&v35.c = v31;
  *(_OWORD *)&v35.tx = *(_OWORD *)&v36.tx;
  CGAffineTransformTranslate(&v36, &v35, v18, MidY - v20);
  Width = CGRectGetWidth(self->_finalPlatterRect);
  v40.origin.x = v10;
  v40.origin.y = v12;
  v40.size.width = v14;
  v40.size.height = v16;
  v22 = Width / CGRectGetWidth(v40);
  Height = CGRectGetHeight(self->_finalPlatterRect);
  v41.origin.x = v10;
  v41.origin.y = v12;
  v41.size.width = v14;
  v41.size.height = v16;
  v24 = CGRectGetHeight(v41);
  v34 = v36;
  CGAffineTransformScale(&v35, &v34, v22, Height / v24);
  *(_OWORD *)&v36.c = *(_OWORD *)&v35.c;
  *(_OWORD *)&v36.tx = *(_OWORD *)&v35.tx;
  *(_OWORD *)&v36.a = *(_OWORD *)&v35.a;
  v34 = v35;
  CGAffineTransformScale(&v35, &v34, 1.2, 1.0);
  *(_OWORD *)&v36.tx = *(_OWORD *)&v35.tx;
  v33 = v35;
  objc_msgSend(v7, "setTransform:", &v33);
  objc_msgSend(v7, "setAlpha:", 0.0);
  v25 = v7;
  +[UIBlurEffect effectWithBlurRadius:](UIBlurEffect, "effectWithBlurRadius:", 4.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setContentEffects:", v27);

  v32[0] = v30;
  v32[1] = v31;
  v32[2] = v29;
  v28 = v8;
  objc_msgSend(v28, "setTransform:", v32);
  objc_msgSend(v28, "setAlpha:", 1.0);
  objc_msgSend(v28, "setBlurRadius:", 0.0);
  objc_msgSend(v28, "setDropShadowEnabled:", 1);

}

- (void)performDisappearanceTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v6;
  id v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidY;
  CGFloat v21;
  double tx;
  double txa;
  double sx;
  double sxa;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;
  CGAffineTransform v32;
  _OWORD v33[2];
  __int128 v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v6 = a4;
  v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v33[0] = *MEMORY[0x1E0C9BAA8];
  v27 = v33[0];
  v33[1] = v28;
  v34 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v26 = v34;
  v7 = a3;
  objc_msgSend(v6, "setTransform:", v33);
  objc_msgSend(v6, "setAlpha:", 1.0);
  objc_msgSend(v6, "setContentEffects:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "frame");
  x = v35.origin.x;
  y = v35.origin.y;
  width = v35.size.width;
  height = v35.size.height;
  sx = CGRectGetHeight(v35);
  v36.origin.x = v9;
  v36.origin.y = v11;
  v36.size.width = v13;
  v36.size.height = v15;
  *(_OWORD *)&v32.a = v27;
  *(_OWORD *)&v32.c = v28;
  *(_OWORD *)&v32.tx = v26;
  sxa = sx / CGRectGetHeight(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  tx = CGRectGetMidX(v37);
  v38.origin.x = v9;
  v38.origin.y = v11;
  v38.size.width = v13;
  v38.size.height = v15;
  txa = tx - CGRectGetMidX(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  MidY = CGRectGetMidY(v39);
  v40.origin.x = v9;
  v40.origin.y = v11;
  v40.size.width = v13;
  v40.size.height = v15;
  v21 = CGRectGetMidY(v40);
  *(_OWORD *)&v31.a = v27;
  *(_OWORD *)&v31.c = v28;
  *(_OWORD *)&v31.tx = v26;
  CGAffineTransformTranslate(&v32, &v31, txa, MidY - v21);
  v30 = v32;
  CGAffineTransformScale(&v31, &v30, sxa, sxa);
  *(_OWORD *)&v32.tx = *(_OWORD *)&v31.tx;
  v29 = v31;
  objc_msgSend(v7, "setTransform:", &v29);
  objc_msgSend(v7, "setAlpha:", 0.0);

}

- (BOOL)isDismissTransition
{
  return self->_dismissTransition;
}

- (void)setDismissTransition:(BOOL)a3
{
  self->_dismissTransition = a3;
}

@end
