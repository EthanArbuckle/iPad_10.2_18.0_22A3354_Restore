@implementation VKCImageAnalysisResult

- (void)setVisualSearchResult:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_storeStrong((id *)&self->_visualSearchResult, a3);
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("updatedTypes");
  v9[0] = &unk_1E9494DC0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("VKAnalysisDidUpdateNotification"), self, v7);
}

- (NSArray)visualSearchResultItems
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCImageAnalysisResult visualSearchResult](self, "visualSearchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "resultItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_compactMap:", &__block_literal_global_2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

VKCVisualSearchResultInfo *__49__VKCImageAnalysisResult_visualSearchResultItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  VKCVisualSearchResultInfo *v3;

  v2 = a2;
  v3 = -[VKCVisualSearchResultInfo initWithResultItem:]([VKCVisualSearchResultInfo alloc], "initWithResultItem:", v2);

  return v3;
}

- (BOOL)hasImageData
{
  void *v2;
  char v3;

  -[VKCTextRecognitionResult request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasImageData");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (VKCImageAnalysisResult)initWithDocumentObservation:(id)a3 mrcDataDetectors:(id)a4 imageSize:(CGSize)a5
{
  VKCImageAnalysisResult *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKCImageAnalysisResult;
  result = -[VKCTextRecognitionResult initWithDocumentObservation:mrcDataDetectors:imageSize:](&v6, sel_initWithDocumentObservation_mrcDataDetectors_imageSize_, a3, a4, a5.width, a5.height);
  result->_totalBoundingBoxTextArea = -1.0;
  result->_totalQuadTextArea = -1.0;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKCImageAnalysisResult;
  -[VKCTextRecognitionResult encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (VKCImageAnalysisResult)initWithCoder:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VKCImageAnalysisResult;
  return -[VKCTextRecognitionResult initWithCoder:](&v4, sel_initWithCoder_, a3);
}

- (void)setRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VKCImageAnalysisResult;
  v4 = a3;
  -[VKCTextRecognitionResult setRequest:](&v7, sel_setRequest_, v4);
  objc_msgSend(v4, "locales", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCTextRecognitionResult setRequestLocales:](self, "setRequestLocales:", v5);

  objc_msgSend(v4, "barcodeSymbologies");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCTextRecognitionResult setRequestBarcodeSymbologies:](self, "setRequestBarcodeSymbologies:", v6);
  -[VKCTextRecognitionResult updateInspectableElements](self, "updateInspectableElements");
}

- (double)totalBoundingBoxTextArea
{
  double result;
  void *v4;
  _QWORD v5[5];

  result = self->_totalBoundingBoxTextArea;
  if (result < 0.0)
  {
    self->_totalBoundingBoxTextArea = 0.0;
    -[VKCTextRecognitionResult allLineQuads](self, "allLineQuads");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __50__VKCImageAnalysisResult_totalBoundingBoxTextArea__block_invoke;
    v5[3] = &unk_1E94629F0;
    v5[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

    return self->_totalBoundingBoxTextArea;
  }
  return result;
}

double __50__VKCImageAnalysisResult_totalBoundingBoxTextArea__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "boundingBoxArea");
  v3 = *(_QWORD *)(a1 + 32);
  result = v4 + *(double *)(v3 + 272);
  *(double *)(v3 + 272) = result;
  return result;
}

- (double)totalQuadTextArea
{
  double result;
  void *v4;
  _QWORD v5[5];

  result = self->_totalQuadTextArea;
  if (result < 0.0)
  {
    self->_totalQuadTextArea = 0.0;
    -[VKCTextRecognitionResult allLineQuads](self, "allLineQuads");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __43__VKCImageAnalysisResult_totalQuadTextArea__block_invoke;
    v5[3] = &unk_1E94629F0;
    v5[4] = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

    return self->_totalQuadTextArea;
  }
  return result;
}

double __43__VKCImageAnalysisResult_totalQuadTextArea__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "area");
  v3 = *(_QWORD *)(a1 + 32);
  result = v4 + *(double *)(v3 + 280);
  *(double *)(v3 + 280) = result;
  return result;
}

- (UIMenu)mrcMenu
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCImageAnalysisResult mrcDataDetectorElements](self, "mrcDataDetectorElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((mrcElement) != nil)", "-[VKCImageAnalysisResult mrcMenu]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "mrcElement");
    objc_msgSend(v3, "mrcMenu");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (UIMenu *)v4;
}

- (UIViewController)presentingViewControllerForMrcAction
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCImageAnalysisResult mrcDataDetectorElements](self, "mrcDataDetectorElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((mrcElement) != nil)", "-[VKCImageAnalysisResult presentingViewControllerForMrcAction]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "mrcElement");
    objc_msgSend(v3, "presentingViewControllerForMrcAction");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return (UIViewController *)v4;
}

- (void)setPresentingViewControllerForMrcAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[VKCImageAnalysisResult mrcDataDetectorElements](self, "mrcDataDetectorElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 1)
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((mrcElement) != nil)", "-[VKCImageAnalysisResult setPresentingViewControllerForMrcAction:]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "mrcElement");
    objc_msgSend(v5, "setPresentingViewControllerForMrcAction:", v6);

  }
}

- (void)setRectForMrcActionInPresentingViewController:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCImageAnalysisResult mrcDataDetectorElements](self, "mrcDataDetectorElements");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v10, "count") == 1;
  v8 = v10;
  if (v7)
  {
    objc_msgSend(v10, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((mrcElement) != nil)", "-[VKCImageAnalysisResult setRectForMrcActionInPresentingViewController:]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "mrcElement");
    objc_msgSend(v9, "setRectForMrcActionInPresentingViewController:", x, y, width, height);

    v8 = v10;
  }

}

- (NSArray)barcodeActions
{
  void *v2;
  void *v3;

  -[VKCImageAnalysisResult mrcDataDetectorElements](self, "mrcDataDetectorElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vk_compactMap:", &__block_literal_global_40);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __40__VKCImageAnalysisResult_barcodeActions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "barcodeAction");
}

- (NSArray)textDataDetectorElements
{
  void *v2;
  void *v3;

  -[VKCTextRecognitionResult dataDetectors](self, "dataDetectors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vk_objectsPassingTest:", &__block_literal_global_42);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __50__VKCImageAnalysisResult_textDataDetectorElements__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isTextDataDetector");
}

- (NSArray)mrcDataDetectorElements
{
  void *v2;
  void *v3;

  -[VKCTextRecognitionResult dataDetectors](self, "dataDetectors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vk_objectsPassingTest:", &__block_literal_global_43);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

uint64_t __49__VKCImageAnalysisResult_mrcDataDetectorElements__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMRCDataDetector");
}

- (NSArray)appClipDataDetectorElements
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (id)imageFromNormalizedSubrect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  void *v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  CGImage *v29;
  void *v30;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[VKCTextRecognitionResult request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "blockingGenerateCIImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = VKMFlipRect(x, y, width, height, 0.0, 0.0, 1.0, 1.0);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    objc_msgSend(v8, "extent");
    VKMRectFromNormalizedSubrect(v16, v17, v18, v19, v9, v11, v13, v15);
    v21 = v20;
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DD90]), "initWithOptions:", 0);
    v29 = (CGImage *)objc_msgSend(v28, "createCGImage:fromRect:", v8, v21, v23, v25, v27);
    objc_msgSend(MEMORY[0x1E0CEA638], "vk_imageWithCGImage:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    CGImageRelease(v29);

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (VKCImageSubjectContext)cachedSubjectContext
{
  return self->_cachedSubjectContext;
}

- (void)setCachedSubjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_cachedSubjectContext, a3);
}

- (UIImage)cachedCustomImageForRemoveBackground
{
  return self->_cachedCustomImageForRemoveBackground;
}

- (void)setCachedCustomImageForRemoveBackground:(id)a3
{
  objc_storeStrong((id *)&self->_cachedCustomImageForRemoveBackground, a3);
}

- (VKCVisualSearchResult)visualSearchResult
{
  return self->_visualSearchResult;
}

- (int)analysisRequestID
{
  return self->_analysisRequestID;
}

- (void)setAnalysisRequestID:(int)a3
{
  self->_analysisRequestID = a3;
}

- (void)setTotalBoundingBoxTextArea:(double)a3
{
  self->_totalBoundingBoxTextArea = a3;
}

- (void)setTotalQuadTextArea:(double)a3
{
  self->_totalQuadTextArea = a3;
}

- (CGRect)rectForMrcActionInPresentingViewController
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rectForMrcActionInPresentingViewController.origin.x;
  y = self->_rectForMrcActionInPresentingViewController.origin.y;
  width = self->_rectForMrcActionInPresentingViewController.size.width;
  height = self->_rectForMrcActionInPresentingViewController.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualSearchResult, 0);
  objc_storeStrong((id *)&self->_cachedCustomImageForRemoveBackground, 0);
  objc_storeStrong((id *)&self->_cachedSubjectContext, 0);
}

