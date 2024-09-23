@implementation SBPPTEventActionsToSwipeToHomeScreen

void __SBPPTEventActionsToSwipeToHomeScreen_block_invoke(uint64_t a1, void *a2)
{
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
  double MidX;
  double MaxY;
  double v14;
  id v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v2 = (void *)MEMORY[0x1E0CEA950];
  v15 = a2;
  objc_msgSend(v2, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  MidX = CGRectGetMidX(v16);
  v17.origin.x = v5;
  v17.origin.y = v7;
  v17.size.width = v9;
  v17.size.height = v11;
  MaxY = CGRectGetMaxY(v17);
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  v14 = CGRectGetMidX(v18);
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  objc_msgSend(v15, "sendFlickWithStartPoint:endPoint:duration:", MidX, MaxY, v14, CGRectGetMidY(v19), 0.25);

}

@end
