@implementation UIImage(SUAdditions)

- (uint64_t)stretchableImageWithLeftCapWidth:()SUAdditions rightCapWidth:
{
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  CGFloat v13;
  float v14;
  double v15;
  float v16;
  CGColorSpace *DeviceRGB;
  uint64_t AlignedBytesPerRow;
  CGContext *v19;
  CGContext *v20;
  double v21;
  double v22;
  double v23;
  float v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGImage *v30;
  CGImage *v31;
  CGImage *v32;
  CGImage *v33;
  CGImage *v34;
  CGImage *v35;
  CGImageRef Image;
  CGImage *v37;
  uint64_t v38;
  double v39;
  CGAffineTransform v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  if (a3 == a4)
    return objc_msgSend(a1, "stretchableImageWithLeftCapWidth:topCapHeight:", a3, 0);
  objc_msgSend(a1, "size");
  v9 = v8;
  if (a3 <= a4)
    v10 = a4;
  else
    v10 = a3;
  v11 = (float)((float)((float)v10 * 2.0) + 1.0);
  objc_msgSend(a1, "scale");
  v13 = v12;
  v14 = v12 * v11;
  v15 = ceilf(v14);
  v16 = v9 * v12;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v19 = CGBitmapContextCreate(0, vcvtps_u32_f32(v14), vcvtps_u32_f32(v16), 8uLL, (unint64_t)(double)(unint64_t)AlignedBytesPerRow, DeviceRGB, 0x2002u);
  if (v19)
  {
    v20 = v19;
    v41.size.height = ceilf(v16);
    v41.origin.x = 0.0;
    v41.origin.y = 0.0;
    v41.size.width = v15;
    CGContextClearRect(v19, v41);
    CGContextScaleCTM(v20, v13, v13);
    CGAffineTransformMakeScale(&v40, v13, v13);
    CGContextSetBaseCTM();
    objc_msgSend(a1, "size");
    *(float *)&v21 = v13 * v21;
    v22 = ceilf(*(float *)&v21);
    objc_msgSend(a1, "size");
    v24 = v13 * v23;
    v25 = ceilf(v24);
    v39 = v11;
    v26 = v13 * (double)a3;
    v27 = (double)a4;
    v28 = v13 * (double)a4;
    v29 = v22 - v28 - v26;
    v30 = (CGImage *)objc_msgSend(a1, "CGImage");
    v42.origin.x = 0.0;
    v42.origin.y = 0.0;
    v42.size.width = v26;
    v42.size.height = v25;
    v31 = CGImageCreateWithImageInRect(v30, v42);
    v43.origin.x = 0.0;
    v43.origin.y = 0.0;
    v43.size.width = (double)a3;
    v43.size.height = v9;
    CGContextDrawImage(v20, v43, v31);
    CGImageRelease(v31);
    v32 = (CGImage *)objc_msgSend(a1, "CGImage");
    v44.origin.x = v26 + v29;
    v44.origin.y = 0.0;
    v44.size.width = v28;
    v44.size.height = v25;
    v33 = CGImageCreateWithImageInRect(v32, v44);
    v45.origin.x = v39 - v27;
    v45.origin.y = 0.0;
    v45.size.width = v27;
    v45.size.height = v9;
    CGContextDrawImage(v20, v45, v33);
    CGImageRelease(v33);
    v34 = (CGImage *)objc_msgSend(a1, "CGImage");
    v46.origin.y = 0.0;
    v46.origin.x = v26;
    v46.size.width = v29;
    v46.size.height = v25;
    v35 = CGImageCreateWithImageInRect(v34, v46);
    v47.size.width = v39 - (double)a3 - v27;
    v47.origin.y = 0.0;
    v47.origin.x = (double)a3;
    v47.size.height = v9;
    CGContextDrawImage(v20, v47, v35);
    CGImageRelease(v35);
    Image = CGBitmapContextCreateImage(v20);
    if (Image)
    {
      v37 = Image;
      v38 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithCGImage:scale:orientation:", Image, 0, v13), "stretchableImageWithLeftCapWidth:topCapHeight:", a3, 0);
      CGImageRelease(v37);
    }
    else
    {
      v38 = 0;
    }
    CFRelease(v20);
  }
  else
  {
    v38 = 0;
  }
  CGColorSpaceRelease(DeviceRGB);
  return v38;
}

@end
