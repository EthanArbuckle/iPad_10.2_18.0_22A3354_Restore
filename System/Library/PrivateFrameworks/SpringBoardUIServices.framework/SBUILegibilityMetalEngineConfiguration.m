@implementation SBUILegibilityMetalEngineConfiguration

void __80___SBUILegibilityMetalEngineConfiguration__prepareImageForConvolution_settings___block_invoke(uint64_t a1)
{
  CGContext *CurrentContext;
  id v3;

  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(v3, "CGColor"));

  CGContextScaleCTM(CurrentContext, 1.0, -1.0);
  CGContextTranslateCTM(CurrentContext, 0.0, -*(double *)(a1 + 48));
  CGContextDrawImage(CurrentContext, *(CGRect *)(a1 + 56), (CGImageRef)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "CGImage"));
}

@end
