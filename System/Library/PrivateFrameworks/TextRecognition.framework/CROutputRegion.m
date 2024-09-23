@implementation CROutputRegion

- (CROutputRegion)init
{
  CROutputRegion *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CROutputRegion;
  result = -[CROutputRegion init](&v3, sel_init);
  if (result)
  {
    result->_shouldComputeParagraphsFromChildren = 1;
    *(_WORD *)&result->_shouldComputeBoundsFromChildren = 257;
    result->_numberOfLines = 0;
    result->_textAlignment = 0;
    result->_layoutDirection = 0;
    result->_activationProbability = 1.0;
  }
  return result;
}

- (CRVCQuad)vcImageSpaceQuad
{
  NSObject *v3;
  NSUUID *v4;
  NSUUID *trackingID;
  CRVCQuad *vcImageSpaceQuad;
  void *v7;
  void *v8;
  CRVCQuad *v9;
  CRVCQuad *v10;
  CRVCQuad *v11;
  uint8_t v13[16];

  if (!self->_trackingID)
  {
    CROSLogForCategory(0);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D4FB8000, v3, OS_LOG_TYPE_ERROR, "Unexpectedly encountered regions without trackIDs.", v13, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    trackingID = self->_trackingID;
    self->_trackingID = v4;

  }
  vcImageSpaceQuad = self->_vcImageSpaceQuad;
  if (vcImageSpaceQuad)
  {
    -[CROutputRegion boundingQuad](self, "boundingQuad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "denormalizedQuad");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CRVCQuad updateWithQuad:](vcImageSpaceQuad, "updateWithQuad:", v8);
  }
  else
  {
    v9 = [CRVCQuad alloc];
    -[CROutputRegion boundingQuad](self, "boundingQuad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "denormalizedQuad");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CRVCQuad initWithImageSpaceQuad:uuid:](v9, "initWithImageSpaceQuad:uuid:", v8, self->_trackingID);
    v11 = self->_vcImageSpaceQuad;
    self->_vcImageSpaceQuad = v10;

  }
  return self->_vcImageSpaceQuad;
}

- (CROutputRegion)initWithConfidence:(int)a3 baselineAngle:(double)a4
{
  CROutputRegion *result;

  result = -[CROutputRegion init](self, "init");
  if (result)
  {
    result->_confidence = a3;
    result->_baselineAngle = a4;
  }
  return result;
}

+ (id)outputRegionFromTextRegion:(id)a3 confidenceThresholdProvider:(id)a4 injectSpaceCharacter:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  void *v38;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v5 = a5;
  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v41 = v8;
  v42 = (void *)objc_opt_new();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v8, "subregions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v48 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(a1, "outputRegionFromTextRegion:confidenceThresholdProvider:injectSpaceCharacter:", v16, v9, v5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "addObject:", v17);

        v13 |= objc_msgSend(v16, "textRegionType") == 1;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  v18 = v41;
  objc_msgSend(v41, "locale");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "thresholdsForTextRegion:withLocale:", v41, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v41, "confidence");
  v21 = +[CRImageReaderOutput confidenceLevelForConfidenceScore:confidenceThresholds:](CRImageReaderOutput, "confidenceLevelForConfidenceScore:confidenceThresholds:", v20);
  v22 = objc_msgSend(v41, "textRegionType");
  if (!v22)
  {
    objc_msgSend(v41, "text");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "boundingQuad");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "boundingQuad");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "baselineAngle");
    +[CRCharacterOutputRegion characterWithText:confidence:quad:baselineAngle:](CRCharacterOutputRegion, "characterWithText:confidence:quad:baselineAngle:", v24, v21, v25);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  if (v22 == 1)
  {
    if (objc_msgSend(v42, "count"))
    {
      if ((v13 & 1) == 0)
      {
        v23 = 0;
        goto LABEL_21;
      }
      objc_msgSend(v41, "boundingQuad");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "boundingQuad");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "baselineAngle");
      +[CRWordOutputRegion wordWithCharacters:confidence:quad:baselineAngle:](CRWordOutputRegion, "wordWithCharacters:confidence:quad:baselineAngle:", v42, v21, v24);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v41, "text");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "boundingQuad");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "boundingQuad");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "baselineAngle");
      +[CRWordOutputRegion wordWithText:confidence:quad:baselineAngle:](CRWordOutputRegion, "wordWithText:confidence:quad:baselineAngle:", v24, v21, v25);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_20:

    goto LABEL_21;
  }
  if (v22 != 2)
  {
    v23 = 0;
    goto LABEL_30;
  }
  +[CRLineOutputRegion lineWithTextRegion:confidenceThresholdProvider:injectSpaceCharacter:](CRLineOutputRegion, "lineWithTextRegion:confidenceThresholdProvider:injectSpaceCharacter:", v41, v9, v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:
  objc_msgSend(v41, "locale");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setRecognizedLocale:", v28);

  objc_msgSend(v41, "confidence");
  *(float *)&v29 = v29;
  objc_msgSend(v23, "setRawConfidence:", v29);
  objc_msgSend(v41, "activationProbability");
  objc_msgSend(v23, "setActivationProbability:");
  objc_msgSend(v41, "polygon");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setPolygon:", v30);

  objc_msgSend(v23, "setLayoutDirection:", objc_msgSend(v41, "layoutDirection"));
  objc_msgSend(v41, "candidates");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (v31)
  {
    v40 = v20;
    v32 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v41, "candidates");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v44 != v36)
            objc_enumerationMutation(v33);
          objc_msgSend(a1, "outputRegionFromTextRegion:confidenceThresholdProvider:injectSpaceCharacter:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j), v9, v5);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "addObject:", v38);

        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v35);
    }

    objc_msgSend(v23, "setCandidates:", v32);
    v20 = v40;
    v18 = v41;
  }
LABEL_30:

  return v23;
}

- (NSUUID)uuid
{
  NSUUID *uuid;
  NSUUID *v4;
  NSUUID *v5;

  uuid = self->_uuid;
  if (!uuid)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }
  return uuid;
}

- (BOOL)computesNumberOfLinesFromChildren
{
  return 1;
}

- (id)joiningDelimiter
{
  return CFSTR("\n");
}

- (BOOL)shouldAlwaysAddDelimiter
{
  return 0;
}

- (void)setChildren:(id)a3
{
  NSArray *dataDetectorRegions;
  NSArray *listRegions;
  NSArray *tableRegions;
  NSArray *paragraphRegions;
  CRNormalizedQuad *boundingQuad;
  CRRegionGeometryInfo *geometryInfo;
  id v11;

  v11 = a3;
  objc_storeStrong((id *)&self->_children, a3);
  dataDetectorRegions = self->_dataDetectorRegions;
  self->_dataDetectorRegions = 0;

  listRegions = self->_listRegions;
  self->_listRegions = 0;

  tableRegions = self->_tableRegions;
  self->_tableRegions = 0;

  if (-[CROutputRegion shouldComputeParagraphsFromChildren](self, "shouldComputeParagraphsFromChildren"))
  {
    paragraphRegions = self->_paragraphRegions;
    self->_paragraphRegions = 0;

  }
  if (-[CROutputRegion computesBoundsFromChildren](self, "computesBoundsFromChildren"))
  {
    boundingQuad = self->_boundingQuad;
    self->_boundingQuad = 0;

    geometryInfo = self->_geometryInfo;
    self->_geometryInfo = 0;

  }
  if (-[CROutputRegion computesTranscriptFromChildren](self, "computesTranscriptFromChildren"))
    -[CROutputRegion _invalidateTranscript](self, "_invalidateTranscript");
  if (-[CROutputRegion computesNumberOfLinesFromChildren](self, "computesNumberOfLinesFromChildren"))
    -[CROutputRegion _computeNumberOfLines](self, "_computeNumberOfLines");

}

- (CGSize)rectifiedSize
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[CROutputRegion polygon](self, "polygon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CROutputRegion polygon](self, "polygon");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "denormalizedPolyline");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "estimatedLineSizeForPairedPointPolygon");
  }
  else
  {
    -[CROutputRegion boundingQuad](self, "boundingQuad");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "denormalizedQuad");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "size");
  }
  v8 = v6;
  v9 = v7;

  v10 = v8;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_invalidateTranscript
{
  NSString *text;
  NSArray *transcriptComponents;

  text = self->_text;
  self->_text = 0;

  transcriptComponents = self->_transcriptComponents;
  self->_transcriptComponents = 0;

}

- (void)_invalidateTranscriptRecursivelyThrough:(Class)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (-[CROutputRegion computesTranscriptFromChildren](self, "computesTranscriptFromChildren"))
  {
    -[CROutputRegion _invalidateTranscript](self, "_invalidateTranscript");
    if ((Class)objc_opt_class() != a3)
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      -[CROutputRegion children](self, "children", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v11;
        do
        {
          v9 = 0;
          do
          {
            if (*(_QWORD *)v11 != v8)
              objc_enumerationMutation(v5);
            objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "_invalidateTranscriptRecursivelyThrough:", a3);
          }
          while (v7 != v9);
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v7);
      }

    }
  }
}

- (id)copyIncludingChildrenOfTypes:(unint64_t)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    v5 = -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](self, "copyWithZone:copyChildren:copyCandidates:deepCopy:", 0, 0, 0, 1);
    if ((a3 & 8) != 0)
      goto LABEL_4;
    goto LABEL_3;
  }
  v5 = 0;
  if ((a3 & 8) == 0)
LABEL_3:
    objc_msgSend(v5, "setShouldComputeParagraphsFromChildren:", 0);
LABEL_4:
  -[CROutputRegion children](self, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[CROutputRegion children](self, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v40 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          if ((objc_msgSend(v13, "type") & a3) != 0)
          {
            v14 = (void *)objc_msgSend(v13, "copyIncludingChildrenOfTypes:", a3);
            objc_msgSend(v7, "addObject:", v14);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v10);
    }

    objc_msgSend(v5, "setChildren:", v7);
  }
  -[CROutputRegion children](self, "children");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  objc_msgSend(v5, "children");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v16 > v18)
  {
    objc_msgSend(v5, "setShouldComputeBoundsFromChildren:", 0);
    objc_msgSend(v5, "setShouldComputeTranscriptFromChildren:", 0);
    -[CROutputRegion boundingQuad](self, "boundingQuad");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBoundingQuad:", v19);

    -[CROutputRegion text](self, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v20);
LABEL_21:

    goto LABEL_22;
  }
  if (!-[CROutputRegion shouldComputeTranscriptFromChildren](self, "shouldComputeTranscriptFromChildren"))
  {
    -[CROutputRegion text](self, "text");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v21);

    objc_msgSend(v5, "setShouldComputeTranscriptFromChildren:", 0);
  }
  if (!-[CROutputRegion shouldComputeBoundsFromChildren](self, "shouldComputeBoundsFromChildren"))
  {
    objc_msgSend(v5, "setShouldComputeBoundsFromChildren:", 0);
    -[CROutputRegion boundingQuad](self, "boundingQuad");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBoundingQuad:", v20);
    goto LABEL_21;
  }
