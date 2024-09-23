@implementation TUISystemInputAssistantLayoutFloat

- (TUISystemInputAssistantLayoutFloat)init
{
  TUISystemInputAssistantLayoutFloat *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUISystemInputAssistantLayoutFloat;
  result = -[TUISystemInputAssistantLayoutFloat init](&v3, sel_init);
  if (result)
    result->_centerViewCenterConstraint = (NSLayoutConstraint *)8;
  return result;
}

- (void)updatePostionForRectEdge:(unint64_t)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  if (a3 == 4)
  {
    -[TUISystemInputAssistantLayoutFloat centerViewCenterConstraint](self, "centerViewCenterConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isActive");

    if ((v10 & 1) == 0)
    {
      -[TUISystemInputAssistantLayoutFloat containerLeadingHorizontalPosition](self, "containerLeadingHorizontalPosition");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setActive:", 0);

      -[TUISystemInputAssistantLayoutFloat containerTrailingHorizontalPosition](self, "containerTrailingHorizontalPosition");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setActive:", 0);

      -[TUISystemInputAssistantLayoutFloat centerViewCenterConstraint](self, "centerViewCenterConstraint");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
  else if (a3 == 8)
  {
    -[TUISystemInputAssistantLayoutFloat containerTrailingHorizontalPosition](self, "containerTrailingHorizontalPosition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isActive");

    if ((v5 & 1) == 0)
    {
      -[TUISystemInputAssistantLayoutFloat containerLeadingHorizontalPosition](self, "containerLeadingHorizontalPosition");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setActive:", 0);

      -[TUISystemInputAssistantLayoutFloat centerViewCenterConstraint](self, "centerViewCenterConstraint");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setActive:", 0);

      -[TUISystemInputAssistantLayoutFloat containerTrailingHorizontalPosition](self, "containerTrailingHorizontalPosition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
      v17 = v8;
      objc_msgSend(v8, "setActive:", 1);

    }
  }
  else
  {
    -[TUISystemInputAssistantLayoutFloat containerLeadingHorizontalPosition](self, "containerLeadingHorizontalPosition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isActive");

    if ((v14 & 1) == 0)
    {
      -[TUISystemInputAssistantLayoutFloat containerTrailingHorizontalPosition](self, "containerTrailingHorizontalPosition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setActive:", 0);

      -[TUISystemInputAssistantLayoutFloat centerViewCenterConstraint](self, "centerViewCenterConstraint");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setActive:", 0);

      -[TUISystemInputAssistantLayoutFloat containerLeadingHorizontalPosition](self, "containerLeadingHorizontalPosition");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
  }
}

- (void)setCurrentRectEdge:(unint64_t)a3
{
  void *v5;

  -[TUISystemInputAssistantLayoutFloat containerLeadingHorizontalPosition](self, "containerLeadingHorizontalPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[TUISystemInputAssistantLayoutFloat updatePostionForRectEdge:](self, "updatePostionForRectEdge:", a3);
  self->_centerViewCenterConstraint = (NSLayoutConstraint *)a3;
}

- (void)trackHorizontalMovement:(CGPoint)a3
{
  double x;
  id v4;

  x = a3.x;
  -[TUISystemInputAssistantLayoutFloat containerLeadingHorizontalPosition](self, "containerLeadingHorizontalPosition", a3.x, a3.y);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setConstant:", x);

}

- (void)configureButtonBarsInViewSet:(id)a3 forApplicationAssistantItem:(id)a4 withSystemAssistantItem:(id)a5 withAssistantView:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  objc_super v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((objc_msgSend(v13, "showsCenterView") & 1) != 0 || (objc_msgSend(v13, "isInputAssistantItemHidden") & 1) != 0)
  {
    objc_msgSend(v10, "leftButtonBar");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "effectiveUserInterfaceLayoutDirection");

    if (v15 == 1)
    {
      v16 = (id)objc_opt_new();
      objc_msgSend(v12, "trailingBarButtonGroups");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setLeadingBarButtonGroups:", v17);

      objc_msgSend(v12, "leadingBarButtonGroups");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTrailingBarButtonGroups:", v18);

    }
    else
    {
      v16 = v12;
    }
    v28.receiver = self;
    v28.super_class = (Class)TUISystemInputAssistantLayoutFloat;
    -[TUISystemInputAssistantLayoutStandard configureButtonBarsInViewSet:forApplicationAssistantItem:withSystemAssistantItem:withAssistantView:](&v28, sel_configureButtonBarsInViewSet_forApplicationAssistantItem_withSystemAssistantItem_withAssistantView_, v10, v11, v16, v13);

  }
  else
  {
    -[TUISystemInputAssistantLayoutFloat _buttonBarGroupSetForApplicationAssistantItem:withSystemInputAssistantItem:forAssistantView:](self, "_buttonBarGroupSetForApplicationAssistantItem:withSystemInputAssistantItem:forAssistantView:", v11, v12, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "leftButtonBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unifiedButtonGroups");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setButtonGroups:animated:", v21, objc_msgSend(v13, "isTransitioning"));

    objc_msgSend(v10, "leftButtonBar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "unifiedSeparators");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setSeparatorGroups:", v23);

    objc_msgSend(v10, "rightButtonBar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v13, "isTransitioning");
    v26 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v24, "setButtonGroups:animated:", MEMORY[0x1E0C9AA60], v25);

    objc_msgSend(v10, "rightButtonBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setSeparatorGroups:", v26);

  }
}

- (void)_layoutViewSet:(id)a3 forFixedCenterViewWidth:(double)a4 inBounds:(CGRect)a5 forAssistantView:(id)a6
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  double (**v15)(void *, void *, double, double);
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
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  int v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
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
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  double v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  void *v76;
  CGFloat v77;
  _QWORD aBlock[8];
  CGRect v79;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v14 = a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__TUISystemInputAssistantLayoutFloat__layoutViewSet_forFixedCenterViewWidth_inBounds_forAssistantView___block_invoke;
  aBlock[3] = &__block_descriptor_64_e41_d32__0__TUIAssistantButtonBarView_8d16d24l;
  *(CGFloat *)&aBlock[4] = x;
  *(CGFloat *)&aBlock[5] = y;
  *(CGFloat *)&aBlock[6] = width;
  *(double *)&aBlock[7] = height;
  v15 = (double (**)(void *, void *, double, double))_Block_copy(aBlock);
  UIRectRoundToScale();
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v14, "updateContainerConstraintsForFloating");
  objc_msgSend(v14, "containerLeading");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantLayoutFloat setContainerLeadingHorizontalPosition:](self, "setContainerLeadingHorizontalPosition:", v24);

  objc_msgSend(v14, "containerTrailing");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantLayoutFloat setContainerTrailingHorizontalPosition:](self, "setContainerTrailingHorizontalPosition:", v25);

  objc_msgSend(v14, "containerCenter");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantLayoutFloat setCenterViewCenterConstraint:](self, "setCenterViewCenterConstraint:", v26);

  if ((objc_msgSend(v14, "showsCenterView") & 1) == 0 && objc_msgSend(v14, "isInputAssistantItemHidden"))
  {
    if (objc_msgSend(v14, "showsButtonBarItemsInline"))
    {
      objc_msgSend(v13, "leftButtonBar");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "intrinsicContentSize");
      v29 = v28;

      objc_msgSend(v13, "rightButtonBar");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "intrinsicContentSize");
      v32 = v31;

      objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "inputDelegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "textInputView");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "_shouldReverseLayoutDirection");

      objc_msgSend(v13, "leftButtonBar");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setFrame:", 0.0, 0.0, v29, v23);

      objc_msgSend(v13, "rightButtonBar");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setFrame:", v29 + 0.0, 0.0, v32, v23);

    }
    v38 = -[TUISystemInputAssistantLayoutFloat currentRectEdge](self, "currentRectEdge");
    -[TUISystemInputAssistantLayoutFloat centerViewCenterConstraint](self, "centerViewCenterConstraint");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "isActive");

    if (v40)
    {
      -[TUISystemInputAssistantLayoutFloat setCurrentRectEdge:](self, "setCurrentRectEdge:", 0);
      -[TUISystemInputAssistantLayoutFloat setCurrentRectEdge:](self, "setCurrentRectEdge:", v38);
    }
    goto LABEL_24;
  }
  if ((objc_msgSend(v14, "showsCenterView") & 1) == 0)
  {
    if (objc_msgSend(v14, "showsButtonBarItemsInline"))
    {
      objc_msgSend(v13, "leftButtonBar");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "intrinsicContentSize");
      v49 = v48;
      objc_msgSend(v13, "rightButtonBar");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "intrinsicContentSize");
      v52 = v49 + v51;

      if (v52 > v21 + -32.0)
      {
        objc_msgSend(v13, "leftButtonBar");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "collapsedSizeThatFits:", v21 + -32.0, height);
        v55 = v54;
        objc_msgSend(v13, "rightButtonBar");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "collapsedSizeThatFits:", v21 + -32.0, height);
        v52 = v55 + v57;

      }
      objc_msgSend(v13, "leftButtonBar");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "setFrame:", 0.0, 0.0, v52, v23);

      objc_msgSend(v13, "rightButtonBar");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setFrame:", v52 + 0.0, 0.0, 0.0, v23);

      -[TUISystemInputAssistantLayoutFloat setCurrentRectEdge:](self, "setCurrentRectEdge:", 4);
      objc_msgSend(v13, "centerView");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v60;
      v62 = v17;
      v63 = v19;
      v64 = v21;
      v65 = v23;
      goto LABEL_22;
    }
