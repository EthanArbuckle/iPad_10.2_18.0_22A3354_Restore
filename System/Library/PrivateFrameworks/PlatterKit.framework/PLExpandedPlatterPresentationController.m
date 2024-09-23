@implementation PLExpandedPlatterPresentationController

+ (CGRect)useableContainerViewBoundsForExpandedPlatter:(id)a3 inContainerViewWithBounds:(CGRect)a4
{
  id v4;
  void *v5;
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
  CGRect result;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_peripheryInsets");
  v7 = v6;

  if (v7 > 0.0)
    objc_msgSend(v4, "dismissControlInsets");
  UIRectInset();
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (CGSize)_sizeOfExpandedPlatter:(id)a3 withPreferredContentSize:(CGSize)a4 inContainerViewWithBounds:(CGRect)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a4.height;
  width = a4.width;
  objc_msgSend(a1, "useableContainerViewBoundsForExpandedPlatter:inContainerViewWithBounds:", a3, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  objc_msgSend(a1, "_sizeOfViewWithPreferredContentSize:inUseableContainerViewBounds:", width, height, v8, v9, v10, v11);
  result.height = v13;
  result.width = v12;
  return result;
}

- (PLExpandedPlatterPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5 sourceView:(id)a6
{
  id v9;
  id v10;
  PLExpandedPlatterPresentationController *v11;
  id WeakRetained;
  char v13;
  objc_super v15;

  v9 = a3;
  v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PLExpandedPlatterPresentationController;
  v11 = -[PLExpandedPlatterPresentationController initWithPresentedViewController:presentingViewController:](&v15, sel_initWithPresentedViewController_presentingViewController_, v9, a4);
  if (v11)
  {
    if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EFC7C9F8))
      -[PLExpandedPlatterPresentationController setPresentationControllerDelegate:](v11, "setPresentationControllerDelegate:", v9);
    objc_storeWeak((id *)&v11->_sourceView, v10);
    WeakRetained = objc_loadWeakRetained((id *)&v11->_presentationControllerDelegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = objc_msgSend(WeakRetained, "expandedPlatterPresentationControllerShouldAllowKeyboardOnAppearance:", v11);
    else
      v13 = 0;
    v11->_listenToKeyboardEvents = v13;

  }
  return v11;
}

- (id)_presentedExpandedPlatter
{
  PLExpandedPlatter **p_presentedExpandedPlatter;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  p_presentedExpandedPlatter = &self->_presentedExpandedPlatter;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedExpandedPlatter);
  if ((*(_BYTE *)&self->_expandedPlatterPresentationControllerHelperFlags & 1) == 0)
  {
    *(_BYTE *)&self->_expandedPlatterPresentationControllerHelperFlags |= 1u;
    -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v5, "viewWithContent");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (objc_msgSend(v6, "conformsToProtocol:", &unk_1EFC6B7C8))
    {
      v8 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_10:

        return WeakRetained;
      }
      objc_msgSend(v6, "expandedPlatterView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    objc_storeWeak((id *)p_presentedExpandedPlatter, v9);
    WeakRetained = v9;
    goto LABEL_10;
  }
  return WeakRetained;
}

- (id)_clickPresentationInteractionManager
{
  void *v2;
  void *v3;
  void *v4;

  -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "presenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "clickPresentationInteractionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (CGRect)_frameOfPresentedViewInContainerViewWithBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
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
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double MinY;
  double v38;
  double v39;
  CGRect *p_keyboardFrame;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  double MinX;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  _BOOL4 IsEmpty;
  CGFloat v59;
  CGFloat v60;
  double MaxY;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  CGFloat v75;
  double v76;
  double v77;
  CGFloat v78;
  CGFloat v79;
  CGFloat v80;
  CGFloat rect;
  double v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PLExpandedPlatterPresentationController _presentedExpandedPlatter](self, "_presentedExpandedPlatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "useableContainerViewBoundsForExpandedPlatter:inContainerViewWithBounds:", v8, x, y, width, height);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "preferredContentSize");
  v19 = v18;
  v21 = v20;

  objc_msgSend((id)objc_opt_class(), "_sizeOfViewWithPreferredContentSize:inUseableContainerViewBounds:", v19, v21, v10, v12, v14, v16);
  BSRectWithSize();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = (void *)objc_opt_class();
  v80 = v27;
  objc_msgSend(v8, "platterFrameForFrame:", v23, v25, v27, v29);
  v76 = v14;
  objc_msgSend(v30, "_sizeOfViewWithPreferredContentSize:inUseableContainerViewBounds:", v31, v32, v10, v12, v14, v16);
  BSRectWithSize();
  v77 = v33;
  v82 = v34;
  -[PLExpandedPlatterPresentationController _sourceViewFinalPresentationFrame](self, "_sourceViewFinalPresentationFrame");
  if (!CGRectIsEmpty(v83))
  {
    UIRectCenteredIntegralRect();
    v23 = v35;
    v25 = v36;
  }
  v84.origin.x = v10;
  v84.origin.y = v12;
  v84.size.width = v14;
  v84.size.height = v16;
  MinY = CGRectGetMinY(v84);
  v85.origin.x = v23;
  v85.origin.y = v25;
  v85.size.height = v29;
  v85.size.width = v80;
  v38 = CGRectGetMinY(v85);
  if (MinY >= v38)
    v39 = MinY;
  else
    v39 = v38;
  p_keyboardFrame = &self->_keyboardFrame;
  if (CGRectIsEmpty(self->_keyboardFrame))
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "_peripheryInsets");

    UIRectInset();
    v44 = v43;
    v78 = v46;
    v79 = v45;
  }
  else
  {
    v86.origin.x = p_keyboardFrame->origin.x;
    v86.origin.y = self->_keyboardFrame.origin.y;
    v86.size.width = self->_keyboardFrame.size.width;
    v86.size.height = self->_keyboardFrame.size.height;
    v47 = CGRectGetMinY(v86);
    v87.origin.x = v10;
    v87.origin.y = v12;
    v87.size.width = v14;
    v87.size.height = v16;
    v48 = v47 - CGRectGetMinY(v87);
    v44 = v10;
    v42 = v12;
    v78 = v48;
    v79 = v76;
  }
  rect = v42;
  v75 = v44;
  UIRectCenteredXInRect();
  MinX = CGRectGetMinX(v88);
  objc_msgSend(v8, "frameForPlatterFrame:", MinX, v39, v77, v82);
  CGRectGetMinX(v89);
  UIRectContainInRect();
  v51 = v50;
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v90.origin.x = p_keyboardFrame->origin.x;
  v90.origin.y = self->_keyboardFrame.origin.y;
  v90.size.width = self->_keyboardFrame.size.width;
  v90.size.height = self->_keyboardFrame.size.height;
  IsEmpty = CGRectIsEmpty(v90);
  if (IsEmpty)
    MinX = v51;
  else
    v53 = v39;
  if (IsEmpty)
    v59 = v55;
  else
    v59 = v77;
  if (IsEmpty)
    v60 = v57;
  else
    v60 = v82;
  v91.origin.x = MinX;
  v91.origin.y = v53;
  v91.size.width = v59;
  v91.size.height = v60;
  MaxY = CGRectGetMaxY(v91);
  v92.origin.x = v75;
  v92.origin.y = rect;
  v92.size.height = v78;
  v92.size.width = v79;
  v62 = CGRectGetMaxY(v92);
  if (MaxY > v62)
    MaxY = v62;
  v93.origin.x = MinX;
  v93.origin.y = v53;
  v93.size.width = v59;
  v93.size.height = v60;
  objc_msgSend(v8, "frameForPlatterFrame:", v51, MaxY - CGRectGetHeight(v93), v55, v57);
  v95.origin.y = CGRectGetMinY(v94);
  v95.origin.x = v51;
  v95.size.width = v55;
  v95.size.height = v57;
  CGRectGetMinY(v95);
  v96.origin.x = v75;
  v96.origin.y = rect;
  v96.size.height = v78;
  v96.size.width = v79;
  CGRectGetMinY(v96);
  PLMainScreenScale();
  UIRectIntegralWithScale();
  v64 = v63;
  v66 = v65;
  v68 = v67;
  v70 = v69;

  v71 = v64;
  v72 = v66;
  v73 = v68;
  v74 = v70;
  result.size.height = v74;
  result.size.width = v73;
  result.origin.y = v72;
  result.origin.x = v71;
  return result;
}

