@implementation SBPPTEventActionsToSwipeUpFromBottomOfInterface

void __SBPPTEventActionsToSwipeUpFromBottomOfInterface_block_invoke(uint64_t a1, void *a2)
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
  double MaxY;
  double v12;
  double MinY;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v2 = (void *)*MEMORY[0x1E0CEB258];
  v3 = (void *)MEMORY[0x1E0CEA950];
  v4 = a2;
  objc_msgSend(v3, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_keyWindowForScreen:", v5);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "bounds");
  x = v21.origin.x;
  y = v21.origin.y;
  width = v21.size.width;
  height = v21.size.height;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = x;
  v22.origin.y = y;
  v22.size.width = width;
  v22.size.height = height;
  MaxY = CGRectGetMaxY(v22);
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  v12 = CGRectGetMidX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MinY = CGRectGetMinY(v24);
  objc_msgSend(v20, "convertPoint:toView:", 0, MidX, MaxY);
  objc_msgSend(v20, "_convertPointToSceneReferenceSpace:");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v20, "convertPoint:toView:", 0, v12, MinY);
  objc_msgSend(v20, "_convertPointToSceneReferenceSpace:");
  objc_msgSend(v4, "sendFlickWithStartPoint:endPoint:duration:", v15, v17, v18, v19, 0.25);

}

@end
