@implementation UIImage(Blur)

- (id)applyBlurWithRadius:()Blur tintColor:saturationDeltaFactor:maskImage:
{
  id v9;
  id v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v18;
  id v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  id v26;
  void *v27;
  double v28;
  void *v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  void *v34;
  double v35;
  CGFloat v36;
  CGContext *CurrentContext;
  double v38;
  id v39;
  CGImage *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  void *v45;
  double v46;
  CGFloat v47;
  CGContext *v48;
  void *v49;
  double v50;
  double v51;
  float64x2_t v52;
  uint64_t v53;
  double *v54;
  float64x2_t v55;
  float64x2_t v56;
  float64x2_t v57;
  double v58;
  CGFloat v59;
  double v60;
  CGFloat v61;
  void *v62;
  double v63;
  CGFloat v64;
  CGContext *v65;
  double v66;
  CGImage *v67;
  CGImage *v68;
  CGImage *v69;
  uint64_t v70;
  __n128 v71;
  vImage_Buffer dest;
  vImage_Buffer src;
  double v74;
  double v75;
  double v76;
  uint64_t v77;
  float64x2_t v78;
  float64_t v79;
  uint64_t v80;
  float64_t v81;
  float64x2_t v82;
  __int128 v83;
  __int128 v84;
  uint64_t v85;
  uint64_t v86;
  CGSize v87;
  CGSize v88;
  CGSize v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v71 = a3;
  v86 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  v10 = a6;
  objc_msgSend(a1, "size");
  if (v11 < 1.0 || (objc_msgSend(a1, "size"), v12 < 1.0))
  {
    objc_msgSend(a1, "size", v71.n128_u64[0]);
    v14 = v13;
    objc_msgSend(a1, "size");
    NSLog(CFSTR("*** error: invalid size: (%.2f x %.2f). Both dimensions must be >= 1: %@"), v14, v15, a1);
LABEL_4:
    v16 = 0;
    goto LABEL_5;
  }
  v18 = objc_retainAutorelease(a1);
  if (!objc_msgSend(v18, "CGImage"))
  {
    NSLog(CFSTR("*** error: image must be backed by a CGImage: %@"), v18);
    goto LABEL_4;
  }
  if (v10)
  {
    v19 = objc_retainAutorelease(v10);
    if (!objc_msgSend(v19, "CGImage"))
    {
      NSLog(CFSTR("*** error: maskImage must be backed by a CGImage: %@"), v19);
      goto LABEL_4;
    }
  }
  v20 = *MEMORY[0x24BDBEFB0];
  v21 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  objc_msgSend(v18, "size", v71.n128_u64[0]);
  v23 = v22;
  v25 = v24;
  v26 = v18;
  v27 = v26;
  v28 = fabs(v71.n128_f64[0] + -1.0);
  if (a2 > 0.00000011920929 || v28 > 0.00000011920929)
  {
    objc_msgSend(v26, "size");
    v31 = v30;
    v33 = v32;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "scale");
    v36 = v35;
    v87.width = v31;
    v87.height = v33;
    UIGraphicsBeginImageContextWithOptions(v87, 0, v36);

    CurrentContext = UIGraphicsGetCurrentContext();
    CGContextScaleCTM(CurrentContext, 1.0, -1.0);
    objc_msgSend(v27, "size");
    CGContextTranslateCTM(CurrentContext, 0.0, -v38);
    v39 = objc_retainAutorelease(v27);
    v40 = (CGImage *)objc_msgSend(v39, "CGImage");
    v90.origin.x = v20;
    v90.origin.y = v21;
    v90.size.width = v23;
    v90.size.height = v25;
    CGContextDrawImage(CurrentContext, v90, v40);
    src.data = CGBitmapContextGetData(CurrentContext);
    src.width = CGBitmapContextGetWidth(CurrentContext);
    src.height = CGBitmapContextGetHeight(CurrentContext);
    src.rowBytes = CGBitmapContextGetBytesPerRow(CurrentContext);
    objc_msgSend(v39, "size");
    v42 = v41;
    v44 = v43;
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "scale");
    v47 = v46;
    v88.width = v42;
    v88.height = v44;
    UIGraphicsBeginImageContextWithOptions(v88, 0, v47);

    v48 = UIGraphicsGetCurrentContext();
    dest.data = CGBitmapContextGetData(v48);
    dest.width = CGBitmapContextGetWidth(v48);
    dest.height = CGBitmapContextGetHeight(v48);
    dest.rowBytes = CGBitmapContextGetBytesPerRow(v48);
    if (a2 > 0.00000011920929)
    {
      objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "scale");
      v51 = v50 * a2;

      LODWORD(v49) = vcvtmd_u64_f64(v51 * 3.0 * 2.50662827 * 0.25 + 0.5) | 1;
      vImageBoxConvolve_ARGB8888(&src, &dest, 0, 0, 0, (uint32_t)v49, (uint32_t)v49, 0, 8u);
      vImageBoxConvolve_ARGB8888(&dest, &src, 0, 0, 0, (uint32_t)v49, (uint32_t)v49, 0, 8u);
      vImageBoxConvolve_ARGB8888(&src, &dest, 0, 0, 0, (uint32_t)v49, (uint32_t)v49, 0, 8u);
    }
    if (v28 > 0.00000011920929)
    {
      v74 = v71.n128_f64[0] * 0.9278 + 0.0722;
      v75 = v71.n128_f64[0] * -0.0722 + 0.0722;
      v76 = v75;
      v78 = vmlaq_n_f64((float64x2_t)vdupq_n_s64(0x3FE6E2EB1C432CA5uLL), (float64x2_t)xmmword_22BA8CDC0, v71.n128_f64[0]);
      v79 = v78.f64[0];
      v77 = 0;
      v80 = 0;
      v52 = vmlaq_n_f64((float64x2_t)vdupq_n_s64(0x3FCB367A0F9096BCuLL), (float64x2_t)xmmword_22BA8CDD0, v71.n128_f64[0]);
      v81 = v52.f64[0];
      v82 = v52;
      v83 = 0u;
      v84 = 0u;
      v85 = 0x3FF0000000000000;
      v53 = 0;
      v54 = &v74;
      v55 = (float64x2_t)vdupq_n_s64(0x4070000000000000uLL);
      do
      {
        v56 = *(float64x2_t *)v54;
        v57 = *(float64x2_t *)(v54 + 2);
        v54 += 4;
        *(uint64_t *)((char *)&v70 + v53) = (uint64_t)vmovn_s32(vcvtq_s32_f32(vrndaq_f32(vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(vmulq_f64(v56, v55)), vmulq_f64(v57, v55)))));
        v53 += 8;
      }
      while (v53 != 32);
      if (a2 > 0.00000011920929)
      {
        vImageMatrixMultiply_ARGB8888(&dest, &src, (const int16_t *)&v70, 256, 0, 0, 0);
        UIGraphicsEndImageContext();
        UIGraphicsGetImageFromCurrentImageContext();
        v29 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_24:
        UIGraphicsEndImageContext();
        goto LABEL_25;
      }
      vImageMatrixMultiply_ARGB8888(&src, &dest, (const int16_t *)&v70, 256, 0, 0, 0);
    }
    UIGraphicsGetImageFromCurrentImageContext();
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
    goto LABEL_24;
  }
  v29 = v26;