- (UIEdgeInsets)_contentInsetWithPresentedFrame:(CGRect)a3 inContainerViewWithBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect *p_keyboardFrame;
  CGFloat v19;
  double MaxY;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat rect;
  CGRect v32;
  CGRect v33;
  UIEdgeInsets result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PLExpandedPlatterPresentationController _presentedExpandedPlatter](self, "_presentedExpandedPlatter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minimumScrollViewContentInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  p_keyboardFrame = &self->_keyboardFrame;
  if (!CGRectIsEmpty(*p_keyboardFrame))
  {
    rect = height;
    objc_msgSend(v9, "sizeExcludingActions");
    v32.size.height = v19;
    v32.origin.x = x;
    v32.origin.y = y;
    v32.size.width = width;
    MaxY = CGRectGetMaxY(v32);
    if (MaxY > CGRectGetMinY(*p_keyboardFrame))
    {
      objc_msgSend(v9, "actionsSizeThatFits:", a4.size.width, a4.size.height);
      v29 = v21;
      v22 = CGRectGetHeight(a4);
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = rect;
      v23 = CGRectGetMaxY(v33);
      v24 = CGRectGetHeight(*p_keyboardFrame) - (v29 + (double)((int)(v22 - v23) & ~((int)(v22 - v23) >> 31)));
      if (v24 > 0.0)
        v15 = v24;
    }
  }

  v25 = v11;
  v26 = v13;
  v27 = v15;
  v28 = v17;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (CGPoint)_contentOffsetForPresentedExpandedPlatterView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double MinY;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGPoint result;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v4 = a3;
  objc_msgSend(v4, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  v36 = v6;
  objc_msgSend(v4, "contentSizeExcludingActions");
  v35 = v7;
  -[PLExpandedPlatterPresentationController presentedView](self, "presentedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v4, "scrollViewFrame");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v38.origin.x = v10;
  v38.origin.y = v12;
  v38.size.width = v14;
  v38.size.height = v16;
  v25 = CGRectGetMinX(v38) + v18;
  v39.origin.x = v10;
  v39.origin.y = v12;
  v39.size.width = v14;
  v39.size.height = v16;
  v26 = v20 + CGRectGetMinY(v39);
  objc_msgSend(v4, "minimumScrollViewContentInsets");
  v28 = v27;

  v29 = -v28;
  MinY = CGRectGetMinY(self->_keyboardFrame);
  v40.origin.x = v25;
  v40.origin.y = v26;
  v40.size.width = v22;
  v40.size.height = v24;
  v31 = v35 - (MinY - CGRectGetMinY(v40));
  if (v31 <= v29)
    v32 = v29;
  else
    v32 = v31;

  v33 = v36;
  v34 = v32;
  result.y = v34;
  result.x = v33;
  return result;
}

- (void)setAdditionalContentTranslation:(CGPoint)a3
{
  id v4;

  if (a3.x != self->_additionalContentTranslation.x || a3.y != self->_additionalContentTranslation.y)
  {
    self->_additionalContentTranslation = a3;
    -[PLExpandedPlatterPresentationController containerView](self, "containerView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

  }
}

- (void)setHomeAffordanceVisible:(BOOL)a3
{
  void *v4;
  int v5;

  if (self->_homeAffordanceVisible != a3)
  {
    self->_homeAffordanceVisible = a3;
    if (!a3
      || (-[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v5 = objc_msgSend(v4, "_appearState"),
          v4,
          v5 == 2))
    {
      -[PLExpandedPlatterPresentationController _setHomeAffordanceVisible:](self, "_setHomeAffordanceVisible:");
    }
  }
}

- (void)_setHomeAffordanceVisible:(BOOL)a3
{
  PLExpandedPlatterPresentationController *v4;
  uint64_t v5;

  if (a3)
  {
    if (CGRectIsEmpty(self->_keyboardFrame))
    {
      -[PLExpandedPlatterPresentationController _setLocalHomeAffordanceVisible:](self, "_setLocalHomeAffordanceVisible:", 1);
      return;
    }
    v4 = self;
    v5 = 1;
  }
  else
  {
    -[PLExpandedPlatterPresentationController _setLocalHomeAffordanceVisible:](self, "_setLocalHomeAffordanceVisible:");
    v4 = self;
    v5 = 0;
  }
  -[PLExpandedPlatterPresentationController _setKeyboardHomeAffordanceVisible:](v4, "_setKeyboardHomeAffordanceVisible:", v5);
}

- (BOOL)_isLocalHomeAffordanceVisible
{
  MTLumaDodgePillView *homeAffordanceView;

  homeAffordanceView = self->_homeAffordanceView;
  if (homeAffordanceView)
    LOBYTE(homeAffordanceView) = -[MTLumaDodgePillView isHidden](homeAffordanceView, "isHidden") ^ 1;
  return (char)homeAffordanceView;
}

- (void)_setLocalHomeAffordanceVisible:(BOOL)a3
{
  _BOOL4 v3;
  MTLumaDodgePillView *v5;
  MTLumaDodgePillView *homeAffordanceView;
  void *v7;
  int v8;
  MTLumaDodgePillView *v9;
  MTLumaDodgePillView *v10;
  id WeakRetained;
  void *v12;
  void *v13;
  uint64_t v14;
  MTLumaDodgePillView *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  MTLumaDodgePillView *v21;
  BOOL v22;
  _QWORD v23[4];
  MTLumaDodgePillView *v24;
  BOOL v25;

  v3 = a3;
  if (a3 && !self->_homeAffordanceView)
  {
    v5 = (MTLumaDodgePillView *)objc_alloc_init(MEMORY[0x1E0D47490]);
    homeAffordanceView = self->_homeAffordanceView;
    self->_homeAffordanceView = v5;

    -[MTLumaDodgePillView setStyle:](self->_homeAffordanceView, "setStyle:", 3);
    -[PLExpandedPlatterPresentationController containerView](self, "containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", self->_homeAffordanceView);

  }
  if (self->_homeAffordanceView)
  {
    v8 = objc_msgSend(MEMORY[0x1E0CEABB0], "areAnimationsEnabled");
    v9 = self->_homeAffordanceView;
    if (v8)
    {
      if (v3)
      {
        -[MTLumaDodgePillView setHidden:](v9, "setHidden:", 0);
        -[MTLumaDodgePillView setAlpha:](self->_homeAffordanceView, "setAlpha:", 0.0);
        v10 = self->_homeAffordanceView;
        WeakRetained = objc_loadWeakRetained((id *)&self->_presentationControllerDelegate);
        objc_msgSend(WeakRetained, "unhideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:", self);
      }
      else
      {
        v10 = v9;
        WeakRetained = objc_loadWeakRetained((id *)&self->_presentationControllerDelegate);
        objc_msgSend(WeakRetained, "hideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:", self);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D01908];
      v14 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __74__PLExpandedPlatterPresentationController__setLocalHomeAffordanceVisible___block_invoke;
      v23[3] = &unk_1E91D3188;
      v24 = v10;
      v25 = v3;
      v17 = v14;
      v18 = 3221225472;
      v19 = __74__PLExpandedPlatterPresentationController__setLocalHomeAffordanceVisible___block_invoke_2;
      v20 = &unk_1E91D31B0;
      v22 = v3;
      v15 = v24;
      v21 = v15;
      objc_msgSend(v13, "animateWithSettings:options:actions:completion:", v12, 6, v23, &v17);
      if ((-[MTLumaDodgePillView isHidden](self->_homeAffordanceView, "isHidden", v17, v18, v19, v20) & 1) == 0)
      {
        -[PLExpandedPlatterPresentationController containerView](self, "containerView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setNeedsLayout");

      }
    }
    else
    {
      -[MTLumaDodgePillView setHidden:](v9, "setHidden:", !v3);
    }
  }
}

uint64_t __74__PLExpandedPlatterPresentationController__setLocalHomeAffordanceVisible___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

uint64_t __74__PLExpandedPlatterPresentationController__setLocalHomeAffordanceVisible___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CEABB0], "_isInAnimationBlock");
  if ((result & 1) == 0 && !*(_BYTE *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "setHidden:", 1);
  return result;
}

- (BOOL)_isKeyboardHomeAffordanceVisible
{
  return self->_keyboardHomeAffordance != 0;
}

- (void)_setKeyboardHomeAffordanceVisible:(BOOL)a3
{
  PLKeyboardHomeAffordanceAssertion *keyboardHomeAffordance;
  void *v5;
  void *v6;
  void *v7;
  PLKeyboardHomeAffordanceAssertion *v8;
  id WeakRetained;

  keyboardHomeAffordance = self->_keyboardHomeAffordance;
  if (a3)
  {
    if (!keyboardHomeAffordance)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_presentationControllerDelegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[PLExpandedPlatterPresentationController containerView](self, "containerView");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "window");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "expandedPlatterPresentationController:keyboardAssertionForGestureWindow:", self, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLExpandedPlatterPresentationController _setKeyboardHomeAffordance:](self, "_setKeyboardHomeAffordance:", v7);

      }
    }
  }
  else if (keyboardHomeAffordance)
  {
    -[PLKeyboardHomeAffordanceAssertion invalidate](keyboardHomeAffordance, "invalidate");
    v8 = self->_keyboardHomeAffordance;
    self->_keyboardHomeAffordance = 0;

  }
}

