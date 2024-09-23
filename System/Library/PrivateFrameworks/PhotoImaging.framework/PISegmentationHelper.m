@implementation PISegmentationHelper

+ (id)imageFromImageLayer:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  __CVBuffer *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (__CVBuffer *)objc_msgSend(v4, "image");

  v7 = (void *)CVBufferCopyAttachment(v6, (CFStringRef)*MEMORY[0x1E0CA8CB0], 0);
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA8CC0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9 ^ 1u);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C9E130]);

  }
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v6, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)infillMaskForSegmentationMatte:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v3 = a3;
  +[PISegmentationHelper thresholdImage:withThreshold:](PISegmentationHelper, "thresholdImage:withThreshold:", v3, 0.1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extent");
  v6 = v5;
  v8 = v7;

  if (v6 <= v8)
    v9 = v8;
  else
    v9 = v6;
  +[PISegmentationHelper dilateMask:withRadius:](PISegmentationHelper, "dilateMask:withRadius:", v4, v9 * 0.01);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)imageWithColor:(id)a3 extent:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = (void *)MEMORY[0x1E0C9DDB8];
  v9 = a3;
  objc_msgSend(v8, "filterWithName:", CFSTR("CIConstantColorGenerator"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v9, *MEMORY[0x1E0C9E1C0]);

  objc_msgSend(v10, "outputImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageByCroppingToRect:", x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)thresholdImage:(id)a3 withThreshold:(double)a4
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;

  v5 = (void *)MEMORY[0x1E0C9DDB8];
  v6 = a3;
  objc_msgSend(v5, "colorThresholdFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  objc_msgSend(v7, "setThreshold:", v8);
  objc_msgSend(v7, "setInputImage:", v6);

  objc_msgSend(v7, "outputImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)dilateMask:(id)a3 withRadius:(double)a4
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v5 = (void *)MEMORY[0x1E0C9DDB8];
  v6 = a3;
  objc_msgSend(v5, "morphologyMaximumFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  objc_msgSend(v7, "setRadius:", v8);
  objc_msgSend(v7, "setInputImage:", v6);
  objc_msgSend(v7, "outputImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extent");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(v9, "imageByCroppingToRect:", v11, v13, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)erodeMask:(id)a3 withRadius:(double)a4
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;

  v5 = (void *)MEMORY[0x1E0C9DDB8];
  v6 = a3;
  objc_msgSend(v5, "morphologyMinimumFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a4;
  objc_msgSend(v7, "setRadius:", v8);
  objc_msgSend(v7, "setInputImage:", v6);
  objc_msgSend(v7, "outputImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extent");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  objc_msgSend(v9, "imageByCroppingToRect:", v11, v13, v15, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)openMask:(id)a3 withRadius:(double)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;

  v5 = a3;
  objc_msgSend(v5, "extent");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "imageByClampingToExtent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C9DDB8], "morphologyMinimumFilter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a4 = a4;
  LODWORD(v16) = LODWORD(a4);
  objc_msgSend(v15, "setRadius:", v16);
  objc_msgSend(v15, "setInputImage:", v14);
  objc_msgSend(MEMORY[0x1E0C9DDB8], "morphologyMaximumFilter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "outputImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setInputImage:", v18);

  LODWORD(v19) = LODWORD(a4);
  objc_msgSend(v17, "setRadius:", v19);
  objc_msgSend(v17, "outputImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "imageByCroppingToRect:", v7, v9, v11, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)invertImage:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0C9DDB8];
  v4 = a3;
  objc_msgSend(v3, "colorInvertFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInputImage:", v4);

  objc_msgSend(v5, "outputImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)foregroundForImage:(id)a3 matte:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  objc_msgSend(a1, "upsampleMatteImage:guideImage:", a4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "blendWithMaskFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundImage:", 0);
  objc_msgSend(v8, "setInputImage:", v6);

  objc_msgSend(v8, "setMaskImage:", v7);
  objc_msgSend(v8, "outputImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)backgroundForImage:(id)a3 matte:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "extent");
  objc_msgSend(a1, "upsampleBackgroundImage:toSize:", v6, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C9DDB8], "blendWithMaskFilter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundImage:", v7);

  objc_msgSend(v11, "setInputImage:", 0);
  objc_msgSend(v11, "setMaskImage:", v10);
  objc_msgSend(v11, "outputImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)backgroundForImage:(id)a3 matte:(id)a4 infill:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a1, "infillMaskForSegmentationMatte:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extent");
  objc_msgSend(a1, "upsampleBackgroundImage:toSize:", v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "extent");
  objc_msgSend(a1, "upsampleBackgroundImage:toSize:", v8, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C9DDB8], "blendWithMaskFilter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundImage:", v9);

  objc_msgSend(v17, "setInputImage:", v16);
  objc_msgSend(v17, "setMaskImage:", v13);
  objc_msgSend(v17, "outputImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)upsampleMatteImage:(id)a3 guideImage:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "extent");
    v8 = v7;
    v10 = v9;
    objc_msgSend(v6, "extent");
    if (v8 != v12 || v10 != v11)
    {
      v18[0] = CFSTR("inputSmallImage");
      v18[1] = CFSTR("inputSpatialSigma");
      v19[0] = v5;
      v19[1] = &unk_1E5051CA8;
      v18[2] = CFSTR("inputLumaSigma");
      v19[2] = &unk_1E5051CB8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "imageByApplyingFilter:withInputParameters:", CFSTR("CIEdgePreserveUpsampleFilter"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "imageByClampingToExtent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "extent");
      objc_msgSend(v16, "imageByCroppingToRect:");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

+ (id)upsampleBackgroundImage:(id)a3 toSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  CGAffineTransform v12;
  CGAffineTransform v13;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "extent");
    memset(&v13, 0, sizeof(v13));
    CGAffineTransformMakeScale(&v13, width / v8, height / v9);
    v12 = v13;
    objc_msgSend(v7, "imageByApplyingTransform:highQualityDownsample:", &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

+ (BOOL)matteHistogramIndicatesSubjectDetected:(id)a3
{
  double v3;

  if (!a3)
    return 0;
  objc_msgSend(a3, "threshold:", 0.6);
  return v3 > 0.02;
}

+ (PISegmentationBimodalScore)bimodalScoreForHistogram:(id)a3
{
  id v3;
  double v4;
  float v5;
  double v6;
  double v7;
  float v8;
  float v9;
  float v10;
  float32x2_t v11;
  float32x2_t v12;
  float32x2_t v18;
  float32x2_t v20;
  float v21;
  PISegmentationBimodalScore result;

  if (a3)
  {
    v3 = a3;
    objc_msgSend(v3, "threshold:", 0.01);
    v5 = v4;
    objc_msgSend(v3, "threshold:", 0.99);
    v7 = v6;

    v8 = v7;
    v9 = fmaxf(fminf(v8 * 4.0, 1.0), 0.0);
    v10 = 1.0 - v5;
    v11.f32[0] = 1.0 - v5;
    v11.f32[1] = (float)((float)(1.0 - v5) + v8) + -0.5;
    v12 = vmul_f32(v11, (float32x2_t)0x4000000040800000);
    __asm { FMOV            V4.2S, #1.0 }
    v18 = vmaxnm_f32(vminnm_f32(v12, _D4), 0);
    __asm { FMOV            V6.2S, #3.0 }
    v20 = vmul_f32(vmul_f32(v18, v18), vmla_f32(_D6, (float32x2_t)0xC0000000C0000000, v18));
    v21 = vmuls_lane_f32((float)((float)(v9 * v9) * (float)((float)(v9 * -2.0) + 3.0)) * v20.f32[0], v20, 1);
  }
  else
  {
    v8 = 0.0;
    v10 = 0.0;
    v21 = 0.0;
  }
  result.var2 = v8;
  result.var1 = v10;
  result.var0 = v21;
  return result;
}

+ (float)localConfidenceScoreForLocalConfidenceImage:(id)a3 extent:(CGRect)a4 context:(id)a5
{
  CGFloat height;
  double width;
  double y;
  double x;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  float v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = (void *)MEMORY[0x1E0C9DDB8];
  v11 = a5;
  v12 = a3;
  objc_msgSend(v10, "areaAverageFilter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInputImage:", v12);

  objc_msgSend(v13, "setExtent:", x, y, width, height);
  objc_msgSend(v13, "outputImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0.0;
  objc_msgSend(v11, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v14, &v16, 4, *MEMORY[0x1E0C9E028], 0, *MEMORY[0x1E0D71110], *(double *)(MEMORY[0x1E0D71110] + 8), *(double *)(MEMORY[0x1E0D71110] + 16), *(double *)(MEMORY[0x1E0D71110] + 24));

  *(float *)&height = 1.0 - v16;
  return *(float *)&height;
}

+ (id)localConfidenceImage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorThreshold"), &unk_1E5058FA8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageByApplyingFilter:withInputParameters:", CFSTR("CIColorThreshold"), &unk_1E5058FD0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "imageByApplyingFilter:", CFSTR("CIColorInvert"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C9DDB8], "multiplyCompositingFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInputImage:", v4);
  objc_msgSend(v7, "setBackgroundImage:", v6);
  objc_msgSend(v7, "outputImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISegmentationHelper openMask:withRadius:](PISegmentationHelper, "openMask:withRadius:", v8, 10.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (float)groundedScoreForSegmentationMatte:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  int v18;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "extent");
  v8 = v7;
  v10 = v9 + v7 * 0.0;
  v13 = v11 + v12 * 0.0;
  v14 = v12 * 0.05;
  objc_msgSend(MEMORY[0x1E0C9DDB8], "areaAverageFilter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setInputImage:", v6);

  objc_msgSend(v15, "setExtent:", v10, v13, v8, v14);
  objc_msgSend(v15, "outputImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v5, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v16, &v18, 4, *MEMORY[0x1E0C9E028], 0, *MEMORY[0x1E0D71110], *(double *)(MEMORY[0x1E0D71110] + 8), *(double *)(MEMORY[0x1E0D71110] + 16), *(double *)(MEMORY[0x1E0D71110] + 24));

  LODWORD(v8) = v18;
  return *(float *)&v8;
}

+ (BOOL)topEdgeHasNoContactWithInspectionMatte:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  float v16;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "extent");
  v8 = v7;
  v10 = v9;
  v12 = v11 + -5.0;
  objc_msgSend(MEMORY[0x1E0C9DDB8], "areaAverageFilter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setInputImage:", v6);

  objc_msgSend(v13, "setExtent:", v8, v12, v10, 5.0);
  objc_msgSend(v13, "outputImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0.0;
  objc_msgSend(v5, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v14, &v16, 4, *MEMORY[0x1E0C9E028], 0, *MEMORY[0x1E0D71110], *(double *)(MEMORY[0x1E0D71110] + 8), *(double *)(MEMORY[0x1E0D71110] + 16), *(double *)(MEMORY[0x1E0D71110] + 24));

  LOBYTE(v5) = v16 < 0.05;
  return (char)v5;
}

+ (PISegmentationClockOverlapResult)computeClockLayerOrderWithVisibleFrame:(SEL)a3 segmentationMatte:(CGRect)a4 layoutConfiguration:(id)a5 context:(id)a6 interactive:(id)a7
{
  _BOOL4 v8;
  double height;
  double width;
  double y;
  double x;
  id v16;
  id v17;
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
  id v36;
  void *v37;
  double v38;
  double v39;
  id *v40;
  id v41;
  double v42;
  double v43;
  double v44;
  id v45;
  unint64_t v46;
  double v47;
  double v48;
  id v49;
  id v50;
  void *v51;
  PISegmentationClockOverlapResult *result;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;

  v8 = a8;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v57 = a5;
  v16 = a7;
  v17 = a6;
  objc_msgSend(v17, "timeOverlapCheckBottom");
  v55 = y + v19 * height;
  v56 = x + v18 * width;
  v53 = height * v21;
  v54 = width * v20;
  objc_msgSend(v17, "timeOverlapCheckTop");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v30 = x + v23 * width;
  v31 = y + v25 * height;
  v32 = width * v27;
  v33 = height * v29;
  +[PISegmentationHelper computeMatteCoverageWithRect:segmentationMatte:context:](PISegmentationHelper, "computeMatteCoverageWithRect:segmentationMatte:context:", v57, v16, v56, v55, v54, v53);
  v35 = v34;
  v36 = (id)*MEMORY[0x1E0D75678];
  objc_msgSend(MEMORY[0x1E0D751B8], "systemParameters");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "maxBottomOverlap");
  v39 = v38;

  v40 = (id *)MEMORY[0x1E0D75680];
  v41 = v36;
  if (v35 > v39)
  {
    v41 = (id)*MEMORY[0x1E0D75680];

  }
  +[PISegmentationHelper computeMatteCoverageWithRect:segmentationMatte:context:](PISegmentationHelper, "computeMatteCoverageWithRect:segmentationMatte:context:", v57, v16, v30, v31, v32, v33);
  v43 = v42;
  objc_msgSend(MEMORY[0x1E0D751C0], "timeOverlapCheckThresholdForTopRect:isInteractive:", 0, v30, v31, v32, v33);
  if (v43 > v44)
  {
    v45 = *v40;

    v41 = v45;
  }
  v46 = objc_msgSend(MEMORY[0x1E0D751C0], "clockIntersectionFromTopRectMatteCoverage:bottomRectMatteCoverage:", v43, v35);
  objc_msgSend(MEMORY[0x1E0D751C0], "timeOverlapCheckThresholdForTopRect:isInteractive:", 1, v30, v31, v32, v33);
  v48 = v47;
  v49 = v36;
  if (v43 > v48)
  {
    v50 = *v40;

    v46 = 3;
    v49 = v50;
  }
  if (v8)
    v51 = v49;
  else
    v51 = v41;
  retstr->var0 = v51;
  retstr->var1 = v46;
  retstr->var2 = v35;
  retstr->var3 = v43;

  return result;
}

+ (double)computeAlphaCoverageWithRect:(CGRect)a3 foregroundImage:(id)a4 context:(id)a5
{
  CGFloat height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v17 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  objc_msgSend(a4, "imageByCroppingToRect:", x, y, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "areaAverageFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInputImage:", v11);
  objc_msgSend(v12, "setExtent:", x, y, width, height);
  v15 = 0;
  v16 = 0;
  objc_msgSend(v12, "outputImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v13, &v15, 16, *MEMORY[0x1E0C9E078], 0, 0.0, 0.0, 1.0, 1.0);

  LODWORD(height) = HIDWORD(v16);
  return *(float *)&height;
}

+ (double)computeMatteCoverageWithRect:(CGRect)a3 segmentationMatte:(id)a4 context:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  float v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a5;
  objc_msgSend(a4, "imageByCroppingToRect:", x, y, width, height);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "areaAverageFilter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInputImage:", v11);
  objc_msgSend(v12, "setExtent:", x, y, width, height);
  v16 = 0.0;
  objc_msgSend(v12, "outputImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v13, &v16, 4, *MEMORY[0x1E0C9E028], 0, 0.0, 0.0, 1.0, 1.0);

  v14 = v16;
  return v14;
}

+ (double)computeTargetOverlapYOffsetWithVisibleFrame:(CGRect)a3 imageSize:(CGSize)a4 segmentationMatte:(id)a5 layoutConfiguration:(id)a6 context:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  double v16;
  double v17;
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
  void *v29;
  int v30;
  int v31;
  int v32;
  uint64_t v33;
  signed int v34;
  signed int v35;
  unsigned int v36;
  signed int v37;
  unsigned int v38;
  void *v39;
  double v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  int v46;
  unsigned int v47;
  int v48;
  uint64_t v49;
  signed int v50;
  unint64_t v51;
  uint64_t v52;
  float *v53;
  signed int v54;
  unint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  float *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  double v64;
  double v65;
  uint64_t v66;
  float *v67;
  float v68;
  uint64_t v69;
  int v70;
  uint64_t v71;
  float *v72;
  float v73;
  float v74;
  double v75;
  float v76;
  double v77;
  double v78;
  BOOL v79;
  int v80;
  signed int v81;
  unint64_t v82;
  uint64_t v83;
  float *v84;
  signed int v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  float *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  double v94;
  double v95;
  uint64_t v96;
  float *v97;
  float v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  float *v102;
  float v103;
  float v104;
  double v105;
  float v106;
  double v107;
  double v108;
  BOOL v109;
  int v110;
  int v111;
  BOOL v113;
  BOOL v114;
  double v115;
  id v117;
  void *v118;
  void *v119;
  double v120;
  double v121;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  v121 = a3.origin.y;
  x = a3.origin.x;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v14, "timeOverlapCheckBottom");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v14, "timeOverlapCheckTop");
  v21 = v20;
  v23 = x + v22 * width;
  v120 = y + v20 * height;
  v25 = width * v24;
  v27 = height * v26;
  objc_msgSend(v13, "extent");
  v118 = v15;
  v119 = v13;
  imageDataOfRowAverages(v15, v13, v23, 0.0, v25, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "length");
  if (v30 >= 0)
    v31 = v30;
  else
    v31 = v30 + 3;
  v32 = v31 >> 2;
  v117 = objc_retainAutorelease(v29);
  v33 = objc_msgSend(v117, "bytes");
  v34 = vcvtmd_s64_f64(height);
  v35 = vcvtmd_s64_f64(height * v17);
  v36 = vcvtmd_s64_f64(height * v19);
  v37 = vcvtmd_s64_f64(height * v21);
  v38 = vcvtmd_s64_f64(v27);
  objc_msgSend(MEMORY[0x1E0D751B8], "systemParameters");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "targetBottomOverlap");
  v41 = v40;

  objc_msgSend(MEMORY[0x1E0D751B8], "systemParameters");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "maxBottomOverlap");
  v44 = v43;

  objc_msgSend(MEMORY[0x1E0D751C0], "timeOverlapCheckThresholdForTopRect:isInteractive:", 0, v23, v120, v25, v27);
  if (v31 >> 2 >= (int)v121)
    v46 = (int)v121;
  else
    v46 = v31 >> 2;
  v47 = v46 & ~(v46 >> 31);
  if ((int)(v47 + v34) >= v31 >> 2)
  {
    v80 = 0;
    v48 = 0;
    v57 = 1.0;
  }
  else
  {
    v48 = 0;
    v49 = v32 - (uint64_t)v34;
    v50 = v35 + v36 + v47;
    v51 = v35 + (unint64_t)v47;
    v52 = -(uint64_t)v51;
    v53 = (float *)(v33 + 4 * v51);
    v54 = v37 + v38 + v47;
    v55 = v37 + (unint64_t)v47;
    v56 = -(uint64_t)v55;
    v57 = 1.0;
    v58 = v46 & ~(v46 >> 31);
    v59 = (float *)(v33 + 4 * v55);
    while (1)
    {
      if (v32 >= (uint64_t)v54)
        v60 = v54;
      else
        v60 = v32;
      if (v32 >= (uint64_t)v50)
        v61 = v50;
      else
        v61 = v32;
      v62 = v58 + v35;
      v63 = v58 + v35 + v36;
      if (v63 >= v32)
        v63 = v32;
      v64 = 0.0;
      v65 = 0.0;
      if (v62 < v63)
      {
        v66 = v61 + v52;
        v67 = v53;
        do
        {
          v68 = *v67++;
          v65 = v65 + v68;
          --v66;
        }
        while (v66);
      }
      v69 = v58 + v37;
      if ((int)(v58 + v37 + v38) >= v32)
        v70 = v32;
      else
        v70 = v58 + v37 + v38;
      if (v69 < v70)
      {
        v71 = v60 + v56;
        v64 = 0.0;
        v72 = v59;
        do
        {
          v73 = *v72++;
          v64 = v64 + v73;
          --v71;
        }
        while (v71);
      }
      v74 = v65 / (double)(v63 - (int)v62);
      v75 = v74;
      v76 = v64 / (double)(v70 - (int)v69);
      v77 = v76;
      v78 = vabdd_f64(v75, v41);
      v79 = v45 > v77 && v75 > 0.01;
      v80 = v58 - v47;
      if (v79 && v78 < v57)
      {
        v57 = v78;
        v48 = v58 - v47;
      }
      if (v41 <= v75 && v44 > v75 && v45 > v77 && v78 < 0.01)
        break;
      ++v58;
      ++v50;
      --v52;
      ++v53;
      ++v54;
      --v56;
      ++v59;
      if (v58 >= v49)
      {
        v80 = 0;
        break;
      }
    }
  }
  if (v46 < 1)
  {
LABEL_69:
    v110 = 0;
  }
  else
  {
    v81 = v35 + v36 + v47;
    v82 = v35 + (unint64_t)v47;
    v83 = -(uint64_t)v82;
    v84 = (float *)(v33 + 4 * v82);
    v85 = v37 + v38 + v47;
    v86 = v37 + (unint64_t)v47;
    v87 = -(uint64_t)v86;
    v88 = v46 & ~(v46 >> 31);
    v89 = (float *)(v33 + 4 * v86);
    while (1)
    {
      if (v32 >= (uint64_t)v85)
        v90 = v85;
      else
        v90 = v32;
      if (v32 >= (uint64_t)v81)
        v91 = v81;
      else
        v91 = v32;
      v92 = v88 + v35;
      v93 = v88 + v35 + v36;
      if (v93 >= v32)
        v93 = v32;
      v94 = 0.0;
      v95 = 0.0;
      if (v92 < v93)
      {
        v96 = v91 + v83;
        v97 = v84;
        do
        {
          v98 = *v97++;
          v95 = v95 + v98;
          --v96;
        }
        while (v96);
      }
      v99 = v88 + v37;
      v100 = v88 + v37 + v38;
      if (v100 >= v32)
        v100 = v32;
      if (v99 < v100)
      {
        v101 = v90 + v87;
        v94 = 0.0;
        v102 = v89;
        do
        {
          v103 = *v102++;
          v94 = v94 + v103;
          --v101;
        }
        while (v101);
      }
      v104 = v95 / (double)(v93 - (int)v92);
      v105 = v104;
      v106 = v94 / (double)(v100 - (int)v99);
      v107 = v106;
      v108 = vabdd_f64(v105, v41);
      v109 = v45 > v107 && v105 > 0.01;
      v110 = v88 - v47;
      v111 = v109 && v108 < v57;
      if (v111)
        v48 = v88 - v47;
      if (v41 <= v105 && v44 > v105 && v45 > v107 && v108 < 0.01)
        break;
      if ((v111 & 1) != 0)
        v57 = v108;
      --v81;
      --v84;
      --v85;
      --v89;
      ++v83;
      ++v87;
      if (v88-- <= 1)
        goto LABEL_69;
    }
  }
  if (v80)
    v113 = 1;
  else
    v113 = v110 == 0;
  if (!v113)
    v48 = v110;
  if (v110)
    v114 = 1;
  else
    v114 = v80 == 0;
  if (!v114)
    v48 = v80;
  v115 = (double)v48;

  return v115;
}

+ (double)computeAvoidOverlapYOffsetWithVisibleFrame:(CGRect)a3 imageSize:(CGSize)a4 segmentationMatte:(id)a5 layoutConfiguration:(id)a6 outputUnsafeOverlap:(double *)a7 context:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  int v25;
  int v26;
  int v27;
  id v28;
  uint64_t v29;
  signed int v30;
  double v31;
  signed int v32;
  double v33;
  unsigned int v34;
  int v35;
  unsigned int v36;
  double v37;
  int v38;
  signed int v39;
  unint64_t v40;
  uint64_t v41;
  float *v42;
  double v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  double v48;
  uint64_t v49;
  float *v50;
  float v51;
  float v52;
  double v53;
  int v54;
  signed int v55;
  unint64_t v56;
  uint64_t v57;
  float *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  double v63;
  uint64_t v64;
  float *v65;
  float v66;
  float v67;
  double v68;
  BOOL v70;
  int v71;
  _BOOL4 v72;
  int v73;
  signed int v74;
  int v75;
  double v76;
  int v77;
  uint64_t v78;
  float *v79;
  float v80;
  float v82;
  unsigned int v84;
  unsigned int v85;
  NSObject *v86;
  void *v87;
  const void **v88;
  void *specific;
  NSObject *v90;
  _BOOL4 v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  id v96;
  void *v97;
  void *v98;
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v103 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a8;
  if (!v15)
  {
    NUAssertLogger_7530();
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "segmentationMatte != nil");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v87;
      _os_log_error_impl(&dword_1A6382000, v86, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v88 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7530();
    v90 = objc_claimAutoreleasedReturnValue();
    v91 = os_log_type_enabled(v90, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v91)
      {
        v94 = dispatch_get_specific(*v88);
        v95 = (void *)MEMORY[0x1E0CB3978];
        v96 = v94;
        objc_msgSend(v95, "callStackSymbols");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "componentsJoinedByString:", CFSTR("\n"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v100 = v94;
        v101 = 2114;
        v102 = v98;
        _os_log_error_impl(&dword_1A6382000, v90, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v91)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "componentsJoinedByString:", CFSTR("\n"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v100 = v93;
      _os_log_error_impl(&dword_1A6382000, v90, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v18 = v17;
  objc_msgSend(v16, "timeOverlapCheckBottom");
  v20 = x + v19 * width;
  v22 = width * v21;
  objc_msgSend(v15, "extent");
  imageDataOfRowAverages(v18, v15, v20, 0.0, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "length");
  if (v25 >= 0)
    v26 = v25;
  else
    v26 = v25 + 3;
  v27 = v26 >> 2;
  v28 = objc_retainAutorelease(v24);
  v29 = objc_msgSend(v28, "bytes");
  v30 = vcvtmd_s64_f64(height);
  objc_msgSend(v16, "unsafeRect");
  v32 = vcvtmd_s64_f64(height * v31);
  v34 = vcvtmd_s64_f64(height * v33);
  if (v26 >> 2 >= (int)y)
    v35 = (int)y;
  else
    v35 = v26 >> 2;
  v36 = v35 & ~(v35 >> 31);
  v37 = -1.0;
  v38 = 0;
  if ((int)(v36 + v30) >= v26 >> 2)
  {
    v54 = 0;
    v43 = 10.0;
  }
  else
  {
    v39 = v32 + v34 + v36;
    v40 = v32 + (unint64_t)v36;
    v41 = -(uint64_t)v40;
    v42 = (float *)(v29 + 4 * v40);
    v43 = 10.0;
    v44 = v35 & ~(v35 >> 31);
    while (1)
    {
      if (v27 >= (uint64_t)v39)
        v45 = v39;
      else
        v45 = v27;
      v46 = v44 + v32;
      v47 = v44 + v32 + v34;
      if (v47 >= v27)
        v47 = v26 >> 2;
      v48 = 0.0;
      if (v46 < v47)
      {
        v49 = v45 + v41;
        v50 = v42;
        do
        {
          v51 = *v50++;
          v48 = v48 + v51;
          --v49;
        }
        while (v49);
      }
      v52 = v48 / (double)(v47 - (int)v46);
      v53 = v52;
      if (v53 < 0.01)
        break;
      if (v43 > v53)
        v38 = v44 - v36;
      ++v44;
      if (v43 > v53)
        v43 = v53;
      ++v39;
      --v41;
      ++v42;
      if (v44 >= v27 - (uint64_t)v30)
      {
        v54 = 0;
        goto LABEL_27;
      }
    }
    v54 = v44 - v36;
    v37 = v53;
  }
LABEL_27:
  if (v35 < 1)
  {
LABEL_42:
    v70 = 0;
    v71 = 0;
    v72 = v54 != 0;
    v68 = -1.0;
  }
  else
  {
    v55 = v32 + v34 + v36;
    v56 = v32 + (unint64_t)v36;
    v57 = -(uint64_t)v56;
    v58 = (float *)(v29 + 4 * v56);
    v59 = v35 & ~(v35 >> 31);
    while (1)
    {
      if (v27 >= (uint64_t)v55)
        v60 = v55;
      else
        v60 = v27;
      v61 = v59 + v32;
      v62 = v59 + v32 + v34;
      if (v62 >= v27)
        v62 = v26 >> 2;
      v63 = 0.0;
      if (v61 < v62)
      {
        v64 = v60 + v57;
        v65 = v58;
        do
        {
          v66 = *v65++;
          v63 = v63 + v66;
          --v64;
        }
        while (v64);
      }
      v67 = v63 / (double)(v62 - (int)v61);
      v68 = v67;
      if (v68 < 0.01)
        break;
      if (v43 > v68)
      {
        v38 = v59 - v36;
        v43 = v68;
      }
      --v55;
      --v58;
      ++v57;
      if (v59-- <= 1)
        goto LABEL_42;
    }
    v71 = v59 - v36;
    v70 = v71 != 0;
    v72 = v54 != 0;
    if (v71 && v54)
    {
      if (v71 >= 0)
        v84 = v71;
      else
        v84 = -v71;
      if (v54 >= 0)
        v85 = v54;
      else
        v85 = -v54;
      if (v84 >= v85)
      {
        v73 = v54;
      }
      else
      {
        v37 = v68;
        v73 = v71;
      }
      if (!a7)
        goto LABEL_59;
LABEL_58:
      *a7 = v37;
      goto LABEL_59;
    }
  }
  if (v72)
  {
    v73 = v54;
  }
  else
  {
    v37 = v68;
    v73 = v71;
  }
  if (!v72 && !v70)
  {
    v37 = v43;
    v73 = v38;
    if (v43 >= 0.5)
    {
      v74 = v36 + v32;
      if ((int)(v74 + v34) >= v27)
        v75 = v26 >> 2;
      else
        v75 = v74 + v34;
      v76 = 0.0;
      v77 = v75 - v74;
      if (v75 > v74)
      {
        v78 = v74 - (uint64_t)v75;
        v79 = (float *)(v29 + 4 * v74);
        do
        {
          v80 = *v79++;
          v76 = v76 + v80;
        }
        while (!__CFADD__(v78++, 1));
      }
      v73 = 0;
      v82 = v76 / (double)v77;
      v37 = v82;
    }
  }
  if (a7)
    goto LABEL_58;
LABEL_59:

  return (double)v73;
}

+ (CGRect)scaleRect:(CGRect)a3 scaleFactor:(double)a4 scaleCenter:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  CGFloat v10;
  CGFloat v11;
  CGAffineTransform v12;
  CGAffineTransform t1;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGRect v19;

  y = a5.y;
  x = a5.x;
  height = a3.size.height;
  width = a3.size.width;
  v10 = a3.origin.y;
  v11 = a3.origin.x;
  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -a5.x, -a5.y);
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, a4, a4);
  memset(&v16, 0, sizeof(v16));
  CGAffineTransformMakeTranslation(&v16, x, y);
  memset(&v15, 0, sizeof(v15));
  t1 = v18;
  v12 = v17;
  CGAffineTransformConcat(&v14, &t1, &v12);
  t1 = v16;
  CGAffineTransformConcat(&v15, &v14, &t1);
  t1 = v15;
  v19.origin.x = v11;
  v19.origin.y = v10;
  v19.size.width = width;
  v19.size.height = height;
  return CGRectApplyAffineTransform(v19, &t1);
}

+ (double)_computeHeadroomZoomFactorWithVisibleFrame:(CGRect)a3 scaleCenter:(CGPoint)a4 initialOverlap:(PISegmentationClockOverlapResult *)a5 matte:(id)a6 layoutConfiguration:(id)a7 context:(id)a8
{
  double x;
  id v12;
  id v13;
  id v14;
  double v15;
  double v16;
  id v17;
  int v18;
  double v19;
  int v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  id v31;
  double v32;
  int v33;
  int v34;
  id v35;
  void *v36;
  NSObject *v37;
  void *v39;
  void *v40;
  PISegmentationClockOverlapResult *v41;
  double y;
  double width;
  double height;
  uint8_t buf[32];
  __int16 v47;
  id v48;
  uint64_t v49;

  v41 = a5;
  width = a3.size.width;
  height = a3.size.height;
  y = a3.origin.y;
  x = a3.origin.x;
  v49 = *MEMORY[0x1E0C80C00];
  v12 = a6;
  v13 = a7;
  v14 = a8;
  objc_msgSend(MEMORY[0x1E0D751B0], "targetZoomFactorLimitWithLayoutType:", objc_msgSend(MEMORY[0x1E0D751C0], "layoutTypeFromLayoutConfiguration:", v13));
  v16 = v15;
  v17 = v41->var0;
  v18 = 0;
  v19 = v16 + -1.0;
  while (1)
  {
    v20 = v18 + 1;
    v21 = (double)(v18 + 1) / 5.0 * v19 + 1.0;
    objc_msgSend(a1, "scaleRect:scaleFactor:scaleCenter:", x, y, width, height, 1.0 / v21, a4.x, a4.y, v41);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = v17;
    memset(buf, 0, sizeof(buf));
    +[PISegmentationHelper computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:](PISegmentationHelper, "computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:", v12, v13, v14, 0, v23, v25, v27, v29);
    v17 = 0;

    if ((objc_msgSend(v30, "isEqualToString:", 0) & 1) == 0)
      break;

    ++v18;
    if (v20 == 5)
    {
      v30 = 0;
      v31 = 0;
      v21 = -1.0;
      goto LABEL_22;
    }
  }
  v31 = *(id *)buf;

  v32 = (double)v18 / 5.0 * v19 + 1.0;
  v33 = 3;
  do
  {
    objc_msgSend(a1, "scaleRect:scaleFactor:scaleCenter:", x, y, width, height, 1.0 / ((v32 + v21) * 0.5), a4.x, a4.y);
    memset(buf, 0, sizeof(buf));
    +[PISegmentationHelper computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:](PISegmentationHelper, "computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:", v12, v13, v14, 0);
    v34 = objc_msgSend(0, "isEqualToString:", v30);
    v35 = 0;
    if (v34)
      v36 = v30;
    else
      v36 = v31;
    if (v34)
      v30 = v35;
    else
      v31 = v35;
    if (v34)
      v32 = (v32 + v21) * 0.5;
    else
      v21 = (v32 + v21) * 0.5;

    --v33;
  }
  while (v33);
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_205);
  v37 = (id)*MEMORY[0x1E0D52398];
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v32);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v39;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v40;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v30;
    v47 = 2112;
    v48 = v31;
    _os_log_debug_impl(&dword_1A6382000, v37, OS_LOG_TYPE_DEBUG, "Pixel-based headroom zoom final range %@,%@: %@,%@", buf, 0x2Au);

  }
  if (objc_msgSend(v30, "isEqualToString:", *MEMORY[0x1E0D75678]))
    v21 = v32;
LABEL_22:

  return v21;
}

+ (double)computeHeadroomZoomFactorWithVisibleFrame:(CGRect)a3 zoomTowardsTop:(BOOL *)a4 matte:(id)a5 layoutConfiguration:(id)a6 context:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;
  double MidX;
  double MaxY;
  double v20;
  double MinY;
  id v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  id v29;
  __int128 v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  memset(v35, 0, sizeof(v35));
  +[PISegmentationHelper computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:](PISegmentationHelper, "computeClockLayerOrderWithVisibleFrame:segmentationMatte:layoutConfiguration:context:interactive:", v15, v16, v17, 0, x, y, width, height);
  v36.origin.x = x;
  v36.origin.y = y;
  v36.size.width = width;
  v36.size.height = height;
  MidX = CGRectGetMidX(v36);
  v37.origin.x = x;
  v37.origin.y = y;
  v37.size.width = width;
  v37.size.height = height;
  MaxY = CGRectGetMaxY(v37);
  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  v20 = CGRectGetMidX(v38);
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  MinY = CGRectGetMinY(v39);
  v22 = 0;
  v32 = v22;
  v33 = *(_OWORD *)((char *)v35 + 8);
  v34 = 0;
  if (a1)
  {
    objc_msgSend(a1, "_computeHeadroomZoomFactorWithVisibleFrame:scaleCenter:initialOverlap:matte:layoutConfiguration:context:", &v32, v15, v16, v17, x, y, width, height, MidX, MaxY);
    v24 = v23;
    v29 = *(id *)&v35[0];
    v30 = *(_OWORD *)((char *)v35 + 8);
    v31 = *((_QWORD *)&v35[1] + 1);
    objc_msgSend(a1, "_computeHeadroomZoomFactorWithVisibleFrame:scaleCenter:initialOverlap:matte:layoutConfiguration:context:", &v29, v15, v16, v17, x, y, width, height, v20, MinY);
    v26 = *(void **)&v35[0];
  }
  else
  {

    v26 = *(void **)&v35[0];
    v29 = *(id *)&v35[0];
    v30 = *(_OWORD *)((char *)v35 + 8);
    v31 = *((_QWORD *)&v35[1] + 1);
    v24 = 0.0;
    v25 = 0.0;
  }
  *a4 = v24 > v25;
  if (v24 <= v25)
    v27 = v25;
  else
    v27 = v24;

  return v27;
}

+ (CGRect)_computeAvoidingRect:(CGRect)a3 imageSize:(CGSize)a4 maxYMotion:(double)a5 segmentationMatte:(id)a6 layoutConfiguration:(id)a7 context:(id)a8
{
  double height;
  double width;
  double v13;
  double v14;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  void *v33;
  const void **v34;
  void *specific;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  CGAffineTransform v45;
  CGAffineTransform v46;
  uint64_t v47;
  CGRect v48;
  CGRect v49;
  CGRect result;

  height = a4.height;
  width = a4.width;
  v13 = a3.size.height;
  v14 = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v47 = *MEMORY[0x1E0C80C00];
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!v17)
  {
    NUAssertLogger_7530();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "segmentationMatte != nil");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v46.a) = 138543362;
      *(_QWORD *)((char *)&v46.a + 4) = v33;
      _os_log_error_impl(&dword_1A6382000, v32, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v46, 0xCu);

    }
    v34 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_7530();
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v37)
      {
        v40 = dispatch_get_specific(*v34);
        v41 = (void *)MEMORY[0x1E0CB3978];
        v42 = v40;
        objc_msgSend(v41, "callStackSymbols");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "componentsJoinedByString:", CFSTR("\n"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v46.a) = 138543618;
        *(_QWORD *)((char *)&v46.a + 4) = v40;
        WORD2(v46.b) = 2114;
        *(_QWORD *)((char *)&v46.b + 6) = v44;
        _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v46, 0x16u);

      }
    }
    else if (v37)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "componentsJoinedByString:", CFSTR("\n"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v46.a) = 138543362;
      *(_QWORD *)((char *)&v46.a + 4) = v39;
      _os_log_error_impl(&dword_1A6382000, v36, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v46, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v20 = v19;
  +[PISegmentationHelper computeAvoidOverlapYOffsetWithVisibleFrame:imageSize:segmentationMatte:layoutConfiguration:outputUnsafeOverlap:context:](PISegmentationHelper, "computeAvoidOverlapYOffsetWithVisibleFrame:imageSize:segmentationMatte:layoutConfiguration:outputUnsafeOverlap:context:", v17, v18, 0, v19, x, y, v14, v13, width, height);
  v22 = fmin(v21, 0.0);
  memset(&v46, 0, sizeof(v46));
  if (v22 >= -a5)
    v23 = -v22;
  else
    v23 = a5;
  CGAffineTransformMakeTranslation(&v46, 0.0, v23);
  v45 = v46;
  v48.origin.x = x;
  v48.origin.y = y;
  v48.size.width = v14;
  v48.size.height = v13;
  v49 = CGRectApplyAffineTransform(v48, &v45);
  v24 = v49.origin.x;
  v25 = v49.origin.y;
  v26 = v49.size.width;
  v27 = v49.size.height;

  v28 = v24;
  v29 = v25;
  v30 = v26;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

+ (PISegmentationInactiveResult)computeInactiveFrameWithVisibleFrame:(SEL)a3 imageSize:(CGRect)a4 canUpdateVisibleRect:(CGSize)a5 considerHeadroom:(BOOL)a6 segmentationMatte:(BOOL)a7 layoutConfiguration:(id)a8 context:(id)a9
{
  _BOOL4 v12;
  _BOOL4 v13;
  double height;
  double width;
  double v16;
  double v17;
  double y;
  double x;
  id v21;
  id v22;
  id v23;
  void *v24;
  BOOL v25;
  int v26;
  CGFloat v27;
  _BOOL4 v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  double v59;
  double v60;
  CGFloat v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  CGFloat v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  CGFloat v94;
  double v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  double v100;
  double v101;
  double v102;
  NSObject *v103;
  PISegmentationInactiveResult *result;
  CGFloat v105;
  CGFloat v106;
  CGFloat rect2;
  double rect2a;
  double v109;
  double v110;
  double v111;
  double v112;
  CGFloat v113;
  CGFloat v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double rect1;
  CGAffineTransform v123;
  CGAffineTransform v124;
  CGAffineTransform v125;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v128;
  CGAffineTransform v129;
  CGAffineTransform v130;
  CGAffineTransform v131;
  CGAffineTransform v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;

  v12 = a7;
  v13 = a6;
  height = a5.height;
  width = a5.width;
  v16 = a4.size.height;
  v17 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v24 = v23;
  if (v21)
    v25 = v23 == 0;
  else
    v25 = 1;
  v26 = !v25;
  v120 = *MEMORY[0x1E0D75688];
  retstr->var0.origin.x = x;
  retstr->var0.origin.y = y;
  retstr->var0.size.width = v17;
  retstr->var0.size.height = v16;
  retstr->var1.origin.x = x;
  retstr->var1.origin.y = y;
  retstr->var1.size.width = v17;
  retstr->var1.size.height = v16;
  v27 = *MEMORY[0x1E0D75690];
  memset(&v132, 0, sizeof(v132));
  CGAffineTransformMakeTranslation(&v132, -(x + v17 * 0.5), -y);
  memset(&v131, 0, sizeof(v131));
  v112 = v27;
  CGAffineTransformMakeScale(&v131, v27, v27);
  memset(&v130, 0, sizeof(v130));
  CGAffineTransformMakeTranslation(&v130, x + v17 * 0.5, y);
  memset(&v129, 0, sizeof(v129));
  t1 = v132;
  t2 = v131;
  CGAffineTransformConcat(&v128, &t1, &t2);
  t1 = v130;
  CGAffineTransformConcat(&v129, &v128, &t1);
  v133.origin.x = 0.0;
  v133.origin.y = 0.0;
  v133.size.width = width;
  v133.size.height = height;
  v142.origin.x = x;
  v142.origin.y = y;
  v142.size.width = v17;
  v142.size.height = v16;
  v28 = CGRectContainsRect(v133, v142);
  v29 = *MEMORY[0x1E0D75770];
  if (!v12 || v28)
    v29 = 1.0;
  rect1 = height * v29;
  t1 = v129;
  v118 = y;
  v119 = x;
  v134.origin.x = x;
  v134.origin.y = y;
  v134.size.width = v17;
  v134.size.height = v16;
  v135 = CGRectApplyAffineTransform(v134, &t1);
  v30 = v135.origin.x;
  v31 = v135.origin.y;
  v32 = v135.size.width;
  v115 = height;
  if (v26 == 1)
  {
    v33 = v17;
    v34 = v120;
    +[PISegmentationHelper _computeAvoidingRect:imageSize:maxYMotion:segmentationMatte:layoutConfiguration:context:](PISegmentationHelper, "_computeAvoidingRect:imageSize:maxYMotion:segmentationMatte:layoutConfiguration:context:", v21, v22, v24, v135.origin.x, v135.origin.y, v135.size.width, v135.size.height, width, height);
    v30 = v35;
    v31 = v36;
    v32 = v37;
  }
  else
  {
    v34 = v120;
    v33 = v17;
  }
  v38 = v135.size.height;
  v136.origin.x = 0.0;
  v136.origin.y = 0.0;
  v136.size.width = width;
  v136.size.height = rect1;
  v39 = v30;
  v40 = v31;
  v41 = v32;
  v42 = v38;
  if (CGRectContainsRect(v136, *(CGRect *)&v30))
  {
    retstr->var1.origin.x = v39;
    retstr->var1.origin.y = v31;
    retstr->var1.size.width = v41;
    retstr->var1.size.height = v38;
  }
  else
  {
    v109 = v31;
    v110 = v16;
    v111 = v38;
    v121 = v39;
    v43 = v33;
    v44 = v118;
    v45 = v119;
    v46 = v34;
    v117 = width;
    if (v13)
    {
      memset(&t1, 0, sizeof(t1));
      CGAffineTransformMakeScale(&t1, 1.0 / v112, 1.0 / v112);
      memset(&t2, 0, sizeof(t2));
      v124 = v132;
      v123 = t1;
      CGAffineTransformConcat(&v125, &v124, &v123);
      v124 = v130;
      CGAffineTransformConcat(&t2, &v125, &v124);
      v124 = t2;
      v137.origin.x = v119;
      v137.origin.y = v118;
      v137.size.width = v43;
      v137.size.height = v16;
      v138 = CGRectApplyAffineTransform(v137, &v124);
      v105 = v138.origin.x;
      v106 = v138.size.height;
      v113 = v138.origin.y;
      rect2 = v138.size.width;
      v47 = v16;
      v48 = v43;
      v49 = v118;
      v50 = v119;
      if (v26)
      {
        +[PISegmentationHelper _computeAvoidingRect:imageSize:maxYMotion:segmentationMatte:layoutConfiguration:context:](PISegmentationHelper, "_computeAvoidingRect:imageSize:maxYMotion:segmentationMatte:layoutConfiguration:context:", v21, v22, v24, v119, v118, v43, v110, v117, v115, v46, v47);
        v50 = v51;
        v49 = v52;
        v48 = v53;
        v47 = v54;
      }
      v139.origin.x = 0.0;
      v139.origin.y = 0.0;
      v139.size.width = v117;
      v139.size.height = rect1;
      v55 = v50;
      v56 = v49;
      v57 = v48;
      v58 = v47;
      if (CGRectContainsRect(v139, *(CGRect *)(&v47 - 3)))
      {
        retstr->var0.origin.x = v105;
        retstr->var0.origin.y = v113;
        retstr->var0.size.width = rect2;
        retstr->var0.size.height = v106;
        retstr->var1.origin.x = v50;
        retstr->var1.origin.y = v49;
        retstr->var1.size.width = v48;
        retstr->var1.size.height = v58;
        goto LABEL_75;
      }
      v16 = v110;
      width = v117;
      v45 = v119;
    }
    v59 = v43;
    v60 = v45;
    v114 = v59;
    v61 = v16;
    if (v26)
    {
      +[PISegmentationHelper _computeAvoidingRect:imageSize:maxYMotion:segmentationMatte:layoutConfiguration:context:](PISegmentationHelper, "_computeAvoidingRect:imageSize:maxYMotion:segmentationMatte:layoutConfiguration:context:", v21, v22, v24, v45, v118, v59, v16, width, v115, v46);
      v60 = v62;
      v44 = v63;
      v59 = v64;
      v66 = v65;
      v140.origin.x = 0.0;
      v140.origin.y = 0.0;
      v140.size.width = width;
      v140.size.height = rect1;
      v143.origin.x = v60;
      v143.origin.y = v44;
      v143.size.width = v59;
      v143.size.height = v66;
      if (CGRectContainsRect(v140, v143))
      {
        retstr->var1.origin.x = v60;
        retstr->var1.origin.y = v44;
        retstr->var1.size.width = v59;
        retstr->var1.size.height = v66;
        goto LABEL_75;
      }
      v61 = v66;
    }
    rect2a = v61;
    v67 = v41;
    v68 = v111;
    v69 = v41 + v121;
    v70 = v109 + v111;
    v71 = 0.0;
    v72 = width + 0.0;
    v116 = v59;
    if (v41 + v121 >= v72)
    {
      if (v72 >= 0.0)
        v71 = v72;
    }
    else if (v69 >= 0.0)
    {
      v71 = v41 + v121;
    }
    v73 = 0.0;
    v74 = rect1 + 0.0;
    if (v70 >= rect1 + 0.0)
    {
      if (v74 >= 0.0)
        v73 = rect1 + 0.0;
    }
    else if (v70 >= 0.0)
    {
      v73 = v109 + v111;
    }
    v75 = v71 - v69;
    v76 = v73 - v70;
    v77 = v121 + v75;
    v78 = v109 + v76;
    v79 = 0.0;
    if (v77 >= v72)
    {
      if (v72 >= 0.0)
        v79 = v72;
    }
    else if (v77 >= 0.0)
    {
      v79 = v77;
    }
    v80 = 0.0;
    if (v78 >= v74)
    {
      if (v74 >= 0.0)
        v80 = rect1 + 0.0;
    }
    else if (v78 >= 0.0)
    {
      v80 = v109 + v76;
    }
    v141.origin.x = 0.0;
    v141.origin.y = 0.0;
    v141.size.width = v117;
    v141.size.height = rect1;
    v81 = v79;
    v82 = v80;
    if (CGRectContainsRect(v141, *(CGRect *)(&v67 - 2)) && v79 == v121)
    {
      retstr->var1.origin.x = v79;
      retstr->var1.origin.y = v80;
      retstr->var1.size.width = v41;
      retstr->var1.size.height = v111;
    }
    else
    {
      v83 = v60 + v116;
      v84 = rect2a;
      v85 = v44 + rect2a;
      v86 = 0.0;
      if (v60 + v116 >= v72)
      {
        v87 = v110;
        if (v72 >= 0.0)
          v86 = v72;
      }
      else
      {
        v87 = v110;
        if (v83 >= 0.0)
          v86 = v60 + v116;
      }
      v88 = 0.0;
      if (v85 >= v74)
      {
        if (v74 >= 0.0)
          v88 = rect1 + 0.0;
      }
      else if (v85 >= 0.0)
      {
        v88 = v44 + rect2a;
      }
      v89 = v86 - v83;
      v90 = v88 - v85;
      v91 = v60 + v89;
      v92 = v44 + v90;
      v93 = 0.0;
      if (v91 >= v72)
      {
        v94 = v118;
        if (v72 >= 0.0)
          v93 = v72;
      }
      else
      {
        v94 = v118;
        if (v91 >= 0.0)
          v93 = v91;
      }
      v95 = 0.0;
      if (v92 >= v74)
      {
        v96 = v117;
        if (v74 >= 0.0)
          v95 = rect1 + 0.0;
      }
      else
      {
        v96 = v117;
        if (v92 >= 0.0)
          v95 = v92;
      }
      v97 = 0;
      v98 = 0;
      v99 = rect1;
      v100 = v93;
      v101 = v95;
      v102 = v116;
      if (CGRectContainsRect(*(CGRect *)(&v96 - 2), *(CGRect *)(&v84 - 3)) && v93 == v60)
      {
        retstr->var1.origin.x = v93;
        retstr->var1.origin.y = v95;
        retstr->var1.size.width = v116;
        retstr->var1.size.height = rect2a;
      }
      else
      {
        if (*MEMORY[0x1E0D52390] != -1)
          dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_205);
        v103 = *MEMORY[0x1E0D52398];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
        {
          LOWORD(t1.a) = 0;
          _os_log_debug_impl(&dword_1A6382000, v103, OS_LOG_TYPE_DEBUG, "Unable to calculate a new inactiveRect; falling back to visible frame",
            (uint8_t *)&t1,
            2u);
        }
        retstr->var1.origin.x = v45;
        retstr->var1.origin.y = v94;
        retstr->var1.size.width = v114;
        retstr->var1.size.height = v87;
      }
    }
  }
LABEL_75:

  return result;
}

