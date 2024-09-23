@implementation SLHighlightPillMarqueeView

- (SLHighlightPillMarqueeView)initWithFrame:(CGRect)a3 pillView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SLHighlightPillMarqueeView *v10;
  SLHighlightPillMarqueeView *v11;
  SLReplicatorView *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  objc_super v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v39.receiver = self;
  v39.super_class = (Class)SLHighlightPillMarqueeView;
  v10 = -[SLHighlightPillMarqueeView initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[SLHighlightPillMarqueeView setPillView:](v10, "setPillView:", v9);
    -[SLHighlightPillMarqueeView setTranslatesAutoresizingMaskIntoConstraints:](v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SLHighlightPillMarqueeView setMarqueeAnimationIsActive:](v11, "setMarqueeAnimationIsActive:", 0);
    -[SLHighlightPillMarqueeView setEndingPositionConstraintsShouldBeActive:](v11, "setEndingPositionConstraintsShouldBeActive:", 0);
    v12 = -[SLReplicatorView initWithFrame:targetView:]([SLReplicatorView alloc], "initWithFrame:targetView:", v9, x, y, width, height);
    -[SLHighlightPillMarqueeView setReplicatorView:](v11, "setReplicatorView:", v12);

    -[SLHighlightPillMarqueeView replicatorView](v11, "replicatorView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[SLHighlightPillMarqueeView replicatorView](v11, "replicatorView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillMarqueeView addSubview:](v11, "addSubview:", v14);

    v15 = (void *)MEMORY[0x1E0DC3870];
    SLFrameworkBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillMarqueeView traitCollection](v11, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("SLAttributionViewMarqueeMask"), v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "size");
    v20 = 1.0 / v19;
    objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillMarqueeView setMaskLayer:](v11, "setMaskLayer:", v21);

    v22 = objc_retainAutorelease(v18);
    v23 = objc_msgSend(v22, "CGImage");
    -[SLHighlightPillMarqueeView maskLayer](v11, "maskLayer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setContents:", v23);

    -[SLHighlightPillMarqueeView maskLayer](v11, "maskLayer");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setContentsCenter:", 0.5 - v20 * 0.5, 0.0, v20, 1.0);

    objc_msgSend(v22, "scale");
    v27 = v26;
    -[SLHighlightPillMarqueeView maskLayer](v11, "maskLayer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setContentsScale:", v27);

    -[SLHighlightPillMarqueeView bounds](v11, "bounds");
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v36 = v35;
    -[SLHighlightPillMarqueeView maskLayer](v11, "maskLayer");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);

  }
  return v11;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SLHighlightPillMarqueeView;
  -[SLHighlightPillMarqueeView layoutSubviews](&v12, sel_layoutSubviews);
  -[SLHighlightPillMarqueeView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SLHighlightPillMarqueeView maskLayer](self, "maskLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)setMarqueeEnabled:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;

  if (self->_marqueeEnabled != a3)
  {
    self->_marqueeEnabled = a3;
    -[SLHighlightPillMarqueeView updateConstraints](self, "updateConstraints");
    -[SLHighlightPillMarqueeView layoutIfNeeded](self, "layoutIfNeeded");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __48__SLHighlightPillMarqueeView_setMarqueeEnabled___block_invoke;
    v5[3] = &unk_1E3794310;
    v6 = a3;
    v5[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v5);
  }
}

uint64_t __48__SLHighlightPillMarqueeView_setMarqueeEnabled___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "maskLayer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMask:", v4);

    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    return objc_msgSend(*(id *)(a1 + 32), "_activateMarqueeAnimationIfNecessary");
  }
  else
  {
    objc_msgSend(v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMask:", 0);

    objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
    return objc_msgSend(*(id *)(a1 + 32), "_deactivateMarqueeAnimationIfNecessary");
  }
}

