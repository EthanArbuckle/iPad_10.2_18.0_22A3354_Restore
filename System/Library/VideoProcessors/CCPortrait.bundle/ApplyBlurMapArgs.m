@implementation ApplyBlurMapArgs

- (ApplyBlurMapArgs)init
{
  ApplyBlurMapArgs *v2;
  ApplyBlurMapArgs *v3;
  ApplyBlurMapIntermediates *v4;
  ApplyBlurMapIntermediates *intermediates;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ApplyBlurMapArgs;
  v2 = -[ApplyBlurMapArgs init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_inputScale = 1.0;
    v4 = objc_alloc_init(ApplyBlurMapIntermediates);
    intermediates = v3->_intermediates;
    v3->_intermediates = v4;

  }
  return v3;
}

+ (id)validKeys
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], a2, (uint64_t)CFSTR("options"), CFSTR("metadata"), CFSTR("simulatedAperture"), CFSTR("maxBlur"), CFSTR("inputScale"), CFSTR("lumaNoiseAmplitude"), CFSTR("inputBlurMap"), CFSTR("inputAlpha"), CFSTR("inputImage"), CFSTR("inputImageLuma"), CFSTR("inputImageChroma"), CFSTR("inputGainMap"), CFSTR("outputImageLuma"), CFSTR("outputImageChroma"), CFSTR("intermediates"), CFSTR("captureFolderMiscPath"), 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  NSString *v18;
  SEL v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  float (*v23)(ApplyBlurMapArgs *, SEL);
  float v24;
  const char *v25;
  void *v26;
  const char *v27;
  const char *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = objc_opt_class();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p\n"), v4, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], v7, (uint64_t)CFSTR("simulatedAperture"), CFSTR("maxBlur"), CFSTR("inputScale"), CFSTR("lumaNoiseAmplitude"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v9 = (void *)objc_opt_class();
  objc_msgSend_validKeys(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v30, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v12);
        v18 = *(NSString **)(*((_QWORD *)&v30 + 1) + 8 * i);
        v19 = NSSelectorFromString(v18);
        v21 = objc_msgSend_methodForSelector_(self, v20, (uint64_t)v19);
        if (v21)
        {
          v23 = (float (*)(ApplyBlurMapArgs *, SEL))v21;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if ((objc_msgSend_containsObject_(v8, v22, (uint64_t)v18) & 1) != 0)
            {
              v24 = v23(self, v19);
              objc_msgSend_appendFormat_(v6, v25, (uint64_t)CFSTR("\t%@: %g,\n"), v18, v24);
            }
            else
            {
              v23(self, v19);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_appendFormat_(v6, v27, (uint64_t)CFSTR("\t%@: %@,\n"), v18, v26);

            }
          }
        }
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v22, (uint64_t)&v30, v34, 16);
    }
    while (v15);
  }

  objc_msgSend_appendFormat_(v6, v28, (uint64_t)CFSTR(">\n"));
  return v6;
}

