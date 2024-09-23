@implementation MakeBlurMapArgs

- (MakeBlurMapArgs)init
{
  MakeBlurMapArgs *v2;
  MakeBlurMapArgs *v3;
  CGSize v4;
  MakeBlurMapIntermediates *v5;
  MakeBlurMapIntermediates *intermediates;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MakeBlurMapArgs;
  v2 = -[MakeBlurMapArgs init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_inputScale = 1.0;
    v4 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v2->_focusWindow.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v2->_focusWindow.size = v4;
    v5 = objc_alloc_init(MakeBlurMapIntermediates);
    intermediates = v3->_intermediates;
    v3->_intermediates = v5;

    v3->_focalLengthInPixels = 0.0;
    v3->_normalizedFocalLength = 0.0;
  }
  return v3;
}

+ (id)validKeys
{
  return (id)objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], a2, (uint64_t)CFSTR("options"), CFSTR("metadata"), CFSTR("simulatedAperture"), CFSTR("focalLengthInPixels"), CFSTR("maxBlur"), CFSTR("inputScale"), CFSTR("focusWindow"), CFSTR("facePoints"), CFSTR("inputImage"), CFSTR("inputImageLuma"), CFSTR("inputImageChroma"), CFSTR("inputShiftMap"), CFSTR("inputSegmentation"), CFSTR("inputHair"), CFSTR("inputGlasses"), CFSTR("inputGainMap"), CFSTR("intermediates"),
               CFSTR("captureFolderMiscPath"),
               0);
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
  double (*v23)(MakeBlurMapArgs *, SEL);
  const char *v24;
  double v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = objc_opt_class();
  objc_msgSend_stringWithFormat_(v3, v5, (uint64_t)CFSTR("<%@: %p\n"), v4, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithObjects_(MEMORY[0x24BDBCF20], v7, (uint64_t)CFSTR("simulatedAperture"), CFSTR("focalLengthInPixels"), CFSTR("maxBlur"), CFSTR("inputScale"), CFSTR("focusWindow"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v9 = (void *)objc_opt_class();
  objc_msgSend_validKeys(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v39, v43, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v40 != v16)
          objc_enumerationMutation(v12);
        v18 = *(NSString **)(*((_QWORD *)&v39 + 1) + 8 * i);
        v19 = NSSelectorFromString(v18);
        v21 = objc_msgSend_methodForSelector_(self, v20, (uint64_t)v19);
        if (v21)
        {
          v23 = (double (*)(MakeBlurMapArgs *, SEL))v21;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if ((objc_msgSend_containsObject_(v8, v22, (uint64_t)v18) & 1) != 0)
            {
              if (objc_msgSend_isEqualToString_(v18, v24, (uint64_t)CFSTR("focusWindow")))
              {
                v25 = v23(self, v19);
                objc_msgSend_appendFormat_(v6, v26, (uint64_t)CFSTR("\t%@: { x=%g,y=%g width=%g, height=%g },\n"), v18, *(_QWORD *)&v25, v27, v28, v29);
              }
              else
              {
                v35 = (float)v23(self, v19);
                objc_msgSend_appendFormat_(v6, v32, (uint64_t)CFSTR("\t%@: %g,\n"), v18, *(_QWORD *)&v35, v36, v37, v38);
              }
            }
            else
            {
              v23(self, v19);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_appendFormat_(v6, v31, (uint64_t)CFSTR("\t%@: %@,\n"), v18, v30);

            }
          }
        }
      }
      v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v22, (uint64_t)&v39, v43, 16);
    }
    while (v15);
  }

  objc_msgSend_appendFormat_(v6, v33, (uint64_t)CFSTR(">\n"));
  return v6;
}

