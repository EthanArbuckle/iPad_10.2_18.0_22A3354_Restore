@implementation UIWindow(RPTWindowExtras)

- (double)_draggableFrame
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "valueForKeyPath:", CFSTR("nsWindowProxy.attachedWindow._draggableFrame"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "CGRectValue");
  v3 = v2;

  return v3;
}

- (double)_rpt_safeVisibleFrameOfScreen
{
  void *v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double result;
  CGRect v11;

  objc_msgSend(a1, "nsScreen");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "visibleFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;

  v11.origin.x = v3;
  v11.origin.y = v5;
  v11.size.width = v7;
  v11.size.height = v9;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v11, 20.0, 20.0);
  return result;
}

- (double)rpt_accessibilityActivationPointAttribute
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  CGRect v7;

  objc_msgSend(a1, "valueForKeyPath:", CFSTR("nsWindowProxy.attachedWindow.accessibilityActivationPoint"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CGPointValue");
  v4 = v3;

  objc_msgSend(a1, "nsScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  CGRectGetHeight(v7);

  return v4;
}

- (void)_rpt_moveToSafeTopLeftOfScreemVisibleFrameAndResize:()RPTWindowExtras
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double Height;
  double v21;
  double Width;
  double v23;
  double MinY;
  id v25;
  double MinX;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  objc_msgSend(a1, "_rpt_safeVisibleFrameOfScreen");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(a1, "nsWindowFrame");
  v17 = v16;
  v19 = v18;
  if (a2 == *MEMORY[0x1E0C9D820] && a3 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    a2 = v14;
    a3 = v15;
  }
  v27.origin.x = v7;
  v27.origin.y = v9;
  v27.size.width = v11;
  v27.size.height = v13;
  MinX = CGRectGetMinX(v27);
  v28.origin.x = v7;
  v28.origin.y = v9;
  v28.size.width = v11;
  v28.size.height = v13;
  MinY = CGRectGetMinY(v28);
  v29.origin.x = v7;
  v29.origin.y = v9;
  v29.size.width = v11;
  v29.size.height = v13;
  Height = CGRectGetHeight(v29);
  v30.origin.x = v17;
  v30.origin.y = v19;
  v30.size.width = a2;
  v30.size.height = a3;
  v21 = MinY + Height - CGRectGetHeight(v30);
  v31.origin.x = v17;
  v31.origin.y = v19;
  v31.size.width = a2;
  v31.size.height = a3;
  Width = CGRectGetWidth(v31);
  v32.origin.x = v17;
  v32.origin.y = v19;
  v32.size.width = a2;
  v32.size.height = a3;
  v23 = CGRectGetHeight(v32);
  objc_msgSend(a1, "valueForKeyPath:", CFSTR("nsWindowProxy.attachedWindow"));
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFrame:display:", 1, MinX, v21, Width, v23);

}

@end