- (ApplyBlurMapArgs)initWithDictionary:(id)a3
{
  id v4;
  ApplyBlurMapArgs *v5;
  ApplyBlurMapArgs *v6;
  ApplyBlurMapIntermediates *v7;
  ApplyBlurMapIntermediates *intermediates;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  NSObject *v29;
  const char *v30;
  NSString *v31;
  SEL v32;
  id v33;
  const char *v34;
  void *v35;
  BOOL v36;
  const char *v37;
  uint64_t v38;
  void (*v39)(ApplyBlurMapArgs *, SEL);
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  NSString *v46;
  NSString *v47;
  NSString *v48;
  NSObject *v49;
  NSObject *v50;
  const char *v51;
  NSString *v52;
  const char *v53;
  uint64_t v54;
  NSString *v55;
  NSString *v56;
  NSString *v57;
  uint64_t v58;
  ApplyBlurMapArgs *v60;
  uint64_t v61;
  uint64_t v62;
  id obj;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  objc_super v68;
  uint8_t buf[4];
  const char *v70;
  __int16 v71;
  NSString *v72;
  __int16 v73;
  NSString *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)ApplyBlurMapArgs;
  v5 = -[ApplyBlurMapArgs init](&v68, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_inputScale = 1.0;
    v7 = objc_alloc_init(ApplyBlurMapIntermediates);
    intermediates = v6->_intermediates;
    v6->_intermediates = v7;

    if (v4)
    {
      v60 = v6;
      v9 = (void *)objc_opt_class();
      objc_msgSend_validKeys(v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      objc_msgSend_allKeys(v4, v13, v14);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v64, v75, 16);
      if (!v16)
        goto LABEL_41;
      v18 = v16;
      v19 = *(_QWORD *)v65;
      v61 = *(_QWORD *)v65;
      while (1)
      {
        v20 = 0;
        v62 = v18;
        do
        {
          if (*(_QWORD *)v65 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v20);
          if ((objc_msgSend_containsObject_(v12, v17, (uint64_t)v21) & 1) != 0)
          {
            v23 = v12;
            objc_msgSend_substringToIndex_(v21, v22, 1);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_capitalizedString(v24, v25, v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByReplacingCharactersInRange_withString_(v21, v28, 0, 1, v27);
            v29 = objc_claimAutoreleasedReturnValue();

            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v30, (uint64_t)CFSTR("set%@:"), v29);
            v31 = (NSString *)objc_claimAutoreleasedReturnValue();
            v32 = NSSelectorFromString(v31);
            v33 = v4;
            objc_msgSend_objectForKeyedSubscript_(v4, v34, (uint64_t)v21);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35)
              v36 = v32 == 0;
            else
              v36 = 1;
            if (v36)
              goto LABEL_36;
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v38 = objc_msgSend_methodForSelector_(v60, v37, (uint64_t)v32);
              if (v38)
              {
                v39 = (void (*)(ApplyBlurMapArgs *, SEL))v38;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v40 = v35;
                  v43 = objc_msgSend_count(v40, v41, v42);
                  if (v43 == 4)
                  {
                    objc_msgSend_CGRectValue(v40, v44, v45);
                    v39(v60, v32);
                  }
                  else
                  {
                    if (v43 == 2)
                    {
                      objc_msgSend_CGPointValue(v40, v44, v45);
                      v39(v60, v32);
                      goto LABEL_35;
                    }
                    uni_logger_api();
                    v49 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                    {
                      v55 = (NSString *)objc_opt_class();
                      *(_DWORD *)buf = 136446722;
                      v70 = "-[ApplyBlurMapArgs initWithDictionary:]";
                      v71 = 2112;
                      v72 = (NSString *)v21;
                      v73 = 2112;
                      v74 = v55;
                      v56 = v55;
                      _os_log_error_impl(&dword_24B6B5000, v49, OS_LOG_TYPE_ERROR, "%{public}s Unexpected # of components for %@ on class %@", buf, 0x20u);

                    }
LABEL_33:

                  }
LABEL_35:

LABEL_36:
                  v4 = v33;
                  v12 = v23;
                  v19 = v61;
                  v18 = v62;
                  goto LABEL_37;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend_floatValue(v35, v53, v54);
                  v39(v60, v32);
                  goto LABEL_36;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  ((void (*)(ApplyBlurMapArgs *, SEL, void *))v39)(v60, v32, v35);
                  goto LABEL_36;
                }
                uni_logger_api();
                v40 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  goto LABEL_35;
                v57 = (NSString *)objc_opt_class();
                *(_DWORD *)buf = 136446722;
                v70 = "-[ApplyBlurMapArgs initWithDictionary:]";
                v71 = 2112;
                v72 = (NSString *)v21;
                v73 = 2112;
                v74 = v57;
                v49 = v57;
                v50 = v40;
                v51 = "%{public}s Unexpected type (not NSObject) for %@ on class %@";
              }
              else
              {
                uni_logger_api();
                v40 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                  goto LABEL_35;
                v52 = (NSString *)objc_opt_class();
                *(_DWORD *)buf = 136446722;
                v70 = "-[ApplyBlurMapArgs initWithDictionary:]";
                v71 = 2112;
                v72 = v31;
                v73 = 2112;
                v74 = v52;
                v49 = v52;
                v50 = v40;
                v51 = "%{public}s can't find implementation for %@ in %@ class; results will be unpredictable";
              }
            }
            else
            {
              uni_logger_api();
              v40 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
                goto LABEL_35;
              v48 = (NSString *)objc_opt_class();
              *(_DWORD *)buf = 136446722;
              v70 = "-[ApplyBlurMapArgs initWithDictionary:]";
              v71 = 2112;
              v72 = v48;
              v73 = 2112;
              v74 = v31;
              v49 = v48;
              v50 = v40;
              v51 = "%{public}s Class %@ does not respond to selector %@; results will be unpredictable";
            }
            _os_log_error_impl(&dword_24B6B5000, v50, OS_LOG_TYPE_ERROR, v51, buf, 0x20u);
            goto LABEL_33;
          }
          uni_logger_api();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            v46 = (NSString *)objc_opt_class();
            *(_DWORD *)buf = 136446722;
            v70 = "-[ApplyBlurMapArgs initWithDictionary:]";
            v71 = 2112;
            v72 = v46;
            v73 = 2112;
            v74 = (NSString *)v21;
            v47 = v46;
            _os_log_error_impl(&dword_24B6B5000, v29, OS_LOG_TYPE_ERROR, "%{public}s Invalid key for %@: %@; results will be unpredictable",
              buf,
              0x20u);

          }
