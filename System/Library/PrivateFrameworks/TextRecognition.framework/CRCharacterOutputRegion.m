@implementation CRCharacterOutputRegion

- (CRCharacterOutputRegion)init
{
  CRCharacterOutputRegion *v2;
  CRCharacterOutputRegion *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRCharacterOutputRegion;
  v2 = -[CROutputRegion init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CROutputRegion setShouldComputeBoundsFromChildren:](v2, "setShouldComputeBoundsFromChildren:", 0);
    -[CROutputRegion setShouldComputeTranscriptFromChildren:](v3, "setShouldComputeTranscriptFromChildren:", 0);
    -[CROutputRegion setNumberOfLines:](v3, "setNumberOfLines:", 0);
  }
  return v3;
}

- (CRCharacterOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8;
  CRCharacterOutputRegion *v9;
  CRNormalizedPolyline *v10;
  void *v11;
  uint64_t v12;
  CRNormalizedPolyline *baseline;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRCharacterOutputRegion;
  v9 = -[CROutputRegion initWithCRCodableDataRepresentation:version:offset:](&v15, sel_initWithCRCodableDataRepresentation_version_offset_, v8, a4, a5);
  if (v9)
  {
    v10 = [CRNormalizedPolyline alloc];
    +[CRCodingUtilities objectDataFromEncodingData:offset:](CRCodingUtilities, "objectDataFromEncodingData:offset:", v8, a5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[CRNormalizedPolyline initWithCRCodableDataRepresentation:](v10, "initWithCRCodableDataRepresentation:", v11);
    baseline = v9->_baseline;
    v9->_baseline = (CRNormalizedPolyline *)v12;

  }
  return v9;
}

- (id)crCodableDataRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  id Property;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0C99DF0];
  v9.receiver = self;
  v9.super_class = (Class)CRCharacterOutputRegion;
  -[CROutputRegion crCodableDataRepresentation](&v9, sel_crCodableDataRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (self)
    Property = objc_getProperty(self, v6, 336, 1);
  else
    Property = 0;
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", Property, v5);
  return v5;
}

+ (id)characterWithTextFeature:(id)a3 imageSize:(CGSize)a4 confidenceThresholdProvider:(id)a5
{
  double height;
  double width;
  id v9;
  id v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  void *v23;

  height = a4.height;
  width = a4.width;
  v9 = a3;
  v10 = a5;
  +[CRCharacterOutputRegion characterWithTextFeature:candidateIdx:imageSize:confidenceThresholdProvider:](width, height, (uint64_t)a1, v9, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringValueCandidates");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13 >= 2)
  {
    v14 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v9, "stringValueCandidates");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "stringValueCandidates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18)
    {
      v19 = 0;
      do
      {
        +[CRCharacterOutputRegion characterWithTextFeature:candidateIdx:imageSize:confidenceThresholdProvider:](width, height, (uint64_t)a1, v9, v19, v10);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v20);

        ++v19;
        objc_msgSend(v9, "stringValueCandidates");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

      }
      while (v19 < v22);
    }
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v16);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCandidates:", v23);

  }
  objc_msgSend(v11, "setNumberOfLines:", 0);

  return v11;
}

+ (id)characterWithTextFeature:(uint64_t)a3 candidateIdx:(void *)a4 imageSize:(uint64_t)a5 confidenceThresholdProvider:(void *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  CRNormalizedQuad *v18;
  double v19;
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
  double v32;
  CRNormalizedQuad *v33;
  void *v34;
  void *v35;
  float v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  float v42;
  void *v43;
  void *v44;

  v10 = a6;
  v11 = a4;
  v12 = (void *)objc_opt_self();
  objc_msgSend(v11, "selectedLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "thresholdsForTextRegion:withLocale:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "candidateProbs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v17 = +[CRImageReaderOutput confidenceLevelForConfidenceScore:confidenceThresholds:](CRImageReaderOutput, "confidenceLevelForConfidenceScore:confidenceThresholds:", v14);

  v18 = [CRNormalizedQuad alloc];
  objc_msgSend(v11, "topLeft");
  v20 = v19;
  v22 = v21;
  objc_msgSend(v11, "topRight");
  v24 = v23;
  v26 = v25;
  objc_msgSend(v11, "bottomRight");
  v28 = v27;
  v30 = v29;
  objc_msgSend(v11, "bottomLeft");
  v33 = -[CRNormalizedQuad initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:](v18, "initWithNormalizedTopLeft:topRight:bottomRight:bottomLeft:size:", v20, v22, v24, v26, v28, v30, v31, v32, *(_QWORD *)&a1, *(_QWORD *)&a2);
  objc_msgSend(v11, "stringValueCandidates");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectAtIndexedSubscript:", a5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "baselineAngle");
  objc_msgSend(v12, "characterWithText:confidence:quad:baselineAngle:", v35, v17, v33, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "candidateProbs");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectAtIndexedSubscript:", a5);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "floatValue");
  objc_msgSend(v37, "setRawConfidence:");

  objc_msgSend(v11, "candidateActivationProbs");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectAtIndexedSubscript:", a5);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "floatValue");
  objc_msgSend(v37, "setActivationProbability:", v42);

  objc_msgSend(v11, "selectedLocale");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setRecognizedLocale:", v43);

  objc_msgSend(v11, "uuid");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "setUuid:", v44);
  objc_msgSend(v37, "setNumberOfLines:", 0);

  return v37;
}

