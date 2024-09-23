@implementation UIStatusBarStaticBatteryView

void __101___UIStatusBarStaticBatteryView__imageWithRenderedBezierPath_size_scale_pathScaleFactor_stroke_fill___block_invoke(uint64_t a1, void *a2)
{
  CGContextScaleCTM((CGContextRef)objc_msgSend(a2, "CGContext"), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "stroke");
  if (*(_BYTE *)(a1 + 49))
    objc_msgSend(*(id *)(a1 + 32), "fill");
}

uint64_t __111___UIStatusBarStaticBatteryView__imageByPunchingImage_inRect_flippedHorizontally_outOfImage_inRect_size_scale___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:blendMode:alpha:", 23, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), 1.0);
}

void __110___UIStatusBarStaticBatteryView__batteryBodyImageWithSize_forScale_batteryRect_cornerRadius_lineWidth_filled___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1054;
  _MergedGlobals_1054 = v0;

}

void __143___UIStatusBarStaticBatteryView__batteryBodyImageWithSize_forScale_batteryRect_cornerRadius_lineWidth_withBoltCutOutOfSize_inRect_boltFlipped___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7DCE0;
  qword_1ECD7DCE0 = v0;

}

void __103___UIStatusBarStaticBatteryView__percentFillImageWithSize_forScale_batteryRect_cornerRadius_lineWidth___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7DCF0;
  qword_1ECD7DCF0 = v0;

}

void __82___UIStatusBarStaticBatteryView__batteryPinImageWithSize_forScale_complexPinPath___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7DD00;
  qword_1ECD7DD00 = v0;

}

void __77___UIStatusBarStaticBatteryView__batteryBoltImageWithSize_boltSize_forScale___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7DD10;
  qword_1ECD7DD10 = v0;

}

void __81___UIStatusBarStaticBatteryView__batteryBoltMaskImageWithSize_boltSize_forScale___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7DD20;
  qword_1ECD7DD20 = v0;

}

void __81___UIStatusBarStaticBatteryView__batteryFillImageWithSize_forScale_cornerRadius___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7DD30;
  qword_1ECD7DD30 = v0;

}

void __121___UIStatusBarStaticBatteryView__batteryFillImageWithSize_forScale_cornerRadius_withBoltCutOutOfSize_inRect_boltFlipped___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7DD40;
  qword_1ECD7DD40 = v0;

}

@end
