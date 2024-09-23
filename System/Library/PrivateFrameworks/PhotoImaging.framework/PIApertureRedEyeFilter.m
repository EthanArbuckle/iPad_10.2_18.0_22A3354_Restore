@implementation PIApertureRedEyeFilter

- (id)outputImage
{
  void *v2;
  CGColorSpaceRef v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  id v48;
  CIImage *v49;
  NSObject *v50;
  CIImage *v51;
  double v53;
  double v54;
  double v55;
  double v56;
  CGColorSpace *space;
  PIApertureRedEyeFilter *v58;
  NSArray *obj;
  uint64_t v60;
  uint64_t v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  id v74;
  void *v75;
  _QWORD v76[2];
  _QWORD v77[2];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D990]);
  -[CIImage extent](self->inputImage, "extent");
  v55 = v6;
  v56 = v5;
  v53 = v8;
  v54 = v7;
  space = v4;
  v58 = self;
  -[CIImage imageByColorMatchingWorkingSpaceToColorSpace:](self->inputImage, "imageByColorMatchingWorkingSpaceToColorSpace:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageByClampingToExtent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v58->inputSpots;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
  if (v11)
  {
    v61 = *(_QWORD *)v70;
    v60 = *MEMORY[0x1E0C9E1B8];
    v12 = *MEMORY[0x1E0C9E258];
    while (2)
    {
      v13 = 0;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v70 != v61)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v13);
        objc_msgSend(v15, "objectForKey:", v60);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "pointValue");
        v18 = v17;
        v20 = v19;

        objc_msgSend(v15, "objectForKey:", v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "floatValue");
        v23 = v22;

        objc_msgSend(v15, "objectForKey:", CFSTR("inputSensitivity"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v26 = v25 * 0.1 + 0.5;
        if (v26 < 1.0)
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("inputSensitivity"));
          v2 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "doubleValue");
          v28 = 0.0;
          if (v27 * 0.1 + 0.5 < 0.0)
            goto LABEL_11;
        }
        objc_msgSend(v15, "objectForKey:", CFSTR("inputSensitivity"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "doubleValue");
        v28 = 1.0;
        if (v30 * 0.1 + 0.5 < 1.0)
        {
          objc_msgSend(v15, "objectForKey:", CFSTR("inputSensitivity"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "doubleValue");
          v33 = v32;

          v28 = v33 * 0.1 + 0.5;
        }

        if (v26 < 1.0)
LABEL_11:

        v67 = 0u;
        v68 = 0u;
        +[PIApertureRedEyeProcessorKernel ROIForCenterPoint:radius:](PIApertureRedEyeProcessorKernel, "ROIForCenterPoint:radius:", v18, v20, v23);
        v76[0] = CFSTR("ROI");
        v34 = (void *)MEMORY[0x1E0C9DDF8];
        v65 = v67;
        v66 = v68;
        NUPixelRectToCGRect();
        objc_msgSend(v34, "vectorWithCGRect:");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v76[1] = CFSTR("Sensitivity");
        v77[0] = v35;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v77[1] = v36;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v77, v76, 2);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v63 = v67;
        v64 = v68;
        NUPixelRectToCGRect();
        v39 = v38;
        v41 = v40;
        v43 = v42;
        v45 = v44;
        v75 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v75, 1);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0;
        +[CIImageProcessorKernel applyWithExtent:inputs:arguments:error:](PIApertureRedEyeProcessorKernel, "applyWithExtent:inputs:arguments:error:", v46, v37, &v62, v39, v41, v43, v45);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = v62;

        if (!v47)
        {
          if (*MEMORY[0x1E0D52390] != -1)
            dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_52);
          v50 = *MEMORY[0x1E0D52398];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v74 = v48;
            _os_log_error_impl(&dword_1A6382000, v50, OS_LOG_TYPE_ERROR, "Failed to apply red eye repair. error: %{public}@", buf, 0xCu);
          }

          v49 = v58->inputImage;
          goto LABEL_21;
        }
        objc_msgSend(v47, "imageByCompositingOverImage:", v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v10;
      }
      while (v11 != v13);
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      if (v11)
        continue;
      break;
    }
  }

  objc_msgSend(v10, "imageByCroppingToRect:", v56, v55, v54, v53);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "imageByColorMatchingColorSpaceToWorkingSpace:", space);
  v49 = (CIImage *)objc_claimAutoreleasedReturnValue();
LABEL_21:
  v51 = v49;

  CGColorSpaceRelease(space);
  return v51;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->inputSpots, 0);
  objc_storeStrong((id *)&self->inputImage, 0);
}

@end
