@implementation CRLineOutputRegion

- (CRLineOutputRegion)initWithConfidence:(int)a3 baselineAngle:(double)a4
{
  CRLineOutputRegion *v4;
  CRLineOutputRegion *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLineOutputRegion;
  v4 = -[CROutputRegion initWithConfidence:baselineAngle:](&v7, sel_initWithConfidence_baselineAngle_, *(_QWORD *)&a3, a4);
  v5 = v4;
  if (v4)
    -[CROutputRegion setNumberOfLines:](v4, "setNumberOfLines:", 1);
  return v5;
}

- (CRLineOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8;
  CRLineOutputRegion *v9;
  unint64_t v10;
  objc_super v12;

  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CRLineOutputRegion;
  v9 = -[CROutputRegion initWithCRCodableDataRepresentation:version:offset:](&v12, sel_initWithCRCodableDataRepresentation_version_offset_, v8, a4, a5);
  if (v9)
  {
    if (a4 >= 11)
    {
      v10 = +[CRCodingUtilities unsignedIntegerFromEncodingData:offset:](CRCodingUtilities, "unsignedIntegerFromEncodingData:offset:", v8, a5);
    }
    else if (a4 >= 5)
    {
      v10 = +[CRCodingUtilities unsignedIntegerFromEncodingData:offset:](CRCodingUtilities, "unsignedIntegerFromEncodingData:offset:", v8, a5)+ 1;
    }
    else if (a4 == 4)
    {
      if (+[CRCodingUtilities BOOLFromEncodingData:offset:](CRCodingUtilities, "BOOLFromEncodingData:offset:", v8, a5))
      {
        v10 = 2;
      }
      else
      {
        v10 = 1;
      }
    }
    else
    {
      v10 = 0;
    }
    v9->_lineWrappingType = v10;
  }

  return v9;
}

- (id)crCodableDataRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0C99DF0];
  v7.receiver = self;
  v7.super_class = (Class)CRLineOutputRegion;
  -[CROutputRegion crCodableDataRepresentation](&v7, sel_crCodableDataRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRCodingUtilities appendUInteger:toData:](CRCodingUtilities, "appendUInteger:toData:", -[CRLineOutputRegion lineWrappingType](self, "lineWrappingType"), v5);
  return v5;
}

+ (id)lineWithTextFeature:(id)a3 subfeatureType:(unint64_t)a4 imageSize:(CGSize)a5 confidenceThresholdProvider:(id)a6 injectSpaceCharacter:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;

  v7 = a7;
  height = a5.height;
  width = a5.width;
  v13 = a3;
  v14 = a6;
  +[CRLineOutputRegion lineWithTextFeature:candidateIdx:subfeatureType:imageSize:confidenceThresholdProvider:injectSpaceCharacter:](width, height, (uint64_t)a1, v13, 0, a4, v14, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v13, "stringValueCandidates");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "arrayWithCapacity:", objc_msgSend(v17, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringValueCandidates");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    v21 = 0;
    do
    {
      +[CRLineOutputRegion lineWithTextFeature:candidateIdx:subfeatureType:imageSize:confidenceThresholdProvider:injectSpaceCharacter:](width, height, (uint64_t)a1, v13, v21, a4, v14, v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v22);

      ++v21;
      objc_msgSend(v13, "stringValueCandidates");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "count");

    }
    while (v21 < v24);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v18);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCandidates:", v25);

  return v15;
}

