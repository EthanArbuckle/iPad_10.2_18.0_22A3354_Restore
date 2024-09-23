@implementation PIPortraitEffectFilter

+ (id)remapPortraitV2Strength:(id)a3 portraitEffectKind:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v8 = v7;
  }
  else
  {
    v8 = 0.5;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StudioV2")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("StageWhite")))
  {
    v9 = (void *)MEMORY[0x1E0CB37E8];
    v10 = pow(v8, 0.75);
    v11 = v9;
  }
  else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("ContourV2")) & 1) != 0
         || (objc_msgSend(v6, "isEqualToString:", CFSTR("StageV2")) & 1) != 0
         || objc_msgSend(v6, "isEqualToString:", CFSTR("StageMonoV2")))
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v10 = v8 * 1.8 + v8 * v8 * -0.8;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    v10 = v8;
  }
  objc_msgSend(v11, "numberWithDouble:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)outputImage
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  const __CFString *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  const void **v40;
  void *specific;
  NSObject *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  _QWORD v51[2];
  _QWORD v52[2];
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  -[PIPortraitEffectFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[PIPortraitEffectFilter inputVersion](self, "inputVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intValue");

  -[PIPortraitEffectFilter inputKind](self, "inputKind");
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    NUAssertLogger_12040();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing portrait effect kind"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v39;
      _os_log_error_impl(&dword_1A6382000, v38, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v40 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_12040();
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v43)
      {
        v46 = dispatch_get_specific(*v40);
        v47 = (void *)MEMORY[0x1E0CB3978];
        v48 = v46;
        objc_msgSend(v47, "callStackSymbols");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "componentsJoinedByString:", CFSTR("\n"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v54 = v46;
        v55 = 2114;
        v56 = v50;
        _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v43)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "componentsJoinedByString:", CFSTR("\n"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v54 = v45;
      _os_log_error_impl(&dword_1A6382000, v42, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v7 = (void *)v6;
  objc_msgSend(CFSTR("CIPortraitEffect"), "stringByAppendingString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIPortraitEffectFilter inputFaceLandmarkArray](self, "inputFaceLandmarkArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v10, CFSTR("inputFaceLandmarkArray"));

  -[PIPortraitEffectFilter inputImage](self, "inputImage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v11, *MEMORY[0x1E0C9E1F8]);

  -[PIPortraitEffectFilter inputScale](self, "inputScale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v12, *MEMORY[0x1E0C9E268]);

  if (v5 != 2)
  {
    if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Black")) & 1) != 0
      || objc_msgSend(v7, "isEqualToString:", CFSTR("BlackoutMono")))
    {
      -[PIPortraitEffectFilter inputDisparity](self, "inputDisparity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forKey:", v25, CFSTR("inputDisparity"));

      -[PIPortraitEffectFilter inputFullSizeImage](self, "inputFullSizeImage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setValue:forKey:", v26, CFSTR("inputFullSizeImage"));

      -[PIPortraitEffectFilter inputMatte](self, "inputMatte");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = CFSTR("inputMatte");
    }
    else
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("Light")) & 1) != 0)
        goto LABEL_11;
      -[PIPortraitEffectFilter inputBlurMap](self, "inputBlurMap");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "imageByApplyingFilter:withInputParameters:", CFSTR("CIGammaAdjust"), &unk_1E5059278);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = CFSTR("inputDepthMap");
    }
LABEL_10:
    objc_msgSend(v9, "setValue:forKey:", v22, v23);

LABEL_11:
    objc_msgSend(v9, "outputImage");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "imageByInsertingIntermediate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  -[PIPortraitEffectFilter inputDisparity](self, "inputDisparity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v13, CFSTR("inputDisparity"));

  -[PIPortraitEffectFilter inputMatte](self, "inputMatte");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v14, CFSTR("inputMatte"));

  -[PIPortraitEffectFilter inputBlurMap](self, "inputBlurMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v15, CFSTR("inputBlurMap"));

  -[PIPortraitEffectFilter inputFaceMask](self, "inputFaceMask");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v16, CFSTR("inputFaceMask"));

  -[PIPortraitEffectFilter inputHairMask](self, "inputHairMask");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v17, CFSTR("inputHairMask"));

  -[PIPortraitEffectFilter inputTeethMask](self, "inputTeethMask");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v18, CFSTR("inputTeethMask"));

  -[PIPortraitEffectFilter inputGenerateSpillMatte](self, "inputGenerateSpillMatte");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v19, CFSTR("inputGenerateSpillMatte"));

  -[PIPortraitEffectFilter inputOneShot](self, "inputOneShot");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "BOOLValue");

  if (v21)
  {
    -[PIPortraitEffectFilter inputStrength](self, "inputStrength");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = CFSTR("inputStrength");
    goto LABEL_10;
  }
  objc_msgSend(v9, "setValue:forKey:", &unk_1E5051DC8, CFSTR("inputStrength"));
  objc_msgSend(v9, "outputImage");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "imageByInsertingIntermediate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setValue:forKey:", &unk_1E5051DA8, CFSTR("inputStrength"));
  objc_msgSend(v9, "outputImage");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "imageByInsertingIntermediate");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27 || !v31)
  {

    v28 = 0;
    goto LABEL_13;
  }
  v32 = (void *)objc_opt_class();
  -[PIPortraitEffectFilter inputStrength](self, "inputStrength");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "remapPortraitV2Strength:portraitEffectKind:", v33, v7);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = *MEMORY[0x1E0C9E178];
  v51[0] = *MEMORY[0x1E0C9E190];
  v51[1] = v35;
  v52[0] = v27;
  v52[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMix"), v36);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
LABEL_13:

  return v28;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)inputFullSizeImage
{
  return self->_inputFullSizeImage;
}

