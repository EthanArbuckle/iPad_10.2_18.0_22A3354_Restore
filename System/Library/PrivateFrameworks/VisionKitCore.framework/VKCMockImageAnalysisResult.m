@implementation VKCMockImageAnalysisResult

+ (id)mockImageAnalysisResultFromDictionary:(id)a3
{
  id v3;
  VKCMockImageAnalysisResult *v4;
  void *v5;
  VKCMockTextProvider *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = objc_alloc_init(VKCMockImageAnalysisResult);
  objc_msgSend(v3, "objectForKeyedSubscript:", VKCMockResultRecognitionResultKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCMockImageAnalysisResult setSourceDict:](v4, "setSourceDict:", v5);
  -[VKCMockImageAnalysisResult generateText](v4, "generateText");
  v6 = -[VKCMockTextProvider initWithDictionary:]([VKCMockTextProvider alloc], "initWithDictionary:", v5);
  -[VKCMockImageAnalysisResult setTextProvider:](v4, "setTextProvider:", v6);

  objc_msgSend(v5, "objectForKeyedSubscript:", VKCMockResultDataDetectorsKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCMockImageAnalysisResult addMockDataDetectorElementsFromArray:](v4, "addMockDataDetectorElementsFromArray:", v7);

  objc_msgSend(v5, "objectForKeyedSubscript:", VKCMockResultImageSizeKey);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCMockHelper sizeFromPlistDictionary:](VKCMockHelper, "sizeFromPlistDictionary:", v8);
  -[VKCMockImageAnalysisResult setImageSize:](v4, "setImageSize:");

  return v4;
}

- (void)setIsRunningTest:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  self->_isRunningTest = a3;
  -[VKCMockImageAnalysisResult textProvider](self, "textProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsRunningTest:", v3);

}

- (void)addMockDataDetectorElementsFromArray:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  NSArray *v7;
  NSArray *dataDetectors;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__VKCMockImageAnalysisResult_addMockDataDetectorElementsFromArray___block_invoke;
  v10[3] = &unk_1E9464490;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  v7 = (NSArray *)objc_msgSend(v9, "copy");
  dataDetectors = self->_dataDetectors;
  self->_dataDetectors = v7;

}

void __67__VKCMockImageAnalysisResult_addMockDataDetectorElementsFromArray___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  VKCMockDataDetectorElement *v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = -[VKCMockDataDetectorElement initWithDictionary:]([VKCMockDataDetectorElement alloc], "initWithDictionary:", v3);

  objc_msgSend(v2, "vk_addNonNilObject:", v4);
}

- (void)generateText
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  -[VKCMockImageAnalysisResult sourceDict](self, "sourceDict");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", VKCMockResultLinesKey);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__VKCMockImageAnalysisResult_generateText__block_invoke;
  v8[3] = &unk_1E94644B8;
  v8[4] = self;
  v9 = v3;
  v10 = v5;
  v6 = v5;
  v7 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);
  -[VKCMockImageAnalysisResult setText:](self, "setText:", v7);

}

void __42__VKCMockImageAnalysisResult_generateText__block_invoke(id *a1, uint64_t a2, unint64_t a3)
{
  id v5;

  objc_msgSend(a1[4], "stringForLine:", a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "appendString:");
  if (objc_msgSend(a1[6], "count") > a3)
    objc_msgSend(a1[5], "appendString:", CFSTR("\n"));

}

- (id)stringForLine:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__VKCMockImageAnalysisResult_stringForLine___block_invoke;
  v10[3] = &unk_1E9462FC0;
  v5 = v4;
  v11 = v5;
  v12 = v3;
  v6 = v3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);
  v7 = v12;
  v8 = v5;

  return v8;
}

void __44__VKCMockImageAnalysisResult_stringForLine___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", VKCMockResultTextKey);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "appendString:");
  if (objc_msgSend(*(id *)(a1 + 40), "count") - 1 > a3)
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(" "));

}

- (id)allLineQuads
{
  NSArray *allLineQuads;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  allLineQuads = self->_allLineQuads;
  if (!allLineQuads)
  {
    -[VKCMockImageAnalysisResult textProvider](self, "textProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allLineQuads");
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_allLineQuads;
    self->_allLineQuads = v5;

    allLineQuads = self->_allLineQuads;
  }
  return allLineQuads;
}

- (CGRect)caretRectForPosition:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  v4 = a3;
  -[VKCMockImageAnalysisResult textProvider](self, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "caretRectForPosition:", v4);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;

  y = a3.y;
  x = a3.x;
  -[VKCMockImageAnalysisResult textProvider](self, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "characterRangeAtPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[VKCMockImageAnalysisResult textProvider](self, "textProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "closestPositionToPoint:withinRange:", v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGRect)firstRectForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = a3;
  -[VKCMockImageAnalysisResult textProvider](self, "textProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstRectForRange:documentView:contentRect:", v12, v11, x, y, width, height);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = v15;
  v23 = v17;
  v24 = v19;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (id)selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  void *v14;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = a3;
  -[VKCMockImageAnalysisResult textProvider](self, "textProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "selectionRectsForRange:documentView:contentRect:", v12, v11, x, y, width, height);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)rangeOfLineForPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VKCMockImageAnalysisResult textProvider](self, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rangeOfLineForPosition:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)rangeOfWordForPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VKCMockImageAnalysisResult textProvider](self, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rangeOfWordForPosition:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)smallestSelectableRangeForPosition:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VKCMockImageAnalysisResult textProvider](self, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "smallestSelectableRangeForPosition:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)adjustTextRangeToSelectableRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[VKCMockImageAnalysisResult textProvider](self, "textProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustTextRangeToSelectableRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (id)dataDetectors
{
  return self->_dataDetectors;
}

- (BOOL)isRunningTest
{
  return self->_isRunningTest;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (NSDictionary)sourceDict
{
  return self->_sourceDict;
}

- (void)setSourceDict:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDict, a3);
}

- (VKCMockTextProvider)textProvider
{
  return self->_textProvider;
}

- (void)setTextProvider:(id)a3
{
  objc_storeStrong((id *)&self->_textProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textProvider, 0);
  objc_storeStrong((id *)&self->_sourceDict, 0);
  objc_storeStrong((id *)&self->_allLineQuads, 0);
  objc_storeStrong((id *)&self->_dataDetectors, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