+ (CRLineOutputRegion)lineWithTextFeature:(uint64_t)a3 candidateIdx:(void *)a4 subfeatureType:(uint64_t)a5 imageSize:(uint64_t)a6 confidenceThresholdProvider:(void *)a7 injectSpaceCharacter:(int)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  CRLineOutputRegion *v20;
  float v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  CRNormalizedQuad *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CRNormalizedQuad *v42;
  void *v43;
  uint64_t v44;
  char v45;
  BOOL v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t i;
  uint64_t v62;
  void *v63;
  void *v65;
  void *v66;
  void *v67;
  CRLineOutputRegion *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  id v76;
  __CFString *v77;
  id v78;
  id v79;
  _QWORD *v80;
  _QWORD *v81;
  _QWORD *v82;
  uint64_t v83;
  double v84;
  double v85;
  _QWORD v86[5];
  id v87;
  _QWORD v88[5];
  id v89;
  _QWORD v90[4];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a7;
  objc_opt_self();
  v69 = v14;
  objc_msgSend(v14, "selectedLocale");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "thresholdsForTextRegion:withLocale:", v14, v16);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "candidateProbs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectAtIndexedSubscript:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "doubleValue");
  v19 = +[CRImageReaderOutput confidenceLevelForConfidenceScore:confidenceThresholds:](CRImageReaderOutput, "confidenceLevelForConfidenceScore:confidenceThresholds:", v66);

  v20 = [CRLineOutputRegion alloc];
  objc_msgSend(v14, "baselineAngle");
  v68 = -[CRLineOutputRegion initWithConfidence:baselineAngle:](v20, "initWithConfidence:baselineAngle:", v19, v21);
  objc_msgSend(v14, "subFeatureCandidates");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");

  objc_msgSend(v14, "stringValueCandidates");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectAtIndexedSubscript:", a5);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "stringByTrimmingCharactersInSet:", v67);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setText:](v68, "setText:", v26);

  v27 = [CRNormalizedQuad alloc];
  objc_msgSend(v14, "topLeft");
  v29 = v28;
  v31 = v30;
  objc_msgSend(v14, "topRight");
  v33 = v32;
  v35 = v34;
  objc_msgSend(v14, "bottomRight");
  v37 = v36;
  v39 = v38;
  objc_msgSend(v14, "bottomLeft");
  v42 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v27, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v29, v31, v33, v35, v37, v39, v40, v41, *(_QWORD *)&a1, *(_QWORD *)&a2);
  -[CROutputRegion setBoundingQuad:](v68, "setBoundingQuad:", v42);

  objc_msgSend(v14, "polygon");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setPolygon:](v68, "setPolygon:", v43);

  -[CRCompositeOutputRegion setShouldComputeBoundsFromChildren:](v68, "setShouldComputeBoundsFromChildren:", 0);
  if (v24)
  {
    if (a6 == 16)
    {
      v44 = 1;
      goto LABEL_7;
    }
    v45 = objc_msgSend(v14, "whitespaceInjected");
    v44 = 1;
    if ((v45 & 1) != 0 || (a8 & 1) != 0)
      goto LABEL_7;
  }
  v44 = 0;
LABEL_7:
  v46 = v24 == 0;
  -[CROutputRegion setShouldComputeTranscriptFromChildren:](v68, "setShouldComputeTranscriptFromChildren:", v44);
  objc_msgSend(v14, "candidateProbs");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectAtIndexedSubscript:", a5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "floatValue");
  -[CROutputRegion setRawConfidence:](v68, "setRawConfidence:");

  objc_msgSend(v14, "candidateActivationProbs");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "objectAtIndexedSubscript:", a5);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "doubleValue");
  -[CROutputRegion setActivationProbability:](v68, "setActivationProbability:");

  objc_msgSend(v14, "selectedLocale");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setRecognizedLocale:](v68, "setRecognizedLocale:", v51);

  objc_msgSend(v14, "uuid");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setUuid:](v68, "setUuid:", v52);

  -[CRLineOutputRegion setLineWrappingType:](v68, "setLineWrappingType:", objc_msgSend(v14, "lineWrappingType"));
  if (v46)
    v53 = 0;
  else
    v53 = (void *)objc_opt_new();
  if (a6 == 32 && a8)
  {
    v90[0] = 0;
    v90[1] = v90;
    v90[2] = 0x2020000000;
    v90[3] = 0;
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x3032000000;
    v88[3] = __Block_byref_object_copy__4;
    v88[4] = __Block_byref_object_dispose__4;
    v89 = 0;
    v86[0] = 0;
    v86[1] = v86;
    v86[2] = 0x3032000000;
    v86[3] = __Block_byref_object_copy__4;
    v86[4] = __Block_byref_object_dispose__4;
    v87 = 0;
    -[CROutputRegion text](v68, "text");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion text](v68, "text");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v55, "length");
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __129__CRLineOutputRegion_lineWithTextFeature_candidateIdx_subfeatureType_imageSize_confidenceThresholdProvider_injectSpaceCharacter___block_invoke;
    v74[3] = &unk_1E98DA138;
    v83 = a5;
    v75 = v14;
    v80 = v90;
    v76 = v67;
    v77 = CFSTR(" ");
    v81 = v86;
    v82 = v88;
    v84 = a1;
    v85 = a2;
    v78 = v53;
    v79 = v15;
    objc_msgSend(v54, "enumerateSubstringsInRange:options:usingBlock:", 0, v56, 2, v74);

    _Block_object_dispose(v86, 8);
    _Block_object_dispose(v88, 8);

    _Block_object_dispose(v90, 8);
  }
  else if (a6 == 32 || a6 == 16)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend(v14, "subFeatureCandidates");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "objectAtIndexedSubscript:", a5);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
    if (v59)
    {
      v60 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v59; ++i)
        {
          if (*(_QWORD *)v71 != v60)
            objc_enumerationMutation(v58);
          v62 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
          if (a6 == 32)
            +[CRCharacterOutputRegion characterWithTextFeature:imageSize:confidenceThresholdProvider:](CRCharacterOutputRegion, "characterWithTextFeature:imageSize:confidenceThresholdProvider:", v62, v15, a1, a2);
          else
            +[CRWordOutputRegion wordWithTextFeature:imageSize:confidenceThresholdProvider:](CRWordOutputRegion, "wordWithTextFeature:imageSize:confidenceThresholdProvider:", v62, v15, a1, a2);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "addObject:", v63);

        }
        v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v70, v91, 16);
      }
      while (v59);
    }

  }
  else
  {
    NSLog(CFSTR("Unsupported subfeature type %ld"), a6);
  }
  -[CROutputRegion setChildren:](v68, "setChildren:", v53);

  return v68;
}