LABEL_22:
  if ((a3 & 4) != 0 && -[CROutputRegion type](self, "type") != 4)
  {
    -[CROutputRegion contentsWithTypes:](self, "contentsWithTypes:", 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v22, "count"));
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v24 = v22;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          v30 = (void *)objc_msgSend(v29, "copyIncludingChildrenOfTypes:", a3, (_QWORD)v35);
          objc_msgSend(v29, "geometryInfo");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setGeometryInfo:", v31);

          objc_msgSend(v23, "addObject:", v30);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v26);
    }

    -[CROutputRegion paragraphRegions](self, "paragraphRegions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = (void *)objc_msgSend(v23, "copy");
      objc_msgSend(v5, "setParagraphRegions:", v33);

    }
    else
    {
      objc_msgSend(v5, "setParagraphRegions:", 0);
    }

  }
  return v5;
}

- (NSString)text
{
  NSString *text;

  text = self->_text;
  if (!text)
  {
    -[CROutputRegion _computeTranscript](self);
    text = self->_text;
  }
  return text;
}

- (void)_computeTranscript
{
  _QWORD *v1;
  void *v2;
  void *v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  char v13;
  void *v14;
  uint64_t v15;
  id v16;
  CROutputRegionTranscriptComponent *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id obj;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    if (objc_msgSend(a1, "computesTranscriptFromChildren"))
    {
      objc_msgSend(v1, "children");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v2)
      {
        objc_msgSend(v1, "_invalidateTranscript");
        return;
      }
      v3 = (void *)objc_opt_new();
      v22 = (void *)objc_opt_new();
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      objc_msgSend(v1, "children");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (!v24)
        goto LABEL_21;
      v23 = *(_QWORD *)v26;
      while (1)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v26 != v23)
            objc_enumerationMutation(obj);
          v5 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v5, "text");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          if (v6)
          {
            v7 = objc_msgSend(v3, "length");
            objc_msgSend(v5, "joiningDelimiter");
            v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v9 = v1;
            objc_msgSend(v1, "children");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "lastObject");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (v5 != v11)
            {

              v12 = v8;
              goto LABEL_13;
            }
            v13 = objc_msgSend(v5, "shouldAlwaysAddDelimiter");

            v10 = v8;
            v12 = &stru_1E98DC948;
            if ((v13 & 1) == 0)
            {
LABEL_13:

              v8 = (__CFString *)v12;
            }
            if (-[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("\b"))
              && objc_msgSend(v6, "_crEndsWithHyphen"))
            {
              objc_msgSend(v6, "substringToIndex:", objc_msgSend(v6, "length") - 1);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "appendString:", v14);

            }
            else
            {
              objc_msgSend(v3, "appendString:", v6);
              objc_msgSend(v3, "appendString:", v8);
            }
            v15 = objc_msgSend(v6, "length");
            v16 = v5;
            objc_opt_self();
            v17 = -[CROutputRegionTranscriptComponent initWithOutputRegion:range:]([CROutputRegionTranscriptComponent alloc], "initWithOutputRegion:range:", v16, v7, v15);

            objc_msgSend(v22, "addObject:", v17);
            v1 = v9;
          }

        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (!v24)
        {
LABEL_21:

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = (void *)v1[6];
          v1[6] = v18;

          v20 = (void *)v1[19];
          v1[19] = v22;

          return;
        }
      }
    }
  }
}

- (NSArray)transcriptComponents
{
  NSArray *transcriptComponents;

  transcriptComponents = self->_transcriptComponents;
  if (!transcriptComponents)
  {
    -[CROutputRegion _computeTranscript](self);
    transcriptComponents = self->_transcriptComponents;
  }
  return transcriptComponents;
}

- (NSArray)regionsSuitableForDataDetectorOutput
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (CRNormalizedQuad)boundingQuad
{
  CRNormalizedQuad *boundingQuad;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  CRNormalizedQuad *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  double v12;
  uint64_t v13;
  CRNormalizedQuad *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  boundingQuad = self->_boundingQuad;
  if (!boundingQuad)
  {
    if (!-[CROutputRegion computesBoundsFromChildren](self, "computesBoundsFromChildren"))
      return (CRNormalizedQuad *)0;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[CROutputRegion children](self, "children", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "boundingQuad");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10;
          if (v7)
          {
            -[CROutputRegion baselineAngle](self, "baselineAngle");
            *(float *)&v12 = v12;
            -[CRNormalizedQuad unionWithNormalizedQuad:baselineAngle:](v7, "unionWithNormalizedQuad:baselineAngle:", v11, v12);
            v13 = objc_claimAutoreleasedReturnValue();

            v7 = (CRNormalizedQuad *)v13;
          }
          else
          {
            v7 = v10;
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }
    else
    {
      v7 = 0;
    }

    v15 = self->_boundingQuad;
    self->_boundingQuad = v7;

    boundingQuad = self->_boundingQuad;
  }
  return boundingQuad;
}

- (NSArray)contentBaselines
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CROutputRegion children](self, "children", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "contentBaselines");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v10;
}

- (int64_t)wordCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[CROutputRegion contentsWithTypes:](self, "contentsWithTypes:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "wordCount");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (float)visualTextAngle
{
  float result;
  double baselineAngle;
  double v4;

  result = self->_visualTextAngle;
  if (result == 0.0)
  {
    baselineAngle = self->_baselineAngle;
    if (self->_layoutDirection == 5)
    {
      baselineAngle = baselineAngle + 1.57079633;
      if (baselineAngle > 3.14159265)
      {
        v4 = -6.28318531;
LABEL_7:
        baselineAngle = baselineAngle + v4;
        goto LABEL_8;
      }
      if (baselineAngle <= -3.14159265)
      {
        v4 = 6.28318531;
        goto LABEL_7;
      }
    }
LABEL_8:
    result = baselineAngle;
    self->_visualTextAngle = result;
  }
  return result;
}

- (void)_computeDataDetectorRegions
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a1)
  {
    objc_msgSend(a1, "recognizedLocale");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v2 = a1;
    v3 = 4;
    v4 = v2;
    while (!v12)
    {
      objc_msgSend(v4, "children");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v6)
      {
        v12 = 0;
        break;
      }
      objc_msgSend(v4, "children");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "recognizedLocale");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (--v3)
      {
        v4 = v8;
        if (objc_msgSend(v8, "type") != 8)
          continue;
      }
      goto LABEL_10;
    }
    v8 = v4;
LABEL_10:
    objc_msgSend(v2, "text");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "transcriptComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRDataDetectorUtilities computeDataDetectorRegionsForText:locale:transcriptComponents:ddQOS:](CRDataDetectorUtilities, "computeDataDetectorRegionsForText:locale:transcriptComponents:ddQOS:", v9, v12, v10, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDataDetectorRegions:", v11);

  }
}

- (id)contentsWithTypes:(unint64_t)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __36__CROutputRegion_contentsWithTypes___block_invoke;
  v11[3] = &unk_1E98DB528;
  v6 = v5;
  v12 = v6;
  -[CROutputRegion enumerateContentsWithTypes:usingBlock:](self, "enumerateContentsWithTypes:usingBlock:", a3, v11);
  if ((a3 & 0x2000) != 0 && -[CROutputRegion type](self, "type") == 1)
  {
    CROSLogForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v6, "count");
      *(_DWORD *)buf = 136315394;
      v14 = "-[CROutputRegion contentsWithTypes:]";
      v15 = 2048;
      v16 = v8;
      _os_log_impl(&dword_1D4FB8000, v7, OS_LOG_TYPE_DEFAULT, "%s: Returning %lu form fields.", buf, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __36__CROutputRegion_contentsWithTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (void)enumerateContentsWithTypes:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  os_signpost_id_t v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  _BOOL4 v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  void *v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  NSArray *formFieldRegions;
  void *v60;
  void *v61;
  CROutputRegion *v62;
  CROutputRegion *v63;
  unint64_t v64;
  id v65;
  _QWORD v66[4];
  id v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t buf[4];
  const char *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  uint64_t v81;
  _BYTE v82[128];
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if ((a3 & 0xFFFFFFFFFFFFC7FFLL) != 0)
  {
    -[CROutputRegion children](self, "children");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v7, a3 & 0xFFFFFFFFFFFFC7FFLL, 1, 0, v6);

  }
  if ((a3 & 0x800) != 0)
  {
    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v8 = (id)CRSignpostLog_signPostOSLog;
    v9 = os_signpost_id_generate(v8);

    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v10 = (id)CRSignpostLog_signPostOSLog;
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "OCRDataDetectorTime", ", buf, 2u);
    }

    -[CROutputRegion dataDetectorRegions](self, "dataDetectorRegions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      -[CROutputRegion _computeDataDetectorRegions](self);
    if (CRSignpostLog_onceToken != -1)
      dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
    v13 = (id)CRSignpostLog_signPostOSLog;
    v14 = v13;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v14, OS_SIGNPOST_INTERVAL_END, v9, "OCRDataDetectorTime", ", buf, 2u);
    }

    CROSLogForCategory(7);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

    if (v16)
    {
      v64 = a3;
      CROSLogForCategory(7);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[CROutputRegion enumerateContentsWithTypes:usingBlock:]";
        _os_log_impl(&dword_1D4FB8000, v17, OS_LOG_TYPE_DEBUG, "%s: Data requested", buf, 0xCu);
      }

      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v62 = self;
      -[CROutputRegion dataDetectorRegions](self, "dataDetectorRegions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v73 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            CROSLogForCategory(7);
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v23, "debugDescription");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315395;
              v77 = "-[CROutputRegion enumerateContentsWithTypes:usingBlock:]";
              v78 = 2117;
              v79 = v25;
              _os_log_impl(&dword_1D4FB8000, v24, OS_LOG_TYPE_DEBUG, "%s: - Result %{sensitive}@", buf, 0x16u);

            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v83, 16);
        }
        while (v20);
      }

      a3 = v64;
      self = v62;
    }
    -[CROutputRegion dataDetectorRegions](self, "dataDetectorRegions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v26, a3, 0, 0, v6);

    if ((a3 & 0x1000) == 0)
    {
LABEL_7:
      if ((a3 & 4) == 0)
        goto LABEL_8;
      goto LABEL_73;
    }
  }
  else if ((a3 & 0x1000) == 0)
  {
    goto LABEL_7;
  }
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v27 = (id)CRSignpostLog_signPostOSLog;
  v28 = os_signpost_id_generate(v27);

  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v29 = (id)CRSignpostLog_signPostOSLog;
  v30 = v29;
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v28, "OCRDataDetectorTime", ", buf, 2u);
  }

  -[CROutputRegion dataDetectorRegions](self, "dataDetectorRegions");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
    -[CROutputRegion _computeDataDetectorRegions](self);
  -[CROutputRegion dataDetectorGroupRegions](self, "dataDetectorGroupRegions");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v32)
  {
    -[CROutputRegion dataDetectorRegions](self, "dataDetectorRegions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRDataDetectorUtilities computeGroupRegionsWithDataDetectorRegions:inRegion:](CRDataDetectorUtilities, "computeGroupRegionsWithDataDetectorRegions:inRegion:", v33, self);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion setDataDetectorGroupRegions:](self, "setDataDetectorGroupRegions:", v34);

  }
  if (CRSignpostLog_onceToken != -1)
    dispatch_once(&CRSignpostLog_onceToken, &__block_literal_global_14);
  v35 = (id)CRSignpostLog_signPostOSLog;
  v36 = v35;
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D4FB8000, v36, OS_SIGNPOST_INTERVAL_END, v28, "OCRDataDetectorTime", ", buf, 2u);
  }

  CROSLogForCategory(7);
  v37 = objc_claimAutoreleasedReturnValue();
  v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG);

  if (v38)
  {
    v65 = v6;
    CROSLogForCategory(7);
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v77 = "-[CROutputRegion enumerateContentsWithTypes:usingBlock:]";
      _os_log_impl(&dword_1D4FB8000, v39, OS_LOG_TYPE_DEBUG, "%s: DataGroup requested", buf, 0xCu);
    }

    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    v63 = self;
    -[CROutputRegion dataDetectorGroupRegions](self, "dataDetectorGroupRegions");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v42; ++j)
        {
          if (*(_QWORD *)v69 != v43)
            objc_enumerationMutation(v40);
          v45 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          CROSLogForCategory(7);
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v45, "debugDescription");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v45, "groupType");
            *(_DWORD *)buf = 136315651;
            v77 = "-[CROutputRegion enumerateContentsWithTypes:usingBlock:]";
            v78 = 2117;
            v79 = v47;
            v80 = 2048;
            v81 = v48;
            _os_log_impl(&dword_1D4FB8000, v46, OS_LOG_TYPE_DEBUG, "%s: - Result '%{sensitive}@' (type:%lu)", buf, 0x20u);

          }
        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v68, v82, 16);
      }
      while (v42);
    }

    v6 = v65;
    self = v63;
  }
  -[CROutputRegion dataDetectorGroupRegions](self, "dataDetectorGroupRegions");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v49, a3, 0, 0, v6);

  if ((a3 & 4) == 0)
  {
LABEL_8:
    if ((a3 & 0x100) == 0)
      goto LABEL_9;
    goto LABEL_82;
  }
