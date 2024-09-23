@implementation UIImage(SBFIOSurfaceConveniences)

- (uint64_t)sbf_CGImageBackedImage
{
  return objc_msgSend(a1, "sbf_CGImageBackedImageWithMaximumBitsPerComponent:", -1);
}

- (uint64_t)sbf_CGImageBackedImageWithMaximumBitsPerComponent:()SBFIOSurfaceConveniences
{
  return objc_msgSend(a1, "sbf_CGImageBackedImageWithMaximumBitsPerComponent:skipCIF10FitsInSRGBCheck:", a3, 0);
}

- (id)sbf_CGImageBackedImageWithMaximumBitsPerComponent:()SBFIOSurfaceConveniences skipCIF10FitsInSRGBCheck:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CGImage *v14;
  id v15;
  double v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v6 = objc_retainAutorelease(a1);
  if (objc_msgSend(v6, "CGImage"))
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v6, "ioSurface");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "pixelFormat");
      if (a3 <= 8 && v10 == 1999843442)
      {
        v11 = *MEMORY[0x1E0CBC800];
        v18[0] = *MEMORY[0x1E0CBC750];
        v18[1] = v11;
        v19[0] = &unk_1E203AA80;
        v19[1] = &unk_1E203AA98;
        v18[2] = *MEMORY[0x1E0CBD130];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v19[2] = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = (CGImage *)CGImageCreateFromIOSurface();
      }
      else
      {
        v14 = (CGImage *)UICreateCGImageFromIOSurface();
      }
      v15 = objc_alloc(MEMORY[0x1E0CEA638]);
      objc_msgSend(v6, "scale");
      v7 = (id)objc_msgSend(v15, "initWithCGImage:scale:orientation:", v14, objc_msgSend(v6, "imageOrientation"), v16);
      CGImageRelease(v14);
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

@end
