@implementation PIValuesAtCapture

- (id)initFromMinAperture:(float)a3 maxAperture:(float)a4 aperture:(float)a5 focusRect:(id)a6 portraitStrength:(float)a7 SDOFRenderingVersion:(unint64_t)a8 depthVersionInfo:(id)a9
{
  id v15;
  PIValuesAtCapture *v16;
  PIValuesAtCapture *v17;
  _BOOL4 v18;
  _BOOL4 v19;
  __int128 v20;
  float v21;
  uint64_t v22;
  NSDictionary *focusRect;
  double v24;
  uint64_t v25;
  NSNumber *minimumAperture;
  double v27;
  uint64_t v28;
  NSNumber *maximumAperture;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)PIValuesAtCapture;
  v15 = a6;
  v16 = -[PIValuesAtCapture init](&v31, sel_init);
  v17 = v16;
  v18 = a3 > 0.0;
  if (a4 <= 0.0)
    v18 = 0;
  v19 = a7 <= 1.0 && a7 >= 0.0;
  if (a8 >= 4)
  {
    v20 = xmmword_1A64DDF10;
LABEL_10:
    *(_OWORD *)&v16->_portraitMajorVersion = v20;
    goto LABEL_11;
  }
  if (v19)
  {
    v20 = xmmword_1A64DDF00;
    goto LABEL_10;
  }
  v16->_portraitMajorVersion = 1;
  v16->_portraitMinorVersion = v18;
LABEL_11:
  v21 = 5.9;
  if (a5 > 0.0)
    v21 = a5;
  v16->_aperture = v21;
  v22 = objc_msgSend(v15, "copy", v31.receiver, v31.super_class);

  focusRect = v17->_focusRect;
  v17->_focusRect = (NSDictionary *)v22;

  LODWORD(v24) = 0.5;
  if (v19)
    *(float *)&v24 = a7;
  v17->_portraitStrength = *(float *)&v24;
  if (a3 <= 0.0)
  {
    minimumAperture = v17->_minimumAperture;
    v17->_minimumAperture = 0;
  }
  else
  {
    *(float *)&v24 = a3;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    minimumAperture = v17->_minimumAperture;
    v17->_minimumAperture = (NSNumber *)v25;
  }

  if (a4 <= 0.0)
  {
    maximumAperture = v17->_maximumAperture;
    v17->_maximumAperture = 0;
  }
  else
  {
    *(float *)&v27 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    maximumAperture = v17->_maximumAperture;
    v17->_maximumAperture = (NSNumber *)v28;
  }

  v17->_depthVersionInfo = ($9E65B678CC00D971BA8859CB3A28E87B)a9;
  v17->_SDOFRenderingVersion = a8;
  return v17;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  float v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PIValuesAtCapture aperture](self, "aperture");
  v6 = v5;
  -[PIValuesAtCapture minimumAperture](self, "minimumAperture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIValuesAtCapture maximumAperture](self, "maximumAperture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIValuesAtCapture focusRect](self, "focusRect");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PIValuesAtCapture portraitStrength](self, "portraitStrength");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p \n\taperture:%f \n\tminimumAperture:%@ \n\tmaximumAperture:%@ \n\tfocusRect:%@ \n\tportraitStrength:%f \n\tSDOFRenderingVersion:%lu \n\tportraitMajorVersion:%lu \n\tportraitMinorVersion:%lu>"), v4, self, *(_QWORD *)&v6, v7, v8, v9, v10, -[PIValuesAtCapture SDOFRenderingVersion](self, "SDOFRenderingVersion"), -[PIValuesAtCapture portraitMajorVersion](self, "portraitMajorVersion"), -[PIValuesAtCapture portraitMinorVersion](self, "portraitMinorVersion"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (float)aperture
{
  return self->_aperture;
}

- (void)setAperture:(float)a3
{
  self->_aperture = a3;
}

- (float)portraitStrength
{
  return self->_portraitStrength;
}

- (void)setPortraitStrength:(float)a3
{
  self->_portraitStrength = a3;
}

- (NSDictionary)focusRect
{
  return self->_focusRect;
}

- (void)setFocusRect:(id)a3
{
  objc_storeStrong((id *)&self->_focusRect, a3);
}