LABEL_73:
  -[CROutputRegion paragraphRegions](self, "paragraphRegions");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v50)
  {
    if (-[CROutputRegion type](self, "type") == 4)
    {
      v50 = 0;
    }
    else
    {
      if (!-[CROutputRegion shouldComputeParagraphsFromChildren](self, "shouldComputeParagraphsFromChildren"))
        goto LABEL_79;
      -[CROutputRegion contentsWithTypes:](self, "contentsWithTypes:", 8);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRParagraphOutputRegion paragraphsWithLines:](CRParagraphOutputRegion, "paragraphsWithLines:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[CROutputRegion setParagraphRegions:](self, "setParagraphRegions:", v51);

    }
  }

LABEL_79:
  -[CROutputRegion paragraphRegions](self, "paragraphRegions");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v52, a3, 0, 0, v6);

  if ((a3 & 0x100) == 0)
  {
LABEL_9:
    if ((a3 & 0x2000) == 0)
      goto LABEL_93;
    goto LABEL_87;
  }
LABEL_82:
  -[CROutputRegion listRegions](self, "listRegions");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v53)
  {
    -[CROutputRegion contentsWithTypes:](self, "contentsWithTypes:", 4);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRListOutputRegion listsWithParagraphs:](CRListOutputRegion, "listsWithParagraphs:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion setListRegions:](self, "setListRegions:", v55);

  }
  -[CROutputRegion listRegions](self, "listRegions");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v56, a3, 0, 0, v6);

  if ((a3 & 0x2000) != 0)
  {
LABEL_87:
    if (-[CROutputRegion type](self, "type") == 1)
    {
      CROSLogForCategory(6);
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v77 = "-[CROutputRegion enumerateContentsWithTypes:usingBlock:]";
        _os_log_impl(&dword_1D4FB8000, v57, OS_LOG_TYPE_DEBUG, "%s: FormField requested", buf, 0xCu);
      }

    }
    -[CROutputRegion formFieldRegions](self, "formFieldRegions");
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    if (v58)
    {
      formFieldRegions = self->_formFieldRegions;
      v66[0] = MEMORY[0x1E0C809B0];
      v66[1] = 3221225472;
      v66[2] = __56__CROutputRegion_enumerateContentsWithTypes_usingBlock___block_invoke;
      v66[3] = &unk_1E98DB550;
      v67 = v6;
      -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, formFieldRegions, a3, 0, 0, v66);

    }
  }
LABEL_93:
  if ((a3 & 0x40) != 0)
  {
    -[CROutputRegion tableRegions](self, "tableRegions");
    v60 = (void *)objc_claimAutoreleasedReturnValue();

    if (v60)
    {
      -[CROutputRegion tableRegions](self, "tableRegions");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      if (self)
        -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v61, a3, 0, 0, v6);

    }
  }

}

void __56__CROutputRegion_enumerateContentsWithTypes_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "fieldSource") == 1)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (CROutputRegion)outputRegionWithContentsOfQuad:(id)a3
{
  id v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CROutputRegion boundingQuad](self, "boundingQuad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "overlapsNormalizedQuad:", v4);

  if (v6)
  {
    if (self)
      v7 = -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](self, "copyWithZone:copyChildren:copyCandidates:deepCopy:", 0, 0, 0, 1);
    else
      v7 = 0;
    -[CROutputRegion children](self, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      v9 = (void *)objc_opt_new();
    else
      v9 = 0;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[CROutputRegion children](self, "children", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "outputRegionWithContentsOfQuad:", v4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            objc_msgSend(v9, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v9, "count")
      || (-[CROutputRegion children](self, "children"),
          v17 = (void *)objc_claimAutoreleasedReturnValue(),
          v18 = objc_msgSend(v17, "count"),
          v17,
          !v18))
    {
      objc_msgSend(v7, "setChildren:", v9);
      v10 = v7;
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return (CROutputRegion *)v10;
}

- (void)updatePreviousAssociationQuad
{
  CRNormalizedQuad *v3;
  CRNormalizedQuad *boundingQuadAtOCRDispatch;
  uint64_t v5;
  __int128 v6;

  -[CROutputRegion boundingQuad](self, "boundingQuad");
  v3 = (CRNormalizedQuad *)objc_claimAutoreleasedReturnValue();
  boundingQuadAtOCRDispatch = self->_boundingQuadAtOCRDispatch;
  self->_boundingQuadAtOCRDispatch = v3;

  v5 = MEMORY[0x1E0C83FE8];
  v6 = *(_OWORD *)(MEMORY[0x1E0C83FE8] + 16);
  *(_OWORD *)&self[1].super.isa = *MEMORY[0x1E0C83FE8];
  *(_OWORD *)&self[1]._visualTextAngle = v6;
  *(_OWORD *)&self[1]._uuid = *(_OWORD *)(v5 + 32);
}

- (void)updateBoundingQuadAfterOCR
{
  CRNormalizedQuad *v3;
  CRNormalizedQuad *boundingQuadAfterOCR;

  -[CROutputRegion boundingQuad](self, "boundingQuad");
  v3 = (CRNormalizedQuad *)objc_claimAutoreleasedReturnValue();
  boundingQuadAfterOCR = self->_boundingQuadAfterOCR;
  self->_boundingQuadAfterOCR = v3;

}

- (id)outputRegionByApplyingWarpTransform:(double)a3 downscaleRate:(double)a4 shouldApply:(float)a5
{
  id v9;
  void *v10;
  double v11;

  v9 = a7;
  v10 = (void *)objc_msgSend(a1, "copy");
  *(float *)&v11 = a5;
  objc_msgSend(v10, "applyHomographyTransform:downscaleRate:shouldApply:", v9, a2, a3, a4, v11);

  return v10;
}

- (void)applyHomographyTransform:(float32x4_t)a3 downscaleRate:(float32x4_t)a4 shouldApply:(float)a5
{
  unsigned int (**v9)(id, void *);
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  float32x4_t v32;
  float32x4_t v33;
  float32x4_t v34;
  float32x4_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t i;
  double v44;
  double v46;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v9 = a7;
  objc_msgSend((id)a1, "boundingQuad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "denormalizedQuad");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a5;
  objc_msgSend(v11, "applyHomographyTransform:downscaleRate:", *(double *)a2.i64, *(double *)a3.i64, *(double *)a4.i64, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "normalizationSize");
  if (v9[2](v9, v13))
  {
    objc_msgSend(v13, "baselineAngle");
    objc_msgSend((id)a1, "setBaselineAngle:");
    objc_msgSend((id)a1, "originalBoundingQuad");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      if (a4.f32[2] != 0.0)
      {
        v15 = 0;
        v16 = (_QWORD *)(a1 + 256);
        v17 = *(_OWORD *)(a1 + 304);
        v18 = *(_OWORD *)(a1 + 320);
        v52 = *(_OWORD *)(a1 + 288);
        v53 = v17;
        v54 = v18;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        do
        {
          *(__int128 *)((char *)&v55 + v15) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(__int128 *)((char *)&v52 + v15))), a3, *(float32x2_t *)((char *)&v52 + v15), 1), a4, *(float32x4_t *)((char *)&v52 + v15), 2);
          v15 += 16;
        }
        while (v15 != 48);
        v19 = 0;
        v20 = v55;
        v21 = v56;
        v22 = v57;
        *(_DWORD *)(a1 + 296) = DWORD2(v55);
        *(_DWORD *)(a1 + 312) = DWORD2(v21);
        *(_QWORD *)(a1 + 288) = v20;
        *(float *)&v20 = 1.0 / *((float *)&v22 + 2);
        v23 = *(_OWORD *)(a1 + 272);
        v24 = vmulq_n_f32(*(float32x4_t *)(a1 + 288), 1.0 / *((float *)&v22 + 2));
        *(_DWORD *)(a1 + 296) = v24.i32[2];
        *(_DWORD *)(a1 + 328) = DWORD2(v22);
        *(_QWORD *)(a1 + 304) = v21;
        *(_QWORD *)(a1 + 320) = v22;
        *(_QWORD *)(a1 + 288) = v24.i64[0];
        v25 = *(float32x4_t *)(a1 + 320);
        v26 = vmulq_n_f32(*(float32x4_t *)(a1 + 304), *(float *)&v20);
        *(_DWORD *)(a1 + 312) = v26.i32[2];
        *(_QWORD *)(a1 + 304) = v26.i64[0];
        v27 = vmulq_n_f32(v25, *(float *)&v20);
        *(_DWORD *)(a1 + 328) = v27.i32[2];
        *(_QWORD *)(a1 + 320) = v27.i64[0];
        v28 = *(_OWORD *)(a1 + 256);
        v52 = *(_OWORD *)(a1 + 240);
        v53 = v28;
        v54 = v23;
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        do
        {
          *(__int128 *)((char *)&v55 + v19) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(a2, COERCE_FLOAT(*(__int128 *)((char *)&v52 + v19))), a3, *(float32x2_t *)((char *)&v52 + v19), 1), a4, *(float32x4_t *)((char *)&v52 + v19), 2);
          v19 += 16;
        }
        while (v19 != 48);
        v29 = v55;
        v30 = v56;
        v31 = v57;
        *(_DWORD *)(a1 + 248) = DWORD2(v55);
        *(_DWORD *)(a1 + 264) = DWORD2(v30);
        *(_QWORD *)(a1 + 240) = v29;
        *v16 = v30;
        *(_DWORD *)(a1 + 280) = DWORD2(v31);
        *(_QWORD *)(a1 + 272) = v31;
        *(float *)&v29 = 1.0 / *((float *)&v31 + 2);
        v32 = *(float32x4_t *)(a1 + 272);
        v33 = vmulq_n_f32(*(float32x4_t *)(a1 + 240), 1.0 / *((float *)&v31 + 2));
        v34 = vmulq_n_f32(*(float32x4_t *)(a1 + 256), 1.0 / *((float *)&v31 + 2));
        *(_DWORD *)(a1 + 248) = v33.i32[2];
        *(_DWORD *)(a1 + 264) = v34.i32[2];
        *(_QWORD *)(a1 + 240) = v33.i64[0];
        *v16 = v34.i64[0];
        v35 = vmulq_n_f32(v32, *(float *)&v29);
        *(_DWORD *)(a1 + 280) = v35.i32[2];
        *(_QWORD *)(a1 + 272) = v35.i64[0];
      }
    }
    else
    {
      objc_storeStrong((id *)(a1 + 136), v10);
      *(float32x4_t *)(a1 + 240) = a2;
      *(float32x4_t *)(a1 + 256) = a3;
      *(float32x4_t *)(a1 + 272) = a4;
    }
    objc_msgSend(v10, "normalizationSize", *(_OWORD *)&a2, *(_OWORD *)&a3);
    objc_msgSend(v13, "normalizedQuadForImageSize:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "setBoundingQuad:", v36);

    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    objc_msgSend((id)a1, "children");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
    if (v38)
    {
      v40 = v38;
      v41 = *(_QWORD *)v49;
      do
      {
        for (i = 0; i != v40; ++i)
        {
          if (*(_QWORD *)v49 != v41)
            objc_enumerationMutation(v37);
          *(float *)&v39 = a5;
          objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * i), "applyHomographyTransform:downscaleRate:shouldApply:", v9, v44, v46, *(double *)a4.i64, v39);
        }
        v40 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      }
      while (v40);
    }

  }
}

