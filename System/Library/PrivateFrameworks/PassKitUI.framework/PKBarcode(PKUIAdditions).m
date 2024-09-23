@implementation PKBarcode(PKUIAdditions)

- (id)_imageFromBarcodeMessage
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  CGImage *v15;

  v2 = (void *)MEMORY[0x1A1AE621C]();
  v3 = objc_msgSend(a1, "format");
  v4 = (void *)MEMORY[0x1E0C9DDB8];
  PKBarcodeFilterNameForFormat();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterWithName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "messageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("inputMessage"));

  if (v3 == 4)
  {
    if (objc_msgSend(a1, "shouldRemoveQuietZone"))
      objc_msgSend(v6, "setValue:forKey:", &unk_1E3FACAA0, CFSTR("inputQuietSpace"));
  }
  else
  {
    objc_msgSend(a1, "options");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    v10 = (void *)MEMORY[0x1E0C9AA70];
    if (v8)
      v10 = (void *)v8;
    v11 = v10;

    objc_msgSend(v6, "setValue:forKey:", v11, CFSTR("inputOptions"));
    objc_msgSend(a1, "shouldRemoveQuietZone");
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", objc_msgSend(v6, "outputCGImage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "valueForKey:", CFSTR("outputImage"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (qword_1ED06C720 != -1)
      dispatch_once(&qword_1ED06C720, &__block_literal_global_85);
    v14 = (id)_MergedGlobals_674;
    objc_msgSend(v13, "extent");
    v15 = (CGImage *)objc_msgSend(v14, "createCGImage:fromRect:", v13);

    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v15);

  }
  objc_autoreleasePoolPop(v2);
  return v12;
}

- (id)imageWithSize:()PKUIAdditions
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  id v41;
  CGImage *v42;
  CGContext *CurrentContext;
  CGImage *Image;
  void *v45;
  double v47;
  double v48;
  double v49;
  CGAffineTransform transform;
  CGSize v51;
  CGRect v52;

  objc_msgSend(a1, "image");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  v10 = a2 * v9;
  v11 = a3 * v9;
  objc_msgSend(v6, "size");
  v13 = a2 * v9 / v12;
  objc_msgSend(v6, "size");
  v15 = a3 * v9 / v14;
  objc_msgSend(v6, "size");
  v49 = v16;
  v17 = v13;
  v48 = floorf(v17);
  objc_msgSend(v6, "size");
  v47 = v18;
  *(float *)&a3 = v15;
  v19 = floorf(*(float *)&a3);
  objc_msgSend(v6, "size");
  v21 = v20;
  v22 = ceilf(v17);
  objc_msgSend(v6, "size");
  v24 = v23;
  v25 = ceilf(*(float *)&a3);
  objc_msgSend(a1, "variance");
  v28 = vabdd_f64(v47 * v19, v11);
  v29 = v24 * v25 - v11;
  v30 = vabdd_f64(v49 * v48, v10);
  if (v26 <= 0.0)
  {
    v26 = v27;
  }
  else
  {
    v29 = v21 * v22 - v10;
    v28 = v30;
  }
  v31 = fabs(v29);
  v32 = v9 * v26;
  if (v28 <= v32)
    v33 = v19;
  else
    v33 = v25;
  if (v28 <= v32)
    v34 = v48;
  else
    v34 = v22;
  if (v31 <= v32)
    v35 = v25;
  else
    v35 = v33;
  if (v31 <= v32)
    v36 = v22;
  else
    v36 = v34;
  objc_msgSend(v6, "size");
  v38 = v37 * (v36 / v9);
  objc_msgSend(v6, "size");
  v40 = v39 * (v35 / v9);
  v41 = objc_retainAutorelease(v6);
  v42 = (CGImage *)objc_msgSend(v41, "CGImage");
  v51.width = v38;
  v51.height = v40;
  UIGraphicsBeginImageContextWithOptions(v51, 0, v9);
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSetInterpolationQuality(CurrentContext, kCGInterpolationNone);
  transform.b = 0.0;
  transform.c = 0.0;
  transform.a = 1.0;
  *(_OWORD *)&transform.d = xmmword_19DF16010;
  transform.ty = v40;
  CGContextConcatCTM(CurrentContext, &transform);
  v52.origin.x = 0.0;
  v52.origin.y = 0.0;
  v52.size.width = v38;
  v52.size.height = v40;
  CGContextDrawImage(CurrentContext, v52, v42);
  Image = CGBitmapContextCreateImage(CurrentContext);
  UIGraphicsEndImageContext();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", Image, objc_msgSend(v41, "imageOrientation"), v9);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(Image);

  return v45;
}

- (double)variance
{
  unint64_t v1;

  v1 = objc_msgSend(a1, "format") - 1;
  if (v1 > 2)
    return *MEMORY[0x1E0C9D820];
  else
    return dbl_19DF16058[v1];
}

- (double)sizeForPassStyle:()PKUIAdditions
{
  unint64_t v3;
  double result;
  uint64_t v5;

  if (a3 < 8)
    goto LABEL_2;
  if (a3 != 8)
  {
    if (a3 != 9)
      return *MEMORY[0x1E0C9D820];
LABEL_2:
    v3 = objc_msgSend(a1, "format") - 1;
    if (v3 < 4)
      return dbl_19DF16070[v3];
    return *MEMORY[0x1E0C9D820];
  }
  v5 = objc_msgSend(a1, "format");
  result = 245.0;
  switch(v5)
  {
    case 1:
      result = dbl_19DF16020[PKUseTallPasses() == 0];
      break;
    case 2:
    case 4:
      return result;
    case 3:
      result = 160.0;
      break;
    default:
      return *MEMORY[0x1E0C9D820];
  }
  return result;
}

@end
