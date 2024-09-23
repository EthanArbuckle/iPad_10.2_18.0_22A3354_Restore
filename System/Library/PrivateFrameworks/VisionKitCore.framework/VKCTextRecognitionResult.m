@implementation VKCTextRecognitionResult

- (VKCTextRecognitionResult)initWithDocumentObservation:(id)a3 mrcDataDetectors:(id)a4 imageSize:(CGSize)a5
{
  CGFloat height;
  CGFloat width;
  id v10;
  id v11;
  VKCTextRecognitionResult *v12;
  uint64_t v13;
  NSDate *creationDate;
  uint64_t v15;
  NSString *text;
  void *v17;
  uint64_t v18;
  NSString *title;
  uint64_t v20;
  VNRecognizedTextBlockObservation *titleObservation;
  void *v22;
  NSArray *v23;
  NSArray *filteredTextDataDetectors;
  NSArray *v25;
  uint64_t v26;
  NSArray *dataDetectors;
  void *v28;
  uint64_t v29;
  NSArray *unfilteredDataDetectors;
  uint64_t v31;
  CRDocumentOutputRegion *sourceDocument;
  void *v33;
  NSArray *v34;
  NSArray *textElements;
  NSArray *v36;
  void *v37;
  uint64_t v38;
  NSString *buildString;
  id v40;
  objc_super v42;

  height = a5.height;
  width = a5.width;
  v10 = a3;
  v11 = a4;
  v42.receiver = self;
  v42.super_class = (Class)VKCTextRecognitionResult;
  v12 = -[VKCTextRecognitionResult init](&v42, sel_init);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = objc_claimAutoreleasedReturnValue();
    creationDate = v12->_creationDate;
    v12->_creationDate = (NSDate *)v13;

    objc_msgSend(v10, "getTranscript");
    v15 = objc_claimAutoreleasedReturnValue();
    text = v12->_text;
    v12->_text = (NSString *)v15;

    objc_msgSend(v10, "getTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "getTranscript");
    v18 = objc_claimAutoreleasedReturnValue();
    title = v12->_title;
    v12->_title = (NSString *)v18;

    objc_msgSend(v10, "getTitle");
    v20 = objc_claimAutoreleasedReturnValue();
    titleObservation = v12->_titleObservation;
    v12->_titleObservation = (VNRecognizedTextBlockObservation *)v20;

    objc_msgSend(v10, "getCRDocumentOutputRegion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCTextElementProcessor dataDetectorsFromCRDocumentOutputRegion:shouldFilter:](VKCTextElementProcessor, "dataDetectorsFromCRDocumentOutputRegion:shouldFilter:", v22, 1);
    v23 = (NSArray *)objc_claimAutoreleasedReturnValue();

    filteredTextDataDetectors = v12->_filteredTextDataDetectors;
    v12->_filteredTextDataDetectors = v23;
    v25 = v23;

    -[NSArray vk_arrayByAddingObjectsFromNonNilArray:](v25, "vk_arrayByAddingObjectsFromNonNilArray:", v11);
    v26 = objc_claimAutoreleasedReturnValue();
    dataDetectors = v12->_dataDetectors;
    v12->_dataDetectors = (NSArray *)v26;

    objc_msgSend(v10, "getCRDocumentOutputRegion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCTextElementProcessor dataDetectorsFromCRDocumentOutputRegion:shouldFilter:](VKCTextElementProcessor, "dataDetectorsFromCRDocumentOutputRegion:shouldFilter:", v28, 0);
    v29 = objc_claimAutoreleasedReturnValue();
    unfilteredDataDetectors = v12->_unfilteredDataDetectors;
    v12->_unfilteredDataDetectors = (NSArray *)v29;

    objc_storeStrong((id *)&v12->_sourceVNDocument, a3);
    objc_msgSend(v10, "getCRDocumentOutputRegion");
    v31 = objc_claimAutoreleasedReturnValue();
    sourceDocument = v12->_sourceDocument;
    v12->_sourceDocument = (CRDocumentOutputRegion *)v31;

    v12->_imageSize.width = width;
    v12->_imageSize.height = height;
    objc_msgSend(v10, "getCRDocumentOutputRegion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKCTextElementProcessor textElementsFromCRDocumentOutputRegion:](VKCTextElementProcessor, "textElementsFromCRDocumentOutputRegion:", v33);
    v34 = (NSArray *)objc_claimAutoreleasedReturnValue();

    textElements = v12->_textElements;
    v12->_textElements = v34;
    v36 = v34;

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "operatingSystemVersionString");
    v38 = objc_claimAutoreleasedReturnValue();
    buildString = v12->_buildString;
    v12->_buildString = (NSString *)v38;

    v40 = -[VKCTextRecognitionResult normalizedTextLineBoundingBoxes](v12, "normalizedTextLineBoundingBoxes");
    -[VKCTextRecognitionResult updateInspectableElements](v12, "updateInspectableElements");
    -[VKCTextRecognitionResult updateAttributedText](v12, "updateAttributedText");
  }

  return v12;
}

- (void)updateVNDocumentObservation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *textElements;
  NSArray *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[VKCTextRecognitionResult buildString](self, "buildString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "operatingSystemVersionString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCTextRecognitionResult setBuildString:](self, "setBuildString:", v7);

  }
  -[VKCTextRecognitionResult setSourceVNDocument:](self, "setSourceVNDocument:", v4);
  objc_msgSend(v4, "getCRDocumentOutputRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCTextRecognitionResult setSourceDocument:](self, "setSourceDocument:", v8);

  objc_msgSend(v4, "getTranscript");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCTextRecognitionResult setText:](self, "setText:", v9);

  objc_msgSend(v4, "getTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "getTranscript");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCTextRecognitionResult setTitle:](self, "setTitle:", v11);

  objc_msgSend(v4, "getTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCTextRecognitionResult setTitleObservation:](self, "setTitleObservation:", v12);
  -[VKCTextRecognitionResult sourceDocument](self, "sourceDocument");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCTextElementProcessor dataDetectorsFromCRDocumentOutputRegion:shouldFilter:](VKCTextElementProcessor, "dataDetectorsFromCRDocumentOutputRegion:shouldFilter:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCTextRecognitionResult setFilteredTextDataDetectors:](self, "setFilteredTextDataDetectors:", v14);

  -[VKCTextRecognitionResult sourceDocument](self, "sourceDocument");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCTextElementProcessor dataDetectorsFromCRDocumentOutputRegion:shouldFilter:](VKCTextElementProcessor, "dataDetectorsFromCRDocumentOutputRegion:shouldFilter:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCTextRecognitionResult setUnfilteredTextDataDetectors:](self, "setUnfilteredTextDataDetectors:", v16);

  -[VKCTextRecognitionResult sourceDocument](self, "sourceDocument");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCTextElementProcessor textElementsFromCRDocumentOutputRegion:](VKCTextElementProcessor, "textElementsFromCRDocumentOutputRegion:", v17);
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();

  textElements = self->_textElements;
  self->_textElements = v18;
  v20 = v18;

  -[VKCTextRecognitionResult updateTextDataDetectors](self, "updateTextDataDetectors");
  -[VKCTextRecognitionResult updateInspectableElements](self, "updateInspectableElements");
  -[VKCTextRecognitionResult updateAttributedText](self, "updateAttributedText");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = CFSTR("updatedTypes");
  v24[0] = &unk_1E9494F10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "postNotificationName:object:userInfo:", CFSTR("VKAnalysisDidUpdateNotification"), self, v22);
}