- (MakeBlurMapArgs)initWithDictionary:(id)a3
{
  id v4;
  MakeBlurMapArgs *v5;
  MakeBlurMapArgs *v6;
  CGSize v7;
  MakeBlurMapIntermediates *v8;
  MakeBlurMapIntermediates *intermediates;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  NSObject *v30;
  const char *v31;
  NSString *v32;
  SEL v33;
  id v34;
  const char *v35;
  void *v36;
  BOOL v37;
  const char *v38;
  uint64_t v39;
  void (*v40)(MakeBlurMapArgs *, SEL);
  NSObject *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  NSString *v47;
  NSString *v48;
  NSString *v49;
  NSObject *v50;
  NSObject *v51;
  const char *v52;
  NSString *v53;
  const char *v54;
  uint64_t v55;
  NSString *v56;
  NSString *v57;
  NSString *v58;
  uint64_t v59;
  MakeBlurMapArgs *v61;
  uint64_t v62;
  uint64_t v63;
  id obj;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  objc_super v69;
  uint8_t buf[4];
  const char *v71;
  __int16 v72;
  NSString *v73;
  __int16 v74;
  NSString *v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v69.receiver = self;
  v69.super_class = (Class)MakeBlurMapArgs;
  v5 = -[MakeBlurMapArgs init](&v69, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_inputScale = 1.0;
    v7 = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
    v5->_focusWindow.origin = (CGPoint)*MEMORY[0x24BDBF070];
    v5->_focusWindow.size = v7;
    v8 = objc_alloc_init(MakeBlurMapIntermediates);
    intermediates = v6->_intermediates;
    v6->_intermediates = v8;

    if (v4)
    {
      v61 = v6;
      v10 = (void *)objc_opt_class();
      objc_msgSend_validKeys(v10, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      objc_msgSend_allKeys(v4, v14, v15);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v65, v76, 16);
      if (!v17)
        goto LABEL_41;
      v19 = v17;
      v20 = *(_QWORD *)v66;
      v62 = *(_QWORD *)v66;
      while (1)
      {
        v21 = 0;
        v63 = v19;
        do
        {
          if (*(_QWORD *)v66 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v21);
          if ((objc_msgSend_containsObject_(v13, v18, (uint64_t)v22) & 1) != 0)
          {
            v24 = v13;
            objc_msgSend_substringToIndex_(v22, v23, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_capitalizedString(v25, v26, v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_stringByReplacingCharactersInRange_withString_(v22, v29, 0, 1, v28);
            v30 = objc_claimAutoreleasedReturnValue();

            objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v31, (uint64_t)CFSTR("set%@:"), v30);
            v32 = (NSString *)objc_claimAutoreleasedReturnValue();
            v33 = NSSelectorFromString(v32);
            v34 = v4;
            objc_msgSend_objectForKeyedSubscript_(v4, v35, (uint64_t)v22);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            if (v36)
              v37 = v33 == 0;
            else
              v37 = 1;
            if (v37)
              goto LABEL_36;
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v39 = objc_msgSend_methodForSelector_(v61, v38, (uint64_t)v33);
              if (v39)
              {
                v40 = (void (*)(MakeBlurMapArgs *, SEL))v39;
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v41 = v36;
                  v44 = objc_msgSend_count(v41, v42, v43);
                  if (v44 == 4)
                  {
                    objc_msgSend_CGRectValue(v41, v45, v46);
                    v40(v61, v33);
                  }
                  else
                  {
                    if (v44 == 2)
                    {
                      objc_msgSend_CGPointValue(v41, v45, v46);
                      v40(v61, v33);
                      goto LABEL_35;
                    }
                    uni_logger_api();
                    v50 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                    {
                      v56 = (NSString *)objc_opt_class();
                      *(_DWORD *)buf = 136446722;
                      v71 = "-[MakeBlurMapArgs initWithDictionary:]";
                      v72 = 2112;
                      v73 = (NSString *)v22;
                      v74 = 2112;
                      v75 = v56;
                      v57 = v56;
                      _os_log_error_impl(&dword_24B6B5000, v50, OS_LOG_TYPE_ERROR, "%{public}s Unexpected # of components for %@ on class %@", buf, 0x20u);

                    }
LABEL_33:

                  }
LABEL_35:

LABEL_36:
                  v4 = v34;
                  v13 = v24;
                  v20 = v62;
                  v19 = v63;
                  goto LABEL_37;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  objc_msgSend_floatValue(v36, v54, v55);
                  v40(v61, v33);
                  goto LABEL_36;
                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  ((void (*)(MakeBlurMapArgs *, SEL, void *))v40)(v61, v33, v36);
                  goto LABEL_36;
                }
                uni_logger_api();
                v41 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  goto LABEL_35;
                v58 = (NSString *)objc_opt_class();
                *(_DWORD *)buf = 136446722;
                v71 = "-[MakeBlurMapArgs initWithDictionary:]";
                v72 = 2112;
                v73 = (NSString *)v22;
                v74 = 2112;
                v75 = v58;
                v50 = v58;
                v51 = v41;
                v52 = "%{public}s Unexpected type (not NSObject) for %@ on class %@";
              }
              else
              {
                uni_logger_api();
                v41 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                  goto LABEL_35;
                v53 = (NSString *)objc_opt_class();
                *(_DWORD *)buf = 136446722;
                v71 = "-[MakeBlurMapArgs initWithDictionary:]";
                v72 = 2112;
                v73 = v32;
                v74 = 2112;
                v75 = v53;
                v50 = v53;
                v51 = v41;
                v52 = "%{public}s can't find implementation for %@ in %@ class; results will be unpredictable";
              }
            }
            else
            {
              uni_logger_api();
              v41 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
                goto LABEL_35;
              v49 = (NSString *)objc_opt_class();
              *(_DWORD *)buf = 136446722;
              v71 = "-[MakeBlurMapArgs initWithDictionary:]";
              v72 = 2112;
              v73 = v49;
              v74 = 2112;
              v75 = v32;
              v50 = v49;
              v51 = v41;
              v52 = "%{public}s Class %@ does not respond to selector %@; results will be unpredictable";
            }
            _os_log_error_impl(&dword_24B6B5000, v51, OS_LOG_TYPE_ERROR, v52, buf, 0x20u);
            goto LABEL_33;
          }
          uni_logger_api();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v47 = (NSString *)objc_opt_class();
            *(_DWORD *)buf = 136446722;
            v71 = "-[MakeBlurMapArgs initWithDictionary:]";
            v72 = 2112;
            v73 = v47;
            v74 = 2112;
            v75 = (NSString *)v22;
            v48 = v47;
            _os_log_error_impl(&dword_24B6B5000, v30, OS_LOG_TYPE_ERROR, "%{public}s Invalid key for %@: %@; results will be unpredictable",
              buf,
              0x20u);

          }
LABEL_37:

          ++v21;
        }
        while (v19 != v21);
        v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v65, v76, 16);
        v19 = v59;
        if (!v59)
        {
LABEL_41:

          v6 = v61;
          break;
        }
      }
    }
  }

  return v6;
}

