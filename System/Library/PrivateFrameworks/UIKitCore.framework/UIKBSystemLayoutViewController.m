@implementation UIKBSystemLayoutViewController

+ (id)systemLayoutViewControllerWithViewController:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (_QWORD *)objc_msgSend(objc_alloc((Class)a1), "initWithNibName:bundle:", 0, 0);
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v5[122] = 1;
  v5[123] = 1;
  objc_msgSend(v5, "addChildViewController:", v4);
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v8);

  objc_msgSend(v4, "didMoveToParentViewController:", v5);
  objc_msgSend(v4, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "updateViewConstraints");
  return v5;
}

- (void)setHorizontalLayoutType:(unint64_t)a3
{
  self->_horizontalLayoutType = a3;
  -[UIKBSystemLayoutViewController updateViewConstraints](self, "updateViewConstraints");
}

- (void)setVerticalLayoutType:(unint64_t)a3
{
  self->_verticalLayoutType = a3;
  -[UIKBSystemLayoutViewController updateViewConstraints](self, "updateViewConstraints");
}

- (void)setMinimumInsets:(UIEdgeInsets)a3
{
  self->_minimumInsets = a3;
  -[UIKBSystemLayoutViewController updateViewConstraints](self, "updateViewConstraints");
}

- (void)setCenteredOffsets:(CGSize)a3
{
  self->_centeredOffsets = a3;
  -[UIKBSystemLayoutViewController updateViewConstraints](self, "updateViewConstraints");
}

- (void)updateViewConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  _BOOL4 v13;
  void *v14;
  unint64_t v15;
  _BOOL4 v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *constraints;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  double v25;
  int *v26;
  char *p_overrideTransitioningDelegate;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  NSMutableArray *v32;
  void *v33;
  NSMutableArray *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  id obj;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)UIKBSystemLayoutViewController;
  -[UIViewController updateViewConstraints](&v44, sel_updateViewConstraints);
  -[UIViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeConstraints:", self->_constraints);

  -[NSMutableArray removeAllObjects](self->_constraints, "removeAllObjects");
  -[UIViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = v6;
  objc_msgSend(v6, "frame");
  v8 = v7;
  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UIKBSystemLayoutViewController horizontalLayoutType](self, "horizontalLayoutType");
  v13 = 0;
  v14 = &unk_1E1A981D8;
  switch(v12)
  {
    case 0uLL:
      goto LABEL_7;
    case 1uLL:
      v13 = 0;
      v14 = &unk_1E1A981F0;
      goto LABEL_7;
    case 2uLL:
      v13 = 0;
      goto LABEL_6;
    case 3uLL:
      goto LABEL_5;
    case 4uLL:
      v13 = v8 > 0.0;
LABEL_5:
      objc_msgSend(v11, "addObject:", &unk_1E1A981D8);
LABEL_6:
      v14 = &unk_1E1A98208;
LABEL_7:
      objc_msgSend(v11, "addObject:", v14);
      break;
    default:
      break;
  }
  v15 = -[UIKBSystemLayoutViewController verticalLayoutType](self, "verticalLayoutType", v14);
  v16 = 0;
  v17 = &unk_1E1A98220;
  switch(v15)
  {
    case 0uLL:
      goto LABEL_14;
    case 1uLL:
      v16 = 0;
      v17 = &unk_1E1A98238;
      goto LABEL_14;
    case 2uLL:
      v16 = 0;
      goto LABEL_13;
    case 3uLL:
      goto LABEL_12;
    case 4uLL:
      v16 = v10 > 0.0;
LABEL_12:
      objc_msgSend(v11, "addObject:", &unk_1E1A98220);
LABEL_13:
      v17 = &unk_1E1A98250;
LABEL_14:
      objc_msgSend(v11, "addObject:", v17);
      break;
    default:
      break;
  }
  v37 = v16;
  if (!self->_constraints)
  {
    v18 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
    constraints = self->_constraints;
    self->_constraints = v18;

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = v11;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v41 != v22)
          objc_enumerationMutation(obj);
        v24 = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "integerValue");
        v25 = 0.0;
        v26 = &OBJC_IVAR___UIKBSystemLayoutViewController__minimumInsets;
        p_overrideTransitioningDelegate = (char *)self;
        switch(v24)
        {
          case 1:
            v26 = &OBJC_IVAR___UIKBSystemLayoutViewController__minimumInsets;
            goto LABEL_26;
          case 2:
            v26 = &OBJC_IVAR___UIKBSystemLayoutViewController__minimumInsets;
            p_overrideTransitioningDelegate = (char *)&self->super._overrideTransitioningDelegate;
            goto LABEL_29;
          case 3:
            goto LABEL_29;
          case 4:
            v26 = &OBJC_IVAR___UIKBSystemLayoutViewController__minimumInsets;
            p_overrideTransitioningDelegate = (char *)&self->super.super.__layeringSceneIdentity;
            goto LABEL_29;
          case 9:
            v26 = &OBJC_IVAR___UIKBSystemLayoutViewController__centeredOffsets;
            p_overrideTransitioningDelegate = (char *)self;
            goto LABEL_29;
          case 10:
            v26 = &OBJC_IVAR___UIKBSystemLayoutViewController__centeredOffsets;
LABEL_26:
            p_overrideTransitioningDelegate = (char *)&self->super.super._responderFlags;
LABEL_29:
            v25 = *(double *)&p_overrideTransitioningDelegate[*v26];
            break;
          default:
            break;
        }
        v28 = (void *)MEMORY[0x1E0D156E0];
        -[UIViewController view](self, "view");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, v24, 0, v39, v24, 1.0, v25);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v31) = 1148846080;
        objc_msgSend(v30, "setPriority:", v31);
        -[NSMutableArray addObject:](self->_constraints, "addObject:", v30);

      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v21);
  }

  if (v37)
  {
    v32 = self->_constraints;
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 8, 0, 0, 0, 0.0, v10);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v32, "addObject:", v33);

  }
  if (v13)
  {
    v34 = self->_constraints;
    objc_msgSend(MEMORY[0x1E0D156E0], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v39, 7, 0, 0, 0, 0.0, v8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](v34, "addObject:", v35);

  }
  -[UIViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addConstraints:", self->_constraints);

}

- (unint64_t)horizontalLayoutType
{
  return self->_horizontalLayoutType;
}

- (unint64_t)verticalLayoutType
{
  return self->_verticalLayoutType;
}

- (UIEdgeInsets)minimumInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_minimumInsets.top;
  left = self->_minimumInsets.left;
  bottom = self->_minimumInsets.bottom;
  right = self->_minimumInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (CGSize)centeredOffsets
{
  double width;
  double height;
  CGSize result;

  width = self->_centeredOffsets.width;
  height = self->_centeredOffsets.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraints, 0);
}

@end
