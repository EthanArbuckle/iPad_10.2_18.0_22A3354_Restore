@implementation UIStaticBatteryView

void __92___UIStaticBatteryView__imageWithRenderedBezierPath_size_scale_pathScaleFactor_stroke_fill___block_invoke(uint64_t a1, void *a2)
{
  CGContextScaleCTM((CGContextRef)objc_msgSend(a2, "CGContext"), *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "stroke");
  if (*(_BYTE *)(a1 + 49))
    objc_msgSend(*(id *)(a1 + 32), "fill");
}

uint64_t __102___UIStaticBatteryView__imageByPunchingImage_inRect_flippedHorizontally_outOfImage_inRect_size_scale___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:blendMode:alpha:", 0, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:blendMode:alpha:", 23, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), 1.0);
}

void __101___UIStaticBatteryView__batteryBodyImageWithSize_forScale_batteryRect_cornerRadius_lineWidth_filled___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_1332;
  _MergedGlobals_1332 = v0;

}

void __134___UIStaticBatteryView__batteryBodyImageWithSize_forScale_batteryRect_cornerRadius_lineWidth_withBoltCutOutOfSize_inRect_boltFlipped___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD82640;
  qword_1ECD82640 = v0;

}

void __94___UIStaticBatteryView__percentFillImageWithSize_forScale_batteryRect_cornerRadius_lineWidth___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD82650;
  qword_1ECD82650 = v0;

}

void __73___UIStaticBatteryView__batteryPinImageWithSize_forScale_complexPinPath___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD82660;
  qword_1ECD82660 = v0;

}

void __68___UIStaticBatteryView__batteryBoltImageWithSize_boltSize_forScale___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD82670;
  qword_1ECD82670 = v0;

}

void __72___UIStaticBatteryView__batteryBoltMaskImageWithSize_boltSize_forScale___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD82680;
  qword_1ECD82680 = v0;

}

void __72___UIStaticBatteryView__batteryFillImageWithSize_forScale_cornerRadius___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD82690;
  qword_1ECD82690 = v0;

}

void __112___UIStaticBatteryView__batteryFillImageWithSize_forScale_cornerRadius_withBoltCutOutOfSize_inRect_boltFlipped___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD826A0;
  qword_1ECD826A0 = v0;

}

@end