+ (id)debugImageWithInputImage:(id)a3 fullSize:(CGSize)a4 debugRects:(id)a5 label:(id)a6
{
  double height;
  double width;
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _UNKNOWN **v23;
  uint64_t i;
  void *v25;
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
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  _UNKNOWN **v55;
  uint64_t v56;
  void *v57;
  void *v58;
  double v59;
  CGFloat v60;
  void *v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  id v73;
  void *v74;
  id obj;
  CGAffineTransform v76;
  CGAffineTransform v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  CGAffineTransform v82;
  CGAffineTransform v83;
  _BYTE v84[128];
  uint64_t v85;

  height = a4.height;
  width = a4.width;
  v85 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v73 = a6;
  objc_msgSend(v10, "extent");
  v13 = v12;
  v15 = v14;
  v16 = PFPosterEnableHeadroom();
  v17 = *MEMORY[0x1E0D75770];
  if (!v16)
    v17 = 1.0;
  v18 = height * v17;
  memset(&v83, 0, sizeof(v83));
  CGAffineTransformMakeScale(&v83, width / v13, v18 / (v15 * v17));
  v82 = v83;
  v74 = v10;
  objc_msgSend(v10, "imageByApplyingTransform:", &v82);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  obj = v11;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v79;
    v23 = &off_1E5012000;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v79 != v22)
          objc_enumerationMutation(obj);
        v25 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
        objc_msgSend(v25, "geometry");
        v27 = v26;
        v29 = v28;
        v31 = v30;
        v33 = v32;
        objc_msgSend(v19, "extent");
        v36 = v34 + v27 * v35;
        v39 = v37 + v29 * v38;
        v40 = v31 * v35;
        v41 = v33 * v38;
        objc_msgSend(v25, "color");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "label");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v19;
        v45 = v42;
        v46 = v43;
        objc_msgSend(v23[455], "framedRectImageWithCGRect:color:borderWidth:", v45, v36, v39, v40, v41, 5.0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v47;
        v19 = v44;
        if (v47)
        {
          objc_msgSend(v47, "imageByCompositingOverImage:", v44);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
        if (v46)
        {
          createLabelImage(v46, v45, v36, v39);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v49;
          if (v49)
          {
            objc_msgSend(v49, "imageByCompositingOverImage:", v19);
            v51 = objc_claimAutoreleasedReturnValue();
            v52 = v19;
            v53 = v21;
            v54 = v22;
            v55 = v23;
            v56 = v51;

            v57 = (void *)v56;
            v23 = v55;
            v22 = v54;
            v21 = v53;
            v19 = v57;
          }

        }
      }
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v78, v84, 16);
    }
    while (v21);
  }

  +[PIDebugRect labelColor](PIDebugRect, "labelColor");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = *MEMORY[0x1E0C9D538];
  v60 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  createLabelImage(v73, v58, *MEMORY[0x1E0C9D538], v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v82, 0, sizeof(v82));
  objc_msgSend(v19, "extent");
  v63 = v62;
  objc_msgSend(v61, "extent");
  CGAffineTransformMakeTranslation(&v82, v63 - v64, 0.0);
  v77 = v82;
  objc_msgSend(v61, "imageByApplyingTransform:", &v77);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v65, "imageByCompositingOverImage:", v19);
  v66 = objc_claimAutoreleasedReturnValue();
  v67 = (void *)v66;
  if (v66)
    v68 = (void *)v66;
  else
    v68 = v19;
  v69 = v68;

  v76 = v83;
  memset(&v77, 0, sizeof(v77));
  CGAffineTransformInvert(&v77, &v76);
  v76 = v77;
  objc_msgSend(v69, "imageByApplyingTransform:", &v76);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v70, "imageByCroppingToRect:", v59, v60, width, v18);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  return v71;
}

