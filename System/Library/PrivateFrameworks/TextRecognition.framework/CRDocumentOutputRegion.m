@implementation CRDocumentOutputRegion

- (CRDocumentOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8;
  __objc2_class *v9;
  __objc2_class *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  CRDocumentOutputRegion *v15;
  _BOOL4 v16;
  void *v17;
  uint64_t v18;
  CROutputRegion *title;
  void *v20;
  CRDocumentOutputRegionMetadata *v21;
  CRDocumentOutputRegionMetadata *additionalMetadata;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  NSObject *v38;
  os_signpost_id_t v40;
  unint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  objc_super v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  uint64_t v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = CRDocumentOutputRegionMetadata;
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v10 = CRDocumentOutputRegionMetadata;
  v11 = (id)CRSignpostLog_signPostOSLog;
  v12 = os_signpost_id_generate(v11);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v13 = (id)CRSignpostLog_signPostOSLog;
  v14 = v13;
  v41 = v12 - 1;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "OCRDeserializationTime", ", buf, 2u);
  }

  v46.receiver = self;
  v46.super_class = (Class)CRDocumentOutputRegion;
  v15 = -[CROutputRegion initWithCRCodableDataRepresentation:version:offset:](&v46, sel_initWithCRCodableDataRepresentation_version_offset_, v8, a4, a5);
  if (v15)
  {
    v16 = a4 >= 3
       && +[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v8, a5) > 0;
    +[CRCodingUtilities objectDataFromEncodingData:offset:](CRCodingUtilities, "objectDataFromEncodingData:offset:", v8, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[CROutputRegion outputRegionWithCRCodableDataRepresentation:](CROutputRegion, "outputRegionWithCRCodableDataRepresentation:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    title = v15->_title;
    v15->_title = (CROutputRegion *)v18;

    if (v16)
    {
      v15->_documentRevision = +[CRCodingUtilities unsignedIntegerFromEncodingData:offset:](CRCodingUtilities, "unsignedIntegerFromEncodingData:offset:", v8, a5);
      +[CRCodingUtilities objectDataFromEncodingData:offset:](CRCodingUtilities, "objectDataFromEncodingData:offset:", v8, a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CRDocumentOutputRegionMetadata;
      if (v20)
      {
        v21 = -[CRDocumentOutputRegionMetadata initWithCRCodableDataRepresentation:]([CRDocumentOutputRegionMetadata alloc], "initWithCRCodableDataRepresentation:", v20);
        additionalMetadata = v15->_additionalMetadata;
        v15->_additionalMetadata = v21;

      }
      v9 = CRDocumentOutputRegionMetadata;
    }
    else
    {
      v15->_documentRevision = 0;
      v9 = CRDocumentOutputRegionMetadata;
      v10 = CRDocumentOutputRegionMetadata;
    }
    if (a4 <= 9)
    {
      v40 = v12;
      v23 = (void *)objc_opt_new();
      v24 = (void *)objc_opt_new();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      -[CROutputRegion children](v15, "children");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
      if (v26)
      {
        v27 = v26;
        v28 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v27; ++i)
          {
            if (*(_QWORD *)v43 != v28)
              objc_enumerationMutation(v25);
            v30 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            if (objc_msgSend(v30, "type", v40) == 64)
            {
              objc_msgSend(v30, "contentsWithTypes:", 2);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "addObjectsFromArray:", v31);
              objc_msgSend(v24, "addObject:", v30);

            }
            else
            {
              objc_msgSend(v23, "addObject:", v30);
            }
          }
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
        }
        while (v27);
      }

      v12 = v40;
      v9 = CRDocumentOutputRegionMetadata;
      v10 = CRDocumentOutputRegionMetadata;
      if (objc_msgSend(v24, "count"))
      {
        CROSLogForCategory(0);
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = objc_msgSend(v24, "count");
          -[CROutputRegion children](v15, "children");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "count");
          v36 = objc_msgSend(v23, "count");
          *(_DWORD *)buf = 134218496;
          v48 = v33;
          v10 = CRDocumentOutputRegionMetadata;
          v49 = 2048;
          v50 = v35;
          v51 = 2048;
          v52 = v36;
          _os_log_impl(&dword_1D4FB8000, v32, OS_LOG_TYPE_DEFAULT, "Encountered %ld table(s) in hierarchy. Updating children from %ld to %ld", buf, 0x20u);

        }
        -[CRDocumentOutputRegion setChildren:](v15, "setChildren:", v23);
        -[CROutputRegion setTableRegions:](v15, "setTableRegions:", v24);
      }

    }
  }
  if (v9[62].info != (__objc2_class_ro *)-1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v37 = v10[63].isa;
  v38 = v37;
  if (v41 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v38, OS_SIGNPOST_INTERVAL_END, v12, "OCRDeserializationTime", ", buf, 2u);
  }

  return v15;
}

