@implementation DataInputStream

- (DataInputStream)initWithValue:(id)a3 byteOrder:(int64_t)a4
{
  id v6;
  DataInputStream *v7;
  DataInputStream *v8;
  NSInputStream *v9;
  NSInputStream *stream;
  NSInputStream *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DataInputStream;
  v7 = -[DataInputStream init](&v13, "init");
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      v9 = (NSInputStream *)objc_msgSend(objc_alloc((Class)NSInputStream), "initWithData:", v6);
      stream = v8->_stream;
      v8->_stream = v9;

      -[NSInputStream open](v8->_stream, "open");
    }
    else
    {
      v11 = v7->_stream;
      v7->_stream = 0;

    }
    v8->_byteOrder = a4;
  }

  return v8;
}

+ (id)inputStreamWithData:(id)a3
{
  id v3;
  DataInputStream *v4;

  v3 = a3;
  v4 = -[DataInputStream initWithValue:byteOrder:]([DataInputStream alloc], "initWithValue:byteOrder:", v3, 0);

  return v4;
}

+ (id)inputStreamWithData:(id)a3 byteOrder:(int64_t)a4
{
  id v5;
  DataInputStream *v6;

  v5 = a3;
  v6 = -[DataInputStream initWithValue:byteOrder:]([DataInputStream alloc], "initWithValue:byteOrder:", v5, a4);

  return v6;
}

- (BOOL)readUint8:(char *)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DataInputStream stream](self, "stream"));
  v5 = objc_msgSend(v4, "read:maxLength:", a3, 1);

  return v5 == (id)1;
}

- (BOOL)readUint16:(unsigned __int16 *)a3
{
  void *v5;
  id v6;
  int64_t v7;
  unsigned int v8;
  unsigned int v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataInputStream stream](self, "stream"));
  v6 = objc_msgSend(v5, "read:maxLength:", a3, 2);

  v7 = -[DataInputStream byteOrder](self, "byteOrder");
  v8 = *a3;
  v9 = bswap32(v8) >> 16;
  if (v7 != 1)
    LOWORD(v8) = v9;
  *a3 = v8;
  return v6 == (id)2;
}

- (BOOL)readUint32:(unsigned int *)a3
{
  void *v5;
  id v6;
  int64_t v7;
  unsigned int v8;
  unsigned int v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataInputStream stream](self, "stream"));
  v6 = objc_msgSend(v5, "read:maxLength:", a3, 4);

  v7 = -[DataInputStream byteOrder](self, "byteOrder");
  v8 = *a3;
  v9 = bswap32(*a3);
  if (v7 != 1)
    v8 = v9;
  *a3 = v8;
  return v6 == (id)4;
}

- (BOOL)readIEEEFloat:(float *)a3
{
  void *v5;
  id v6;
  char v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  float v15;
  NSObject *v16;
  double v17;
  int v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  double v25;

  v19 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataInputStream stream](self, "stream"));
  v6 = objc_msgSend(v5, "read:maxLength:", &v19, 4);

  if (v6 != (id)4)
    return v6 == (id)4;
  if ((id)-[DataInputStream byteOrder](self, "byteOrder") == (id)1)
  {
    v7 = HIBYTE(v19);
    v8 = BYTE2(v19);
    v9 = v19;
    if ((SBYTE2(v19) & 0x80000000) == 0)
    {
      v10 = BYTE1(v19);
LABEL_7:
      v11 = v9 | (v8 << 16) | (v10 << 8);
      goto LABEL_11;
    }
    v12 = v19 ^ 0xFF;
    v13 = BYTE1(v19);
  }
  else
  {
    v7 = v19;
    v8 = BYTE1(v19);
    v9 = HIBYTE(v19);
    if ((SBYTE1(v19) & 0x80000000) == 0)
    {
      v10 = BYTE2(v19);
      goto LABEL_7;
    }
    v12 = HIBYTE(v19) ^ 0xFF;
    v13 = BYTE2(v19);
  }
  v11 = ((v12 | ((v13 ^ 0xFF) << 8) | (v8 << 16)) ^ 0xFF00FFFF) + 2;
