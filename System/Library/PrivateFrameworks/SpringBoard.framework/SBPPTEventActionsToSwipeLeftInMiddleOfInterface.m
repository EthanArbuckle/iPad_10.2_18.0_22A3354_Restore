@implementation SBPPTEventActionsToSwipeLeftInMiddleOfInterface

void __SBPPTEventActionsToSwipeLeftInMiddleOfInterface_block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  uint64_t v15;
  double MidX;
  double v17;
  double v18;
  double v19;
  double MidY;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v2 = (id *)MEMORY[0x1E0CEB258];
  v3 = (void *)*MEMORY[0x1E0CEB258];
  v4 = (void *)MEMORY[0x1E0CEA950];
  v5 = a2;
  objc_msgSend(v4, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_keyWindowForScreen:", v6);
  v29 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(*v2, "userInterfaceLayoutDirection");
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  MidX = CGRectGetMidX(v30);
  v17 = 100.0;
  if (v15 == 1)
    v18 = -100.0;
  else
    v18 = 100.0;
  v19 = MidX + v18;
  v31.origin.x = v8;
  v31.origin.y = v10;
  v31.size.width = v12;
  v31.size.height = v14;
  MidY = CGRectGetMidY(v31);
  if (objc_msgSend(*v2, "userInterfaceLayoutDirection") != 1)
    v17 = -100.0;
  v32.origin.x = v8;
  v32.origin.y = v10;
  v32.size.width = v12;
  v32.size.height = v14;
  v21 = CGRectGetMidX(v32) + v17;
  v33.origin.x = v8;
  v33.origin.y = v10;
  v33.size.width = v12;
  v33.size.height = v14;
  v22 = CGRectGetMidY(v33);
  objc_msgSend(v29, "convertPoint:toView:", 0, v19, MidY);
  objc_msgSend(v29, "_convertPointToSceneReferenceSpace:");
  v24 = v23;
  v26 = v25;
  objc_msgSend(v29, "convertPoint:toView:", 0, v21, v22);
  objc_msgSend(v29, "_convertPointToSceneReferenceSpace:");
  objc_msgSend(v5, "sendFlickWithStartPoint:endPoint:duration:", v24, v26, v27, v28, 0.25);

}

@end