+ (id)documentWithRegions:(id)a3 title:(id)a4 confidence:(int)a5 imageSize:(CGSize)a6
{
  double height;
  double width;
  uint64_t v8;
  id v10;
  id v11;
  CRDocumentOutputRegion *v12;
  CRNormalizedQuad *v13;

  height = a6.height;
  width = a6.width;
  v8 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a3;
  v12 = -[CROutputRegion initWithConfidence:baselineAngle:]([CRDocumentOutputRegion alloc], "initWithConfidence:baselineAngle:", v8, 0.0);
  -[CRDocumentOutputRegion setTitle:](v12, "setTitle:", v10);

  v13 = -[CRNormalizedQuad initWithNormalizedBoundingBox:size:]([CRNormalizedQuad alloc], "initWithNormalizedBoundingBox:size:", 0.0, 0.0, 1.0, 1.0, width, height);
  -[CROutputRegion setBoundingQuad:](v12, "setBoundingQuad:", v13);

  -[CROutputRegion setShouldComputeBoundsFromChildren:](v12, "setShouldComputeBoundsFromChildren:", 0);
  -[CRDocumentOutputRegion setChildren:](v12, "setChildren:", v11);

  -[CRDocumentOutputRegion setDocumentRevision:](v12, "setDocumentRevision:", 1);
  return v12;
}

+ (id)documentWithLines:(id)a3 title:(id)a4 confidence:(int)a5 imageSize:(CGSize)a6
{
  double height;
  double width;
  uint64_t v8;
  id v10;
  id v11;
  void *v12;

  height = a6.height;
  width = a6.width;
  v8 = *(_QWORD *)&a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend((id)objc_opt_class(), "documentWithRegions:title:confidence:imageSize:", v11, v10, v8, width, height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)type
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  CRDocumentOutputRegion *v4;
  CRDocumentOutputRegion *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  objc_super v19;

  v4 = (CRDocumentOutputRegion *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CRDocumentOutputRegion title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[CRDocumentOutputRegion title](self, "title");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRDocumentOutputRegion title](v5, "title");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

        if (!v9)
          goto LABEL_11;
      }
      else
      {
        -[CRDocumentOutputRegion title](v5, "title");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
LABEL_11:
          v10 = 0;
LABEL_14:

          goto LABEL_15;
        }
      }
      -[CRDocumentOutputRegion additionalMetadata](self, "additionalMetadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CRDocumentOutputRegion additionalMetadata](v5, "additionalMetadata");
      v13 = objc_claimAutoreleasedReturnValue();
      if (v12 == (void *)v13)
      {

      }
      else
      {
        v14 = (void *)v13;
        -[CRDocumentOutputRegion additionalMetadata](self, "additionalMetadata");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRDocumentOutputRegion additionalMetadata](v5, "additionalMetadata");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v15, "isEqual:", v16);

        if (!v17)
          goto LABEL_11;
      }
      v19.receiver = self;
      v19.super_class = (Class)CRDocumentOutputRegion;
      v10 = -[CROutputRegion isEqual:](&v19, sel_isEqual_, v5);
      goto LABEL_14;
    }
    v10 = 0;
  }
