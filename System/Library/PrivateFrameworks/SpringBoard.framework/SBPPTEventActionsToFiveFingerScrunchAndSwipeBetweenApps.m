@implementation SBPPTEventActionsToFiveFingerScrunchAndSwipeBetweenApps

void __SBPPTEventActionsToFiveFingerScrunchAndSwipeBetweenApps_block_invoke(uint64_t a1, void *a2)
{
  SBPPTBeginFiveFingerScrunch(a2, &__block_literal_global_29_3, 0.2);
}

void __SBPPTEventActionsToFiveFingerScrunchAndSwipeBetweenApps_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  double *v17;
  double *v18;
  uint64_t v19;
  double v20;
  double v21;
  double Width;
  double v23;
  double v24;
  _QWORD v25[2];
  CGRect v26;
  CGRect v27;

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  MEMORY[0x1E0C80A78](v16);
  if (a4 >= 1)
  {
    v17 = (double *)(a3 + 8);
    v18 = (double *)&v25[-2 * a4 + 1];
    v19 = a4;
    do
    {
      v20 = *(v17 - 1);
      v26.origin.x = v9;
      v26.origin.y = v11;
      v26.size.width = v13;
      v26.size.height = v15;
      v21 = v20 + CGRectGetWidth(v26) * 0.5;
      v27.origin.x = v9;
      v27.origin.y = v11;
      v27.size.width = v13;
      v27.size.height = v15;
      Width = CGRectGetWidth(v27);
      v23 = *v17;
      v17 += 2;
      v24 = v23;
      if (v21 < Width)
        Width = v21;
      *(v18 - 1) = Width;
      *v18 = v24;
      v18 += 2;
      --v19;
    }
    while (v19);
  }
  objc_msgSend(v6, "moveToPoints:touchCount:duration:", &v25[-2 * a4], a4, 0.1875);
  objc_msgSend(v6, "liftUpAtAllActivePoints");

}

@end
