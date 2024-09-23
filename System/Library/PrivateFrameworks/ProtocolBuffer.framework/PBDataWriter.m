@implementation PBDataWriter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (unint64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  PBMutableData *data;
  char *end;
  char *p;
  unint64_t v10;

  data = self->_data;
  end = data->end;
  p = data->p;
  if (end < &p[a4])
  {
    if (end - data->buffer <= a4)
      v10 = a4;
    else
      v10 = end - data->buffer;
    -[PBMutableData _pb_growCapacityBy:](data, v10);
    p = self->_data->p;
  }
  memcpy(p, a3, a4);
  self->_data->p += a4;
  return a4;
}

- (void)writeProtoBuffer:(id)a3
{
  uint64_t v4;
  unsigned int v5;
  PBMutableData *data;
  unint64_t end;
  char *p;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "length");
  v5 = bswap32(v4);
  data = self->_data;
  end = (unint64_t)data->end;
  p = data->p;
  if (end < (unint64_t)&p[v4 + 4])
  {
    v9 = end - (unint64_t)data->buffer;
    if (v9 <= v4 + 4)
      v10 = v4 + 4;
    else
      v10 = v9;
    -[PBMutableData _pb_growCapacityBy:](data, v10);
    p = self->_data->p;
  }
  *(_DWORD *)p = v5;
  self->_data->p += 4;
  v11 = v12;
  if (v12)
  {
    memcpy(self->_data->p, (const void *)objc_msgSend(objc_retainAutorelease(v12), "bytes"), v4);
    v11 = v12;
    self->_data->p += v4;
  }

}

- (void)writeBigEndianShortThenString:(id)a3
{
  const char *v4;
  const char *v5;
  size_t v6;
  unsigned int v7;
  PBMutableData *data;
  unint64_t end;
  char *p;
  unint64_t v11;
  uint64_t v12;
  PBMutableData *v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  PBMutableData *v17;
  char *v18;

  v4 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  if (v4)
  {
    v5 = v4;
    v6 = strlen(v4);
    v7 = bswap32(v6) >> 16;
    data = self->_data;
    end = (unint64_t)data->end;
    p = data->p;
    if (end < (unint64_t)&p[v6 + 2])
    {
      v11 = end - (unint64_t)data->buffer;
      if (v11 <= v6 + 2)
        v12 = v6 + 2;
      else
        v12 = v11;
      -[PBMutableData _pb_growCapacityBy:](data, v12);
      p = self->_data->p;
    }
    *(_WORD *)p = v7;
    self->_data->p += 2;
    memcpy(self->_data->p, v5, v6);
    self->_data->p += v6;
  }
  else
  {
    v13 = self->_data;
    v14 = (unint64_t)v13->end;
    v15 = v13->p;
    if (v14 < (unint64_t)(v15 + 2))
    {
      if (v14 - (unint64_t)v13->buffer <= 2)
        v16 = 2;
      else
        v16 = v14 - (unint64_t)v13->buffer;
      -[PBMutableData _pb_growCapacityBy:](v13, v16);
      v13 = self->_data;
      v15 = v13->p;
    }
    v13->p = v15 + 1;
    *v15 = 0;
    v17 = self->_data;
    v18 = v17->p;
    v17->p = v18 + 1;
    *v18 = 0;
  }
}

- (BOOL)writeData:(id)a3
{
  id v4;
  size_t v5;
  PBMutableData *data;
  char *end;
  char *p;
  size_t v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  data = self->_data;
  end = data->end;
  p = data->p;
  if (end < &p[v5])
  {
    v9 = end - data->buffer;
    if (v9 <= v5)
      v10 = v5;
    else
      v10 = v9;
    -[PBMutableData _pb_growCapacityBy:](data, v10);
    p = self->_data->p;
  }
  v11 = objc_retainAutorelease(v4);
  memcpy(p, (const void *)objc_msgSend(v11, "bytes"), v5);
  self->_data->p += v5;

  return 1;
}

- (id)immutableData
{
  return self->_data;
}

- (PBDataWriter)init
{
  PBDataWriter *v2;
  PBMutableData *v3;
  PBMutableData *data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PBDataWriter;
  v2 = -[PBDataWriter init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PBMutableData initWithCapacity:]([PBMutableData alloc], "initWithCapacity:", 256);
    data = v2->_data;
    v2->_data = v3;

  }
  return v2;
}

- (void)writeData:(id)a3 forTag:(unsigned int)a4
{
  if (a3)
    PBDataWriterWriteDataField((uint64_t)self, a3, a4);
}