LABEL_37:

          ++v20;
        }
        while (v18 != v20);
        v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v64, v75, 16);
        v18 = v58;
        if (!v58)
        {
LABEL_41:

          v6 = v60;
          break;
        }
      }
    }
  }

  return v6;
}

- (BOOL)validateForMetal
{
  const char *v3;
  float maxBlur;
  BOOL v5;
  int v6;
  const char *v7;
  id inputAlpha;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_simulatedAperture <= 0.0)
    goto LABEL_20;
  maxBlur = self->_maxBlur;
  v5 = maxBlur <= 0.0 || maxBlur > 1.0;
  if (v5 || self->_inputScale <= 0.0 || self->_lumaNoiseAmplitude < 0.0)
    goto LABEL_20;
  v6 = objc_msgSend_conformsToProtocol_(self->_inputBlurMap, v3, (uint64_t)&unk_2579B9140);
  if (!v6)
    return v6;
  inputAlpha = self->_inputAlpha;
  if (inputAlpha)
  {
    v6 = objc_msgSend_conformsToProtocol_(inputAlpha, v7, (uint64_t)&unk_2579B9140);
    if (!v6)
      return v6;
  }
  if (self->_inputImage)
  {
LABEL_20:
    LOBYTE(v6) = 0;
    return v6;
  }
  v6 = objc_msgSend_conformsToProtocol_(self->_inputImageLuma, v7, (uint64_t)&unk_2579B9140);
  if (v6)
  {
    v6 = objc_msgSend_conformsToProtocol_(self->_inputImageChroma, v9, (uint64_t)&unk_2579B9140);
    if (v6)
    {
      v6 = objc_msgSend_conformsToProtocol_(self->_outputImageLuma, v10, (uint64_t)&unk_2579B9140);
      if (v6)
      {
        v6 = objc_msgSend_conformsToProtocol_(self->_outputImageChroma, v11, (uint64_t)&unk_2579B9140);
        if (v6)
        {
          if ((objc_msgSend_validateForMetal(self->_intermediates, v12, v13) & 1) != 0)
          {
            LOBYTE(v6) = 1;
            return v6;
          }
          goto LABEL_20;
        }
      }
    }
  }
  return v6;
}

