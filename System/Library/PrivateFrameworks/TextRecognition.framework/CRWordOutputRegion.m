@implementation CRWordOutputRegion

- (CRWordOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8;
  CRWordOutputRegion *v9;
  CRNormalizedPolyline *v10;
  void *v11;
  uint64_t v12;
  CRNormalizedPolyline *baseline;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRWordOutputRegion;
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
  v9.super_class = (Class)CRWordOutputRegion;
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

+ (id)wordWithText:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  uint64_t v7;
  id v9;
  id v10;
  CRWordOutputRegion *v11;
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
  v11 = -[CROutputRegion initWithConfidence:baselineAngle:]([CRWordOutputRegion alloc], "initWithConfidence:baselineAngle:", v7, a6);
  -[CROutputRegion setText:](v11, "setText:", v10);

  -[CROutputRegion setBoundingQuad:](v11, "setBoundingQuad:", v9);
  -[CROutputRegion setShouldComputeBoundsFromChildren:](v11, "setShouldComputeBoundsFromChildren:", 0);
  -[CROutputRegion setShouldComputeTranscriptFromChildren:](v11, "setShouldComputeTranscriptFromChildren:", 0);
  -[CROutputRegion setChildren:](v11, "setChildren:", 0);
  -[CROutputRegion setNumberOfLines:](v11, "setNumberOfLines:", 0);
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

  return v11;
}

+ (id)wordWithCharacters:(id)a3 confidence:(int)a4 quad:(id)a5 baselineAngle:(double)a6
{
  uint64_t v7;
  id v9;
  id v10;
  CRWordOutputRegion *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  CRNormalizedPolyline *v18;
  void *v19;
  const char *v20;
  CRNormalizedPolyline *v21;
  _QWORD v23[5];

  v7 = *(_QWORD *)&a4;
  v23[4] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a3;
  v11 = -[CROutputRegion initWithConfidence:baselineAngle:]([CRWordOutputRegion alloc], "initWithConfidence:baselineAngle:", v7, a6);
  -[CROutputRegion setShouldComputeTranscriptFromChildren:](v11, "setShouldComputeTranscriptFromChildren:", 1);
  if (v9)
  {
    -[CROutputRegion setShouldComputeBoundsFromChildren:](v11, "setShouldComputeBoundsFromChildren:", 0);
    -[CROutputRegion setBoundingQuad:](v11, "setBoundingQuad:", v9);
  }
  else
  {
    -[CROutputRegion setShouldComputeBoundsFromChildren:](v11, "setShouldComputeBoundsFromChildren:", 1);
  }
  -[CROutputRegion setChildren:](v11, "setChildren:", v10);

  -[CROutputRegion setNumberOfLines:](v11, "setNumberOfLines:", 0);
  -[CROutputRegion boundingQuad](v11, "boundingQuad");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bottomLeft");
  v23[0] = v13;
  v23[1] = v14;
  -[CROutputRegion boundingQuad](v11, "boundingQuad");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bottomRight");
  v23[2] = v16;
  v23[3] = v17;

  v18 = [CRNormalizedPolyline alloc];
  -[CROutputRegion boundingQuad](v11, "boundingQuad");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "normalizationSize");
  v21 = -[CRNormalizedPolyline initWithNormalizedPoints:count:size:](v18, "initWithNormalizedPoints:count:size:", v23, 2);
  if (v11)
    objc_setProperty_atomic(v11, v20, v21, 336);

  return v11;
}

- (id)contentBaselines
{
  CRWordOutputRegion *v2;
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

- (unint64_t)type
{
  return 16;
}

- (BOOL)computesNumberOfLinesFromChildren
{
  return 0;
}

- (id)joiningDelimiter
{
  return CFSTR(" ");
}

- (BOOL)isEqual:(id)a3
{
  CRWordOutputRegion *v4;
  CRWordOutputRegion *v5;
  const char *v6;
  id Property;
  const char *v8;
  id v9;
  id v10;
  char v11;
  objc_super v13;

  v4 = (CRWordOutputRegion *)a3;
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
      v13.super_class = (Class)CRWordOutputRegion;
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
  v12.super_class = (Class)CRWordOutputRegion;
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