- (void)setAdditionalHomeAffordanceSpacing:(double)a3
{
  MTLumaDodgePillView *homeAffordanceView;

  if (self->_additionalHomeAffordanceSpacing != a3)
  {
    self->_additionalHomeAffordanceSpacing = a3;
    if (-[PLExpandedPlatterPresentationController isHomeAffordanceVisible](self, "isHomeAffordanceVisible"))
    {
      if (-[PLExpandedPlatterPresentationController _isLocalHomeAffordanceVisible](self, "_isLocalHomeAffordanceVisible"))
      {
        -[MTLumaDodgePillView frame](self->_homeAffordanceView, "frame");
        homeAffordanceView = self->_homeAffordanceView;
        PLMainScreenScale();
        UIRectIntegralWithScale();
        -[MTLumaDodgePillView setFrame:](homeAffordanceView, "setFrame:");
      }
      else
      {
        -[PLKeyboardHomeAffordanceAssertion setAdditionalEdgeMargin:](self->_keyboardHomeAffordance, "setAdditionalEdgeMargin:", self->_additionalHomeAffordanceSpacing);
      }
    }
  }
}

- (void)setHomeAffordancePanGesture:(id)a3
{
  UIPanGestureRecognizer *v5;
  UIPanGestureRecognizer *homeAffordancePanGesture;
  UIPanGestureRecognizer *v7;

  v5 = (UIPanGestureRecognizer *)a3;
  homeAffordancePanGesture = self->_homeAffordancePanGesture;
  if (homeAffordancePanGesture != v5)
  {
    v7 = v5;
    if (homeAffordancePanGesture)
      -[UIPanGestureRecognizer removeTarget:action:](homeAffordancePanGesture, "removeTarget:action:", self, sel__handleHomeAffordancePan_);
    objc_storeStrong((id *)&self->_homeAffordancePanGesture, a3);
    -[UIPanGestureRecognizer addTarget:action:](self->_homeAffordancePanGesture, "addTarget:action:", self, sel__handleHomeAffordancePan_);
    v5 = v7;
  }

}

- (void)_handleHomeAffordancePan:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  double MaxY;
  double v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  UINotificationFeedbackGenerator *v15;
  UINotificationFeedbackGenerator *homeAffordanceFeedbackGenerator;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  CGRect v21;

  v4 = a3;
  -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isBeingPresented"))
  {
    -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isBeingDismissed");

    if ((v7 & 1) != 0)
      goto LABEL_4;
    -[PLExpandedPlatterPresentationController containerView](self, "containerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    MaxY = CGRectGetMaxY(v21);
    objc_msgSend(v4, "locationInView:", v5);
    v10 = MaxY - v9;
    switch(objc_msgSend(v4, "state"))
    {
      case 1:
        if (!self->_homeAffordanceFeedbackGenerator)
        {
          v11 = objc_alloc(MEMORY[0x1E0CEA7D0]);
          v12 = (void *)MEMORY[0x1E0CEAE28];
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E91E2D98);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "privateConfigurationForTypes:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (UINotificationFeedbackGenerator *)objc_msgSend(v11, "initWithConfiguration:", v14);
          homeAffordanceFeedbackGenerator = self->_homeAffordanceFeedbackGenerator;
          self->_homeAffordanceFeedbackGenerator = v15;

          -[UINotificationFeedbackGenerator activateWithCompletionBlock:](self->_homeAffordanceFeedbackGenerator, "activateWithCompletionBlock:", 0);
        }
        goto LABEL_9;
      case 2:
LABEL_9:
        if (v10 > 100.0)
          goto LABEL_12;
        v20 = 0u;
        BYTE8(v20) = 1;
        v19 = 0u;
        BYTE8(v19) = 1;
        BSIntervalMap();
        -[PLExpandedPlatterPresentationController setAdditionalHomeAffordanceSpacing:](self, "setAdditionalHomeAffordanceSpacing:", v17 * 15.0 + 0.0, 0, *((_QWORD *)&v19 + 1), 0x3FF0000000000000, 1, 0, *((_QWORD *)&v20 + 1), 0x4059000000000000, 1);
        break;
      case 3:
        objc_msgSend(v4, "velocityInView:", v5);
        if (v10 + v18 * -0.15 <= 100.0)
          goto LABEL_6;
LABEL_12:
        -[PLExpandedPlatterPresentationController _fireHomeGesture](self, "_fireHomeGesture");
        break;
      case 4:
      case 5:
LABEL_6:
        -[PLExpandedPlatterPresentationController _settleHomeAffordance](self, "_settleHomeAffordance");
        break;
      default:
        break;
    }
  }