- (void)updateMRCDataDetectors:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[VKCTextRecognitionResult setMrcDataDetectors:](self, "setMrcDataDetectors:", a3);
  -[VKCTextRecognitionResult updateTextDataDetectors](self, "updateTextDataDetectors");
  -[VKCTextRecognitionResult updateInspectableElements](self, "updateInspectableElements");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("updatedTypes");
  v7[0] = &unk_1E9494F28;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:userInfo:", CFSTR("VKAnalysisDidUpdateNotification"), self, v5);

}

- (void)updateTextDataDetectors
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[VKCTextRecognitionResult filteredTextDataDetectors](self, "filteredTextDataDetectors");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = (void *)MEMORY[0x1E0C9AA60];
  if (v3)
    v5 = (void *)v3;
  v6 = v5;

  -[VKCTextRecognitionResult mrcDataDetectors](self, "mrcDataDetectors");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "vk_arrayByAddingObjectsFromNonNilArray:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCTextRecognitionResult setDataDetectors:](self, "setDataDetectors:", v7);
}

- (NSArray)normalizedTextLineBoundingBoxes
{
  NSArray *normalizedTextLineBoundingBoxes;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSArray *v13;
  NSArray *v14;
  _QWORD v16[4];
  id v17;

  normalizedTextLineBoundingBoxes = self->_normalizedTextLineBoundingBoxes;
  if (!normalizedTextLineBoundingBoxes)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[VKCTextRecognitionResult sourceVNDocument](self, "sourceVNDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCTextRecognitionResult sourceVNDocument](self, "sourceVNDocument");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getTranscript");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "vk_range");
    objc_msgSend(v5, "textBlockWithCharacterRange:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "getLines");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __59__VKCTextRecognitionResult_normalizedTextLineBoundingBoxes__block_invoke;
    v16[3] = &unk_1E9463E68;
    v17 = v4;
    v12 = v4;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v16);

    v13 = (NSArray *)objc_msgSend(v12, "copy");
    v14 = self->_normalizedTextLineBoundingBoxes;
    self->_normalizedTextLineBoundingBoxes = v13;

    normalizedTextLineBoundingBoxes = self->_normalizedTextLineBoundingBoxes;
  }
  return normalizedTextLineBoundingBoxes;
}

void __59__VKCTextRecognitionResult_normalizedTextLineBoundingBoxes__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a2, "vkQuad");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingBox");
  objc_msgSend(v3, "vk_valueWithRect:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

}

- (NSArray)layoutComponents
{
  void *v2;
  void *v3;
  void *v4;
  NSArray *v5;

  -[VKCTextRecognitionResult sourceDocument](self, "sourceDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = (void *)MEMORY[0x1E0C9AA60];
  v5 = v3;

  return v5;
}

- (void)updateAttributedText
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[VKCTextRecognitionResult sourceDocument](self, "sourceDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v18 = v5;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v5);
    v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = v4;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v22 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v13 = objc_msgSend(v3, "rangeOfContentRegion:", v12);
          v15 = v14;
          v16 = objc_msgSend(v12, "type");
          if (v16 == 256)
          {
            -[VKCTextRecognitionResult processListItemsItem:regionRange:indexSet:attributedString:textListClass:](self, "processListItemsItem:regionRange:indexSet:attributedString:textListClass:", v12, v13, v15, v6, v20, -[VKCTextRecognitionResult textListClass](self, "textListClass"));
          }
          else if (v16 == 64)
          {
            if (v13 == 0x7FFFFFFFFFFFFFFFLL)
              +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "regionRange.location != NSNotFound", "-[VKCTextRecognitionResult updateAttributedText]", 0, 0, CFSTR("found NSNotFound processing table region"));
            else
              -[VKCTextRecognitionResult processTableItem:regionRange:indexSet:attributedString:](self, "processTableItem:regionRange:indexSet:attributedString:", v12, v13, v15, v6, v20);
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v9);
    }

    v17 = (void *)objc_msgSend(v6, "copy");
    -[VKCTextRecognitionResult setRichPasteBoardIndexes:](self, "setRichPasteBoardIndexes:", v17);

    -[VKCTextRecognitionResult setAttributedText:](self, "setAttributedText:", v20);
    v5 = v18;
    v4 = v19;
  }

}

- (Class)textListClass
{
  return NSClassFromString(CFSTR("NSTextList"));
}

- (void)processTableItem:(id)a3 regionRange:(_NSRange)a4 indexSet:(id)a5 attributedString:(id)a6
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  int v46;
  VKCTextRecognitionResult *v47;
  void *v48;
  id obj;
  NSUInteger location;
  void *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint8_t v60[128];
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  int v64;
  uint64_t v65;

  location = a4.location;
  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a6;
  v10 = objc_opt_class();
  v52 = v8;
  VKCheckedDynamicCast(v10, (uint64_t)v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cells");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(MEMORY[0x1E0CEA270]);
  v48 = v11;
  objc_msgSend(v11, "colQuads");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v13;
  objc_msgSend(v13, "setNumberOfColumns:", objc_msgSend(v14, "count"));

  v15 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(v12, "count");
    -[VKCTextRecognitionResult request](self, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v62 = v16;
    v63 = 1024;
    v64 = objc_msgSend(v17, "requestID");
    _os_log_impl(&dword_1D2E0D000, v15, OS_LOG_TYPE_DEFAULT, "Beginning tableProcessing with cellCount: %lu, id: %d", buf, 0x12u);

  }
  v47 = self;

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  obj = v18;
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v54;
    v22 = *MEMORY[0x1E0CEA0D0];
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v54 != v21)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v25 = objc_msgSend(v24, "colRange", v47);
        v27 = v26;
        v28 = objc_msgSend(v24, "rowRange");
        v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA278]), "initWithTable:startingRow:rowSpan:startingColumn:columnSpan:", v51, v28, v29, v25, v27);
        objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)objc_msgSend(v31, "mutableCopy");

        v59 = v30;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setTextBlocks:", v33);

        v34 = objc_msgSend(v52, "rangeOfContentRegion:", v24) + location;
        v36 = v35 + 1;
        v37 = objc_msgSend(v9, "vk_range");
        v39 = VKMClampRange(v34, v36, v37, v38);
        v41 = v40;
        v57 = v22;
        v58 = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setAttributes:range:", v42, v39, v41);

      }
      v18 = obj;
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v20);
  }

  v43 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = objc_msgSend(v18, "count");
    -[VKCTextRecognitionResult request](v47, "request");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "requestID");
    *(_DWORD *)buf = 134218240;
    v62 = v44;
    v63 = 1024;
    v64 = v46;
    _os_log_impl(&dword_1D2E0D000, v43, OS_LOG_TYPE_DEFAULT, "Table processing complete with cellCount: %lu, id: %d", buf, 0x12u);

    v18 = obj;
  }

}

