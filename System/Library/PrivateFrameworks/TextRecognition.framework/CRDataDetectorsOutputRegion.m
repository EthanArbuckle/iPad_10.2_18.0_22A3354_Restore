@implementation CRDataDetectorsOutputRegion

- (CRDataDetectorsOutputRegion)initWithCRCodableDataRepresentation:(id)a3 version:(int64_t)a4 offset:(unint64_t *)a5
{
  id v8;
  CRDataDetectorsOutputRegion *v9;
  uint64_t v10;
  DDScannerResult *ddResult;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CRDataDetectorsOutputRegion;
  v9 = -[CROutputRegion initWithCRCodableDataRepresentation:version:offset:](&v13, sel_initWithCRCodableDataRepresentation_version_offset_, v8, a4, a5);
  if (v9)
  {
    v9->_dataType = +[CRCodingUtilities unsignedIntegerFromEncodingData:offset:](CRCodingUtilities, "unsignedIntegerFromEncodingData:offset:", v8, a5);
    +[CRCodingUtilities ddScannerResultFromEncodingData:offset:](CRCodingUtilities, "ddScannerResultFromEncodingData:offset:", v8, a5);
    v10 = objc_claimAutoreleasedReturnValue();
    ddResult = v9->_ddResult;
    v9->_ddResult = (DDScannerResult *)v10;

  }
  return v9;
}

- (id)crCodableDataRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0C99DF0];
  v8.receiver = self;
  v8.super_class = (Class)CRDataDetectorsOutputRegion;
  -[CROutputRegion crCodableDataRepresentation](&v8, sel_crCodableDataRepresentation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataWithData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CRCodingUtilities appendUInteger:toData:](CRCodingUtilities, "appendUInteger:toData:", -[CRDataDetectorsOutputRegion dataType](self, "dataType"), v5);
  -[CRDataDetectorsOutputRegion ddResult](self, "ddResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v6, v5);

  return v5;
}

+ (id)outputRegionWithDataType:(unint64_t)a3 ddResult:(id)a4 children:(id)a5 locale:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  int v21;
  CRDataDetectorsOutputRegion *v23;
  const char *v24;
  CRDataDetectorsOutputRegion *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    LODWORD(v15) = 2;
    v16 = 0.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v10);
        v18 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v18, "baselineAngle");
        v20 = v19;
        if (objc_msgSend(v18, "confidence"))
        {
          v21 = objc_msgSend(v18, "confidence");
          if ((_DWORD)v15 == 2 && v21 == 1)
            v15 = 1;
          else
            v15 = v15;
        }
        else
        {
          v15 = 0;
        }
        v16 = v16 + v20;
      }
      v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 2;
    v16 = 0.0;
  }
  v23 = -[CROutputRegion initWithConfidence:baselineAngle:]([CRDataDetectorsOutputRegion alloc], "initWithConfidence:baselineAngle:", v15, v16 / (double)(unint64_t)objc_msgSend(v10, "count"));
  v25 = v23;
  if (v23)
  {
    v23->_dataType = a3;
    objc_setProperty_atomic(v23, v24, v9, 344);
  }
  -[CROutputRegion setChildren:](v25, "setChildren:", v10);
  -[CROutputRegion setRecognizedLocale:](v25, "setRecognizedLocale:", v11);

  return v25;
}

+ (id)outputRegionWithDDResult:(id)a3 children:(id)a4 locale:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  int v20;
  void *v21;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_class();
  v11 = v9;
  objc_opt_self();
  v12 = 3;
  switch(objc_msgSend(v11, "category"))
  {
    case 1u:
      objc_msgSend(v11, "type");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0D1CAB0]);

      if (v14)
        v12 = 2;
      else
        v12 = 1;
      break;
    case 2u:
      break;
    case 3u:
      v12 = 4;
      break;
    case 4u:
      v12 = 5;
      break;
    case 6u:
      v12 = 6;
      break;
    case 7u:
      v12 = 10;
      break;
    default:
      objc_msgSend(v11, "type");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("FlightInformation"));

      if ((v16 & 1) != 0)
      {
        v12 = 7;
      }
      else
      {
        objc_msgSend(v11, "type");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("TrackingNumber"));

        if ((v18 & 1) != 0)
        {
          v12 = 8;
        }
        else
        {
          objc_msgSend(v11, "type");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("PhysicalAmount"));

          if (v20)
            v12 = 9;
          else
            v12 = 0;
        }
      }
      break;
  }

  objc_msgSend(v10, "outputRegionWithDataType:ddResult:children:locale:", v12, v11, v8, v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (BOOL)computesBoundsFromChildren
{
  return 1;
}

- (BOOL)computesTranscriptFromChildren
{
  return 1;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CRDataDetectorsOutputRegion dataType](self, "dataType");
  -[CRDataDetectorsOutputRegion ddResult](self, "ddResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "category");
  -[CRDataDetectorsOutputRegion ddResult](self, "ddResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "matchedString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CROutputRegion recognizedLocale](self, "recognizedLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] dataType:%lu category:%d matchedString:'%@' locale:%@"), v5, v6, v8, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (unint64_t)type
{
  return 2048;
}

- (BOOL)contributesToDocumentHierarchy
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  CRDataDetectorsOutputRegion *v4;
  CRDataDetectorsOutputRegion *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  char v9;
  objc_super v11;

  v4 = (CRDataDetectorsOutputRegion *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v11.receiver = self;
      v11.super_class = (Class)CRDataDetectorsOutputRegion;
      if (-[CROutputRegion isEqual:](&v11, sel_isEqual_, v5)
        && (v6 = -[CRDataDetectorsOutputRegion dataType](self, "dataType"),
            v6 == -[CRDataDetectorsOutputRegion dataType](v5, "dataType")))
      {
        -[CRDataDetectorsOutputRegion ddResult](self, "ddResult");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CRDataDetectorsOutputRegion ddResult](v5, "ddResult");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

      }
      else
      {
        v9 = 0;
      }

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3 copyChildren:(BOOL)a4 copyCandidates:(BOOL)a5 deepCopy:(BOOL)a6
{
  _QWORD *v7;
  unint64_t v8;
  void *v9;
  SEL v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRDataDetectorsOutputRegion;
  v7 = -[CROutputRegion copyWithZone:copyChildren:copyCandidates:deepCopy:](&v12, sel_copyWithZone_copyChildren_copyCandidates_deepCopy_, a3, a4, a5, a6);
  v8 = -[CRDataDetectorsOutputRegion dataType](self, "dataType");
  if (v7)
  {
    v7[42] = v8;
    -[CRDataDetectorsOutputRegion ddResult](self, "ddResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setProperty_atomic(v7, v10, v9, 344);
  }
  else
  {
    -[CRDataDetectorsOutputRegion ddResult](self, "ddResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (DDScannerResult)ddResult
{
  return (DDScannerResult *)objc_getProperty(self, a2, 344, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ddResult, 0);
}

@end