LABEL_4:
}

- (void)_dismissExpandedPlatterWithTrigger:(int64_t)a3
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismisser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "expandedPlatterPresentable:requestsDismissalWithTrigger:", v8, a3);

  }
  else
  {
    -[PLExpandedPlatterPresentationController _clickPresentationInteractionManager](self, "_clickPresentationInteractionManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_dismissIfPossibleWithTrigger:", a3);
  }

}

- (void)_fireHomeGesture
{
  -[PLExpandedPlatterPresentationController _dismissExpandedPlatterWithTrigger:](self, "_dismissExpandedPlatterWithTrigger:", 2);
  -[UINotificationFeedbackGenerator _privateNotificationOccurred:](self->_homeAffordanceFeedbackGenerator, "_privateNotificationOccurred:", 1010);
}

- (void)_settleHomeAffordance
{
  void *v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PLExpandedPlatterPresentationController__settleHomeAffordance__block_invoke;
  v6[3] = &unk_1E91D3160;
  v6[4] = self;
  v3 = (void *)MEMORY[0x1D17E5ED8](v6, a2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationControllerDelegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "settleHomeAffordanceAnimationBehaviorDescriptionForExpandedPlatterPresentationController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringBehavior:tracking:animations:completion:", v5, 0, v3, 0);

  }
}

uint64_t __64__PLExpandedPlatterPresentationController__settleHomeAffordance__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAdditionalHomeAffordanceSpacing:", 0.0);
}

- (void)_handleBackgroundTap:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  v4 = a3;
  -[PLExpandedPlatterPresentationController _presentedExpandedPlatter](self, "_presentedExpandedPlatter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v9);
  v6 = v5;
  v8 = v7;

  if ((objc_msgSend(v9, "pointInside:withEvent:", 0, v6, v8) & 1) == 0)
    -[PLExpandedPlatterPresentationController _dismissExpandedPlatterWithTrigger:](self, "_dismissExpandedPlatterWithTrigger:", 3);

}

- (void)_configureDismissFeedbackIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  _UIStatesFeedbackGenerator *v6;
  _UIStatesFeedbackGenerator *dismissFeedbackBehavior;
  id v8;

  if (!self->_dismissFeedbackBehavior)
  {
    -[PLExpandedPlatterPresentationController containerView](self, "containerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v8 = v3;
      v4 = objc_alloc(MEMORY[0x1E0CEAEC8]);
      -[PLExpandedPlatterPresentationController _presentedExpandedPlatter](self, "_presentedExpandedPlatter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (_UIStatesFeedbackGenerator *)objc_msgSend(v4, "initWithStyle:view:", 1, v5);
      dismissFeedbackBehavior = self->_dismissFeedbackBehavior;
      self->_dismissFeedbackBehavior = v6;

      -[_UIStatesFeedbackGenerator prepare](self->_dismissFeedbackBehavior, "prepare");
      v3 = v8;
    }

  }
}

- (BOOL)_actuateFeedbackForDismissalIfNecessary
{
  _BOOL4 didPlayDismissHaptic;

  didPlayDismissHaptic = self->_didPlayDismissHaptic;
  if (!self->_didPlayDismissHaptic)
  {
    self->_didPlayDismissHaptic = 1;
    -[_UIStatesFeedbackGenerator transitionToState:ended:](self->_dismissFeedbackBehavior, "transitionToState:ended:", *MEMORY[0x1E0CEC1C8], 1);
  }
  return !didPlayDismissHaptic;
}

- (void)_actuateFeedbackForDismissalInvalidationIfNecessary
{
  if (self->_didPlayDismissHaptic)
  {
    self->_didPlayDismissHaptic = 0;
    -[_UIStatesFeedbackGenerator transitionToState:ended:](self->_dismissFeedbackBehavior, "transitionToState:ended:", *MEMORY[0x1E0CEC1D0], 1);
  }
}

- (void)_configureDismissLabelIfNecessary
{
  UILabel *v3;
  UILabel *dismissLabel;
  UILabel *v5;
  void *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  UILabel *v15;
  void *v16;
  double v17;
  double v18;
  UIView *v19;
  UIView *dismissLabelContainerView;
  UILabel *v21;
  void *v22;
  id v23;

  if (!self->_dismissLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    dismissLabel = self->_dismissLabel;
    self->_dismissLabel = v3;

    v5 = self->_dismissLabel;
    objc_msgSend(MEMORY[0x1E0D01928], "defaultFontProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E0CEB558], 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5, "setFont:", v7);

    v8 = self->_dismissLabel;
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    v10 = self->_dismissLabel;
    PlatterKitFrameworkBundle();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("EXPANDED_PLATTER_DISMISS_HINT"), &stru_1E91D3B40, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedUppercaseString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v10, "setText:", v13);

    -[UILabel setContentMode:](self->_dismissLabel, "setContentMode:", 4);
    -[UILabel setTextAlignment:](self->_dismissLabel, "setTextAlignment:", 1);
    v14 = objc_alloc(MEMORY[0x1E0CEABB0]);
    v15 = self->_dismissLabel;
    -[PLExpandedPlatterPresentationController containerView](self, "containerView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    -[UILabel sizeThatFits:](v15, "sizeThatFits:", v17, v18);
    BSRectWithSize();
    v19 = (UIView *)objc_msgSend(v14, "initWithFrame:");
    dismissLabelContainerView = self->_dismissLabelContainerView;
    self->_dismissLabelContainerView = v19;

    -[UIView setUserInteractionEnabled:](self->_dismissLabelContainerView, "setUserInteractionEnabled:", 0);
    -[UIView setAutoresizesSubviews:](self->_dismissLabelContainerView, "setAutoresizesSubviews:", 1);
    v21 = self->_dismissLabel;
    -[UIView bounds](self->_dismissLabelContainerView, "bounds");
    -[UILabel setFrame:](v21, "setFrame:");
    -[UIView addSubview:](self->_dismissLabelContainerView, "addSubview:", self->_dismissLabel);
    -[UILabel setAutoresizingMask:](self->_dismissLabel, "setAutoresizingMask:", 18);
    -[PLExpandedPlatterPresentationController containerView](self, "containerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", self->_dismissLabelContainerView);

    -[PLExpandedPlatterPresentationController containerView](self, "containerView");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setNeedsLayout");

  }
}

- (CGRect)_dismissLabelContainerViewFrameForPresentedViewFrame:(CGRect)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
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
  double v40;
  double v41;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect result;

  -[PLExpandedPlatterPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[UILabel sizeThatFits:](self->_dismissLabel, "sizeThatFits:", v10, v12);
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_dismissLabel, "textRectForBounds:limitedToNumberOfLines:", 1, v6, v8, v10, v12);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[UILabel font](self->_dismissLabel, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v43.origin.x = v14;
  v43.origin.y = v16;
  v43.size.width = v18;
  v43.size.height = v20;
  CGRectGetMaxY(v43);
  objc_msgSend(v21, "descender");
  v44.origin.x = v6;
  v44.origin.y = v8;
  v44.size.width = v10;
  v44.size.height = v12;
  CGRectGetWidth(v44);
  objc_msgSend(v21, "lineHeight");
  BSRectWithSize();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  CGRectGetMinY(a3);
  v45.origin.x = v23;
  v45.origin.y = v25;
  v45.size.width = v27;
  v45.size.height = v29;
  CGRectGetHeight(v45);
  PLMainScreenScale();
  UIRectIntegralWithScale();
  v31 = v30;
  v33 = v32;
  v35 = v34;
  v37 = v36;

  v38 = v31;
  v39 = v33;
  v40 = v35;
  v41 = v37;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (void)_popDismissLabel
{
  _QWORD v2[5];
  _QWORD v3[5];

  if (self->_dismissLabel)
  {
    v2[4] = self;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __59__PLExpandedPlatterPresentationController__popDismissLabel__block_invoke;
    v3[3] = &unk_1E91D3160;
    v3[4] = self;
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __59__PLExpandedPlatterPresentationController__popDismissLabel__block_invoke_2;
    v2[3] = &unk_1E91D31D8;
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 196608, v3, v2, 0.05, 0.0);
  }
}

uint64_t __59__PLExpandedPlatterPresentationController__popDismissLabel__block_invoke(uint64_t a1)
{
  void *v1;
  CGAffineTransform v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 528);
  CGAffineTransformMakeScale(&v3, 1.2, 1.2);
  return objc_msgSend(v1, "setTransform:", &v3);
}

