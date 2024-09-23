@implementation TCDumpStruct

- (TCDumpStruct)initWithSize:(int64_t)a3 sizeFieldName:(id)a4 sizeCorrection:(int)a5 members:(id)a6
{
  id v11;
  id v12;
  TCDumpStruct *v13;
  TCDumpStruct *v14;
  NSMutableArray *v15;
  NSMutableArray *mMembers;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  TCDumpField *v22;
  objc_super v24;

  v11 = a4;
  v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TCDumpStruct;
  v13 = -[TCDumpType init](&v24, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->mSize = a3;
    objc_storeStrong((id *)&v13->mSizeFieldName, a4);
    v14->mSizeCorrection = a5;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    mMembers = v14->mMembers;
    v14->mMembers = v15;

    v17 = objc_msgSend(v12, "count");
    if (v17 >= 2)
    {
      v18 = v17 >> 1;
      v19 = 1;
      do
      {
        objc_msgSend(v12, "objectAtIndex:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", v19 - 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[TCDumpField initWithType:name:]([TCDumpField alloc], "initWithType:name:", v20, v21);
        -[NSMutableArray addObject:](v14->mMembers, "addObject:", v22);

        v19 += 2;
        --v18;
      }
      while (v18);
    }
  }

  return v14;
}

- (TCDumpStruct)initWithMembers:(id)a3
{
  return -[TCDumpStruct initWithSize:sizeFieldName:sizeCorrection:members:](self, "initWithSize:sizeFieldName:sizeCorrection:members:", -1, 0, 0, a3);
}

- (TCDumpStruct)initWithSize:(int64_t)a3 members:(id)a4
{
  return -[TCDumpStruct initWithSize:sizeFieldName:sizeCorrection:members:](self, "initWithSize:sizeFieldName:sizeCorrection:members:", a3, 0, 0, a4);
}

- (TCDumpStruct)initWithSizeFieldName:(id)a3 members:(id)a4
{
  return -[TCDumpStruct initWithSize:sizeFieldName:sizeCorrection:members:](self, "initWithSize:sizeFieldName:sizeCorrection:members:", -1, a3, 0, a4);
}

- (TCDumpStruct)initWithSizeFieldName:(id)a3 sizeCorrection:(int)a4 members:(id)a5
{
  return -[TCDumpStruct initWithSize:sizeFieldName:sizeCorrection:members:](self, "initWithSize:sizeFieldName:sizeCorrection:members:", -1, a3, *(_QWORD *)&a4, a5);
}

- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5
{
  TCDumpBinaryToXmlState *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  xmlNode *v13;
  id v14;
  void *v15;
  void *v16;
  off_t v17;
  void *v18;
  off_t v19;
  int64_t mSize;
  xmlNode *v22;
  TCDumpBlob *v23;
  off_t v24;
  id v25;

  v25 = a5;
  v8 = objc_alloc_init(TCDumpBinaryToXmlState);
  v24 = ftello(a3);
  v9 = -[NSMutableArray count](self->mMembers, "count");
  if (v9)
  {
    for (i = 0; i != v9; ++i)
    {
      -[NSMutableArray objectAtIndex:](self->mMembers, "objectAtIndex:", i);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = a4;
      if (v12)
      {
        objc_msgSend(v11, "name");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v13 = xmlNewNode(0, (const xmlChar *)objc_msgSend(v14, "UTF8String"));

        xmlAddChild(a4, v13);
      }
      objc_msgSend(v11, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[TCDumpBinaryToXmlState setCurrentField:](v8, "setCurrentField:", v15);

      objc_msgSend(v11, "type");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fromBinary:toXml:state:", a3, v13, v8);

      -[TCDumpBinaryToXmlState setCurrentField:](v8, "setCurrentField:", 0);
    }
  }
  v17 = ftello(a3);
  if (self->mSizeFieldName)
  {
    objc_msgSend(v25, "valueForField:");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      -[TCDumpBinaryToXmlState valueForField:](v8, "valueForField:", self->mSizeFieldName);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    self->mSize = self->mSizeCorrection + (int)objc_msgSend(v18, "intValue");

  }
  v19 = v17 - v24;
  mSize = self->mSize;
  if (mSize != -1 && mSize > v19)
  {
    v22 = xmlNewNode(0, (const xmlChar *)"padding");
    xmlAddChild(a4, v22);
    v23 = -[TCDumpBlob initWithSize_:]([TCDumpBlob alloc], "initWithSize_:", self->mSize - v19);
    -[TCDumpBlob fromBinary:toXml:state:](v23, "fromBinary:toXml:state:", a3, v22, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMembers, 0);
  objc_storeStrong((id *)&self->mSizeFieldName, 0);
}

@end
