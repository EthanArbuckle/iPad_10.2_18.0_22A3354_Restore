@implementation PRLikeness(PersonaUI)

- (id)snapshotWithSize:()PersonaUI scale:options:
{
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a6;
  v11 = objc_msgSend(a1, "type");
  if (v11 == 2)
  {
    objc_msgSend(a1, "_photoSnapshotWithSize:scale:options:", v10, a2, a3, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v11 == 1)
  {
    objc_msgSend(a1, "recipe");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRMonogram monogramWithData:](PRMonogram, "monogramWithData:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "snapshotWithSize:scale:options:", v10, a2, a3, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)accentColor
{
  uint64_t v2;
  void *v3;

  v2 = objc_msgSend(a1, "type");
  if (v2 == 2)
  {
    objc_msgSend(a1, "_accentColorForPhoto");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v2 == 1)
  {
    objc_msgSend(a1, "_accentColorForMonogram");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_accentColorForMonogram
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "recipe");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[PRMonogram monogramWithData:](PRMonogram, "monogramWithData:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.300000012);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accentColorForPhoto
{
  CGImage *v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  CGImageRef v7;
  CGImage *v8;
  double AlignedBytesPerRow;
  size_t v10;
  uint64_t Data;
  _BYTE *v12;
  CGColorSpaceRef DeviceRGB;
  CGColorSpace *v14;
  size_t Width;
  CGFloat Height;
  CGContextRef v17;
  CGContext *v18;
  CGImage *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  void *v23;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v2 = (CGImage *)objc_msgSend(a1, "staticRepresentation");
  objc_msgSend(a1, "cropRect");
  v7 = PRImageCreateWithImageInRect(v2, v3, v4, v5, v6);
  if (v7)
  {
    v8 = v7;
    AlignedBytesPerRow = (double)(unint64_t)CGBitmapGetAlignedBytesPerRow();
    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.width = 1.0;
    v25.size.height = 1.0;
    v10 = (unint64_t)(CGRectGetWidth(v25) * AlignedBytesPerRow);
    Data = CGBitmapAllocateData();
    if (Data)
    {
      v12 = (_BYTE *)Data;
      DeviceRGB = CGColorSpaceCreateDeviceRGB();
      if (DeviceRGB)
      {
        v14 = DeviceRGB;
        v26.origin.x = 0.0;
        v26.origin.y = 0.0;
        v26.size.width = 1.0;
        v26.size.height = 1.0;
        Width = (unint64_t)CGRectGetWidth(v26);
        v27.origin.x = 0.0;
        v27.origin.y = 0.0;
        v27.size.width = 1.0;
        v27.size.height = 1.0;
        Height = CGRectGetHeight(v27);
        v17 = CGBitmapContextCreate(v12, Width, (unint64_t)Height, 8uLL, v10, v14, 0x4001u);
        if (v17)
        {
          v18 = v17;
          v19 = (CGImage *)objc_msgSend(a1, "staticRepresentation");
          v28.origin.x = 0.0;
          v28.origin.y = 0.0;
          v28.size.width = 1.0;
          v28.size.height = 1.0;
          CGContextDrawImage(v18, v28, v19);
          LOBYTE(v20) = *v12;
          LOBYTE(v21) = v12[1];
          LOBYTE(v22) = v12[2];
          objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", (float)((float)v20 / 255.0), (float)((float)v21 / 255.0), (float)((float)v22 / 255.0), 1.0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          CGContextRelease(v18);
        }
        else
        {
          v23 = 0;
        }
        CGColorSpaceRelease(v14);
      }
      else
      {
        v23 = 0;
      }
      CGBitmapFreeData();
    }
    else
    {
      v23 = 0;
    }
    CGImageRelease(v8);
  }
  else
  {
    v23 = 0;
  }
  return v23;
}

- (CGImage)_photoSnapshotWithSize:()PersonaUI scale:options:
{
  id v10;
  void *v11;
  int v12;
  CGImage *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGImage *CircularImageInRect;
  CGImage *v19;
  double Width;
  double Height;
  _BOOL4 v22;
  uint64_t v23;
  CGImage *v24;
  void *v25;
  int v26;
  CGImage *v27;
  double v28;
  double v29;
  double v30;

  v10 = a6;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PRLikenessSnapshotOptionCircular"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "BOOLValue");

  v13 = (CGImage *)objc_msgSend(a1, "staticRepresentation");
  objc_msgSend(a1, "cropRect");
  if (v12)
    CircularImageInRect = PRImageCreateCircularImageInRect(v13, v14, v15, v16, v17);
  else
    CircularImageInRect = PRImageCreateWithImageInRect(v13, v14, v15, v16, v17);
  v19 = CircularImageInRect;
  if (CircularImageInRect)
  {
    Width = (double)CGImageGetWidth(CircularImageInRect);
    Height = (double)CGImageGetHeight(v19);
    v22 = a3 * a4 < Height || a2 * a4 < Width;
    if (v22)
      v23 = CGImageCreateByScaling();
    else
      v23 = (uint64_t)CGImageRetain(v19);
    v24 = (CGImage *)v23;
    CGImageRelease(v19);
    if (v24)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("PRLikenessSnapshotOptionForceDecode"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "BOOLValue");

      if (v26)
        PRImageForceDecompress(v24);
      if (v22)
      {
        v27 = v24;
        v28 = a2;
        v29 = a3;
        v30 = a4;
      }
      else
      {
        v30 = 1.0;
        v27 = v24;
        v28 = Width;
        v29 = Height;
      }
      objc_msgSend(MEMORY[0x24BDF6AC8], "pr_imageWithCGImage:size:scale:", v27, v28, v29, v30);
      v19 = (CGImage *)objc_claimAutoreleasedReturnValue();
      CGImageRelease(v24);
    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

@end
