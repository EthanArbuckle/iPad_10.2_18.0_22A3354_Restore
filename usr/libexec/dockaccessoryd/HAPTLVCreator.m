@implementation HAPTLVCreator

+ (id)creator
{
  return -[HAPTLVCreator initWithBufferSize:]([HAPTLVCreator alloc], "initWithBufferSize:", 0x4000);
}

+ (id)creatorWithBufferSize:(unint64_t)a3
{
  return -[HAPTLVCreator initWithBufferSize:]([HAPTLVCreator alloc], "initWithBufferSize:", a3);
}

- (HAPTLVCreator)initWithBufferSize:(unint64_t)a3
{
  HAPTLVCreator *v4;
  HAPTLVCreator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HAPTLVCreator;
  v4 = -[HAPTLVCreator init](&v7, "init");
  v5 = v4;
  if (v4)
  {
    v4->_addHasFailed = 0;
    TLV8BufferInit(&v4->_tlv, a3);
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  TLV8BufferFree(&self->_tlv, a2);
  v3.receiver = self;
  v3.super_class = (Class)HAPTLVCreator;
  -[HAPTLVCreator dealloc](&v3, "dealloc");
}

- (id)serialize
{
  if (self->_addHasFailed)
    return 0;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", self->_tlv.ptr, self->_tlv.len));
}

- (BOOL)addTLV:(unint64_t)a3 data:(id)a4
{
  unsigned __int8 v4;
  id v6;
  void *v7;
  id v8;
  int v9;
  BOOL v10;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  v8 = objc_retainAutorelease(v6);
  v9 = TLV8BufferAppend(&self->_tlv, v4, objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"));
  v10 = 1;
  if (v9)
  {
    self->_addHasFailed = 1;
LABEL_4:
    v10 = 0;
  }

  return v10;
}

- (BOOL)addTLV:(unint64_t)a3 string:(id)a4
{
  unsigned __int8 v4;
  id v6;
  int v7;
  BOOL v8;

  if (!a4)
    return 0;
  v4 = a3;
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "dataUsingEncoding:", 4)));
  v7 = TLV8BufferAppend(&self->_tlv, v4, objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"));
  v8 = v7 == 0;
  if (v7)
    self->_addHasFailed = 1;

  return v8;
}

- (BOOL)addTLV:(unint64_t)a3 number:(id)a4
{
  unsigned __int8 v4;
  id v6;
  void *v7;
  int appended;
  BOOL v9;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
    goto LABEL_4;
  appended = TLV8BufferAppendUInt64(&self->_tlv, v4, objc_msgSend(v6, "unsignedIntegerValue"));
  v9 = 1;
  if (appended)
  {
    self->_addHasFailed = 1;
LABEL_4:
    v9 = 0;
  }

  return v9;
}

- (BOOL)addTLV:(unint64_t)a3 length:(unint64_t)a4 number:(id)a5
{
  void *v8;
  BOOL v9;
  id v11;

  if (!a5)
    return 0;
  v11 = objc_msgSend(a5, "unsignedIntegerValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v11, a4));
  v9 = -[HAPTLVCreator addTLV:data:](self, "addTLV:data:", a3, v8);

  return v9;
}

- (BOOL)addTLV:(unint64_t)a3 length:(unint64_t)a4 floatNumber:(id)a5
{
  int v8;
  void *v9;
  BOOL v10;
  int v12;

  if (!a5)
    return 0;
  objc_msgSend(a5, "floatValue");
  v12 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v12, a4));
  v10 = -[HAPTLVCreator addTLV:data:](self, "addTLV:data:", a3, v9);

  return v10;
}

- (BOOL)addTLV:(unint64_t)a3 uuid:(id)a4
{
  unsigned __int8 v4;
  int v6;
  BOOL result;
  _QWORD v8[2];

  if (!a4)
    return 0;
  v4 = a3;
  v8[0] = 0;
  v8[1] = 0;
  objc_msgSend(a4, "getUUIDBytes:", v8);
  v6 = TLV8BufferAppend(&self->_tlv, v4, v8, 16);
  result = v6 == 0;
  if (v6)
    self->_addHasFailed = 1;
  return result;
}

@end
