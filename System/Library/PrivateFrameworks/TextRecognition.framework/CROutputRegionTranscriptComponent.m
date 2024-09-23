@implementation CROutputRegionTranscriptComponent

- (CROutputRegionTranscriptComponent)initWithOutputRegion:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  CROutputRegionTranscriptComponent *v9;
  CROutputRegionTranscriptComponent *v10;
  objc_super v12;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CROutputRegionTranscriptComponent;
  v9 = -[CROutputRegionTranscriptComponent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_outputRegion, a3);
    v10->_representedRange.location = location;
    v10->_representedRange.length = length;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CROutputRegionTranscriptComponent *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v12;

  v4 = (CROutputRegionTranscriptComponent *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    -[CROutputRegionTranscriptComponent outputRegion](self, "outputRegion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CROutputRegionTranscriptComponent outputRegion](v4, "outputRegion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6))
    {
      v7 = -[CROutputRegionTranscriptComponent representedRange](self, "representedRange");
      v9 = v8;
      v12 = v7 == -[CROutputRegionTranscriptComponent representedRange](v4, "representedRange") && v9 == v10;
    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CROutputRegionTranscriptComponent *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  CROutputRegionTranscriptComponent *v8;

  v4 = +[CROutputRegionTranscriptComponent allocWithZone:](CROutputRegionTranscriptComponent, "allocWithZone:", a3);
  -[CROutputRegionTranscriptComponent outputRegion](self, "outputRegion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CROutputRegionTranscriptComponent representedRange](self, "representedRange");
  v8 = -[CROutputRegionTranscriptComponent initWithOutputRegion:range:](v4, "initWithOutputRegion:range:", v5, v6, v7);

  return v8;
}

- (id)crCodableDataRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = (void *)objc_opt_new();
  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", 11, v3);
  -[CROutputRegionTranscriptComponent outputRegion](self, "outputRegion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CRCodingUtilities appendCodable:toData:](CRCodingUtilities, "appendCodable:toData:", v4, v3);

  v5 = -[CROutputRegionTranscriptComponent representedRange](self, "representedRange");
  +[CRCodingUtilities appendRange:toData:](CRCodingUtilities, "appendRange:toData:", v5, v6, v3);
  return v3;
}

- (CROutputRegion)outputRegion
{
  return (CROutputRegion *)objc_getProperty(self, a2, 8, 1);
}

- (_NSRange)representedRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_representedRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputRegion, 0);
}

@end