+ (id)lineWithTextFeature:(id)a3 subfeatureType:(unint64_t)a4 imageSize:(CGSize)a5 confidenceThresholdProvider:(id)a6
{
  return +[CRLineOutputRegion lineWithTextFeature:subfeatureType:imageSize:confidenceThresholdProvider:injectSpaceCharacter:](CRLineOutputRegion, "lineWithTextFeature:subfeatureType:imageSize:confidenceThresholdProvider:injectSpaceCharacter:", a3, a4, a6, 1, a5.width, a5.height);
}

+ (id)lineWithDetectedRegion:(id)a3
{
  id v3;
  CRLineOutputRegion *v4;
  void *v5;
  CRLineOutputRegion *v6;
  void *v7;
  void *v8;

  v3 = a3;
  v4 = [CRLineOutputRegion alloc];
  objc_msgSend(v3, "boundingQuad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baselineAngle");
  v6 = -[CRLineOutputRegion initWithConfidence:baselineAngle:](v4, "initWithConfidence:baselineAngle:", 1);

  objc_msgSend(v3, "boundingQuad");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setBoundingQuad:](v6, "setBoundingQuad:", v7);

  -[CROutputRegion setLayoutDirection:](v6, "setLayoutDirection:", objc_msgSend(v3, "layoutDirection"));
  objc_msgSend(v3, "polygon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setPolygon:](v6, "setPolygon:", v8);

  -[CRLineOutputRegion setDetectedLineRegion:](v6, "setDetectedLineRegion:", v3);
  -[CRCompositeOutputRegion setShouldComputeBoundsFromChildren:](v6, "setShouldComputeBoundsFromChildren:", 0);
  -[CROutputRegion setShouldComputeTranscriptFromChildren:](v6, "setShouldComputeTranscriptFromChildren:", 0);
  return v6;
}