+ (id)characterWithText:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  uint64_t v7;
  id v9;
  id v10;
  CRCharacterOutputRegion *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CRNormalizedPolyline *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  const char *v21;
  CRNormalizedPolyline *v22;
  _QWORD v24[5];

  v7 = *(_QWORD *)&a4;
  v24[4] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a3;
  v11 = -[CROutputRegion initWithConfidence:baselineAngle:]([CRCharacterOutputRegion alloc], "initWithConfidence:baselineAngle:", v7, a6);
  -[CROutputRegion setText:](v11, "setText:", v10);

  -[CROutputRegion setBoundingQuad:](v11, "setBoundingQuad:", v9);
  objc_msgSend(v9, "bottomLeft");
  v24[0] = v12;
  v24[1] = v13;
  objc_msgSend(v9, "bottomRight");
  v24[2] = v14;
  v24[3] = v15;
  v16 = [CRNormalizedPolyline alloc];
  objc_msgSend(v9, "normalizationSize");
  v18 = v17;
  v20 = v19;

  v22 = -[CRNormalizedPolyline initWithNormalizedPoints:count:size:](v16, "initWithNormalizedPoints:count:size:", v24, 2, v18, v20);
  if (v11)
    objc_setProperty_atomic(v11, v21, v22, 336);

  -[CROutputRegion setNumberOfLines:](v11, "setNumberOfLines:", 0);
  return v11;
}

- (id)contentBaselines
{
  CRCharacterOutputRegion *v2;
  const char *v3;
  void *v4;
  id v5;
  void *v6;
  id v8[2];

  v2 = self;
  v8[1] = *(id *)MEMORY[0x1E0C80C00];
  if (self)
  {
    if (objc_getProperty(self, a2, 336, 1))
    {
      v8[0] = objc_getProperty(v2, v3, 336, 1);
      v4 = (void *)MEMORY[0x1E0C99D20];
      v5 = v8[0];
      objc_msgSend(v4, "arrayWithObjects:count:", v8, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }
    v2 = 0;
  }
  return v2;
}

- (BOOL)computesBoundsFromChildren
{
  return 0;
}

- (BOOL)computesTranscriptFromChildren
{
  return 0;
}

- (BOOL)computesNumberOfLinesFromChildren
{
  return 0;
}

- (unint64_t)type
{
  return 32;
}

- (id)joiningDelimiter
{
  return &stru_1E98DC948;
}

- (BOOL)isEqual:(id)a3
{
  CRCharacterOutputRegion *v4;
  CRCharacterOutputRegion *v5;
  const char *v6;
  id Property;
  const char *v8;
  id v9;
  id v10;
  char v11;
  objc_super v13;

  v4 = (CRCharacterOutputRegion *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v13.receiver = self;
      v13.super_class = (Class)CRCharacterOutputRegion;
      if (-[CROutputRegion isEqual:](&v13, sel_isEqual_, v5))
      {
        if (self)
          Property = objc_getProperty(self, v6, 336, 1);
        else
          Property = 0;
        v9 = Property;
        if (v5)
          v10 = objc_getProperty(v5, v8, 336, 1);
        else
          v10 = 0;
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  id v7;
  const char *v8;
  void *v9;
  id Property;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRCharacterOutputRegion;
  v7 = -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](&v12, sel_copyWithZone_copyChildren_copyCandidates_deepCopy_, a3, a4, a5, a6);
  v9 = v7;
  if (!self)
  {
    Property = 0;
    if (!v7)
      return v9;
    goto LABEL_3;
  }
  Property = objc_getProperty(self, v8, 336, 1);
  if (v9)
LABEL_3:
    objc_setProperty_atomic(v9, v8, Property, 336);
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseline, 0);
}

@end