- (void)setMarqueeClippingWidth:(double)a3
{
  if (!SL_CGFloatApproximatelyEqualToFloat(a3, self->_marqueeClippingWidth))
  {
    self->_marqueeClippingWidth = a3;
    if (!-[SLHighlightPillMarqueeView marqueeAnimationIsActive](self, "marqueeAnimationIsActive"))
      -[SLHighlightPillMarqueeView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setReplicatedContentAlignment:(int64_t)a3
{
  if (self->_replicatedContentAlignment != a3)
  {
    self->_replicatedContentAlignment = a3;
    if (!-[SLHighlightPillMarqueeView marqueeAnimationIsActive](self, "marqueeAnimationIsActive"))
      -[SLHighlightPillMarqueeView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (void)setEndingPositionConstraintsShouldBeActive:(BOOL)a3
{
  if (self->_endingPositionConstraintsShouldBeActive != a3)
  {
    self->_endingPositionConstraintsShouldBeActive = a3;
    -[SLHighlightPillMarqueeView updateConstraints](self, "updateConstraints");
    -[SLHighlightPillMarqueeView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
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
  int v53;
  void *v54;
  void *v55;
  char v56;
  uint64_t v57;
  void *v58;
  int v59;
  void *v60;
  void *v61;
  char v62;
  void *v63;
  void *v64;
  char v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  objc_super v71;

  v71.receiver = self;
  v71.super_class = (Class)SLHighlightPillMarqueeView;
  -[SLHighlightPillMarqueeView updateConstraints](&v71, sel_updateConstraints);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightPillMarqueeView ourWidthConstraint](self, "ourWidthConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[SLHighlightPillMarqueeView ourWidthConstraint](self, "ourWidthConstraint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "constant");
    v8 = v7;
    -[SLHighlightPillMarqueeView marqueeClippingWidth](self, "marqueeClippingWidth");
    v10 = SL_CGFloatApproximatelyEqualToFloat(v8, v9);

    if (v10)
      goto LABEL_6;
    -[SLHighlightPillMarqueeView marqueeClippingWidth](self, "marqueeClippingWidth");
    v12 = v11;
    -[SLHighlightPillMarqueeView ourWidthConstraint](self, "ourWidthConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setConstant:", v12);
  }
  else
  {
    -[SLHighlightPillMarqueeView widthAnchor](self, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillMarqueeView marqueeClippingWidth](self, "marqueeClippingWidth");
    objc_msgSend(v14, "constraintEqualToConstant:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillMarqueeView setOurWidthConstraint:](self, "setOurWidthConstraint:", v15);

    -[SLHighlightPillMarqueeView ourWidthConstraint](self, "ourWidthConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);
  }

LABEL_6:
  -[SLHighlightPillMarqueeView ourHeightConstraint](self, "ourHeightConstraint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    -[SLHighlightPillMarqueeView heightAnchor](self, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillMarqueeView pillView](self, "pillView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "heightAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillMarqueeView setOurHeightConstraint:](self, "setOurHeightConstraint:", v20);

    -[SLHighlightPillMarqueeView ourHeightConstraint](self, "ourHeightConstraint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v21);

  }
  v22 = -[SLHighlightPillMarqueeView replicatedContentAlignment](self, "replicatedContentAlignment");
  if (v22 != 2)
  {
    if (v22 == 1 && !-[SLHighlightPillMarqueeView marqueeEnabled](self, "marqueeEnabled"))
    {
      -[SLHighlightPillMarqueeView centerXAnchor](self, "centerXAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[SLHighlightPillMarqueeView replicatorView](self, "replicatorView");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "centerXAnchor");
      v25 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (-[SLHighlightPillMarqueeView marqueeEnabled](self, "marqueeEnabled"))
  {
LABEL_13:
    -[SLHighlightPillMarqueeView leadingAnchor](self, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillMarqueeView replicatorView](self, "replicatorView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "leadingAnchor");
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  -[SLHighlightPillMarqueeView trailingAnchor](self, "trailingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightPillMarqueeView replicatorView](self, "replicatorView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "trailingAnchor");
  v25 = objc_claimAutoreleasedReturnValue();
LABEL_14:
  v26 = (void *)v25;

  -[SLHighlightPillMarqueeView replicatorViewStartingPositionXConstraint](self, "replicatorViewStartingPositionXConstraint");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[SLHighlightPillMarqueeView replicatorViewStartingPositionXConstraint](self, "replicatorViewStartingPositionXConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "firstAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30 == v26)
    {
      -[SLHighlightPillMarqueeView replicatorViewStartingPositionXConstraint](self, "replicatorViewStartingPositionXConstraint");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "secondAnchor");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32 == v23)
        goto LABEL_21;
    }
    else
    {

    }
  }
  -[SLHighlightPillMarqueeView replicatorViewStartingPositionXConstraint](self, "replicatorViewStartingPositionXConstraint");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isActive");

  if (v34)
  {
    -[SLHighlightPillMarqueeView replicatorViewStartingPositionXConstraint](self, "replicatorViewStartingPositionXConstraint");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v35);

  }
  objc_msgSend(v26, "constraintEqualToAnchor:", v23);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLHighlightPillMarqueeView setReplicatorViewStartingPositionXConstraint:](self, "setReplicatorViewStartingPositionXConstraint:", v36);

LABEL_21:
  -[SLHighlightPillMarqueeView replicatorViewEndingPositionXConstraint](self, "replicatorViewEndingPositionXConstraint");
  v37 = objc_claimAutoreleasedReturnValue();
  if (!v37)
    goto LABEL_23;
  v38 = (void *)v37;
  -[SLHighlightPillMarqueeView replicatorViewEndingPositionXConstraint](self, "replicatorViewEndingPositionXConstraint");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "firstAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40 != v23)
  {
LABEL_23:
    -[SLHighlightPillMarqueeView replicatorViewEndingPositionXConstraint](self, "replicatorViewEndingPositionXConstraint");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "isActive");

    if (v42)
    {
      -[SLHighlightPillMarqueeView replicatorViewEndingPositionXConstraint](self, "replicatorViewEndingPositionXConstraint");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v43);

    }
    -[SLHighlightPillMarqueeView pillView](self, "pillView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "trailingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "constraintEqualToAnchor:constant:", v45, 40.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillMarqueeView setReplicatorViewEndingPositionXConstraint:](self, "setReplicatorViewEndingPositionXConstraint:", v46);

  }
  -[SLHighlightPillMarqueeView replicatorViewYConstraint](self, "replicatorViewYConstraint");
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v47)
  {
    -[SLHighlightPillMarqueeView replicatorView](self, "replicatorView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillMarqueeView topAnchor](self, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLHighlightPillMarqueeView setReplicatorViewYConstraint:](self, "setReplicatorViewYConstraint:", v51);

  }
  if (-[SLHighlightPillMarqueeView endingPositionConstraintsShouldBeActive](self, "endingPositionConstraintsShouldBeActive"))
  {
    -[SLHighlightPillMarqueeView replicatorViewStartingPositionXConstraint](self, "replicatorViewStartingPositionXConstraint");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "isActive");

    if (v53)
    {
      -[SLHighlightPillMarqueeView replicatorViewStartingPositionXConstraint](self, "replicatorViewStartingPositionXConstraint");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v54);

    }
    -[SLHighlightPillMarqueeView replicatorViewEndingPositionXConstraint](self, "replicatorViewEndingPositionXConstraint");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "isActive");

    if ((v56 & 1) == 0)
    {
      -[SLHighlightPillMarqueeView replicatorViewEndingPositionXConstraint](self, "replicatorViewEndingPositionXConstraint");
      v57 = objc_claimAutoreleasedReturnValue();
LABEL_37:
      v63 = (void *)v57;
      objc_msgSend(v3, "addObject:", v57);

    }
  }
  else
  {
    -[SLHighlightPillMarqueeView replicatorViewEndingPositionXConstraint](self, "replicatorViewEndingPositionXConstraint");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "isActive");

    if (v59)
    {
      -[SLHighlightPillMarqueeView replicatorViewEndingPositionXConstraint](self, "replicatorViewEndingPositionXConstraint");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v60);

    }
    -[SLHighlightPillMarqueeView replicatorViewEndingPositionXConstraint](self, "replicatorViewEndingPositionXConstraint");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "isActive");

    if ((v62 & 1) == 0)
    {
      -[SLHighlightPillMarqueeView replicatorViewStartingPositionXConstraint](self, "replicatorViewStartingPositionXConstraint");
      v57 = objc_claimAutoreleasedReturnValue();
      goto LABEL_37;
    }
  }
  -[SLHighlightPillMarqueeView replicatorViewYConstraint](self, "replicatorViewYConstraint");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "isActive");

  if ((v65 & 1) == 0)
  {
    -[SLHighlightPillMarqueeView replicatorViewYConstraint](self, "replicatorViewYConstraint");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v66);

  }
  if (objc_msgSend(v4, "count"))
  {
    v67 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v4, "allObjects");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "deactivateConstraints:", v68);

  }
  if (objc_msgSend(v3, "count"))
  {
    v69 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v3, "allObjects");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "activateConstraints:", v70);

  }
}

