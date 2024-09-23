@implementation IPAChecksum

- (IPAChecksum)initWithBytes:(IPAChecksumBytes)a3
{
  uint64_t v3;
  uint64_t v4;
  IPAChecksum *result;
  objc_super v6;

  v3 = *(_QWORD *)&a3.data[8];
  v4 = *(_QWORD *)a3.data;
  v6.receiver = self;
  v6.super_class = (Class)IPAChecksum;
  result = -[IPAChecksum init](&v6, sel_init);
  *(_QWORD *)result->_bytes.data = v4;
  *(_QWORD *)&result->_bytes.data[8] = v3;
  return result;
}

- (IPAChecksum)initWithString:(id)a3
{
  id v4;
  IPAChecksum *v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  char v12;
  int v13;
  char v14;
  BOOL v15;
  IPAChecksum *v17;
  SEL v18;
  id v19;
  objc_super v20;

  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    _PFAssertFailHandler();
    goto LABEL_14;
  }
  v20.receiver = self;
  v20.super_class = (Class)IPAChecksum;
  v5 = -[IPAChecksum init](&v20, sel_init);
  if (objc_msgSend(v4, "length") != 32)
  {
LABEL_14:
    v17 = (IPAChecksum *)_PFAssertFailHandler();
    return -[IPAChecksum initWithData:](v17, v18, v19);
  }
  objc_msgSend(v4, "uppercaseString");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = objc_msgSend(v6, "UTF8String");

  v8 = 0;
  v9 = 8;
  do
  {
    v10 = *(char *)(v7 + v8);
    if (v10 <= 64)
      v11 = 64;
    else
      v11 = 9;
    v12 = v11 + v10;
    v13 = *(char *)(v7 + v8 + 1);
    if (v13 <= 64)
      v14 = -48;
    else
      v14 = -55;
    *((_BYTE *)&v5->super.isa + v9++) = v14 + v13 + 16 * v12;
    v15 = v8 >= 0x1E;
    v8 += 2;
  }
  while (!v15);

  return v5;
}

- (IPAChecksum)initWithData:(id)a3
{
  id v4;
  IPAChecksum *v5;
  id v6;
  IPAChecksum *v8;
  SEL v9;
  id v10;
  objc_super v11;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11.receiver = self;
    v11.super_class = (Class)IPAChecksum;
    v5 = -[IPAChecksum init](&v11, sel_init);
    v6 = objc_retainAutorelease(v4);
    CC_MD5((const void *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), v5->_bytes.data);

    return v5;
  }
  else
  {
    v8 = (IPAChecksum *)_PFAssertFailHandler();
    return -[IPAChecksum initWithChecksumAsData:](v8, v9, v10);
  }
}

- (IPAChecksum)initWithChecksumAsData:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD *v7;
  IPAChecksum *v8;
  IPAChecksum *v10;
  SEL v11;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "length") == 16)
    {
      v6 = objc_retainAutorelease(v5);
      v7 = (_QWORD *)objc_msgSend(v6, "bytes");
      v8 = -[IPAChecksum initWithBytes:](self, "initWithBytes:", *v7, v7[1]);

      return v8;
    }
  }
  else
  {
    _PFAssertFailHandler();
  }
  v10 = (IPAChecksum *)_PFAssertFailHandler();
  return (IPAChecksum *)*(_OWORD *)&-[IPAChecksum checksumBytes](v10, v11);
}

- (IPAChecksumBytes)checksumBytes
{
  uint64_t v2;
  uint64_t v3;
  IPAChecksumBytes result;

  v2 = *(_QWORD *)&self->_bytes.data[8];
  v3 = *(_QWORD *)self->_bytes.data;
  *(_QWORD *)&result.data[8] = v2;
  *(_QWORD *)result.data = v3;
  return result;
}

- (id)string
{
  uint64_t v2;
  IPAChecksumBytes *p_bytes;
  unsigned int v4;
  char v5;
  _BYTE *v6;
  _BYTE v8[33];
  uint64_t v9;

  v2 = 0;
  v9 = *MEMORY[0x1E0C80C00];
  p_bytes = &self->_bytes;
  do
  {
    v4 = p_bytes->data[0];
    p_bytes = (IPAChecksumBytes *)((char *)p_bytes + 1);
    v5 = byte_1D4CCD150[v4 & 0xF];
    v6 = &v8[v2];
    *v6 = byte_1D4CCD150[(unint64_t)v4 >> 4];
    v6[1] = v5;
    v2 += 2;
  }
  while (v2 != 32);
  v8[32] = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v8, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  IPAChecksum *v9;
  SEL v10;
  IPAChecksumBytes v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = objc_msgSend(v4, "checksumBytes");
    v7 = -[IPAChecksum isEqualToBytes:](self, "isEqualToBytes:", v5, v6);

    return v7;
  }
  else
  {
    v9 = (IPAChecksum *)_PFAssertFailHandler();
    return -[IPAChecksum isEqualToBytes:](v9, v10, v11);
  }
}

- (BOOL)isEqualToBytes:(IPAChecksumBytes)a3
{
  return *(_QWORD *)self->_bytes.data == *(_QWORD *)a3.data
      && *(_QWORD *)&self->_bytes.data[8] == *(_QWORD *)&a3.data[8];
}

- (unint64_t)hash
{
  return *(_QWORD *)&self->_bytes.data[8] ^ *(_QWORD *)self->_bytes.data;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[IPAChecksum string](self, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p> %@"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