- (BOOL)validateForMetal
{
  float maxBlur;
  BOOL v4;
  const char *v5;
  int v6;
  const char *v7;
  const char *v8;
  const char *v9;
  id inputSegmentation;
  id inputHair;
  id inputGlasses;
  const char *v13;
  uint64_t v14;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_simulatedAperture <= 0.0
    || self->_normalizedFocalLength <= 0.0
    || ((maxBlur = self->_maxBlur, maxBlur > 0.0) ? (v4 = maxBlur > 1.0) : (v4 = 1),
        v4 || self->_inputScale <= 0.0 || CGRectIsEmpty(self->_focusWindow) || self->_inputImage))
  {
LABEL_24:
    LOBYTE(v6) = 0;
    return v6;
  }
  v6 = objc_msgSend_conformsToProtocol_(self->_inputImageLuma, v5, (uint64_t)&unk_2579B9140);
  if (v6)
  {
    v6 = objc_msgSend_conformsToProtocol_(self->_inputImageChroma, v7, (uint64_t)&unk_2579B9140);
    if (v6)
    {
      v6 = objc_msgSend_conformsToProtocol_(self->_inputShiftMap, v8, (uint64_t)&unk_2579B9140);
      if (v6)
      {
        inputSegmentation = self->_inputSegmentation;
        if (!inputSegmentation
          || (v6 = objc_msgSend_conformsToProtocol_(inputSegmentation, v9, (uint64_t)&unk_2579B9140)) != 0)
        {
          inputHair = self->_inputHair;
          if (!inputHair || (v6 = objc_msgSend_conformsToProtocol_(inputHair, v9, (uint64_t)&unk_2579B9140)) != 0)
          {
            inputGlasses = self->_inputGlasses;
            if (!inputGlasses
              || (v6 = objc_msgSend_conformsToProtocol_(inputGlasses, v9, (uint64_t)&unk_2579B9140)) != 0)
            {
              v6 = objc_msgSend_conformsToProtocol_(self->_outputBlurMap, v9, (uint64_t)&unk_2579B9140);
              if (v6)
              {
                if ((objc_msgSend_validateForMetal(self->_intermediates, v13, v14) & 1) != 0)
                {
                  LOBYTE(v6) = 1;
                  return v6;
                }
                goto LABEL_24;
              }
            }
          }
        }
      }
    }
  }
  return v6;
}