- (void)processListItemsItem:(id)a3 regionRange:(_NSRange)a4 indexSet:(id)a5 attributedString:(id)a6 textListClass:(Class)a7
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  void *v45;
  int v46;
  id obj;
  uint64_t v49;
  NSUInteger location;
  id v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint8_t v65[128];
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  int v69;
  uint64_t v70;

  location = a4.location;
  v70 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v51 = a5;
  v10 = a6;
  v11 = objc_opt_class();
  v52 = v9;
  VKCheckedDynamicCast(v11, (uint64_t)v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(v13, "count");
    -[VKCTextRecognitionResult request](self, "request");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v67 = v15;
    v68 = 1024;
    v69 = objc_msgSend(v16, "requestID");
    _os_log_impl(&dword_1D2E0D000, v14, OS_LOG_TYPE_DEFAULT, "Beginning list with itemCount: %lu, id: %d", buf, 0x12u);

  }
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v17 = v13;
  v53 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
  v18 = 0;
  if (v53)
  {
    v49 = *(_QWORD *)v59;
    v55 = *MEMORY[0x1E0CEA0D0];
    obj = v17;
    do
    {
      for (i = 0; i != v53; ++i)
      {
        if (*(_QWORD *)v59 != v49)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
        -[VKCTextRecognitionResult markerFormatForListItem:](self, "markerFormatForListItem:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "markerFormat");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "isEqualToString:", v21);

        if ((v23 & 1) != 0)
        {
          v57 = v18;
        }
        else
        {
          v24 = objc_msgSend([a7 alloc], "initWithMarkerFormat:options:", v21, 0);

          v57 = (void *)v24;
        }
        v25 = objc_msgSend(v52, "rangeOfContentRegion:", v20) + location;
        v27 = v26 + 1;
        v28 = objc_msgSend(v10, "vk_range");
        v30 = VKMClampRange(v25, v27, v28, v29);
        v32 = v31;
        v54 = objc_msgSend(v20, "markerRange");
        v34 = v33;
        v35 = v10;
        objc_msgSend(v10, "attributesAtIndex:longestEffectiveRange:inRange:", v30, 0, v30, v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "objectForKeyedSubscript:", v55);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = (void *)objc_msgSend(v37, "mutableCopy");

        if (!v38)
        {
          objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = (void *)objc_msgSend(v39, "mutableCopy");

        }
        v64 = v57;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setTextLists:", v40);

        v10 = v35;
        if (!-[VKCTextRecognitionResult shouldShowTextMarkerForMarkerType:](self, "shouldShowTextMarkerForMarkerType:", objc_msgSend(v20, "markerType")))
        {
          -[VKCTextRecognitionResult zeroWidthStringOfLength:](self, "zeroWidthStringOfLength:", v34);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "replaceCharactersInRange:withString:", v54 + v30, v34, v41);

        }
        v62 = v55;
        v63 = v38;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addAttributes:range:", v42, v30, v32);

        objc_msgSend(v51, "addIndexesInRange:", v30, v32);
        v18 = v57;
      }
      v17 = obj;
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
    }
    while (v53);
  }

  v43 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    v44 = objc_msgSend(v17, "count");
    -[VKCTextRecognitionResult request](self, "request");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "requestID");
    *(_DWORD *)buf = 134218240;
    v67 = v44;
    v68 = 1024;
    v69 = v46;
    _os_log_impl(&dword_1D2E0D000, v43, OS_LOG_TYPE_DEFAULT, "List processing complete with itemCount: %lu, id: %D", buf, 0x12u);

  }
}

- (BOOL)containsRichPasteboardElementsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[VKCTextRecognitionResult richPasteBoardIndexes](self, "richPasteBoardIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rangeArray");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__VKCTextRecognitionResult_containsRichPasteboardElementsForRange___block_invoke;
  v9[3] = &unk_1E9463E90;
  v11 = &v12;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  LOBYTE(v6) = *((_BYTE *)v13 + 24);
  _Block_object_dispose(&v12, 8);

  return (char)v6;
}

uint64_t __67__VKCTextRecognitionResult_containsRichPasteboardElementsForRange___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = *(void **)(a1 + 32);
  v7 = objc_msgSend(a2, "nsRange");
  result = objc_msgSend(v6, "containsIndexesInRange:", v7, v8);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (id)zeroWidthStringOfLength:(unint64_t)a3
{
  unint64_t v3;
  id v5;

  v3 = a3;
  if (a3 < 6)
    return off_1E94640A8[a3];
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  do
  {
    objc_msgSend(v5, "appendString:", CFSTR("🎛"));
    --v3;
  }
  while (v3);
  return v5;
}

- (BOOL)shouldShowTextMarkerForMarkerType:(int64_t)a3
{
  return a3 == 7;
}

- (id)markerFormatForListItem:(id)a3
{
  uint64_t v3;
  id *v4;

  v3 = objc_msgSend(a3, "markerType");
  if ((unint64_t)(v3 - 2) > 4)
    v4 = (id *)MEMORY[0x1E0CEA158];
  else
    v4 = (id *)qword_1E94640D8[v3 - 2];
  return *v4;
}

- (id)convertPlainTextRangeToAttributedRange:(id)a3
{
  return a3;
}

- (id)documentElements
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[VKCTextRecognitionResult buildString](self, "buildString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Build: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[VKCTextRecognitionResult creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "vk_localDateWithSeconds");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Date: %@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v12);

  v13 = (void *)MEMORY[0x1E0CB3940];
  -[VKCTextRecognitionResult imageSize](self, "imageSize");
  VKMUIStringForSize(v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("ImageSize: %@"), v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  v19 = (void *)MEMORY[0x1E0CB3940];
  -[VKCTextRecognitionResult imageSize](self, "imageSize");
  objc_msgSend(v19, "stringWithFormat:", CFSTR("ImageAspectRatio: %g"), VKMAspectRatio(v20, v21));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", v22, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v23);

  -[VKCTextRecognitionResult requestLocales](self, "requestLocales");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "vk_compactMap:", &__block_literal_global_15);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    +[VKCElementCollection collectionWithTitle:children:parent:](VKCElementCollection, "collectionWithTitle:children:parent:", CFSTR("Locales"), v25, 0);
  else
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", CFSTR("Locales (None - Default)"), 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v26);

  -[VKCTextRecognitionResult requestBarcodeSymbologies](self, "requestBarcodeSymbologies");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "vk_compactMap:", &__block_literal_global_115);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    +[VKCElementCollection collectionWithTitle:children:parent:](VKCElementCollection, "collectionWithTitle:children:parent:", CFSTR("Barcode Symbologies"), v28, 0);
  else
    +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", CFSTR("Barcode Symbologies (None - Default)"), 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v29);

  v30 = (void *)objc_msgSend(v3, "copy");
  return v30;
}