+ (id)debugImageWithInputImage:(double)a3 layout:(double)a4 faceRects:(double)a5 saliencyPreferrectRect:(double)a6 saliencyAcceptableRect:(double)a7 gazeAreaRect:(double)a8 settlingEffectRect:(double)a9
{
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  unint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  uint64_t v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  unint64_t v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i;
  void *v89;
  void *v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  BOOL v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  void *v156;
  void *v157;
  double v158;
  double v159;
  double v160;
  double v161;
  void *v162;
  void *v163;
  double v164;
  double v165;
  double v166;
  double v167;
  double v168;
  double v169;
  double v170;
  double v171;
  void *v172;
  void *v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  void *v182;
  void *v183;
  void *v184;
  double v185;
  uint64_t v186;
  double v187;
  void *v188;
  void *v189;
  double v191;
  double v192;
  double v193;
  double v194;
  double v195;
  double v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  void *v205;
  void *v207;
  double v211;
  double v212;
  double v216;
  double v217;
  double v218;
  double v219;
  double v220;
  double v222;
  double v224;
  double obja;
  id obj;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  char v231;
  _BYTE v232[128];
  uint64_t v233;
  CGRect v234;

  v233 = *MEMORY[0x1E0C80C00];
  v29 = a11;
  v30 = a12;
  v31 = a13;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = (void *)MEMORY[0x1E0D751C0];
  v207 = v29;
  objc_msgSend(v29, "extent");
  v35 = v34;
  v37 = v36;
  objc_msgSend(v30, "configuration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "screenSize");
  objc_msgSend(v33, "bestFaceRectWithImageSize:deviceSize:faceRegions:", v31, v35, v37, v39, v40);
  v42 = v41;
  v211 = v43;
  v212 = v41;
  v45 = v44;
  v46 = v43;
  v48 = v47;

  v49 = *(double *)(MEMORY[0x1E0D71110] + 8) + *(double *)(MEMORY[0x1E0D71110] + 24);
  v200 = v45;
  v204 = v49 - (v45 + v48);
  obja = v49;
  v231 = 0;
  v50 = (void *)MEMORY[0x1E0D750F0];
  objc_msgSend(v30, "configuration");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "imageSize");
  v53 = (unint64_t)v52;
  objc_msgSend(v30, "imageSize");
  objc_msgSend(v50, "bestCropRectV2ForPosterClassification:layoutConfiguration:sourcePixelWidth:sourcePixelHeight:sourcePreferredCropRectNormalized:sourceAcceptableCropRectNormalized:sourceFaceAreaRectNormalized:outputCropScore:outputLayoutScore:outputClockOverlapAcceptable:", 1, v51, v53, (unint64_t)v54, 0, 0, a2, a3, a4, a5, a6, a7, a8, a9, *(_QWORD *)&v42,
    *(_QWORD *)&v204,
    *(_QWORD *)&v46,
    *(_QWORD *)&v48,
    &v231);
  v202 = v56;
  v203 = v55;
  v58 = v57;
  v60 = v59;

  v201 = v49 - (v58 + v60);
  objc_msgSend(v30, "configuration");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "screenSize");
  v63 = v62;
  objc_msgSend(v30, "configuration");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "screenSize");
  v66 = v63 / v65;
  v194 = v63 / v65;

  objc_msgSend(v30, "imageSize");
  v68 = (int)v67;
  objc_msgSend(v30, "imageSize");
  +[PIPNCropUtilitiesWrapper bestCropVariantFromSignalsWithAspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:normalizedFaceAreaRect:gazeAreaRect:](PIPNCropUtilitiesWrapper, "bestCropVariantFromSignalsWithAspectRatio:sourcePixelWidth:sourcePixelHeight:acceptableCropRect:preferredCropRect:normalizedFaceAreaRect:gazeAreaRect:", v68, (int)v69, v66, a6, a7, a8, a9, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&v212, *(_QWORD *)&v204, *(_QWORD *)&v211, *(_QWORD *)&v48, *(_QWORD *)&a14,
    *(_QWORD *)&a15,
    *(_QWORD *)&a16,
    *(_QWORD *)&a17);
  v198 = v71;
  v199 = v70;
  v196 = v72;
  v74 = v73;
  v75 = (void *)MEMORY[0x1E0D750F0];
  objc_msgSend(v30, "imageSize");
  v77 = (unint64_t)v76;
  v205 = v30;
  objc_msgSend(v30, "imageSize");
  v79 = v74;
  objc_msgSend(v75, "bestCropRectV2ForAspectRatio:sourcePixelWidth:sourcePixelHeight:sourceEssentialAreaRect:sourceSecondaryEssentialAreaRect:outputCropScore:", v77, (unint64_t)v78, 0, v194, a6, a7, a8, a9, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5);
  v192 = v81;
  v193 = v80;
  v195 = v82;
  v197 = obja - (v196 + v74);
  v227 = 0u;
  v228 = 0u;
  v191 = obja - (v83 + v82);
  v229 = 0u;
  v230 = 0u;
  obj = v31;
  v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v227, v232, 16);
  if (v84)
  {
    v85 = v84;
    v86 = 0;
    v87 = *(_QWORD *)v228;
    do
    {
      for (i = 0; i != v85; ++i)
      {
        if (*(_QWORD *)v228 != v87)
          objc_enumerationMutation(obj);
        v89 = *(void **)(*((_QWORD *)&v227 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("f%d"), v86 + i);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "rectValue");
        v92 = v91;
        v94 = v93;
        v96 = v95;
        v98 = v97;
        +[PIDebugRect faceColor](PIDebugRect, "faceColor");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v99, v90, v92, v94, v96, v98);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "addObject:", v100);

      }
      v86 = (v86 + i);
      v85 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v227, v232, 16);
    }
    while (v85);
  }

  +[PIDebugRect saliencyPreferredColor](PIDebugRect, "saliencyPreferredColor");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v101, CFSTR("saliency preferred"), a2, a3, a4, a5);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v102);

  +[PIDebugRect saliencyAcceptableColor](PIDebugRect, "saliencyAcceptableColor");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v103, CFSTR("saliency acceptable"), a6, a7, a8, a9);
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v104);

  +[PIDebugRect faceUnionColor](PIDebugRect, "faceUnionColor");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v105, CFSTR("face union"), v212, v200, v211, v48);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v106);

  +[PIDebugRect gazeAreaRectColor](PIDebugRect, "gazeAreaRectColor");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v107, CFSTR("gaze area"), a14, a15, a16, a17);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v108);

  +[PIDebugRect v2CropColor](PIDebugRect, "v2CropColor");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v109, CFSTR("bestCropRectV2"), v193, v191, v192, v195);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v110);

  +[PIDebugRect smartCropColor](PIDebugRect, "smartCropColor");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v111, CFSTR("smart crop"), v199, v197, v198, v79);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v112);

  +[PIDebugRect metadataColor](PIDebugRect, "metadataColor");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v113, CFSTR("metadata"), v203, v201, v202, v60);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v114);

  v234.origin.x = a18;
  v234.origin.y = a19;
  v234.size.width = a20;
  v234.size.height = a21;
  if (!CGRectIsNull(v234))
  {
    +[PIDebugRect settlingEffectColor](PIDebugRect, "settlingEffectColor");
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v115, CFSTR("settling effect"), a18, a19, a20, a21);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v116);

  }
  v117 = *MEMORY[0x1E0C9D538];
  v224 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v205, "imageSize");
  v119 = v118;
  v121 = v120;
  objc_msgSend(v205, "timeFrame");
  v123 = v122;
  v125 = v124;
  v127 = v126;
  v129 = v128;
  objc_msgSend(v205, "visibleFrame");
  v134 = v123 - v133;
  v135 = 0.0;
  v136 = 0.0;
  if (v131 != 0.0)
  {
    v134 = v134 / v131;
    v136 = v127 / v131;
  }
  v216 = v136;
  v137 = v125 - v130;
  if (v132 != 0.0)
  {
    v137 = v137 / v132;
    v135 = v129 / v132;
  }
  v217 = v135;
  objc_msgSend(v205, "inactiveFrame");
  v139 = v138;
  v141 = v140;
  v219 = v142;
  v220 = v143;
  objc_msgSend(v205, "inactiveFrame");
  v222 = v117;
  v148 = v147 - v117;
  v149 = 0.0;
  v150 = v119 == 0.0;
  v151 = v119;
  v152 = 0.0;
  if (!v150)
  {
    v148 = v148 / v151;
    v152 = v145 / v151;
  }
  v218 = v151;
  v153 = v139 + v134 * v219;
  v154 = v144 - v224;
  if (v121 != 0.0)
  {
    v154 = v154 / v121;
    v149 = v146 / v121;
  }
  v155 = v141 + v137 * v220;
  +[PIDebugRect inactiveColor](PIDebugRect, "inactiveColor");
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v156, CFSTR("inactive"), v148, v154, v152, v149);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v157);

  v158 = v153 - v222;
  v159 = 0.0;
  v160 = 0.0;
  if (v218 != 0.0)
  {
    v158 = v158 / v218;
    v160 = v216 * v219 / v218;
  }
  v161 = v155 - v224;
  if (v121 != 0.0)
  {
    v161 = v161 / v121;
    v159 = v217 * v220 / v121;
  }
  +[PIDebugRect inactiveColor](PIDebugRect, "inactiveColor");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v162, CFSTR("inactive time"), v158, v161, v160, v159);
  v163 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v163);

  objc_msgSend(v205, "timeFrame");
  v168 = v167 - v222;
  v169 = 0.0;
  v170 = 0.0;
  if (v218 != 0.0)
  {
    v168 = v168 / v218;
    v170 = v165 / v218;
  }
  v171 = v164 - v224;
  if (v121 != 0.0)
  {
    v171 = v171 / v121;
    v169 = v166 / v121;
  }
  +[PIDebugRect datetimeColor](PIDebugRect, "datetimeColor");
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v172, CFSTR("time"), v168, v171, v170, v169);
  v173 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v173);

  objc_msgSend(v205, "visibleFrame");
  v178 = v177 - v222;
  v179 = 0.0;
  v180 = 0.0;
  if (v218 != 0.0)
  {
    v178 = v178 / v218;
    v180 = v175 / v218;
  }
  v181 = v174 - v224;
  if (v121 != 0.0)
  {
    v181 = v181 / v121;
    v179 = v176 / v121;
  }
  +[PIDebugRect visibleColor](PIDebugRect, "visibleColor");
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v182, CFSTR("visible"), v178, v181, v180, v179);
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v183);

  v184 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v205, "deviceResolution");
  v186 = (int)v185;
  objc_msgSend(v205, "deviceResolution");
  objc_msgSend(v184, "stringWithFormat:", CFSTR("device %d x %d"), v186, (int)v187);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "debugImageWithInputImage:fullSize:debugRects:label:", v207, v32, v188, v218, v121);
  v189 = (void *)objc_claimAutoreleasedReturnValue();

  return v189;
}

