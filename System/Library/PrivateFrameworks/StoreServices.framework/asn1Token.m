@implementation asn1Token

- (id)_initWithID:(unint64_t)a3 class:(unsigned __int8)a4 length:(unint64_t)a5 content:(const char *)a6 opaque:(BOOL)a7
{
  id result;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)asn1Token;
  result = -[asn1Token init](&v12, sel_init, a3, a4, a5, a6, a7);
  if (result)
  {
    *((_BYTE *)result + 8) = a4;
    *((_QWORD *)result + 2) = a3;
    *((_QWORD *)result + 3) = a5;
    *((_QWORD *)result + 4) = a6;
  }
  return result;
}

+ (id)readTokenFromBuffer:(const char *)a3 opaque:(BOOL)a4
{
  _BOOL8 v4;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __objc2_class **v15;

  v4 = a4;
  v6 = *(unsigned __int8 *)a3;
  v7 = v6 & 0x1F;
  if ((v6 & 0x1F) == 0x1F)
  {
    NSLog(CFSTR("multibyte ASN1 identifiers are  not supported."), a2);
    v8 = 0;
    v7 = 0xFFFFLL;
  }
  else
  {
    v8 = 1;
  }
  v9 = &a3[v8];
  v10 = *(unsigned __int8 *)v9;
  if (*v9 < 0)
  {
    v12 = v10 & 0x7F;
    if ((v10 & 0x7F) != 0)
    {
      v13 = 0;
      v10 = 0;
      do
      {
        v14 = v10 << 8;
        if (!v13)
          v14 = v10;
        v10 = v14 | v9[++v13];
      }
      while (v12 != v13);
    }
    else
    {
      v10 = 0;
    }
    v11 = (v12 + 1);
  }
  else
  {
    v11 = 1;
  }
  if (v6 > 0x3F)
    goto LABEL_22;
  if ((int)v7 > 15)
  {
    if ((_DWORD)v7 == 17)
    {
      v15 = off_1E47B70B0;
      return (id)objc_msgSend(objc_alloc(*v15), "_initWithID:class:length:content:opaque:", v7, v6 >> 6, v10, &v9[v11], v4);
    }
    if ((_DWORD)v7 == 16)
    {
      v15 = off_1E47B70A8;
      v7 = 16;
      return (id)objc_msgSend(objc_alloc(*v15), "_initWithID:class:length:content:opaque:", v7, v6 >> 6, v10, &v9[v11], v4);
    }
LABEL_22:
    v15 = &off_1E47B70B8;
    return (id)objc_msgSend(objc_alloc(*v15), "_initWithID:class:length:content:opaque:", v7, v6 >> 6, v10, &v9[v11], v4);
  }
  if ((_DWORD)v7 == 2)
  {
    v15 = off_1E47B7098;
    v7 = 2;
    return (id)objc_msgSend(objc_alloc(*v15), "_initWithID:class:length:content:opaque:", v7, v6 >> 6, v10, &v9[v11], v4);
  }
  if ((_DWORD)v7 != 4)
    goto LABEL_22;
  v15 = off_1E47B70A0;
  v7 = 4;
  return (id)objc_msgSend(objc_alloc(*v15), "_initWithID:class:length:content:opaque:", v7, v6 >> 6, v10, &v9[v11], v4);
}

+ (id)readTokenFromBuffer:(const char *)a3
{
  return +[asn1Token readTokenFromBuffer:opaque:](asn1Token, "readTokenFromBuffer:opaque:", a3, 0);
}

+ (id)readOpaqueTokenFromBuffer:(const char *)a3
{
  return +[asn1Token readTokenFromBuffer:opaque:](asn1Token, "readTokenFromBuffer:opaque:", a3, 1);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Token of class:%d ID:%ld length:%ld data:%@"), self->mClass, self->mIdentifier, self->mLength, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->mContent, self->mLength), "description"));
}

- (unsigned)tokenClass
{
  return self->mClass;
}

- (unint64_t)identifier
{
  return self->mIdentifier;
}

- (unint64_t)length
{
  return self->mLength;
}

- (const)content
{
  return self->mContent;
}

@end
