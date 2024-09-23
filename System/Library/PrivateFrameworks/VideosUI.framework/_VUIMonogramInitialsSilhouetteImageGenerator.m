@implementation _VUIMonogramInitialsSilhouetteImageGenerator

+ (id)_initialsForFirstName:(id)a3 lastName:(id)a4
{
  unint64_t v5;
  unint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __CFString *v12;
  uint64_t v13;
  __CFString *v14;
  void *v15;
  void *v16;

  v5 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (v5 | v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3850]);
    objc_msgSend(v7, "setGivenName:", v5);
    objc_msgSend(v7, "setFamilyName:", v6);
    v8 = objc_alloc_init(MEMORY[0x1E0CB3858]);
    objc_msgSend(v8, "setStyle:", 4);
    objc_msgSend(v8, "set_ignoresFallbacks:", 1);
    objc_msgSend(v8, "stringFromPersonNameComponents:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v9, "length"))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      v11 = objc_msgSend((id)v5, "length");
      if (v11)
      {
        objc_msgSend((id)v5, "substringWithRange:", 0, 1);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = &stru_1E9FF3598;
      }
      v13 = objc_msgSend((id)v6, "length");
      if (v13)
      {
        objc_msgSend((id)v6, "substringWithRange:", 0, 1);
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v14 = &stru_1E9FF3598;
      }
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@"), v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      if (v11)

      if (objc_msgSend(v15, "length"))
      {
        v9 = v15;
      }
      else
      {

        v9 = 0;
      }
    }

  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v9, "uppercaseString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (void)drawInitialsWithRect:(CGRect)a3 andDescription:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGContext *CurrentContext;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  CGColorSpace *DeviceRGB;
  id v23;
  id v24;
  const __CFArray *v25;
  CGGradientRef v26;
  CGGradient *v27;
  CGFloat MaxY;
  double v29;
  double v30;
  CGContext *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  CGColorSpace *v36;
  const __CFArray *v37;
  CGGradientRef v38;
  CGGradient *v39;
  CGFloat v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  uint64_t v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  CGContext *v70;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  CGFloat locations[2];
  uint64_t v76;
  CGPoint v77;
  CGPoint v78;
  CGPoint v79;
  CGPoint v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v76 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  objc_msgSend(v8, "fillColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  objc_msgSend(v8, "size");
  v14 = v13;
  objc_msgSend(v8, "cornerRadius");
  if (v15 <= 0.0)
  {
    CurrentContext = UIGraphicsGetCurrentContext();
    objc_msgSend(v8, "gradientStartColor");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "gradientEndColor");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v19;
    if (!v18 || !v19)
    {
      v21 = v12;

      v18 = v21;
      v20 = v18;
    }
    DeviceRGB = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)locations = xmmword_1DA1C23E0;
    v23 = objc_retainAutorelease(v18);
    v73[0] = objc_msgSend(v23, "CGColor");
    v24 = objc_retainAutorelease(v20);
    v73[1] = objc_msgSend(v24, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v73, 2);
    v25 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    v26 = CGGradientCreateWithColors(DeviceRGB, v25, locations);
    if (v26)
    {
      v27 = v26;
      v81.origin.x = x;
      v81.origin.y = y;
      v81.size.width = width;
      v81.size.height = height;
      MaxY = CGRectGetMaxY(v81);
      CGContextSaveGState(CurrentContext);
      CGContextTranslateCTM(CurrentContext, 0.0, height);
      CGContextScaleCTM(CurrentContext, 1.0, -1.0);
      v77.x = 0.0;
      v77.y = 0.0;
      v79.x = 0.0;
      v79.y = MaxY;
      CGContextDrawLinearGradient(CurrentContext, v27, v77, v79, 3u);
      CGContextRestoreGState(CurrentContext);
      CGGradientRelease(v27);
    }
    else
    {
      objc_msgSend(v12, "setFill");
      v83.origin.x = x;
      v83.origin.y = y;
      v83.size.width = width;
      v83.size.height = height;
      UIRectFill(v83);
    }
    CFRelease(DeviceRGB);
  }
  else
  {
    v16 = v15;
    if (fabs(v14 * 0.5) == v15)
    {
      +[VUIBezierPath bezierPathWithOvalInRect:](VUIBezierPath, "bezierPathWithOvalInRect:", x, y, width, height);
    }
    else
    {
      objc_msgSend(v8, "size");
      +[VUIBezierPath vui_bezierPathWithRoundedRect:radius:](VUIBezierPath, "vui_bezierPathWithRoundedRect:radius:", x, y, width, height, v16 * (fmax(width, height) / fmax(v29, v30)));
    }
    v23 = (id)objc_claimAutoreleasedReturnValue();
    v31 = UIGraphicsGetCurrentContext();
    objc_msgSend(v8, "gradientStartColor");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "gradientEndColor");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (!v32 || !v33)
    {
      v35 = v12;

      v32 = v35;
      v34 = v32;
    }
    v36 = CGColorSpaceCreateDeviceRGB();
    *(_OWORD *)locations = xmmword_1DA1C23E0;
    v24 = objc_retainAutorelease(v32);
    v74[0] = objc_msgSend(v24, "CGColor");
    v25 = objc_retainAutorelease(v34);
    v74[1] = -[__CFArray CGColor](v25, "CGColor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v74, 2);
    v37 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    v38 = CGGradientCreateWithColors(v36, v37, locations);
    if (v38)
    {
      v39 = v38;
      v82.origin.x = x;
      v82.origin.y = y;
      v82.size.width = width;
      v82.size.height = height;
      v40 = CGRectGetMaxY(v82);
      CGContextSaveGState(v31);
      CGContextAddPath(v31, (CGPathRef)objc_msgSend(objc_retainAutorelease(v23), "CGPath"));
      CGContextTranslateCTM(v31, 0.0, height);
      CGContextScaleCTM(v31, 1.0, -1.0);
      CGContextClip(v31);
      v78.x = 0.0;
      v78.y = 0.0;
      v80.x = 0.0;
      v80.y = v40;
      CGContextDrawLinearGradient(v31, v39, v78, v80, 3u);
      CGContextRestoreGState(v31);
      CGGradientRelease(v39);
    }
    else
    {
      objc_msgSend(v23, "addClip");
      objc_msgSend(v12, "set");
      objc_msgSend(v23, "fill");
    }
    CFRelease(v36);

  }
  objc_msgSend(v8, "font");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v42, "length"))
  {
    objc_msgSend(v8, "text");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = (void *)objc_opt_class();
    objc_msgSend(v8, "firstName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lastName");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_initialsForFirstName:lastName:", v45, v46);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v43, "length"))
  {
    objc_msgSend(v8, "textColor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (v47)
    {
      v49 = v47;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v49 = (id)objc_claimAutoreleasedReturnValue();
    }
    v50 = v49;

    v51 = objc_alloc(MEMORY[0x1E0CB3498]);
    v52 = *MEMORY[0x1E0DC1140];
    v71[0] = *MEMORY[0x1E0DC1138];
    v71[1] = v52;
    v72[0] = v41;
    v72[1] = v50;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 2);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v51, "initWithString:attributes:", v43, v53);

    objc_msgSend(v54, "size");
    v56 = v55;
    v58 = v57;
    objc_msgSend(v8, "specialOffsetForString:", v43);
    +[VUIUtilities vuiRectCenteredXInRect:boundsToCenterIn:offset:](VUIUtilities, "vuiRectCenteredXInRect:boundsToCenterIn:offset:", 0.0, 0.0, v56, v58, x, y, width, height, v59);
    v61 = v60;
    v63 = v62;
    v65 = v64;
    objc_msgSend(v41, "capHeight");
    v67 = (height - v66) * -0.5;
    objc_msgSend(v41, "pointSize");
    v69 = height - v68 + v67;
    v70 = UIGraphicsGetCurrentContext();
    CGContextSetBlendMode(v70, kCGBlendModeCopy);
    objc_msgSend(v54, "drawInRect:", v61, v69, v63, v65);

  }
}