LABEL_15:

  return v10;
}

- (void)setChildren:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRDocumentOutputRegion;
  -[CROutputRegion setChildren:](&v4, sel_setChildren_, a3);
  -[CRDocumentOutputRegion setCachedLayoutComponents:](self, "setCachedLayoutComponents:", 0);
}

- (CRDocumentOutputRegion)outputRegionWithContentsOfQuad:(id)a3
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRDocumentOutputRegion;
  v3 = a3;
  -[CROutputRegion outputRegionWithContentsOfQuad:](&v6, sel_outputRegionWithContentsOfQuad_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoundingQuad:", v3, v6.receiver, v6.super_class);

  return (CRDocumentOutputRegion *)v4;
}

- (CRDocumentOutputRegion)outputRegionWithContentsBetweenStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  void *v10;
  objc_super v12;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  if (-[CROutputRegion shouldComputeBoundsFromChildren](self, "shouldComputeBoundsFromChildren"))
  {
    v12.receiver = self;
    v12.super_class = (Class)CRDocumentOutputRegion;
    -[CROutputRegion outputRegionWithContentsBetweenStartPoint:endPoint:](&v12, sel_outputRegionWithContentsBetweenStartPoint_endPoint_, v7, v6, x, y);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = (void *)-[CRDocumentOutputRegion copy](self, "copy");
    objc_msgSend(v10, "setShouldComputeBoundsFromChildren:", 1);
    objc_msgSend(v10, "outputRegionWithContentsBetweenStartPoint:endPoint:", v7, v6, x, y);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (CRDocumentOutputRegion *)v9;
}

- (CRDocumentOutputRegion)outputRegionWithContentsOfCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  objc_super v9;

  length = a3.length;
  location = a3.location;
  if (-[CROutputRegion shouldComputeBoundsFromChildren](self, "shouldComputeBoundsFromChildren"))
  {
    v9.receiver = self;
    v9.super_class = (Class)CRDocumentOutputRegion;
    -[CROutputRegion outputRegionWithContentsOfCharacterRange:](&v9, sel_outputRegionWithContentsOfCharacterRange_, location, length);
    return (CRDocumentOutputRegion *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = -[CRDocumentOutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](self, "copyWithZone:copyChildren:copyCandidates:deepCopy:", 0, 1, 0, 0);
    objc_msgSend(v7, "setShouldComputeBoundsFromChildren:", 1);
    objc_msgSend(v7, "outputRegionWithContentsOfCharacterRange:", location, length);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return (CRDocumentOutputRegion *)v8;
  }
}

- (id)crCodableDataRepresentation
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  objc_super v15;
  uint8_t buf[16];

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v3 = (id)CRSignpostLog_signPostOSLog;
  v4 = os_signpost_id_generate(v3);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v5 = (id)CRSignpostLog_signPostOSLog;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "OCRSerializationTime", ", buf, 2u);
  }

  v7 = (void *)MEMORY[0x1E0C99DF0];
  v15.receiver = self;
  v15.super_class = (Class)CRDocumentOutputRegion;
  -[CROutputRegion crCodableDataRepresentation](&v15, sel_crCodableDataRepresentation);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataWithData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", 1, v9);
  -[CRDocumentOutputRegion title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v10, v9);

  +[CRCodingUtilities appendUInteger:toData:](CRCodingUtilities, "appendUInteger:toData:", 1, v9);
  -[CRDocumentOutputRegion additionalMetadata](self, "additionalMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v11, v9);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v12 = (id)CRSignpostLog_signPostOSLog;
  v13 = v12;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v13, OS_SIGNPOST_INTERVAL_END, v4, "OCRSerializationTime", ", buf, 2u);
  }

  return v9;
}