uint64_t __59__PLExpandedPlatterPresentationController__popDismissLabel__block_invoke_2(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__PLExpandedPlatterPresentationController__popDismissLabel__block_invoke_3;
  v2[3] = &unk_1E91D3160;
  v2[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v2, 0, 0.15, 0.0);
}

uint64_t __59__PLExpandedPlatterPresentationController__popDismissLabel__block_invoke_3(uint64_t a1)
{
  void *v1;
  __int128 v2;
  _OWORD v4[3];

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 528);
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  return objc_msgSend(v1, "setTransform:", v4);
}

- (void)hintDismissalWithCommitProgress:(double)a3 overallProgress:(double)a4
{
  CGFloat v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGAffineTransform v30;

  -[PLExpandedPlatterPresentationController _configureDismissFeedbackIfNecessary](self, "_configureDismissFeedbackIfNecessary");
  v7 = fmin(fmax(a4, 0.0), 1.0) * -0.1 + 1.0;
  -[PLExpandedPlatterPresentationController presentedView](self, "presentedView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v30, v7, v7);
  objc_msgSend(v8, "setTransform:", &v30);

  -[PLExpandedPlatterPresentationController _configureDismissLabelIfNecessary](self, "_configureDismissLabelIfNecessary");
  v9 = fmax(a3, 0.0);
  if (v9 >= 1.0)
    v10 = 1.0;
  else
    v10 = v9;
  -[UILabel setAlpha:](self->_dismissLabel, "setAlpha:", v10);
  -[PLExpandedPlatterPresentationController _presentedExpandedPlatter](self, "_presentedExpandedPlatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[PLExpandedPlatterPresentationController containerView](self, "containerView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "convertRect:toView:", v21, v14, v16, v18, v20);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  -[PLExpandedPlatterPresentationController _dismissLabelContainerViewFrameForPresentedViewFrame:](self, "_dismissLabelContainerViewFrameForPresentedViewFrame:", v23, v25, v27, v29);
  -[UIView setFrame:](self->_dismissLabelContainerView, "setFrame:");
  if (v9 >= 1.0)
  {
    if (-[PLExpandedPlatterPresentationController _actuateFeedbackForDismissalIfNecessary](self, "_actuateFeedbackForDismissalIfNecessary"))
    {
      -[PLExpandedPlatterPresentationController _popDismissLabel](self, "_popDismissLabel");
    }
  }
  else
  {
    -[PLExpandedPlatterPresentationController _actuateFeedbackForDismissalInvalidationIfNecessary](self, "_actuateFeedbackForDismissalInvalidationIfNecessary");
  }

}

- (void)completeDismissal
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;

  if (self->_dismissLabel)
  {
    -[PLExpandedPlatterPresentationController _presentedExpandedPlatter](self, "_presentedExpandedPlatter");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "frame");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[PLExpandedPlatterPresentationController containerView](self, "containerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "convertRect:toView:", v12, v5, v7, v9, v11);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    -[PLExpandedPlatterPresentationController _dismissLabelContainerViewFrameForPresentedViewFrame:](self, "_dismissLabelContainerViewFrameForPresentedViewFrame:", v14, v16, v18, v20);
    -[UIView setFrame:](self->_dismissLabelContainerView, "setFrame:");
    -[UILabel setAlpha:](self->_dismissLabel, "setAlpha:", 0.0);

  }
}

- (CGRect)frameOfPresentedViewInContainerView
{
  void *v3;
  double v4;
  double v5;
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
  CGRect result;

  -[PLExpandedPlatterPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[PLExpandedPlatterPresentationController _frameOfPresentedViewInContainerViewWithBounds:](self, "_frameOfPresentedViewInContainerViewWithBounds:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_sourceViewInitialPresentationFrame
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  id WeakRetained;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if ((*(_BYTE *)&self->_expandedPlatterPresentationControllerHelperFlags & 2) == 0)
  {
    *(_BYTE *)&self->_expandedPlatterPresentationControllerHelperFlags |= 2u;
    -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "presenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "initialPresentedFrameOfViewForPreview");
        self->_sourceViewInitialPresentationFrame.origin.x = v5;
        self->_sourceViewInitialPresentationFrame.origin.y = v6;
        self->_sourceViewInitialPresentationFrame.size.width = v7;
        self->_sourceViewInitialPresentationFrame.size.height = v8;
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v4 = 0;
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
    objc_msgSend(WeakRetained, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "frame");
    objc_msgSend(v10, "convertRect:toView:", 0);
    self->_sourceViewInitialPresentationFrame.origin.x = v11;
    self->_sourceViewInitialPresentationFrame.origin.y = v12;
    self->_sourceViewInitialPresentationFrame.size.width = v13;
    self->_sourceViewInitialPresentationFrame.size.height = v14;

    goto LABEL_9;
  }
LABEL_10:
  x = self->_sourceViewInitialPresentationFrame.origin.x;
  y = self->_sourceViewInitialPresentationFrame.origin.y;
  width = self->_sourceViewInitialPresentationFrame.size.width;
  height = self->_sourceViewInitialPresentationFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_sourceViewFinalPresentationFrame
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if ((*(_BYTE *)&self->_expandedPlatterPresentationControllerHelperFlags & 4) == 0)
  {
    *(_BYTE *)&self->_expandedPlatterPresentationControllerHelperFlags |= 4u;
    -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "presenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "finalPresentedFrameOfViewForPreview");
LABEL_9:
        self->_sourceViewFinalPresentationFrame.origin.x = v5;
        self->_sourceViewFinalPresentationFrame.origin.y = v6;
        self->_sourceViewFinalPresentationFrame.size.width = v7;
        self->_sourceViewFinalPresentationFrame.size.height = v8;

        goto LABEL_10;
      }
    }
    else
    {
      v4 = 0;
    }
    -[PLExpandedPlatterPresentationController _sourceViewInitialPresentationFrame](self, "_sourceViewInitialPresentationFrame");
    goto LABEL_9;
  }
LABEL_10:
  x = self->_sourceViewFinalPresentationFrame.origin.x;
  y = self->_sourceViewFinalPresentationFrame.origin.y;
  width = self->_sourceViewFinalPresentationFrame.size.width;
  height = self->_sourceViewFinalPresentationFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)_sourceViewFinalDismissalFrame
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if ((*(_BYTE *)&self->_expandedPlatterPresentationControllerHelperFlags & 8) == 0)
  {
    *(_BYTE *)&self->_expandedPlatterPresentationControllerHelperFlags |= 8u;
    -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "presenter");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v4, "finalDismissedFrameOfViewForPreview");
