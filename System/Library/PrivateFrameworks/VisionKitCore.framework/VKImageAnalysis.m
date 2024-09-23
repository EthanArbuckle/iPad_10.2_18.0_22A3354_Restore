@implementation VKImageAnalysis

- (VKImageAnalysis)initWithAnalysisResult:(id)a3
{
  id v5;
  VKImageAnalysis *v6;
  VKImageAnalysis *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKImageAnalysis;
  v6 = -[VKImageAnalysis init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_imageAnalysisResult, a3);
    -[VKImageAnalysis setFeedbackProvider:](v7, "setFeedbackProvider:", 0);
  }

  return v7;
}

- (NSString)transcript
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = &stru_1E94661A8;
  v5 = v3;

  return v5;
}

- (NSDictionary)localeMap
{
  void *v2;
  void *v3;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (int)analysisRequestID
{
  void *v2;
  int v3;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "analysisRequestID");

  return v3;
}

- (BOOL)hasResultsForAnalysisTypes:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;

  v6 = a3;
  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v8, "text");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      v10 = 1;
LABEL_22:

      goto LABEL_23;
    }
  }
  if ((v6 & 2) != 0)
  {
    objc_msgSend(v9, "textDataDetectorElements");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {

      v10 = 1;
      goto LABEL_21;
    }
  }
  if ((v6 & 4) != 0)
  {
    objc_msgSend(v9, "mrcDataDetectorElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v10 = 1;
LABEL_18:

      goto LABEL_19;
    }
  }
  if ((v6 & 8) != 0)
  {
    objc_msgSend(v9, "appClipDataDetectorElements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    v10 = v12 != 0;
    if ((v6 & 0x10) != 0 && !v12)
      v10 = -[VKImageAnalysis _hasVisualSearchElements](self, "_hasVisualSearchElements");

    if ((v6 & 4) == 0)
      goto LABEL_19;
    goto LABEL_18;
  }
  if ((v6 & 0x10) != 0)
  {
    v10 = -[VKImageAnalysis _hasVisualSearchElements](self, "_hasVisualSearchElements");
    if ((v6 & 4) != 0)
      goto LABEL_18;
  }
  else
  {
    v10 = 0;
    if ((v6 & 4) != 0)
      goto LABEL_18;
  }
LABEL_19:
  if ((v6 & 2) != 0)

LABEL_21:
  if ((v6 & 1) != 0)
    goto LABEL_22;
LABEL_23:

  return v10;
}

- (BOOL)_hasVisualSearchElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualSearchResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualSearchResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resultItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count") != 0;

  return v8;
}

- (id)visualSearchResultItems
{
  void *v2;
  void *v3;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualSearchResultItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)countOfDataDetectorsWithTypes:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[6];
  _QWORD v11[4];

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataDetectors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__VKImageAnalysis_countOfDataDetectorsWithTypes___block_invoke;
  v10[3] = &unk_1E9465E48;
  v10[4] = v11;
  v10[5] = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v10);

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countOfDataDetectorsWithTypes:", a3);

  _Block_object_dispose(v11, 8);
  return v8;
}

uint64_t __49__VKImageAnalysis_countOfDataDetectorsWithTypes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "elementType");
  if ((*(_QWORD *)(a1 + 40) & result) != 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

- (id)_attributedStringForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  length = a3.length;
  location = a3.location;
  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "vk_range");
  v9 = VKMClampRange(location, length, v7, v8);
  v11 = v10;

  +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertPlainTextRangeToAttributedRange:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "nsRange");
  v16 = v15;

  objc_msgSend(v5, "attributedText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "vk_attributedSubstringFromRange:", v14, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)analysisByReplacingTypes:(unint64_t)a3 fromAnalysis:(id)a4
{
  return 0;
}

- (void)setFeedbackProvider:(id)a3
{
  objc_storeStrong((id *)&self->_feedbackProvider, a3);
}

- (VKFeedbackProvider)feedbackProvider
{
  return self->_feedbackProvider;
}

- (BOOL)writeSecureCodedArchiveToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "fileExistsAtPath:", v10);

    if ((v11 & 1) == 0)
      objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, a4);
    objc_msgSend(v7, "writeToURL:options:error:", v6, 1, a4);

  }
  return a4 != 0;
}