+ (id)debugImageWithInputImage:(double)a3 finalLayout:(double)a4 intermediateLayout:(double)a5 faceRects:(double)a6 saliencyPreferrectRect:(double)a7 saliencyAcceptableRect:(double)a8 settlingEffectRect:(double)a9
{
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
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
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  void *v90;
  void *v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  id v115;
  id v117;
  id v118;
  double v120;
  double v122;
  double v124;
  double v126;
  id obj;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  _BYTE v132[128];
  uint64_t v133;
  CGRect v134;

  v133 = *MEMORY[0x1E0C80C00];
  v118 = a11;
  v117 = a12;
  v115 = a13;
  v23 = a14;
  v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v128 = 0u;
  v129 = 0u;
  v130 = 0u;
  v131 = 0u;
  obj = v23;
  v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v132, 16);
  if (v25)
  {
    v26 = v25;
    v27 = 0;
    v28 = *(_QWORD *)v129;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v129 != v28)
          objc_enumerationMutation(obj);
        v30 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * i);
        v31 = (void *)MEMORY[0x1E0D751B0];
        objc_msgSend(v30, "rectValue");
        objc_msgSend(v31, "inflatePersonFaceRect:");
        v33 = v32;
        v35 = v34;
        v37 = v36;
        v39 = v38;
        +[PIDebugRect inflatedFaceColor](PIDebugRect, "inflatedFaceColor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v40, 0, v33, v35, v37, v39);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v41);

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("f%d"), v27 + i);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "rectValue");
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v50 = v49;
        +[PIDebugRect faceColor](PIDebugRect, "faceColor");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v51, v42, v44, v46, v48, v50);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v52);

      }
      v27 = (v27 + i);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v128, v132, 16);
    }
    while (v26);
  }

  +[PIDebugRect saliencyPreferredColor](PIDebugRect, "saliencyPreferredColor");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v53, CFSTR("saliency preferred"), a2, a3, a4, a5);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v54);

  +[PIDebugRect saliencyAcceptableColor](PIDebugRect, "saliencyAcceptableColor");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v55, CFSTR("saliency acceptable"), a6, a7, a8, a9);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v56);

  v134.origin.x = a15;
  v134.origin.y = a16;
  v134.size.width = a17;
  v134.size.height = a18;
  if (!CGRectIsNull(v134))
  {
    +[PIDebugRect settlingEffectColor](PIDebugRect, "settlingEffectColor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v57, CFSTR("settling effect"), a15, a16, a17, a18);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObject:", v58);

  }
  v59 = *MEMORY[0x1E0C9D538];
  v126 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v117, "imageSize");
  v61 = v60;
  v63 = v62;
  objc_msgSend(v115, "visibleRect");
  v120 = v64;
  v122 = v65;
  v67 = v66;
  v124 = v68;
  objc_msgSend(v117, "timeFrame");
  v70 = v69;
  v72 = v71;
  v74 = v73;
  v76 = v75;
  objc_msgSend(v117, "visibleFrame");
  v81 = v70 - v80;
  v82 = 0.0;
  v83 = 0.0;
  if (v78 != 0.0)
  {
    v81 = v81 / v78;
    v83 = v74 / v78;
  }
  v84 = v72 - v77;
  if (v79 != 0.0)
  {
    v84 = v84 / v79;
    v82 = v76 / v79;
  }
  v85 = v122 + v84 * v124;
  v86 = v120 + v81 * v67 - v59;
  v87 = 0.0;
  v88 = 0.0;
  if (v61 != 0.0)
  {
    v86 = v86 / v61;
    v88 = v67 * v83 / v61;
  }
  v89 = v85 - v126;
  if (v63 != 0.0)
  {
    v89 = v89 / v63;
    v87 = v124 * v82 / v63;
  }
  +[PIDebugRect datetimeColor](PIDebugRect, "datetimeColor");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v90, CFSTR("time"), v86, v89, v88, v87);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v91);

  objc_msgSend(v115, "inactiveRect");
  v96 = v95 - v59;
  v97 = 0.0;
  v98 = 0.0;
  if (v61 != 0.0)
  {
    v96 = v96 / v61;
    v98 = v93 / v61;
  }
  v99 = v92 - v126;
  if (v63 != 0.0)
  {
    v99 = v99 / v63;
    v97 = v94 / v63;
  }
  +[PIDebugRect inactiveColor](PIDebugRect, "inactiveColor");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v100, CFSTR("inactive"), v96, v99, v98, v97);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v101);

  v102 = v120 - v59;
  v103 = 0.0;
  v104 = 0.0;
  if (v61 != 0.0)
  {
    v102 = v102 / v61;
    v104 = v67 / v61;
  }
  v105 = v122 - v126;
  if (v63 != 0.0)
  {
    v105 = v105 / v63;
    v103 = v124 / v63;
  }
  +[PIDebugRect visibleColor](PIDebugRect, "visibleColor");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  +[PIDebugRect debugRectWithRect:color:label:](PIDebugRect, "debugRectWithRect:color:label:", v106, CFSTR("visible"), v102, v105, v104, v103);
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v107);

  objc_msgSend(v115, "debugDescription");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "debugImageWithInputImage:fullSize:debugRects:label:", v118, v24, v108, v61, v63);
  v109 = (void *)objc_claimAutoreleasedReturnValue();

  return v109;
}