LABEL_9:
        self->_sourceViewFinalDismissalFrame.origin.x = v5;
        self->_sourceViewFinalDismissalFrame.origin.y = v6;
        self->_sourceViewFinalDismissalFrame.size.width = v7;
        self->_sourceViewFinalDismissalFrame.size.height = v8;

        goto LABEL_10;
      }
    }
    else
    {
      v4 = 0;
    }
    -[PLExpandedPlatterPresentationController _sourceViewFinalPresentationFrame](self, "_sourceViewFinalPresentationFrame");
    goto LABEL_9;
  }
LABEL_10:
  x = self->_sourceViewFinalDismissalFrame.origin.x;
  y = self->_sourceViewFinalDismissalFrame.origin.y;
  width = self->_sourceViewFinalDismissalFrame.size.width;
  height = self->_sourceViewFinalDismissalFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)initialFrameOfPresentedViewInContainerView
{
  double x;
  double y;
  double width;
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
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
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGRect v43;
  CGRect result;

  -[PLExpandedPlatterPresentationController _sourceViewInitialPresentationFrame](self, "_sourceViewInitialPresentationFrame");
  x = v43.origin.x;
  y = v43.origin.y;
  width = v43.size.width;
  height = v43.size.height;
  if (CGRectIsEmpty(v43))
  {
    -[PLExpandedPlatterPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    -[PLExpandedPlatterPresentationController _presentedExpandedPlatter](self, "_presentedExpandedPlatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "superview");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "convertRect:fromView:", 0, x, y, width, height);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    objc_msgSend(v15, "frameForPlatterFrame:", v18, v20, v22, v24);
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v32 = v31;
    -[PLExpandedPlatterPresentationController containerView](self, "containerView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "superview");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "convertRect:fromView:", v34, v26, v28, v30, v32);
    v8 = v35;
    v10 = v36;
    v12 = v37;
    v14 = v38;

  }
  v39 = v8;
  v40 = v10;
  v41 = v12;
  v42 = v14;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (CGRect)finalPresentationFrameOfPresentingViewInContainerView
{
  void *v3;
  double v4;
  double v5;
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
  CGRect result;

  -[PLExpandedPlatterPresentationController _presentedExpandedPlatter](self, "_presentedExpandedPlatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLExpandedPlatterPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
  objc_msgSend(v3, "platterFrameForFrame:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)finalDismissalFrameOfPresentingViewInContainerView
{
  void *v3;
  double v4;
  double v5;
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
  CGRect result;

  -[PLExpandedPlatterPresentationController containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLExpandedPlatterPresentationController _sourceViewFinalDismissalFrame](self, "_sourceViewFinalDismissalFrame");
  objc_msgSend(v3, "convertRect:fromView:", 0);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_keyboardWillShow_, *MEMORY[0x1E0CEB978], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_keyboardWillHide_, *MEMORY[0x1E0CEB970], 0);

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__PLExpandedPlatterPresentationController_presentationTransitionWillBegin__block_invoke;
  v7[3] = &unk_1E91D3160;
  v7[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "performWithoutAnimation:", v7);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA88]), "initWithTarget:action:", self, sel__handleBackgroundTap_);
  -[PLExpandedPlatterPresentationController containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addGestureRecognizer:", v5);

}

void __74__PLExpandedPlatterPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "containerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "presentedView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addSubview:", v3);

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_peripheryInsets");
  v6 = v5;

  if (v6 > 0.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_presentedExpandedPlatter");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setContentBottomInset:", v6);

  }
}

- (void)dismissalTransitionWillBegin
{
  -[PLExpandedPlatterPresentationController _setHomeAffordanceVisible:](self, "_setHomeAffordanceVisible:", 0);
}

- (void)containerViewWillLayoutSubviews
{
  void *v3;
  char v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
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
  double v25;
  CGFloat v26;
  MTLumaDodgePillView *homeAffordanceView;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBeingDismissed");

  if ((v4 & 1) == 0)
  {
    -[PLExpandedPlatterPresentationController presentedView](self, "presentedView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLExpandedPlatterPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
    PLSetViewFrameMaintainingTransform(v5, v6, v7, v8, v9);

  }
  if (-[PLExpandedPlatterPresentationController isHomeAffordanceVisible](self, "isHomeAffordanceVisible"))
  {
    -[PLExpandedPlatterPresentationController containerView](self, "containerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v28.origin.x = v12;
    v28.origin.y = v14;
    v28.size.width = v16;
    v28.size.height = v18;
    -[MTLumaDodgePillView suggestedSizeForContentWidth:](self->_homeAffordanceView, "suggestedSizeForContentWidth:", CGRectGetWidth(v28));
    BSRectWithSize();
    UIRectCenteredXInRect();
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    v29.origin.x = v12;
    v29.origin.y = v14;
    v29.size.width = v16;
    v29.size.height = v18;
    CGRectGetMaxY(v29);
    v30.origin.x = v20;
    v30.origin.y = v22;
    v30.size.width = v24;
    v30.size.height = v26;
    CGRectGetHeight(v30);
    -[MTLumaDodgePillView suggestedEdgeSpacing](self->_homeAffordanceView, "suggestedEdgeSpacing");
    homeAffordanceView = self->_homeAffordanceView;
    PLMainScreenScale();
    UIRectIntegralWithScale();
    -[MTLumaDodgePillView setFrame:](homeAffordanceView, "setFrame:");
  }
}

- (BOOL)_shouldMakePresentedViewControllerFirstResponder
{
  return 0;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  id v5;
  double width;
  double height;
  double v8;
  double v9;
  unint64_t WeakRetained;
  unint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void (**v27)(_QWORD);
  id v28;
  void (**v29)(_QWORD, _QWORD);
  void *v30;
  void *v31;
  double v32;
  double v33;
  _QWORD v34[4];
  void (**v35)(_QWORD);
  _QWORD v36[4];
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  double v41;
  double v42;
  id location[2];

  v4 = a3;
  -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
    goto LABEL_21;
  width = self->_childPreferredContentSize.width;
  height = self->_childPreferredContentSize.height;
  objc_msgSend(v4, "preferredContentSize");
  self->_childPreferredContentSize.width = v9;
  self->_childPreferredContentSize.height = v8;
  if (width == v9 && height == v8)
    goto LABEL_21;
  WeakRetained = (unint64_t)objc_loadWeakRetained((id *)&self->_activeTransitionCoordinator);
  if (WeakRetained)
  {
    v12 = 0;
  }
  else
  {
    v12 = (unint64_t)objc_alloc_init(MEMORY[0x1E0CEAF60]);
    objc_msgSend((id)v12, "_setIsAnimated:", 1);
    objc_msgSend((id)v12, "_setDuration:", 0.25);
  }
  -[PLExpandedPlatterPresentationController containerView](self, "containerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "bounds");
    v16 = v15;
    v18 = v17;
    if (!v12)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bounds");
  v16 = v32;
  v18 = v33;

  if (v12)
  {
LABEL_11:
    -[PLExpandedPlatterPresentationController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v4, v16, v18);
    v20 = v19;
    v22 = v21;
    objc_msgSend((id)v12, "_transitionCoordinator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewWillTransitionToSize:withTransitionCoordinator:", v23, v20, v22);

  }
LABEL_12:
  objc_initWeak(location, self);
  v24 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __97__PLExpandedPlatterPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
  v38[3] = &unk_1E91D3200;
  v38[4] = self;
  v25 = v14;
  v39 = v25;
  v41 = v16;
  v42 = v18;
  v26 = (id)v12;
  v40 = v26;
  v27 = (void (**)(_QWORD))MEMORY[0x1D17E5ED8](v38);
  v36[0] = v24;
  v36[1] = 3221225472;
  v36[2] = __97__PLExpandedPlatterPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2;
  v36[3] = &unk_1E91D31D8;
  v28 = v26;
  v37 = v28;
  v29 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5ED8](v36);
  if (v14 && WeakRetained | v12)
  {
    if (v12)
    {
      v30 = (void *)MEMORY[0x1E0CEABB0];
      objc_msgSend(v28, "_duration");
      objc_msgSend(v30, "animateWithDuration:delay:options:animations:completion:", 4, v27, v29);
    }
    else
    {
      v34[0] = v24;
      v34[1] = 3221225472;
      v34[2] = __97__PLExpandedPlatterPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3;
      v34[3] = &unk_1E91D3228;
      v35 = v27;
      objc_msgSend((id)WeakRetained, "animateAlongsideTransition:completion:", v34, 0);

    }
  }
  else
  {
    v27[2](v27);
    v29[2](v29, 1);
  }

  objc_destroyWeak(location);
LABEL_21:

}

void __97__PLExpandedPlatterPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(id *a1)
{
  id v2;
  double v3;
  double v4;
  double v5;
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
  void *v23;
  void *v24;
  id v25;
  CGRect v26;

  v25 = a1[4];
  objc_msgSend(a1[5], "setNeedsLayout");
  objc_msgSend(a1[5], "layoutIfNeeded");
  objc_msgSend(v25, "_keyboardFrame");
  if (!CGRectIsEmpty(v26))
  {
    v2 = a1[4];
    BSRectWithSize();
    objc_msgSend(v2, "_frameOfPresentedViewInContainerViewWithBounds:");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    BSRectWithSize();
    objc_msgSend(v25, "_contentInsetWithPresentedFrame:inContainerViewWithBounds:", v4, v6, v8, v10, v11, v12, v13, v14);
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    objc_msgSend(v25, "_presentedExpandedPlatter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scrollView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setContentInset:", v16, v18, v20, v22);
    objc_msgSend(v25, "_contentOffsetForPresentedExpandedPlatterView:", v23);
    objc_msgSend(v24, "setContentOffset:");

  }
  objc_msgSend(a1[6], "__runAlongsideAnimations");

}

uint64_t __97__PLExpandedPlatterPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

uint64_t __97__PLExpandedPlatterPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  id location;
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PLExpandedPlatterPresentationController;
  -[PLExpandedPlatterPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_storeWeak((id *)&self->_activeTransitionCoordinator, v7);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __94__PLExpandedPlatterPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E91D3250;
  v8[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v8);
  objc_destroyWeak(&location);

}

_QWORD *__94__PLExpandedPlatterPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (v1)
    return objc_storeWeak((id *)(v1 + 512), 0);
  return result;
}

- (void)viewControllerAnimator:(id)a3 willBeginPresentationAnimationWithTransitionContext:(id)a4
{
  id v6;
  id v7;
  double v8;
  dispatch_time_t v9;
  _QWORD v10[4];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[PLExpandedPlatterPresentationController isHomeAffordanceVisible](self, "isHomeAffordanceVisible"))
  {
    objc_initWeak(&location, self);
    objc_msgSend(v6, "transitionDuration:", v7);
    v9 = dispatch_time(0, (uint64_t)((double)(uint64_t)(v8 * 1000000000.0) * 0.25));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __118__PLExpandedPlatterPresentationController_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke;
    v10[3] = &unk_1E91D3278;
    objc_copyWeak(&v11, &location);
    dispatch_after(v9, MEMORY[0x1E0C80D38], v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __118__PLExpandedPlatterPresentationController_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_setHomeAffordanceVisible:", 1);

}

- (void)keyboardWillShow:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  id v48;
  void *v49;
  void *v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  id v56[9];
  id location;

  v4 = a3;
  if (self->_listenToKeyboardEvents
    || (-[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "_containsFirstResponder"),
        v5,
        v6))
  {
    self->_listenToKeyboardEvents = 1;
    -[PLExpandedPlatterPresentationController presentedView](self, "presentedView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "window");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CEB890]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "CGRectValue");
    objc_msgSend((id)v8, "convertRect:fromWindow:", 0);
    self->_keyboardFrame.origin.x = v11;
    self->_keyboardFrame.origin.y = v12;
    self->_keyboardFrame.size.width = v13;
    self->_keyboardFrame.size.height = v14;

    self->_keyboardFrame.size.height = self->_keyboardFrame.size.height + 8.0;
    self->_keyboardFrame.origin.y = self->_keyboardFrame.origin.y + -8.0;
    -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v15, "isBeingDismissed");

    if ((v8 & 1) == 0)
    {
      -[PLExpandedPlatterPresentationController _setLocalHomeAffordanceVisible:](self, "_setLocalHomeAffordanceVisible:", 0);
      -[PLExpandedPlatterPresentationController frameOfPresentedViewInContainerView](self, "frameOfPresentedViewInContainerView");
      v17 = v16;
      v19 = v18;
      v21 = v20;
      v23 = v22;
      -[PLExpandedPlatterPresentationController containerView](self, "containerView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "bounds");
      -[PLExpandedPlatterPresentationController _contentInsetWithPresentedFrame:inContainerViewWithBounds:](self, "_contentInsetWithPresentedFrame:inContainerViewWithBounds:", *(double *)&v17, *(double *)&v19, *(double *)&v21, *(double *)&v23, v25, v26, v27, v28);
      v49 = v30;
      v50 = v29;
      v32 = v31;
      v34 = v33;

      objc_msgSend(v4, "userInfo");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKey:", *MEMORY[0x1E0CEB7F0]);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "doubleValue");
      v38 = v37;

      objc_msgSend(v4, "userInfo");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "objectForKey:", *MEMORY[0x1E0CEB7E8]);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "unsignedIntegerValue");

      -[PLExpandedPlatterPresentationController _presentedExpandedPlatter](self, "_presentedExpandedPlatter");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "scrollView");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v44 = (void *)MEMORY[0x1E0CEABB0];
      v45 = PLViewAnimationOptionsForAnimationCurve(v41);
      if (v38 == 0.0)
        v38 = 0.25;
      v46 = MEMORY[0x1E0C809B0];
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __60__PLExpandedPlatterPresentationController_keyboardWillShow___block_invoke;
      v53[3] = &unk_1E91D32A0;
      objc_copyWeak(v56, &location);
      v56[1] = v17;
      v56[2] = v19;
      v56[3] = v21;
      v56[4] = v23;
      v47 = v42;
      v54 = v47;
      v48 = v43;
      v55 = v48;
      v56[5] = v50;
      v56[6] = v49;
      v56[7] = v32;
      v56[8] = v34;
      v51[0] = v46;
      v51[1] = 3221225472;
      v51[2] = __60__PLExpandedPlatterPresentationController_keyboardWillShow___block_invoke_2;
      v51[3] = &unk_1E91D32C8;
      objc_copyWeak(&v52, &location);
      v51[4] = self;
      objc_msgSend(v44, "animateWithDuration:delay:options:animations:completion:", v45, v53, v51, v38, 0.0);
      objc_destroyWeak(&v52);

      objc_destroyWeak(v56);
      objc_destroyWeak(&location);

    }
  }

}

void __60__PLExpandedPlatterPresentationController_keyboardWillShow___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "presentedView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  objc_msgSend(*(id *)(a1 + 32), "setActionsHidden:", 1);
  objc_msgSend(*(id *)(a1 + 40), "setContentInset:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  objc_msgSend(WeakRetained, "_contentOffsetForPresentedExpandedPlatterView:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "setContentOffset:");

}