- (CROutputRegion)outputRegionWithContentsBetweenStartPoint:(CGPoint)a3 endPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  void *v10;
  int v11;
  id v12;
  char *v13;
  char *v14;
  void *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  char *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  unint64_t v23;
  char *v24;
  void *v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  uint64_t v39;
  _QWORD v40[2];

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v40[1] = *MEMORY[0x1E0C80C00];
  -[CROutputRegion children](self, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {

    goto LABEL_5;
  }
  -[CROutputRegion boundingQuad](self, "boundingQuad");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsNormalizedPoint:", v7, v6);

  if (!v11)
  {
LABEL_5:
    v13 = (char *)-[CROutputRegion _indexOfNearestChildToPoint:returnFirstMatch:](self, 1, v7, v6);
    if (v13 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = 0;
      return (CROutputRegion *)v12;
    }
    v14 = v13;
    -[CROutputRegion children](self, "children");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", v14);
    v16 = objc_claimAutoreleasedReturnValue();

    v17 = (char *)-[CROutputRegion _indexOfNearestChildToPoint:returnFirstMatch:](self, 0, x, y);
    if (v17 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = 0;
      v18 = (void *)v16;
LABEL_48:

      return (CROutputRegion *)v12;
    }
    v19 = v17;
    -[CROutputRegion children](self, "children");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
    v21 = objc_claimAutoreleasedReturnValue();

    v22 = v19 >= v14;
    if (v19 < v14)
      v23 = (unint64_t)v19;
    else
      v23 = (unint64_t)v14;
    if (v19 < v14)
      v18 = (void *)v21;
    else
      v18 = (void *)v16;
    if (v19 < v14)
      v24 = v14;
    else
      v24 = v19;
    if (v19 < v14)
      v25 = (void *)v16;
    else
      v25 = (void *)v21;
    if (v22)
      v26 = v7;
    else
      v26 = x;
    if (v22)
      v27 = v6;
    else
      v27 = y;
    if (!v22)
    {
      x = v7;
      y = v6;
    }
    if (self)
      v28 = -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](self, "copyWithZone:copyChildren:copyCandidates:deepCopy:", 0, 0, 0, 1);
    else
      v28 = 0;
    if (v18 == v25)
    {
      objc_msgSend(v18, "outputRegionWithContentsBetweenStartPoint:endPoint:", v26, v27, x, y);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = (void *)v31;
      if (v31)
      {
        v40[0] = v31;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setChildren:", v33);

      }
    }
    else
    {
      -[CROutputRegion children](self, "children");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
        v30 = (void *)objc_opt_new();
      else
        v30 = 0;

      -[CROutputRegion outputRegionWithContentsStartingAtPoint:](v18, v26, v27);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
        objc_msgSend(v30, "addObject:", v34);
      if (&v24[~v23])
      {
        v35 = -[CROutputRegion _copyChildrenInRange:](self, v23 + 1, (uint64_t)&v24[~v23]);
        objc_msgSend(v30, "addObjectsFromArray:", v35);

      }
      -[CROutputRegion outputRegionWithContentsEndingAtPoint:](v25, x, y);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (v36)
        objc_msgSend(v30, "addObject:", v36);
      if (!objc_msgSend(v30, "count"))
      {
        -[CROutputRegion children](self, "children");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "count");

        if (v39)
        {

          v12 = 0;
          goto LABEL_47;
        }
      }
      objc_msgSend(v28, "setChildren:", v30);

    }
    v12 = v28;
LABEL_47:

    goto LABEL_48;
  }
  v12 = (id)-[CROutputRegion copy](self, "copy");
  return (CROutputRegion *)v12;
}

- (void)_indexOfNearestChildToPoint:(double)a3 returnFirstMatch:(double)a4
{
  uint64_t v7;
  void *v8;
  uint64_t v9;

  if (result)
  {
    v7 = (uint64_t)result;
    objc_msgSend(result, "children");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CROutputRegion _indexOfNearestRegionToPoint:regions:returnFirstMatch:distance:](v7, v8, a2, 0, a3, a4);

    return (void *)v9;
  }
  return result;
}

- (id)outputRegionWithContentsStartingAtPoint:(double)a3
{
  void *v6;
  void *v7;
  int v8;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  if (!a1)
    return 0;
  objc_msgSend(a1, "children");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {

  }
  else
  {
    objc_msgSend(a1, "boundingQuad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsNormalizedPoint:", a2, a3);

    if (v8)
      return (id)objc_msgSend(a1, "copy");
  }
  v10 = -[CROutputRegion _indexOfNearestChildToPoint:returnFirstMatch:](a1, 1, a2, a3);
  if (v10 == (void *)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v11 = (unint64_t)v10;
  objc_msgSend(a1, "children");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(a1, "copyWithZone:copyChildren:copyCandidates:deepCopy:", 0, 0, 0, 1);
  objc_msgSend(a1, "children");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    v16 = (void *)objc_opt_new();
  else
    v16 = 0;

  -[CROutputRegion outputRegionWithContentsStartingAtPoint:](v13, a2, a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v16, "addObject:", v17);
  objc_msgSend(a1, "children");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count") + ~v11;

  if (v19)
  {
    v20 = -[CROutputRegion _copyChildrenInRange:](a1, v11 + 1, v19);
    objc_msgSend(v16, "addObjectsFromArray:", v20);

  }
  objc_msgSend(v14, "setChildren:", v16);

  return v14;
}

- (void)_copyChildrenInRange:(uint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  if (result)
  {
    if (a3
      && (v5 = result,
          objc_msgSend(result, "children"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "count"),
          v6,
          a2 < v7))
    {
      objc_msgSend(v5, "children");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "subarrayWithRange:", a2, a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v9, 1);
      return (void *)v10;
    }
    else
    {
      return (void *)MEMORY[0x1E0C9AA60];
    }
  }
  return result;
}

- (id)outputRegionWithContentsEndingAtPoint:(double)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  if (a1)
  {
    v6 = -[CROutputRegion _indexOfNearestChildToPoint:returnFirstMatch:](a1, 0, a2, a3);
    v7 = (void *)objc_msgSend(a1, "copyWithZone:copyChildren:copyCandidates:deepCopy:", 0, 0, 0, 1);
    if (v6 != (void *)0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(a1, "children");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "children");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v11 = (void *)objc_opt_new();
      else
        v11 = 0;

      if (v6)
      {
        v12 = -[CROutputRegion _copyChildrenInRange:](a1, 0, (uint64_t)v6);
        objc_msgSend(v11, "addObjectsFromArray:", v12);

      }
      -[CROutputRegion outputRegionWithContentsEndingAtPoint:](v9, a2, a3);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        objc_msgSend(v11, "addObject:", v13);
      objc_msgSend(v7, "setChildren:", v11);

    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (CROutputRegion)outputRegionWithContentsOfCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  NSRange v21;
  NSUInteger v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  CROutputRegion *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;
  NSRange v41;
  NSRange v42;

  length = a3.length;
  location = a3.location;
  v40 = *MEMORY[0x1E0C80C00];
  if (self)
    v6 = -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](self, "copyWithZone:copyChildren:copyCandidates:deepCopy:", 0, 0, 0, 1);
  else
    v6 = 0;
  -[CROutputRegion transcriptComponents](self, "transcriptComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    -[CROutputRegion children](self, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v6;
    if (v9)
      v34 = (void *)objc_opt_new();
    else
      v34 = 0;

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v32 = self;
    -[CROutputRegion transcriptComponents](self, "transcriptComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v36 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v41.location = objc_msgSend(v20, "representedRange");
          v42.location = location;
          v42.length = length;
          v21 = NSIntersectionRange(v41, v42);
          if (v21.length)
          {
            v22 = v21.location - objc_msgSend(v20, "representedRange");
            objc_msgSend(v20, "outputRegion");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "outputRegionWithContentsOfCharacterRange:", v22, v21.length);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
              objc_msgSend(v34, "addObject:", v24);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
      }
      while (v17);
    }

    if (!objc_msgSend(v34, "count"))
    {
      -[CROutputRegion children](v32, "children");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "count");

      if (v30)
      {
        v14 = 0;
        v6 = v33;
LABEL_31:

        goto LABEL_32;
      }
    }
    v6 = v33;
    objc_msgSend(v33, "boundingQuad");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      if (!objc_msgSend(v34, "count"))
      {

LABEL_29:
        objc_msgSend(v33, "setShouldComputeBoundsFromChildren:", 0);
        goto LABEL_30;
      }
      objc_msgSend(v34, "firstObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "boundingQuad");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v28)
        goto LABEL_29;
    }