VKCElementInfo *__44__VKCTextRecognitionResult_documentElements__block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", a2, 0);
}

VKCElementInfo *__44__VKCTextRecognitionResult_documentElements__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[VKCElementInfo infoWithText:parent:](VKCElementInfo, "infoWithText:parent:", a2, 0);
}

- (NSDictionary)localeMap
{
  NSDictionary *localeMap;
  NSDictionary *v4;
  NSDictionary *v5;

  localeMap = self->_localeMap;
  if (!localeMap)
  {
    -[VKCTextRecognitionResult createLocaleMap](self, "createLocaleMap");
    v4 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_localeMap;
    self->_localeMap = v4;

    localeMap = self->_localeMap;
  }
  return localeMap;
}

- (id)createLocaleMap
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[VKCTextRecognitionResult sourceDocument](self, "sourceDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCTextRecognitionResult sourceDocument](self, "sourceDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __43__VKCTextRecognitionResult_createLocaleMap__block_invoke;
  v11[3] = &unk_1E9463ED8;
  v6 = v3;
  v12 = v6;
  v13 = v4;
  v7 = v4;
  objc_msgSend(v5, "enumerateContentsWithTypes:usingBlock:", 8, v11);

  v8 = v13;
  v9 = v6;

  return v9;
}

void __43__VKCTextRecognitionResult_createLocaleMap__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "recognizedLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);
    }
    v5 = objc_msgSend(*(id *)(a1 + 40), "rangeOfContentRegion:", v7);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "addIndexesInRange:", v5, v6);

  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[VKCTextRecognitionResult dataDetectors](self, "dataDetectors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vk_objectsPassingTest:", &__block_literal_global_123);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[VKCTextRecognitionResult sourceVNDocument](self, "sourceVNDocument");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sourceDocument"));

  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("MRCDD"));
  -[VKCTextRecognitionResult imageSize](self, "imageSize");
  *(float *)&v7 = v7;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("imageWidth"), v7);
  -[VKCTextRecognitionResult imageSize](self, "imageSize");
  *(float *)&v9 = v8;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("imageHeight"), v9);
  -[VKCTextRecognitionResult buildString](self, "buildString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("build"));

  -[VKCTextRecognitionResult creationDate](self, "creationDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("date"));

  -[VKCTextRecognitionResult requestBarcodeSymbologies](self, "requestBarcodeSymbologies");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("barcodeSymbologies"));

  -[VKCTextRecognitionResult requestLocales](self, "requestLocales");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("locales"));

}

uint64_t __44__VKCTextRecognitionResult_encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMRCDataDetector");
}

- (VKCTextRecognitionResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  float v6;
  double v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  VKCTextRecognitionResult *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceDocument"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MRCDD"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("imageWidth"));
  v7 = v6;
  objc_msgSend(v4, "decodeFloatForKey:", CFSTR("imageHeight"));
  v9 = v8;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("build"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[VKCTextRecognitionResult initWithDocumentObservation:mrcDataDetectors:imageSize:](self, "initWithDocumentObservation:mrcDataDetectors:imageSize:", v22, v5, v7, v9);
  -[VKCTextRecognitionResult setCreationDate:](v12, "setCreationDate:", v10);
  -[VKCTextRecognitionResult setBuildString:](v12, "setBuildString:", v11);
  v13 = (void *)MEMORY[0x1E0C99E60];
  v14 = objc_opt_class();
  objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("locales"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCTextRecognitionResult setRequestLocales:](v12, "setRequestLocales:", v16);

  v17 = (void *)MEMORY[0x1E0C99E60];
  v18 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v18, objc_opt_class(), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("barcodeSymbologies"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[VKCTextRecognitionResult setRequestBarcodeSymbologies:](v12, "setRequestBarcodeSymbologies:", v20);
  -[VKCTextRecognitionResult updateInspectableElements](v12, "updateInspectableElements");

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)elementMatchingOutputRegion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VKCTextRecognitionResult inspectableElements](self, "inspectableElements", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "recursiveSearchForCROutputRegion:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (unint64_t)countOfDataDetectorsWithTypes:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v9[5];

  -[VKCTextRecognitionResult dataDetectors](self, "dataDetectors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 == -1)
  {
    v6 = objc_msgSend(v4, "count");
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__VKCTextRecognitionResult_countOfDataDetectorsWithTypes___block_invoke;
    v9[3] = &__block_descriptor_40_e43_B32__0__VKCBaseDataDetectorElement_8Q16_B24l;
    v9[4] = a3;
    v6 = objc_msgSend(v4, "vk_countOfObjectsPassingTest:", v9);
  }
  v7 = v6;

  return v7;
}

BOOL __58__VKCTextRecognitionResult_countOfDataDetectorsWithTypes___block_invoke(uint64_t a1, void *a2)
{
  return (*(_QWORD *)(a1 + 32) & ~objc_msgSend(a2, "dataDetectorTypes")) == 0;
}

- (NSArray)allLineQuads
{
  void *v2;
  void *v3;
  void *v4;

  -[VKCTextRecognitionResult sourceVNDocument](self, "sourceVNDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blocksWithTypes:inRegion:", 8, 0.0, 0.0, 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "vk_compactMap:", &__block_literal_global_128);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __40__VKCTextRecognitionResult_allLineQuads__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vkQuad");
}

- (void)setRectangleObservations:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_rectangleObservations, a3);
  v5 = a3;
  -[VKCTextRecognitionResult filterTextRectanglesFromRectangleObservations:](self, "filterTextRectanglesFromRectangleObservations:", self->_rectangleObservations);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[VKCTextRecognitionResult setFilteredNormalizedRectangleQuads:](self, "setFilteredNormalizedRectangleQuads:", v6);
}

