@implementation NSLayoutConstraint(IC)

+ (id)ic_constraintWithItem:()IC attribute:relatedBy:toItem:attribute:multiplier:constant:priority:
{
  void *v5;
  double v6;

  objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v6 = a4;
  objc_msgSend(v5, "setPriority:", v6);
  return v5;
}

+ (id)ic_widthLayoutConstraintsForView:()IC minValue:maxValue:
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithDouble:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("minWidth, maxWidth"), v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("view"), v8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[view(>=minWidth,<=maxWidth)]"), 0, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)ic_widthLayoutConstraintsForView:()IC minValue:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  objc_msgSend(v5, "numberWithDouble:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("minWidth"), v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _NSDictionaryOfVariableBindings(CFSTR("view"), v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[view(>=minWidth)]"), 0, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)ic_constraints:()IC affectingViews:
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  objc_msgSend(v5, "setWithArray:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__NSLayoutConstraint_IC__ic_constraints_affectingViews___block_invoke;
  v11[3] = &unk_1E5C241A0;
  v12 = v7;
  v8 = v7;
  objc_msgSend(v6, "ic_objectsPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
