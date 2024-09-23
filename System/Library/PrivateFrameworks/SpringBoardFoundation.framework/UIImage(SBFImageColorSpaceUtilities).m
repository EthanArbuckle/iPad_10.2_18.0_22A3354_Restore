@implementation UIImage(SBFImageColorSpaceUtilities)

- (CGImage)sbf_colorSpace
{
  CGImage *result;

  result = (CGImage *)objc_msgSend(objc_retainAutorelease(a1), "CGImage");
  if (result)
    return CGImageGetColorSpace(result);
  return result;
}

- (id)sbf_imageByManipulatingInDeviceColorSpaceWithBlock:()SBFImageColorSpaceUtilities
{
  void (**v4)(id, id);
  void *v5;
  CGColorSpace *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x18D773FD4]();
    v6 = CGColorSpaceRetain((CGColorSpaceRef)objc_msgSend(a1, "sbf_colorSpace"));
    if (v6)
    {
      __sbfImageByApplyingColorSpace(a1, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = a1;
    }
    v9 = v7;
    v4[2](v4, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      __sbfImageByApplyingColorSpace(v10, v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    CGColorSpaceRelease(v6);

    objc_autoreleasePoolPop(v5);
  }
  else
  {
    v8 = a1;
  }

  return v8;
}

- (uint64_t)sbf_imageUsingContextType:()SBFImageColorSpaceUtilities
{
  return objc_msgSend(a1, "sbf_imageByConvertingToColorSpace:type:", 0, a3);
}

- (id)sbf_imageByConvertingToColorSpace:()SBFImageColorSpaceUtilities type:
{
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  _QWORD v13[5];

  objc_msgSend(a1, "size");
  v8 = v7;
  v10 = v9;
  objc_msgSend(a1, "scale");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__UIImage_SBFImageColorSpaceUtilities__sbf_imageByConvertingToColorSpace_type___block_invoke;
  v13[3] = &unk_1E200E188;
  v13[4] = a1;
  return (id)_SBFCGBitmapImageCreate(a4, a3, 0, v13, 0, v8, v10, v11);
}

- (id)sbf_ATXSafeCGImageBackedImage
{
  void *v1;
  CGColorSpace *v2;
  unsigned int Type;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  CGColorSpace *v10;
  CGColorSpace *v11;
  CGColorSpace *v12;
  uint64_t v13;

  objc_msgSend(a1, "sbf_CGImageBackedImageWithMaximumBitsPerComponent:skipCIF10FitsInSRGBCheck:", 8, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (CGColorSpace *)objc_msgSend(v1, "sbf_colorSpace");
  if (v2)
  {
    Type = CGColorSpaceGetType();
    if (Type <= 5 && ((1 << Type) & 0x27) != 0)
      return v1;
  }
  v5 = CGColorSpaceCopyName(v2);
  v6 = v5;
  v7 = (const __CFString *)*MEMORY[0x1E0C9DA10];
  if (v5)
  {
    if (CFStringCompare(v5, (CFStringRef)*MEMORY[0x1E0C9DA10], 0) == kCFCompareEqualTo
      || (v8 = (const __CFString *)*MEMORY[0x1E0C9D960],
          CFStringCompare(v6, (CFStringRef)*MEMORY[0x1E0C9D960], 0) == kCFCompareEqualTo)
      || (v9 = (const __CFString *)*MEMORY[0x1E0C9D908],
          CFStringCompare(v6, (CFStringRef)*MEMORY[0x1E0C9D908], 0) == kCFCompareEqualTo))
    {
LABEL_18:
      CFRelease(v6);
      return v1;
    }
  }
  else
  {
    v8 = (const __CFString *)*MEMORY[0x1E0C9D960];
    v9 = (const __CFString *)*MEMORY[0x1E0C9D908];
  }
  v10 = CGColorSpaceCreateWithName(v7);
  v11 = CGColorSpaceCreateWithName(v8);
  v12 = CGColorSpaceCreateWithName(v9);
  if ((CGColorSpaceEqualToColorSpace() & 1) == 0
    && (CGColorSpaceEqualToColorSpace() & 1) == 0
    && (CGColorSpaceEqualToColorSpace() & 1) == 0)
  {
    objc_msgSend(v1, "sbf_imageByConvertingToColorSpace:type:", v11, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v13;
  }
  CGColorSpaceRelease(v10);
  CGColorSpaceRelease(v11);
  CGColorSpaceRelease(v12);
  if (v6)
    goto LABEL_18;
  return v1;
}

@end
