@implementation UIView(ControlCenterInvocationHint)

- (double)SBSUI_sourceRectForControlCenterInvocationHint
{
  void *v1;
  void *v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  int v12;
  char v13;
  char v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double MinX;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v1 = a1;
  objc_msgSend(a1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "convertRect:toView:", v1);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = __sb__runningInSpringBoard();
  if (v12)
  {
    v13 = v12;
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      v14 = 0;
    }
    else
    {
      if (SBFEffectiveHomeButtonType() == 2)
      {
        if ((v13 & 1) != 0)
          goto LABEL_16;
        goto LABEL_9;
      }
      v14 = v13 ^ 1;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v1, "userInterfaceIdiom") && SBFEffectiveHomeButtonType() == 2)
    {
LABEL_9:

      goto LABEL_16;
    }
    v14 = 1;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  if ((v14 & 1) != 0)
  if ((v16 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    MinX = CGRectGetMidX(v24) + -32.0;
    v25.origin.x = v5;
    v25.origin.y = v7;
    v25.size.width = v9;
    v25.size.height = v11;
    CGRectGetMaxY(v25);
    return MinX;
  }
LABEL_16:
  v17 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection");
  v18 = v5;
  v19 = v7;
  v20 = v9;
  v21 = v11;
  if (v17 == 1)
    MinX = CGRectGetMinX(*(CGRect *)&v18);
  else
    MinX = CGRectGetMaxX(*(CGRect *)&v18) + -64.0;
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  CGRectGetMinY(v26);
  return MinX;
}

@end
