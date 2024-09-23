@implementation DataOutputStream

- (DataOutputStream)initWithByteOrder:(int64_t)a3
{
  DataOutputStream *v4;
  NSMutableData *v5;
  NSMutableData *stream;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DataOutputStream;
  v4 = -[DataOutputStream init](&v8, "init");
  if (v4)
  {
    v5 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    stream = v4->_stream;
    v4->_stream = v5;

    v4->_byteOrder = a3;
  }
  return v4;
}

+ (id)outputStream
{
  return -[DataOutputStream initWithByteOrder:]([DataOutputStream alloc], "initWithByteOrder:", 0);
}

+ (id)outputStreamWithByteOrder:(int64_t)a3
{
  return -[DataOutputStream initWithByteOrder:]([DataOutputStream alloc], "initWithByteOrder:", a3);
}

- (void)writeUint8:(unsigned __int8)a3
{
  void *v3;
  unsigned __int8 v4;

  v4 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DataOutputStream stream](self, "stream"));
  objc_msgSend(v3, "appendBytes:length:", &v4, 1);

}

- (void)writeUint16:(unsigned __int16)a3
{
  unsigned int v3;
  int64_t v5;
  __int16 v6;
  void *v7;
  __int16 v8;

  v3 = a3;
  v5 = -[DataOutputStream byteOrder](self, "byteOrder");
  v6 = __rev16(v3);
  if (v5 == 1)
    v6 = v3;
  v8 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataOutputStream stream](self, "stream"));
  objc_msgSend(v7, "appendBytes:length:", &v8, 2);

}

- (void)writeUint32:(unsigned int)a3
{
  int64_t v5;
  unsigned int v6;
  void *v7;
  unsigned int v8;

  v5 = -[DataOutputStream byteOrder](self, "byteOrder");
  v6 = bswap32(a3);
  if (v5 == 1)
    v6 = a3;
  v8 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataOutputStream stream](self, "stream"));
  objc_msgSend(v7, "appendBytes:length:", &v8, 4);

}

- (void)writeUint24:(unsigned int)a3
{
  int64_t v5;
  unsigned int v6;
  char v7;
  void *v8;
  _BYTE v9[3];

  v5 = -[DataOutputStream byteOrder](self, "byteOrder");
  v6 = HIWORD(a3);
  if (v5 == 1)
    v7 = a3;
  else
    v7 = BYTE2(a3);
  if (v5 != 1)
    LOBYTE(v6) = a3;
  v9[0] = v7;
  v9[1] = BYTE1(a3);
  v9[2] = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataOutputStream stream](self, "stream"));
  objc_msgSend(v8, "appendBytes:length:", v9, 3);

}

- (void)writeUint40:(unint64_t)a3
{
  int64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  _BYTE v11[5];

  v5 = -[DataOutputStream byteOrder](self, "byteOrder");
  v6 = a3 >> 24;
  v7 = HIDWORD(a3);
  if (v5 == 1)
    LOBYTE(v8) = a3;
  else
    v8 = HIDWORD(a3);
  v11[0] = v8;
  if (v5 == 1)
    v9 = a3 >> 8;
  else
    v9 = a3 >> 24;
  if (v5 != 1)
    v6 = a3 >> 8;
  v11[1] = v9;
  v11[2] = BYTE2(a3);
  if (v5 != 1)
    LOBYTE(v7) = a3;
  v11[3] = v6;
  v11[4] = v7;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DataOutputStream stream](self, "stream"));
  objc_msgSend(v10, "appendBytes:length:", v11, 5);

}

- (void)writeData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DataOutputStream stream](self, "stream"));
  objc_msgSend(v5, "appendData:", v4);

}

- (void)writeBytes:(const void *)a3 length:(unint64_t)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[DataOutputStream stream](self, "stream"));
  objc_msgSend(v6, "appendBytes:length:", a3, a4);

}

- (void)writeString:(id)a3
{
  const char *v4;
  id v5;

  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[DataOutputStream stream](self, "stream"));
  objc_msgSend(v5, "appendBytes:length:", v4, strlen(v4) + 1);

}

- (NSMutableData)stream
{
  return self->_stream;
}

- (void)setStream:(id)a3
{
  objc_storeStrong((id *)&self->_stream, a3);
}

- (int64_t)byteOrder
{
  return self->_byteOrder;
}

- (void)setByteOrder:(int64_t)a3
{
  self->_byteOrder = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