- (id)dictionaryRepresentation
{
  id v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = VKCMockResultImageSizeKey;
  -[VKCTextRecognitionResult imageSize](self, "imageSize");
  +[VKCMockHelper plistFromSize:](VKCMockHelper, "plistFromSize:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_addKey:forNonNilObject:", v4, v5);

  v6 = VKCMockResultTextKey;
  -[VKCTextRecognitionResult text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_addKey:forNonNilObject:", v6, v7);

  v8 = VKCMockResultTextForReferenceKey;
  -[VKCTextRecognitionResult text](self, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vk_stringByReplacingNewlineCharactersWithWhiteSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_addKey:forNonNilObject:", v8, v10);

  v11 = VKCMockResultLinesKey;
  -[VKCTextRecognitionResult sourceDocument](self, "sourceDocument");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCImageAnalysisResult linesPlistFromSourceDocument:](self, "linesPlistFromSourceDocument:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_addKey:forNonNilObject:", v11, v13);

  v14 = VKCMockResultDataDetectorsKey;
  -[VKCImageAnalysisResult dataDetectorsFromRecognitionResult:](self, "dataDetectorsFromRecognitionResult:", self);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vk_addKey:forNonNilObject:", v14, v15);

  return v3;
}

- (id)linesPlistFromSourceDocument:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  VKCImageAnalysisResult *v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__VKCImageAnalysisResult_MockAdditions__linesPlistFromSourceDocument___block_invoke;
  v10[3] = &unk_1E9464420;
  v11 = v4;
  v6 = v5;
  v12 = v6;
  v13 = self;
  v7 = v4;
  objc_msgSend(v7, "enumerateContentsWithTypes:usingBlock:", 8, v10);
  v8 = v6;

  return v8;
}

void __70__VKCImageAnalysisResult_MockAdditions__linesPlistFromSourceDocument___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = objc_msgSend(v3, "rangeOfContentRegion:", a2);
  objc_msgSend(v3, "outputRegionWithContentsOfCharacterRange:", v4, v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "wordsPlistFromRegion:sourceDocument:", v8, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vk_addNonNilObject:", v7);

}

- (id)wordsPlistFromRegion:(id)a3 sourceDocument:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  VKCImageAnalysisResult *v17;
  id v18;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__VKCImageAnalysisResult_MockAdditions__wordsPlistFromRegion_sourceDocument___block_invoke;
  v15[3] = &unk_1E9464420;
  v10 = v9;
  v16 = v10;
  v17 = self;
  v18 = v6;
  v11 = v6;
  objc_msgSend(v8, "enumerateContentsWithTypes:usingBlock:", 16, v15);

  v12 = v18;
  v13 = v10;

  return v13;
}

void __77__VKCImageAnalysisResult_MockAdditions__wordsPlistFromRegion_sourceDocument___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "wordPlistFromOutputRegion:document:", a2, *(_QWORD *)(a1 + 48));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vk_addNonNilObject:", v3);

}

- (id)wordPlistFromOutputRegion:(id)a3 document:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  __CFString *v9;
  void *v10;
  __CFString *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  v9 = VKCMockResultTextKey;
  objc_msgSend(v7, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vk_addKey:forNonNilObject:", v9, v10);

  v11 = VKCMockResultRangeKey;
  v12 = objc_msgSend(v6, "rangeOfContentRegion:", v7);
  v14 = v13;

  +[VKCMockHelper plistFromRange:](VKCMockHelper, "plistFromRange:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vk_addKey:forNonNilObject:", v11, v15);

  v16 = VKCMockResultQuadKey;
  objc_msgSend(v7, "boundingQuad");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "vkQuad");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "vk_addKey:forNonNilObject:", v16, v19);

  return v8;
}

- (id)dataDetectorsFromRecognitionResult:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  VKCImageAnalysisResult *v13;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "dataDetectors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__VKCImageAnalysisResult_MockAdditions__dataDetectorsFromRecognitionResult___block_invoke;
  v11[3] = &unk_1E9464448;
  v8 = v6;
  v12 = v8;
  v13 = self;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);

  v9 = v8;
  return v9;
}

void __76__VKCImageAnalysisResult_MockAdditions__dataDetectorsFromRecognitionResult___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "ddDictionaryFromDataDetectorElement:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)ddDictionaryFromDataDetectorElement:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v3, "dataDetectorTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, VKCMockResultDataDetectorTypesKey);

  v6 = objc_opt_class();
  VKDynamicCast(v6, (uint64_t)v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "characterRange");
    +[VKCMockHelper plistFromRange:](VKCMockHelper, "plistFromRange:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, VKCMockResultRangeKey);

  }
  objc_msgSend(v3, "boundingQuads");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "vk_compactMap:", &__block_literal_global_20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, VKCMockResultDataDetectorQuadsKey);

  return v4;
}

uint64_t __77__VKCImageAnalysisResult_MockAdditions__ddDictionaryFromDataDetectorElement___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionaryRepresentation");
}

@end
