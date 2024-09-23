@implementation CRFormFieldOutputRegion

- (CRFormFieldOutputRegion)initWithQuad:(id)a3 labelRegion:(id)a4 subFields:(id)a5 source:(unint64_t)a6
{
  id v10;
  id v11;
  id v12;
  CRFormFieldOutputRegion *v13;
  CRFormFieldOutputRegion *v14;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *debugInfo;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v19.receiver = self;
  v19.super_class = (Class)CRFormFieldOutputRegion;
  v13 = -[CROutputRegion initWithConfidence:baselineAngle:](&v19, sel_initWithConfidence_baselineAngle_, 2, 0.0);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_labelRegion, a4);
    v14->_fieldSource = a6;
    -[CROutputRegion setBoundingQuad:](v14, "setBoundingQuad:", v10);
    v15 = (void *)objc_msgSend(v12, "copy");
    -[CROutputRegion setFormFieldRegions:](v14, "setFormFieldRegions:", v15);

    v14->_hasBoundedWidth = 0;
    v14->_hasBoundedHeight = 0;
    v16 = objc_opt_new();
    debugInfo = v14->_debugInfo;
    v14->_debugInfo = (NSMutableDictionary *)v16;

  }
  return v14;
}

- (void)setLabelRegion:(id)a3
{
  objc_storeStrong((id *)&self->_labelRegion, a3);
}

- (unint64_t)type
{
  return 0x2000;
}

- (unint64_t)fieldType
{
  return 0;
}

- (unint64_t)source
{
  return self->_fieldSource;
}

- (BOOL)shouldComputeBoundsFromChildren
{
  return 0;
}

- (id)debugInfo
{
  return self->_debugInfo;
}