- (BOOL)shouldReprocessDocument
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  float v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[CRDocumentOutputRegion documentRevision](self, "documentRevision") == 1 && self)
  {
    -[CRDocumentOutputRegion additionalMetadata](self, "additionalMetadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CROutputRegion contentsWithTypes:](self, "contentsWithTypes:", 8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v4, "count");
      -[CRDocumentOutputRegion additionalMetadata](self, "additionalMetadata");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "numFilteredRegions");

      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v16;
        v11 = v6;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v16 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "rawConfidence", (_QWORD)v15);
            if (v13 <= 0.6)
              ++v11;
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        }
        while (v9);
      }
      else
      {
        v11 = v6;
      }

      LOBYTE(v3) = (float)((float)v11 / (float)((uint64_t)v3 + v6)) >= 0.75;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (void)collectMetadataForNumFilteredRegions:(int64_t)a3
{
  id v5;

  v5 = (id)objc_opt_new();
  objc_msgSend(v5, "setNumFilteredRegions:", a3);
  -[CRDocumentOutputRegion setAdditionalMetadata:](self, "setAdditionalMetadata:", v5);

}

- (int)formness
{
  int v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__CRDocumentOutputRegion_formness__block_invoke;
  v7[3] = &unk_1E98DA6D8;
  v7[4] = &v12;
  v7[5] = v16;
  v7[6] = &v8;
  -[CROutputRegion enumerateContentsWithTypes:usingBlock:](self, "enumerateContentsWithTypes:usingBlock:", 0x2000, v7);
  if (v9[3])
    v2 = 2;
  else
    v2 = v13[3] != 0;
  CROSLogForCategory(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v13[3];
    v5 = v9[3];
    *(_DWORD *)buf = 136315906;
    v18 = "-[CRDocumentOutputRegion formness]";
    v19 = 2048;
    v20 = v4;
    v21 = 2048;
    v22 = v5;
    v23 = 1024;
    v24 = v2;
    _os_log_impl(&dword_1D4FB8000, v3, OS_LOG_TYPE_DEFAULT, "%s: #fields:%lu #boundedAutoFillable:%lu result:%u", buf, 0x26u);
  }

  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v16, 8);
  return v2;
}

void __34__CRDocumentOutputRegion_formness__block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "fieldSource") == 1)
  {
    ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v3 = v4;
      if (objc_msgSend(v3, "fieldType") == 1)
      {
        if (+[CRFormContentTypeUtilities contentTypeIsAutoFillable:](CRFormContentTypeUtilities, "contentTypeIsAutoFillable:", objc_msgSend(v3, "textContentType")))
        {
          ++*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
          if ((objc_msgSend(v3, "hasBoundedWidth") & 1) != 0 || objc_msgSend(v3, "hasBoundedHeight"))
            ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
        }
      }

    }
  }

}

- (id)detectedFieldRegionsExcludingFields:(id)a3 updateExcludedFields:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  CROSLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[CRDocumentOutputRegion detectedFieldRegionsExcludingFields:updateExcludedFields:]";
    v12 = 2048;
    v13 = objc_msgSend(v6, "count");
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_DEFAULT, "%s: #fields:%lu updateExcludedFields:%d", (uint8_t *)&v10, 0x1Cu);
  }

  +[CRFormUtilities detectedFieldRegionsInDocument:excludingFields:updateExcludedFields:](CRFormUtilities, "detectedFieldRegionsInDocument:excludingFields:updateExcludedFields:", self, v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)proposedFieldForPoint:(CGPoint)a3 existingFields:(id)a4
{
  double y;
  double x;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  int v23;
  const char *v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  y = a3.y;
  x = a3.x;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  CROSLogForCategory(6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315906;
    v24 = "-[CRDocumentOutputRegion proposedFieldForPoint:existingFields:]";
    v25 = 2048;
    v26 = x;
    v27 = 2048;
    v28 = y;
    v29 = 2048;
    v30 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1D4FB8000, v8, OS_LOG_TYPE_DEFAULT, "%s: x:%lf y:%lf #existingFields:%lu", (uint8_t *)&v23, 0x2Au);
  }

  +[CRFormUtilities proposedFieldForPoint:inDocument:existingFields:](CRFormUtilities, "proposedFieldForPoint:inDocument:existingFields:", self, v7, x, y);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CROSLogForCategory(6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "boundingQuad");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "boundingBox");
    v13 = v12;
    objc_msgSend(v9, "boundingQuad");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "boundingBox");
    v16 = v15;
    objc_msgSend(v9, "boundingQuad");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "boundingBox");
    v19 = v18;
    objc_msgSend(v9, "boundingQuad");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "boundingBox");
    v23 = 136316162;
    v24 = "-[CRDocumentOutputRegion proposedFieldForPoint:existingFields:]";
    v25 = 2048;
    v26 = v13;
    v27 = 2048;
    v28 = v16;
    v29 = 2048;
    v30 = v19;
    v31 = 2048;
    v32 = v21;
    _os_log_impl(&dword_1D4FB8000, v10, OS_LOG_TYPE_DEFAULT, "%s: output: x:%lf y:%lf w:%lf h:%lf", (uint8_t *)&v23, 0x34u);

  }
  return v9;
}

