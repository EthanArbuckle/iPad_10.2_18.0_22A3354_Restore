@implementation UISearchDisplayControllerContainerView

- (UISearchDisplayControllerContainerView)initWithFrame:(CGRect)a3 topViewHeight:(double)a4
{
  double height;
  double width;
  double y;
  double x;
  UISearchDisplayControllerContainerView *v9;
  UISearchDisplayControllerContainerView *v10;
  objc_class *v11;
  objc_class *v12;
  objc_class *v13;
  id v14;
  uint64_t v15;
  UIView *topView;
  id v17;
  uint64_t v18;
  UIView *bottomView;
  uint64_t v20;
  UIView *behindView;
  void *v22;
  void *v23;
  void *v24;
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
  CGRect remainder;
  CGRect slice;
  objc_super v44;
  CGRect v45;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v44.receiver = self;
  v44.super_class = (Class)UISearchDisplayControllerContainerView;
  v9 = -[UIView initWithFrame:](&v44, sel_initWithFrame_);
  v10 = v9;
  if (v9)
  {
    -[UIView setAutoresizingMask:](v9, "setAutoresizingMask:", 18);
    memset(&slice, 0, sizeof(slice));
    memset(&remainder, 0, sizeof(remainder));
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    CGRectDivide(v45, &slice, &remainder, a4, CGRectMinYEdge);
    v11 = (objc_class *)objc_opt_class();
    v12 = (objc_class *)objc_opt_class();
    v13 = (objc_class *)objc_opt_class();
    v14 = [v11 alloc];
    v15 = objc_msgSend(v14, "initWithFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
    topView = v10->_topView;
    v10->_topView = (UIView *)v15;

    v17 = [v12 alloc];
    v18 = objc_msgSend(v17, "initWithFrame:", remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
    bottomView = v10->_bottomView;
    v10->_bottomView = (UIView *)v18;

    v20 = objc_msgSend([v13 alloc], "initWithFrame:", x, y, width, height);
    behindView = v10->_behindView;
    v10->_behindView = (UIView *)v20;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10->_topView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10->_bottomView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v10->_behindView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v10, "addSubview:", v10->_topView);
    -[UIView addSubview:](v10, "addSubview:", v10->_bottomView);
    -[UIView insertSubview:belowSubview:](v10, "insertSubview:belowSubview:", v10->_behindView, v10->_topView);
    v22 = (void *)MEMORY[0x1E0D156E0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("V:[_topView(==%f)][_bottomView]"), *(_QWORD *)&a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _NSDictionaryOfVariableBindings(CFSTR("_topView, _bottomView"), v10->_topView, v10->_bottomView, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintsWithVisualFormat:options:metrics:views:", v23, 0, 0, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "objectAtIndex:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UISearchDisplayControllerContainerView setTopViewHeightConstraint:](v10, "setTopViewHeightConstraint:", v26);

    -[UIView addConstraints:](v10, "addConstraints:", v25);
    v27 = (void *)MEMORY[0x1E0D156E0];
    _NSDictionaryOfVariableBindings(CFSTR("_topView"), v10->_topView, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_topView]|"), 0, 0, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView addConstraints:](v10, "addConstraints:", v29);
    v30 = (void *)MEMORY[0x1E0D156E0];
    _NSDictionaryOfVariableBindings(CFSTR("_bottomView"), v10->_bottomView, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_bottomView]|"), 0, 0, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView addConstraints:](v10, "addConstraints:", v32);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10->_topView, 3, 0, v10, 3, 1.0, 0.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addConstraint:](v10, "addConstraint:", v33);
    -[UISearchDisplayControllerContainerView setTopViewAttributeTopConstraint:](v10, "setTopViewAttributeTopConstraint:", v33);
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v10->_bottomView, 4, 0, v10, 4, 1.0, 0.0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView addConstraint:](v10, "addConstraint:", v34);
    v35 = (void *)MEMORY[0x1E0D156E0];
    _NSDictionaryOfVariableBindings(CFSTR("_behindView"), v10->_behindView, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_behindView]|"), 0, 0, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView addConstraints:](v10, "addConstraints:", v37);
    v38 = (void *)MEMORY[0x1E0D156E0];
    _NSDictionaryOfVariableBindings(CFSTR("_behindView"), v10->_behindView, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_behindView]|"), 0, 0, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIView addConstraints:](v10, "addConstraints:", v40);
  }
  return v10;
}

- (void)updateTopViewHeight:(double)a3
{
  -[UISearchDisplayControllerContainerView updateTopViewHeight:animateUpdate:](self, "updateTopViewHeight:animateUpdate:", 0, a3);
}

- (void)updateTopViewHeight:(double)a3 animateUpdate:(BOOL)a4
{
  _BOOL4 v4;
  double v7;
  _BOOL4 collapsedTopView;
  void *v9;
  void *v10;
  id v11;
  _QWORD aBlock[6];

  v4 = a4;
  -[UISearchDisplayControllerContainerView topViewHeightConstraint](self, "topViewHeightConstraint");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constant");
  if (v7 == a3)
  {

  }
  else
  {
    collapsedTopView = self->_collapsedTopView;

    if (!collapsedTopView)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __76__UISearchDisplayControllerContainerView_updateTopViewHeight_animateUpdate___block_invoke;
      aBlock[3] = &unk_1E16B1888;
      aBlock[4] = self;
      *(double *)&aBlock[5] = a3;
      v9 = _Block_copy(aBlock);
      v10 = v9;
      if (v4)
        (*((void (**)(void *))v9 + 2))(v9);
      else
        +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v9);

    }
  }
}

