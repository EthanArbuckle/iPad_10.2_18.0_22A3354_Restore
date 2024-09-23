@implementation BorderImage

void ____BorderImage_block_invoke()
{
  void *v0;
  double v1;
  const __CFString *v2;
  CGDataProvider *v3;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  PLPhysicalScreenScale();
  if (v1 == 2.0)
    v2 = CFSTR("PLImageBorder@2x");
  else
    v2 = CFSTR("PLImageBorder");
  v3 = CGDataProviderCreateWithURL((CFURLRef)objc_msgSend(v0, "URLForResource:withExtension:", v2, CFSTR("png")));
  __BorderImage___borderImage = (uint64_t)CGImageCreateWithPNGDataProvider(v3, 0, 1, kCGRenderingIntentDefault);
  CGDataProviderRelease(v3);
}

@end