- (id)textDataDetectors
{
  void *v2;
  void *v3;
  void *v4;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textDataDetectorElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_map:", &__block_literal_global_42);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

VKWKDataDetectorInfo *__36__VKImageAnalysis_textDataDetectors__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  VKWKDataDetectorInfo *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = a2;
  v3 = objc_alloc_init(VKWKDataDetectorInfo);
  objc_msgSend(v2, "boundingQuads");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKWKDataDetectorInfo setBoundingQuads:](v3, "setBoundingQuads:", v4);

  v5 = objc_msgSend(v2, "characterRange");
  -[VKWKDataDetectorInfo setCharacterRange:](v3, "setCharacterRange:", v5, v6);
  objc_msgSend(v2, "scannerResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKWKDataDetectorInfo setResult:](v3, "setResult:", v7);
  return v3;
}

- (id)allLines
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sourceVNDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "blocksWithTypes:inRegion:", 8, 0.0, 0.0, 1.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vk_map:", &__block_literal_global_94);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

VKWKLineInfo *__27__VKImageAnalysis_allLines__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  VKWKLineInfo *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = a2;
  v3 = objc_alloc_init(VKWKLineInfo);
  v4 = objc_opt_class();
  VKDynamicCast(v4, (uint64_t)v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "vkQuad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKWKTextInfo setQuad:](v3, "setQuad:", v6);

  objc_msgSend(v5, "getTranscript");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKWKTextInfo setString:](v3, "setString:", v7);

  objc_msgSend(v5, "getCROutputRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKWKLineInfo setLayoutDirection:](v3, "setLayoutDirection:", objc_msgSend(v8, "layoutDirection"));

  objc_msgSend(v5, "getChildren");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vk_map:", &__block_literal_global_98);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKWKLineInfo setChildren:](v3, "setChildren:", v10);

  -[VKWKLineInfo setShouldWrap:](v3, "setShouldWrap:", objc_msgSend(v5, "shouldBeWrappedWithNextLine"));
  return v3;
}

VKWKTextInfo *__27__VKImageAnalysis_allLines__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  VKWKTextInfo *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  v3 = objc_alloc_init(VKWKTextInfo);
  objc_msgSend(v2, "getCROutputRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "boundingQuad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vkQuad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKWKTextInfo setQuad:](v3, "setQuad:", v6);

  objc_msgSend(v2, "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKWKTextInfo setString:](v3, "setString:", v7);
  return v3;
}

- (NSArray)rectangleObservations
{
  void *v2;
  void *v3;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rectangleObservations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)filteredNormalizedRectangleQuads
{
  void *v2;
  void *v3;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filteredNormalizedRectangleQuads");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSArray)layoutComponents
{
  void *v2;
  void *v3;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)mrcMenu
{
  void *v2;
  void *v3;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mrcMenu");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)presentingViewControllerForMrcAction
{
  void *v2;
  void *v3;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewControllerForMrcAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setPresentingViewControllerForMrcAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPresentingViewControllerForMrcAction:", v4);

}

- (CGRect)rectForMrcActionInPresentingViewController
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rectForMrcActionInPresentingViewController");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setRectForMrcActionInPresentingViewController:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRectForMrcActionInPresentingViewController:", x, y, width, height);

}

