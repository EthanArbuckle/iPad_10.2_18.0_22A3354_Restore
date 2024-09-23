@implementation STStream

- (STStream)initWithCStream:(_Stream *)a3
{
  STStream *v4;
  STStream *v5;
  STStream *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStream;
  v4 = -[STSStgObject init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->m_pCStream = a3;
    v6 = v4;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[STStream close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)STStream;
  -[STStream dealloc](&v3, sel_dealloc);
}

- (void)close
{
  uint64_t *p_m_pCStream;

  p_m_pCStream = (uint64_t *)&self->m_pCStream;
  if (*p_m_pCStream)
    closeStream(p_m_pCStream);
}

- (void)releaseCStream
{
  self->m_pCStream = 0;
}

- (id)getInfo
{
  STStgInfo *v2;

  v2 = -[STStgInfo initWithStgInfo:]([STStgInfo alloc], "initWithStgInfo:", getStreamInfo((uint64_t)self->m_pCStream));
  if (!v2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("Structured Storage library memory failure"));
  return v2;
}

- (void)seek:(int)a3 fromOrigin:(int)a4
{
  int v5;
  int v6;

  if (a4 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (a4)
    v6 = v5;
  else
    v6 = 0;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", streamSeek((uint64_t)self->m_pCStream, a3, v6));
}

- (unsigned)getPos
{
  unsigned int v3;

  v3 = 0;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", streamGetPos((uint64_t)self->m_pCStream, &v3));
  return v3;
}

- (void)setClass:(id)a3
{
  $DF246ECBFA7C13B1931CDA33BA2B4196 v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", streamSetClass((uint64_t)self->m_pCStream, &v3));
}

- (id)readBytes:(unsigned int)a3
{
  unsigned int v5;
  void *v6;
  void *v7;
  _Stream *m_pCStream;
  id v9;
  unsigned int v11;
  unsigned int v12;

  v12 = 0;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", streamGetBytesAvailableToRead((uint64_t)self->m_pCStream, &v12));
  if (v12 >= a3)
    v5 = a3;
  else
    v5 = v12;
  v11 = v5;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    m_pCStream = self->m_pCStream;
    v9 = objc_retainAutorelease(v6);
    +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", streamRead((uint64_t)m_pCStream, objc_msgSend(v9, "mutableBytes"), &v11));
    objc_msgSend(v9, "setLength:", v11);
  }
  return v7;
}

- (char)readChar8
{
  unsigned int v3;
  char v4;

  v4 = 0;
  v3 = 1;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", streamRead((uint64_t)self->m_pCStream, (uint64_t)&v4, &v3));
  return v4;
}

- (unsigned)readUInt8
{
  unsigned int v3;
  unsigned __int8 v4;

  v4 = 0;
  v3 = 1;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", streamRead((uint64_t)self->m_pCStream, (uint64_t)&v4, &v3));
  return v4;
}

- (unsigned)readBool8
{
  unsigned int v3;
  char v4;

  v4 = 0;
  v3 = 1;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", streamRead((uint64_t)self->m_pCStream, (uint64_t)&v4, &v3));
  return v4 != 0;
}

- (signed)readSInt16
{
  signed __int16 v3;

  v3 = 0;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", readSInt16((uint64_t)self->m_pCStream, &v3));
  return v3;
}

- (unsigned)readUInt16
{
  unsigned __int16 v3;

  v3 = 0;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", readUInt16((uint64_t)self->m_pCStream, &v3));
  return v3;
}

- (int)readSInt32
{
  int v3;

  v3 = 0;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", readSInt32((uint64_t)self->m_pCStream, &v3));
  return v3;
}

- (unsigned)readUInt32
{
  unsigned int v3;

  v3 = 0;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", readSInt32((uint64_t)self->m_pCStream, &v3));
  return v3;
}

- (unint64_t)readUInt64
{
  unint64_t v3;

  v3 = 0;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", readUInt64((uint64_t)self->m_pCStream, &v3));
  return v3;
}

- (float)readFloat32
{
  float v3;

  v3 = 0.0;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", readFloat32((uint64_t)self->m_pCStream, &v3));
  return v3;
}

- (double)readFloat64
{
  double v3;

  v3 = 0.0;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", readFloat64((uint64_t)self->m_pCStream, &v3));
  return v3;
}

- (unsigned)readChar16
{
  unsigned __int16 v3;

  v3 = 0;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", readUInt16((uint64_t)self->m_pCStream, &v3));
  return v3;
}

- (id)readString16:(unsigned int)a3
{
  unsigned __int16 *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  unsigned __int16 *v10;
  __int16 v11;
  int v12;
  void *v13;
  unsigned int v15;

  if (a3 == -1 || (v5 = (unsigned __int16 *)malloc_type_malloc(2 * (a3 + 1), 0xBF89B1ADuLL)) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("Structured Storage library memory failure"));
    v5 = 0;
  }
  v15 = a3;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", readString16((uint64_t)self->m_pCStream, (int *)&v15, v5));
  v5[a3] = 0;
  if ((int)v15 < 1)
  {
    v7 = 0;
    goto LABEL_13;
  }
  v6 = malloc_type_malloc(2 * v15, 0xBF89B1ADuLL);
  v7 = v6;
  if (!v6)
  {
LABEL_13:
    v9 = 0;
    goto LABEL_16;
  }
  v8 = v15;
  if ((int)v15 < 1)
  {
    v9 = 0;
  }
  else
  {
    v9 = 0;
    v10 = v5;
    do
    {
      v12 = *v10++;
      v11 = v12;
      if (v12)
        *((_WORD *)v6 + v9++) = v11;
      --v8;
    }
    while (v8);
  }
  free(v5);
LABEL_16:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", v7, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  free(v7);
  return v13;
}