LABEL_25:
  objc_msgSend(v27, "size");
  v59 = v58;
  v61 = v60;
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "scale");
  v64 = v63;
  v89.width = v59;
  v89.height = v61;
  UIGraphicsBeginImageContextWithOptions(v89, 0, v64);

  v65 = UIGraphicsGetCurrentContext();
  CGContextScaleCTM(v65, 1.0, -1.0);
  objc_msgSend(v27, "size");
  CGContextTranslateCTM(v65, 0.0, -v66);
  v67 = (CGImage *)objc_msgSend(objc_retainAutorelease(v27), "CGImage");
  v91.origin.x = v20;
  v91.origin.y = v21;
  v91.size.width = v23;
  v91.size.height = v25;
  CGContextDrawImage(v65, v91, v67);
  if (a2 > 0.00000011920929)
  {
    CGContextSaveGState(v65);
    if (v10)
    {
      v68 = (CGImage *)objc_msgSend(objc_retainAutorelease(v10), "CGImage");
      v92.origin.x = v20;
      v92.origin.y = v21;
      v92.size.width = v23;
      v92.size.height = v25;
      CGContextClipToMask(v65, v92, v68);
    }
    v69 = (CGImage *)objc_msgSend(objc_retainAutorelease(v29), "CGImage");
    v93.origin.x = v20;
    v93.origin.y = v21;
    v93.size.width = v23;
    v93.size.height = v25;
    CGContextDrawImage(v65, v93, v69);
    CGContextRestoreGState(v65);
  }
  if (v9)
  {
    CGContextSaveGState(v65);
    CGContextSetFillColorWithColor(v65, (CGColorRef)objc_msgSend(objc_retainAutorelease(v9), "CGColor"));
    v94.origin.x = v20;
    v94.origin.y = v21;
    v94.size.width = v23;
    v94.size.height = v25;
    CGContextFillRect(v65, v94);
    CGContextRestoreGState(v65);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

LABEL_5:
  return v16;
}

@end