LABEL_24:
    objc_msgSend(v13, "centerView");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v76, "setFrame:", v17, v19, v21, v23);

    -[TUISystemInputAssistantLayoutFloat updatePostionForRectEdge:](self, "updatePostionForRectEdge:", -[TUISystemInputAssistantLayoutFloat currentRectEdge](self, "currentRectEdge"));
    goto LABEL_25;
  }
  if (a4 <= 0.0)
  {
    v44 = v23;
    v45 = v21;
  }
  else
  {
    UIRectCenteredRect();
    v17 = v41;
    v19 = v42;
    v44 = v43;
    v45 = v21 - a4;
    v21 = v46;
  }
  if (!objc_msgSend(v14, "showsButtonBarItemsInline"))
  {
    v23 = v44;
    goto LABEL_24;
  }
  objc_msgSend(v13, "leftButtonBar");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v15[2](v15, v66, 214.0, v45 * 0.5 + -16.0);

  v68 = 4.0;
  v77 = v21;
  if (v67 == 0.0)
    v69 = 4.0;
  else
    v69 = 10.0;
  objc_msgSend(v13, "rightButtonBar");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v15[2](v15, v70, 214.0, v45 * 0.5 + -16.0);

  if (v71 != 0.0)
    v68 = 10.0;
  objc_msgSend(v13, "leftButtonBar");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setFrame:", 0.0, 0.0, v67, v23);

  v73 = v67 + v69;
  v79.origin.x = v67 + v69;
  v79.origin.y = v19;
  v79.size.width = v77;
  v79.size.height = v44;
  v74 = v68 + CGRectGetMaxX(v79);
  objc_msgSend(v13, "rightButtonBar");
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v75, "setFrame:", v74, 0.0, v71, v23);

  -[TUISystemInputAssistantLayoutFloat updatePostionForRectEdge:](self, "updatePostionForRectEdge:", 4);
  objc_msgSend(v13, "centerView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v60;
  v62 = v73;
  v63 = v19;
  v64 = v77;
  v65 = v44;
LABEL_22:
  objc_msgSend(v60, "setFrame:", v62, v63, v64, v65);

LABEL_25:
}

