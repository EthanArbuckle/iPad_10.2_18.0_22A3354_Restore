@implementation PIPhotoEffect3DFilter

- (id)outputImage
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v21;
  void *v22;
  const void **v23;
  void *specific;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  _QWORD v34[2];
  _QWORD v35[2];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[PIPhotoEffect3DFilter inputImage](self, "inputImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PIPhotoEffect3DFilter inputKind](self, "inputKind");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      NUAssertLogger_12040();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Missing photo effect kind"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v22;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

      }
      v23 = (const void **)MEMORY[0x1E0D51D48];
      specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
      NUAssertLogger_12040();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      if (specific)
      {
        if (v26)
        {
          v29 = dispatch_get_specific(*v23);
          v30 = (void *)MEMORY[0x1E0CB3978];
          v31 = v29;
          objc_msgSend(v30, "callStackSymbols");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "componentsJoinedByString:", CFSTR("\n"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v37 = v29;
          v38 = 2114;
          v39 = v33;
          _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

        }
      }
      else if (v26)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v37 = v28;
        _os_log_error_impl(&dword_1A6382000, v25, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

      }
      _NUAssertFailHandler();
    }
    v5 = (void *)v4;
    objc_msgSend(CFSTR("CIPhotoEffect"), "stringByAppendingString:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPhotoEffect3DFilter inputIsHDR](self, "inputIsHDR");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "BOOLValue");

    if (v8)
    {
      +[PIPhotosPipelineHDRFilters HDRFilterForSDRFilter:](PIPhotosPipelineHDRFilters, "HDRFilterForSDRFilter:", v6);
      v9 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v9;
    }
    objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPhotoEffect3DFilter inputImage](self, "inputImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forKey:", v11, *MEMORY[0x1E0C9E1F8]);

    objc_msgSend(v10, "setValue:forKey:", &unk_1E5051DD8, CFSTR("inputThreshold"));
    -[PIPhotoEffect3DFilter inputBlurMap](self, "inputBlurMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "imageByApplyingFilter:withInputParameters:", CFSTR("CIGammaAdjust"), &unk_1E50592A0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setValue:forKey:", v13, CFSTR("inputDepthMap"));
    objc_msgSend(v10, "outputImage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PIPhotoEffect3DFilter inputIntensity](self, "inputIntensity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[PIPhotoEffect3DFilter inputImage](self, "inputImage", *MEMORY[0x1E0C9E190]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v16;
      v34[1] = *MEMORY[0x1E0C9E178];
      -[PIPhotoEffect3DFilter inputIntensity](self, "inputIntensity");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v35[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "imageByApplyingFilter:withInputParameters:", CFSTR("CIMix"), v18);
      v19 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v19;
    }

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (CIImage)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong((id *)&self->_inputImage, a3);
}

- (CIImage)inputBlurMap
{
  return self->_inputBlurMap;
}

- (void)setInputBlurMap:(id)a3
{
  objc_storeStrong((id *)&self->_inputBlurMap, a3);
}

- (NSString)inputKind
{
  return self->_inputKind;
}

- (void)setInputKind:(id)a3
{
  objc_storeStrong((id *)&self->_inputKind, a3);
}

- (NSNumber)inputIntensity
{
  return self->_inputIntensity;
}

- (void)setInputIntensity:(id)a3
{
  objc_storeStrong((id *)&self->_inputIntensity, a3);
}

- (NSNumber)inputIsHDR
{
  return self->_inputIsHDR;
}

- (void)setInputIsHDR:(id)a3
{
  objc_storeStrong((id *)&self->_inputIsHDR, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputIsHDR, 0);
  objc_storeStrong((id *)&self->_inputIntensity, 0);
  objc_storeStrong((id *)&self->_inputKind, 0);
  objc_storeStrong((id *)&self->_inputBlurMap, 0);
  objc_storeStrong((id *)&self->_inputImage, 0);
}

@end