LABEL_30:
    objc_msgSend(v33, "setChildren:", v34);
    v14 = v33;
    goto LABEL_31;
  }
  objc_msgSend(v6, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (length < v11)
  {
    objc_msgSend(v6, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "substringWithRange:", location, length);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v13);

  }
  v14 = v6;
LABEL_32:

  return (CROutputRegion *)v14;
}

- (int64_t)wordCountInCharacterRange:(_NSRange)a3
{
  void *v3;
  int64_t v4;

  -[CROutputRegion outputRegionWithContentsOfCharacterRange:](self, "outputRegionWithContentsOfCharacterRange:", a3.location, a3.length);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wordCount");

  return v4;
}

- (id)closestContentRegionOfType:(unint64_t)a3 toNormalizedPoint:(CGPoint)a4 maxPixelDistance:(int64_t)a5
{
  double y;
  double x;
  void *v9;
  uint64_t v10;
  void *v11;
  double v13;

  y = a4.y;
  x = a4.x;
  -[CROutputRegion contentsWithTypes:](self, "contentsWithTypes:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 1.79769313e308;
  v10 = -[CROutputRegion _indexOfNearestRegionToPoint:regions:returnFirstMatch:distance:]((uint64_t)self, v9, 1, &v13, x, y);
  if (v10 == 0x7FFFFFFFFFFFFFFFLL || v13 > (double)a5)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", v10, v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (uint64_t)_indexOfNearestRegionToPoint:(char)a3 regions:(_QWORD *)a4 returnFirstMatch:(double)a5 distance:(double)a6
{
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v15[8];
  char v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v11 = a2;
  v12 = v11;
  if (a1)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0x7FEFFFFFFFFFFFFFLL;
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0x7FFFFFFFFFFFFFFFLL;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __81__CROutputRegion__indexOfNearestRegionToPoint_regions_returnFirstMatch_distance___block_invoke;
    v15[3] = &unk_1E98DB630;
    *(double *)&v15[6] = a5;
    *(double *)&v15[7] = a6;
    v16 = a3;
    v15[4] = &v21;
    v15[5] = &v17;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v15);
    if (a4)
      *a4 = v22[3];
    v13 = v18[3];
    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)quadForTextInCharacterRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSRange v14;
  NSUInteger v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  CROutputRegion *v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;
  NSRange v29;
  NSRange v30;

  length = a3.length;
  location = a3.location;
  v28 = *MEMORY[0x1E0C80C00];
  -[CROutputRegion transcriptComponents](self, "transcriptComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[CROutputRegion transcriptComponents](self, "transcriptComponents");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v21 = self;
      v10 = 0;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v29.location = objc_msgSend(v13, "representedRange", v21);
          v30.location = location;
          v30.length = length;
          v14 = NSIntersectionRange(v29, v30);
          if (v14.length)
          {
            v15 = v14.location - objc_msgSend(v13, "representedRange");
            objc_msgSend(v13, "outputRegion");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "quadForTextInCharacterRange:", v15, v14.length);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (v10)
            {
              -[CROutputRegion baselineAngle](v21, "baselineAngle");
              *(float *)&v18 = v18;
              objc_msgSend(v10, "unionWithNormalizedQuad:baselineAngle:", v17, v18);
              v19 = objc_claimAutoreleasedReturnValue();

              v10 = (id)v19;
            }
            else
            {
              v10 = v17;
            }

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    return v10;
  }
  else
  {
    -[CROutputRegion boundingQuad](self, "boundingQuad");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (_NSRange)rangeOfContentRegion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t m;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t length;
  uint64_t location;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  NSRange v33;
  NSRange v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  id v40;
  uint64_t v41;
  NSUInteger v42;
  NSUInteger v43;
  void *v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  _BYTE v65[128];
  uint64_t v66;
  _NSRange result;
  NSRange v68;

  v66 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CROutputRegion children](self, "children");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");
  v8 = objc_msgSend(v4, "type");

  if (v7 != v8)
    goto LABEL_14;
  v44 = v5;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  -[CROutputRegion children](self, "children");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (!v10)
    goto LABEL_13;
  v11 = v10;
  v12 = *(_QWORD *)v55;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v55 != v12)
        objc_enumerationMutation(v9);
      v14 = *(id *)(*((_QWORD *)&v54 + 1) + 8 * i);
      objc_msgSend(v14, "uuid");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v16 = (void *)v15;
        objc_msgSend(v14, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "uuid");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEqual:", v18))
        {

          goto LABEL_41;
        }

      }
      if (v14 == v4)
      {
        v14 = v4;
LABEL_41:
        v35 = v14;
        v5 = v44;
        if (self)
        {
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          -[CROutputRegion transcriptComponents](self, "transcriptComponents");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          length = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
          if (length)
          {
            v37 = *(_QWORD *)v59;
            while (2)
            {
              for (j = 0; j != length; ++j)
              {
                if (*(_QWORD *)v59 != v37)
                  objc_enumerationMutation(v36);
                v39 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
                objc_msgSend(v39, "outputRegion");
                v40 = (id)objc_claimAutoreleasedReturnValue();

                if (v40 == v35)
                {
                  location = objc_msgSend(v39, "representedRange");
                  length = v41;
                  goto LABEL_52;
                }
              }
              length = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v58, v65, 16);
              if (length)
                continue;
              break;
            }
          }
          location = 0x7FFFFFFFFFFFFFFFLL;
LABEL_52:

        }
        else
        {
          length = 0;
          location = 0;
        }

        goto LABEL_54;
      }
    }
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
    if (v11)
      continue;
    break;
  }
LABEL_13:

  v5 = v44;
LABEL_14:
  if ((objc_msgSend(v4, "contributesToDocumentHierarchy") & 1) == 0)
  {
    objc_msgSend(v4, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v29 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
    if (v29)
    {
      v30 = v29;
      length = 0;
      v31 = *(_QWORD *)v51;
      location = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (k = 0; k != v30; ++k)
        {
          if (*(_QWORD *)v51 != v31)
            objc_enumerationMutation(v9);
          v33.location = -[CROutputRegion rangeOfContentRegion:](self, "rangeOfContentRegion:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * k));
          if (v33.location != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (location == 0x7FFFFFFFFFFFFFFFLL)
            {
              length = v33.length;
              location = v33.location;
            }
            else
            {
              v68.location = location;
              v68.length = length;
              v34 = NSUnionRange(v33, v68);
              location = v34.location;
              length = v34.length;
            }
          }
        }
        v30 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v50, v63, 16);
      }
      while (v30);
      goto LABEL_54;
    }
LABEL_36:
    length = 0;
    location = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_54;
  }
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  -[CROutputRegion transcriptComponents](self, "transcriptComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
  if (!v19)
    goto LABEL_36;
  v20 = v19;
  v45 = v5;
  v21 = *(_QWORD *)v47;
  while (2)
  {
    for (m = 0; m != v20; ++m)
    {
      if (*(_QWORD *)v47 != v21)
        objc_enumerationMutation(v9);
      v23 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * m);
      objc_msgSend(v23, "outputRegion");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "rangeOfContentRegion:", v4);
      length = v26;

      if (v25 != 0x7FFFFFFFFFFFFFFFLL)
      {
        location = objc_msgSend(v23, "representedRange") + v25;
        goto LABEL_38;
      }
    }
    v20 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v46, v62, 16);
    location = 0x7FFFFFFFFFFFFFFFLL;
    if (v20)
      continue;
    break;
  }
  length = 0;
LABEL_38:
  v5 = v45;
LABEL_54:

  v42 = location;
  v43 = length;
  result.length = v43;
  result.location = v42;
  return result;
}

- (id)contentRegionOfType:(unint64_t)a3 containingTextAtIndex:(int64_t)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  _QWORD v16[5];
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__17;
  v22 = __Block_byref_object_dispose__17;
  v23 = 0;
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __60__CROutputRegion_contentRegionOfType_containingTextAtIndex___block_invoke;
  v17[3] = &unk_1E98DB578;
  v17[4] = self;
  v17[5] = a4;
  v7 = (void *)MEMORY[0x1D826E9A8](v17, a2);
  -[CROutputRegion children](self, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  v16[1] = 3221225472;
  v16[2] = __60__CROutputRegion_contentRegionOfType_containingTextAtIndex___block_invoke_2;
  v16[3] = &unk_1E98DB5A0;
  v16[4] = &v18;
  -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:]((uint64_t)self, v8, a3 & 0xFFFFFFFFFFFFC7FFLL, 1, v7, v16);

  v9 = a3 & 0x3800;
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __60__CROutputRegion_contentRegionOfType_containingTextAtIndex___block_invoke_3;
  v13[3] = &unk_1E98DB5C8;
  v10 = v7;
  v14 = v10;
  v15 = &v18;
  -[CROutputRegion enumerateContentsWithTypes:usingBlock:](self, "enumerateContentsWithTypes:usingBlock:", v9, v13);
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

BOOL __60__CROutputRegion_contentRegionOfType_containingTextAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  v3 = objc_msgSend(*(id *)(a1 + 32), "rangeOfContentRegion:", a2);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v5 >= v3;
  v6 = v5 - v3;
  v7 = !v7 || v6 >= v4;
  return !v7;
}

void __60__CROutputRegion_contentRegionOfType_containingTextAtIndex___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a3 = 1;
}

