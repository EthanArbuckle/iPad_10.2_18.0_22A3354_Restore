@implementation UIAlertControllerVisualStyleActionSheetInline

+ (int64_t)interfaceActionPresentationStyle
{
  return 2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _BOOL4 v5;
  int v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIAlertControllerVisualStyleActionSheetInline;
  if (-[UIAlertControllerVisualStyle isEqual:](&v8, sel_isEqual_, v4))
  {
    v5 = -[UIAlertControllerVisualStyleActionSheetInline actionsReversed](self, "actionsReversed");
    v6 = v5 ^ objc_msgSend(v4, "actionsReversed") ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIAlertControllerVisualStyleActionSheetInline;
  v4 = -[UIAlertControllerVisualStyle copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setActionsReversed:", -[UIAlertControllerVisualStyleActionSheetInline actionsReversed](self, "actionsReversed"));
  return v4;
}

- (double)_actionDescriptiveTextFontSize
{
  void *v2;
  void *v3;
  double v4;

  -[UIAlertControllerVisualStyle traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = 15.0;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UICTContentSizeCategoryXS")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("UICTContentSizeCategoryS")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("UICTContentSizeCategoryM")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("UICTContentSizeCategoryL")) & 1) == 0)
  {
    v4 = 16.0;
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UICTContentSizeCategoryXL")) & 1) == 0)
    {
      if (objc_msgSend(v3, "isEqualToString:", CFSTR("UICTContentSizeCategoryXXL")))
        v4 = 17.0;
      else
        v4 = 18.0;
    }
  }

  return v4;
}

- (BOOL)shouldOccludeDuringPresentation
{
  return 0;
}

- (BOOL)shouldPreserveRespondersAcrossWindows
{
  return 1;
}

- (CGRect)_sourceRectForAlertController:(id)a3 inContainerView:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
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
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGRect result;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "presentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sourceRect");
    +[UIForcePresentationHelper sourceRectForView:proposedSourceRect:](UIForcePresentationHelper, "sourceRectForView:proposedSourceRect:", v8);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

    objc_msgSend(v6, "convertRect:fromView:", v8, v11, v13, v15, v17);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
  }
  else
  {
    objc_msgSend(v6, "bounds");
    v19 = v27 + v26 * 0.5;
    v21 = v29 + v28 * 0.5;
    v23 = 0.0;
    v25 = 0.0;
  }

  v30 = v19;
  v31 = v21;
  v32 = v23;
  v33 = v25;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (void)animateRevealOfAlertControllerView:(id)a3 alertController:(id)a4 inContainerView:(id)a5 duration:(double)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  UIAlertControllerVisualStyleActionSheetInline *v34;
  id v35;
  _QWORD v36[4];
  id v37;
  UIAlertControllerVisualStyleActionSheetInline *v38;
  id v39;

  v11 = a4;
  v12 = a7;
  v13 = a5;
  objc_msgSend(v11, "presentationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sourceView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertControllerVisualStyleActionSheetInline _sourceRectForAlertController:inContainerView:](self, "_sourceRectForAlertController:inContainerView:", v11, v13);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v14, "sourceRect");
  +[UIForcePresentationHelper snapshotViewForSourceView:sourceRect:](UIForcePresentationHelper, "snapshotViewForSourceView:sourceRect:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);
  -[UIAlertControllerVisualStyleActionSheetInline headerView](self, "headerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "insertSubview:belowSubview:", v24, v25);

  -[UIAlertControllerVisualStyleActionSheetInline setSourceViewSnapshot:](self, "setSourceViewSnapshot:", v24);
  objc_msgSend(v11, "_setEffectAlpha:", 0.0);
  -[UIAlertControllerVisualStyleActionSheetInline headerView](self, "headerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAlpha:", 0.0);

  -[UIAlertControllerVisualStyleActionSheetInline revealEffectView](self, "revealEffectView");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "_setEffect:", 0);

  v28 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __141__UIAlertControllerVisualStyleActionSheetInline_animateRevealOfAlertControllerView_alertController_inContainerView_duration_completionBlock___block_invoke;
  v36[3] = &unk_1E16B47A8;
  v37 = v24;
  v38 = self;
  v39 = v11;
  v32[0] = v28;
  v32[1] = 3221225472;
  v32[2] = __141__UIAlertControllerVisualStyleActionSheetInline_animateRevealOfAlertControllerView_alertController_inContainerView_duration_completionBlock___block_invoke_2;
  v32[3] = &unk_1E16C9138;
  v33 = v39;
  v34 = self;
  v35 = v12;
  v29 = v12;
  v30 = v39;
  v31 = v24;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v36, v32, a6, 0.0);

}

void __141__UIAlertControllerVisualStyleActionSheetInline_animateRevealOfAlertControllerView_alertController_inContainerView_duration_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  +[UIForcePresentationHelper applyPhase:toSnapshotView:](UIForcePresentationHelper, "applyPhase:toSnapshotView:", 1, *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "revealEffectView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIForcePresentationHelper visualEffectForPresentationPhase:traitCollection:variant:](UIForcePresentationHelper, "visualEffectForPresentationPhase:traitCollection:variant:", 1, v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setEffect:", v3);

}