- (id)_buttonBarGroupSetForApplicationAssistantItem:(id)a3 withSystemInputAssistantItem:(id)a4 forAssistantView:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  TUIButtonBarGroupSet *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  _QWORD v56[2];

  v56[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "leadingBarButtonGroups");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  v12 = (void *)MEMORY[0x1E0C9AA60];
  if (v10)
    v13 = (void *)v10;
  else
    v13 = (void *)MEMORY[0x1E0C9AA60];
  v14 = v13;

  objc_msgSend(v9, "trailingBarButtonGroups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = v15;
  else
    v16 = v12;
  v51 = v16;

  objc_msgSend(v8, "leadingBarButtonGroups");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (v17)
    v19 = (void *)v17;
  else
    v19 = v12;
  v52 = v19;

  objc_msgSend(v8, "trailingBarButtonGroups");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    v21 = v20;
  else
    v21 = v12;
  v22 = v21;

  v23 = objc_alloc_init(TUIButtonBarGroupSet);
  v24 = objc_alloc(MEMORY[0x1E0DC3500]);
  +[TUIAssistantSeparatorView barButtonItem](TUIAssistantSeparatorView, "barButtonItem");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v56, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v24, "initWithBarButtonItems:representativeItem:", v26, 0);

  v28 = v14;
  v29 = objc_alloc(MEMORY[0x1E0DC3500]);
  +[TUIAssistantSeparatorView barButtonItem](TUIAssistantSeparatorView, "barButtonItem");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v30;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v29, "initWithBarButtonItems:representativeItem:", v31, 0);

  LOBYTE(v31) = objc_msgSend(v7, "showsCenterView");
  v33 = (void *)MEMORY[0x1E0C99DE8];
  v34 = objc_msgSend(v28, "count");
  if ((v31 & 1) != 0)
  {
    v35 = v52;
    objc_msgSend(v33, "arrayWithCapacity:", v34 + objc_msgSend(v52, "count") + 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObjectsFromArray:", v28);
    objc_msgSend(v36, "addObject:", v27);
    objc_msgSend(v36, "addObjectsFromArray:", v52);
    -[TUIButtonBarGroupSet setLeadingButtonGroups:](v23, "setLeadingButtonGroups:", v36);
    v54 = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
    v50 = v28;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIButtonBarGroupSet setLeadingSeparators:](v23, "setLeadingSeparators:", v37);

    v38 = v51;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v51, "count") + objc_msgSend(v22, "count") + 1);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObjectsFromArray:", v22);
    objc_msgSend(v39, "addObject:", v32);
    objc_msgSend(v39, "addObjectsFromArray:", v51);
    -[TUIButtonBarGroupSet setTrailingButtonGroups:](v23, "setTrailingButtonGroups:", v39);
    v53 = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIButtonBarGroupSet setTrailingSeparators:](v23, "setTrailingSeparators:", v40);

    v41 = v50;
  }
  else
  {
    v38 = v51;
    objc_msgSend(v33, "arrayWithCapacity:", v34 + objc_msgSend(v22, "count") + objc_msgSend(v51, "count") + objc_msgSend(v22, "count") + 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v52;
    if (objc_msgSend(v52, "count"))
    {
      objc_msgSend(v36, "addObjectsFromArray:", v52);
      objc_msgSend(v36, "addObject:", v27);
      objc_msgSend(v39, "addObject:", v27);
    }
    v41 = v28;
    objc_msgSend(v36, "addObjectsFromArray:", v28);
    objc_msgSend(v36, "addObjectsFromArray:", v51);
    if (objc_msgSend(v22, "count"))
    {
      objc_msgSend(v36, "addObject:", v32);
      objc_msgSend(v36, "addObjectsFromArray:", v22);
      objc_msgSend(v39, "addObject:", v32);
    }
    v42 = MEMORY[0x1E0C9AA60];
    -[TUIButtonBarGroupSet setLeadingButtonGroups:](v23, "setLeadingButtonGroups:", MEMORY[0x1E0C9AA60]);
    -[TUIButtonBarGroupSet setLeadingSeparators:](v23, "setLeadingSeparators:", v42);
    -[TUIButtonBarGroupSet setTrailingButtonGroups:](v23, "setTrailingButtonGroups:", v36);
    -[TUIButtonBarGroupSet setTrailingSeparators:](v23, "setTrailingSeparators:", v39);
  }

  -[TUIButtonBarGroupSet leadingButtonGroups](v23, "leadingButtonGroups");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIButtonBarGroupSet trailingButtonGroups](v23, "trailingButtonGroups");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "arrayByAddingObjectsFromArray:", v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIButtonBarGroupSet setUnifiedButtonGroups:](v23, "setUnifiedButtonGroups:", v45);

  -[TUIButtonBarGroupSet leadingSeparators](v23, "leadingSeparators");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIButtonBarGroupSet trailingSeparators](v23, "trailingSeparators");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "arrayByAddingObjectsFromArray:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIButtonBarGroupSet setUnifiedSeparators:](v23, "setUnifiedSeparators:", v48);

  return v23;
}

