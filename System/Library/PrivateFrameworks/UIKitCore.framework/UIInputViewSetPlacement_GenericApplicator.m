@implementation UIInputViewSetPlacement_GenericApplicator

+ (id)applicatorForOwner:(id)a3 withPlacement:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForOwner:withPlacement:", v7, v6);

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void **v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = (void **)v4;
    v6 = UIInputViewSetAreConstraintsEqualEnough(self->_horizontalConstraint, v5[1])
      && UIInputViewSetAreConstraintsEqualEnough(self->_verticalConstraint, v5[2])
      && UIInputViewSetAreConstraintsEqualEnough(self->_widthConstraint, v5[3]);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)allConstraintsActive
{
  return -[NSLayoutConstraint isActive](self->_horizontalConstraint, "isActive")
      && -[NSLayoutConstraint isActive](self->_verticalConstraint, "isActive")
      && -[NSLayoutConstraint isActive](self->_widthConstraint, "isActive");
}

- (id)initForOwner:(id)a3 withPlacement:(id)a4
{
  id v6;
  id v7;
  UIInputViewSetPlacement_GenericApplicator *v8;
  id *p_isa;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  void *v30;
  void *v31;
  objc_class *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_class *v38;
  void *v39;
  objc_class *v40;
  void *v41;
  void *v42;
  objc_super v44;

  v6 = a3;
  v7 = a4;
  v44.receiver = self;
  v44.super_class = (Class)UIInputViewSetPlacement_GenericApplicator;
  v8 = -[UIInputViewSetPlacement_GenericApplicator init](&v44, sel_init);
  p_isa = (id *)&v8->super.isa;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_owner, v6);
    if (!v7)
    {
      objc_msgSend(v6, "placement");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v6, "inputViewSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hostView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "horizontalConstraintForInputViewSet:hostView:containerView:", v10, v11, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = p_isa[1];
    p_isa[1] = (id)v13;

    objc_msgSend(v6, "inputViewSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hostView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "verticalConstraintForInputViewSet:hostView:containerView:", v15, v16, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = p_isa[2];
    p_isa[2] = (id)v18;

    objc_msgSend(v6, "inputViewSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "hostView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widthConstraintForInputViewSet:hostView:containerView:", v20, v21, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = p_isa[3];
    p_isa[3] = (id)v23;

    v25 = (void *)MEMORY[0x1E0CB3940];
    v26 = (objc_class *)objc_opt_class();
    NSStringFromClass(v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("%@<%@>.horizontal"), v27, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[1], "setIdentifier:", v30);

    v31 = (void *)MEMORY[0x1E0CB3940];
    v32 = (objc_class *)objc_opt_class();
    NSStringFromClass(v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (objc_class *)objc_opt_class();
    NSStringFromClass(v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringWithFormat:", CFSTR("%@<%@>.vertical"), v33, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[2], "setIdentifier:", v36);

    v37 = (void *)MEMORY[0x1E0CB3940];
    v38 = (objc_class *)objc_opt_class();
    NSStringFromClass(v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (objc_class *)objc_opt_class();
    NSStringFromClass(v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringWithFormat:", CFSTR("%@<%@>.width"), v39, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(p_isa[3], "setIdentifier:", v42);

  }
  return p_isa;
}

- (void)applyChanges:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
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
  void *v27;
  void *v28;
  double v29;
  _OWORD v30[3];
  __int128 v31;
  __int128 v32;
  __int128 v33;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(v4, "objectForKey:", CFSTR("Alpha"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(WeakRetained, "hostView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    objc_msgSend(v6, "doubleValue");
    v10 = v9;
    objc_msgSend(WeakRetained, "hostView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAlpha:", v10);

  }
  objc_msgSend(WeakRetained, "setHideInputViewBackdrops:", 0);
  objc_msgSend(v4, "objectForKey:", CFSTR("Transform"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "CGAffineTransformValue");
  }
  else
  {
    v14 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v31 = *MEMORY[0x1E0C9BAA8];
    v32 = v14;
    v33 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  objc_msgSend(WeakRetained, "hostView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v31;
  v30[1] = v32;
  v30[2] = v33;
  objc_msgSend(v15, "setTransform:", v30);

  objc_msgSend(v4, "objectForKey:", CFSTR("TouchInsets"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "UIEdgeInsetsValue");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
  }
  else
  {
    v19 = 0.0;
    v21 = 0.0;
    v23 = 0.0;
    v25 = 0.0;
  }
  objc_msgSend(WeakRetained, "hostView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_setTouchInsets:", v19, v21, v23, v25);

  objc_msgSend(v4, "objectForKey:", CFSTR("Origin"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (v27)
  {
    objc_msgSend(v27, "pointValue");
    -[NSLayoutConstraint setConstant:](self->_verticalConstraint, "setConstant:", v29);
  }
  else
  {
    -[UIInputViewSetPlacement_GenericApplicator checkVerticalConstraint](self, "checkVerticalConstraint");
  }

}

- (void)checkVerticalConstraint
{
  -[NSLayoutConstraint setConstant:](self->_verticalConstraint, "setConstant:", 0.0);
}

- (NSArray)constraints
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_horizontalConstraint)
    objc_msgSend(v3, "addObject:");
  if (self->_verticalConstraint)
    objc_msgSend(v4, "addObject:");
  if (self->_widthConstraint)
    objc_msgSend(v4, "addObject:");
  return (NSArray *)v4;
}

- (UIView)twoFingerDraggableView
{
  return 0;
}

- (UIView)draggableView
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "hostView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_owner);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_verticalConstraint, 0);
  objc_storeStrong((id *)&self->_horizontalConstraint, 0);
}

- (UIEdgeInsets)inputAssistantPadding
{
  id WeakRetained;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "inputViewPadding");
  v4 = v3;
  v6 = v5;

  v7 = 0.0;
  v8 = 0.0;
  v9 = v4;
  v10 = v6;
  result.right = v10;
  result.bottom = v8;
  result.left = v9;
  result.top = v7;
  return result;
}

- (CGPoint)origin
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[NSLayoutConstraint constant](self->_horizontalConstraint, "constant");
  v4 = v3;
  -[NSLayoutConstraint constant](self->_verticalConstraint, "constant");
  v6 = v5;
  v7 = v4;
  result.y = v6;
  result.x = v7;
  return result;
}

- (UIView)backdropContainer
{
  return 0;
}

- (CGRect)targetRect
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIInputViewSetPlacement_GenericApplicator draggableView](self, "draggableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dragGestureRectInView:", v6);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
  }
  else
  {
    -[UIInputViewSetPlacement_GenericApplicator draggableView](self, "draggableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v8 = v15 + -80.0;
    -[UIInputViewSetPlacement_GenericApplicator draggableView](self, "draggableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v10 = v16 + -80.0;
    *(double *)&v12 = 80.0;
    *(double *)&v14 = 80.0;
  }

  v17 = v8;
  v18 = v10;
  v19 = *(double *)&v12;
  v20 = *(double *)&v14;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)preBeginGesture:(id)a3 shouldBegin:(BOOL *)a4
{
  id v6;
  BOOL v7;
  BOOL v8;
  CGRect v10;

  v6 = a3;
  -[UIInputViewSetPlacement_GenericApplicator targetRect](self, "targetRect");
  if (CGRectIsEmpty(v10))
  {
    v7 = 0;
  }
  else
  {
    if (objc_msgSend(v6, "numberOfTouches") != 2)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = 1;
  }
  *a4 = v7;
  v8 = 1;
LABEL_7:

  return v8;
}

- (BOOL)isGesture:(id)a3 inDraggableView:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a4.y;
  x = a4.x;
  -[UIInputViewSetPlacement_GenericApplicator targetRect](self, "targetRect", a3);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (UIEdgeInsets)contentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGRect)popoverFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D648];
  v3 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (UIEdgeInsets)inputAccessoryPadding
{
  UIInputViewSetPlacementOwner **p_owner;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  p_owner = &self->_owner;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  objc_msgSend(WeakRetained, "hostView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_rootInputWindowController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "subPlacements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)p_owner);
  objc_msgSend(v9, "placement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0.0;
  if (v8 == v10
    && objc_msgSend(v6, "isFloatingAssistantView")
    && (objc_msgSend(v6, "isCompactAssistantView") & 1) == 0)
  {
    v12 = objc_loadWeakRetained((id *)p_owner);
    objc_msgSend(v12, "hostView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_rootInputWindowController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "inputViewSet");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "inputAssistantView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v11 = v17;

  }
  v18 = 0.0;
  v19 = 0.0;
  v20 = 0.0;
  v21 = -v11;
  result.right = v20;
  result.bottom = v21;
  result.left = v19;
  result.top = v18;
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)UIInputViewSetPlacement_GenericApplicator;
  -[UIInputViewSetPlacement_GenericApplicator description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIInputViewSetPlacement_GenericApplicator constraints](self, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@; %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

@end