uint64_t __141__UIAlertControllerVisualStyleActionSheetInline_animateRevealOfAlertControllerView_alertController_inContainerView_duration_completionBlock___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_setEffectAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)animateAlertControllerView:(id)a3 ofAlertController:(id)a4 forPresentation:(BOOL)a5 inContainerView:(id)a6 descendantOfContainerView:(id)a7 duration:(double)a8 completionBlock:(id)a9
{
  _BOOL4 v11;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
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
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double Width;
  double v50;
  double Height;
  double v52;
  double v53;
  CGAffineTransform *v54;
  __int128 v55;
  __int128 v56;
  double MidY;
  CGFloat v58;
  void *v59;
  double v60;
  uint64_t v61;
  void *v62;
  id v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  double v69;
  id v70;
  double v71;
  double v72;
  double v73;
  id v74;
  id v75;
  id v76;
  double tx;
  double txa;
  CGFloat sx;
  CGFloat v80;
  CGFloat v81;
  id v82;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  CGFloat v92;
  UIAlertControllerVisualStyleActionSheetInline *v93;
  __int128 v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  id v98;
  _QWORD v99[5];
  id v100;
  _QWORD v101[4];
  id v102;
  id v103;
  double v104;
  _QWORD v105[4];
  id v106;
  double v107;
  _QWORD v108[5];
  id v109;
  id v110;
  BOOL v111;
  _QWORD v112[4];
  id v113;
  id v114;
  CGAffineTransform v115;
  BOOL v116;
  _QWORD aBlock[4];
  id v118;
  CGAffineTransform v119;
  CGAffineTransform v120;
  CGAffineTransform v121;
  CGAffineTransform v122;
  CGAffineTransform v123;
  CGAffineTransform v124;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v127;
  CGAffineTransform v128;
  CGRect v129;
  CGRect v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;

  v11 = a5;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v82 = a9;
  v96 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v97 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v128.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v128.c = v96;
  v94 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  *(_OWORD *)&v128.tx = v94;
  objc_msgSend(v15, "presentationController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "_presentationSourceRepresentationView");
  v18 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "sourceView");
  v19 = objc_claimAutoreleasedReturnValue();
  v86 = v17;
  objc_msgSend(v17, "sourceRect");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  -[UIAlertControllerVisualStyleActionSheetInline _sourceRectForAlertController:inContainerView:](self, "_sourceRectForAlertController:inContainerView:", v15, v16);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;
  -[UIAlertControllerVisualStyleActionSheetInline headerView](self, "headerView");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  objc_msgSend(v16, "convertRect:fromView:", v36);
  rect_24 = v38;
  v92 = v37;
  rect_8 = v40;
  rect_16 = v39;
  v93 = self;
  if (v11)
  {
    -[UIAlertControllerVisualStyleActionSheetInline sourceViewSnapshot](self, "sourceViewSnapshot");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v41)
    {
      +[UIForcePresentationHelper snapshotViewForSourceView:sourceRect:](UIForcePresentationHelper, "snapshotViewForSourceView:sourceRect:", v19, v21, v23, v25, v27);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setFrame:", v29, v31, v33, v35);
      -[UIAlertControllerVisualStyleActionSheetInline headerView](v93, "headerView");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "insertSubview:belowSubview:", v41, v42);

      -[UIAlertControllerVisualStyleActionSheetInline setSourceViewSnapshot:](v93, "setSourceViewSnapshot:", v41);
    }
    objc_msgSend(v41, "bounds");
    objc_msgSend(v16, "convertRect:fromView:", v41);
    v29 = v43;
    v31 = v44;
    v33 = v45;
    v35 = v46;
  }
  else
  {
    v41 = 0;
  }
  rect = v29;
  objc_msgSend(v14, "center");
  CGAffineTransformMakeTranslation(&v128, v33 * 0.5 + v29 - v47, v35 * 0.5 + v31 - v48);
  v129.origin.x = v29;
  v129.origin.y = v31;
  v129.size.width = v33;
  v129.size.height = v35;
  Width = CGRectGetWidth(v129);
  v130.origin.x = v92;
  v130.origin.y = rect_24;
  v130.size.width = rect_16;
  v130.size.height = rect_8;
  v50 = Width / CGRectGetWidth(v130);
  v131.origin.x = rect;
  v80 = v31;
  v131.origin.y = v31;
  v131.size.width = v33;
  v81 = v35;
  v131.size.height = v35;
  Height = CGRectGetHeight(v131);
  v132.origin.x = v92;
  v132.origin.y = rect_24;
  v132.size.width = rect_16;
  v132.size.height = rect_8;
  v52 = Height / CGRectGetHeight(v132);
  if (v50 < v52)
    v52 = v50;
  sx = v52;
  if (!v18)
    v52 = 0.5;
  CGAffineTransformMakeScale(&t1, v52, v52);
  t2 = v128;
  CGAffineTransformConcat(&v127, &t1, &t2);
  v128 = v127;
  if (v11)
  {
    v127 = v128;
    v53 = 0.0;
    v54 = (CGAffineTransform *)MEMORY[0x1E0C9BAA8];
  }
  else
  {
    *(_OWORD *)&v127.a = v97;
    *(_OWORD *)&v127.c = v96;
    v53 = 1.0;
    v54 = &v128;
    *(_OWORD *)&v127.tx = v94;
  }
  v55 = *(_OWORD *)&v54->a;
  v56 = *(_OWORD *)&v54->tx;
  *(_OWORD *)&t2.c = *(_OWORD *)&v54->c;
  *(_OWORD *)&t2.tx = v56;
  v124 = v127;
  *(_OWORD *)&t2.a = v55;
  objc_msgSend(v14, "setTransform:", &v124);
  objc_msgSend(v15, "_setEffectAlpha:", v53);
  *(_OWORD *)&v124.c = v96;
  *(_OWORD *)&v124.tx = v94;
  *(_OWORD *)&v123.a = v97;
  *(_OWORD *)&v123.c = v96;
  *(_OWORD *)&v123.tx = v94;
  *(_OWORD *)&v124.a = v97;
  v133.origin.x = rect;
  v133.origin.y = v80;
  v133.size.width = v33;
  v133.size.height = v81;
  tx = CGRectGetMidX(v133);
  v134.origin.x = v92;
  v134.origin.y = rect_24;
  v134.size.width = rect_16;
  v134.size.height = rect_8;
  txa = tx - CGRectGetMidX(v134);
  v135.origin.x = rect;
  v135.origin.y = v80;
  v135.size.width = v33;
  v135.size.height = v81;
  MidY = CGRectGetMidY(v135);
  v136.origin.x = v92;
  v136.origin.y = rect_24;
  v136.size.width = rect_16;
  v136.size.height = rect_8;
  v58 = CGRectGetMidY(v136);
  *(_OWORD *)&v122.a = v97;
  *(_OWORD *)&v122.c = v96;
  *(_OWORD *)&v122.tx = v94;
  CGAffineTransformTranslate(&v123, &v122, txa, MidY - v58);
  v121 = v123;
  CGAffineTransformScale(&v122, &v121, sx, sx);
  v123 = v122;
  v87 = v16;
  v84 = (void *)v19;
  v85 = (void *)v18;
  if (v11)
  {
    v120 = v123;
    objc_msgSend(v36, "setTransform:", &v120);
    objc_msgSend(v36, "setAlpha:", 0.0);
    objc_msgSend(v15, "traitCollection");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIForcePresentationHelper visualEffectForPresentationPhase:traitCollection:variant:](UIForcePresentationHelper, "visualEffectForPresentationPhase:traitCollection:variant:", 2, v59, 1);
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    v60 = 1.0;
  }
  else
  {
    v95 = 0;
    v124 = v123;
    v60 = 0.0;
  }
  v61 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke;
  aBlock[3] = &unk_1E16BF720;
  v98 = v14;
  v118 = v98;
  v119 = t2;
  v62 = _Block_copy(aBlock);
  v112[0] = v61;
  v112[1] = 3221225472;
  v112[2] = __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2;
  v112[3] = &unk_1E16EDA10;
  v63 = v36;
  v113 = v63;
  v115 = v124;
  v116 = v11;
  v64 = v41;
  v114 = v64;
  v65 = _Block_copy(v112);
  v108[0] = v61;
  v108[1] = 3221225472;
  v108[2] = __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3;
  v108[3] = &unk_1E16EDA38;
  v108[4] = v93;
  v111 = v11;
  v66 = v63;
  v109 = v66;
  v67 = v82;
  v110 = v67;
  v68 = _Block_copy(v108);
  if (v11)
  {
    +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 1030, v62, v68, a8, 0.0, 2.0, 1199.0, 98.0, 0.0);
    +[UIView _animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:](UIView, "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 1030, v65, 0, a8, 0.0, 2.0, 1199.0, 98.0, 0.0);
    v69 = 1.0;
  }
  else
  {
    v69 = 0.0;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 1030, v62, v68, a8, 0.0);
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 1030, v65, 0, a8, 0.0);
  }
  v105[0] = v61;
  v105[1] = 3221225472;
  v105[2] = __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_4;
  v105[3] = &unk_1E16B1888;
  v106 = v15;
  v107 = v69;
  v70 = v15;
  if (v11)
    v71 = a8 * 0.3;
  else
    v71 = a8 * 0.4;
  if (v11)
    v72 = a8 * 0.4;
  else
    v72 = a8 * 0.6;
  if (v11)
    v73 = a8 * 0.5;
  else
    v73 = a8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 1030, v105, 0, v71, 0.0);
  v101[0] = v61;
  v101[1] = 3221225472;
  v101[2] = __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_5;
  v101[3] = &unk_1E16B1C28;
  v104 = v60;
  v102 = v66;
  v103 = v64;
  v74 = v64;
  v75 = v66;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 1030, v101, 0, v72, 0.0);
  v99[0] = v61;
  v99[1] = 3221225472;
  v99[2] = __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_6;
  v99[3] = &unk_1E16B1B50;
  v99[4] = v93;
  v100 = v95;
  v76 = v95;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 1030, v99, 0, v73, 0.0);

}

