@implementation SBPPTEventActionsToSwipeDownFromTopOfInterface

void __SBPPTEventActionsToSwipeDownFromTopOfInterface_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MinY;
  double v12;
  double MaxY;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v2 = (void *)*MEMORY[0x1E0CEB258];
  v3 = (void *)MEMORY[0x1E0CEA950];
  v4 = a2;
  objc_msgSend(v3, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_keyWindowForScreen:", v5);
  v22 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "bounds");
  x = v23.origin.x;
  y = v23.origin.y;
  width = v23.size.width;
  height = v23.size.height;
  MidX = CGRectGetMidX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinY = CGRectGetMinY(v24);
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  v12 = CGRectGetMidX(v25);
  v26.origin.x = x;
  v26.origin.y = y;
  v26.size.width = width;
  v26.size.height = height;
  MaxY = CGRectGetMaxY(v26);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if ((v15 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v27.origin.x = x;
    v27.origin.y = y;
    v27.size.width = width;
    v27.size.height = height;
    MidX = CGRectGetMinX(v27) + 100.0;
    v28.origin.x = x;
    v28.origin.y = y;
    v28.size.width = width;
    v28.size.height = height;
    MinY = CGRectGetMinY(v28);
    v29.origin.x = x;
    v29.origin.y = y;
    v29.size.width = width;
    v29.size.height = height;
    v12 = CGRectGetMinX(v29) + 100.0;
    v30.origin.x = x;
    v30.origin.y = y;
    v30.size.width = width;
    v30.size.height = height;
    MaxY = CGRectGetMaxY(v30);
  }
  objc_msgSend(v22, "convertPoint:toView:", 0, MidX, MinY);
  objc_msgSend(v22, "_convertPointToSceneReferenceSpace:");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v22, "convertPoint:toView:", 0, v12, MaxY);
  objc_msgSend(v22, "_convertPointToSceneReferenceSpace:");
  objc_msgSend(v4, "sendFlickWithStartPoint:endPoint:duration:", v17, v19, v20, v21, 0.25);

}

@end