- (BOOL)validateForCoreImage
{
  float maxBlur;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || self->_simulatedAperture <= 0.0)
    return 0;
  maxBlur = self->_maxBlur;
  if (maxBlur <= 0.0 || maxBlur > 1.0)
    return 0;
  if (self->_inputScale <= 0.0)
    return 0;
  if (self->_lumaNoiseAmplitude < 0.0)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  if (self->_inputAlpha)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  if (self->_inputImage)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || self->_inputImageLuma || self->_inputImageChroma)
      return 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
  }
  return !self->_outputImageLuma && !self->_outputImageChroma;
}

- (NSDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
  objc_storeStrong((id *)&self->_options, a3);
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (float)simulatedAperture
{
  return self->_simulatedAperture;
}

- (void)setSimulatedAperture:(float)a3
{
  self->_simulatedAperture = a3;
}

- (float)maxBlur
{
  return self->_maxBlur;
}

- (void)setMaxBlur:(float)a3
{
  self->_maxBlur = a3;
}

- (float)inputScale
{
  return self->_inputScale;
}

- (void)setInputScale:(float)a3
{
  self->_inputScale = a3;
}

- (float)lumaNoiseAmplitude
{
  return self->_lumaNoiseAmplitude;
}

- (void)setLumaNoiseAmplitude:(float)a3
{
  self->_lumaNoiseAmplitude = a3;
}

- (id)inputBlurMap
{
  return self->_inputBlurMap;
}

- (void)setInputBlurMap:(id)a3
{
  objc_storeStrong(&self->_inputBlurMap, a3);
}

- (id)inputAlpha
{
  return self->_inputAlpha;
}

- (void)setInputAlpha:(id)a3
{
  objc_storeStrong(&self->_inputAlpha, a3);
}

- (id)inputImage
{
  return self->_inputImage;
}

- (void)setInputImage:(id)a3
{
  objc_storeStrong(&self->_inputImage, a3);
}

- (id)inputImageLuma
{
  return self->_inputImageLuma;
}

- (void)setInputImageLuma:(id)a3
{
  objc_storeStrong(&self->_inputImageLuma, a3);
}

- (id)inputImageChroma
{
  return self->_inputImageChroma;
}

- (void)setInputImageChroma:(id)a3
{
  objc_storeStrong(&self->_inputImageChroma, a3);
}

- (id)inputGainMap
{
  return self->_inputGainMap;
}

- (void)setInputGainMap:(id)a3
{
  objc_storeStrong(&self->_inputGainMap, a3);
}

- (MTLTexture)outputImageLuma
{
  return self->_outputImageLuma;
}

- (void)setOutputImageLuma:(id)a3
{
  objc_storeStrong((id *)&self->_outputImageLuma, a3);
}

- (MTLTexture)outputImageChroma
{
  return self->_outputImageChroma;
}

- (void)setOutputImageChroma:(id)a3
{
  objc_storeStrong((id *)&self->_outputImageChroma, a3);
}

- (ApplyBlurMapIntermediates)intermediates
{
  return self->_intermediates;
}

- (void)setIntermediates:(id)a3
{
  objc_storeStrong((id *)&self->_intermediates, a3);
}

- (NSString)captureFolderMiscPath
{
  return self->_captureFolderMiscPath;
}

- (void)setCaptureFolderMiscPath:(id)a3
{
  objc_storeStrong((id *)&self->_captureFolderMiscPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureFolderMiscPath, 0);
  objc_storeStrong((id *)&self->_intermediates, 0);
  objc_storeStrong((id *)&self->_outputImageChroma, 0);
  objc_storeStrong((id *)&self->_outputImageLuma, 0);
  objc_storeStrong(&self->_inputGainMap, 0);
  objc_storeStrong(&self->_inputImageChroma, 0);
  objc_storeStrong(&self->_inputImageLuma, 0);
  objc_storeStrong(&self->_inputImage, 0);
  objc_storeStrong(&self->_inputAlpha, 0);
  objc_storeStrong(&self->_inputBlurMap, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
