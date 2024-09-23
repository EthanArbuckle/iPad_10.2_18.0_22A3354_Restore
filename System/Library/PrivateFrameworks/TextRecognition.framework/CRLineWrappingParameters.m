@implementation CRLineWrappingParameters

+ (int64_t)_correctionModeFromString:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    CROSLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v11) = 0;
      v8 = v6;
      v9 = 2;
LABEL_6:
      _os_log_impl(&dword_1D4FB8000, v8, OS_LOG_TYPE_FAULT, v7, (uint8_t *)&v11, v9);
    }
LABEL_7:

LABEL_8:
    v5 = 0;
    goto LABEL_11;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("always")) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("unless-strong-wrap")) & 1) != 0)
    {
      v5 = 1;
      goto LABEL_11;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("disabled")) & 1) != 0)
      goto LABEL_8;
    CROSLogForCategory(0);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      v11 = 138412290;
      v12 = v4;
      v8 = v6;
      v9 = 12;
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  v5 = 2;
LABEL_11:

  return v5;
}

- (id)description
{
  void *v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  float v16;

  v3 = (void *)objc_opt_new();
  -[CRLineWrappingParameters heightSimilarityRatio](self, "heightSimilarityRatio");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %f\n"), CFSTR("heightSimilarityRatio"), v4);
  -[CRLineWrappingParameters newParagraphIndentDistanceRatioTolerance](self, "newParagraphIndentDistanceRatioTolerance");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %f\n"), CFSTR("newParagraphIndentDistanceRatioTolerance"), v5);
  -[CRLineWrappingParameters oversegmentedDistanceHeightRatioTolerance](self, "oversegmentedDistanceHeightRatioTolerance");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %f\n"), CFSTR("oversegmentedDistanceHeightRatioTolerance"), v6);
  -[CRLineWrappingParameters smallestVerticalDistanceHeightRatio](self, "smallestVerticalDistanceHeightRatio");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %f\n"), CFSTR("smallestVerticalDistanceHeightRatio"), v7);
  -[CRLineWrappingParameters maximumVerticalDistanceGrowthRatio](self, "maximumVerticalDistanceGrowthRatio");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %f\n"), CFSTR("maximumVerticalDistanceGrowthRatio"), v8);
  -[CRLineWrappingParameters angleSimilarityThreshold](self, "angleSimilarityThreshold");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %f\n"), CFSTR("angleSimilarityThreshold"), v9);
  -[CRLineWrappingParameters widthGrowthLimit](self, "widthGrowthLimit");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %f\n"), CFSTR("widthGrowthLimit"), v10);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %lu\n"), CFSTR("tokenCountIncreaseLimit"), -[CRLineWrappingParameters tokenCountIncreaseLimit](self, "tokenCountIncreaseLimit"));
  -[CRLineWrappingParameters oversegmentedDistanceHeightRatioListItemTolerance](self, "oversegmentedDistanceHeightRatioListItemTolerance");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %f\n"), CFSTR("oversegmentedDistanceHeightRatioListItemTolerance"), v11);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %lu\n"), CFSTR("overWrappingCorrection"), -[CRLineWrappingParameters correctionMode](self, "correctionMode"));
  -[CRLineWrappingParameters confidenceThreshold](self, "confidenceThreshold");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %f\n"), CFSTR("confidenceThreshold"), v12);
  -[CRLineWrappingParameters contextConfidenceThreshold](self, "contextConfidenceThreshold");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %f\n"), CFSTR("contextConfidenceThreshold"), v13);
  -[CRLineWrappingParameters lmScoreThreshold](self, "lmScoreThreshold");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %f\n"), CFSTR("lmScoreThreshold"), v14);
  -[CRLineWrappingParameters lmScoreEOSMinRatio](self, "lmScoreEOSMinRatio");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %f\n"), CFSTR("lmScoreEOSMinRatio"), v15);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %d\n"), CFSTR("lmContextSize"), -[CRLineWrappingParameters lmContextSize](self, "lmContextSize"));
  -[CRLineWrappingParameters probabilityThreshold](self, "probabilityThreshold");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %f\n"), CFSTR("probabilityThreshold"), v16);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %ld\n"), CFSTR("wrappingEvaluationThreshold"), -[CRLineWrappingParameters wrappingEvaluationThreshold](self, "wrappingEvaluationThreshold"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %ld\n"), CFSTR("noWrappingEvaluationThreshold"), -[CRLineWrappingParameters noWrappingEvaluationThreshold](self, "noWrappingEvaluationThreshold"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %ld\n"), CFSTR("caseWrappingScoreWithNoCapitalization"), -[CRLineWrappingParameters caseWrappingScoreWithNoCapitalization](self, "caseWrappingScoreWithNoCapitalization"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %ld\n"), CFSTR("punctuationWrappingScoreWithEndingMOS"), -[CRLineWrappingParameters punctuationWrappingScoreWithEndingMOS](self, "punctuationWrappingScoreWithEndingMOS"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: %ld\n"), CFSTR("punctuationWrappingScoreWithNoClosingPunctuation"), -[CRLineWrappingParameters punctuationWrappingScoreWithNoClosingPunctuation](self, "punctuationWrappingScoreWithNoClosingPunctuation"));
  return v3;
}

