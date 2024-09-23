@implementation CRNeuralRecognizerConfiguration

- (CRNeuralRecognizerConfiguration)initWithLocale:(id)a3 imageReaderOptions:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  CRNeuralRecognizerConfiguration *v11;
  CRNeuralRecognizerConfiguration *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  uint64_t v19;
  NSArray *customWords;
  void *v21;
  void *v22;
  float v23;
  void *v24;
  uint64_t v25;
  NSURL *customModelURL;
  CRTitleParameters *v27;
  double v28;
  uint64_t v29;
  CRTitleParameters *titleParameters;
  CRTitleParameters *v31;
  double v32;
  uint64_t v33;
  CRTitleParameters *v34;
  objc_super v36;

  v9 = a3;
  v10 = a4;
  v36.receiver = self;
  v36.super_class = (Class)CRNeuralRecognizerConfiguration;
  v11 = -[CRRecognizerConfiguration initWithImageReaderOptions:error:](&v36, sel_initWithImageReaderOptions_error_, v10, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_locale, a3);
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CRImageReaderDisableLanguageCorrection"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "BOOLValue");

    if (v14)
      v12->_decodeWithLM = 0;
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CRImageReaderDynamicLexicon"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CRImageReaderDynamicLexicon"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CRImageReaderDynamicLexicon"));
        v19 = objc_claimAutoreleasedReturnValue();
        customWords = v12->_customWords;
        v12->_customWords = (NSArray *)v19;

      }
    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CRImageReaderPrecisionThresholdKey"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CRImageReaderPrecisionThresholdKey"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "floatValue");
      v12->_precisionThreshold = v23;

    }
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CRImageReaderRecognizerModelPath"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v24);
      v25 = objc_claimAutoreleasedReturnValue();
      customModelURL = v12->_customModelURL;
      v12->_customModelURL = (NSURL *)v25;

    }
    v27 = [CRTitleParameters alloc];
    LODWORD(v28) = 1064514355;
    v29 = -[CRTitleParameters initWithMinTitleProbability:minTitleLength:](v27, "initWithMinTitleProbability:minTitleLength:", 7, v28);
    titleParameters = v12->_titleParameters;
    v12->_titleParameters = (CRTitleParameters *)v29;

    if (+[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v12->_locale))
    {
      v31 = [CRTitleParameters alloc];
      LODWORD(v32) = 1060320051;
      v33 = -[CRTitleParameters initWithMinTitleProbability:minTitleLength:](v31, "initWithMinTitleProbability:minTitleLength:", 2, v32);
      v34 = v12->_titleParameters;
      v12->_titleParameters = (CRTitleParameters *)v33;

    }
    -[CRNeuralRecognizerConfiguration setDefaultConfidenceThresholdsForRevision:](v12, "setDefaultConfidenceThresholdsForRevision:", -[CRRecognizerConfiguration revision](v12, "revision"));

  }
  return v12;
}

- (BOOL)usesAppleNeuralEngine
{
  if (-[CRRecognizerConfiguration computeDeviceType](self, "computeDeviceType") == 1
    || -[CRRecognizerConfiguration computeDeviceType](self, "computeDeviceType") == 2)
  {
    return 0;
  }
  else
  {
    return deviceHasAppleNeuralEngine();
  }
}

- (id)initV2DefaultConfigWithOptions:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRNeuralRecognizerConfiguration;
  v3 = -[CRRecognizerConfiguration initV2DefaultConfigWithOptions:](&v9, sel_initV2DefaultConfigWithOptions_, a3);
  v4 = v3;
  if (v3)
  {
    v3[13] = 4;
    v3[14] = 16;
    v5 = (void *)v3[15];
    v3[15] = &unk_1E993F7B8;

    v4[16] = 0x4040000000000000;
    v4[17] = 0;
    *((_BYTE *)v4 + 80) = 1;
    v6 = (void *)v4[18];
    v4[18] = 0;

    *((_DWORD *)v4 + 21) = 0;
    v7 = (void *)v4[12];
    v4[12] = 0;

  }
  return v4;
}

- (id)initV3DefaultConfigWithOptions:(id)a3
{
  _QWORD *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRNeuralRecognizerConfiguration;
  v3 = -[CRRecognizerConfiguration initV3DefaultConfigWithOptions:](&v9, sel_initV3DefaultConfigWithOptions_, a3);
  v4 = v3;
  if (v3)
  {
    v3[13] = 4;
    v3[14] = 16;
    v5 = (void *)v3[15];
    v3[15] = &unk_1E993F7D0;

    v4[16] = 0x4040000000000000;
    v4[17] = 2;
    *((_BYTE *)v4 + 80) = 1;
    v6 = (void *)v4[18];
    v4[18] = 0;

    *((_DWORD *)v4 + 21) = 0;
    v7 = (void *)v4[12];
    v4[12] = 0;

  }
  return v4;
}

