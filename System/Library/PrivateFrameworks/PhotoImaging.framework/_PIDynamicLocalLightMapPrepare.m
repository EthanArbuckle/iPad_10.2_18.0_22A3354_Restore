@implementation _PIDynamicLocalLightMapPrepare

+ (id)customAttributes
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  _QWORD v16[4];
  _QWORD v17[4];
  _QWORD v18[4];
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[4];
  _QWORD v23[3];
  _QWORD v24[4];
  _QWORD v25[6];

  v25[4] = *MEMORY[0x1E0C80C00];
  v24[0] = *MEMORY[0x1E0C9DE30];
  v2 = *MEMORY[0x1E0C9DF30];
  v23[0] = *MEMORY[0x1E0C9DF00];
  v23[1] = v2;
  v23[2] = *MEMORY[0x1E0C9DEE8];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v3;
  v24[1] = CFSTR("inputLightMapWidth");
  v5 = *MEMORY[0x1E0C9DE10];
  v19[0] = *MEMORY[0x1E0C9DE50];
  v4 = v19[0];
  v19[1] = v5;
  v22[0] = &unk_1E5051D68;
  v22[1] = &unk_1E5051D68;
  v7 = *MEMORY[0x1E0C9DE90];
  v8 = *MEMORY[0x1E0C9DE08];
  v20 = *MEMORY[0x1E0C9DE68];
  v6 = v20;
  v21 = v8;
  v22[2] = v7;
  v22[3] = CFSTR("NSNumber");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v19, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v9;
  v24[2] = CFSTR("inputLightMapHeight");
  v17[0] = v4;
  v17[1] = v5;
  v18[0] = &unk_1E5051D68;
  v18[1] = &unk_1E5051D68;
  v17[2] = v6;
  v17[3] = v8;
  v18[2] = v7;
  v18[3] = CFSTR("NSNumber");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v10;
  v24[3] = CFSTR("inputGuidedFilterEpsilon");
  v15[0] = v4;
  v15[1] = v5;
  v16[0] = &unk_1E5051D68;
  v16[1] = &unk_1E5051D78;
  v11 = *MEMORY[0x1E0C9DED0];
  v15[2] = v6;
  v15[3] = v8;
  v16[2] = v11;
  v16[3] = CFSTR("NSNumber");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)outputImage
{
  NSData *inputLightMap;
  NSNumber *inputLightMapWidth;
  NSNumber *inputLightMapHeight;
  NSData *v6;
  NSNumber *v7;
  NSNumber *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  NSNumber *v14;
  void *v15;
  id v16;
  CIImage *inputGuideImage;
  void *v18;
  NSNumber *inputGuidedFilterEpsilon;
  id v20;
  id v21;
  NSNumber *v22;
  id v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  void *v36;
  void *v37;
  void *v38;
  NSData *v39;
  void *v40;
  void *v41;
  __CFString *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  CGAffineTransform v54;
  CGAffineTransform v55;
  id v56;
  uint64_t v57;
  char *(*v58)(uint64_t, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v59;
  NSData *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  _QWORD v64[2];
  void *v65;
  NSNumber *v66;
  NSData *v67;
  const __CFString *v68;
  uint64_t v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v69 = *MEMORY[0x1E0C80C00];
  inputLightMap = self->inputLightMap;
  if (inputLightMap)
  {
    inputLightMapWidth = self->inputLightMapWidth;
    inputLightMapHeight = self->inputLightMapHeight;
    v6 = inputLightMap;
    v7 = inputLightMapWidth;
    v8 = inputLightMapHeight;
    v9 = -[NSData length](v6, "length");
    if (v9)
    {
      v10 = -[NSNumber unsignedLongValue](v7, "unsignedLongValue");
      v11 = -[NSNumber unsignedLongValue](v8, "unsignedLongValue");
      if (v10)
        v12 = v11 == 0;
      else
        v12 = 1;
      if (v12)
      {
        v10 = vcvtmd_u64_f64(sqrt((double)(unint64_t)v9 * 0.5));
        v13 = v10;
      }
      else
      {
        v13 = v11;
      }
      if (v9 == (void *)(2 * v10 * v13))
      {
        v14 = (NSNumber *)*MEMORY[0x1E0C9E150];
        v65 = (void *)*MEMORY[0x1E0C9E148];
        v66 = v14;
        v67 = v6;
        v68 = CFSTR("CILocalLight");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v67, &v65, 2);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_alloc(MEMORY[0x1E0C9DDC8]);
        v56 = (id)MEMORY[0x1E0C809B0];
        v57 = 3221225472;
        v58 = ___lightMapImageFromData_block_invoke;
        v59 = &unk_1E5018530;
        v61 = v10;
        v62 = v13;
        v60 = v6;
        v63 = v9;
        v9 = (void *)objc_msgSend(v16, "initWithImageProvider:width:height:format:colorSpace:options:", &v56, v10, v13, *MEMORY[0x1E0C9E050], 0, v15);

      }
      else
      {
        v9 = 0;
      }
    }

    inputGuideImage = self->inputGuideImage;
    if (inputGuideImage)
    {
      CGAffineTransformMakeScale(&v55, 0.5, 0.5);
      -[CIImage imageByApplyingTransform:](inputGuideImage, "imageByApplyingTransform:", &v55);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      inputGuidedFilterEpsilon = self->inputGuidedFilterEpsilon;
      v20 = v9;
      v21 = v18;
      v22 = inputGuidedFilterEpsilon;
      v23 = 0;
      if (v20 && v21)
      {
        objc_msgSend(v20, "extent");
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v31 = v30;
        objc_msgSend(v21, "extent");
        v72.origin.x = v32;
        v72.origin.y = v33;
        v72.size.width = v34;
        v72.size.height = v35;
        v70.origin.x = v25;
        v70.origin.y = v27;
        v70.size.width = v29;
        v70.size.height = v31;
        if (CGRectEqualToRect(v70, v72))
        {
          v23 = v20;
        }
        else
        {
          objc_msgSend(v20, "extent");
          v73.origin.x = 0.0;
          v73.origin.y = 0.0;
          v73.size.width = 1.0;
          v73.size.height = 1.0;
          if (CGRectEqualToRect(v71, v73))
          {
            objc_msgSend(v20, "imageByClampingToExtent");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "extent");
            objc_msgSend(v36, "imageByCroppingToRect:");
            v23 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v56 = v20;
            v57 = (uint64_t)v21;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 2);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)MEMORY[0x1E0C9DDF8];
            objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "extent");
            objc_msgSend(v37, "vectorWithCGRect:");
            v39 = (NSData *)objc_claimAutoreleasedReturnValue();
            v67 = v39;
            v40 = (void *)MEMORY[0x1E0C9DDF8];
            objc_msgSend(v36, "objectAtIndexedSubscript:", 1);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "extent");
            objc_msgSend(v40, "vectorWithCGRect:");
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v68 = v42;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 2);
            v43 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "extent");
            v45 = v44;
            v47 = v46;
            v49 = v48;
            v51 = v50;
            v64[0] = CFSTR("imageExtents");
            v64[1] = CFSTR("guidedFilterEpsilon");
            v65 = v43;
            v66 = v22;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, v64, 2);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](_PIDynamicGuidedProcessorKernel, "applyWithExtent:inputs:arguments:error:", v36, v52, 0, v45, v47, v49, v51);
            v23 = (id)objc_claimAutoreleasedReturnValue();

          }
        }
      }

      CGAffineTransformMakeScale(&v54, 2.0, 2.0);
      objc_msgSend(v23, "imageByApplyingTransform:", &v54);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputGuidedFilterEpsilon, 0);
  objc_storeStrong((id *)&self->inputGuideImage, 0);
  objc_storeStrong((id *)&self->inputLightMapHeight, 0);
  objc_storeStrong((id *)&self->inputLightMapWidth, 0);
  objc_storeStrong((id *)&self->inputLightMap, 0);
}

@end