+ (id)monogramImageWithDescription:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;

  v3 = a3;
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v3, "defaultImageSize");
  v9 = v8;
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0DC69E8], "preferredFormat");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPreferredRange:", 2);
  v13 = (void *)MEMORY[0x1E0DC69E8];
  v14 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __77___VUIMonogramInitialsSilhouetteImageGenerator_monogramImageWithDescription___block_invoke;
  v24[3] = &unk_1E9FA18D8;
  v26 = 0;
  v27 = 0;
  v28 = v9;
  v29 = v11;
  v15 = v3;
  v25 = v15;
  objc_msgSend(v13, "imageWithSize:format:actions:", v12, v24, v9, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != v5 || v11 != v7)
  {
    v18[0] = v14;
    v18[1] = 3221225472;
    v18[2] = __77___VUIMonogramInitialsSilhouetteImageGenerator_monogramImageWithDescription___block_invoke_2;
    v18[3] = &unk_1E9FA18D8;
    v20 = 0;
    v21 = 0;
    v19 = v16;
    v22 = v5;
    v23 = v7;
    objc_msgSend(MEMORY[0x1E0DC69E8], "imageWithSize:format:actions:", v12, v18, v5, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

- (id)imageKeyForObject:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  double *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;
  if (objc_msgSend(v5, "preferedMonogramType") == 2)
  {
    objc_msgSend(v5, "firstName");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastName");
    v7 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "font");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fontName");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fillColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v36 = (void *)v10;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v13;

    v40 = 0.0;
    v38 = 0.0;
    v39 = 0.0;
    v37 = 0;
    objc_msgSend(MEMORY[0x1E0DC69B0], "vuiColor:getRed:green:blue:alpha:", v18, &v40, &v39, &v38, &v37);
    v19 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v8, "length"))
      v20 = v8;
    else
      v20 = (void *)v6;
    v21 = (void *)v6;
    v22 = (__CFString *)v7;
    if (objc_msgSend(v8, "length"))
      v7 = &stru_1E9FF3598;
    objc_msgSend(v9, "pointSize");
    v24 = v23;
    objc_msgSend(v5, "cornerRadius");
    v25 = &dbl_1DA1C1FF8[1];
    LODWORD(v25) = vcvtad_u64_f64(v40 * 255.0);
    LODWORD(v26) = vcvtad_u64_f64(v39 * 255.0);
    LODWORD(v27) = vcvtad_u64_f64(v38 * 255.0);
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@_%@_%@_%.0f_%.0f_%02X%02X%02X%.1f"), v20, v7, v36, v24, v28, v25, v26, v27, v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_26:
    goto LABEL_27;
  }
  if (objc_msgSend(v5, "preferedMonogramType") == 1 || !objc_msgSend(v5, "preferedMonogramType"))
  {
    objc_msgSend(v5, "fillColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v21 = v17;

    v40 = 0.0;
    v38 = 0.0;
    v39 = 0.0;
    v37 = 0;
    if (v21)
      objc_msgSend(MEMORY[0x1E0DC69B0], "vuiColor:getRed:green:blue:alpha:", v21, &v40, &v39, &v38, &v37);
    v29 = (void *)MEMORY[0x1E0CB3940];
    if (objc_msgSend(v5, "shouldFallBackToSilhouette"))
      v30 = CFSTR("yes-man");
    else
      v30 = CFSTR("no-man");
    objc_msgSend(v5, "cornerRadius");
    v31 = &dbl_1DA1C1FF8[1];
    LODWORD(v31) = vcvtad_u64_f64(v40 * 255.0);
    LODWORD(v32) = vcvtad_u64_f64(v39 * 255.0);
    LODWORD(v33) = vcvtad_u64_f64(v38 * 255.0);
    objc_msgSend(v29, "stringWithFormat:", CFSTR("Silhouette_%@_%.0f_%02X%02X%02X%.1f"), v30, v34, v31, v32, v33, v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  v14 = 0;
LABEL_27:

  return v14;
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  id v25;
  id v26;
  id location;

  v11 = a3;
  v12 = a7;
  v13 = a8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v14 = v11;
  else
    v14 = 0;
  v15 = v14;
  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0CB34C8]);
    objc_initWeak(&location, v16);
    v20 = MEMORY[0x1E0C809B0];
    v21 = 3221225472;
    v22 = __136___VUIMonogramInitialsSilhouetteImageGenerator_loadImageForObject_scaleToSize_cropToFit_imageDirection_requestLoader_completionHandler___block_invoke;
    v23 = &unk_1E9F99600;
    objc_copyWeak(&v26, &location);
    v24 = v15;
    v25 = v13;
    objc_msgSend(v16, "addExecutionBlock:", &v20);
    -[_VUIMonogramImageGenerator imageGeneratorQueue](self, "imageGeneratorQueue", v20, v21, v22, v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addOperation:", v16);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0DC6BA8], 107, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, 0, 0, v18);

    v16 = 0;
  }

  return v16;
}

- (void)cancelLoad:(id)a3
{
  id v3;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "cancel");

}

@end