+ (id)debugPreviewRenderWithBackground:(id)a3 foreground:(id)a4 layout:(id)a5 style:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
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
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  char v50;
  uint64_t v51;
  void *v52;
  __CFString *v53;
  __CFString *v54;
  uint64_t v55;
  CGFloat v56;
  const __CTFontDescriptor *v57;
  const __CTFontDescriptor *v58;
  const __CFString *v59;
  void *v60;
  const __CFArray *MatchingFontDescriptors;
  const __CFArray *v62;
  CFIndex Count;
  CFIndex v64;
  const __CTFontDescriptor *ValueAtIndex;
  CFIndex v66;
  const __CTFontDescriptor *v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  void *v76;
  id v77;
  __CFString *v78;
  void *v79;
  double v80;
  const __CTFont *v81;
  double CapHeight;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  void *v94;
  uint64_t v95;
  void *v96;
  void *v97;
  id v98;
  void *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  id v104;
  void *v105;
  id v107;
  void *v108;
  uint64_t v109;
  id v110;
  id v111;
  id v112;
  CGAffineTransform v113;
  CGAffineTransform v114;
  uint64_t v115;

  v115 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0D52068], "sRGBColorSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "CGColorSpace");

  v15 = v10;
  objc_msgSend(v9, "imageByColorMatchingWorkingSpaceToColorSpace:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "imageByColorMatchingWorkingSpaceToColorSpace:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "timeFrame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  v25 = v24;
  objc_msgSend(v11, "visibleFrame");
  v30 = v19 - v29;
  v31 = 0.0;
  v32 = 0.0;
  if (v27 != 0.0)
  {
    v30 = v30 / v27;
    v32 = v23 / v27;
  }
  v33 = v21 - v26;
  if (v28 != 0.0)
  {
    v33 = v33 / v28;
    v31 = v25 / v28;
  }
  objc_msgSend(v16, "extent");
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  v42 = v16;
  objc_msgSend(v11, "clockLayerOrder");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)*MEMORY[0x1E0D75680];

  v45 = v42;
  if (v43 == v44)
  {
    objc_msgSend(v17, "imageByCompositingOverImage:", v42);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = (void *)v46;
    if (v46)
      v48 = (void *)v46;
    else
      v48 = v42;
    v45 = v48;

  }
  +[PIGlobalSettings globalSettings](PIGlobalSettings, "globalSettings");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "segmentationDebugPreviewDisableClock");

  if ((v50 & 1) == 0)
  {
    v107 = v42;
    v108 = v17;
    v109 = v14;
    v110 = v15;
    v111 = v9;
    objc_msgSend(v12, "clockFont");
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = (void *)v51;
    v53 = CFSTR("SF Soft Time");
    if (v51)
      v53 = (__CFString *)v51;
    v54 = v53;
    v55 = *MEMORY[0x1E0CA8300];
    v56 = *MEMORY[0x1E0CA83F0];
    v113.a = *(CGFloat *)MEMORY[0x1E0CA8300];
    v113.b = v56;
    *(_QWORD *)&v114.a = v54;
    *(_QWORD *)&v114.b = CFSTR("Semibold");
    v57 = CTFontDescriptorCreateWithAttributes((CFDictionaryRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 2));
    v112 = v12;
    if (!v57)
    {
      v60 = 0;
LABEL_30:
      v68 = v35 + v30 * v39;
      v69 = v37 + v33 * v41;
      v70 = v31 * v41;

      objc_msgSend(v12, "clockColor");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = (void *)MEMORY[0x1E0C9DD80];
      if (v71)
      {
        objc_msgSend(v12, "clockColor");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "colorWithCGColor:", objc_msgSend(v73, "CGColor"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C9DD80], "whiteColor");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v75 = v68 + v32 * v39 * 0.5;
      v76 = (void *)MEMORY[0x1E0C9DDB8];
      v77 = v74;
      v78 = v60;
      objc_msgSend(v76, "textImageGeneratorFilter");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setText:", CFSTR("9:41"));
      objc_msgSend(v79, "setFontName:", v78);
      LODWORD(v80) = 1121714176;
      objc_msgSend(v79, "setFontSize:", v80);
      v81 = CTFontCreateWithName(v78, 110.0, 0);

      CapHeight = CTFontGetCapHeight(v81);
      CFRelease(v81);
      v83 = v70 / CapHeight;
      *(float *)&v83 = v70 / CapHeight;
      objc_msgSend(v79, "setScaleFactor:", v83);
      objc_msgSend(v79, "outputImage");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithColor:", v77);
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v84, "extent");
      objc_msgSend(v85, "imageByCroppingToRect:");
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C9DDB8], "blendWithMaskFilter");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setInputImage:", v86);
      objc_msgSend(v84, "imageByApplyingFilter:", CFSTR("CIColorInvert"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v87, "setMaskImage:", v88);

      objc_msgSend(v87, "setBackgroundImage:", 0);
      objc_msgSend(v87, "outputImage");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "extent");
      memset(&v114, 0, sizeof(v114));
      CGAffineTransformMakeTranslation(&v114, v75 - (v90 + v91 * 0.5), v69 + v70 * 0.5 - (v92 + v93 * 0.5));
      v113 = v114;
      objc_msgSend(v89, "imageByApplyingTransform:", &v113);
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v94, "imageByCompositingOverImage:", v45);
      v95 = objc_claimAutoreleasedReturnValue();
      v96 = (void *)v95;
      if (v95)
        v97 = (void *)v95;
      else
        v97 = v45;
      v98 = v97;

      v45 = v98;
      v9 = v111;
      v12 = v112;
      v14 = v109;
      v15 = v110;
      v42 = v107;
      v17 = v108;
      goto LABEL_37;
    }
    v58 = v57;
    v59 = (const __CFString *)*MEMORY[0x1E0CA8380];
    v60 = (void *)CTFontDescriptorCopyAttribute(v57, (CFStringRef)*MEMORY[0x1E0CA8380]);
    if (!v60)
    {
      MatchingFontDescriptors = CTFontDescriptorCreateMatchingFontDescriptors(v58, (CFSetRef)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v55));
      if (MatchingFontDescriptors)
      {
        v62 = MatchingFontDescriptors;
        Count = CFArrayGetCount(MatchingFontDescriptors);
        if (Count)
        {
          v64 = Count;
          if (Count == 1)
          {
            ValueAtIndex = (const __CTFontDescriptor *)CFArrayGetValueAtIndex(v62, 0);
            v60 = (void *)CTFontDescriptorCopyAttribute(ValueAtIndex, v59);
LABEL_28:
            CFRelease(v62);
            goto LABEL_29;
          }
          if (Count >= 1)
          {
            v66 = 0;
            while (1)
            {
              v67 = (const __CTFontDescriptor *)CFArrayGetValueAtIndex(v62, v66);
              v60 = (void *)CTFontDescriptorCopyAttribute(v67, v59);
              if (objc_msgSend(v60, "rangeOfString:options:", CFSTR("Semibold"), 391) != 0x7FFFFFFFFFFFFFFFLL)
                break;

              if (v64 == ++v66)
              {
                v60 = 0;
                break;
              }
            }
            v12 = v112;
            goto LABEL_28;
          }
        }
        v60 = 0;
        goto LABEL_28;
      }
      v60 = 0;
    }