uint64_t __76__UISearchDisplayControllerContainerView_updateTopViewHeight_animateUpdate___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;

  v2 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "topViewHeightConstraint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConstant:", v2);

  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)collapseTopView
{
  -[UISearchDisplayControllerContainerView updateTopViewHeight:](self, "updateTopViewHeight:", 0.0);
  self->_collapsedTopView = 1;
}

- (void)setBottomViewUserInteractionEnabled:(BOOL)a3
{
  -[UIView setUserInteractionEnabled:](self->_bottomView, "setUserInteractionEnabled:", a3);
}

- (void)updateTopAttributeConstant:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;

  -[UISearchDisplayControllerContainerView topViewAttributeTopConstraint](self, "topViewAttributeTopConstraint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constant");
  v7 = v6;

  if (v7 != a3)
  {
    -[UISearchDisplayControllerContainerView topViewAttributeTopConstraint](self, "topViewAttributeTopConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setConstant:", a3);

    -[UIView layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)adjustTopAttributeConstantByDelta:(double)a3
{
  double v5;
  id v6;

  -[UISearchDisplayControllerContainerView topViewAttributeTopConstraint](self, "topViewAttributeTopConstraint");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constant");
  -[UISearchDisplayControllerContainerView updateTopAttributeConstant:](self, "updateTopAttributeConstant:", v5 + a3);

}

- (void)configureInteractionForContainment:(BOOL)a3
{
  if (!a3)
  {
    -[UIView setUserInteractionEnabled:](self->_topView, "setUserInteractionEnabled:", 0);
    -[UIView setUserInteractionEnabled:](self->_behindView, "setUserInteractionEnabled:", 0);
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  UISearchDisplayControllerContainerView *v5;
  UISearchDisplayControllerContainerView *v6;
  UISearchDisplayControllerContainerView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UISearchDisplayControllerContainerView;
  -[UIView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (UISearchDisplayControllerContainerView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)_didMoveFromWindow:(id)a3 toWindow:(id)a4
{
  id v6;
  objc_super v7;

  v6 = a4;
  v7.receiver = self;
  v7.super_class = (Class)UISearchDisplayControllerContainerView;
  -[UIView _didMoveFromWindow:toWindow:](&v7, sel__didMoveFromWindow_toWindow_, a3, v6);
  if (v6)
    objc_msgSend(v6, "updateConstraintsIfNeeded");

}

- (NSLayoutConstraint)topViewHeightConstraint
{
  return self->_topViewHeightConstraint;
}

- (void)setTopViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topViewHeightConstraint, a3);
}

- (NSLayoutConstraint)topViewAttributeTopConstraint
{
  return self->_topViewAttributeTopConstraint;
}

- (void)setTopViewAttributeTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topViewAttributeTopConstraint, a3);
}

- (UIView)topView
{
  return self->_topView;
}

- (UIView)bottomView
{
  return self->_bottomView;
}

- (UIView)behindView
{
  return self->_behindView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_behindView, 0);
  objc_storeStrong((id *)&self->_bottomView, 0);
  objc_storeStrong((id *)&self->_topView, 0);
  objc_storeStrong((id *)&self->_topViewAttributeTopConstraint, 0);
  objc_storeStrong((id *)&self->_topViewHeightConstraint, 0);
}

@end
