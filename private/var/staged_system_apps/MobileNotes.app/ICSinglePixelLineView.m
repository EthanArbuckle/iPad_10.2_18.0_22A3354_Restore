@implementation ICSinglePixelLineView

- (void)updateConstraints
{
  objc_super v3;

  -[ICSinglePixelLineView setUpHeightConstraintIfNecessary](self, "setUpHeightConstraintIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)ICSinglePixelLineView;
  -[ICSinglePixelLineView updateConstraints](&v3, "updateConstraints");
}

- (void)setUpHeightConstraintIfNecessary
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  id v8;

  if (!-[ICSinglePixelLineView hasSetUpSizeConstraint](self, "hasSetUpSizeConstraint"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableSeparatorLightColor](UIColor, "tableSeparatorLightColor"));
    -[ICSinglePixelLineView setBackgroundColor:](self, "setBackgroundColor:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v4, "scale");
    v6 = 1.0 / v5;

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSinglePixelLineView findSizeLayoutConstraintIfExists](self, "findSizeLayoutConstraintIfExists"));
    if (!v7)
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSinglePixelLineView addSizeConstraint](self, "addSizeConstraint"));
    v8 = v7;
    objc_msgSend(v7, "setConstant:", v6);
    -[ICSinglePixelLineView setHasSetUpSizeConstraint:](self, "setHasSetUpSizeConstraint:", 1);

  }
}

- (id)findSizeLayoutConstraintIfExists
{
  id v3;
  void *v4;
  id v5;
  id v6;
  ICSinglePixelLineView *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  ICSinglePixelLineView *v11;
  void *v12;
  ICSinglePixelLineView *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = -[ICSinglePixelLineView sizeLayoutAttribute](self, "sizeLayoutAttribute");
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSinglePixelLineView constraints](self, "constraints", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (!v5)
  {
    v7 = 0;
    goto LABEL_16;
  }
  v6 = v5;
  v7 = 0;
  v8 = *(_QWORD *)v17;
  do
  {
    v9 = 0;
    do
    {
      if (*(_QWORD *)v17 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v9);
      if (objc_msgSend(v10, "firstAttribute") == v3)
      {
        v11 = (ICSinglePixelLineView *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstItem"));
        if (v11 != self)
          goto LABEL_8;
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "secondItem"));

        if (!v12)
        {
          v13 = v10;
          v11 = v7;
          v7 = v13;
LABEL_8:

        }
      }
      v9 = (char *)v9 + 1;
    }
    while (v6 != v9);
    v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    v6 = v14;
  }
  while (v14);
LABEL_16:

  return v7;
}

- (id)addSizeConstraint
{
  id v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = -[ICSinglePixelLineView sizeLayoutAttribute](self, "sizeLayoutAttribute");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "scale");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self, v3, 0, 0, 0, 1.0, 1.0 / v5));

  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v7);

  return v6;
}

- (BOOL)hasSetUpSizeConstraint
{
  return self->_hasSetUpSizeConstraint;
}

- (void)setHasSetUpSizeConstraint:(BOOL)a3
{
  self->_hasSetUpSizeConstraint = a3;
}

@end