void __60__PLExpandedPlatterPresentationController_keyboardWillShow___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL IsEmpty;
  id WeakRetained;
  CGRect v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isBeingDismissed") & 1) != 0
    || !objc_msgSend(WeakRetained, "isHomeAffordanceVisible"))
  {
    goto LABEL_5;
  }
  objc_msgSend(WeakRetained, "_keyboardHomeAffordance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_5:
    goto LABEL_6;
  }
  objc_msgSend(WeakRetained, "_keyboardFrame");
  IsEmpty = CGRectIsEmpty(v6);

  if (!IsEmpty)
    objc_msgSend(*(id *)(a1 + 32), "_setKeyboardHomeAffordanceVisible:", 1);
LABEL_6:

}

- (void)keyboardWillHide:(id)a3
{
  id v4;
  CGSize v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;

  v4 = a3;
  if (self->_listenToKeyboardEvents)
  {
    v5 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    self->_keyboardFrame.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    self->_keyboardFrame.size = v5;
    -[PLExpandedPlatterPresentationController presentedViewController](self, "presentedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isBeingDismissed");

    if ((v7 & 1) == 0)
    {
      -[PLExpandedPlatterPresentationController _setKeyboardHomeAffordanceVisible:](self, "_setKeyboardHomeAffordanceVisible:", 0);
      objc_msgSend(v4, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0CEB7F0]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      v11 = v10;

      objc_msgSend(v4, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CEB7E8]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");

      objc_initWeak(&location, self);
      v15 = (void *)MEMORY[0x1E0CEABB0];
      v16 = PLViewAnimationOptionsForAnimationCurve(v14);
      if (v11 == 0.0)
        v11 = 0.25;
      v17 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __60__PLExpandedPlatterPresentationController_keyboardWillHide___block_invoke;
      v20[3] = &unk_1E91D3278;
      objc_copyWeak(&v21, &location);
      v18[0] = v17;
      v18[1] = 3221225472;
      v18[2] = __60__PLExpandedPlatterPresentationController_keyboardWillHide___block_invoke_2;
      v18[3] = &unk_1E91D32F0;
      objc_copyWeak(&v19, &location);
      objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", v16, v20, v18, v11, 0.0);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }

}

void __60__PLExpandedPlatterPresentationController_keyboardWillHide___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentedView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "frameOfPresentedViewInContainerView");
  objc_msgSend(v1, "setFrame:");

  objc_msgSend(WeakRetained, "_presentedExpandedPlatter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentInset:", *MEMORY[0x1E0CEB4B0], *(double *)(MEMORY[0x1E0CEB4B0] + 8), *(double *)(MEMORY[0x1E0CEB4B0] + 16), *(double *)(MEMORY[0x1E0CEB4B0] + 24));

  objc_msgSend(v2, "setActionsHidden:", 0);
  objc_msgSend(v2, "setNeedsLayout");

}