- (NSLayoutConstraint)containerLeadingHorizontalPosition
{
  return *(NSLayoutConstraint **)&self->super._rightSplitWidth;
}

- (void)setContainerLeadingHorizontalPosition:(id)a3
{
  objc_storeStrong((id *)&self->super._rightSplitWidth, a3);
}

- (NSLayoutConstraint)containerTrailingHorizontalPosition
{
  return self->_containerLeadingHorizontalPosition;
}

- (void)setContainerTrailingHorizontalPosition:(id)a3
{
  objc_storeStrong((id *)&self->_containerLeadingHorizontalPosition, a3);
}

- (NSLayoutConstraint)centerViewCenterConstraint
{
  return self->_containerTrailingHorizontalPosition;
}

- (void)setCenterViewCenterConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_containerTrailingHorizontalPosition, a3);
}

- (unint64_t)currentRectEdge
{
  return (unint64_t)self->_centerViewCenterConstraint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerTrailingHorizontalPosition, 0);
  objc_storeStrong((id *)&self->_containerLeadingHorizontalPosition, 0);
  objc_storeStrong((id *)&self->super._rightSplitWidth, 0);
}

double __103__TUISystemInputAssistantLayoutFloat__layoutViewSet_forFixedCenterViewWidth_inBounds_forAssistantView___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v7 = a2;
  v8 = v7;
  if (a3 >= a4)
    a3 = a4;
  v9 = 0.0;
  if (objc_msgSend(v7, "hasVisibleItem"))
  {
    objc_msgSend(v8, "intrinsicContentSize");
    v11 = v10;
    if (v10 > a3)
    {
      objc_msgSend(v8, "collapsedSizeThatFits:", a3, *(double *)(a1 + 56));
      v9 = v12;
      if (v12 < a3)
        goto LABEL_8;
      objc_msgSend(v8, "uncollapseAllGroups");
    }
    v9 = v11;
LABEL_8:
    if (v9 > a4)
    {
      objc_msgSend(v8, "sizeThatFits:", a4, *(double *)(a1 + 56));
      v9 = v13;
    }
  }

  return v9;
}

@end