- (void)_enumerateRegions:(uint64_t)a3 withTypes:(int)a4 recursively:(void *)a5 passingTest:(void *)a6 usingBlock:
{
  id v11;
  unsigned int (**v12)(id, _QWORD);
  void (**v13)(id, void *, _BYTE *);
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a5;
  v13 = a6;
  if (a1)
  {
    v26 = 0;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v21 = v11;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
LABEL_4:
      v18 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        if (v26)
          break;
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
        if (!v12 || v12[2](v12, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18)))
        {
          if ((objc_msgSend(v19, "type") & a3) != 0)
            v13[2](v13, v19, &v26);
          if (v26)
            break;
          if (a4)
          {
            objc_msgSend(v19, "children");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[CROutputRegion _enumerateRegions:withTypes:recursively:passingTest:usingBlock:](v19, v20, a3, 1, v12, v13);

          }
        }
        if (v16 == ++v18)
        {
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          if (v16)
            goto LABEL_4;
          break;
        }
      }
    }

    v11 = v21;
  }

}

void __60__CROutputRegion_contentRegionOfType_containingTextAtIndex___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (BOOL)isEqual:(id)a3
{
  CROutputRegion *v4;
  CROutputRegion *v5;
  _BOOL4 v6;
  _BOOL4 v7;
  int v8;
  float v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  char v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;

  v4 = (CROutputRegion *)a3;
  if (self == v4)
  {
    v25 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[CROutputRegion shouldComputeBoundsFromChildren](self, "shouldComputeBoundsFromChildren");
      if (v6 != -[CROutputRegion shouldComputeBoundsFromChildren](v5, "shouldComputeBoundsFromChildren"))
        goto LABEL_26;
      v7 = -[CROutputRegion shouldComputeTranscriptFromChildren](self, "shouldComputeTranscriptFromChildren");
      if (v7 != -[CROutputRegion shouldComputeTranscriptFromChildren](v5, "shouldComputeTranscriptFromChildren"))
        goto LABEL_26;
      v8 = -[CROutputRegion confidence](self, "confidence");
      if (v8 != -[CROutputRegion confidence](v5, "confidence"))
        goto LABEL_26;
      -[CROutputRegion rawConfidence](self, "rawConfidence");
      v10 = v9;
      -[CROutputRegion rawConfidence](v5, "rawConfidence");
      if (v10 != v11)
        goto LABEL_26;
      -[CROutputRegion baselineAngle](self, "baselineAngle");
      v13 = v12;
      -[CROutputRegion baselineAngle](v5, "baselineAngle");
      if (v13 != v14)
        goto LABEL_26;
      v15 = -[CROutputRegion layoutDirection](self, "layoutDirection");
      if (v15 != -[CROutputRegion layoutDirection](v5, "layoutDirection"))
        goto LABEL_26;
      -[CROutputRegion boundingQuad](self, "boundingQuad");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CROutputRegion boundingQuad](v5, "boundingQuad");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqual:", v17);

      if (!v18)
        goto LABEL_26;
      -[CROutputRegion recognizedLocale](self, "recognizedLocale");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CROutputRegion recognizedLocale](v5, "recognizedLocale");
      v20 = objc_claimAutoreleasedReturnValue();
      if (v19 == (void *)v20)
      {

      }
      else
      {
        v21 = (void *)v20;
        -[CROutputRegion recognizedLocale](self, "recognizedLocale");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[CROutputRegion recognizedLocale](v5, "recognizedLocale");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v22, "isEqualToString:", v23);

        if (!v24)
          goto LABEL_26;
      }
      -[CROutputRegion text](self, "text");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CROutputRegion text](v5, "text");
      v27 = objc_claimAutoreleasedReturnValue();
      if (v26 == (void *)v27)
      {

      }
      else
      {
        v28 = (void *)v27;
        -[CROutputRegion text](self, "text");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[CROutputRegion text](v5, "text");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v29, "isEqualToString:", v30);

        if (!v31)
          goto LABEL_26;
      }
      -[CROutputRegion transcriptComponents](self, "transcriptComponents");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[CROutputRegion transcriptComponents](v5, "transcriptComponents");
      v33 = objc_claimAutoreleasedReturnValue();
      if (v32 == (void *)v33)
      {

      }
      else
      {
        v34 = (void *)v33;
        -[CROutputRegion transcriptComponents](self, "transcriptComponents");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[CROutputRegion transcriptComponents](v5, "transcriptComponents");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend(v35, "isEqualToArray:", v36);

        if (!v37)
          goto LABEL_26;
      }
      -[CROutputRegion children](self, "children");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CROutputRegion children](v5, "children");
      v39 = objc_claimAutoreleasedReturnValue();
      if (v38 == (void *)v39)
      {

      }
      else
      {
        v40 = (void *)v39;
        -[CROutputRegion children](self, "children");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[CROutputRegion children](v5, "children");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "isEqualToArray:", v42);

        if (!v43)
        {
LABEL_26:
          v25 = 0;
LABEL_27:

          goto LABEL_28;
        }
      }
      -[CROutputRegion candidates](self, "candidates");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[CROutputRegion candidates](v5, "candidates");
      v46 = objc_claimAutoreleasedReturnValue();
      if (v45 == (void *)v46)
      {
        v25 = 1;
        v47 = v45;
      }
      else
      {
        v47 = (void *)v46;
        -[CROutputRegion candidates](self, "candidates");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[CROutputRegion candidates](v5, "candidates");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v48, "isEqualToArray:", v49);

      }
      goto LABEL_27;
    }
    v25 = 0;
  }
LABEL_28:

  return v25;
}

- (id)scriptCategoryResults
{
  return 0;
}

- (id)sequenceScriptOutputResult
{
  return 0;
}

- (unint64_t)nmsOutputScale
{
  return 0;
}

- (unint64_t)textType
{
  return 0;
}

- (void)scaleBy:(CGPoint)a3 normalizedOffset:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v21 = *MEMORY[0x1E0C80C00];
  -[CROutputRegion boundingQuad](self, "boundingQuad");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v9, "scaledBy:normalizedOffset:", v7, v6, x, y);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[CROutputRegion children](self, "children", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "scaleBy:normalizedOffset:", v7, v6, x, y);
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CROutputRegion crCodableDataRepresentation](self, "crCodableDataRepresentation");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  compressData(v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCROutputRegionData"));
  objc_msgSend(v4, "encodeInteger:forKey:", objc_msgSend(v6, "length"), CFSTR("kCROutputRegionUncompressedDataSize"));

}

- (CROutputRegion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  void *v7;
  CROutputRegion *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCROutputRegionData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCROutputRegionUncompressedDataSize"));

  uncompressDataOfSize(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[CROutputRegion outputRegionWithCRCodableDataRepresentation:](CROutputRegion, "outputRegionWithCRCodableDataRepresentation:", v7);
  v8 = (CROutputRegion *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](self, "copyWithZone:copyChildren:copyCandidates:deepCopy:", a3, 1, 1, 1);
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  v11 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v12 = -[CROutputRegion confidence](self, "confidence");
  -[CROutputRegion baselineAngle](self, "baselineAngle");
  v13 = (void *)objc_msgSend(v11, "initWithConfidence:baselineAngle:", v12);
  -[CROutputRegion boundingQuad](self, "boundingQuad");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBoundingQuad:", v14);

  -[CROutputRegion boundingQuadHomographySinceOCRDispatch](self, "boundingQuadHomographySinceOCRDispatch");
  objc_msgSend(v13, "setBoundingQuadHomographySinceOCRDispatch:");
  -[CROutputRegion boundingQuadAtOCRDispatch](self, "boundingQuadAtOCRDispatch");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBoundingQuadAtOCRDispatch:", v15);

  -[CROutputRegion originalBoundingQuad](self, "originalBoundingQuad");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setOriginalBoundingQuad:", v16);

  -[CROutputRegion boundingQuadHomography](self, "boundingQuadHomography");
  objc_msgSend(v13, "setBoundingQuadHomography:");
  -[CROutputRegion homographyGroupID](self, "homographyGroupID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setHomographyGroupID:", v17);

  objc_msgSend(v13, "setNumberOfLines:", -[CROutputRegion numberOfLines](self, "numberOfLines"));
  objc_msgSend(v13, "setTextAlignment:", -[CROutputRegion textAlignment](self, "textAlignment"));
  objc_msgSend(v13, "setGeometryInfo:", self->_geometryInfo);
  -[CROutputRegion polygon](self, "polygon");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  objc_msgSend(v13, "setPolygon:", v19);

  objc_msgSend(v13, "setConfidence:", -[CROutputRegion confidence](self, "confidence"));
  -[CROutputRegion rawConfidence](self, "rawConfidence");
  objc_msgSend(v13, "setRawConfidence:");
  -[CROutputRegion activationProbability](self, "activationProbability");
  objc_msgSend(v13, "setActivationProbability:");
  -[CROutputRegion baselineAngle](self, "baselineAngle");
  objc_msgSend(v13, "setBaselineAngle:");
  objc_msgSend(v13, "setShouldComputeBoundsFromChildren:", -[CROutputRegion shouldComputeBoundsFromChildren](self, "shouldComputeBoundsFromChildren"));
  objc_msgSend(v13, "setShouldComputeTranscriptFromChildren:", -[CROutputRegion shouldComputeTranscriptFromChildren](self, "shouldComputeTranscriptFromChildren"));
  objc_msgSend(v13, "setShouldComputeParagraphsFromChildren:", -[CROutputRegion shouldComputeParagraphsFromChildren](self, "shouldComputeParagraphsFromChildren"));
  -[CROutputRegion recognizedLocale](self, "recognizedLocale");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRecognizedLocale:", v20);

  objc_msgSend(v13, "setLayoutDirection:", -[CROutputRegion layoutDirection](self, "layoutDirection"));
  -[CROutputRegion children](self, "children");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21 && v8)
  {
    v22 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[CROutputRegion children](self, "children");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithArray:copyItems:", v23, v6);
    objc_msgSend(v13, "setChildren:", v24);

  }
  else
  {
    objc_msgSend(v13, "setChildren:", 0);
  }
  -[CROutputRegion candidates](self, "candidates");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25 && v7)
  {
    v26 = objc_alloc(MEMORY[0x1E0C99D20]);
    -[CROutputRegion candidates](self, "candidates");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithArray:copyItems:", v27, v6);
    objc_msgSend(v13, "setCandidates:", v28);

  }
  else
  {
    objc_msgSend(v13, "setCandidates:", 0);
  }
  objc_msgSend(v13, "setParagraphRegions:", 0);
  if (!-[CROutputRegion shouldComputeParagraphsFromChildren](self, "shouldComputeParagraphsFromChildren"))
  {
    -[CROutputRegion paragraphRegions](self, "paragraphRegions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = objc_alloc(MEMORY[0x1E0C99D20]);
      -[CROutputRegion paragraphRegions](self, "paragraphRegions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v30, "initWithArray:copyItems:", v31, v6);
      objc_msgSend(v13, "setParagraphRegions:", v32);

    }
  }
  if (-[CROutputRegion shouldComputeTranscriptFromChildren](self, "shouldComputeTranscriptFromChildren") && !v8)
  {
    -[CROutputRegion text](self, "text");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v33);

    -[CROutputRegion transcriptComponents](self, "transcriptComponents");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranscriptComponents:", v34);
LABEL_20:

    goto LABEL_21;
  }
  if (-[CROutputRegion shouldComputeTranscriptFromChildren](self, "shouldComputeTranscriptFromChildren"))
  {
    if (!v8)
    {
      -[CROutputRegion text](self, "text");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v34);
      goto LABEL_20;
    }
  }
  else
  {
    -[CROutputRegion text](self, "text");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v35);

    -[CROutputRegion transcriptComponents](self, "transcriptComponents");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v37 = objc_alloc(MEMORY[0x1E0C99D20]);
      -[CROutputRegion transcriptComponents](self, "transcriptComponents");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = (void *)objc_msgSend(v37, "initWithArray:copyItems:", v34, 0);
      objc_msgSend(v13, "setTranscriptComponents:", v38);

      goto LABEL_20;
    }
  }