- (id)filterTextRectanglesFromRectangleObservations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;

  if (a3)
  {
    v4 = a3;
    -[VKCTextRecognitionResult sourceDocument](self, "sourceDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "boundingQuad");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "normalizationSize");
    v8 = v7;
    v10 = v9;

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__VKCTextRecognitionResult_filterTextRectanglesFromRectangleObservations___block_invoke;
    v14[3] = &unk_1E9463FA8;
    v16 = v8;
    v17 = v10;
    v15 = v5;
    v11 = v5;
    objc_msgSend(v4, "vk_compactMap:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

id __74__VKCTextRecognitionResult_filterTextRectanglesFromRectangleObservations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
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
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  _QWORD v26[8];
  _QWORD v27[4];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;

  v3 = a2;
  objc_msgSend(v3, "vkQuad");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0DBECD8]);
  objc_msgSend(v4, "topLeft");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "topRight");
  v11 = v10;
  v13 = v12;
  objc_msgSend(v4, "bottomRight");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v4, "bottomLeft");
  v20 = (void *)objc_msgSend(v5, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v7, v9, v11, v13, v15, v17, v18, v19, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "outputRegionWithContentsOfQuad:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  objc_msgSend(v4, "area");
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __74__VKCTextRecognitionResult_filterTextRectanglesFromRectangleObservations___block_invoke_2;
  v26[3] = &unk_1E9463F80;
  v26[6] = v22;
  v26[7] = 0x3FD999999999999ALL;
  v26[4] = v27;
  v26[5] = &v28;
  objc_msgSend(v21, "enumerateContentsWithTypes:usingBlock:", 8, v26);
  if (*((_BYTE *)v29 + 24))
    v23 = 0;
  else
    v23 = v4;
  v24 = v23;
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v28, 8);

  return v24;
}

void __74__VKCTextRecognitionResult_filterTextRectanglesFromRectangleObservations___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  double v6;
  id v7;

  objc_msgSend(a2, "boundingQuad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vkQuad");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "area");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  if (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) / *(double *)(a1 + 48) > *(double *)(a1 + 56))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }

}

- (VKTextRange)vk_documentRange
{
  VKTextRange *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  VKTextRange *v8;

  v3 = [VKTextRange alloc];
  -[VKCTextRecognitionResult sourceVNDocument](self, "sourceVNDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getTranscript");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "vk_range");
  v8 = -[VKTextRange initWithRange:](v3, "initWithRange:", v6, v7);

  return v8;
}