- (id)fieldRegionsExcludingAnnotatedFields:(id)a3 updateContentTypeOfAnnotatedFields:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v4 = a4;
  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  CROSLogForCategory(6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "-[CRDocumentOutputRegion fieldRegionsExcludingAnnotatedFields:updateContentTypeOfAnnotatedFields:]";
    v12 = 2048;
    v13 = objc_msgSend(v6, "count");
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_DEFAULT, "%s: #annotatedFields:%lu updateContentType:%d", (uint8_t *)&v10, 0x1Cu);
  }

  +[CRFormUtilities detectedFieldRegionsInDocument:excludingFields:updateExcludedFields:](CRFormUtilities, "detectedFieldRegionsInDocument:excludingFields:updateExcludedFields:", self, v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)layoutComponents
{
  CRDocumentOutputRegion *v2;
  void *v3;
  NSObject *v4;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  unint64_t v29;
  void *v30;
  os_signpost_id_t v31;
  CRDocumentOutputRegion *v32;
  void *v33;
  void *v34;
  void *v35;
  id obj;
  int v37;
  uint64_t v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[16];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v2 = self;
  v51 = *MEMORY[0x1E0C80C00];
  -[CRDocumentOutputRegion cachedLayoutComponents](self, "cachedLayoutComponents");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v4 = (id)CRSignpostLog_signPostOSLog;
    v5 = os_signpost_id_generate(v4);

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v6 = (id)CRSignpostLog_signPostOSLog;
    v7 = v6;
    v8 = v5 - 1;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "OCRLayoutAnalysisTime", ", buf, 2u);
    }

    v35 = (void *)objc_opt_new();
    -[CROutputRegion contentsWithTypes:](v2, "contentsWithTypes:", 64);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion contentsWithTypes:](v2, "contentsWithTypes:", 256);
    v10 = objc_claimAutoreleasedReturnValue();
    -[CROutputRegion contentsWithTypes:](v2, "contentsWithTypes:", 4);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)v10;
    objc_msgSend(v33, "arrayByAddingObjectsFromArray:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "arrayByAddingObjectsFromArray:", v9);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[CROutputRegion contentsWithTypes:](v2, "contentsWithTypes:", 8);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    if (v12)
    {
      v13 = v12;
      v29 = v5 - 1;
      v30 = v9;
      v31 = v5;
      v32 = v2;
      v37 = 0;
      v38 = *(_QWORD *)v45;
      while (1)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v45 != v38)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
          v40 = 0u;
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v16 = v39;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          if (v17)
          {
            v18 = v17;
            v19 = 0;
            v20 = *(_QWORD *)v41;
            do
            {
              for (j = 0; j != v18; ++j)
              {
                if (*(_QWORD *)v41 != v20)
                  objc_enumerationMutation(v16);
                v22 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
                objc_msgSend(v22, "contentsWithTypes:", 8);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v23, "containsObject:", v15))
                {
                  v24 = v22;

                  v19 = v24;
                }

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
            }
            while (v18);

            if (v19)
            {
              objc_opt_class();
              v37 |= objc_opt_isKindOfClass();
              objc_msgSend(v35, "addObject:", v19);
              goto LABEL_28;
            }
          }
          else
          {

          }
          CROSLogForCategory(0);
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D4FB8000, v19, OS_LOG_TYPE_FAULT, "Encountered a line that doesn't belong in a layout component", buf, 2u);
          }