- (BOOL)validateForCoreImage
{
  float maxBlur;
  BOOL v4;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_simulatedAperture <= 0.0
    || self->_focalLengthInPixels <= 0.0 && self->_normalizedFocalLength <= 0.0)
  {
    return 0;
  }
  maxBlur = self->_maxBlur;
  v4 = maxBlur <= 0.0 || maxBlur > 1.0;
  if (v4 || self->_inputScale <= 0.0 || CGRectIsEmpty(self->_focusWindow))
    return 0;
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
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (!self->_inputSegmentation || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (!self->_inputHair || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        if (!self->_inputGlasses || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          if (!self->_inputGainMap || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (!self->_outputBlurMap)
              return 1;
          }
        }
      }
    }
  }
  return 0;
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

- (float)focalLengthInPixels
{
  return self->_focalLengthInPixels;
}

- (void)setFocalLengthInPixels:(float)a3
{
  self->_focalLengthInPixels = a3;
}

- (float)normalizedFocalLength
{
  return self->_normalizedFocalLength;
}

- (void)setNormalizedFocalLength:(float)a3
{
  self->_normalizedFocalLength = a3;
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

- (CGRect)focusWindow
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_focusWindow.origin.x;
  y = self->_focusWindow.origin.y;
  width = self->_focusWindow.size.width;
  height = self->_focusWindow.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFocusWindow:(CGRect)a3
{
  self->_focusWindow = a3;
}

- (NSArray)facePoints
{
  return self->_facePoints;
}

- (void)setFacePoints:(id)a3
{
  objc_storeStrong((id *)&self->_facePoints, a3);
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

- (id)inputShiftMap
{
  return self->_inputShiftMap;
}

- (void)setInputShiftMap:(id)a3
{
  objc_storeStrong(&self->_inputShiftMap, a3);
}

- (id)inputSegmentation
{
  return self->_inputSegmentation;
}

- (void)setInputSegmentation:(id)a3
{
  objc_storeStrong(&self->_inputSegmentation, a3);
}

- (id)inputHair
{
  return self->_inputHair;
}

- (void)setInputHair:(id)a3
{
  objc_storeStrong(&self->_inputHair, a3);
}

- (id)inputGlasses
{
  return self->_inputGlasses;
}

- (void)setInputGlasses:(id)a3
{
  objc_storeStrong(&self->_inputGlasses, a3);
}

- (id)inputGainMap
{
  return self->_inputGainMap;
}

- (void)setInputGainMap:(id)a3
{
  objc_storeStrong(&self->_inputGainMap, a3);
}

- (MTLTexture)outputBlurMap
{
  return self->_outputBlurMap;
}

- (void)setOutputBlurMap:(id)a3
{
  objc_storeStrong((id *)&self->_outputBlurMap, a3);
}

- (MakeBlurMapIntermediates)intermediates
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
  objc_storeStrong((id *)&self->_outputBlurMap, 0);
  objc_storeStrong(&self->_inputGainMap, 0);
  objc_storeStrong(&self->_inputGlasses, 0);
  objc_storeStrong(&self->_inputHair, 0);
  objc_storeStrong(&self->_inputSegmentation, 0);
  objc_storeStrong(&self->_inputShiftMap, 0);
  objc_storeStrong(&self->_inputImageChroma, 0);
  objc_storeStrong(&self->_inputImageLuma, 0);
  objc_storeStrong(&self->_inputImage, 0);
  objc_storeStrong((id *)&self->_facePoints, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

@end
