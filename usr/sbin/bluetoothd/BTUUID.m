@implementation BTUUID

- (BTUUID)initWithBytes:(const void *)a3 length:(unint64_t)a4
{
  BTUUID *v6;
  void *v7;
  BTUUID *v8;
  objc_super v10;

  if (a4 == 16 || a4 == 2)
  {
    v10.receiver = self;
    v10.super_class = (Class)BTUUID;
    v6 = -[BTUUID init](&v10, "init");
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", a3, a4));
      -[BTUUID setData:](v6, "setData:", v7);

    }
    self = v6;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  BTUUID *v4;
  void *v5;

  v4 = -[BTUUID init](+[BTUUID allocWithZone:](BTUUID, "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  -[BTUUID setData:](v4, "setData:", v5);

  return v4;
}

+ (id)UUIDWithLittleEndianBytes:(const char *)a3 length:(unint64_t)a4
{
  char *v7;
  char *v8;
  unint64_t v9;
  uint64_t v11;

  v7 = (char *)&v11 - ((a4 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v7, a4);
  if (a4)
  {
    v8 = v7;
    v9 = a4;
    do
      *v8++ = a3[--v9];
    while (v9);
  }
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "UUIDWithBytes:length:", v7, a4));
}

+ (id)UUIDWithData:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_retainAutorelease(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "UUIDWithBytes:length:", objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length")));

  return v5;
}

+ (id)UUIDWithBytes:(const char *)a3 length:(unint64_t)a4
{
  id v4;

  if (a3)
  {
    if (a4 == 16 || a4 == 2)
      v4 = objc_msgSend(objc_alloc((Class)a1), "initWithBytes:length:", a3, a4);
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)UUID16:(unsigned __int16)a3
{
  __int16 v4;

  v4 = __rev16(a3);
  return objc_msgSend(objc_alloc((Class)a1), "initWithBytes:length:", &v4, 2);
}

+ (id)UUID128:(const char *)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithBytes:length:", a3, 16);
}

+ (id)UUID128WithString:(id)a3
{
  id v4;
  void *v5;
  uuid_t uu;

  memset(uu, 0, sizeof(uu));
  v4 = objc_retainAutorelease(a3);
  if (uuid_parse((const char *)objc_msgSend(v4, "UTF8String"), uu))
    v5 = 0;
  else
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "UUID128:", uu));

  return v5;
}

+ (id)randomUUID
{
  uuid_t out;

  memset(out, 0, sizeof(out));
  uuid_generate(out);
  return (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "UUID128:", out));
}

- (id)UUID128
{
  void *v3;
  id v4;
  id v6;
  char *v7;
  __int16 v8;
  char v9;
  char v10;
  unint64_t v11;
  int v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  v4 = objc_msgSend(v3, "length");

  if (v4 == (id)16)
    return self;
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data")));
  v7 = (char *)objc_msgSend(v6, "bytes");

  v8 = 0;
  v9 = v7[1];
  v10 = *v7;
  v11 = 0x8000008000100000;
  v12 = -80438433;
  return (id)objc_claimAutoreleasedReturnValue(+[BTUUID UUID128:](BTUUID, "UUID128:", &v8));
}

- (NSData)swappedData
{
  void *v3;
  char *v4;
  void *v5;
  id v6;
  _BYTE *v7;
  id v8;
  _BYTE *i;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  v4 = (char *)objc_msgSend(v3, "length");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", v4));
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data")));
  v7 = objc_msgSend(v6, "bytes");

  v8 = objc_retainAutorelease(v5);
  for (i = objc_msgSend(v8, "mutableBytes"); v4; --v4)
    *i++ = v4[(_QWORD)(v7 - 1)];
  return (NSData *)v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("uuidBytes"));

}

- (BTUUID)initWithCoder:(id)a3
{
  id v4;
  BTUUID *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BTUUID;
  v5 = -[BTUUID init](&v8, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectForKey:", CFSTR("uuidBytes")));
    -[BTUUID setData:](v5, "setData:", v6);

  }
  return v5;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;

  v4 = a3;
  v5 = objc_opt_class(BTUUID);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
    v7 = objc_msgSend(v6, "length");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
    v9 = objc_msgSend(v8, "length");

    if (v7 == v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "data"));
      v12 = objc_msgSend(v10, "isEqualToData:", v11);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID UUID128](self, "UUID128"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "UUID128"));
      v12 = objc_msgSend(v10, "isEqual:", v11);
    }
    v13 = v12;

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)isEqualToUUID16:(unsigned __int16)a3
{
  int v3;
  void *v5;
  id v6;
  id v7;
  unsigned int v8;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  v6 = objc_msgSend(v5, "length");

  if (v6 != (id)2)
    return 0;
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data")));
  v8 = bswap32(*(unsigned __int16 *)objc_msgSend(v7, "bytes"));

  return v3 == HIWORD(v8);
}

- (id)description
{
  id v3;
  const unsigned __int8 *v4;
  void *v5;
  id v6;
  __CFString *v7;
  void *v8;
  id v9;
  char out[40];

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data")));
  v4 = (const unsigned __int8 *)objc_msgSend(v3, "bytes");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
  v6 = objc_msgSend(v5, "length");

  if (v6 == (id)2)
  {
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("0x%04X"), bswap32(*(unsigned __int16 *)v4) >> 16));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTUUID data](self, "data"));
    v9 = objc_msgSend(v8, "length");

    if (v9 == (id)16)
    {
      memset(out, 0, 37);
      uuid_unparse_upper(v4, out);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", out));
    }
    else
    {
      v7 = CFSTR("<>");
    }
  }
  return v7;
}

- (NSData)data
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void)setData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->data, 0);
}

@end
