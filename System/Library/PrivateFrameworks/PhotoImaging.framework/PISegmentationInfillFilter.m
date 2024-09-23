@implementation PISegmentationInfillFilter

+ (BOOL)isMLInpaintingAvailable
{
  if (isMLInpaintingAvailable_once != -1)
    dispatch_once(&isMLInpaintingAvailable_once, &__block_literal_global_914);
  return isMLInpaintingAvailable_canUseMLInfill;
}

+ (id)blackInfillImage:(id)a3 matte:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;

  v5 = (void *)MEMORY[0x1E0C9DDB8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "blendWithMaskFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C9DDC8];
  objc_msgSend(MEMORY[0x1E0C9DD80], "blackColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageWithColor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundImage:", v11);

  objc_msgSend(v8, "setInputImage:", v7);
  +[PISegmentationHelper invertImage:](PISegmentationHelper, "invertImage:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setMaskImage:", v12);
  objc_msgSend(v8, "outputImage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extent");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  objc_msgSend(v13, "imageByCroppingToRect:", v15, v17, v19, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)fastInfillImage:(id)a3 matte:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C9DDB8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "blendWithMaskFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundImage:", 0);
  objc_msgSend(v8, "setInputImage:", v7);
  +[PISegmentationHelper invertImage:](PISegmentationHelper, "invertImage:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setMaskImage:", v9);
  objc_msgSend(v8, "outputImage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extent");
  objc_msgSend(v10, "imageByCroppingToRect:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "extent");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v23[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](PISegmentationInwardFillProcessor, "applyWithExtent:inputs:arguments:error:", v20, MEMORY[0x1E0C9AA70], 0, v13, v15, v17, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)watchInfillImage:(id)a3 matte:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  void *v18;
  void *v19;
  CGImage *v20;
  CGImage *v21;
  CGImage *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  CGAffineTransform v31;

  v5 = (void *)MEMORY[0x1E0C9DD90];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v31, 0, sizeof(v31));
  objc_msgSend(v7, "extent");
  v10 = 1024.0 / v9;
  objc_msgSend(v7, "extent");
  CGAffineTransformMakeScale(&v31, v10, 1024.0 / v11);
  memset(&v30, 0, sizeof(v30));
  objc_msgSend(v7, "extent");
  v13 = v12 * 0.0009765625;
  objc_msgSend(v7, "extent");
  CGAffineTransformMakeScale(&v30, v13, v14 * 0.0009765625);
  memset(&v29, 0, sizeof(v29));
  objc_msgSend(v6, "extent");
  v16 = 1024.0 / v15;
  objc_msgSend(v6, "extent");
  CGAffineTransformMakeScale(&v29, v16, 1024.0 / v17);
  v28 = v31;
  objc_msgSend(v7, "imageByApplyingTransform:highQualityDownsample:", &v28, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v29;
  objc_msgSend(v6, "imageByApplyingTransform:highQualityDownsample:", &v28, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "extent");
  v20 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v18);
  objc_msgSend(v19, "extent");
  v21 = (CGImage *)objc_msgSend(v8, "createCGImage:fromRect:", v19);
  v22 = +[PIRepairUtilities newWatchInfillFromImage:mask:](PIRepairUtilities, "newWatchInfillFromImage:mask:", v20, v21);
  objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCGImage:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v20);
  CGImageRelease(v21);
  CGImageRelease(v22);
  v28 = v30;
  objc_msgSend(v23, "imageByApplyingTransform:highQualityDownsample:", &v28, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PISegmentationHelper foregroundForImage:matte:](PISegmentationHelper, "foregroundForImage:matte:", v24, v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "imageByCompositingOverImage:", v7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)inpaintingInfillImage:(id)a3 matte:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[PISegmentationHelper invertImage:](PISegmentationHelper, "invertImage:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C9DDB8];
  v8 = *MEMORY[0x1E0C9E210];
  v13[0] = *MEMORY[0x1E0C9E1F8];
  v13[1] = v8;
  v14[0] = v5;
  v14[1] = v6;
  v13[2] = CFSTR("inputInpaintingMode");
  v14[2] = &unk_1E5050FE0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterWithName:withInputParameters:", CFSTR("CIInpaintingFilter"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "outputImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __53__PISegmentationInfillFilter_isMLInpaintingAvailable__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isMLInpaintingAvailable_canUseMLInfill = objc_msgSend(v0, "fileExistsAtPath:", CFSTR("/System/Library/Frameworks/CoreImage.framework/inp_gen_eds2_00_q16.espresso.weights"));

}

- (id)outputImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int64_t v7;
  uint64_t v8;
  id v9;

  -[PISegmentationInfillFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PISegmentationInfillFilter inputMatteImage](self, "inputMatteImage");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v7 = -[PISegmentationInfillFilter infillAlgorithm](self, "infillAlgorithm");
    v8 = 5;
    if (v7)
      v8 = v7;
    switch(v8)
    {
      case 2:
        objc_msgSend((id)objc_opt_class(), "watchInfillImage:matte:", v3, v5);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 3:
        objc_msgSend((id)objc_opt_class(), "inpaintingInfillImage:matte:", v3, v5);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        objc_msgSend((id)objc_opt_class(), "fastInfillImage:matte:", v3, v5);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 5:
        v9 = v3;
        break;
      default:
        objc_msgSend((id)objc_opt_class(), "blackInfillImage:matte:", v3, v5);
        v9 = (id)objc_claimAutoreleasedReturnValue();
        break;
    }
    v6 = v9;
  }

  return v6;
}

- (int64_t)infillAlgorithm
{
  return self->_infillAlgorithm;
}

- (void)setInfillAlgorithm:(int64_t)a3
{
  self->_infillAlgorithm = a3;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)inputMatteImage
{
  return self->_inputMatteImage;
}

- (void)setInputMatteImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputMatteImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputMatteImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