+ (id)lineWithTextRegion:(id)a3 confidenceThresholdProvider:(id)a4 injectSpaceCharacter:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  CRLineOutputRegion *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  char v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  unint64_t v46;
  void *v47;
  void *v48;
  CRLineOutputRegion *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[4];
  id v60;
  id v61;
  __CFString *v62;
  id v63;
  id v64;
  _QWORD *v65;
  _QWORD *v66;
  _QWORD *v67;
  _QWORD *v68;
  id v69;
  BOOL v70;
  _QWORD v71[6];
  _QWORD v72[5];
  id v73;
  _QWORD v74[5];
  id v75;
  _QWORD v76[4];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v5 = a5;
  v79 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v50 = v7;
  objc_msgSend(v7, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "thresholdsForTextRegion:withLocale:", v7, v9);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "confidence");
  v10 = +[CRImageReaderOutput confidenceLevelForConfidenceScore:confidenceThresholds:](CRImageReaderOutput, "confidenceLevelForConfidenceScore:confidenceThresholds:", v47);
  objc_msgSend(v7, "subregions");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = [CRLineOutputRegion alloc];
  objc_msgSend(v7, "boundingQuad");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "baselineAngle");
  v49 = -[CRLineOutputRegion initWithConfidence:baselineAngle:](v11, "initWithConfidence:baselineAngle:", v10);

  v13 = objc_msgSend(v48, "count");
  if (v13)
  {
    objc_msgSend(v7, "subregions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v15, "textRegionType");

  }
  else
  {
    v46 = 0;
  }
  objc_msgSend(v7, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setText:](v49, "setText:", v18);

  objc_msgSend(v7, "boundingQuad");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setBoundingQuad:](v49, "setBoundingQuad:", v19);

  objc_msgSend(v7, "polygon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setPolygon:](v49, "setPolygon:", v20);

  -[CRCompositeOutputRegion setShouldComputeBoundsFromChildren:](v49, "setShouldComputeBoundsFromChildren:", 0);
  if (!v13)
    goto LABEL_9;
  if (v46 == 1)
  {
    v21 = 1;
    goto LABEL_10;
  }
  v22 = objc_msgSend(v7, "whitespaceInjected");
  v21 = 1;
  if ((v22 & 1) == 0 && !v5)
LABEL_9:
    v21 = 0;
LABEL_10:
  -[CROutputRegion setShouldComputeTranscriptFromChildren:](v49, "setShouldComputeTranscriptFromChildren:", v21);
  objc_msgSend(v7, "confidence");
  *(float *)&v23 = v23;
  -[CROutputRegion setRawConfidence:](v49, "setRawConfidence:", v23);
  objc_msgSend(v7, "activationProbability");
  -[CROutputRegion setActivationProbability:](v49, "setActivationProbability:");
  objc_msgSend(v7, "locale");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion setRecognizedLocale:](v49, "setRecognizedLocale:", v24);

  -[CROutputRegion setLayoutDirection:](v49, "setLayoutDirection:", objc_msgSend(v7, "layoutDirection"));
  objc_msgSend(v7, "detectedLineRegion");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[CRLineOutputRegion setDetectedLineRegion:](v49, "setDetectedLineRegion:", v25);

  if (v13)
  {
    v26 = (id)objc_opt_new();
    if (v46 || !v5)
    {
      if (v46 > 1)
      {
        NSLog(CFSTR("Unsupported subfeature type %ld"), v46);
      }
      else
      {
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v32 = v48;
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v78, 16);
        if (v33)
        {
          v34 = *(_QWORD *)v56;
          do
          {
            for (i = 0; i != v33; ++i)
            {
              if (*(_QWORD *)v56 != v34)
                objc_enumerationMutation(v32);
              +[CROutputRegion outputRegionFromTextRegion:confidenceThresholdProvider:injectSpaceCharacter:](CROutputRegion, "outputRegionFromTextRegion:confidenceThresholdProvider:injectSpaceCharacter:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i), v8, v5);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "addObject:", v36);

            }
            v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v55, v78, 16);
          }
          while (v33);
        }

      }
    }
    else
    {
      v76[0] = 0;
      v76[1] = v76;
      v76[2] = 0x2020000000;
      v76[3] = 0;
      v74[0] = 0;
      v74[1] = v74;
      v74[2] = 0x3032000000;
      v74[3] = __Block_byref_object_copy__4;
      v74[4] = __Block_byref_object_dispose__4;
      v75 = 0;
      v72[0] = 0;
      v72[1] = v72;
      v72[2] = 0x3032000000;
      v72[3] = __Block_byref_object_copy__4;
      v72[4] = __Block_byref_object_dispose__4;
      v73 = 0;
      v71[0] = 0;
      v71[1] = v71;
      v71[2] = 0x3010000000;
      v71[4] = 0;
      v71[5] = 0;
      v71[3] = &unk_1D5168E96;
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CROutputRegion text](v49, "text");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[CROutputRegion text](v49, "text");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "length");
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __90__CRLineOutputRegion_lineWithTextRegion_confidenceThresholdProvider_injectSpaceCharacter___block_invoke;
      v59[3] = &unk_1E98DA110;
      v65 = v71;
      v60 = v48;
      v66 = v76;
      v31 = v27;
      v61 = v31;
      v62 = CFSTR(" ");
      v67 = v72;
      v68 = v74;
      v69 = a1;
      v26 = v26;
      v63 = v26;
      v64 = v8;
      v70 = v5;
      objc_msgSend(v28, "enumerateSubstringsInRange:options:usingBlock:", 0, v30, 2, v59);

      _Block_object_dispose(v71, 8);
      _Block_object_dispose(v72, 8);

      _Block_object_dispose(v74, 8);
      _Block_object_dispose(v76, 8);
    }
  }
  else
  {
    v26 = 0;
  }
  -[CROutputRegion setChildren:](v49, "setChildren:", v26);
  objc_msgSend(v50, "candidates");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (v37)
    v38 = (void *)objc_opt_new();
  else
    v38 = 0;

  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v50, "candidates");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v51, v77, 16);
  if (v40)
  {
    v41 = *(_QWORD *)v52;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v52 != v41)
          objc_enumerationMutation(v39);
        +[CRLineOutputRegion lineWithTextRegion:confidenceThresholdProvider:injectSpaceCharacter:](CRLineOutputRegion, "lineWithTextRegion:confidenceThresholdProvider:injectSpaceCharacter:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * j), v8, v5);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v43);

      }
      v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v51, v77, 16);
    }
    while (v40);
  }

  -[CROutputRegion setCandidates:](v49, "setCandidates:", v38);
  return v49;
}