- (id)barcodeActions
{
  void *v2;
  void *v3;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "barcodeActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)translateTo:(id)a3 withCompletion:(id)a4
{
  -[VKImageAnalysis translateFrom:to:withCompletion:](self, "translateFrom:to:withCompletion:", 0, a3, a4);
}

- (void)translateFrom:(id)a3 to:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  objc_class *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *, void *);
  void *v26;
  id v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sourceVNDocument");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "blocksWithTypes:inRegion:", 2, 0.0, 0.0, 1.0, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2050000000;
  v14 = (void *)getLTUIVisualTranslationServiceClass_softClass;
  v32 = getLTUIVisualTranslationServiceClass_softClass;
  v15 = MEMORY[0x1E0C809B0];
  if (!getLTUIVisualTranslationServiceClass_softClass)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __getLTUIVisualTranslationServiceClass_block_invoke;
    v28[3] = &unk_1E9462330;
    v28[4] = &v29;
    __getLTUIVisualTranslationServiceClass_block_invoke((uint64_t)v28);
    v14 = (void *)v30[3];
  }
  v16 = objc_retainAutorelease(v14);
  _Block_object_dispose(&v29, 8);
  v17 = objc_alloc_init(v16);
  v23 = v15;
  v24 = 3221225472;
  v25 = __51__VKImageAnalysis_translateFrom_to_withCompletion___block_invoke;
  v26 = &unk_1E9465F10;
  v18 = v10;
  v27 = v18;
  v19 = (void *)MEMORY[0x1D8249E20](&v23);
  if (v8 && v9)
  {
    v20 = objc_alloc(MEMORY[0x1E0C99DC8]);
    v21 = (void *)objc_msgSend(v20, "initWithLocaleIdentifier:", v8, v23, v24, v25, v26);
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v9);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v17, "translate:sourceLocale:targetLocale:completion:", v13, v21, v22, v19);
    else
      objc_msgSend(v17, "translate:targetLocale:completion:", v13, v22, v19);

  }
}

void __51__VKImageAnalysis_translateFrom_to_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  VKQuad *v12;
  double v13;
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
  double v26;
  VKQuad *v27;
  uint64_t v28;
  VKCTranslatedParagraph *v29;
  VKCImageAnalysisTranslation *v30;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v32 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v10, "string");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = [VKQuad alloc];
        objc_msgSend(v10, "bottomLeft");
        v14 = v13;
        v16 = v15;
        objc_msgSend(v10, "bottomRight");
        v18 = v17;
        v20 = v19;
        objc_msgSend(v10, "topLeft");
        v22 = v21;
        v24 = v23;
        objc_msgSend(v10, "topRight");
        v27 = -[VKQuad initWithBottomLeft:bottomRight:topLeft:topRight:](v12, "initWithBottomLeft:bottomRight:topLeft:topRight:", v14, v16, v18, v20, v22, v24, v25, v26);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v28 = objc_msgSend(v10, "isPassthrough");
        else
          v28 = 0;
        v29 = -[VKCTranslatedParagraph initWithText:quad:isPassthrough:]([VKCTranslatedParagraph alloc], "initWithText:quad:isPassthrough:", v11, v27, v28);
        objc_msgSend(v5, "addObject:", v29);

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v7);
  }

  v30 = -[VKCImageAnalysisTranslation initWithParagraphs:]([VKCImageAnalysisTranslation alloc], "initWithParagraphs:", v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (NSArray)formRegions
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formRegions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (unint64_t)recognitionConfidence
{
  void *v2;
  unint64_t v3;

  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "recognitionConfidence");

  return v3;
}

- (id)formRegionsExcluding:(id)a3 updateExcludedFields:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formRegionsExcluding:updateExcludedFields:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)proposedFormRegionForPoint:(CGPoint)a3 existingFields:(id)a4 formSize:(CGSize)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  void *v12;

  height = a5.height;
  width = a5.width;
  y = a3.y;
  x = a3.x;
  v10 = a4;
  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "proposedFormRegionForPoint:existingFields:formSize:", v10, x, y, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[VKImageAnalysis imageAnalysisResult](self, "imageAnalysisResult");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Result"));

}

- (VKImageAnalysis)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  VKImageAnalysis *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Result"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[VKImageAnalysis initWithAnalysisResult:](self, "initWithAnalysisResult:", v5);
  return v6;
}

- (VKCImageAnalysisResult)imageAnalysisResult
{
  return self->_imageAnalysisResult;
}

- (void)setImageAnalysisResult:(id)a3
{
  objc_storeStrong((id *)&self->_imageAnalysisResult, a3);
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestIdentifier, a3);
}

- (void)setLocaleMap:(id)a3
{
  objc_storeStrong((id *)&self->_localeMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeMap, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_imageAnalysisResult, 0);
  objc_storeStrong((id *)&self->_feedbackProvider, 0);
}

@end