- (CRFormFieldOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8;
  CRFormFieldOutputRegion *v9;
  void *v10;
  uint64_t v11;
  CROutputRegion *labelRegion;
  uint64_t v13;
  NSMutableDictionary *debugInfo;
  objc_super v16;

  v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CRFormFieldOutputRegion;
  v9 = -[CROutputRegion initWithCRCodableDataRepresentation:version:offset:](&v16, sel_initWithCRCodableDataRepresentation_version_offset_, v8, a4, a5);
  if (v9)
  {
    +[CRCodingUtilities objectDataFromEncodingData:offset:](CRCodingUtilities, "objectDataFromEncodingData:offset:", v8, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CROutputRegion outputRegionWithCRCodableDataRepresentation:](CROutputRegion, "outputRegionWithCRCodableDataRepresentation:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    labelRegion = v9->_labelRegion;
    v9->_labelRegion = (CROutputRegion *)v11;

    v9->_fieldSource = +[CRCodingUtilities unsignedIntegerFromEncodingData:offset:](CRCodingUtilities, "unsignedIntegerFromEncodingData:offset:", v8, a5);
    v9->_indexInGlobalOrder = +[CRCodingUtilities unsignedIntegerFromEncodingData:offset:](CRCodingUtilities, "unsignedIntegerFromEncodingData:offset:", v8, a5);
    v13 = objc_opt_new();
    debugInfo = v9->_debugInfo;
    v9->_debugInfo = (NSMutableDictionary *)v13;

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
  v7.super_class = (Class)CRFormFieldOutputRegion;
  -[CROutputRegion crCodableDataRepresentation](&v7, sel_crCodableDataRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", self->_labelRegion, v5);
  +[CRCodingUtilities appendUInteger:toData:](CRCodingUtilities, "appendUInteger:toData:", self->_fieldSource, v5);
  +[CRCodingUtilities appendUInteger:toData:](CRCodingUtilities, "appendUInteger:toData:", self->_indexInGlobalOrder, v5);
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CRFormFieldOutputRegion;
  v7 = -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](&v14, sel_copyWithZone_copyChildren_copyCandidates_deepCopy_, a3, a4, a5, a6);
  -[CRFormFieldOutputRegion labelRegion](self, "labelRegion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLabelRegion:", v8);

  *((_QWORD *)v7 + 47) = -[CRFormFieldOutputRegion fieldSource](self, "fieldSource");
  -[CRFormFieldOutputRegion precedingExternalField](self, "precedingExternalField");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)*((_QWORD *)v7 + 42);
  *((_QWORD *)v7 + 42) = v9;

  *((_QWORD *)v7 + 45) = -[CRFormFieldOutputRegion indexInGlobalOrder](self, "indexInGlobalOrder");
  *((_BYTE *)v7 + 352) = -[CRFormFieldOutputRegion hasBoundedWidth](self, "hasBoundedWidth");
  *((_BYTE *)v7 + 353) = -[CRFormFieldOutputRegion hasBoundedHeight](self, "hasBoundedHeight");
  -[CRFormFieldOutputRegion debugInfo](self, "debugInfo");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)*((_QWORD *)v7 + 43);
  *((_QWORD *)v7 + 43) = v11;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  CRFormFieldOutputRegion *v4;
  CRFormFieldOutputRegion *v5;
  void *v6;
  void *v7;
  int v8;
  unint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  _BOOL4 v12;
  char v13;
  void *v15;
  void *v16;

  v4 = (CRFormFieldOutputRegion *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[CROutputRegion boundingQuad](self, "boundingQuad");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CROutputRegion boundingQuad](v5, "boundingQuad");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (v8
        && (v9 = -[CRFormFieldOutputRegion fieldType](self, "fieldType"),
            v9 == -[CRFormFieldOutputRegion fieldType](v5, "fieldType"))
        && (v10 = -[CRFormFieldOutputRegion fieldSource](self, "fieldSource"),
            v10 == -[CRFormFieldOutputRegion fieldSource](v5, "fieldSource"))
        && (v11 = -[CRFormFieldOutputRegion hasBoundedWidth](self, "hasBoundedWidth"),
            v11 == -[CRFormFieldOutputRegion hasBoundedWidth](v5, "hasBoundedWidth"))
        && (v12 = -[CRFormFieldOutputRegion hasBoundedHeight](self, "hasBoundedHeight"),
            v12 == -[CRFormFieldOutputRegion hasBoundedHeight](v5, "hasBoundedHeight")))
      {
        -[CRFormFieldOutputRegion fieldValue](self, "fieldValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRFormFieldOutputRegion fieldValue](v5, "fieldValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v15, "isEqualToString:", v16);

      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (void)setPrecedingExternalField:(id)a3
{
  objc_storeStrong((id *)&self->_precedingExternalField, a3);
}

- (id)precedingExternalField
{
  return self->_precedingExternalField;
}

- (unint64_t)indexInGlobalOrder
{
  return self->_indexInGlobalOrder;
}

- (void)setIndexInGlobalOrder:(unint64_t)a3
{
  self->_indexInGlobalOrder = a3;
}

- (BOOL)hasBoundedWidth
{
  return self->_hasBoundedWidth;
}

- (void)setHasBoundedWidth:(BOOL)a3
{
  self->_hasBoundedWidth = a3;
}

- (BOOL)hasBoundedHeight
{
  return self->_hasBoundedHeight;
}

- (void)setHasBoundedHeight:(BOOL)a3
{
  self->_hasBoundedHeight = a3;
}

- (CROutputRegion)labelRegion
{
  return (CROutputRegion *)objc_getProperty(self, a2, 368, 1);
}

- (unint64_t)fieldSource
{
  return self->_fieldSource;
}

- (NSString)fieldValue
{
  return (NSString *)objc_getProperty(self, a2, 384, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldValue, 0);
  objc_storeStrong((id *)&self->_labelRegion, 0);
  objc_storeStrong((id *)&self->_debugInfo, 0);
  objc_storeStrong((id *)&self->_precedingExternalField, 0);
}

@end
