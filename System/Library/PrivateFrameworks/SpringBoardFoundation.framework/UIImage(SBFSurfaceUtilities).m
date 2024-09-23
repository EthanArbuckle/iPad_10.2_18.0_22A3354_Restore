@implementation UIImage(SBFSurfaceUtilities)

+ (id)sbf_imageWithIOSurface:()SBFSurfaceUtilities scale:orientation:
{
  id v8;
  id v9;
  id v10;
  const void *v11;
  size_t v12;
  size_t v13;
  size_t v14;
  size_t v15;
  id v16;
  CGDataProvider *v17;
  CFTypeRef v18;
  const void *v19;
  CGColorSpace *v20;
  CGImage *v21;
  void *v22;

  v8 = a4;
  if (objc_msgSend(v8, "pixelFormat") == 1380411457)
  {
    v9 = v8;
    objc_msgSend(v9, "lockWithOptions:seed:", 1, 0);
    v10 = objc_retainAutorelease(v9);
    v11 = (const void *)objc_msgSend(v10, "baseAddress");
    v12 = objc_msgSend(v10, "bytesPerRow");
    v13 = objc_msgSend(v10, "width");
    v14 = objc_msgSend(v10, "height");
    v15 = objc_msgSend(v10, "allocationSize");
    v16 = v10;
    v17 = CGDataProviderCreateWithData(v16, v11, v15, (CGDataProviderReleaseDataCallback)releaseIOSurface);
    objc_msgSend(v16, "incrementUseCount");
    v18 = IOSurfaceCopyValue((IOSurfaceRef)v16, (CFStringRef)*MEMORY[0x1E0CBBF90]);
    if (!v18 || (v19 = v18, v20 = CGColorSpaceCreateWithPropertyList(v18), CFRelease(v19), !v20))
      v20 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9DA10]);
    v21 = CGImageCreate(v13, v14, 0x10uLL, 0x40uLL, v12, v20, 0x1101u, v17, 0, 1, kCGRenderingIntentDefault);
    CGImageSetProperty();
    CGDataProviderRelease(v17);
    CGColorSpaceRelease(v20);
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CEA638], "imageWithCGImage:scale:orientation:", v21, a5, a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = 0;
    }
    CGImageRelease(v21);

  }
  else
  {
    v22 = (void *)objc_msgSend([a1 alloc], "_initWithIOSurface:scale:orientation:", v8, a5, a2);
  }

  return v22;
}

@end
