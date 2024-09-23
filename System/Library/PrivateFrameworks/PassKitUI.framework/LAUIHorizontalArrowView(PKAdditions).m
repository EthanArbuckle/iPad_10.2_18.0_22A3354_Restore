@implementation LAUIHorizontalArrowView(PKAdditions)

+ (uint64_t)pkui_cameraEdgeForScreen:()PKAdditions
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  uint64_t v15;
  id v17;
  CGRect v18;

  v3 = a3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = 0;
  v4 = PKUIFrontCameraCurrentPosition(v3, &v17);
  v6 = v5;
  objc_msgSend(v17, "bounds");
  if (v4 <= v7)
  {
    v15 = 0;
  }
  else
  {
    v11 = v7;
    v12 = v8;
    v13 = v9;
    v14 = v10;
    if (v4 >= CGRectGetMaxX(*(CGRect *)&v7))
    {
      v15 = 2;
    }
    else if (v6 <= v12)
    {
      v15 = 1;
    }
    else
    {
      v18.origin.x = v11;
      v18.origin.y = v12;
      v18.size.width = v13;
      v18.size.height = v14;
      if (v6 >= CGRectGetMaxY(v18))
        v15 = 3;
      else
        v15 = 1;
    }
  }

  return v15;
}

- (uint64_t)pkui_updateFrame
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  CGRectEdge v8;
  CGRectEdge v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v28;
  CGRect remainder;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  objc_msgSend(a1, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
        goto LABEL_7;
    }
    v8 = objc_msgSend((id)objc_opt_class(), "pkui_cameraEdgeForScreen:", v6);
    if ((v8 & 0xFFFFFFFD) != 1)
    {
      v9 = v8;
      objc_msgSend(a1, "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v6, "coordinateSpace");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "bounds");
      objc_msgSend(v3, "convertRect:fromCoordinateSpace:", v18, 0, 0, 0, 0);
      remainder = v30;
      CGRectDivide(v30, &v28, &remainder, 80.0, v9);
      CGRectDivide(remainder, &v28, &remainder, v15, v9);
      objc_msgSend(a1, "setDirection:", v9 != CGRectMinXEdge);
      PKFloatRoundToPixel();
      objc_msgSend(a1, "setDisplacement:");
      PKSizeAlignedInRect();
      v20 = v19;
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v31.origin.x = v11;
      v31.origin.y = v13;
      v31.size.width = v15;
      v31.size.height = v17;
      v32.origin.x = v20;
      v32.origin.y = v22;
      v32.size.width = v24;
      v32.size.height = v26;
      if (!CGRectEqualToRect(v31, v32))
        objc_msgSend(a1, "setFrame:", v20, v22, v24, v26);

      v7 = 1;
      goto LABEL_11;
    }
LABEL_7:
    v7 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

@end