- (void)_activateMarqueeAnimationIfNecessary
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  _QWORD v7[5];
  _QWORD v8[6];

  if (!-[SLHighlightPillMarqueeView marqueeAnimationIsActive](self, "marqueeAnimationIsActive"))
  {
    -[SLHighlightPillMarqueeView setMarqueeAnimationIsActive:](self, "setMarqueeAnimationIsActive:", 1);
    -[SLHighlightPillMarqueeView replicatorView](self, "replicatorView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "updateInstanceCount:replicationPaddingX:", 2, 40.0);

    -[SLHighlightPillMarqueeView pillView](self, "pillView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "frame");
    v6 = v5 / 45.0 + 2.0;

    v7[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke;
    v8[3] = &unk_1E3794338;
    v8[4] = self;
    *(double *)&v8[5] = v6;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke_4;
    v7[3] = &unk_1E3794760;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateKeyframesWithDuration:delay:options:animations:completion:", 13, v8, v7, v6, 0.0);
  }
}

uint64_t __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  _QWORD v5[5];
  _QWORD v6[5];

  v2 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke_2;
  v6[3] = &unk_1E3794360;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v6, 0.0, 0.0);
  v3 = *(double *)(a1 + 40);
  v5[0] = v2;
  v5[1] = 3221225472;
  v5[2] = __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke_3;
  v5[3] = &unk_1E3794360;
  v5[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "addKeyframeWithRelativeStartTime:relativeDuration:animations:", v5, 2.0 / v3, 1.0);
}