LABEL_11:
  v14 = v7;
  v15 = __exp10((double)v7) * (double)v11;
  *a3 = v15;
  v16 = qword_1000C9178;
  if (os_log_type_enabled((os_log_t)qword_1000C9178, OS_LOG_TYPE_DEFAULT))
  {
    v17 = *a3;
    *(_DWORD *)buf = 67109632;
    v21 = v14;
    v22 = 1024;
    v23 = v11;
    v24 = 2048;
    v25 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "exp : %d, mag : %d, number = %f ", buf, 0x18u);
  }
  return v6 == (id)4;
}

- (BOOL)readString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  id v9;
  char v11;

  v4 = a3;
  v11 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataInputStream stream](self, "stream"));
  v6 = objc_msgSend(v5, "read:maxLength:", &v11, 1);

  if (v6)
  {
    do
    {
      v7 = v11 == 0;
      if (!v11)
        break;
      objc_msgSend(v4, "appendFormat:", CFSTR("%c"), v11);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DataInputStream stream](self, "stream"));
      v9 = objc_msgSend(v8, "read:maxLength:", &v11, 1);

    }
    while (v9);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)readUint24:(unsigned int *)a3
{
  void *v5;
  id v6;
  unsigned int v7;
  __int16 v9;
  unsigned __int8 v10;

  v10 = 0;
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataInputStream stream](self, "stream"));
  v6 = objc_msgSend(v5, "read:maxLength:", &v9, 3);

  if (v6 == (id)3)
  {
    if ((id)-[DataInputStream byteOrder](self, "byteOrder") == (id)1)
      v7 = (v10 << 16) | (HIBYTE(v9) << 8) | v9;
    else
      v7 = (v9 << 16) | (HIBYTE(v9) << 8) | v10;
    *a3 = v7;
  }
  return v6 == (id)3;
}

- (BOOL)readUint40:(unint64_t *)a3
{
  void *v5;
  id v6;
  unint64_t v7;
  unsigned int v9;
  unsigned __int8 v10;

  v10 = 0;
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataInputStream stream](self, "stream"));
  v6 = objc_msgSend(v5, "read:maxLength:", &v9, 5);

  if (v6 == (id)5)
  {
    if ((id)-[DataInputStream byteOrder](self, "byteOrder") == (id)1)
      v7 = v9 | ((unint64_t)v10 << 32);
    else
      v7 = ((unint64_t)v9 << 32) | ((unint64_t)BYTE1(v9) << 24) | ((unint64_t)BYTE2(v9) << 16) | ((unint64_t)HIBYTE(v9) << 8) | v10;
    *a3 = v7;
  }
  return v6 == (id)5;
}

- (BOOL)readUint48:(unint64_t *)a3
{
  void *v5;
  id v6;
  unint64_t v7;
  unsigned int v9;
  __int16 v10;

  v10 = 0;
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DataInputStream stream](self, "stream"));
  v6 = objc_msgSend(v5, "read:maxLength:", &v9, 6);

  if (v6 == (id)6)
  {
    if ((id)-[DataInputStream byteOrder](self, "byteOrder") == (id)1)
      v7 = v9 | ((unint64_t)v10 << 32) | ((unint64_t)HIBYTE(v10) << 40);
    else
      v7 = ((unint64_t)v9 << 40) | ((unint64_t)BYTE1(v9) << 32) | ((unint64_t)BYTE2(v9) << 24) | ((unint64_t)HIBYTE(v9) << 16) | ((unint64_t)v10 << 8) | HIBYTE(v10);
    *a3 = v7;
  }
  return v6 == (id)6;
}

- (BOOL)readNumBytes:(unsigned int)a3 toData:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v10;

  v6 = a4;
  bzero((char *)&v10 - ((a3 + 15) & 0x1FFFFFFF0), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DataInputStream stream](self, "stream"));
  v8 = objc_msgSend(v7, "read:maxLength:", (char *)&v10 - ((a3 + 15) & 0x1FFFFFFF0), a3);

  if (v8 == (id)a3)
    objc_msgSend(v6, "appendBytes:length:", (char *)&v10 - ((a3 + 15) & 0x1FFFFFFF0), a3);

  return v8 == (id)a3;
}

- (NSInputStream)stream
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
