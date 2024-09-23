@implementation CRTableCellOutputRegion

- (CRTableCellOutputRegion)initWithBlock:(id)a3 quad:(id)a4 rowRange:(_NSRange)a5 colRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  NSUInteger v9;
  id v12;
  id v13;
  CRTableCellOutputRegion *v14;
  void *v15;
  _QWORD v17[2];

  length = a6.length;
  location = a6.location;
  v8 = a5.length;
  v9 = a5.location;
  v17[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = -[CROutputRegion init](self, "init");
  if (v14)
  {
    objc_msgSend(v13, "baselineAngle");
    -[CROutputRegion setBaselineAngle:](v14, "setBaselineAngle:");
    -[CROutputRegion setConfidence:](v14, "setConfidence:", objc_msgSend(v12, "confidence"));
    -[CROutputRegion setBoundingQuad:](v14, "setBoundingQuad:", v13);
    -[CROutputRegion setShouldComputeBoundsFromChildren:](v14, "setShouldComputeBoundsFromChildren:", 0);
    -[CROutputRegion setShouldComputeTranscriptFromChildren:](v14, "setShouldComputeTranscriptFromChildren:", 1);
    v17[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegion setChildren:](v14, "setChildren:", v15);

    -[CRTableCellOutputRegion setRowRange:](v14, "setRowRange:", v9, v8);
    -[CRTableCellOutputRegion setColRange:](v14, "setColRange:", location, length);
  }

  return v14;
}

- (CRTableCellOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8;
  CRTableCellOutputRegion *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CRTableCellOutputRegion;
  v9 = -[CROutputRegion initWithCRCodableDataRepresentation:version:offset:](&v15, sel_initWithCRCodableDataRepresentation_version_offset_, v8, a4, a5);
  if (v9)
  {
    if (a4 >= 3)
      +[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v8, a5);
    v10 = +[CRCodingUtilities rangeFromEncodingData:offset:](CRCodingUtilities, "rangeFromEncodingData:offset:", v8, a5);
    -[CRTableCellOutputRegion setRowRange:](v9, "setRowRange:", v10, v11);
    v12 = +[CRCodingUtilities rangeFromEncodingData:offset:](CRCodingUtilities, "rangeFromEncodingData:offset:", v8, a5);
    -[CRTableCellOutputRegion setColRange:](v9, "setColRange:", v12, v13);
  }

  return v9;
}

- (unint64_t)type
{
  return 128;
}

- (BOOL)shouldAlwaysAddDelimiter
{
  return 1;
}

- (id)crCodableDataRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x1E0C99DF0];
  v11.receiver = self;
  v11.super_class = (Class)CRTableCellOutputRegion;
  -[CROutputRegion crCodableDataRepresentation](&v11, sel_crCodableDataRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", 1, v5);
  v6 = -[CRTableCellOutputRegion rowRange](self, "rowRange");
  +[CRCodingUtilities appendRange:toData:](CRCodingUtilities, "appendRange:toData:", v6, v7, v5);
  v8 = -[CRTableCellOutputRegion colRange](self, "colRange");
  +[CRCodingUtilities appendRange:toData:](CRCodingUtilities, "appendRange:toData:", v8, v9, v5);
  return v5;
}

- (BOOL)contributesToDocumentHierarchy
{
  return 0;
}

- (id)layoutComponents
{
  return -[CROutputRegion contentsWithTypes:](self, "contentsWithTypes:", 4);
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRTableCellOutputRegion;
  v7 = -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](&v13, sel_copyWithZone_copyChildren_copyCandidates_deepCopy_, a3, a4, a5, a6);
  v8 = -[CRTableCellOutputRegion rowRange](self, "rowRange");
  objc_msgSend(v7, "setRowRange:", v8, v9);
  v10 = -[CRTableCellOutputRegion colRange](self, "colRange");
  objc_msgSend(v7, "setColRange:", v10, v11);
  return v7;
}

- (_NSRange)rowRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_rowRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setRowRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_rowRange, &v3, 16, 1, 0);
}

- (_NSRange)colRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_colRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setColRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_colRange, &v3, 16, 1, 0);
}

@end
