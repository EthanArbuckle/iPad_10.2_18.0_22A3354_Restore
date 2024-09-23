@implementation TCDumpArray

- (TCDumpArray)initWithCount:(int)a3 countFieldType:(int)a4 countFieldName:(id)a5 elementType:(id)a6
{
  id v11;
  id v12;
  TCDumpArray *v13;
  TCDumpArray *v14;
  objc_super v16;

  v11 = a5;
  v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)TCDumpArray;
  v13 = -[TCDumpType init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->mCount = a3;
    v13->mCountFieldType = a4;
    objc_storeStrong((id *)&v13->mCountFieldName, a5);
    objc_storeStrong((id *)&v14->mElementType, a6);
  }

  return v14;
}

- (TCDumpArray)initWithCount:(int)a3 elementType:(id)a4
{
  return -[TCDumpArray initWithCount:countFieldType:countFieldName:elementType:](self, "initWithCount:countFieldType:countFieldName:elementType:", *(_QWORD *)&a3, 0, 0, a4);
}

- (TCDumpArray)initWithCountFieldType:(int)a3 elementType:(id)a4
{
  return -[TCDumpArray initWithCount:countFieldType:countFieldName:elementType:](self, "initWithCount:countFieldType:countFieldName:elementType:", 0, *(_QWORD *)&a3, 0, a4);
}

- (TCDumpArray)initWithCountFieldName:(id)a3 elementType:(id)a4
{
  return -[TCDumpArray initWithCount:countFieldType:countFieldName:elementType:](self, "initWithCount:countFieldType:countFieldName:elementType:", 0, 0, a3, a4);
}

- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5
{
  TCDumpNumeric *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  xmlNode *v12;
  xmlNode *v13;
  TCDumpBlob *v14;
  id v15;

  v15 = a5;
  if (self->mCountFieldType)
  {
    v8 = -[TCDumpNumeric initWithType:]([TCDumpNumeric alloc], "initWithType:", self->mCountFieldType);
    readIntegerFromBinaryToXml(v8, (NSString *)CFSTR("count"), a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->mCount = objc_msgSend(v9, "intValue");

  }
  if (self->mCountFieldName)
  {
    objc_msgSend(v15, "valueForField:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->mCount = objc_msgSend(v10, "intValue");

  }
  if (self->mCount >= 1)
  {
    v11 = 0;
    do
    {
      v12 = xmlNewNode(0, (const xmlChar *)"element");
      xmlAddChild(a4, v12);
      sfaxmlSetLongNoNsProp(v12, (const xmlChar *)"index", v11);
      -[TCDumpType fromBinary:toXml:state:](self->mElementType, "fromBinary:toXml:state:", a3, v12, 0);
      ++v11;
    }
    while (v11 < self->mCount);
  }
  if (self->mPaddingSize > 0)
  {
    v13 = xmlNewNode(0, (const xmlChar *)"padding");
    xmlAddChild(a4, v13);
    v14 = -[TCDumpBlob initWithSize_:]([TCDumpBlob alloc], "initWithSize_:", self->mPaddingSize);
    -[TCDumpBlob fromBinary:toXml:state:](v14, "fromBinary:toXml:state:", a3, v13, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mElementType, 0);
  objc_storeStrong((id *)&self->mCountFieldName, 0);
}

@end