void __90__CRLineOutputRegion_lineWithTextRegion_confidenceThresholdProvider_injectSpaceCharacter___block_invoke(uint64_t a1, void *a2, NSUInteger a3, NSUInteger a4)
{
  NSRange v7;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  NSRange v29;

  v28 = a2;
  v29.location = a3;
  v29.length = a4;
  v7 = NSIntersectionRange(v29, *(NSRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 32));
  if (v7.location == 0x7FFFFFFFFFFFFFFFLL || v7.length == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "rangeOfCharacterFromSet:", *(_QWORD *)(a1 + 40)) == 0x7FFFFFFFFFFFFFFFLL)
    {
      +[CROutputRegion outputRegionFromTextRegion:confidenceThresholdProvider:injectSpaceCharacter:](CROutputRegion, "outputRegionFromTextRegion:confidenceThresholdProvider:injectSpaceCharacter:", v9, *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 112));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), v9);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "text");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *(_QWORD *)(a1 + 48));

      if ((v14 & 1) == 0)
      {
        v15 = *(_QWORD *)(a1 + 104);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "boundingQuad");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "boundingQuad");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[CRLineOutputRegion _spaceCharacterQuadBetweenQuad1:quad2:](v15, v16, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = *(_QWORD *)(a1 + 48);
        v20 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "confidence");
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "baselineAngle");
        +[CRCharacterOutputRegion characterWithText:confidence:quad:baselineAngle:](CRCharacterOutputRegion, "characterWithText:confidence:quad:baselineAngle:", v19, v20, v18);
        v21 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 56), "addObject:", v21);
        v22 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        v23 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = v21;

      }
    }
    v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "text");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "length");
    v27 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    *(_QWORD *)(v27 + 32) = 0;
    *(_QWORD *)(v27 + 40) = v26 + v24;

  }
}

+ (CRNormalizedQuad)_spaceCharacterQuadBetweenQuad1:(void *)a3 quad2:
{
  id v4;
  id v5;
  CRNormalizedQuad *v6;
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
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v26;
  double v27;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  v6 = [CRNormalizedQuad alloc];
  objc_msgSend(v5, "topRight");
  v26 = v8;
  v27 = v7;
  objc_msgSend(v4, "topLeft");
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "bottomLeft");
  v14 = v13;
  v16 = v15;

  objc_msgSend(v5, "bottomRight");
  v18 = v17;
  v20 = v19;
  objc_msgSend(v5, "normalizationSize");
  v22 = v21;
  v24 = v23;

  return -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v6, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v27, v26, v10, v12, v14, v16, v18, v20, v22, v24);
}

void __129__CRLineOutputRegion_lineWithTextFeature_candidateIdx_subfeatureType_imageSize_confidenceThresholdProvider_injectSpaceCharacter___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  CRNormalizedQuad *v13;
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
  double v27;
  CRNormalizedQuad *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id obj;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "subFeatureCandidates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 96));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  obj = (id)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "rangeOfCharacterFromSet:", *(_QWORD *)(a1 + 40));
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    +[CRCharacterOutputRegion characterWithTextFeature:imageSize:confidenceThresholdProvider:](CRCharacterOutputRegion, "characterWithTextFeature:imageSize:confidenceThresholdProvider:", obj, *(_QWORD *)(a1 + 64), *(double *)(a1 + 104), *(double *)(a1 + 112));
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), obj);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 48));

    if ((v12 & 1) == 0)
    {
      v13 = [CRNormalizedQuad alloc];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "topRight");
      v15 = v14;
      v17 = v16;
      objc_msgSend(obj, "topLeft");
      v19 = v18;
      v21 = v20;
      objc_msgSend(obj, "bottomLeft");
      v23 = v22;
      v25 = v24;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "bottomRight");
      v28 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v13, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v15, v17, v19, v21, v23, v25, v26, v27, *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112));
      v29 = *(_QWORD *)(a1 + 48);
      v30 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "confidence");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "baselineAngle");
      +[CRCharacterOutputRegion characterWithText:confidence:quad:baselineAngle:](CRCharacterOutputRegion, "characterWithText:confidence:quad:baselineAngle:", v29, v30, v28);
      v31 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v31);
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v33 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = v31;

    }
  }

}

