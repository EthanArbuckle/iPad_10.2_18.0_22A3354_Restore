@implementation CRDocumentOutputRegionMetadata

- (CRDocumentOutputRegionMetadata)initWithCRCodableDataRepresentation:(id)a3
{
  id v4;
  CRDocumentOutputRegionMetadata *v5;
  CRDocumentOutputRegionMetadata *v6;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRDocumentOutputRegionMetadata;
  v5 = -[CRDocumentOutputRegionMetadata init](&v9, sel_init);
  if (v5)
  {
    v8 = 0;
    if (+[CRCodingUtilities integerFromEncodingData:offset:](CRCodingUtilities, "integerFromEncodingData:offset:", v4, &v8) != 1)
    {
      v6 = 0;
      goto LABEL_6;
    }
    v5->_numFilteredRegions = +[CRCodingUtilities unsignedIntegerFromEncodingData:offset:](CRCodingUtilities, "unsignedIntegerFromEncodingData:offset:", v4, &v8);
  }
  v6 = v5;
LABEL_6:

  return v6;
}

- (id)crCodableDataRepresentation
{
  void *v3;

  v3 = (void *)objc_opt_new();
  +[CRCodingUtilities appendInteger:toData:](CRCodingUtilities, "appendInteger:toData:", 1, v3);
  +[CRCodingUtilities appendUInteger:toData:](CRCodingUtilities, "appendUInteger:toData:", -[CRDocumentOutputRegionMetadata numFilteredRegions](self, "numFilteredRegions"), v3);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CRDocumentOutputRegionMetadata *v4;
  CRDocumentOutputRegionMetadata *v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = (CRDocumentOutputRegionMetadata *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[CRDocumentOutputRegionMetadata numFilteredRegions](self, "numFilteredRegions");
      v7 = -[CRDocumentOutputRegionMetadata numFilteredRegions](v5, "numFilteredRegions");

      v8 = v6 == v7;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setNumFilteredRegions:", -[CRDocumentOutputRegionMetadata numFilteredRegions](self, "numFilteredRegions"));
  return v4;
}

- (unint64_t)numFilteredRegions
{
  return self->_numFilteredRegions;
}

- (void)setNumFilteredRegions:(unint64_t)a3
{
  self->_numFilteredRegions = a3;
}

@end