- (NSNumber)minimumAperture
{
  return self->_minimumAperture;
}

- (void)setMinimumAperture:(id)a3
{
  objc_storeStrong((id *)&self->_minimumAperture, a3);
}

- (NSNumber)maximumAperture
{
  return self->_maximumAperture;
}

- (void)setMaximumAperture:(id)a3
{
  objc_storeStrong((id *)&self->_maximumAperture, a3);
}

- (unint64_t)SDOFRenderingVersion
{
  return self->_SDOFRenderingVersion;
}

- (void)setSDOFRenderingVersion:(unint64_t)a3
{
  self->_SDOFRenderingVersion = a3;
}

- (unint64_t)portraitMajorVersion
{
  return self->_portraitMajorVersion;
}

- (void)setPortraitMajorVersion:(unint64_t)a3
{
  self->_portraitMajorVersion = a3;
}

- (unint64_t)portraitMinorVersion
{
  return self->_portraitMinorVersion;
}

- (void)setPortraitMinorVersion:(unint64_t)a3
{
  self->_portraitMinorVersion = a3;
}

- ($2825F4736939C4A6D3AD43837233062D)depthVersionInfo
{
  return ($2825F4736939C4A6D3AD43837233062D)self->_depthVersionInfo;
}

- (void)setDepthVersionInfo:(id)a3
{
  self->_depthVersionInfo = ($9E65B678CC00D971BA8859CB3A28E87B)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumAperture, 0);
  objc_storeStrong((id *)&self->_minimumAperture, 0);
  objc_storeStrong((id *)&self->_focusRect, 0);
}

