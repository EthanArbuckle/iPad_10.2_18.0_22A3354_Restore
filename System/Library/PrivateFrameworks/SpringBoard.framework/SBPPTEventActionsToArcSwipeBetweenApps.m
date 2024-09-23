@implementation SBPPTEventActionsToArcSwipeBetweenApps

void __SBPPTEventActionsToArcSwipeBetweenApps_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double MinX;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double MaxY;
  double v20;
  id v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v21 = a2;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = v8;
  v22.size.height = v10;
  MinX = CGRectGetMinX(v22);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  v12 = MinX + CGRectGetWidth(v23) * 0.25;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  MaxY = CGRectGetMaxY(v24);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  v13 = CGRectGetMinX(v25);
  v26.origin.x = v4;
  v26.origin.y = v6;
  v26.size.width = v8;
  v26.size.height = v10;
  v14 = v13 + CGRectGetWidth(v26) * 0.75;
  v27.origin.x = v4;
  v27.origin.y = v6;
  v27.size.width = v8;
  v27.size.height = v10;
  v20 = CGRectGetMaxY(v27);
  v15 = 0.5 / (double)objc_msgSend(v21, "touchFrequency");
  v16 = v12;
  objc_msgSend(v21, "touchDown:", v12, MaxY);
  v17 = (v14 - v12) * -0.25;
  v18 = 0.0;
  do
  {
    objc_msgSend(v21, "moveToPoint:duration:", v14 * ((v18 + v18) * 0.75) + (1.0 - (v18 + v18) * 0.75) * v16, (double)(v20 + v17 * sin((v18 + v18) * 0.75 * 3.14159265)), v15 * 0.5);
    objc_msgSend(v21, "advanceTime:", v15 * 0.5);
    v18 = v15 + v18;
  }
  while (v18 < 0.5);
  objc_msgSend(v21, "liftUpAtAllActivePoints");

}

@end
