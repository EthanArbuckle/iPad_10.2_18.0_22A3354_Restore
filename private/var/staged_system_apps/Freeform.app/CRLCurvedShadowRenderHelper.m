@implementation CRLCurvedShadowRenderHelper

- (CRLCurvedShadowRenderHelper)init
{
  CRLCurvedShadowRenderHelper *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLCurvedShadowRenderHelper;
  result = -[CRLCurvedShadowRenderHelper init](&v3, "init");
  if (result)
    result->mCIContextCreationLock._os_unfair_lock_opaque = 0;
  return result;
}

- (double)p_baseBlurRadiusForCurve:(double)a3 unscaledSize:(CGSize)a4
{
  return fmax(fmin((fabs(a3) * 0.5 + fmin(1.0 - (1000.0 - a4.width) / 1000.0, 1.0) * 0.5) * 15.0, 15.0), 4.0);
}

- (void)drawCurvedShadow:(id)a3 forImage:(CGImage *)a4 inContext:(CGContext *)a5 forUnscaledSize:(CGSize)a6 withScaleFactor:(double)a7
{
  double height;
  double width;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  id v47;
  CIContext *mCIContext;
  CGImage *v49;
  CGImage *v50;
  double v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  void *v55;
  void *v56;
  void *v57;
  void *context;
  void *v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  height = a6.height;
  width = a6.width;
  v13 = a3;
  if (a7 <= 0.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F670);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E0472C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F690);
    v14 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadowRenderHelper drawCurvedShadow:forImage:inContext:forUnscaledSize:withScaleFactor:]"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadowRenderHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 87, 0, "scaleFactor (%f) should be greater than 0.", *(_QWORD *)&a7);

  }
  if (a7 > 1.0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F6B0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E04698();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F6D0);
    v17 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadowRenderHelper drawCurvedShadow:forImage:inContext:forUnscaledSize:withScaleFactor:]"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadowRenderHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 88, 0, "scaleFactor (%f) should not be greater than 1.", *(_QWORD *)&a7);

  }
  context = objc_autoreleasePoolPush();
  ++dword_101414F08;
  objc_msgSend(v13, "paddingForBlur");
  v21 = v20 * 0.5 * a7;
  objc_msgSend(v13, "curve");
  v23 = v22;
  objc_msgSend(v13, "offset");
  v25 = v24;
  objc_opt_class(CRLCurvedShadowCurveFilter, v26);
  objc_opt_class(CRLCurvedShadowBlurBlendFilter, v27);
  CGContextSaveGState(a5);
  -[CRLCurvedShadowRenderHelper p_setupCIContext](self, "p_setupCIContext");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[CIImage imageWithCGImage:](CIImage, "imageWithCGImage:", a4));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d-%d--%@"), dword_101414F08, 0, CFSTR("sourceImage")));
  -[CRLCurvedShadowRenderHelper p_debugLogImage:name:](self, "p_debugLogImage:name:", v28, v29);

  objc_msgSend(v28, "extent");
  v61 = CGRectInset(v60, v21, 0.0);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageByCroppingToRect:", v61.origin.x, v61.origin.y, v61.size.width, v61.size.height));
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d-%d--%@"), dword_101414F08, 0, CFSTR("sourceCroppedImage")));
  -[CRLCurvedShadowRenderHelper p_debugLogImage:name:](self, "p_debugLogImage:name:", v30, v31);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCurvedShadowRenderHelper p_alphaOnlyImageFromImage:](self, "p_alphaOnlyImageFromImage:", v30));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d-%d--%@"), dword_101414F08, 0, CFSTR("alphaImage")));
  -[CRLCurvedShadowRenderHelper p_debugLogImage:name:](self, "p_debugLogImage:name:", v32, v33);

  v59 = v13;
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "color"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCurvedShadowRenderHelper p_tintedCIImageFromImage:withColor:](self, "p_tintedCIImageFromImage:withColor:", v32, v34));

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d-%d--%@"), dword_101414F08, 0, CFSTR("tintedResult")));
  -[CRLCurvedShadowRenderHelper p_debugLogImage:name:](self, "p_debugLogImage:name:", v35, v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCurvedShadowRenderHelper p_curvedImageFromImage:curveAmount:padding:](self, "p_curvedImageFromImage:curveAmount:padding:", v35, v23 * -50.0 * a7, v21));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d-%d--%@"), dword_101414F08, 0, CFSTR("curvedImage")));
  -[CRLCurvedShadowRenderHelper p_debugLogImage:name:](self, "p_debugLogImage:name:", v37, v38);

  v39 = fmin(fabs(v25) * 0.25, 20.0) * a7;
  -[CRLCurvedShadowRenderHelper p_baseBlurRadiusForCurve:unscaledSize:](self, "p_baseBlurRadiusForCurve:unscaledSize:", v23, width, height);
  v41 = v39 + v40 * a7;
  if (v23 <= 0.0)
    v42 = 0.5;
  else
    v42 = 1.0;
  if (v23 <= 0.0)
    v43 = 1.0;
  else
    v43 = 0.5;
  if (v23 >= 0.0)
    v44 = v39;
  else
    v44 = v39 + v40 * a7;
  if (v23 < 0.0)
    v41 = v39;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCurvedShadowRenderHelper p_blurredImage:edgeBlurRadius:middleBlurRadius:padding:edgeOpacity:middleOpacity:](self, "p_blurredImage:edgeBlurRadius:middleBlurRadius:padding:edgeOpacity:middleOpacity:", v37, v44, v41, v21, v42, v43));
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d-%d--%@"), dword_101414F08, 0, CFSTR("blurredImage")));
  -[CRLCurvedShadowRenderHelper p_debugLogImage:name:](self, "p_debugLogImage:name:", v45, v46);

  v47 = v45;
  mCIContext = self->mCIContext;
  objc_msgSend(v47, "extent");
  v49 = -[CIContext createCGImage:fromRect:](mCIContext, "createCGImage:fromRect:", v47);
  if (v49)
  {
    v50 = v49;
    objc_msgSend(v47, "extent");
    v62.origin.x = sub_100063148(v51, v52, v53, v54);
    CGContextDrawImage(a5, v62, v50);
    CGImageRelease(v50);
  }
  else
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F6F0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E045F8();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123F710);
    v55 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLCurvedShadowRenderHelper drawCurvedShadow:forImage:inContext:forUnscaledSize:withScaleFactor:]"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLCurvedShadowRenderHelper.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v56, v57, 152, 0, "Cannot render curved shadow, the size is too large for the CIContext to convert back to a CGImage. Skipping render.");

  }
  CGContextRestoreGState(a5);

  objc_autoreleasePoolPop(context);
}