+ (id)lineWithText:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  uint64_t v7;
  id v9;
  id v10;
  CRLineOutputRegion *v11;

  v7 = *(_QWORD *)&a4;
  v9 = a5;
  v10 = a3;
  v11 = -[CRLineOutputRegion initWithConfidence:baselineAngle:]([CRLineOutputRegion alloc], "initWithConfidence:baselineAngle:", v7, a6);
  -[CROutputRegion setText:](v11, "setText:", v10);

  -[CROutputRegion setBoundingQuad:](v11, "setBoundingQuad:", v9);
  -[CRCompositeOutputRegion setShouldComputeBoundsFromChildren:](v11, "setShouldComputeBoundsFromChildren:", 0);
  -[CROutputRegion setShouldComputeTranscriptFromChildren:](v11, "setShouldComputeTranscriptFromChildren:", 0);
  -[CROutputRegion setChildren:](v11, "setChildren:", 0);
  return v11;
}

+ (id)lineWithWords:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  return +[CRLineOutputRegion _lineWithChildren:confidence:quad:baselineAngle:](a6, (uint64_t)a1, a3, *(uint64_t *)&a4, a5);
}

+ (CRLineOutputRegion)_lineWithChildren:(void *)a3 confidence:(uint64_t)a4 quad:(void *)a5 baselineAngle:
{
  id v8;
  id v9;
  CRLineOutputRegion *v10;

  v8 = a5;
  v9 = a3;
  objc_opt_self();
  v10 = -[CRLineOutputRegion initWithConfidence:baselineAngle:]([CRLineOutputRegion alloc], "initWithConfidence:baselineAngle:", a4, a1);
  -[CROutputRegion setShouldComputeTranscriptFromChildren:](v10, "setShouldComputeTranscriptFromChildren:", 1);
  if (v8)
  {
    -[CRCompositeOutputRegion setShouldComputeBoundsFromChildren:](v10, "setShouldComputeBoundsFromChildren:", 0);
    -[CROutputRegion setBoundingQuad:](v10, "setBoundingQuad:", v8);
  }
  else
  {
    -[CRCompositeOutputRegion setShouldComputeBoundsFromChildren:](v10, "setShouldComputeBoundsFromChildren:", 1);
  }
  -[CROutputRegion setChildren:](v10, "setChildren:", v9);

  return v10;
}

+ (id)lineWithCharacters:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  return +[CRLineOutputRegion _lineWithChildren:confidence:quad:baselineAngle:](a6, (uint64_t)a1, a3, *(uint64_t *)&a4, a5);
}

- (id)scriptCategoryResults
{
  void *v2;
  void *v3;

  -[CRLineOutputRegion detectedLineRegion](self, "detectedLineRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scriptCategoryResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sequenceScriptOutputResult
{
  void *v2;
  void *v3;

  -[CRLineOutputRegion detectedLineRegion](self, "detectedLineRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sequenceScriptOutputResult");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)nmsOutputScale
{
  void *v2;
  unint64_t v3;

  -[CRLineOutputRegion detectedLineRegion](self, "detectedLineRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "nmsOutputScale");

  return v3;
}

- (unint64_t)textType
{
  void *v2;
  unint64_t v3;

  -[CRLineOutputRegion detectedLineRegion](self, "detectedLineRegion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "textType");

  return v3;
}

- (id)contentBaselines
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[CROutputRegion children](self, "children", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "contentBaselines");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "firstObject");
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v5)
        {
          objc_msgSend(v5, "polylineByAppendingPolyline:", v9);
          v11 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v11;
        }
        else
        {
          v5 = (void *)v9;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v4);

    if (!v5)
    {
      v13 = (void *)MEMORY[0x1E0C9AA60];
      return v13;
    }
    objc_msgSend(v5, "simplified");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v5;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v13;
}

- (int64_t)wordCount
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  id v6;
  uint64_t v7;
  int64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[CROutputRegion recognizedLocale](self, "recognizedLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[CRImageReader languageIsChinese:](CRImageReader, "languageIsChinese:", v3);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __31__CRLineOutputRegion_wordCount__block_invoke;
    v10[3] = &unk_1E98DA160;
    v6 = v5;
    v11 = v6;
    v12 = &v13;
    -[CROutputRegion enumerateContentsWithTypes:usingBlock:](self, "enumerateContentsWithTypes:usingBlock:", 32, v10);

  }
  else
  {
    -[CROutputRegion contentsWithTypes:](self, "contentsWithTypes:", 16);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v14[3] += v7;
  }

  v8 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v8;
}

void __31__CRLineOutputRegion_wordCount__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (unint64_t)type
{
  return 8;
}