- (void)writeBytes:(id)a3
{
  id v4;
  _Stream *m_pCStream;
  id v6;
  uint64_t v7;
  unsigned int v8;

  v4 = a3;
  v8 = objc_msgSend(v4, "length");
  m_pCStream = self->m_pCStream;
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "bytes");

  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", streamWrite((uint64_t)m_pCStream, v7, &v8));
}

- (void)writeUInt8:(unsigned __int8)a3
{
  unsigned int v3;
  unsigned __int8 v4;

  v4 = a3;
  v3 = 1;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", streamWrite((uint64_t)self->m_pCStream, (uint64_t)&v4, &v3));
}

- (void)writeChar8:(char)a3
{
  unsigned int v3;
  char v4;

  v4 = a3;
  v3 = 1;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", streamWrite((uint64_t)self->m_pCStream, (uint64_t)&v4, &v3));
}

- (void)writeBool8:(unsigned __int8)a3
{
  unsigned int v3;
  unsigned __int8 v4;

  v4 = a3;
  v3 = 1;
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", streamWrite((uint64_t)self->m_pCStream, (uint64_t)&v4, &v3));
}

- (void)writeSInt16:(signed __int16)a3
{
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", writeSInt16((uint64_t)self->m_pCStream, a3));
}

- (void)writeUInt16:(unsigned __int16)a3
{
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", writeSInt16((uint64_t)self->m_pCStream, a3));
}

- (void)writeSInt32:(int)a3
{
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", writeSInt32((uint64_t)self->m_pCStream, *(uint64_t *)&a3));
}

- (void)writeUInt32:(unsigned int)a3
{
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", writeSInt32((uint64_t)self->m_pCStream, *(uint64_t *)&a3));
}

- (void)writeFloat32:(float)a3
{
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", writeFloat32((uint64_t)self->m_pCStream, a3));
}

- (void)writeFloat64:(double)a3
{
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", writeFloat64((uint64_t)self->m_pCStream, a3));
}

- (void)writeChar16:(unsigned __int16)a3
{
  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", writeSInt16((uint64_t)self->m_pCStream, a3));
}

- (void)writeString16:(id)a3
{
  id v4;
  _Stream *m_pCStream;
  unsigned __int16 *v6;
  unsigned int v7;

  v4 = a3;
  v7 = objc_msgSend(v4, "length") + 1;
  m_pCStream = self->m_pCStream;
  v6 = (unsigned __int16 *)objc_msgSend(v4, "cWideString");

  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", writeString16((uint64_t)m_pCStream, v6, &v7));
}

- (void)writeString16NoTerminator:(id)a3
{
  id v4;
  _Stream *m_pCStream;
  unsigned __int16 *v6;
  unsigned int v7;

  v4 = a3;
  v7 = objc_msgSend(v4, "length");
  m_pCStream = self->m_pCStream;
  v6 = (unsigned __int16 *)objc_msgSend(v4, "cWideString");

  +[STSStgObject throwIfError:](STSStgObject, "throwIfError:", writeString16((uint64_t)m_pCStream, v6, &v7));
}

- (_Stream)cStream
{
  return self->m_pCStream;
}

@end
