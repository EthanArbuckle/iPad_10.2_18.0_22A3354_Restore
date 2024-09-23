@implementation UIColor(PDUExtras)

+ (id)pdu_colorWithString:()PDUExtras
{
  id v3;
  SEL v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("system"))
    && (v4 = NSSelectorFromString((NSString *)v3), (objc_opt_respondsToSelector() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x24BDF6950], "performSelector:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PDUConvertColorString(v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)convertedToRGB
{
  CGColorSpace *v2;
  CGColor *CopyByMatchingToColorSpace;
  void *v4;

  v2 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x24BDBF2A0]);
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(v2, kCGRenderingIntentDefault, (CGColorRef)objc_msgSend(objc_retainAutorelease(a1), "CGColor"), 0);
  if (CopyByMatchingToColorSpace)
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6950]), "initWithCGColor:", CopyByMatchingToColorSpace);
  else
    v4 = 0;
  CGColorSpaceRelease(v2);
  CGColorRelease(CopyByMatchingToColorSpace);
  return v4;
}

@end