uint64_t __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEndingPositionConstraintsShouldBeActive:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateConstraints");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

uint64_t __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setEndingPositionConstraintsShouldBeActive:", 1);
}

uint64_t __66__SLHighlightPillMarqueeView__activateMarqueeAnimationIfNecessary__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEndingPositionConstraintsShouldBeActive:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setMarqueeAnimationIsActive:", 0);
}

- (void)_deactivateMarqueeAnimationIfNecessary
{
  void *v3;

  if (-[SLHighlightPillMarqueeView marqueeAnimationIsActive](self, "marqueeAnimationIsActive"))
  {
    -[SLHighlightPillMarqueeView setMarqueeAnimationIsActive:](self, "setMarqueeAnimationIsActive:", 0);
    -[SLHighlightPillMarqueeView layer](self, "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllAnimations");

    -[SLHighlightPillMarqueeView setEndingPositionConstraintsShouldBeActive:](self, "setEndingPositionConstraintsShouldBeActive:", 0);
  }
}

- (BOOL)marqueeEnabled
{
  return self->_marqueeEnabled;
}

- (double)marqueeClippingWidth
{
  return self->_marqueeClippingWidth;
}

- (int64_t)replicatedContentAlignment
{
  return self->_replicatedContentAlignment;
}

- (UIView)pillView
{
  return self->_pillView;
}

- (void)setPillView:(id)a3
{
  objc_storeStrong((id *)&self->_pillView, a3);
}

- (SLReplicatorView)replicatorView
{
  return self->_replicatorView;
}

- (void)setReplicatorView:(id)a3
{
  objc_storeStrong((id *)&self->_replicatorView, a3);
}

- (BOOL)marqueeAnimationIsActive
{
  return self->_marqueeAnimationIsActive;
}

- (void)setMarqueeAnimationIsActive:(BOOL)a3
{
  self->_marqueeAnimationIsActive = a3;
}

- (BOOL)endingPositionConstraintsShouldBeActive
{
  return self->_endingPositionConstraintsShouldBeActive;
}

- (NSLayoutConstraint)ourWidthConstraint
{
  return self->_ourWidthConstraint;
}

- (void)setOurWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_ourWidthConstraint, a3);
}

- (NSLayoutConstraint)ourHeightConstraint
{
  return self->_ourHeightConstraint;
}

- (void)setOurHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_ourHeightConstraint, a3);
}

- (NSLayoutConstraint)replicatorViewStartingPositionXConstraint
{
  return self->_replicatorViewStartingPositionXConstraint;
}

- (void)setReplicatorViewStartingPositionXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_replicatorViewStartingPositionXConstraint, a3);
}

- (NSLayoutConstraint)replicatorViewEndingPositionXConstraint
{
  return self->_replicatorViewEndingPositionXConstraint;
}

- (void)setReplicatorViewEndingPositionXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_replicatorViewEndingPositionXConstraint, a3);
}

- (NSLayoutConstraint)replicatorViewYConstraint
{
  return self->_replicatorViewYConstraint;
}

- (void)setReplicatorViewYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_replicatorViewYConstraint, a3);
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
  objc_storeStrong((id *)&self->_maskLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskLayer, 0);
  objc_storeStrong((id *)&self->_replicatorViewYConstraint, 0);
  objc_storeStrong((id *)&self->_replicatorViewEndingPositionXConstraint, 0);
  objc_storeStrong((id *)&self->_replicatorViewStartingPositionXConstraint, 0);
  objc_storeStrong((id *)&self->_ourHeightConstraint, 0);
  objc_storeStrong((id *)&self->_ourWidthConstraint, 0);
  objc_storeStrong((id *)&self->_replicatorView, 0);
  objc_storeStrong((id *)&self->_pillView, 0);
}

@end
