@implementation asn1IntegerToken

- (id)_initWithID:(unint64_t)a3 class:(unsigned __int8)a4 length:(unint64_t)a5 content:(const char *)a6 opaque:(BOOL)a7
{
  int v9;
  id result;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  objc_super v16;

  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)asn1IntegerToken;
  result = -[asn1IntegerToken init](&v16, sel_init, a3, a4, a5, a6, a7);
  if (a3 != 2 || v9)
  {
    v15 = result;
    return 0;
  }
  else if (result)
  {
    *((_BYTE *)result + 8) = 0;
    *((_QWORD *)result + 2) = 2;
    *((_QWORD *)result + 3) = a5;
    *((_QWORD *)result + 4) = a6;
    v12 = 8;
    if (a5 < 8)
      v12 = a5;
    *((_QWORD *)result + 5) = 0;
    if (v12)
    {
      v13 = 0;
      for (i = 0; i != v12; ++i)
      {
        if (i)
        {
          v13 <<= 8;
          *((_QWORD *)result + 5) = v13;
        }
        v13 |= a6[i];
        *((_QWORD *)result + 5) = v13;
      }
    }
  }
  return result;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INT Token. Value:%lld (%llx)"), self->mValue, self->mValue);
}

- (unint64_t)value
{
  return self->mValue;
}

@end
