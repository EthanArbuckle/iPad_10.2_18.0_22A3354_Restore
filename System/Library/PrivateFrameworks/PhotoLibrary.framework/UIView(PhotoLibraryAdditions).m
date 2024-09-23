@implementation UIView(PhotoLibraryAdditions)

- (uint64_t)pl_isOnScreen:()PhotoLibraryAdditions
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
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
  uint64_t result;
  CGRect v22;
  CGRect v23;

  objc_msgSend(a1, "bounds");
  objc_msgSend(a1, "convertRect:toView:", 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(a3, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  result = objc_msgSend(a1, "window");
  if (result)
  {
    v22.origin.x = v6;
    v22.origin.y = v8;
    v22.size.width = v10;
    v22.size.height = v12;
    v23.origin.x = v14;
    v23.origin.y = v16;
    v23.size.width = v18;
    v23.size.height = v20;
    return CGRectIntersectsRect(v22, v23);
  }
  return result;
}

- (uint64_t)pl_drawBorderWithColor:()PhotoLibraryAdditions width:
{
  void *v6;

  v6 = (void *)objc_msgSend(a1, "layer");
  objc_msgSend(v6, "setBorderColor:", objc_msgSend(a4, "CGColor"));
  return objc_msgSend(v6, "setBorderWidth:", a2);
}

- (uint64_t)pl_setHidden:()PhotoLibraryAdditions animated:
{
  return objc_msgSend(a1, "pl_setHidden:delay:animated:", 0.0);
}

- (uint64_t)pl_setHidden:()PhotoLibraryAdditions delay:animated:
{
  double v7;
  uint64_t result;
  double v9;
  _QWORD v10[6];
  char v11;
  _QWORD v12[6];

  if ((_DWORD)a3)
    v7 = 0.0;
  else
    v7 = 1.0;
  result = objc_msgSend(a1, "alpha");
  if (v9 != v7)
  {
    if ((a4 & 1) != 0)
    {
      objc_msgSend(a1, "setHidden:", 0);
      objc_msgSend((id)objc_opt_class(), "pl_setHiddenAnimationDuration");
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __61__UIView_PhotoLibraryAdditions__pl_setHidden_delay_animated___block_invoke;
      v12[3] = &unk_1E70B6640;
      v12[4] = a1;
      *(double *)&v12[5] = v7;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __61__UIView_PhotoLibraryAdditions__pl_setHidden_delay_animated___block_invoke_2;
      v10[3] = &unk_1E70B6668;
      v10[4] = a1;
      *(double *)&v10[5] = v7;
      v11 = a3;
      return objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:delay:options:animations:completion:", 0, v12, v10);
    }
    else
    {
      objc_msgSend((id)objc_msgSend(a1, "layer"), "removeAnimationForKey:", CFSTR("opacity"));
      objc_msgSend(a1, "setHidden:", a3);
      return objc_msgSend(a1, "setAlpha:", v7);
    }
  }
  return result;
}

+ (double)pl_setHiddenAnimationDuration
{
  return 0.25;
}

@end