LABEL_28:

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
        if (!v13)
        {
          v5 = v31;
          v2 = v32;
          v8 = v29;
          v9 = v30;
          if ((v37 & 1) != 0)
            -[CROutputRegion _invalidateTranscriptRecursivelyThrough:](v32, "_invalidateTranscriptRecursivelyThrough:", objc_opt_class());
          break;
        }
      }
    }
    objc_msgSend(v35, "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRDocumentOutputRegion setCachedLayoutComponents:](v2, "setCachedLayoutComponents:", v25);

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v26 = (id)CRSignpostLog_signPostOSLog;
    v27 = v26;
    if (v8 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v27, OS_SIGNPOST_INTERVAL_END, v5, "OCRLayoutAnalysisTime", ", buf, 2u);
    }

  }
  -[CRDocumentOutputRegion cachedLayoutComponents](v2, "cachedLayoutComponents");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRDocumentOutputRegion;
  v7 = -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](&v12, sel_copyWithZone_copyChildren_copyCandidates_deepCopy_, a3, a4, a5, a6);
  -[CRDocumentOutputRegion title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTitle:", v8);

  -[CRDocumentOutputRegion additionalMetadata](self, "additionalMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v7, "setAdditionalMetadata:", v10);

  return v7;
}

+ (id)groupedParagraphBlocksFromParagraphs:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v8, "trackingID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setTrackingID:", v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v5);
  }
  +[CRTrackedRegionGroup groupsFromOutputRegions:](CRTrackedRegionGroup, "groupsFromOutputRegions:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v13);
        +[CRTrackedDocumentOutputRegion _blockFromTrackedRegionGroup:trackedType:]((uint64_t)CRTrackedDocumentOutputRegion, *(void **)(*((_QWORD *)&v21 + 1) + 8 * j), 4);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v18, (_QWORD)v21);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

  v19 = (void *)objc_msgSend(v12, "copy");
  return v19;
}

- (id)trackingDocumentWithTrackedType:(unint64_t)a3 includeLines:(BOOL)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  CRTrackedDocumentOutputRegion *v17;
  uint64_t v18;
  CRTrackedDocumentOutputRegion *v19;
  CRTrackedDocumentOutputRegion *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = 2;
  if (a4)
    v6 = 10;
  v7 = -[CROutputRegion copyIncludingChildrenOfTypes:](self, "copyIncludingChildrenOfTypes:", v6 | a3);
  objc_msgSend(v7, "children");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (a3 != 2)
  {
    v26 = (void *)v8;
    v10 = (void *)objc_opt_new();
    objc_msgSend(v7, "contentsWithTypes:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          +[CRTrackedDocumentOutputRegion _blockFromRegion:trackedType:]((uint64_t)CRTrackedDocumentOutputRegion, *(void **)(*((_QWORD *)&v27 + 1) + 8 * i), a3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v13);
    }
    v9 = (void *)objc_msgSend(v10, "copy");

  }
  v17 = [CRTrackedDocumentOutputRegion alloc];
  v18 = -[CROutputRegion confidence](self, "confidence");
  -[CROutputRegion baselineAngle](self, "baselineAngle");
  v19 = -[CROutputRegion initWithConfidence:baselineAngle:](v17, "initWithConfidence:baselineAngle:", v18);
  v20 = v19;
  if (v19)
  {
    v19->_trackedRegionType = a3;
    -[CROutputRegion setShouldComputeBoundsFromChildren:](v19, "setShouldComputeBoundsFromChildren:", 0);
    -[CROutputRegion setShouldComputeParagraphsFromChildren:](v20, "setShouldComputeParagraphsFromChildren:", 0);
    objc_msgSend(v7, "text");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion setText:](v20, "setText:", v21);

    -[CRDocumentOutputRegion setChildren:](v20, "setChildren:", v9);
    objc_msgSend(v7, "paragraphRegions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion setParagraphRegions:](v20, "setParagraphRegions:", v22);

    v20->_trackedRegionType = a3;
  }
  else
  {
    objc_msgSend(0, "setShouldComputeBoundsFromChildren:", 0);
    objc_msgSend(0, "setShouldComputeParagraphsFromChildren:", 0);
    objc_msgSend(v7, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "setText:", v24);

    objc_msgSend(0, "setChildren:", v9);
    objc_msgSend(v7, "paragraphRegions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "setParagraphRegions:", v25);

  }
  return v20;
}