+ (id)valuesAtCaptureFromImageProperties:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  __CFString *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  int v37;
  int v38;
  int v39;
  int v40;
  uint64_t v41;
  void *v42;
  PIValuesAtCapture *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  NSObject *v48;
  void *v49;
  const void **v50;
  void *specific;
  NSObject *v52;
  _BOOL4 v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  unsigned __int16 v61;
  void *v62;
  float v63;
  uint64_t v64;
  id v65;
  id v66;
  uint8_t buf[4];
  _BYTE v68[24];
  __int16 v69;
  int v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!a4)
  {
    NUAssertLogger_20449();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "error != NULL");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v68 = v49;
      _os_log_error_impl(&dword_1A6382000, v48, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v50 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_20449();
    v52 = objc_claimAutoreleasedReturnValue();
    v53 = os_log_type_enabled(v52, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v53)
      {
        v56 = dispatch_get_specific(*v50);
        v57 = (void *)MEMORY[0x1E0CB3978];
        v58 = v56;
        objc_msgSend(v57, "callStackSymbols");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "componentsJoinedByString:", CFSTR("\n"));
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)v68 = v56;
        *(_WORD *)&v68[8] = 2114;
        *(_QWORD *)&v68[10] = v60;
        _os_log_error_impl(&dword_1A6382000, v52, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v53)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "componentsJoinedByString:", CFSTR("\n"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v68 = v55;
      _os_log_error_impl(&dword_1A6382000, v52, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v6 = v5;
  objc_msgSend(v5, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CBCF70]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C89CB8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedIntValue");

  if ((v10 & 0x40) == 0)
  {
    objc_msgSend(v6, "auxiliaryImagePropertiesForType:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = 0;
    objc_msgSend(v11, "auxiliaryImage:", &v66);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v66;
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load depth data"), v11, v13);
      v25 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

      goto LABEL_19;
    }
    objc_msgSend(v12, "underlyingAVDepthData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isDepthDataFiltered") & 1) != 0)
    {
      if (objc_msgSend(v14, "depthDataQuality"))
      {
        objc_msgSend(v14, "cameraCalibrationData");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          v65 = 0;
          objc_msgSend(v11, "auxiliaryCoreGraphicsInfoDictionary:", &v65);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v65;

          if (v16)
          {
            objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CBC6D0]);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              v62 = v16;
              v19 = (__CFString *)CGImageMetadataCopyStringValueWithPath((CGImageMetadataRef)v18, 0, CFSTR("depthData:DepthDataVersion"));
              v20 = -[__CFString intValue](v19, "intValue");
              v21 = HIWORD(v20);
              v61 = -[__CFString intValue](v19, "intValue");

              if (v20 < 0x20000)
              {
                v64 = 0;
                v63 = 0.0;
                v31 = (void *)MEMORY[0x1E0C9DDB8];
                objc_msgSend(v14, "depthBlurEffectRenderingParameters");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v31, "getMinMaxSimulatedApertureFrom:minValue:maxValue:version:", v32, &v64, &v63, (char *)&v64 + 4);

                if (v33)
                {
                  NULogger_20558();
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 67109888;
                    *(_DWORD *)v68 = v33;
                    *(_WORD *)&v68[4] = 2048;
                    *(double *)&v68[6] = *(float *)&v64;
                    *(_WORD *)&v68[14] = 2048;
                    *(double *)&v68[16] = v63;
                    v69 = 1024;
                    v70 = HIDWORD(v64);
                    _os_log_error_impl(&dword_1A6382000, v34, OS_LOG_TYPE_ERROR, "PIPortraitAutoCalculator getMinMaxSimulatedAperture returned error:%i (minAperture:%f maxAperture:%f version:%d)", buf, 0x22u);
                  }

                }
                v35 = objc_msgSend(MEMORY[0x1E0C9DDB8], "maxSDOFRenderingVersionSupported");
                if (SHIDWORD(v64) <= (int)v35)
                {
                  objc_msgSend(v14, "depthBlurEffectSimulatedAperture");
                  v38 = v37;
                  objc_msgSend(v14, "portraitLightingEffectStrength");
                  v40 = v39;
                  v41 = SHIDWORD(v64);
                  objc_msgSend(v6, "metadata");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  +[PIPortraitAutoCalculator focusRectDictionaryFromMetadata:](PIPortraitAutoCalculator, "focusRectDictionaryFromMetadata:", v42);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  v43 = [PIValuesAtCapture alloc];
                  *(float *)&v45 = v63;
                  LODWORD(v44) = v64;
                  LODWORD(v46) = v38;
                  LODWORD(v47) = v40;
                  v25 = -[PIValuesAtCapture initFromMinAperture:maxAperture:aperture:focusRect:portraitStrength:SDOFRenderingVersion:depthVersionInfo:](v43, "initFromMinAperture:maxAperture:aperture:focusRect:portraitStrength:SDOFRenderingVersion:depthVersionInfo:", v36, v41, v21 | ((unint64_t)v61 << 32), v44, v45, v46, v47);
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("We only know up to sDOF version %d. Found: %d"), v35, HIDWORD(v64));
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", v36, 0);
                  v25 = 0;
                  *a4 = (id)objc_claimAutoreleasedReturnValue();
                }
                v16 = v62;

              }
              else
              {
                v22 = (void *)MEMORY[0x1E0CB3940];
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "stringWithFormat:", CFSTR("Depth data version mismatch, asset has %@ but we can only handle %@"), v23, &unk_1E5051928);
                v24 = (void *)objc_claimAutoreleasedReturnValue();

                v16 = v62;
                objc_msgSend(MEMORY[0x1E0D520A0], "unsupportedError:object:", v24, v62);
                *a4 = (id)objc_claimAutoreleasedReturnValue();

                v25 = 0;
              }
              goto LABEL_32;
            }
            objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing auxiliary metadata"), v16);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D520A0], "errorWithCode:reason:object:underlyingError:", 1, CFSTR("Failed to load auxiliary data"), v11, v17);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v25 = 0;
          *a4 = v30;
LABEL_32:

          goto LABEL_17;
        }
        objc_msgSend(MEMORY[0x1E0D520A0], "missingError:object:", CFSTR("Missing camera calibration data"), v14);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
        v25 = 0;
        *a4 = v28;
        v17 = v13;
LABEL_17:

        v13 = v17;
        goto LABEL_18;
      }
      v26 = (void *)MEMORY[0x1E0D520A0];
      v27 = CFSTR("Low quality depth data is not supported");
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0D520A0];
      v27 = CFSTR("Unfiltered depth data is not supported");
    }
    objc_msgSend(v26, "unsupportedError:object:", v27, v14);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0D520A0], "invalidError:object:", CFSTR("Portrait was previously applied."), 0);
  v25 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v25;
}

@end