void __60__PLExpandedPlatterPresentationController_keyboardWillHide___block_invoke_2(uint64_t a1)
{
  void *v1;
  _BOOL4 IsEmpty;
  id WeakRetained;
  CGRect v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentedViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isBeingDismissed") & 1) != 0
    || !objc_msgSend(WeakRetained, "isHomeAffordanceVisible"))
  {

  }
  else
  {
    objc_msgSend(WeakRetained, "_keyboardFrame");
    IsEmpty = CGRectIsEmpty(v4);

    if (IsEmpty)
      objc_msgSend(WeakRetained, "_setLocalHomeAffordanceVisible:", 1);
  }

}

- (PLExpandedPlatterPresentationControllerDelegate)presentationControllerDelegate
{
  return (PLExpandedPlatterPresentationControllerDelegate *)objc_loadWeakRetained((id *)&self->_presentationControllerDelegate);
}

- (void)setPresentationControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_presentationControllerDelegate, a3);
}

- (BOOL)isHomeAffordanceVisible
{
  return self->_homeAffordanceVisible;
}

- (UIPanGestureRecognizer)homeAffordancePanGesture
{
  return self->_homeAffordancePanGesture;
}

- (double)additionalHomeAffordanceSpacing
{
  return self->_additionalHomeAffordanceSpacing;
}

- (CGPoint)additionalContentTranslation
{
  double x;
  double y;
  CGPoint result;

  x = self->_additionalContentTranslation.x;
  y = self->_additionalContentTranslation.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGRect)_keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrame.origin.x;
  y = self->_keyboardFrame.origin.y;
  width = self->_keyboardFrame.size.width;
  height = self->_keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (PLKeyboardHomeAffordanceAssertion)_keyboardHomeAffordance
{
  return self->_keyboardHomeAffordance;
}

- (void)_setKeyboardHomeAffordance:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardHomeAffordance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardHomeAffordance, 0);
  objc_storeStrong((id *)&self->_homeAffordancePanGesture, 0);
  objc_destroyWeak((id *)&self->_presentationControllerDelegate);
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_homeAffordanceFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_dismissFeedbackBehavior, 0);
  objc_storeStrong((id *)&self->_dismissLabel, 0);
  objc_storeStrong((id *)&self->_dismissLabelContainerView, 0);
  objc_destroyWeak((id *)&self->_activeTransitionCoordinator);
  objc_destroyWeak((id *)&self->_presentedExpandedPlatter);
  objc_destroyWeak((id *)&self->_sourceView);
}

+ (CGSize)_sizeOfViewWithPreferredContentSize:(CGSize)a3 inUseableContainerViewBounds:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;
  CGRect v15;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.height;
  v9 = a3.width;
  v10 = CGRectGetWidth(a4);
  if (v9 > v10)
    v9 = v10;
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v11 = CGRectGetHeight(v15);
  if (v8 <= v11)
    v12 = v8;
  else
    v12 = v11;
  v13 = v9;
  result.height = v12;
  result.width = v13;
  return result;
}

@end