- (void)writeBigEndianFixed32:(unsigned int)a3
{
  PBMutableData *data;
  unint64_t end;
  char *p;
  unint64_t v8;
  uint64_t v9;

  data = self->_data;
  end = (unint64_t)data->end;
  p = data->p;
  if (end < (unint64_t)(p + 4))
  {
    v8 = end - (unint64_t)data->buffer;
    if (v8 <= 4)
      v9 = 4;
    else
      v9 = v8;
    -[PBMutableData _pb_growCapacityBy:](data, v9);
    p = self->_data->p;
  }
  *(_DWORD *)p = bswap32(a3);
  self->_data->p += 4;
}

- (void)writeBigEndianFixed16:(unsigned __int16)a3
{
  unsigned int v3;
  PBMutableData *data;
  unint64_t end;
  char *p;
  unint64_t v8;
  uint64_t v9;

  v3 = a3;
  data = self->_data;
  end = (unint64_t)data->end;
  p = data->p;
  if (end < (unint64_t)(p + 2))
  {
    v8 = end - (unint64_t)data->buffer;
    if (v8 <= 2)
      v9 = 2;
    else
      v9 = v8;
    -[PBMutableData _pb_growCapacityBy:](data, v9);
    p = self->_data->p;
  }
  *(_WORD *)p = __rev16(v3);
  self->_data->p += 2;
}

- (void)writeString:(id)a3 forTag:(unsigned int)a4
{
  PBDataWriterWriteStringField((uint64_t)self, a3, a4);
}

- (PBDataWriter)initWithInitialCapacity:(unint64_t)a3
{
  PBDataWriter *v4;
  PBMutableData *v5;
  unint64_t v6;
  uint64_t v7;
  PBMutableData *data;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PBDataWriter;
  v4 = -[PBDataWriter init](&v10, sel_init);
  if (v4)
  {
    v5 = [PBMutableData alloc];
    if (a3 <= 0x100)
      v6 = 256;
    else
      v6 = a3;
    v7 = -[PBMutableData initWithCapacity:](v5, "initWithCapacity:", v6);
    data = v4->_data;
    v4->_data = (PBMutableData *)v7;

  }
  return v4;
}

- (void)writeInt32:(int)a3 forTag:(unsigned int)a4
{
  PBDataWriterWriteInt32Field((uint64_t)self, a3, a4);
}

- (void)writeInt64:(int64_t)a3 forTag:(unsigned int)a4
{
  PBDataWriterWriteInt64Field((uint64_t)self, a3, a4);
}

- (void)writeUint32:(unsigned int)a3 forTag:(unsigned int)a4
{
  PBDataWriterWriteUint32Field((uint64_t)self, a3, a4);
}

- (void)writeUint64:(unint64_t)a3 forTag:(unsigned int)a4
{
  PBDataWriterWriteUint64Field((uint64_t)self, a3, a4);
}

- (void)writeBOOL:(BOOL)a3 forTag:(unsigned int)a4
{
  PBDataWriterWriteBOOLField((uint64_t)self, a3, a4);
}

- (void)writeSint32:(int)a3 forTag:(unsigned int)a4
{
  PBDataWriterWriteSint32Field((uint64_t)self, a3, a4);
}

- (void)writeSint64:(int64_t)a3 forTag:(unsigned int)a4
{
  int64_t v7;
  PBMutableData *data;
  unint64_t end;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *p;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  int64_t v18;
  unint64_t v19;

  v7 = 2 * a3;
  data = self->_data;
  end = (unint64_t)data->end;
  if ((char *)end < data->p + 16)
  {
    v10 = end - (unint64_t)data->buffer;
    if (v10 <= 0x10)
      v11 = 16;
    else
      v11 = v10;
    -[PBMutableData _pb_growCapacityBy:](data, v11);
    data = self->_data;
  }
  v12 = v7 ^ (a3 >> 63);
  if (a4 != -1)
  {
    v13 = 8 * a4;
    p = data->p;
    if (v13 < 0x80)
    {
      LOBYTE(v15) = 8 * a4;
    }
    else
    {
      do
      {
        *p++ = v13 | 0x80;
        v15 = v13 >> 7;
        v16 = v13 >> 14;
        v13 >>= 7;
      }
      while (v16);
    }
    *p = v15;
    self->_data->p = p + 1;
    data = self->_data;
  }
  v17 = data->p;
  if (v12 < 0x80)
  {
    v18 = v7 ^ (a3 >> 63);
  }
  else
  {
    do
    {
      *v17++ = v12 | 0x80;
      v18 = v12 >> 7;
      v19 = v12 >> 14;
      v12 >>= 7;
    }
    while (v19);
  }
  *v17 = v18;
  self->_data->p = v17 + 1;
}

