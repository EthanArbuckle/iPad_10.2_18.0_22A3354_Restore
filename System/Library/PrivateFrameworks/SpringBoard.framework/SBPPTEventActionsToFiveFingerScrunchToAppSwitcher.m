@implementation SBPPTEventActionsToFiveFingerScrunchToAppSwitcher

void __SBPPTEventActionsToFiveFingerScrunchToAppSwitcher_block_invoke(uint64_t a1, void *a2)
{
  SBPPTBeginFiveFingerScrunch(a2, &__block_literal_global_27_0, 0.4);
}

void __SBPPTEventActionsToFiveFingerScrunchToAppSwitcher_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  double *v8;
  double *v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint32_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = objc_msgSend(v6, "advanceTime:", 0.5);
  MEMORY[0x1E0C80A78](v7);
  if (a4 >= 1)
  {
    v8 = (double *)(a3 + 8);
    v9 = (double *)&v15[-2 * a4 + 1];
    v10 = a4;
    do
    {
      v11 = *(v8 - 1);
      v12 = v11 + (double)arc4random_uniform(0xAu) / 10.0;
      v13 = *v8;
      v8 += 2;
      v14 = arc4random_uniform(0xAu);
      *(v9 - 1) = v12;
      *v9 = v13 + (double)v14 / 10.0;
      v9 += 2;
      --v10;
    }
    while (v10);
  }
  objc_msgSend(v6, "moveToPoints:touchCount:duration:", &v15[-2 * a4], a4, 1.0 / (double)objc_msgSend(v6, "touchFrequency"));
  objc_msgSend(v6, "liftUpAtAllActivePoints");

}

@end
