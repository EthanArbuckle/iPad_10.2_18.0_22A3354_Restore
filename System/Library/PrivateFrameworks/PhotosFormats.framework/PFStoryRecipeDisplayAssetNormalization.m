@implementation PFStoryRecipeDisplayAssetNormalization

- (PFStoryRecipeDisplayAssetNormalization)init
{
  PFStoryRecipeDisplayAssetNormalization *v2;
  SEL v3;
  id v4;

  v2 = (PFStoryRecipeDisplayAssetNormalization *)_PFAssertFailHandler();
  return -[PFStoryRecipeDisplayAssetNormalization initWithAnalysisData:](v2, v3, v4);
}

- (PFStoryRecipeDisplayAssetNormalization)initWithAnalysisData:(id)a3
{
  id v4;
  void *v5;
  _BYTE *v6;
  int v7;
  PFStoryRecipeDisplayAssetNormalization *v8;
  _PFStoryRecipeDisplayAssetNormalizationDataV2 *v9;
  _PFStoryRecipeDisplayAssetNormalizationData *normalizationData;
  PFStoryRecipeDisplayAssetNormalization *v12;
  SEL v13;
  _NSZone *v14;
  objc_super v15;
  uint8_t buf[16];

  v4 = a3;
  if (!v4)
  {
    _PFAssertFailHandler();
LABEL_19:
    _PFAssertFailHandler();
    goto LABEL_20;
  }
  v5 = v4;
  if (!objc_msgSend(v4, "length"))
  {
LABEL_9:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A16EE000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "PFStoryRecipeDisplayAssetNormalization: Empty analysis data.", buf, 2u);
    }
    v8 = 0;
    goto LABEL_17;
  }
  if ((unint64_t)objc_msgSend(v5, "length") <= 2)
    goto LABEL_19;
  v15.receiver = self;
  v15.super_class = (Class)PFStoryRecipeDisplayAssetNormalization;
  self = -[PFStoryRecipeDisplayAssetNormalization init](&v15, sel_init);
  if (!self)
  {
LABEL_16:
    self = self;
    v8 = self;
LABEL_17:

    return v8;
  }
  v6 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
  v7 = *v6;
  if (v7 == 2)
  {
    v9 = -[_PFStoryRecipeDisplayAssetNormalizationDataV2 initWithSliderNetPackedDataV2:]([_PFStoryRecipeDisplayAssetNormalizationDataV2 alloc], "initWithSliderNetPackedDataV2:", v6);
LABEL_14:
    normalizationData = self->_normalizationData;
    self->_normalizationData = (_PFStoryRecipeDisplayAssetNormalizationData *)v9;

    goto LABEL_15;
  }
  if (v7 == 1)
  {
    v9 = -[_PFStoryRecipeDisplayAssetNormalizationDataV1 initWithSliderNetPackedDataV1:]([_PFStoryRecipeDisplayAssetNormalizationDataV1 alloc], "initWithSliderNetPackedDataV1:", v6);
    goto LABEL_14;
  }
  if (!*v6)
  {
    _PFAssertFailHandler();
    goto LABEL_9;
  }
LABEL_15:
  if (self->_normalizationData)
    goto LABEL_16;
LABEL_20:
  v12 = (PFStoryRecipeDisplayAssetNormalization *)_PFAssertFailHandler();
  return (PFStoryRecipeDisplayAssetNormalization *)-[PFStoryRecipeDisplayAssetNormalization copyWithZone:](v12, v13, v14);
}

- (unint64_t)hash
{
  return -[_PFStoryRecipeDisplayAssetNormalizationData hash](self->_normalizationData, "hash");
}

- (BOOL)isEqual:(id)a3
{
  PFStoryRecipeDisplayAssetNormalization *v4;
  _PFStoryRecipeDisplayAssetNormalizationData *normalizationData;
  char v6;

  v4 = (PFStoryRecipeDisplayAssetNormalization *)a3;
  if (self == v4)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  normalizationData = self->_normalizationData;
  if (normalizationData == v4->_normalizationData)
LABEL_5:
    v6 = 1;
  else
    v6 = -[_PFStoryRecipeDisplayAssetNormalizationData isEqual:](normalizationData, "isEqual:");
LABEL_7:

  return v6;
}

- (NSData)analysisData
{
  uint64_t v2;

  v2 = -[_PFStoryRecipeDisplayAssetNormalizationData sliderNetPackedData](self->_normalizationData, "sliderNetPackedData");
  return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v2, 12);
}

- (int64_t)version
{
  return -[_PFStoryRecipeDisplayAssetNormalizationData version](self->_normalizationData, "version");
}

- (double)score
{
  double result;

  -[_PFStoryRecipeDisplayAssetNormalizationData score](self->_normalizationData, "score");
  return result;
}

- (NSDictionary)tempTintProperties
{
  return (NSDictionary *)-[_PFStoryRecipeDisplayAssetNormalizationData tempTintProperties](self->_normalizationData, "tempTintProperties");
}

- (NSDictionary)smartToneProperties
{
  return (NSDictionary *)-[_PFStoryRecipeDisplayAssetNormalizationData smartToneProperties](self->_normalizationData, "smartToneProperties");
}

- (NSDictionary)highKeyProperties
{
  return (NSDictionary *)-[_PFStoryRecipeDisplayAssetNormalizationData highKeyProperties](self->_normalizationData, "highKeyProperties");
}

- (NSDictionary)smartColorProperties
{
  return (NSDictionary *)-[_PFStoryRecipeDisplayAssetNormalizationData smartColorProperties](self->_normalizationData, "smartColorProperties");
}

- (NSString)detailedDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  float v9;
  double v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  float v15;
  double v16;
  void *v17;
  float v18;
  double v19;
  void *v20;
  float v21;
  double v22;
  void *v23;
  float v24;
  double v25;
  void *v26;
  float v27;
  double v28;
  void *v29;
  float v30;
  void *v31;
  void *v33;
  int64_t v34;
  void *v35;
  void *v36;
  void *v37;

  -[PFStoryRecipeDisplayAssetNormalization tempTintProperties](self, "tempTintProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryRecipeDisplayAssetNormalization smartToneProperties](self, "smartToneProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryRecipeDisplayAssetNormalization highKeyProperties](self, "highKeyProperties");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFStoryRecipeDisplayAssetNormalization smartColorProperties](self, "smartColorProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3940];
  v34 = -[PFStoryRecipeDisplayAssetNormalization version](self, "version");
  v37 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inputTemperature"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "floatValue");
  v8 = v7;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("inputTint"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "floatValue");
  v10 = v9;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputExposure"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputBlack"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputHighlights"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = v18;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("inputContrast"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "floatValue");
  v22 = v21;
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("inputStrength"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "floatValue");
  v25 = v24;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("inputVibrancy"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "floatValue");
  v28 = v27;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("inputCast"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "floatValue");
  objc_msgSend(v6, "stringWithFormat:", CFSTR("V%d WB{%0.0fT %0.1ft} ST{%0.2fx %0.2fb %0.2fh %0.2fc} HK{%0.2f} SC{%0.2fvi %0.2fca}"), v34, *(_QWORD *)&v8, *(_QWORD *)&v10, *(_QWORD *)&v13, *(_QWORD *)&v16, *(_QWORD *)&v19, *(_QWORD *)&v22, *(_QWORD *)&v25, *(_QWORD *)&v28, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v31;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_normalizationData, 0);
}

@end
