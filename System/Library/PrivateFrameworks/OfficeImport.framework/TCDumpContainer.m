@implementation TCDumpContainer

- (TCDumpContainer)initWithByteSize:(int)a3 byteSizeFieldType:(int)a4 byteSizeFieldName:(id)a5 byteSizeCorrection:(int)a6 elementType:(id)a7
{
  id v13;
  id v14;
  TCDumpContainer *v15;
  TCDumpContainer *v16;
  objc_super v18;

  v13 = a5;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)TCDumpContainer;
  v15 = -[TCDumpType init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->mByteSize = a3;
    v15->mByteSizeFieldType = a4;
    objc_storeStrong((id *)&v15->mByteSizeFieldName, a5);
    v16->mByteSizeCorrection = a6;
    objc_storeStrong((id *)&v16->mElementType, a7);
  }

  return v16;
}

- (TCDumpContainer)initWithByteSize:(int)a3 elementType:(id)a4
{
  return -[TCDumpContainer initWithByteSize:byteSizeFieldType:byteSizeFieldName:byteSizeCorrection:elementType:](self, "initWithByteSize:byteSizeFieldType:byteSizeFieldName:byteSizeCorrection:elementType:", *(_QWORD *)&a3, 0, 0, 0, a4);
}

- (TCDumpContainer)initWithByteSizeFieldType:(int)a3 elementType:(id)a4
{
  return -[TCDumpContainer initWithByteSize:byteSizeFieldType:byteSizeFieldName:byteSizeCorrection:elementType:](self, "initWithByteSize:byteSizeFieldType:byteSizeFieldName:byteSizeCorrection:elementType:", 0, *(_QWORD *)&a3, 0, 0, a4);
}

- (TCDumpContainer)initWithByteSizeFieldType:(int)a3 byteSizeCorrection:(int)a4 elementType:(id)a5
{
  return -[TCDumpContainer initWithByteSize:byteSizeFieldType:byteSizeFieldName:byteSizeCorrection:elementType:](self, "initWithByteSize:byteSizeFieldType:byteSizeFieldName:byteSizeCorrection:elementType:", 0, *(_QWORD *)&a3, 0, *(_QWORD *)&a4, a5);
}

- (TCDumpContainer)initWithByteSizeFieldName:(id)a3 elementType:(id)a4
{
  return -[TCDumpContainer initWithByteSize:byteSizeFieldType:byteSizeFieldName:byteSizeCorrection:elementType:](self, "initWithByteSize:byteSizeFieldType:byteSizeFieldName:byteSizeCorrection:elementType:", 0, 0, a3, 0, a4);
}

- (TCDumpContainer)initWithByteSizeFieldName:(id)a3 byteSizeCorrection:(int)a4 elementType:(id)a5
{
  return -[TCDumpContainer initWithByteSize:byteSizeFieldType:byteSizeFieldName:byteSizeCorrection:elementType:](self, "initWithByteSize:byteSizeFieldType:byteSizeFieldName:byteSizeCorrection:elementType:", 0, 0, a3, *(_QWORD *)&a4, a5);
}

- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5
{
  TCDumpNumeric *v8;
  void *v9;
  void *v10;
  off_t v11;
  uint64_t v12;
  xmlNode *v13;
  id v14;

  v14 = a5;
  if (self->mByteSizeFieldType)
  {
    v8 = -[TCDumpNumeric initWithType:]([TCDumpNumeric alloc], "initWithType:", self->mByteSizeFieldType);
    readIntegerFromBinaryToXml(v8, (NSString *)CFSTR("byteSize"), a3, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->mByteSize = self->mByteSizeCorrection + objc_msgSend(v9, "intValue");

  }
  if (self->mByteSizeFieldName)
  {
    objc_msgSend(v14, "valueForField:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->mByteSize = self->mByteSizeCorrection + objc_msgSend(v10, "intValue");

  }
  v11 = ftello(a3) + self->mByteSize;
  if (ftello(a3) < v11)
  {
    v12 = 0;
    do
    {
      v13 = xmlNewNode(0, (const xmlChar *)"child");
      xmlAddChild(a4, v13);
      sfaxmlSetLongNoNsProp(v13, (const xmlChar *)"index", v12);
      -[TCDumpType fromBinary:toXml:state:](self->mElementType, "fromBinary:toXml:state:", a3, v13, 0);
      ++v12;
    }
    while (ftello(a3) < v11);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mElementType, 0);
  objc_storeStrong((id *)&self->mByteSizeFieldName, 0);
}

@end
