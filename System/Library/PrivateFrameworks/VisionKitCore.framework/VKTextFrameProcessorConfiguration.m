@implementation VKTextFrameProcessorConfiguration

- (VKTextFrameProcessorConfiguration)init
{
  VKTextFrameProcessorConfiguration *v2;
  VKTextFrameProcessorConfiguration *v3;
  NSArray *recognitionLanguages;
  NSArray *v10;
  NSArray *customWords;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)VKTextFrameProcessorConfiguration;
  v2 = -[VKTextFrameProcessorConfiguration init](&v13, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isForSingleItem = 257;
    __asm { FMOV            V0.2D, #0.5 }
    v2->_comparisonPoint = _Q0;
    v2->_usesLanguageDetection = 1;
    recognitionLanguages = v2->_recognitionLanguages;
    v10 = (NSArray *)MEMORY[0x1E0C9AA60];
    v2->_documentBlockType = 2;
    v2->_recognitionLanguages = v10;

    customWords = v3->_customWords;
    v3->_customWords = v10;

  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VKTextFrameProcessorConfiguration *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(VKTextFrameProcessorConfiguration);
  -[VKTextFrameProcessorConfiguration setIsForSingleItem:](v4, "setIsForSingleItem:", -[VKTextFrameProcessorConfiguration isForSingleItem](self, "isForSingleItem"));
  -[VKTextFrameProcessorConfiguration setDataType:](v4, "setDataType:", -[VKTextFrameProcessorConfiguration dataType](self, "dataType"));
  -[VKTextFrameProcessorConfiguration comparisonPoint](self, "comparisonPoint");
  -[VKTextFrameProcessorConfiguration setComparisonPoint:](v4, "setComparisonPoint:");
  -[VKTextFrameProcessorConfiguration setUsesAlternateLineGrouping:](v4, "setUsesAlternateLineGrouping:", -[VKTextFrameProcessorConfiguration usesAlternateLineGrouping](self, "usesAlternateLineGrouping"));
  -[VKTextFrameProcessorConfiguration setUsesLanguageDetection:](v4, "setUsesLanguageDetection:", -[VKTextFrameProcessorConfiguration usesLanguageDetection](self, "usesLanguageDetection"));
  -[VKTextFrameProcessorConfiguration setDocumentBlockType:](v4, "setDocumentBlockType:", -[VKTextFrameProcessorConfiguration documentBlockType](self, "documentBlockType"));
  -[VKTextFrameProcessorConfiguration recognitionLanguages](self, "recognitionLanguages");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKTextFrameProcessorConfiguration setRecognitionLanguages:](v4, "setRecognitionLanguages:", v5);

  -[VKTextFrameProcessorConfiguration customWords](self, "customWords");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKTextFrameProcessorConfiguration setCustomWords:](v4, "setCustomWords:", v6);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  VKTextFrameProcessorConfiguration *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = (VKTextFrameProcessorConfiguration *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_opt_class();
      VKDynamicCast(v5, (uint64_t)v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[VKTextFrameProcessorConfiguration isEqualToTextFrameProcessorConfiguration:](self, "isEqualToTextFrameProcessorConfiguration:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)isEqualToTextFrameProcessorConfiguration:(id)a3
{
  id v4;
  int v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;

  v4 = a3;
  v5 = objc_msgSend(v4, "isForSingleItem");
  if (v5 != -[VKTextFrameProcessorConfiguration isForSingleItem](self, "isForSingleItem"))
    goto LABEL_9;
  v6 = objc_msgSend(v4, "dataType");
  if (v6 != -[VKTextFrameProcessorConfiguration dataType](self, "dataType"))
    goto LABEL_9;
  objc_msgSend(v4, "comparisonPoint");
  v8 = v7;
  v10 = v9;
  -[VKTextFrameProcessorConfiguration comparisonPoint](self, "comparisonPoint");
  if (!VKMNearlyEqualPointsWithThreshold(v8, v10, v11, v12, 0.00001))
    goto LABEL_9;
  v13 = objc_msgSend(v4, "usesAlternateLineGrouping");
  if (v13 != -[VKTextFrameProcessorConfiguration usesAlternateLineGrouping](self, "usesAlternateLineGrouping"))
    goto LABEL_9;
  v14 = objc_msgSend(v4, "usesLanguageDetection");
  if (v14 != -[VKTextFrameProcessorConfiguration usesLanguageDetection](self, "usesLanguageDetection"))
    goto LABEL_9;
  v15 = objc_msgSend(v4, "documentBlockType");
  if (v15 != -[VKTextFrameProcessorConfiguration documentBlockType](self, "documentBlockType"))
    goto LABEL_9;
  objc_msgSend(v4, "recognitionLanguages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKTextFrameProcessorConfiguration recognitionLanguages](self, "recognitionLanguages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "isEqualToArray:", v17);

  if (v18)
  {
    objc_msgSend(v4, "customWords");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKTextFrameProcessorConfiguration customWords](self, "customWords");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqualToArray:", v20);

  }
  else
  {
LABEL_9:
    v21 = 0;
  }

  return v21;
}

- (BOOL)shouldPerformTextDetectionGating
{
  _BOOL4 v3;

  v3 = -[VKTextFrameProcessorConfiguration isForSingleItem](self, "isForSingleItem");
  if (v3)
    LOBYTE(v3) = -[VKTextFrameProcessorConfiguration dataType](self, "dataType") == 0;
  return v3;
}

- (BOOL)isForSingleItem
{
  return self->_isForSingleItem;
}

- (void)setIsForSingleItem:(BOOL)a3
{
  self->_isForSingleItem = a3;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (void)setDataType:(unint64_t)a3
{
  self->_dataType = a3;
}

- (unint64_t)documentBlockType
{
  return self->_documentBlockType;
}

- (void)setDocumentBlockType:(unint64_t)a3
{
  self->_documentBlockType = a3;
}

- (CGPoint)comparisonPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_comparisonPoint.x;
  y = self->_comparisonPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setComparisonPoint:(CGPoint)a3
{
  self->_comparisonPoint = a3;
}

- (BOOL)usesAlternateLineGrouping
{
  return self->_usesAlternateLineGrouping;
}

- (void)setUsesAlternateLineGrouping:(BOOL)a3
{
  self->_usesAlternateLineGrouping = a3;
}

- (NSArray)recognitionLanguages
{
  return self->_recognitionLanguages;
}

- (void)setRecognitionLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)customWords
{
  return self->_customWords;
}

- (void)setCustomWords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)usesLanguageDetection
{
  return self->_usesLanguageDetection;
}

- (void)setUsesLanguageDetection:(BOOL)a3
{
  self->_usesLanguageDetection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customWords, 0);
  objc_storeStrong((id *)&self->_recognitionLanguages, 0);
}

@end