uint64_t __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return objc_msgSend(v1, "setTransform:", v4);
}

uint64_t __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_2(uint64_t a1)
{
  __int128 v2;
  uint64_t result;
  _OWORD v4[3];

  v2 = *(_OWORD *)(a1 + 64);
  v4[0] = *(_OWORD *)(a1 + 48);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 80);
  result = objc_msgSend(*(id *)(a1 + 32), "setTransform:", v4);
  if (*(_BYTE *)(a1 + 96))
    return objc_msgSend(*(id *)(a1 + 40), "setBlurRadius:", 20.0);
  return result;
}

uint64_t __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  __int128 v5;
  _OWORD v7[3];

  objc_msgSend(*(id *)(a1 + 32), "sourceViewSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeFromSuperview");

  objc_msgSend(*(id *)(a1 + 32), "setSourceViewSnapshot:", 0);
  if (!*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "revealEffectView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    objc_msgSend(*(id *)(a1 + 32), "setRevealEffectView:", 0);
    objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview");
    v4 = *(void **)(a1 + 40);
    v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v7[0] = *MEMORY[0x1E0C9BAA8];
    v7[1] = v5;
    v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(v4, "setTransform:", v7);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setEffectAlpha:", *(double *)(a1 + 40));
}

uint64_t __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