- (void)setInputFullSizeImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputFullSizeImage, a3);
}

- (CIImage)inputDisparity
{
  return self->_inputDisparity;
}

- (void)setInputDisparity:(id)a3
{
  objc_storeStrong((id *)&self->_inputDisparity, a3);
}

- (CIImage)inputMatte
{
  return self->_inputMatte;
}

- (void)setInputMatte:(id)a3
{
  objc_storeStrong((id *)&self->_inputMatte, a3);
}

- (CIImage)inputBlurMap
{
  return self->_inputBlurMap;
}

- (void)setInputBlurMap:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlurMap, a3);
}

- (CIImage)inputFaceMask
{
  return self->_inputFaceMask;
}

- (void)setInputFaceMask:(id)a3
{
  objc_storeStrong((id *)&self->_inputFaceMask, a3);
}

- (CIImage)inputHairMask
{
  return self->_inputHairMask;
}

- (void)setInputHairMask:(id)a3
{
  objc_storeStrong((id *)&self->_inputHairMask, a3);
}

- (CIImage)inputTeethMask
{
  return self->_inputTeethMask;
}

- (void)setInputTeethMask:(id)a3
{
  objc_storeStrong((id *)&self->_inputTeethMask, a3);
}

- (CIImage)inputDepthMap
{
  return self->_inputDepthMap;
}

- (void)setInputDepthMap:(id)a3
{
  objc_storeStrong((id *)&self->_inputDepthMap, a3);
}

- (NSString)inputKind
{
  return self->_inputKind;
}

- (void)setInputKind:(id)a3
{
  objc_storeStrong((id *)&self->_inputKind, a3);
}

- (NSNumber)inputVersion
{
  return self->_inputVersion;
}

- (void)setInputVersion:(id)a3
{
  objc_storeStrong((id *)&self->_inputVersion, a3);
}

- (id)inputFaceLandmarkArray
{
  return self->_inputFaceLandmarkArray;
}

- (void)setInputFaceLandmarkArray:(id)a3
{
  objc_storeStrong(&self->_inputFaceLandmarkArray, a3);
}

- (NSNumber)inputScale
{
  return self->_inputScale;
}

- (void)setInputScale:(id)a3
{
  objc_storeStrong((id *)&self->_inputScale, a3);
}

- (NSNumber)inputGenerateSpillMatte
{
  return self->_inputGenerateSpillMatte;
}

- (void)setInputGenerateSpillMatte:(id)a3
{
  objc_storeStrong((id *)&self->_inputGenerateSpillMatte, a3);
}

- (NSNumber)inputStrength
{
  return self->_inputStrength;
}

- (void)setInputStrength:(id)a3
{
  objc_storeStrong((id *)&self->_inputStrength, a3);
}

- (NSNumber)inputOneShot
{
  return self->_inputOneShot;
}

- (void)setInputOneShot:(id)a3
{
  objc_storeStrong((id *)&self->_inputOneShot, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputOneShot, 0);
  objc_storeStrong((id *)&self->_inputStrength, 0);
  objc_storeStrong((id *)&self->_inputGenerateSpillMatte, 0);
  objc_storeStrong((id *)&self->_inputScale, 0);
  objc_storeStrong(&self->_inputFaceLandmarkArray, 0);
  objc_storeStrong((id *)&self->_inputVersion, 0);
  objc_storeStrong((id *)&self->_inputKind, 0);
  objc_storeStrong((id *)&self->_inputDepthMap, 0);
  objc_storeStrong((id *)&self->_inputTeethMask, 0);
  objc_storeStrong((id *)&self->_inputHairMask, 0);
  objc_storeStrong((id *)&self->_inputFaceMask, 0);
  objc_storeStrong((id *)&self->_inputBlurMap, 0);
  objc_storeStrong((id *)&self->_inputMatte, 0);
  objc_storeStrong((id *)&self->_inputDisparity, 0);
  objc_storeStrong((id *)&self->_inputFullSizeImage, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