- (CRLineWrappingParameters)initWithLocale:(id)a3
{
  return -[CRLineWrappingParameters initWithLocale:useStrictConfig:](self, "initWithLocale:useStrictConfig:", a3, 0);
}

- (CRLineWrappingParameters)initWithLocale:(id)a3 useStrictConfig:(BOOL)a4
{
  _BOOL4 v4;
  __CFString *v6;
  CRLineWrappingParameters *v7;
  __CFString *v8;
  NSObject *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  float v29;
  void *v30;
  float v31;
  void *v32;
  float v33;
  void *v34;
  void *v35;
  float v36;
  NSObject *v37;
  CRLineWrappingParameters *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v50;
  uint8_t buf[4];
  __CFString *v52;
  __int16 v53;
  __CFString *v54;
  uint64_t v55;

  v4 = a4;
  v55 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  v50.receiver = self;
  v50.super_class = (Class)CRLineWrappingParameters;
  v7 = -[CRLineWrappingParameters init](&v50, sel_init);
  if (!v7)
  {
LABEL_26:
    v38 = v7;
    goto LABEL_27;
  }
  +[CRLineWrappingClassifier modelLocaleForLocale:](CRLineWrappingClassifier, "modelLocaleForLocale:", v6);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    CROSLogForCategory(0);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v6;
      _os_log_impl(&dword_1D4FB8000, v9, OS_LOG_TYPE_FAULT, "Failed to get model locale for %@", buf, 0xCu);
    }

    v8 = CFSTR("en-US");
  }
  v10 = CFSTR("evaluation");
  if (v4)
    v10 = CFSTR("evaluation-strict");
  v11 = v10;
  lineWrappingConfig();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("heightSimilarityRatio"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    -[CRLineWrappingParameters setHeightSimilarityRatio:](v7, "setHeightSimilarityRatio:");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("newParagraphIndentDistanceRatioTolerance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatValue");
    -[CRLineWrappingParameters setNewParagraphIndentDistanceRatioTolerance:](v7, "setNewParagraphIndentDistanceRatioTolerance:");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("oversegmentedDistanceHeightRatioTolerance"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "floatValue");
    -[CRLineWrappingParameters setOversegmentedDistanceHeightRatioTolerance:](v7, "setOversegmentedDistanceHeightRatioTolerance:");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("smallestVerticalDistanceHeightRatio"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "floatValue");
    -[CRLineWrappingParameters setSmallestVerticalDistanceHeightRatio:](v7, "setSmallestVerticalDistanceHeightRatio:");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("maximumVerticalDistanceGrowthRatio"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "floatValue");
    -[CRLineWrappingParameters setMaximumVerticalDistanceGrowthRatio:](v7, "setMaximumVerticalDistanceGrowthRatio:");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("angleSimilarityThreshold"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatValue");
    -[CRLineWrappingParameters setAngleSimilarityThreshold:](v7, "setAngleSimilarityThreshold:");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("widthGrowthLimit"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "floatValue");
    -[CRLineWrappingParameters setWidthGrowthLimit:](v7, "setWidthGrowthLimit:");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("tokenCountIncreaseLimit"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRLineWrappingParameters setTokenCountIncreaseLimit:](v7, "setTokenCountIncreaseLimit:", objc_msgSend(v22, "unsignedIntegerValue"));

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("oversegmentedDistanceHeightRatioListItemTolerance"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "floatValue");
    -[CRLineWrappingParameters setOversegmentedDistanceHeightRatioListItemTolerance:](v7, "setOversegmentedDistanceHeightRatioListItemTolerance:");

    v24 = (void *)objc_opt_class();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("overWrappingCorrection"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRLineWrappingParameters setCorrectionMode:](v7, "setCorrectionMode:", objc_msgSend(v24, "_correctionModeFromString:", v25));

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("confidenceThreshold"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "floatValue");
    -[CRLineWrappingParameters setConfidenceThreshold:](v7, "setConfidenceThreshold:");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("contextConfidenceThreshold"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "floatValue");
    -[CRLineWrappingParameters setContextConfidenceThreshold:](v7, "setContextConfidenceThreshold:");

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("lmScoreThreshold"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "floatValue");
    -[CRLineWrappingParameters setLmScoreThreshold:](v7, "setLmScoreThreshold:", v29);

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("lmScoreEOSMinRatio"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "floatValue");
    -[CRLineWrappingParameters setLmScoreEOSMinRatio:](v7, "setLmScoreEOSMinRatio:", v31);

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("lmContextSize"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "floatValue");
    -[CRLineWrappingParameters setLmContextSize:](v7, "setLmContextSize:", (int)v33);

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("probabilityThreshold"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("probabilityThreshold"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "floatValue");
      v7->_probabilityThreshold = v36;

    }
    else
    {
      v7->_probabilityThreshold = 0.5;
    }

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("wrappingEvaluationThreshold"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (!v39)
      v39 = &unk_1E9926AA8;
    -[CRLineWrappingParameters setWrappingEvaluationThreshold:](v7, "setWrappingEvaluationThreshold:", objc_msgSend(v39, "integerValue"));

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("noWrappingEvaluationThreshold"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if (!v41)
      v41 = &unk_1E9926AC0;
    -[CRLineWrappingParameters setNoWrappingEvaluationThreshold:](v7, "setNoWrappingEvaluationThreshold:", objc_msgSend(v41, "integerValue"));

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("caseWrappingScoreWithNoCapitalization"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v43;
    if (!v43)
      v43 = &unk_1E9926AD8;
    -[CRLineWrappingParameters setCaseWrappingScoreWithNoCapitalization:](v7, "setCaseWrappingScoreWithNoCapitalization:", objc_msgSend(v43, "integerValue"));

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("punctuationWrappingScoreWithEndingMOS"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v45;
    if (!v45)
      v45 = &unk_1E9926AD8;
    -[CRLineWrappingParameters setPunctuationWrappingScoreWithEndingMOS:](v7, "setPunctuationWrappingScoreWithEndingMOS:", objc_msgSend(v45, "integerValue"));

    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("punctuationWrappingScoreWithNoClosingPunctuation"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v47;
    if (!v47)
      v47 = &unk_1E9926AD8;
    -[CRLineWrappingParameters setPunctuationWrappingScoreWithNoClosingPunctuation:](v7, "setPunctuationWrappingScoreWithNoClosingPunctuation:", objc_msgSend(v47, "integerValue"));

    goto LABEL_26;
  }
  CROSLogForCategory(0);
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412546;
    v52 = v8;
    v53 = 2112;
    v54 = v11;
    _os_log_impl(&dword_1D4FB8000, v37, OS_LOG_TYPE_FAULT, "Failed to load line wrapping config for locale %@ and category %@", buf, 0x16u);
  }

  v38 = 0;
LABEL_27:

  return v38;
}

- (float)probabilityThreshold
{
  return self->_probabilityThreshold;
}

- (float)heightSimilarityRatio
{
  return self->_heightSimilarityRatio;
}

- (void)setHeightSimilarityRatio:(float)a3
{
  self->_heightSimilarityRatio = a3;
}

- (float)angleSimilarityThreshold
{
  return self->_angleSimilarityThreshold;
}

- (void)setAngleSimilarityThreshold:(float)a3
{
  self->_angleSimilarityThreshold = a3;
}

- (int)lmContextSize
{
  return self->_lmContextSize;
}

- (void)setLmContextSize:(int)a3
{
  self->_lmContextSize = a3;
}

- (float)oversegmentedDistanceHeightRatioTolerance
{
  return self->_oversegmentedDistanceHeightRatioTolerance;
}

- (void)setOversegmentedDistanceHeightRatioTolerance:(float)a3
{
  self->_oversegmentedDistanceHeightRatioTolerance = a3;
}

- (float)oversegmentedDistanceHeightRatioListItemTolerance
{
  return self->_oversegmentedDistanceHeightRatioListItemTolerance;
}

- (void)setOversegmentedDistanceHeightRatioListItemTolerance:(float)a3
{
  self->_oversegmentedDistanceHeightRatioListItemTolerance = a3;
}

- (float)newParagraphIndentDistanceRatioTolerance
{
  return self->_newParagraphIndentDistanceRatioTolerance;
}

- (void)setNewParagraphIndentDistanceRatioTolerance:(float)a3
{
  self->_newParagraphIndentDistanceRatioTolerance = a3;
}

- (float)widthGrowthLimit
{
  return self->_widthGrowthLimit;
}

- (void)setWidthGrowthLimit:(float)a3
{
  self->_widthGrowthLimit = a3;
}

- (int64_t)wrappingEvaluationThreshold
{
  return self->_wrappingEvaluationThreshold;
}

- (void)setWrappingEvaluationThreshold:(int64_t)a3
{
  self->_wrappingEvaluationThreshold = a3;
}

- (int64_t)noWrappingEvaluationThreshold
{
  return self->_noWrappingEvaluationThreshold;
}

- (void)setNoWrappingEvaluationThreshold:(int64_t)a3
{
  self->_noWrappingEvaluationThreshold = a3;
}

- (int64_t)caseWrappingScoreWithNoCapitalization
{
  return self->_caseWrappingScoreWithNoCapitalization;
}

- (void)setCaseWrappingScoreWithNoCapitalization:(int64_t)a3
{
  self->_caseWrappingScoreWithNoCapitalization = a3;
}

- (int64_t)punctuationWrappingScoreWithEndingMOS
{
  return self->_punctuationWrappingScoreWithEndingMOS;
}

- (void)setPunctuationWrappingScoreWithEndingMOS:(int64_t)a3
{
  self->_punctuationWrappingScoreWithEndingMOS = a3;
}

- (int64_t)punctuationWrappingScoreWithNoClosingPunctuation
{
  return self->_punctuationWrappingScoreWithNoClosingPunctuation;
}

- (void)setPunctuationWrappingScoreWithNoClosingPunctuation:(int64_t)a3
{
  self->_punctuationWrappingScoreWithNoClosingPunctuation = a3;
}

- (float)smallestVerticalDistanceHeightRatio
{
  return self->_smallestVerticalDistanceHeightRatio;
}

- (void)setSmallestVerticalDistanceHeightRatio:(float)a3
{
  self->_smallestVerticalDistanceHeightRatio = a3;
}

- (float)maximumVerticalDistanceGrowthRatio
{
  return self->_maximumVerticalDistanceGrowthRatio;
}

- (void)setMaximumVerticalDistanceGrowthRatio:(float)a3
{
  self->_maximumVerticalDistanceGrowthRatio = a3;
}

- (int64_t)correctionMode
{
  return self->_correctionMode;
}

- (void)setCorrectionMode:(int64_t)a3
{
  self->_correctionMode = a3;
}

- (float)confidenceThreshold
{
  return self->_confidenceThreshold;
}

- (void)setConfidenceThreshold:(float)a3
{
  self->_confidenceThreshold = a3;
}

- (float)contextConfidenceThreshold
{
  return self->_contextConfidenceThreshold;
}

- (void)setContextConfidenceThreshold:(float)a3
{
  self->_contextConfidenceThreshold = a3;
}

- (double)lmScoreThreshold
{
  return self->_lmScoreThreshold;
}

- (void)setLmScoreThreshold:(double)a3
{
  self->_lmScoreThreshold = a3;
}

- (double)lmScoreEOSMinRatio
{
  return self->_lmScoreEOSMinRatio;
}

- (void)setLmScoreEOSMinRatio:(double)a3
{
  self->_lmScoreEOSMinRatio = a3;
}

- (unint64_t)tokenCountIncreaseLimit
{
  return self->_tokenCountIncreaseLimit;
}

- (void)setTokenCountIncreaseLimit:(unint64_t)a3
{
  self->_tokenCountIncreaseLimit = a3;
}

@end