- (id)adjustTextRangeToSelectableRange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[5];

  v4 = a3;
  if ((objc_msgSend(v4, "containsMultipleRanges") & 1) != 0)
  {
    objc_msgSend(v4, "rangeArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__VKCTextRecognitionResult_adjustTextRangeToSelectableRange___block_invoke;
    v9[3] = &unk_1E9463FD0;
    v9[4] = self;
    objc_msgSend(v5, "vk_compactMap:", v9);
    v4 = (id)objc_claimAutoreleasedReturnValue();

    +[VKTextRange rangeWithVKRanges:](VKTextRange, "rangeWithVKRanges:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VKCTextRecognitionResult _adjustTextRangeToSelectableRange:](self, "_adjustTextRangeToSelectableRange:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;

  return v7;
}

uint64_t __61__VKCTextRecognitionResult_adjustTextRangeToSelectableRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_adjustTextRangeToSelectableRange:", a2);
}

- (id)_adjustTextRangeToSelectableRange:(id)a3
{
  VKTextRange *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  VKTextRange *v15;
  NSObject *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  int v34;
  uint64_t v35;
  NSRange v36;
  NSRange v37;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = (VKTextRange *)a3;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKTextRange start](v4, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKTextRange end](v4, "end");
  v7 = objc_claimAutoreleasedReturnValue();
  -[VKCTextRecognitionResult text](self, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v9 = objc_msgSend(v8, "vk_range");
    v11 = v10;
    v12 = objc_msgSend(v6, "offset");
    if (VKMRangeContainsIndex(v9, v11, v12))
    {
      if ((objc_msgSend(v5, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", v12)) & 1) == 0)
      {
        -[VKCTextRecognitionResult smallestSelectableRangeForPosition:](self, "smallestSelectableRangeForPosition:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "start");
        v14 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v14;
      }
    }
    else
    {
      v16 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v27 = objc_msgSend(v6, "offset");
        v36.location = v9;
        v36.length = v11;
        NSStringFromRange(v36);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKCTextRecognitionResult request](self, "request");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218498;
        v30 = v27;
        v31 = 2112;
        v32 = v22;
        v33 = 1024;
        v34 = objc_msgSend(v28, "requestID");
        _os_log_error_impl(&dword_1D2E0D000, v16, OS_LOG_TYPE_ERROR, "AdjustTextRange, but the start offset is outside of the text's total range. StartOffset:%lu range %@, id: %d", buf, 0x1Cu);

      }
    }
    v17 = -[NSObject offset](v7, "offset", v27);
    v18 = objc_msgSend(v8, "length");
    if (v17 >= v18 - 1)
      v17 = v18 - 1;
    if (VKMRangeContainsIndex(v9, v11, v17))
    {
      if ((objc_msgSend(v5, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", v17)) & 1) != 0)
      {
LABEL_18:
        v15 = -[VKTextRange initWithStart:end:]([VKTextRange alloc], "initWithStart:end:", v6, v7);

        goto LABEL_19;
      }
      -[VKCTextRecognitionResult smallestSelectableRangeForPosition:](self, "smallestSelectableRangeForPosition:", v7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "end");
      v20 = v7;
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v23 = -[NSObject offset](v7, "offset");
        v37.location = v9;
        v37.length = v11;
        NSStringFromRange(v37);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[VKCTextRecognitionResult request](self, "request");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "requestID");
        *(_DWORD *)buf = 134218498;
        v30 = v23;
        v31 = 2112;
        v32 = v24;
        v33 = 1024;
        v34 = v26;
        _os_log_error_impl(&dword_1D2E0D000, v20, OS_LOG_TYPE_ERROR, "AdjustTextRange, but the end offset is outside of the text's total range. endOffset:%lu range %@, id: %d", buf, 0x1Cu);

      }
      v19 = v20;
    }

    goto LABEL_18;
  }
  v15 = v4;
LABEL_19:

  return v15;
}

- (id)smallestSelectableRangeForPosition:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  VKTextRange *v13;

  v4 = a3;
  -[VKCTextRecognitionResult sourceDocument](self, "sourceDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "offset");

  -[VKCTextRecognitionResult text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length") - 1;

  if (v6 >= v8)
    v9 = v8;
  else
    v9 = v6;
  objc_msgSend(v5, "contentRegionOfType:containingTextAtIndex:", 48, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_msgSend(v5, "rangeOfContentRegion:", v10);
    v13 = -[VKTextRange initWithRange:]([VKTextRange alloc], "initWithRange:", v11, v12);
  }
  else
  {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((region) != nil)", "-[VKCTextRecognitionResult smallestSelectableRangeForPosition:]", 0, 0, CFSTR("Expected non-nil value for '%s'"), "region");
    v13 = 0;
  }

  return v13;
}

- (id)rangeOfWordForPosition:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  -[VKCTextRecognitionResult sourceVNDocument](self, "sourceVNDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "offset");

  -[VKCTextRecognitionResult text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length") - 1;

  if (v6 >= v8)
    v9 = v8;
  else
    v9 = v6;
  objc_msgSend(v5, "textBlockOfTypes:containingTextAtIndex:", 16, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "rangeOfTextBlock:", v10);
  +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)rangeOfLineForPosition:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  -[VKCTextRecognitionResult sourceVNDocument](self, "sourceVNDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "offset");

  -[VKCTextRecognitionResult text](self, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length") - 1;

  if (v6 >= v8)
    v9 = v8;
  else
    v9 = v6;
  objc_msgSend(v5, "textBlockOfTypes:containingTextAtIndex:", 8, v9 & ~(v9 >> 63));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "rangeOfTextBlock:", v10);
  +[VKTextRange rangeWithNSRange:](VKTextRange, "rangeWithNSRange:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)characterRangeAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;

  y = a3.y;
  x = a3.x;
  -[VKCTextRecognitionResult vk_documentRange](self, "vk_documentRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCTextRecognitionResult closestPositionToPoint:withinRange:maxDistance:](self, "closestPositionToPoint:withinRange:maxDistance:", v6, 0, x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[VKCTextRecognitionResult smallestSelectableRangeForPosition:](self, "smallestSelectableRangeForPosition:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4
{
  return -[VKCTextRecognitionResult closestPositionToPoint:withinRange:maxDistance:](self, "closestPositionToPoint:withinRange:maxDistance:", a4, 0x7FFFFFFFFFFFFFFFLL, a3.x, a3.y);
}

- (id)closestPositionToPoint:(CGPoint)a3 withinRange:(id)a4 maxDistance:(int64_t)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  VKTextPosition *v22;
  unint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;

  v7 = a4;
  VKMFlipPoint();
  v9 = v8;
  v11 = v10;
  -[VKCTextRecognitionResult sourceVNDocument](self, "sourceVNDocument");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "closestTextBlockOfTypes:toPoint:maximumPixelDistance:", 48, a5, v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "vk_textBlock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14
    && (v15 = objc_msgSend(v7, "nsRange"),
        v17 = v16,
        v18 = objc_msgSend(v12, "rangeOfTextBlock:", v14),
        v20 = VKMClampRange(v18, v19, v15, v17),
        v20 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v23 = v20;
    v24 = v21;
    -[VKCTextRecognitionResult textDelegate](self, "textDelegate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v25)
    {
      -[VKCTextRecognitionResult textDelegate](self, "textDelegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "selectedRangeForTextRecognitionResult:", self);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v27, "nsRange");
      v29 = v28;

      -[VKCTextRecognitionResult textDelegate](self, "textDelegate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "preSelectionChangeSelectedRangeForTextRecognitionResult:", self);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[VKCTextRecognitionResult textDelegate](self, "textDelegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "draggedRectEdgeForTextRecognitionResult:", self);

      v34 = v23 + v24;
      if (v36 == v23 && v29 == v24 || v34 < 1 || v36 + v29 > (unint64_t)v34 || !v29)
      {
        if (v33 == 2)
        {
          if (v23 <= objc_msgSend(v31, "endOffset"))
            v33 = 2;
          else
            v33 = 8;
        }
        else if (v33 == 8)
        {
          if (v23 >= objc_msgSend(v31, "startOffset"))
            v33 = 8;
          else
            v33 = 2;
        }
        if (v33 != 8)
          v34 = v23;
      }

    }
    else
    {
      v34 = v23;
    }
    v22 = -[VKTextPosition initWithOffset:]([VKTextPosition alloc], "initWithOffset:", v34);
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (id)closestBlockOfType:(unint64_t)a3 toPoint:(CGPoint)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  VKMFlipPoint();
  v7 = v6;
  v9 = v8;
  -[VKCTextRecognitionResult sourceVNDocument](self, "sourceVNDocument");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "closestTextBlockOfTypes:toPoint:maximumPixelDistance:", a3, 0x7FFFFFFFFFFFFFFFLL, v7, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  v12 = a3;
  -[VKCTextRecognitionResult sourceVNDocument](self, "sourceVNDocument");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "nsRange");
  v16 = v15;

  objc_msgSend(v13, "textBlockWithCharacterRange:", v14, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "vkQuad");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "quadByConvertingFromNormalizedRectToView:contentsRect:", v11, x, y, width, height);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "boundingBox");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = v21;
  v29 = v23;
  v30 = v25;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (id)selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5
{
  return -[VKCTextRecognitionResult selectionRectsForRange:documentView:contentRect:addTranscript:](self, "selectionRectsForRange:documentView:contentRect:addTranscript:", a3, a4, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (id)selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5 addTranscript:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  BOOL v24;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a4;
  v14 = a3;
  if (objc_msgSend(v14, "containsMultipleRanges"))
  {
    objc_msgSend(v14, "rangeArray");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __90__VKCTextRecognitionResult_selectionRectsForRange_documentView_contentRect_addTranscript___block_invoke;
    v18[3] = &unk_1E9463FF8;
    v18[4] = self;
    v19 = v13;
    v20 = x;
    v21 = y;
    v22 = width;
    v23 = height;
    v24 = v6;
    objc_msgSend(v15, "vk_flatMap:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[VKCTextRecognitionResult _selectionRectsForRange:documentView:contentRect:addTranscript:](self, "_selectionRectsForRange:documentView:contentRect:addTranscript:", v14, v13, v6, x, y, width, height);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

uint64_t __90__VKCTextRecognitionResult_selectionRectsForRange_documentView_contentRect_addTranscript___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_selectionRectsForRange:documentView:contentRect:addTranscript:", a2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (id)_selectionRectsForRange:(id)a3 documentView:(id)a4 contentRect:(CGRect)a5 addTranscript:(BOOL)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD v25[4];
  BOOL v26;
  _QWORD v27[4];
  id v28;
  id v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  BOOL v34;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3;
  v14 = a4;
  if ((objc_msgSend(v13, "isEmpty") & 1) != 0)
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[VKCTextRecognitionResult sourceVNDocument](self, "sourceVNDocument");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v13, "nsRange");
    objc_msgSend(v16, "textBlockWithCharacterRange:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v19, "getLines");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __91__VKCTextRecognitionResult__selectionRectsForRange_documentView_contentRect_addTranscript___block_invoke;
    v27[3] = &unk_1E9464020;
    v30 = x;
    v31 = y;
    v32 = width;
    v33 = height;
    v34 = a6;
    v28 = v14;
    v29 = v20;
    v23 = v20;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v27);

    v25[0] = v22;
    v25[1] = 3221225472;
    v25[2] = __91__VKCTextRecognitionResult__selectionRectsForRange_documentView_contentRect_addTranscript___block_invoke_2;
    v25[3] = &__block_descriptor_33_e14__32__0_8q16q24l;
    v26 = a6;
    objc_msgSend(v23, "vk_compactMap:", v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

void __91__VKCTextRecognitionResult__selectionRectsForRange_documentView_contentRect_addTranscript___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  VKCQuadTranscriptTuple *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "vkQuad");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "quadByConvertingFromNormalizedRectToView:contentsRect:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "getCROutputRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLayoutDirection:", objc_msgSend(v5, "layoutDirection"));

  if (*(_BYTE *)(a1 + 80))
  {
    v6 = objc_alloc_init(VKCQuadTranscriptTuple);
    -[VKCQuadTranscriptTuple setQuad:](v6, "setQuad:", v4);
    objc_msgSend(v8, "getTranscript");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKCQuadTranscriptTuple setTranscript:](v6, "setTranscript:", v7);

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }

}

VKTextSelectionRect *__91__VKCTextRecognitionResult__selectionRectsForRange_documentView_contentRect_addTranscript___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL8 v13;
  _BOOL8 v14;
  void *v15;
  VKTextSelectionRect *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  VKTextSelectionRect *v21;
  VKTextSelectionRect *v22;

  v7 = a2;
  v8 = v7;
  if (*(_BYTE *)(a1 + 32))
  {
    v9 = objc_opt_class();
    VKDynamicCast(v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "quad");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transcript");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = v7;
    v12 = 0;
  }
  v13 = a3 == 0;
  v14 = a3 == a4;
  objc_msgSend(v11, "boundingBox");
  objc_msgSend(v11, "quadFromSubtractingPoint:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [VKTextSelectionRect alloc];
  objc_msgSend(v11, "boundingBox");
  v21 = -[VKTextSelectionRect initWithRect:containsStart:containsEnd:layoutDirection:quad:](v16, "initWithRect:containsStart:containsEnd:layoutDirection:quad:", v13, v14, objc_msgSend(v11, "layoutDirection"), v15, v17, v18, v19, v20);
  v22 = v21;
  if (*(_BYTE *)(a1 + 32))
    -[VKTextSelectionRect set_transcript:](v21, "set_transcript:", v12);

  return v22;
}

- (id)normalizedSelectionQuadsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;
  _QWORD v9[5];

  v4 = a3;
  if (objc_msgSend(v4, "containsMultipleRanges"))
  {
    objc_msgSend(v4, "rangeArray");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__VKCTextRecognitionResult_normalizedSelectionQuadsForRange___block_invoke;
    v9[3] = &unk_1E9464068;
    v9[4] = self;
    objc_msgSend(v5, "vk_flatMap:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    -[VKCTextRecognitionResult _normalizedSelectionQuadsForRange:](self, "_normalizedSelectionQuadsForRange:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
}

uint64_t __61__VKCTextRecognitionResult_normalizedSelectionQuadsForRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_normalizedSelectionQuadsForRange:", a2);
}

- (id)_normalizedSelectionQuadsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  if (objc_msgSend(v4, "containsMultipleRanges"))
  {
    -[VKCTextRecognitionResult request](self, "request");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!range.containsMultipleRanges", "-[VKCTextRecognitionResult _normalizedSelectionQuadsForRange:]", 0, 0, CFSTR("_normalizedSelectionQuadsForRange being sent a range with multiple ranges id: %d"), objc_msgSend(v5, "requestID"));

  }
  if ((objc_msgSend(v4, "isEmpty") & 1) != 0)
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[VKCTextRecognitionResult sourceVNDocument](self, "sourceVNDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "nsRange");
    objc_msgSend(v7, "textBlockWithCharacterRange:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "getLines");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "vk_compactMap:", &__block_literal_global_148_0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __62__VKCTextRecognitionResult__normalizedSelectionQuadsForRange___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vkQuad");
}

- (id)formRegionsExcluding:(id)a3 updateExcludedFields:(BOOL)a4
{
  void *v4;
  void *v5;
  __int128 v6;
  unint64_t v7;
  void *v8;
  VKCFormRegion *v9;
  NSObject *v10;
  void *v11;
  int v12;
  __int128 v14;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CRDocumentOutputRegion detectedFieldRegionsExcludingFields:updateExcludedFields:](self->_sourceDocument, "detectedFieldRegionsExcludingFields:updateExcludedFields:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  if (objc_msgSend(v4, "count"))
  {
    v7 = 0;
    *(_QWORD *)&v6 = 136315394;
    v14 = v6;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v7, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[VKCFormRegion initWithSourceRegion:]([VKCFormRegion alloc], "initWithSourceRegion:", v8);
      v10 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        -[VKCFormRegion debugDescription](v9, "debugDescription");
        v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v16 = objc_msgSend(v17, "UTF8String");
        -[VKCTextRecognitionResult request](self, "request");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "requestID");
        *(_DWORD *)buf = v14;
        v19 = v16;
        v20 = 1024;
        v21 = v12;
        _os_log_debug_impl(&dword_1D2E0D000, v10, OS_LOG_TYPE_DEBUG, "Adding form region %s, id: %d", buf, 0x12u);

      }
      objc_msgSend(v5, "addObject:", v9);

      ++v7;
    }
    while (objc_msgSend(v4, "count") > v7);
  }

  return v5;
}

- (id)proposedFormRegionForPoint:(CGPoint)a3 existingFields:(id)a4 formSize:(CGSize)a5
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  VKCFormRegion *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  height = a5.height;
  width = a5.width;
  y = a3.y;
  x = a3.x;
  v26 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "crFormFieldWithSize:", width, height, (_QWORD)v21);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  -[CRDocumentOutputRegion proposedFieldForPoint:existingFields:](self->_sourceDocument, "proposedFieldForPoint:existingFields:", v11, x, y);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
    v19 = -[VKCFormRegion initWithSourceRegion:]([VKCFormRegion alloc], "initWithSourceRegion:", v18);
  else
    v19 = 0;

  return v19;
}

- (id)proposedFormRegionForPoint:(CGPoint)a3 existingFormFields:(id)a4
{
  void *v4;
  VKCFormRegion *v5;

  -[CRDocumentOutputRegion proposedFieldForPoint:existingFields:](self->_sourceDocument, "proposedFieldForPoint:existingFields:", a4, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[VKCFormRegion initWithSourceRegion:]([VKCFormRegion alloc], "initWithSourceRegion:", v4);
  else
    v5 = 0;

  return v5;
}

- (NSArray)formRegions
{
  void *v2;
  void *v3;
  __int128 v4;
  unint64_t v5;
  void *v6;
  VKCFormRegion *v7;
  NSObject *v8;
  void *v9;
  int v10;
  __int128 v12;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CRDocumentOutputRegion contentsWithTypes:](self->_sourceDocument, "contentsWithTypes:", 0x2000);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v2, "count"));
  if (objc_msgSend(v2, "count"))
  {
    v5 = 0;
    *(_QWORD *)&v4 = 136315394;
    v12 = v4;
    do
    {
      objc_msgSend(v2, "objectAtIndexedSubscript:", v5, v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[VKCFormRegion initWithSourceRegion:]([VKCFormRegion alloc], "initWithSourceRegion:", v6);
      v8 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.processing");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VKCFormRegion debugDescription](v7, "debugDescription");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v14 = objc_msgSend(v15, "UTF8String");
        -[VKCTextRecognitionResult request](self, "request");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "requestID");
        *(_DWORD *)buf = v12;
        v17 = v14;
        v18 = 1024;
        v19 = v10;
        _os_log_debug_impl(&dword_1D2E0D000, v8, OS_LOG_TYPE_DEBUG, "Adding form region %s, id: %d", buf, 0x12u);

      }
      objc_msgSend(v3, "addObject:", v7);

      ++v5;
    }
    while (objc_msgSend(v2, "count") > v5);
  }

  return (NSArray *)v3;
}

- (unint64_t)recognitionConfidence
{
  int v2;

  v2 = -[CRDocumentOutputRegion formness](self->_sourceDocument, "formness");
  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (VKCImageAnalyzerRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  objc_storeStrong((id *)&self->_request, a3);
}

- (VKCTextRecognitionResultTextDelegate)textDelegate
{
  return (VKCTextRecognitionResultTextDelegate *)objc_loadWeakRetained((id *)&self->_textDelegate);
}

- (void)setTextDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_textDelegate, a3);
}