- (CGRect)boundingBoxEstimateAfterTrimmingCharacters:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect result;

  v4 = a3;
  -[CROutputRegion boundingQuad](self, "boundingQuad");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "denormalizedQuad");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "boundingBox");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  -[CROutputRegion text](self, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "length");
  objc_msgSend(v15, "stringByTrimmingCharactersInSet:", v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v15, "rangeOfString:", v17);
  v20 = (double)v19 / (double)v16;
  if (v20 == 0.0)
  {
    v21 = *MEMORY[0x1E0C9D648];
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v22 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  else
  {
    v21 = v8 + v12 * ((double)v18 / (double)v16);
    v22 = v12 * v20;
  }

  v23 = v21;
  v24 = v10;
  v25 = v22;
  v26 = v14;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (id)joiningDelimiter
{
  return +[CRLineWrapper joiningDelimiterForLine:useLineSeparatorAsLineBreak:](CRLineWrapper, "joiningDelimiterForLine:useLineSeparatorAsLineBreak:", self, -[CRLineOutputRegion useLineSeparatorAsLineBreak](self, "useLineSeparatorAsLineBreak"));
}

- (BOOL)shouldWrapToNextLine
{
  return -[CRLineOutputRegion lineWrappingType](self, "lineWrappingType") != 1
      && -[CRLineOutputRegion lineWrappingType](self, "lineWrappingType") != 0;
}

- (BOOL)isEqual:(id)a3
{
  CRLineOutputRegion *v4;
  CRLineOutputRegion *v5;
  unint64_t v6;
  BOOL v7;
  objc_super v9;

  v4 = (CRLineOutputRegion *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v9.receiver = self;
      v9.super_class = (Class)CRLineOutputRegion;
      if (-[CROutputRegion isEqual:](&v9, sel_isEqual_, v5))
      {
        v6 = -[CRLineOutputRegion lineWrappingType](self, "lineWrappingType");
        v7 = v6 == -[CRLineOutputRegion lineWrappingType](v5, "lineWrappingType");
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)computesNumberOfLinesFromChildren
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLineOutputRegion;
  v7 = -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](&v10, sel_copyWithZone_copyChildren_copyCandidates_deepCopy_, a3, a4, a5, a6);
  objc_msgSend(v7, "setLineWrappingType:", -[CRLineOutputRegion lineWrappingType](self, "lineWrappingType"));
  objc_msgSend(v7, "setUseLineSeparatorAsLineBreak:", -[CRLineOutputRegion useLineSeparatorAsLineBreak](self, "useLineSeparatorAsLineBreak"));
  -[CRLineOutputRegion detectedLineRegion](self, "detectedLineRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDetectedLineRegion:", v8);

  return v7;
}

- (unint64_t)textRegionType
{
  return 2;
}

- (NSLocale)locale
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DC8];
  -[CROutputRegion recognizedLocale](self, "recognizedLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localeWithLocaleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSLocale *)v4;
}

- (double)confidenceScore
{
  float v2;

  -[CROutputRegion rawConfidence](self, "rawConfidence");
  return v2;
}

