@implementation SBPPTEventActionsToSwipeRightFromLeftOfInterface

void __SBPPTEventActionsToSwipeRightFromLeftOfInterface_block_invoke(uint64_t a1, void *a2)
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
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double MaxX;
  double v21;
  double MidY;
  uint64_t v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double MinX;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  CGRect v38;
  CGRect v39;

  v2 = (id *)MEMORY[0x1E0CEB258];
  v3 = (void *)*MEMORY[0x1E0CEB258];
  v4 = (void *)MEMORY[0x1E0CEA950];
  v5 = a2;
  objc_msgSend(v4, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_keyWindowForScreen:", v6);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(*v2, "userInterfaceLayoutDirection");
  v16 = v8;
  v17 = v10;
  v18 = v12;
  v19 = v14;
  if (v15 == 1)
    MaxX = CGRectGetMaxX(*(CGRect *)&v16);
  else
    MaxX = CGRectGetMinX(*(CGRect *)&v16);
  v21 = MaxX;
  v38.origin.x = v8;
  v38.origin.y = v10;
  v38.size.width = v12;
  v38.size.height = v14;
  MidY = CGRectGetMidY(v38);
  v23 = objc_msgSend(*v2, "userInterfaceLayoutDirection");
  v24 = v8;
  v25 = v10;
  v26 = v12;
  v27 = v14;
  if (v23 == 1)
    MinX = CGRectGetMinX(*(CGRect *)&v24);
  else
    MinX = CGRectGetMaxX(*(CGRect *)&v24);
  v29 = MinX;
  v39.origin.x = v8;
  v39.origin.y = v10;
  v39.size.width = v12;
  v39.size.height = v14;
  v30 = CGRectGetMidY(v39);
  objc_msgSend(v37, "convertPoint:toView:", 0, v21, MidY);
  objc_msgSend(v37, "_convertPointToSceneReferenceSpace:");
  v32 = v31;
  v34 = v33;
  objc_msgSend(v37, "convertPoint:toView:", 0, v29, v30);
  objc_msgSend(v37, "_convertPointToSceneReferenceSpace:");
  objc_msgSend(v5, "sendFlickWithStartPoint:endPoint:duration:", v32, v34, v35, v36, 0.25);

}

@end
