@implementation SLReplicatorView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SLReplicatorView)initWithFrame:(CGRect)a3 targetView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  SLReplicatorView *v10;
  SLReplicatorView *v11;
  void *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SLReplicatorView;
  v10 = -[SLReplicatorView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[SLReplicatorView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SLReplicatorView setTargetView:](v11, "setTargetView:", v9);
    -[SLReplicatorView setInstanceCount:](v11, "setInstanceCount:", 1);
    -[SLReplicatorView setReplicationPaddingX:](v11, "setReplicationPaddingX:", 0.0);
    -[SLReplicatorView targetView](v11, "targetView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLReplicatorView addSubview:](v11, "addSubview:", v12);

    -[SLReplicatorView _updateReplicatorLayer](v11, "_updateReplicatorLayer");
  }

  return v11;
}

- (void)updateInstanceCount:(unint64_t)a3 replicationPaddingX:(double)a4
{
  int64_t v7;
  double v8;
  _QWORD block[5];

  v7 = -[SLReplicatorView instanceCount](self, "instanceCount");
  if (v7 != a3)
    -[SLReplicatorView setInstanceCount:](self, "setInstanceCount:", a3);
  -[SLReplicatorView replicationPaddingX](self, "replicationPaddingX");
  if (!SL_CGFloatApproximatelyEqualToFloat(v8, a4))
  {
    -[SLReplicatorView setReplicationPaddingX:](self, "setReplicationPaddingX:", a4);
    goto LABEL_7;
  }
  if (v7 != a3)
  {
LABEL_7:
    -[SLReplicatorView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[SLReplicatorView layoutIfNeeded](self, "layoutIfNeeded");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__SLReplicatorView_updateInstanceCount_replicationPaddingX___block_invoke;
    block[3] = &unk_1E3794360;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

uint64_t __60__SLReplicatorView_updateInstanceCount_replicationPaddingX___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateReplicatorLayer");
}

- (void)_updateReplicatorLayer
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CATransform3D v9;
  CATransform3D v10;

  -[SLReplicatorView layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInstanceCount:", -[SLReplicatorView instanceCount](self, "instanceCount"));
  -[SLReplicatorView targetView](self, "targetView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  -[SLReplicatorView replicationPaddingX](self, "replicationPaddingX");
  v8 = v7 + v6;

  CATransform3DMakeTranslation(&v10, v8, 0.0, 0.0);
  v9 = v10;
  objc_msgSend(v3, "setInstanceTransform:", &v9);
  -[SLReplicatorView setNeedsLayout](self, "setNeedsLayout");
  -[SLReplicatorView layoutIfNeeded](self, "layoutIfNeeded");

}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)SLReplicatorView;
  -[SLReplicatorView updateConstraints](&v45, sel_updateConstraints);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLReplicatorView replicationPaddingX](self, "replicationPaddingX");
  v6 = v5 * (double)(-[SLReplicatorView instanceCount](self, "instanceCount") - 1);
  -[SLReplicatorView widthConstraint](self, "widthConstraint");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[SLReplicatorView widthConstraint](self, "widthConstraint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLReplicatorView targetView](self, "targetView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "widthAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == v12)
    {
      -[SLReplicatorView widthConstraint](self, "widthConstraint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "multiplier");
      if (v14 == (double)-[SLReplicatorView instanceCount](self, "instanceCount"))
      {
        -[SLReplicatorView widthConstraint](self, "widthConstraint");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "constant");
        v44 = v43;

        if (v44 == v6)
          goto LABEL_9;
        goto LABEL_6;
      }

      v12 = v10;
    }

  }
LABEL_6:
  -[SLReplicatorView widthConstraint](self, "widthConstraint");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SLReplicatorView widthConstraint](self, "widthConstraint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v16);

  }
  -[SLReplicatorView widthAnchor](self, "widthAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLReplicatorView targetView](self, "targetView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "widthAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:multiplier:constant:", v19, (double)-[SLReplicatorView instanceCount](self, "instanceCount"), v6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLReplicatorView setWidthConstraint:](self, "setWidthConstraint:", v20);

  -[SLReplicatorView widthConstraint](self, "widthConstraint");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v21);

LABEL_9:
  -[SLReplicatorView heightConstraint](self, "heightConstraint");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    -[SLReplicatorView heightAnchor](self, "heightAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLReplicatorView targetView](self, "targetView");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "heightAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "constraintEqualToAnchor:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLReplicatorView setHeightConstraint:](self, "setHeightConstraint:", v28);

    goto LABEL_13;
  }
  -[SLReplicatorView heightConstraint](self, "heightConstraint");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isActive");

  if ((v24 & 1) == 0)
  {
LABEL_13:
    -[SLReplicatorView heightConstraint](self, "heightConstraint");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

  }
  -[SLReplicatorView targetViewLeadingConstraint](self, "targetViewLeadingConstraint");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v30)
  {
    -[SLReplicatorView targetView](self, "targetView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "leadingAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLReplicatorView leadingAnchor](self, "leadingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLReplicatorView setTargetViewLeadingConstraint:](self, "setTargetViewLeadingConstraint:", v34);

    -[SLReplicatorView targetViewLeadingConstraint](self, "targetViewLeadingConstraint");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v35);

  }
  -[SLReplicatorView targetViewTopConstraint](self, "targetViewTopConstraint");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v36)
  {
    -[SLReplicatorView targetView](self, "targetView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "topAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLReplicatorView topAnchor](self, "topAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[SLReplicatorView setTargetViewTopConstraint:](self, "setTargetViewTopConstraint:", v40);

    -[SLReplicatorView targetViewTopConstraint](self, "targetViewTopConstraint");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v41);

  }
  if (objc_msgSend(v4, "count"))
    objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v4);
  if (objc_msgSend(v3, "count"))
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v3);

}

- (UIView)targetView
{
  return self->_targetView;
}

- (void)setTargetView:(id)a3
{
  objc_storeStrong((id *)&self->_targetView, a3);
}

- (int64_t)instanceCount
{
  return self->_instanceCount;
}

- (void)setInstanceCount:(int64_t)a3
{
  self->_instanceCount = a3;
}

- (double)replicationPaddingX
{
  return self->_replicationPaddingX;
}

- (void)setReplicationPaddingX:(double)a3
{
  self->_replicationPaddingX = a3;
}

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_heightConstraint, a3);
}

- (NSLayoutConstraint)targetViewLeadingConstraint
{
  return self->_targetViewLeadingConstraint;
}

- (void)setTargetViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_targetViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)targetViewTopConstraint
{
  return self->_targetViewTopConstraint;
}

- (void)setTargetViewTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_targetViewTopConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_targetViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_targetView, 0);
}

@end