LABEL_29:
    CFRelease(v58);
    goto LABEL_30;
  }
LABEL_37:
  objc_msgSend(v11, "clockLayerOrder");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = (void *)*MEMORY[0x1E0D75678];

  if (v99 == v100)
  {
    objc_msgSend(v17, "imageByCompositingOverImage:", v45);
    v101 = objc_claimAutoreleasedReturnValue();
    v102 = (void *)v101;
    if (v101)
      v103 = (void *)v101;
    else
      v103 = v45;
    v104 = v103;

    v45 = v104;
  }
  objc_msgSend(v45, "imageByColorMatchingColorSpaceToWorkingSpace:", v14);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  return v105;
}

+ (id)debugImageForColorAnalysis:(id)a3 inputImage:(id)a4 visibleFrame:(CGRect)a5
{
  CGFloat height;
  double width;
  double y;
  double x;
  id v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  CGFloat v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;
  CGRect v58;
  CGRect v59;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v57 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v45 = height;
    v58.size.height = height;
    v59 = CGRectInset(v58, 50.0, 50.0);
    v14 = v59.origin.x;
    v15 = floor(width / 10.0);
    v16 = round(v15 * 0.25);
    v17 = v15 + v59.origin.y;
    objc_msgSend(v10, "backgroundLuminance");
    objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", v18, v18, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    drawCircle(v12, v19, CFSTR("bg lum"), v14, v17, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v46 = v10;
    objc_msgSend(v10, "backgroundColors");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v52;
      v25 = 1;
      v26 = v14;
      do
      {
        v27 = 0;
        v28 = v20;
        do
        {
          if (*(_QWORD *)v52 != v24)
            objc_enumerationMutation(v21);
          v26 = v15 + v26;
          objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithCGColor:", objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * v27), "CGColor"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bg col %ld"), v25 + v27);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          drawCircle(v28, v29, v30, v26, v17, v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          ++v27;
          v28 = v20;
        }
        while (v23 != v27);
        v25 += v27;
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
      }
      while (v23);
    }

    v31 = v15 + v17;
    objc_msgSend(v46, "foregroundLuminance");
    objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:", v32, v32, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    drawCircle(v20, v33, CFSTR("fg lum"), v14, v31, v16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v46, "foregroundColors");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v48;
      v38 = 1;
      v39 = v45;
      do
      {
        v40 = 0;
        v41 = v12;
        do
        {
          if (*(_QWORD *)v48 != v37)
            objc_enumerationMutation(v34);
          v14 = v15 + v14;
          objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithCGColor:", objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * v40), "CGColor"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("fg col %ld"), v38 + v40);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          drawCircle(v41, v42, v43, v14, v31, v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          ++v40;
          v41 = v12;
        }
        while (v36 != v40);
        v38 += v40;
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
      }
      while (v36);
    }
    else
    {
      v39 = v45;
    }

    objc_msgSend(v12, "imageByCroppingToRect:", x, y, width, v39);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v46;
  }

  return v13;
}

@end