- (CRDocumentOutputRegion)sourceDocument
{
  return self->_sourceDocument;
}

- (void)setSourceDocument:(id)a3
{
  objc_storeStrong((id *)&self->_sourceDocument, a3);
}

- (VNDocumentObservation)sourceVNDocument
{
  return self->_sourceVNDocument;
}

- (void)setSourceVNDocument:(id)a3
{
  objc_storeStrong((id *)&self->_sourceVNDocument, a3);
}

- (unint64_t)imageSource
{
  return self->_imageSource;
}

- (void)setImageSource:(unint64_t)a3
{
  self->_imageSource = a3;
}

- (NSArray)textElements
{
  return self->_textElements;
}

- (void)setTextElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)dataDetectors
{
  return self->_dataDetectors;
}

- (void)setDataDetectors:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetectors, a3);
}

- (NSArray)unfilteredDataDetectors
{
  return self->_unfilteredDataDetectors;
}

- (NSArray)inspectableElements
{
  return self->_inspectableElements;
}

- (void)setInspectableElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setNormalizedTextLineBoundingBoxes:(id)a3
{
  objc_storeStrong((id *)&self->_normalizedTextLineBoundingBoxes, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
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

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
  objc_storeStrong((id *)&self->_attributedText, a3);
}

- (NSDictionary)attributedTextRangeMapping
{
  return self->_attributedTextRangeMapping;
}

- (void)setAttributedTextRangeMapping:(id)a3
{
  objc_storeStrong((id *)&self->_attributedTextRangeMapping, a3);
}

- (NSArray)requestLocales
{
  return self->_requestLocales;
}

- (void)setRequestLocales:(id)a3
{
  objc_storeStrong((id *)&self->_requestLocales, a3);
}

- (NSArray)requestBarcodeSymbologies
{
  return self->_requestBarcodeSymbologies;
}

- (void)setRequestBarcodeSymbologies:(id)a3
{
  objc_storeStrong((id *)&self->_requestBarcodeSymbologies, a3);
}

- (void)setLocaleMap:(id)a3
{
  objc_storeStrong((id *)&self->_localeMap, a3);
}

- (NSArray)rectangleObservations
{
  return self->_rectangleObservations;
}

- (NSArray)filteredNormalizedRectangleQuads
{
  return self->_filteredNormalizedRectangleQuads;
}

- (void)setFilteredNormalizedRectangleQuads:(id)a3
{
  objc_storeStrong((id *)&self->_filteredNormalizedRectangleQuads, a3);
}

- (NSArray)mrcDataDetectors
{
  return self->_mrcDataDetectors;
}

- (void)setMrcDataDetectors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSArray)filteredTextDataDetectors
{
  return self->_filteredTextDataDetectors;
}