- (void)mergeWithLine:(id)a3
{
  id v4;
  id v5;
  void *v6;
  float v7;
  void *v8;
  uint64_t v9;
  void *v10;
  float v11;
  float v12;
  float v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t i;
  void *v44;
  unint64_t v45;
  void *v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  id v54;
  void *v55;
  double v56;
  double v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  double v71;
  void *v72;
  void *v73;
  uint8_t buf[4];
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[CROutputRegion text](self, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (float)(unint64_t)objc_msgSend(v6, "length");
    -[CROutputRegion text](self, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");
    objc_msgSend(v5, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v7 / (float)(unint64_t)(objc_msgSend(v10, "length") + v9);

    -[CROutputRegion rawConfidence](self, "rawConfidence");
    v13 = v12;
    objc_msgSend(v5, "rawConfidence");
    *(float *)&v15 = (float)((float)(1.0 - v11) * v14) + (float)(v13 * v11);
    -[CROutputRegion setRawConfidence:](self, "setRawConfidence:", v15);
    -[CROutputRegion activationProbability](self, "activationProbability");
    v17 = v16;
    objc_msgSend(v5, "activationProbability");
    -[CROutputRegion setActivationProbability:](self, "setActivationProbability:", v18 * (float)(1.0 - v11) + v17 * v11);
    -[CROutputRegion text](self, "text");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion text](self, "text");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "text");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion recognizedLocale](self, "recognizedLocale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "_crStringByAppendingString:locale:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion setText:](self, "setText:", v23);

    if (!-[CROutputRegion shouldComputeTranscriptFromChildren](self, "shouldComputeTranscriptFromChildren"))
      goto LABEL_8;
    -[CROutputRegion children](self, "children");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "type");

    if (v26 != 32)
      goto LABEL_8;
    -[CROutputRegion text](self, "text");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "length");
    if (v28 > objc_msgSend(v19, "length"))
    {
      -[CROutputRegion text](self, "text");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "characterAtIndex:", objc_msgSend(v19, "length"));

      if (v30 != 32)
      {
LABEL_8:
        -[CROutputRegion children](self, "children");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "children");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "arrayByAddingObjectsFromArray:", v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[CROutputRegion setChildren:](self, "setChildren:", v42);

        for (i = 0; ; ++i)
        {
          -[CROutputRegion candidates](self, "candidates");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v44, "count");

          objc_msgSend(v5, "candidates");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v46, "count");

          v48 = v45 >= v47 ? v47 : v45;
          if (v48 <= i)
            break;
          -[CROutputRegion candidates](self, "candidates");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "objectAtIndexedSubscript:", i);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "candidates");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "objectAtIndexedSubscript:", i);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "mergeWithLine:", v52);

        }
        -[CROutputRegion boundingQuad](self, "boundingQuad");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "size");
        v57 = v56;

        objc_msgSend(v5, "boundingQuad");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "size");
        v60 = v59;

        v61 = v57 / (v57 + v60);
        -[CROutputRegion baselineAngle](self, "baselineAngle");
        v63 = v62;
        objc_msgSend(v5, "baselineAngle");
        v65 = v63 - v64;
        if (v63 - v64 <= 3.14159265)
        {
          if (v65 > -3.14159265)
            goto LABEL_22;
          v66 = 6.28318531;
        }
        else
        {
          v66 = -6.28318531;
        }
        v65 = v65 + v66;
LABEL_22:
        v67 = v64 + v61 * v65;
        if (v67 <= 3.14159265)
        {
          if (v67 > -3.14159265)
          {
LABEL_27:
            -[CROutputRegion setBaselineAngle:](self, "setBaselineAngle:", v67);
            -[CROutputRegion boundingQuad](self, "boundingQuad");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "boundingQuad");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[CROutputRegion baselineAngle](self, "baselineAngle");
            *(float *)&v71 = v71;
            objc_msgSend(v69, "unionWithNormalizedQuad:baselineAngle:", v70, v71);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            -[CROutputRegion setBoundingQuad:](self, "setBoundingQuad:", v72);
            if (-[CROutputRegion shouldComputeTranscriptFromChildren](self, "shouldComputeTranscriptFromChildren"))
              -[CROutputRegion _invalidateTranscript](self, "_invalidateTranscript");

            goto LABEL_30;
          }
          v68 = 6.28318531;
        }
        else
        {
          v68 = -6.28318531;
        }
        v67 = v67 + v68;
        goto LABEL_27;
      }
      -[CROutputRegion children](self, "children");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "lastObject");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "boundingQuad");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "children");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "boundingQuad");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[CRLineOutputRegion _spaceCharacterQuadBetweenQuad1:quad2:]((uint64_t)CRLineOutputRegion, v32, v35);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      -[CROutputRegion children](self, "children");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v5, "confidence");
      objc_msgSend(v5, "baselineAngle");
      +[CRCharacterOutputRegion characterWithText:confidence:quad:baselineAngle:](CRCharacterOutputRegion, "characterWithText:confidence:quad:baselineAngle:", CFSTR(" "), v37, v27);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "arrayByAddingObject:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[CROutputRegion setChildren:](self, "setChildren:", v39);

    }
    goto LABEL_8;
  }
  CROSLogForCategory(0);
  v53 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v75 = (id)objc_opt_class();
    v54 = v75;
    _os_log_impl(&dword_1D4FB8000, v53, OS_LOG_TYPE_FAULT, "Unexpectedly appending objects of type %@", buf, 0xCu);

  }
LABEL_30:

}

- (unint64_t)lineWrappingType
{
  return self->_lineWrappingType;
}

- (void)setLineWrappingType:(unint64_t)a3
{
  self->_lineWrappingType = a3;
}

- (BOOL)useLineSeparatorAsLineBreak
{
  return self->_useLineSeparatorAsLineBreak;
}

- (void)setUseLineSeparatorAsLineBreak:(BOOL)a3
{
  self->_useLineSeparatorAsLineBreak = a3;
}

- (CRDetectedLineRegion)detectedLineRegion
{
  return self->_detectedLineRegion;
}

- (void)setDetectedLineRegion:(id)a3
{
  objc_storeStrong((id *)&self->_detectedLineRegion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedLineRegion, 0);
}

@end
