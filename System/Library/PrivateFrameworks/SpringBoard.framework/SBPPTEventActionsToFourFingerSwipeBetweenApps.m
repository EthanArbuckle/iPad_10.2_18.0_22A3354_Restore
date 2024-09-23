@implementation SBPPTEventActionsToFourFingerSwipeBetweenApps

void __SBPPTEventActionsToFourFingerSwipeBetweenApps_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double *v16;
  CGFloat v17;
  CGFloat MidY;
  double *v19;
  double v20;
  CGFloat v21;
  _BYTE v22[64];
  _BYTE v23[64];
  uint64_t v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  v12 = 0;
  v13 = 0;
  v14 = CGRectGetWidth(v25) * 0.5;
  v15 = v14 * 0.25;
  do
  {
    v16 = (double *)&v23[v12];
    v26.origin.x = v5;
    v26.origin.y = v7;
    v26.size.width = v9;
    v26.size.height = v11;
    v17 = CGRectGetMinX(v26) + (double)v13 * v15;
    v27.origin.x = v5;
    v27.origin.y = v7;
    v27.size.width = v9;
    v27.size.height = v11;
    MidY = CGRectGetMidY(v27);
    *v16 = v17;
    v16[1] = MidY;
    v19 = (double *)&v22[v12];
    v28.origin.x = v5;
    v28.origin.y = v7;
    v28.size.width = v9;
    v28.size.height = v11;
    v20 = v14 + CGRectGetMinX(v28) + (double)v13 * v15;
    v29.origin.x = v5;
    v29.origin.y = v7;
    v29.size.width = v9;
    v29.size.height = v11;
    v21 = CGRectGetMidY(v29);
    *v19 = v20;
    v19[1] = v21;
    ++v13;
    v12 += 16;
  }
  while (v13 != 4);
  objc_msgSend(v2, "touchDownAtPoints:touchCount:", v23, 4);
  objc_msgSend(v2, "moveToPoints:touchCount:duration:", v22, 4, 0.25);
  objc_msgSend(v2, "liftUpAtAllActivePoints");

}

@end