void __177__UIAlertControllerVisualStyleActionSheetInline_animateAlertControllerView_ofAlertController_forPresentation_inContainerView_descendantOfContainerView_duration_completionBlock___block_invoke_6(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "revealEffectView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setEffect:", *(_QWORD *)(a1 + 40));

}

- (double)transitionDurationForPresentation:(BOOL)a3 ofAlertController:(id)a4
{
  double result;

  if (!a3)
    return 0.25;
  objc_opt_self();
  _durationOfSpringAnimation(2.0, 1199.0, 98.0, 0.0);
  return result;
}

- (int64_t)permittedActionLayoutDirection
{
  return 1;
}

- (double)minimumWidth
{
  return 0.0;
}

- (BOOL)transitionOfType:(int64_t)a3 shouldBeInteractiveForAlertController:(id)a4
{
  return a3 == 0;
}

- (id)interactionProgressForTransitionOfType:(int64_t)a3 forAlertController:(id)a4
{
  void *v4;
  void *v5;
  double v6;
  id v7;

  objc_msgSend(a4, "transitioningDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionProgressForPresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "percentComplete");
  if (v6 >= 1.0)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

+ (void)positionContentsOfAlertController:(id)a3 alertContentView:(id)a4 availableSpaceView:(id)a5 visualStyle:(id)a6 updatableConstraints:(id)a7
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
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
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  UIView *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  double MidY;
  double v92;
  void *v93;
  void *v94;
  double v95;
  void *v96;
  void *v97;
  UIVisualEffectView *v98;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  void *v108;
  double Height;
  double v110;
  void *v111;
  id v112;
  CGRect v113;
  CGRect v114;
  CGRect v115;
  CGRect v116;
  CGRect v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;

  v112 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "layoutBelowIfNeeded");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v12;
  objc_msgSend(v10, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentInsetsForContainerView:", v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  objc_msgSend(v14, "_sourceRectForAlertController:inContainerView:", v112, v11);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;
  objc_msgSend(v112, "_presentationSourceRepresentationView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = objc_alloc_init(UIView);
    objc_msgSend(v32, "bounds");
    Height = CGRectGetHeight(v113);
    objc_msgSend(v14, "interfaceActionVisualStyle");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "contentCornerRadius");
    v110 = v21;
    v35 = v23;
    v37 = v36;
    -[UIView layer](v33, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setCornerRadius:", v37);

    -[UIView setClipsToBounds:](v33, "setClipsToBounds:", 1);
    +[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v33, "setBackgroundColor:", v39);

    objc_msgSend(v32, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v33, "addSubview:", v32);
    v111 = v32;
    _NSDictionaryOfVariableBindings(CFSTR("presentationSourceRepresentationView"), v32, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[presentationSourceRepresentationView]|"), 0, 0, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v41);

    objc_msgSend(MEMORY[0x1E0D156E0], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[presentationSourceRepresentationView]|"), 0, 0, v40);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v42);

    -[UIView leadingAnchor](v33, "leadingAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintGreaterThanOrEqualToAnchor:constant:", v44, v19);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v45);

    -[UIView trailingAnchor](v33, "trailingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintLessThanOrEqualToAnchor:constant:", v47, -v35);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v48);

    -[UIView topAnchor](v33, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintGreaterThanOrEqualToAnchor:constant:", v50, v17);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v51);

    -[UIView bottomAnchor](v33, "bottomAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "constraintLessThanOrEqualToAnchor:constant:", v53, -v110);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v54);

    if (Height > 0.0)
    {
      -[UIView heightAnchor](v33, "heightAnchor");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "constraintGreaterThanOrEqualToConstant:", Height);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v56);

    }
    objc_msgSend(v10, "leadingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView leadingAnchor](v33, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58, 0.0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v59);

    objc_msgSend(v10, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v33, "trailingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:constant:", v61, 0.0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v62);

    -[UIView centerYAnchor](v33, "centerYAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v114.origin.x = v25;
    v114.origin.y = v27;
    v114.size.width = v29;
    v114.size.height = v31;
    objc_msgSend(v63, "constraintEqualToAnchor:constant:", v64, CGRectGetMidY(v114));
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v66) = 1131937792;
    objc_msgSend(v65, "setPriority:", v66);
    objc_msgSend(v13, "addObject:", v65);
    -[UIView centerXAnchor](v33, "centerXAnchor");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leftAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v115.origin.x = v25;
    v115.origin.y = v27;
    v115.size.width = v29;
    v115.size.height = v31;
    objc_msgSend(v67, "constraintEqualToAnchor:constant:", v68, CGRectGetMidX(v115));
    v69 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v70) = 1144750080;
    objc_msgSend(v69, "setPriority:", v70);
    objc_msgSend(v13, "addObject:", v69);

    v32 = v111;
  }
  else
  {
    objc_msgSend(v112, "presentationController");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sourceView");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "sourceRect");
    +[UIForcePresentationHelper snapshotViewForSourceView:sourceRect:](UIForcePresentationHelper, "snapshotViewForSourceView:sourceRect:", v71);
    v33 = (UIView *)objc_claimAutoreleasedReturnValue();

    -[UIView widthAnchor](v33, "widthAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v116.origin.x = v25;
    v116.origin.y = v27;
    v116.size.width = v29;
    v116.size.height = v31;
    objc_msgSend(v72, "constraintEqualToConstant:", CGRectGetWidth(v116));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v73);

    -[UIView heightAnchor](v33, "heightAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v117.origin.x = v25;
    v117.origin.y = v27;
    v117.size.width = v29;
    v117.size.height = v31;
    objc_msgSend(v74, "constraintEqualToConstant:", CGRectGetHeight(v117));
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v75);

    -[UIView centerXAnchor](v33, "centerXAnchor");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leftAnchor");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v118.origin.x = v25;
    v118.origin.y = v27;
    v118.size.width = v29;
    v118.size.height = v31;
    objc_msgSend(v76, "constraintEqualToAnchor:constant:", v77, CGRectGetMidX(v118));
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v78);

    -[UIView centerYAnchor](v33, "centerYAnchor");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "topAnchor");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v119.origin.x = v25;
    v119.origin.y = v27;
    v119.size.width = v29;
    v119.size.height = v31;
    objc_msgSend(v79, "constraintEqualToAnchor:constant:", v80, CGRectGetMidY(v119));
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v81);

    objc_msgSend(v10, "leadingAnchor");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leadingAnchor");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "constraintGreaterThanOrEqualToAnchor:constant:", v83, v19);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v84);

    objc_msgSend(v10, "trailingAnchor");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "constraintLessThanOrEqualToAnchor:constant:", v86, -v23);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v87);

    objc_msgSend(v10, "centerXAnchor");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "leftAnchor");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v120.origin.x = v25;
    v120.origin.y = v27;
    v120.size.width = v29;
    v120.size.height = v31;
    objc_msgSend(v88, "constraintEqualToAnchor:constant:", v89, CGRectGetMidX(v120));
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v90) = 1144750080;
    objc_msgSend(v65, "setPriority:", v90);
    objc_msgSend(v13, "addObject:", v65);
  }

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v33, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v11, "addSubview:", v33);
  objc_msgSend(v14, "setHeaderView:", v33);
  v121.origin.x = v25;
  v121.origin.y = v27;
  v121.size.width = v29;
  v121.size.height = v31;
  MidY = CGRectGetMidY(v121);
  objc_msgSend(v11, "bounds");
  v92 = CGRectGetMidY(v122);
  if (MidY < v92)
  {
    objc_msgSend(v10, "topAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView bottomAnchor](v33, "bottomAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = 10.0;
  }
  else
  {
    objc_msgSend(v10, "bottomAnchor");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v33, "topAnchor");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v95 = -10.0;
  }
  objc_msgSend(v93, "constraintEqualToAnchor:constant:", v94, v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v96);

  objc_msgSend(v14, "setActionsReversed:", MidY >= v92);
  objc_msgSend(v14, "revealEffectView");
  v97 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v97)
  {
    v98 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", 0);
    objc_msgSend(v14, "setRevealEffectView:", v98);

  }
  objc_msgSend(v14, "revealEffectView");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertSubview:atIndex:", v99, 0);

  objc_msgSend(v11, "bounds");
  v101 = v100;
  v103 = v102;
  v105 = v104;
  v107 = v106;
  objc_msgSend(v14, "revealEffectView");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v108, "setFrame:", v101, v103, v105, v107);

  objc_msgSend(MEMORY[0x1E0D156E0], "activateConstraints:", v13);
}