- (void)p_setupCIContext
{
  os_unfair_lock_s *p_mCIContextCreationLock;
  CIContext *v4;
  CIContext *mCIContext;

  if (!self->mCIContext)
  {
    p_mCIContextCreationLock = &self->mCIContextCreationLock;
    os_unfair_lock_lock(&self->mCIContextCreationLock);
    if (!self->mCIContext)
    {
      v4 = (CIContext *)objc_claimAutoreleasedReturnValue(+[CIContext contextWithOptions:](CIContext, "contextWithOptions:", 0));
      mCIContext = self->mCIContext;
      self->mCIContext = v4;

    }
    os_unfair_lock_unlock(p_mCIContextCreationLock);
  }
}

- (id)p_tintedCIImageFromImage:(id)a3 withColor:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;

  v12 = xmmword_100EED760;
  v13 = unk_100EED770;
  v5 = a3;
  objc_msgSend(a4, "getRGBAComponents:", &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConstantColorGenerator")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", v12, v13));
  objc_msgSend(v6, "setValue:forKey:", v7, CFSTR("inputColor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForKey:", CFSTR("outputImage")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIMultiplyCompositing")));
  objc_msgSend(v9, "setValue:forKey:", v8, CFSTR("inputImage"));
  objc_msgSend(v9, "setValue:forKey:", v5, CFSTR("inputBackgroundImage"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("outputImage")));
  return v10;
}

- (id)p_debugColorOverlayImageFromImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
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
  void *v16;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:](CIFilter, "filterWithName:", CFSTR("CIConstantColorGenerator")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CIColor colorWithRed:green:blue:alpha:](CIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.0, 1.0, 0.5));
  objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("inputColor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", CFSTR("outputImage")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageByCompositingOverImage:", v6));
  objc_msgSend(v3, "extent");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "imageByCroppingToRect:", v9, v11, v13, v15));
  return v16;
}

- (id)p_alphaOnlyImageFromImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CIVector vectorWithX:Y:Z:W:](CIVector, "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 0.0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIColorMatrix"), kCIInputImageKey, v3, CFSTR("inputRVector"), v4, CFSTR("inputGVector"), v4, CFSTR("inputBVector"), v4, CFSTR("inputAVector"), v4, CFSTR("inputBiasVector"), v5, 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "outputImage"));
  return v7;
}

- (id)p_curvedImageFromImage:(id)a3 curveAmount:(double)a4 padding:(double)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[4];

  v7 = a3;
  objc_msgSend(v7, "extent");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCurvedShadowCurveFilter curveKernel](CRLCurvedShadowCurveFilter, "curveKernel"));
  v23[0] = v7;
  v23[1] = v16;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
  v23[2] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v23[3] = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 4));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "applyWithExtent:roiCallback:arguments:", &stru_10123F750, v20, v9, v11, v13, v15));
  return v21;
}

- (id)p_blurredImage:(id)a3 edgeBlurRadius:(double)a4 middleBlurRadius:(double)a5 padding:(double)a6 edgeOpacity:(double)a7 middleOpacity:(double)a8
{
  id v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double x;
  double y;
  double width;
  double height;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[7];
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v13 = a3;
  v14 = sub_1003C660C(a4, a5, 0.5);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIGaussianBlur"), kCIInputImageKey, v13, kCIInputRadiusKey, v15, 0));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "outputImage"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a5));
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIGaussianBlur"), kCIInputImageKey, v13, kCIInputRadiusKey, v17, 0));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "outputImage"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CIFilter filterWithName:keysAndValues:](CIFilter, "filterWithName:keysAndValues:", CFSTR("CIGaussianBlur"), kCIInputImageKey, v13, kCIInputRadiusKey, v19, 0));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "outputImage"));
  v46 = v16;
  objc_msgSend(v16, "extent");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  objc_msgSend(v18, "extent");
  v52.origin.x = v30;
  v52.origin.y = v31;
  v52.size.width = v32;
  v52.size.height = v33;
  v50.origin.x = v23;
  v50.origin.y = v25;
  v50.size.width = v27;
  v50.size.height = v29;
  v51 = CGRectUnion(v50, v52);
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[CIVector vectorWithCGRect:](CIVector, "vectorWithCGRect:"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[CRLCurvedShadowBlurBlendFilter blurBlendKernel](CRLCurvedShadowBlurBlendFilter, "blurBlendKernel"));
  v49[0] = v16;
  v49[1] = v21;
  v49[2] = v18;
  v49[3] = v38;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a6));
  v49[4] = v40;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a7));
  v49[5] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a8));
  v49[6] = v42;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v49, 7));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "applyWithExtent:roiCallback:arguments:", &stru_10123F770, v43, x, y, width, height));

  return v44;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mCIContext, 0);
}

@end
