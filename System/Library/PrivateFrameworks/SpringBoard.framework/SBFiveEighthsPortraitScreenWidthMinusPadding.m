@implementation SBFiveEighthsPortraitScreenWidthMinusPadding

void ___SBFiveEighthsPortraitScreenWidthMinusPadding_block_invoke()
{
  void *v0;
  double Width;
  id v2;
  CGRect v3;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fixedCoordinateSpace");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  Width = CGRectGetWidth(v3);
  _SBFiveEighthsPortraitScreenWidthMinusPadding___size = floor(_SBPIPContentViewPaddingWhileStashed(0) * -2.0+ Width * 0.625+ -2.0);

}

@end