- (id)tintColorForAlertController:(id)a3
{
  return +[UIColor labelColor](UIColor, "labelColor", a3);
}

- (BOOL)hideCancelAction:(id)a3 inAlertController:(id)a4
{
  return 1;
}

- (id)dimmingViewForAlertController:(id)a3
{
  UIView *v3;
  UIView *v4;

  v3 = [UIView alloc];
  v4 = -[UIView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v4;
}

- (BOOL)_shouldReverseActions
{
  return self->_actionsReversed;
}

- (BOOL)placementAvoidsKeyboard
{
  return 0;
}

- (BOOL)actionsReversed
{
  return self->_actionsReversed;
}

- (void)setActionsReversed:(BOOL)a3
{
  self->_actionsReversed = a3;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_headerView, a3);
}

- (UIVisualEffectView)revealEffectView
{
  return self->_revealEffectView;
}

- (void)setRevealEffectView:(id)a3
{
  objc_storeStrong((id *)&self->_revealEffectView, a3);
}

- (_UIPreviewPresentationEffectView)sourceViewSnapshot
{
  return self->_sourceViewSnapshot;
}

- (void)setSourceViewSnapshot:(id)a3
{
  objc_storeStrong((id *)&self->_sourceViewSnapshot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceViewSnapshot, 0);
  objc_storeStrong((id *)&self->_revealEffectView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
}

@end