- (BOOL)filterWithLM
{
  _BOOL4 v3;

  v3 = -[CRNeuralRecognizerConfiguration decodeWithLM](self, "decodeWithLM");
  if (v3)
    LOBYTE(v3) = !-[CRRecognizerConfiguration falsePositiveFilteringDisabled](self, "falsePositiveFilteringDisabled");
  return v3;
}

- (CRConfidenceThresholds)confidenceThresholds
{
  CRConfidenceThresholds *v3;
  int v4;
  int v5;
  int v6;
  double v7;
  double v8;

  v3 = [CRConfidenceThresholds alloc];
  -[CRNeuralRecognizerConfiguration mediumConfidenceThreshold](self, "mediumConfidenceThreshold");
  v5 = v4;
  -[CRNeuralRecognizerConfiguration highConfidenceThreshold](self, "highConfidenceThreshold");
  LODWORD(v7) = v6;
  LODWORD(v8) = v5;
  return -[CRConfidenceThresholds initWithMediumThreshold:highThreshold:](v3, "initWithMediumThreshold:highThreshold:", v8, v7);
}

- (int64_t)bestFitWidthIndexForAspectRatio:(double)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  float v13;
  float v14;
  int64_t v15;
  NSObject *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  double v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[CRNeuralRecognizerConfiguration inputWidths](self, "inputWidths");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
      -[CRNeuralRecognizerConfiguration inputHeight](self, "inputHeight", (_QWORD)v18);
      v12 = v11;
      objc_msgSend(v10, "floatValue");
      v14 = v12 / v13;
      if (v14 * 1.1 < a3)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v15 = objc_msgSend(v5, "indexOfObject:", v10);

    if (v15 != -1)
      goto LABEL_14;
  }
  else
  {
LABEL_9:

  }
  CROSLogForCategory(3);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    v23 = a3;
    _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_DEBUG, "Could not determine an appropriate width index for aspect ratio %.4f", buf, 0xCu);
  }

  v15 = objc_msgSend(v5, "count") - 1;
LABEL_14:

  return v15;
}

- (id)textFeatureFilter
{
  void *v3;
  void *v4;
  CRTextFeaturesFilterV2 *v5;
  CRTextFeaturesFilterV2 *v6;

  -[CRRecognizerConfiguration cachedTextFeatureFilter](self, "cachedTextFeatureFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (-[CRRecognizerConfiguration revision](self, "revision") > 2)
    {
      v5 = [CRTextFeaturesFilterV2 alloc];
      -[CRNeuralRecognizerConfiguration locale](self, "locale");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[CRTextFeaturesFilterV2 initWithLocale:](v5, "initWithLocale:", v4);
      -[CRRecognizerConfiguration setCachedTextFeatureFilter:](self, "setCachedTextFeatureFilter:", v6);

    }
    else
    {
      v4 = (void *)objc_opt_new();
      -[CRRecognizerConfiguration setCachedTextFeatureFilter:](self, "setCachedTextFeatureFilter:", v4);
    }

  }
  return -[CRRecognizerConfiguration cachedTextFeatureFilter](self, "cachedTextFeatureFilter");
}

- (void)setDefaultConfidenceThresholdsForRevision:(unint64_t)a3
{
  float v3;
  float v4;

  v3 = 0.0;
  v4 = 0.0;
  if (a3 - 1 <= 2)
  {
    v3 = flt_1D513ADA0[!self->_decodeWithLM];
    v4 = flt_1D513ADA8[!self->_decodeWithLM];
  }
  self->_mediumConfidenceThreshold = v3;
  self->_highConfidenceThreshold = v4;
}

- (NSURL)customModelURL
{
  return (NSURL *)objc_getProperty(self, a2, 96, 1);
}

- (int64_t)batchSize
{
  return self->_batchSize;
}

- (int64_t)maxConcurrentBatches
{
  return self->_maxConcurrentBatches;
}

- (NSArray)inputWidths
{
  return (NSArray *)objc_getProperty(self, a2, 120, 1);
}

- (double)inputHeight
{
  return self->_inputHeight;
}

- (unint64_t)paddingMode
{
  return self->_paddingMode;
}

- (BOOL)decodeWithLM
{
  return self->_decodeWithLM;
}

- (NSArray)customWords
{
  return (NSArray *)objc_getProperty(self, a2, 144, 1);
}

- (float)precisionThreshold
{
  return self->_precisionThreshold;
}

- (NSString)locale
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (CRTitleParameters)titleParameters
{
  return (CRTitleParameters *)objc_getProperty(self, a2, 160, 1);
}

- (float)mediumConfidenceThreshold
{
  return self->_mediumConfidenceThreshold;
}

- (void)setMediumConfidenceThreshold:(float)a3
{
  self->_mediumConfidenceThreshold = a3;
}

- (float)highConfidenceThreshold
{
  return self->_highConfidenceThreshold;
}

- (void)setHighConfidenceThreshold:(float)a3
{
  self->_highConfidenceThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleParameters, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_customWords, 0);
  objc_storeStrong((id *)&self->_inputWidths, 0);
  objc_storeStrong((id *)&self->_customModelURL, 0);
}

@end