LABEL_21:
  -[CROutputRegion uuid](self, "uuid");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setUuid:", v39);

  -[CROutputRegion trackingID](self, "trackingID");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTrackingID:", v40);

  v41 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[CROutputRegion formFieldRegions](self, "formFieldRegions");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v41, "initWithArray:copyItems:", v42, v6);
  objc_msgSend(v13, "setFormFieldRegions:", v43);

  v44 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[CROutputRegion tableRegions](self, "tableRegions");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v44, "initWithArray:copyItems:", v45, v6);
  objc_msgSend(v13, "setTableRegions:", v46);

  return v13;
}

- (id)crCodableDataRepresentation
{
  void *v3;
  objc_class *v4;
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

  v3 = (void *)objc_opt_new();
  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", 11, v3);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v5, v3);

  +[CRCodingUtilities appendBool:toData:](CRCodingUtilities, "appendBool:toData:", -[CROutputRegion shouldComputeBoundsFromChildren](self, "shouldComputeBoundsFromChildren"), v3);
  +[CRCodingUtilities appendBool:toData:](CRCodingUtilities, "appendBool:toData:", -[CROutputRegion shouldComputeTranscriptFromChildren](self, "shouldComputeTranscriptFromChildren"), v3);
  if (!-[CROutputRegion computesTranscriptFromChildren](self, "computesTranscriptFromChildren"))
  {
    -[CROutputRegion text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v6, v3);

  }
  if (!-[CROutputRegion computesBoundsFromChildren](self, "computesBoundsFromChildren"))
  {
    -[CROutputRegion boundingQuad](self, "boundingQuad");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v7, v3);

  }
  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", -[CROutputRegion confidence](self, "confidence"), v3);
  -[CROutputRegion rawConfidence](self, "rawConfidence");
  +[CRCodingUtilities appendFloat:toData:](CRCodingUtilities, "appendFloat:toData:", v3);
  -[CROutputRegion baselineAngle](self, "baselineAngle");
  +[CRCodingUtilities appendCGFloat:toData:](CRCodingUtilities, "appendCGFloat:toData:", v3);
  -[CROutputRegion children](self, "children");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v8, v3);

  -[CROutputRegion candidates](self, "candidates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v9, v3);

  -[CROutputRegion recognizedLocale](self, "recognizedLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v10, v3);

  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", -[CROutputRegion layoutDirection](self, "layoutDirection"), v3);
  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", -[CROutputRegion numberOfLines](self, "numberOfLines"), v3);
  -[CROutputRegion formFieldRegions](self, "formFieldRegions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v11, v3);

  -[CROutputRegion uuid](self, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v13, v3);

  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", -[CROutputRegion textAlignment](self, "textAlignment"), v3);
  -[CROutputRegion tableRegions](self, "tableRegions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v14, v3);

  return v3;
}

+ (id)outputRegionWithCRCodableDataRepresentation:(id)a3
{
  id v3;
  int64_t v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v10;
  __int128 buf;
  void (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v10 = 0;
    v4 = +[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v3, &v10);
    if ((unint64_t)(v4 - 12) > 0xFFFFFFFFFFFFFFF4)
    {
      +[CRCodingUtilities stringFromEncodingData:offset:](CRCodingUtilities, "stringFromEncodingData:offset:", v3, &v10);
      v5 = (id)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_self();
      *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
      *((_QWORD *)&buf + 1) = 3221225472;
      v12 = __46__CROutputRegion_decodableClassFromClassName___block_invoke;
      v13 = &__block_descriptor_40_e5_v8__0l;
      v14 = v7;
      if (qword_1ED0B47C0 != -1)
        dispatch_once(&qword_1ED0B47C0, &buf);
      objc_msgSend((id)qword_1ED0B47B8, "objectForKeyedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)objc_msgSend(objc_alloc((Class)v8), "initWithCRCodableDataRepresentation:version:offset:", v3, v4, &v10);
    }
    else
    {
      CROSLogForCategory(0);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 134217984;
        *(_QWORD *)((char *)&buf + 4) = v4;
        _os_log_impl(&dword_1D4FB8000, v5, OS_LOG_TYPE_FAULT, "Unexpected data version %ld for CROutputRegion decoding", (uint8_t *)&buf, 0xCu);
      }
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CROutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8;
  NSObject *v9;
  CROutputRegion *v10;
  CROutputRegion *v11;
  BOOL v12;
  uint64_t v13;
  NSString *text;
  CRNormalizedQuad *v15;
  void *v16;
  uint64_t v17;
  CRNormalizedQuad *boundingQuad;
  float v19;
  double v20;
  uint64_t v21;
  NSArray *children;
  uint64_t v23;
  NSArray *candidates;
  uint64_t v25;
  NSString *recognizedLocale;
  uint64_t v27;
  NSArray *formFieldRegions;
  void *v29;
  uint64_t v30;
  NSUUID *uuid;
  uint64_t v32;
  NSArray *tableRegions;
  int v35;
  int64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if ((unint64_t)(a4 - 12) > 0xFFFFFFFFFFFFFFF4)
  {
    v11 = -[CROutputRegion init](self, "init");
    if (v11)
    {
      v11->_shouldComputeBoundsFromChildren = +[CRCodingUtilities BOOLFromEncodingData:offset:](CRCodingUtilities, "BOOLFromEncodingData:offset:", v8, a5);
      v12 = +[CRCodingUtilities BOOLFromEncodingData:offset:](CRCodingUtilities, "BOOLFromEncodingData:offset:", v8, a5);
      v11->_shouldComputeTranscriptFromChildren = v12;
      if (!v12)
      {
        +[CRCodingUtilities stringFromEncodingData:offset:](CRCodingUtilities, "stringFromEncodingData:offset:", v8, a5);
        v13 = objc_claimAutoreleasedReturnValue();
        text = v11->_text;
        v11->_text = (NSString *)v13;

      }
      if (!v11->_shouldComputeBoundsFromChildren)
      {
        v15 = [CRNormalizedQuad alloc];
        +[CRCodingUtilities objectDataFromEncodingData:offset:](CRCodingUtilities, "objectDataFromEncodingData:offset:", v8, a5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[CRNormalizedQuad initWithCRCodableDataRepresentation:](v15, "initWithCRCodableDataRepresentation:", v16);
        boundingQuad = v11->_boundingQuad;
        v11->_boundingQuad = (CRNormalizedQuad *)v17;

      }
      v11->_confidence = +[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v8, a5);
      +[CRCodingUtilities floatFromEncodingData:offset:](CRCodingUtilities, "floatFromEncodingData:offset:", v8, a5);
      v11->_rawConfidence = v19;
      +[CRCodingUtilities cgFloatFromEncodingData:offset:](CRCodingUtilities, "cgFloatFromEncodingData:offset:", v8, a5);
      v11->_baselineAngle = v20;
      +[CRCodingUtilities arrayFromEncodingData:offset:objectProviderBlock:](CRCodingUtilities, "arrayFromEncodingData:offset:objectProviderBlock:", v8, a5, &__block_literal_global_100);
      v21 = objc_claimAutoreleasedReturnValue();
      children = v11->_children;
      v11->_children = (NSArray *)v21;

      +[CRCodingUtilities arrayFromEncodingData:offset:objectProviderBlock:](CRCodingUtilities, "arrayFromEncodingData:offset:objectProviderBlock:", v8, a5, &__block_literal_global_100);
      v23 = objc_claimAutoreleasedReturnValue();
      candidates = v11->_candidates;
      v11->_candidates = (NSArray *)v23;

      if ((unint64_t)a4 < 2
        || (+[CRCodingUtilities stringFromEncodingData:offset:](CRCodingUtilities, "stringFromEncodingData:offset:", v8, a5), v25 = objc_claimAutoreleasedReturnValue(), recognizedLocale = v11->_recognizedLocale, v11->_recognizedLocale = (NSString *)v25, recognizedLocale, (unint64_t)a4 < 6)|| (v11->_layoutDirection = +[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v8, a5), (unint64_t)a4 <= 7))
      {
        -[CROutputRegion _computeNumberOfLines](v11, "_computeNumberOfLines");
      }
      else
      {
        v11->_numberOfLines = +[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v8, a5);
        if (a4 != 8)
        {
          -[CROutputRegion decodeOutputsArrayFromData:offset:]((uint64_t)v8, (uint64_t)a5);
          v27 = objc_claimAutoreleasedReturnValue();
          formFieldRegions = v11->_formFieldRegions;
          v11->_formFieldRegions = (NSArray *)v27;

          if ((unint64_t)a4 >= 0xA)
          {
            +[CRCodingUtilities stringFromEncodingData:offset:](CRCodingUtilities, "stringFromEncodingData:offset:", v8, a5);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v29);
              uuid = v11->_uuid;
              v11->_uuid = (NSUUID *)v30;

            }
            v11->_textAlignment = +[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v8, a5);
            -[CROutputRegion decodeOutputsArrayFromData:offset:]((uint64_t)v8, (uint64_t)a5);
            v32 = objc_claimAutoreleasedReturnValue();
            tableRegions = v11->_tableRegions;
            v11->_tableRegions = (NSArray *)v32;

            goto LABEL_20;
          }
        }
      }
      v11->_textAlignment = 0;
    }
LABEL_20:
    self = v11;
    v10 = self;
    goto LABEL_21;
  }
  CROSLogForCategory(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    v35 = 134217984;
    v36 = a4;
    _os_log_impl(&dword_1D4FB8000, v9, OS_LOG_TYPE_FAULT, "Unexpected data version %ld for CROutputRegion decoding", (uint8_t *)&v35, 0xCu);
  }

  v10 = 0;
LABEL_21:

  return v10;
}

- (id)decodeOutputsArrayFromData:(uint64_t)a1 offset:(uint64_t)a2
{
  +[CRCodingUtilities arrayFromEncodingData:offset:objectProviderBlock:](CRCodingUtilities, "arrayFromEncodingData:offset:objectProviderBlock:", a1, a2, &__block_literal_global_100);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)decodableSubclasses
{
  if (qword_1ED0B47B0 != -1)
    dispatch_once(&qword_1ED0B47B0, &__block_literal_global_31);
  return (id)_MergedGlobals_30;
}

void __37__CROutputRegion_decodableSubclasses__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[16];

  v2[15] = *MEMORY[0x1E0C80C00];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  v2[5] = objc_opt_class();
  v2[6] = objc_opt_class();
  v2[7] = objc_opt_class();
  v2[8] = objc_opt_class();
  v2[9] = objc_opt_class();
  v2[10] = objc_opt_class();
  v2[11] = objc_opt_class();
  v2[12] = objc_opt_class();
  v2[13] = objc_opt_class();
  v2[14] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 15);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_30;
  _MergedGlobals_30 = v0;

}

void __46__CROutputRegion_decodableClassFromClassName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "decodableSubclasses", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(objc_class **)(*((_QWORD *)&v12 + 1) + 8 * i);
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v10 = objc_msgSend(v2, "copy");
  v11 = (void *)qword_1ED0B47B8;
  qword_1ED0B47B8 = v10;

}

CROutputRegion *__52__CROutputRegion_decodeOutputsArrayFromData_offset___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[CROutputRegion outputRegionWithCRCodableDataRepresentation:](CROutputRegion, "outputRegionWithCRCodableDataRepresentation:", a2);
}

