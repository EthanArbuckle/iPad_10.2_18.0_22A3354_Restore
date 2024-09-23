@implementation IKViewElementStyle(NSLayoutConstraint)

+ (id)positionConstraintsForView:()NSLayoutConstraint insets:position:
{
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v13 = a7;
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a8 > 1)
      {
        v17 = 0;
        if (a8 <= 8 && ((1 << a8) & 0x150) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 1, 0, v15, 1, 1.0, a2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (a8 <= 9 && ((1 << a8) & 0x2A0) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 2, 0, v15, 2, 1.0, -a4);
          v18 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v18;
        }
        v19 = 0;
        if (a8 <= 7 && ((1 << a8) & 0xC4) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 3, 0, v15, 3, 1.0, a1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        if (a8 <= 9 && ((1 << a8) & 0x308) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 4, 0, v15, 4, 1.0, -a3);
          v20 = objc_claimAutoreleasedReturnValue();

          v19 = (void *)v20;
        }
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v21;
        if (v17)
          objc_msgSend(v21, "addObject:", v17);
        if (v19)
          objc_msgSend(v16, "addObject:", v19);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsByCenteringView:withView:alongAxes:offset:", v14, v15, 3, *MEMORY[0x1E0DC51A8], *(double *)(MEMORY[0x1E0DC51A8] + 8));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      NSLog(CFSTR("superview cannot be nil"));
      v16 = 0;
    }

  }
  else
  {
    NSLog(CFSTR("view cannot be nil"));
    v16 = 0;
  }

  return v16;
}

@end
