@implementation TSDImageAdjuster

- (TSDImageAdjuster)init
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDImageAdjuster init]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDImageAdjuster.m"), 24, CFSTR("The -initWithImageAdjustments is the designated initializer of TSDImageAdjuster."));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("The -initWithImageAdjustments is the designated initializer of TSDImageAdjuster."), "-[TSDImageAdjuster init]"), 0));
}

- (TSDImageAdjuster)initWithImageAdjustments:(id)a3
{
  TSDImageAdjuster *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDImageAdjuster;
  v4 = -[TSDImageAdjuster init](&v6, sel_init);
  if (v4)
    v4->mImageAdjustments = (TSDImageAdjustments *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDImageAdjuster;
  -[TSDImageAdjuster dealloc](&v3, sel_dealloc);
}

- (CGImage)newFilteredImageForImage:(CGImage *)a3 enhancedImage:(CGImage *)a4
{
  CGImage *v4;
  TSDImageAdjustments *mImageAdjustments;
  int v8;
  BOOL v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double v69;
  double v70;
  double v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t k;
  void *v77;
  CGImage *v78;
  CGImage **v80;
  CGImage *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  _BYTE v95[128];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;
  _QWORD v99[3];

  v99[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v4 = a3;
  mImageAdjustments = self->mImageAdjustments;
  if (!mImageAdjustments)
    return CGImageRetain(a3);
  v8 = -[TSDImageAdjustments enhance](mImageAdjustments, "enhance");
  v9 = 0;
  if (a4)
  {
    if (v8)
    {
      v9 = *a4 != 0;
      if (*a4)
        v4 = *a4;
    }
  }
  v82 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithCGImage:", v4);
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = -[TSDImageAdjustments enhance](self->mImageAdjustments, "enhance");
  if (!v9 && v11)
  {
    v98 = *MEMORY[0x24BDBF8E0];
    v99[0] = MEMORY[0x24BDBD1C0];
    v12 = (void *)objc_msgSend(v82, "autoAdjustmentFiltersWithOptions:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v99, &v98, 1));
    if (v12)
      objc_msgSend(v10, "addObjectsFromArray:", v12);
    if (a4 && objc_msgSend(v12, "count"))
    {
      v80 = a4;
      v81 = v4;
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
      v14 = (uint64_t)v82;
      if (v13)
      {
        v15 = v13;
        v16 = *(_QWORD *)v92;
        v14 = (uint64_t)v82;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v92 != v16)
              objc_enumerationMutation(v12);
            v18 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
            objc_msgSend(v18, "setValue:forKey:", v14, CFSTR("inputImage"));
            v14 = objc_msgSend(v18, "valueForKey:", CFSTR("outputImage"));
          }
          v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v91, v97, 16);
        }
        while (v15);
      }
      v19 = v14;
      v4 = v81;
      *v80 = -[TSDImageAdjuster p_newImageFromCIImage:underlyingImage:](self, "p_newImageFromCIImage:underlyingImage:", v19, v81);
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v20 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v88;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v88 != v22)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v87 + 1) + 8 * j), "setValue:forKey:", 0, CFSTR("inputImage"));
          }
          v21 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
        }
        while (v21);
      }
    }
  }
  -[TSDImageAdjustments bottomLevel](self->mImageAdjustments, "bottomLevel");
  if (v24 != 0.0 || (-[TSDImageAdjustments topLevel](self->mImageAdjustments, "topLevel"), v25 != 1.0))
  {
    v26 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIColorMatrix"));
    objc_msgSend(v26, "setDefaults");
    -[TSDImageAdjustments bottomLevel](self->mImageAdjustments, "bottomLevel");
    v28 = v27;
    -[TSDImageAdjustments topLevel](self->mImageAdjustments, "topLevel");
    v30 = v29 - v28;
    v31 = 1.0 / v30;
    v32 = -v28 / v30;
    objc_msgSend(v26, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:Z:W:", 1.0 / v30, 0.0, 0.0, 0.0), CFSTR("inputRVector"));
    objc_msgSend(v26, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:Z:W:", 0.0, v31, 0.0, 0.0), CFSTR("inputGVector"));
    objc_msgSend(v26, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:Z:W:", 0.0, 0.0, v31, 0.0), CFSTR("inputBVector"));
    objc_msgSend(v26, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:Z:W:", 0.0, 0.0, 0.0, 1.0), CFSTR("inputAVector"));
    objc_msgSend(v26, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:Z:W:", v32, v32, v32, 0.0), CFSTR("inputBiasVector"));
    objc_msgSend(v10, "addObject:", v26);
  }
  -[TSDImageAdjustments gamma](self->mImageAdjustments, "gamma");
  if (v33 != 0.0)
  {
    v34 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIGammaAdjust"));
    objc_msgSend(v34, "setDefaults");
    v35 = (void *)MEMORY[0x24BDD16E0];
    -[TSDImageAdjustments gamma](self->mImageAdjustments, "gamma");
    objc_msgSend(v34, "setValue:forKey:", objc_msgSend(v35, "numberWithDouble:", (double)pow(v36 / 2.5 + 1.0, 3.0)), CFSTR("inputPower"));
    objc_msgSend(v10, "addObject:", v34);
  }
  -[TSDImageAdjustments saturation](self->mImageAdjustments, "saturation");
  if (v37 != 0.0 || (-[TSDImageAdjustments contrast](self->mImageAdjustments, "contrast"), v38 != 0.0))
  {
    v39 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIColorControls"));
    objc_msgSend(v39, "setDefaults");
    v40 = (void *)MEMORY[0x24BDD16E0];
    -[TSDImageAdjustments saturation](self->mImageAdjustments, "saturation");
    objc_msgSend(v39, "setValue:forKey:", objc_msgSend(v40, "numberWithDouble:", v41 + 1.0), CFSTR("inputSaturation"));
    v42 = (void *)MEMORY[0x24BDD16E0];
    -[TSDImageAdjustments contrast](self->mImageAdjustments, "contrast");
    objc_msgSend(v39, "setValue:forKey:", objc_msgSend(v42, "numberWithDouble:", (double)exp2(v43 + v43)), CFSTR("inputContrast"));
    objc_msgSend(v10, "addObject:", v39);
  }
  -[TSDImageAdjustments exposure](self->mImageAdjustments, "exposure");
  if (v44 != 0.0)
  {
    v45 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIExposureAdjust"));
    objc_msgSend(v45, "setDefaults");
    v46 = (void *)MEMORY[0x24BDD16E0];
    -[TSDImageAdjustments exposure](self->mImageAdjustments, "exposure");
    objc_msgSend(v45, "setValue:forKey:", objc_msgSend(v46, "numberWithDouble:"), CFSTR("inputEV"));
    objc_msgSend(v10, "addObject:", v45);
  }
  -[TSDImageAdjustments highlights](self->mImageAdjustments, "highlights");
  if (v47 != 0.0 || (-[TSDImageAdjustments shadows](self->mImageAdjustments, "shadows"), v48 != 0.0))
  {
    v49 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIHighlightShadowAdjust"));
    objc_msgSend(v49, "setDefaults");
    v50 = (void *)MEMORY[0x24BDD16E0];
    -[TSDImageAdjustments highlights](self->mImageAdjustments, "highlights");
    objc_msgSend(v49, "setValue:forKey:", objc_msgSend(v50, "numberWithDouble:", (1.0 - v51) * 0.6), CFSTR("inputHighlightAmount"));
    v52 = (void *)MEMORY[0x24BDD16E0];
    -[TSDImageAdjustments shadows](self->mImageAdjustments, "shadows");
    objc_msgSend(v49, "setValue:forKey:", objc_msgSend(v52, "numberWithDouble:", v53 * 0.4), CFSTR("inputShadowAmount"));
    objc_msgSend(v10, "addObject:", v49);
  }
  -[TSDImageAdjustments sharpness](self->mImageAdjustments, "sharpness");
  if (v54 != 0.0)
  {
    v55 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CIUnsharpMask"));
    objc_msgSend(v55, "setDefaults");
    v56 = (void *)MEMORY[0x24BDD16E0];
    -[TSDImageAdjustments sharpness](self->mImageAdjustments, "sharpness");
    objc_msgSend(v55, "setValue:forKey:", objc_msgSend(v56, "numberWithDouble:", v57 * 4.0), CFSTR("inputRadius"));
    v58 = (void *)MEMORY[0x24BDD16E0];
    -[TSDImageAdjustments sharpness](self->mImageAdjustments, "sharpness");
    objc_msgSend(v55, "setValue:forKey:", objc_msgSend(v58, "numberWithDouble:", v59 * 0.75), CFSTR("inputIntensity"));
    objc_msgSend(v10, "addObject:", v55);
  }
  -[TSDImageAdjustments denoise](self->mImageAdjustments, "denoise");
  if (v60 != 0.0)
  {
    v61 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CINoiseReduction"));
    objc_msgSend(v61, "setDefaults");
    v62 = (void *)MEMORY[0x24BDD16E0];
    -[TSDImageAdjustments denoise](self->mImageAdjustments, "denoise");
    objc_msgSend(v61, "setValue:forKey:", objc_msgSend(v62, "numberWithDouble:", v63 * 0.04), CFSTR("inputNoiseLevel"));
    v64 = (void *)MEMORY[0x24BDD16E0];
    -[TSDImageAdjustments denoise](self->mImageAdjustments, "denoise");
    objc_msgSend(v61, "setValue:forKey:", objc_msgSend(v64, "numberWithDouble:", v65 * 0.6), CFSTR("inputSharpness"));
    objc_msgSend(v10, "addObject:", v61);
  }
  -[TSDImageAdjustments temperature](self->mImageAdjustments, "temperature");
  if (v66 != 0.0 || (-[TSDImageAdjustments tint](self->mImageAdjustments, "tint"), v67 != 0.0))
  {
    v68 = (void *)objc_msgSend(MEMORY[0x24BDBF658], "filterWithName:", CFSTR("CITemperatureAndTint"));
    objc_msgSend(v68, "setDefaults");
    objc_msgSend(v68, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:", 10000.0, 0.0), CFSTR("inputNeutral"));
    -[TSDImageAdjustments temperature](self->mImageAdjustments, "temperature");
    v70 = v69 * 3500.0 + 10000.0;
    -[TSDImageAdjustments tint](self->mImageAdjustments, "tint");
    objc_msgSend(v68, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDBF690], "vectorWithX:Y:", v70, v71 * 75.0), CFSTR("inputTargetNeutral"));
    objc_msgSend(v10, "addObject:", v68);
  }
  if (objc_msgSend(v10, "count"))
  {
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v72 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
    v73 = (uint64_t)v82;
    if (v72)
    {
      v74 = v72;
      v75 = *(_QWORD *)v84;
      v73 = (uint64_t)v82;
      do
      {
        for (k = 0; k != v74; ++k)
        {
          if (*(_QWORD *)v84 != v75)
            objc_enumerationMutation(v10);
          v77 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * k);
          objc_msgSend(v77, "setValue:forKey:", v73, CFSTR("inputImage"));
          v73 = objc_msgSend(v77, "valueForKey:", CFSTR("outputImage"));
        }
        v74 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v83, v95, 16);
      }
      while (v74);
    }

    v78 = -[TSDImageAdjuster p_newImageFromCIImage:underlyingImage:](self, "p_newImageFromCIImage:underlyingImage:", v73, v4);
  }
  else
  {

    return CGImageRetain(v4);
  }
  return v78;
}

- (CGImage)p_newImageFromCIImage:(id)a3 underlyingImage:(CGImage *)a4
{
  size_t Width;
  char v7;
  CGImageAlphaInfo AlphaInfo;
  CGContext *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  CGImage *v18;
  CGImage *Image;
  uint64_t v21;
  _QWORD v22[2];
  CGRect v23;

  v22[1] = *MEMORY[0x24BDAC8D0];
  Width = CGImageGetWidth(a4);
  CGImageGetHeight(a4);
  v7 = 3;
  AlphaInfo = CGImageGetAlphaInfo(a4);
  if (AlphaInfo - 5 < 2)
    goto LABEL_4;
  if (AlphaInfo == kCGImageAlphaOnly)
  {
    v7 = 2;
    goto LABEL_6;
  }
  if (AlphaInfo == kCGImageAlphaNone)
LABEL_4:
    v7 = 1;
LABEL_6:
  v9 = TSDBitmapContextCreate(v7, (double)Width);
  v10 = TSDRectWithSize();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = (void *)MEMORY[0x24BDBF648];
  v21 = *MEMORY[0x24BDBF840];
  v22[0] = TSUDeviceRGBColorSpace();
  v18 = (CGImage *)objc_msgSend((id)objc_msgSend(v17, "contextWithOptions:", objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1)), "createCGImage:fromRect:", a3, v10, v12, v14, v16);
  v23.origin.x = v10;
  v23.origin.y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  CGContextDrawImage(v9, v23, v18);
  CGImageRelease(v18);
  Image = CGBitmapContextCreateImage(v9);
  CGContextRelease(v9);
  return Image;
}

@end