- (id)writeToFileInFolder:(id)a3 basename:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v6, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "fileExistsAtPath:", v9);

  if ((v10 & 1) != 0)
  {
    v11 = 0;
LABEL_4:
    v13 = v11;
    objc_msgSend(v6, "URLByAppendingPathComponent:", v7);
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v11;
    objc_msgSend(v15, "writeToURL:options:error:", v14, 1, &v21);
    v11 = v21;

    CROSLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject absoluteString](v14, "absoluteString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v24 = "-[CRDocumentOutputRegion writeToFileInFolder:basename:]";
      v25 = 2112;
      v26 = v17;
      v27 = 2112;
      v28 = v18;
      _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_DEFAULT, "%s: saving document output at URL %@, error = %@", buf, 0x20u);

    }
    if (v11)
    {
      v19 = 0;
    }
    else
    {
      -[NSObject absoluteString](v14, "absoluteString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_13;
  }
  v22 = 0;
  v12 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v22);
  v11 = v22;
  if ((v12 & 1) != 0)
    goto LABEL_4;
  CROSLogForCategory(0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "-[CRDocumentOutputRegion writeToFileInFolder:basename:]";
    v25 = 2112;
    v26 = v6;
    v27 = 2112;
    v28 = v11;
    _os_log_impl(&dword_1D4FB8000, v14, OS_LOG_TYPE_ERROR, "%s: Unable to create folder at URL %@: Error %@", buf, 0x20u);
  }
  v19 = 0;
LABEL_13:

  return v19;
}

- (CROutputRegion)title
{
  return (CROutputRegion *)objc_getProperty(self, a2, 336, 1);
}

- (void)setTitle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (CRTextDetectorResults)detectorResults
{
  return (CRTextDetectorResults *)objc_getProperty(self, a2, 344, 1);
}

- (void)setDetectorResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 344);
}

- (NSString)imagePath
{
  return (NSString *)objc_getProperty(self, a2, 352, 1);
}

- (void)setImagePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (unint64_t)documentRevision
{
  return self->_documentRevision;
}

- (void)setDocumentRevision:(unint64_t)a3
{
  self->_documentRevision = a3;
}

- (CRDocumentOutputRegionMetadata)additionalMetadata
{
  return (CRDocumentOutputRegionMetadata *)objc_getProperty(self, a2, 368, 1);
}

- (void)setAdditionalMetadata:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

- (NSArray)cachedLayoutComponents
{
  return (NSArray *)objc_getProperty(self, a2, 376, 1);
}

- (void)setCachedLayoutComponents:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 376);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLayoutComponents, 0);
  objc_storeStrong((id *)&self->_additionalMetadata, 0);
  objc_storeStrong((id *)&self->_imagePath, 0);
  objc_storeStrong((id *)&self->_detectorResults, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
