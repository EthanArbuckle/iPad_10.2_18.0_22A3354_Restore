@implementation PFParallaxLayerStyleSupportedKinds

void __PFParallaxLayerStyleSupportedKinds_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];

  v2[11] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Original");
  v2[1] = CFSTR("Studio");
  v2[2] = CFSTR("BlackWhite");
  v2[3] = CFSTR("BlackWhiteMono");
  v2[4] = CFSTR("ColorBGStandard");
  v2[5] = CFSTR("ColorWashSingle");
  v2[6] = CFSTR("ColorWashDuotone");
  v2[7] = CFSTR("GreenScreen");
  v2[8] = CFSTR("GreenScreenMono");
  v2[9] = CFSTR("GreenScreenBlur");
  v2[10] = CFSTR("GreenScreenGraphic");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)PFParallaxLayerStyleSupportedKinds_supportedKinds;
  PFParallaxLayerStyleSupportedKinds_supportedKinds = v0;

}

@end