- (void)writeDouble:(double)a3 forTag:(unsigned int)a4
{
  PBDataWriterWriteDoubleField((uint64_t)self, a4, a3);
}

- (void)writeFloat:(float)a3 forTag:(unsigned int)a4
{
  PBDataWriterWriteFloatField((uint64_t)self, a4, a3);
}

- (void)writeFixed32:(unsigned int)a3 forTag:(unsigned int)a4
{
  PBDataWriterWriteFixed32Field((uint64_t)self, a3, a4);
}

- (void)writeFixed64:(unint64_t)a3 forTag:(unsigned int)a4
{
  PBDataWriterWriteFixed64Field((uint64_t)self, a3, a4);
}

- (void)writeSfixed32:(int)a3 forTag:(unsigned int)a4
{
  PBDataWriterWriteSfixed32Field((uint64_t)self, a3, a4);
}

- (void)writeSfixed64:(int64_t)a3 forTag:(unsigned int)a4
{
  PBDataWriterWriteSfixed64Field((uint64_t)self, a3, a4);
}

- (void)writeInt8:(char)a3
{
  PBMutableData *data;
  unint64_t end;
  char *p;
  uint64_t v8;

  data = self->_data;
  end = (unint64_t)data->end;
  p = data->p;
  if (end < (unint64_t)(p + 1))
  {
    if (end - (unint64_t)data->buffer <= 1)
      v8 = 1;
    else
      v8 = end - (unint64_t)data->buffer;
    -[PBMutableData _pb_growCapacityBy:](data, v8);
    data = self->_data;
    p = data->p;
  }
  data->p = p + 1;
  *p = a3;
}

- (void)writeUint8:(unsigned __int8)a3
{
  PBMutableData *data;
  unint64_t end;
  _BYTE *p;
  uint64_t v8;

  data = self->_data;
  end = (unint64_t)data->end;
  p = data->p;
  if (end < (unint64_t)(p + 1))
  {
    if (end - (unint64_t)data->buffer <= 1)
      v8 = 1;
    else
      v8 = end - (unint64_t)data->buffer;
    -[PBMutableData _pb_growCapacityBy:](data, v8);
    data = self->_data;
    p = data->p;
  }
  data->p = p + 1;
  *p = a3;
}

- (void)writeBareVarint:(unint64_t)a3
{
  PBMutableData *data;
  unint64_t end;
  char *p;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;

  data = self->_data;
  end = (unint64_t)data->end;
  p = data->p;
  if (end < (unint64_t)(p + 16))
  {
    if (end - (unint64_t)data->buffer <= 0x10)
      v8 = 16;
    else
      v8 = end - (unint64_t)data->buffer;
    -[PBMutableData _pb_growCapacityBy:](data, v8);
    p = self->_data->p;
  }
  if (a3 < 0x80)
  {
    LOBYTE(v9) = a3;
  }
  else
  {
    do
    {
      *p++ = a3 | 0x80;
      v9 = a3 >> 7;
      v10 = a3 >> 14;
      a3 >>= 7;
    }
    while (v10);
  }
  *p = v9;
  self->_data->p = p + 1;
}

- (void)writeTag:(unsigned int)a3 andType:(unsigned __int8)a4
{
  int v4;
  PBMutableData *data;
  unint64_t end;
  char *p;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  if (a3 != -1)
  {
    v4 = a4;
    data = self->_data;
    end = (unint64_t)data->end;
    p = data->p;
    if (end < (unint64_t)(p + 8))
    {
      if (end - (unint64_t)data->buffer <= 8)
        v10 = 8;
      else
        v10 = end - (unint64_t)data->buffer;
      -[PBMutableData _pb_growCapacityBy:](data, v10);
      p = self->_data->p;
    }
    v11 = v4 | (8 * a3);
    if (v11 < 0x80)
    {
      LOBYTE(v12) = v4 | (8 * a3);
    }
    else
    {
      do
      {
        *p++ = v11 | 0x80;
        v12 = v11 >> 7;
        v13 = v11 >> 14;
        v11 >>= 7;
      }
      while (v13);
    }
    *p = v12;
    self->_data->p = p + 1;
  }
}

@end