- (void)setFilteredTextDataDetectors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSArray)unfilteredTextDataDetectors
{
  return self->_unfilteredTextDataDetectors;
}

- (void)setUnfilteredTextDataDetectors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (VNRecognizedTextBlockObservation)titleObservation
{
  return self->_titleObservation;
}

- (void)setTitleObservation:(id)a3
{
  objc_storeStrong((id *)&self->_titleObservation, a3);
}

- (NSString)buildString
{
  return self->_buildString;
}

- (void)setBuildString:(id)a3
{
  objc_storeStrong((id *)&self->_buildString, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSIndexSet)richPasteBoardIndexes
{
  return self->_richPasteBoardIndexes;
}

- (void)setRichPasteBoardIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_richPasteBoardIndexes, a3);
}

- (CROutputRegion)crTitleOutput
{
  return self->_crTitleOutput;
}

- (void)setCrTitleOutput:(id)a3
{
  objc_storeStrong((id *)&self->_crTitleOutput, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crTitleOutput, 0);
  objc_storeStrong((id *)&self->_richPasteBoardIndexes, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_buildString, 0);
  objc_storeStrong((id *)&self->_titleObservation, 0);
  objc_storeStrong((id *)&self->_unfilteredTextDataDetectors, 0);
  objc_storeStrong((id *)&self->_filteredTextDataDetectors, 0);
  objc_storeStrong((id *)&self->_mrcDataDetectors, 0);
  objc_storeStrong((id *)&self->_filteredNormalizedRectangleQuads, 0);
  objc_storeStrong((id *)&self->_rectangleObservations, 0);
  objc_storeStrong((id *)&self->_localeMap, 0);
  objc_storeStrong((id *)&self->_requestBarcodeSymbologies, 0);
  objc_storeStrong((id *)&self->_requestLocales, 0);
  objc_storeStrong((id *)&self->_attributedTextRangeMapping, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_normalizedTextLineBoundingBoxes, 0);
  objc_storeStrong((id *)&self->_inspectableElements, 0);
  objc_storeStrong((id *)&self->_unfilteredDataDetectors, 0);
  objc_storeStrong((id *)&self->_dataDetectors, 0);
  objc_storeStrong((id *)&self->_textElements, 0);
  objc_storeStrong((id *)&self->_sourceVNDocument, 0);
  objc_storeStrong((id *)&self->_sourceDocument, 0);
  objc_destroyWeak((id *)&self->_textDelegate);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