- (BOOL)contributesToDocumentHierarchy
{
  return 1;
}

- (void)_overrideSetBoundingQuad:(id)a3
{
  -[CROutputRegion setBoundingQuad:](self, "setBoundingQuad:", a3);
  -[CROutputRegion setGeometryInfo:](self, "setGeometryInfo:", 0);
}

- (void)_computeNumberOfLines
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[CROutputRegion children](self, "children", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "numberOfLines");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  -[CROutputRegion setNumberOfLines:](self, "setNumberOfLines:", v6);
}

void __81__CROutputRegion__indexOfNearestRegionToPoint_regions_returnFirstMatch_distance___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;

  objc_msgSend(a2, "boundingQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "shortestDistanceFromNormalizedPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v9 = v8;

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(double *)(v10 + 24);
  if (v9 < v11 || v9 == v11 && !*(_BYTE *)(a1 + 64))
  {
    *(double *)(v10 + 24) = v9;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3;
  }
  if (v9 == 0.0)
  {
    if (*(_BYTE *)(a1 + 64))
      *a4 = 1;
  }
}

- (CRRegionGeometryInfo)geometryInfo
{
  CRRegionGeometryInfo *geometryInfo;

  geometryInfo = self->_geometryInfo;
  if (!geometryInfo)
  {
    -[CROutputRegion _computeGeometryInfo](self, "_computeGeometryInfo");
    geometryInfo = self->_geometryInfo;
  }
  return geometryInfo;
}

- (void)_computeGeometryInfo
{
  CRRegionGeometryInfo *v3;
  CRRegionGeometryInfo *geometryInfo;

  v3 = -[CRRegionGeometryInfo initFromRegion:layoutDirection:]([CRRegionGeometryInfo alloc], "initFromRegion:layoutDirection:", self, self->_layoutDirection);
  geometryInfo = self->_geometryInfo;
  self->_geometryInfo = v3;

}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)recognizedLocale
{
  return self->_recognizedLocale;
}

- (void)setRecognizedLocale:(id)a3
{
  objc_storeStrong((id *)&self->_recognizedLocale, a3);
}

- (int)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(int)a3
{
  self->_confidence = a3;
}

- (void)setBoundingQuad:(id)a3
{
  objc_storeStrong((id *)&self->_boundingQuad, a3);
}

- (NSUUID)trackingID
{
  return (NSUUID *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTrackingID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (CRNormalizedPolyline)polygon
{
  return self->_polygon;
}

- (void)setPolygon:(id)a3
{
  objc_storeStrong((id *)&self->_polygon, a3);
}

- (NSNumber)homographyGroupID
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (void)setHomographyGroupID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSArray)children
{
  return self->_children;
}

- (NSArray)candidates
{
  return self->_candidates;
}

- (void)setCandidates:(id)a3
{
  objc_storeStrong((id *)&self->_candidates, a3);
}

- (unint64_t)layoutDirection
{
  return self->_layoutDirection;
}

- (void)setLayoutDirection:(unint64_t)a3
{
  self->_layoutDirection = a3;
}

- (void)setVisualTextAngle:(float)a3
{
  self->_visualTextAngle = a3;
}

- (int64_t)numberOfLines
{
  return self->_numberOfLines;
}

- (void)setNumberOfLines:(int64_t)a3
{
  self->_numberOfLines = a3;
}

- (unint64_t)textAlignment
{
  return self->_textAlignment;
}

- (void)setTextAlignment:(unint64_t)a3
{
  self->_textAlignment = a3;
}

- (CRNormalizedQuad)originalBoundingQuad
{
  return self->_originalBoundingQuad;
}

- (void)setOriginalBoundingQuad:(id)a3
{
  objc_storeStrong((id *)&self->_originalBoundingQuad, a3);
}

- (__n128)boundingQuadHomography
{
  return a1[15];
}

- (__n128)setBoundingQuadHomography:(__n128)a3
{
  result[15] = a2;
  result[16] = a3;
  result[17] = a4;
  return result;
}

- (CRNormalizedQuad)boundingQuadAtOCRDispatch
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 144, 1);
}

- (void)setBoundingQuadAtOCRDispatch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (double)boundingQuadHomographySinceOCRDispatch
{
  __int128 v2;

  objc_copyStruct(&v2, (const void *)(a1 + 288), 48, 1, 0);
  return *(double *)&v2;
}

- (void)setBoundingQuadHomographySinceOCRDispatch:(__n128)a3
{
  _OWORD v4[3];

  v4[0] = a2;
  v4[1] = a3;
  v4[2] = a4;
  objc_copyStruct((void *)(a1 + 288), v4, 48, 1, 0);
}

- (void)setTranscriptComponents:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptComponents, a3);
}

- (BOOL)significantTranscriptChange
{
  return self->_significantTranscriptChange;
}

- (void)setSignificantTranscriptChange:(BOOL)a3
{
  self->_significantTranscriptChange = a3;
}

- (float)rawConfidence
{
  return self->_rawConfidence;
}

- (void)setRawConfidence:(float)a3
{
  self->_rawConfidence = a3;
}

- (double)activationProbability
{
  return self->_activationProbability;
}

- (void)setActivationProbability:(double)a3
{
  self->_activationProbability = a3;
}

- (double)baselineAngle
{
  return self->_baselineAngle;
}

- (void)setBaselineAngle:(double)a3
{
  self->_baselineAngle = a3;
}

- (CRNormalizedQuad)boundingQuadAfterOCR
{
  return (CRNormalizedQuad *)objc_getProperty(self, a2, 176, 1);
}

- (void)setBoundingQuadAfterOCR:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (void)setGeometryInfo:(id)a3
{
  objc_storeStrong((id *)&self->_geometryInfo, a3);
}

- (BOOL)shouldComputeBoundsFromChildren
{
  return self->_shouldComputeBoundsFromChildren;
}

- (void)setShouldComputeBoundsFromChildren:(BOOL)a3
{
  self->_shouldComputeBoundsFromChildren = a3;
}

- (BOOL)shouldComputeTranscriptFromChildren
{
  return self->_shouldComputeTranscriptFromChildren;
}

- (void)setShouldComputeTranscriptFromChildren:(BOOL)a3
{
  self->_shouldComputeTranscriptFromChildren = a3;
}

- (BOOL)shouldComputeParagraphsFromChildren
{
  return self->_shouldComputeParagraphsFromChildren;
}

- (void)setShouldComputeParagraphsFromChildren:(BOOL)a3
{
  self->_shouldComputeParagraphsFromChildren = a3;
}

- (NSArray)dataDetectorRegions
{
  return self->_dataDetectorRegions;
}

- (void)setDataDetectorRegions:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetectorRegions, a3);
}

- (NSArray)dataDetectorGroupRegions
{
  return self->_dataDetectorGroupRegions;
}

- (void)setDataDetectorGroupRegions:(id)a3
{
  objc_storeStrong((id *)&self->_dataDetectorGroupRegions, a3);
}

- (NSArray)paragraphRegions
{
  return self->_paragraphRegions;
}

- (void)setParagraphRegions:(id)a3
{
  objc_storeStrong((id *)&self->_paragraphRegions, a3);
}

- (NSArray)listRegions
{
  return self->_listRegions;
}

- (void)setListRegions:(id)a3
{
  objc_storeStrong((id *)&self->_listRegions, a3);
}

- (NSArray)tableRegions
{
  return self->_tableRegions;
}

- (void)setTableRegions:(id)a3
{
  objc_storeStrong((id *)&self->_tableRegions, a3);
}

- (NSArray)formFieldRegions
{
  return self->_formFieldRegions;
}

- (void)setFormFieldRegions:(id)a3
{
  objc_storeStrong((id *)&self->_formFieldRegions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formFieldRegions, 0);
  objc_storeStrong((id *)&self->_tableRegions, 0);
  objc_storeStrong((id *)&self->_listRegions, 0);
  objc_storeStrong((id *)&self->_paragraphRegions, 0);
  objc_storeStrong((id *)&self->_dataDetectorGroupRegions, 0);
  objc_storeStrong((id *)&self->_dataDetectorRegions, 0);
  objc_storeStrong((id *)&self->_geometryInfo, 0);
  objc_storeStrong((id *)&self->_boundingQuadAfterOCR, 0);
  objc_storeStrong((id *)&self->_transcriptComponents, 0);
  objc_storeStrong((id *)&self->_boundingQuadAtOCRDispatch, 0);
  objc_storeStrong((id *)&self->_originalBoundingQuad, 0);
  objc_storeStrong((id *)&self->_candidates, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_homographyGroupID, 0);
  objc_storeStrong((id *)&self->_polygon, 0);
  objc_storeStrong((id *)&self->_trackingID, 0);
  objc_storeStrong((id *)&self->_boundingQuad, 0);
  objc_storeStrong((id *)&self->_recognizedLocale, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_vcImageSpaceQuad, 0);
}

@end
