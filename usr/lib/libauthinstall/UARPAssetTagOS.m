@implementation UARPAssetTagOS

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPAssetTagOS)init
{
  -[UARPAssetTagOS doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPAssetTagOS)initWithChar1:(char)a3 char2:(char)a4 char3:(char)a5 char4:(char)a6
{
  UARPAssetTagOS *v10;
  UARPAssetTagOS *v11;
  unsigned int v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)UARPAssetTagOS;
  v10 = -[UARPAssetTagOS init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_char1 = a3;
    v10->_char2 = a4;
    v10->_char3 = a5;
    v10->_char4 = a6;
    LOBYTE(v13) = a3;
    BYTE1(v13) = a4;
    BYTE2(v13) = a5;
    HIBYTE(v13) = a6;
    v10->_tag = uarpPayloadTagPack(&v13);
  }
  return v11;
}

- (UARPAssetTagOS)initWithString:(id)a3
{
  id v4;
  char *v5;
  UARPAssetTagOS *v6;

  v4 = a3;
  if (objc_msgSend(v4, "length") == 4)
  {
    v5 = (char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    self = -[UARPAssetTagOS initWithChar1:char2:char3:char4:](self, "initWithChar1:char2:char3:char4:", *v5, v5[1], v5[2], v5[3]);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%c%c%c%c"), self->_char1, self->_char2, self->_char3, self->_char4);
}

- (const)decodeCharForKey:(id)a3 key:(id)a4
{
  const char *result;
  uint64_t v5;

  v5 = 0;
  result = (const char *)objc_msgSend(objc_retainAutorelease(a3), "decodeBytesForKey:returnedLength:", a4, &v5);
  if (!v5)
    return 0;
  return result;
}

- (UARPAssetTagOS)initWithCoder:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;

  v4 = a3;
  v5 = -[UARPAssetTagOS decodeCharForKey:key:](self, "decodeCharForKey:key:", v4, CFSTR("char1"));
  if (v5)
  {
    v6 = -[UARPAssetTagOS decodeCharForKey:key:](self, "decodeCharForKey:key:", v4, CFSTR("char2"));
    if (v6
      && (v7 = v6,
          (v8 = -[UARPAssetTagOS decodeCharForKey:key:](self, "decodeCharForKey:key:", v4, CFSTR("char3"))) != 0)
      && (v9 = v8,
          (v10 = -[UARPAssetTagOS decodeCharForKey:key:](self, "decodeCharForKey:key:", v4, CFSTR("char4"))) != 0))
    {
      self = -[UARPAssetTagOS initWithChar1:char2:char3:char4:](self, "initWithChar1:char2:char3:char4:", *v5, *v7, *v9, *v10);
      v5 = (const char *)self;
    }
    else
    {
      v5 = 0;
    }
  }

  return (UARPAssetTagOS *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  char *p_char1;
  id v5;

  p_char1 = &self->_char1;
  v5 = a3;
  objc_msgSend(v5, "encodeBytes:length:forKey:", p_char1, 1, CFSTR("char1"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_char2, 1, CFSTR("char2"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_char3, 1, CFSTR("char3"));
  objc_msgSend(v5, "encodeBytes:length:forKey:", &self->_char4, 1, CFSTR("char4"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[UARPAssetTagOS initWithChar1:char2:char3:char4:]([UARPAssetTagOS alloc], "initWithChar1:char2:char3:char4:", self->_char1, self->_char2, self->_char3, self->_char4);
}

- (unint64_t)hash
{
  return self->_tag;
}

- (BOOL)isEqual:(id)a3
{
  UARPAssetTagOS *v4;
  UARPAssetTagOS *v5;
  int char1;
  int char2;
  int char3;
  int char4;
  BOOL v10;

  v4 = (UARPAssetTagOS *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (self == v4)
    {
      v10 = 1;
    }
    else
    {
      v5 = v4;
      char1 = self->_char1;
      if (char1 == -[UARPAssetTagOS char1](v5, "char1")
        && (char2 = self->_char2, char2 == -[UARPAssetTagOS char2](v5, "char2"))
        && (char3 = self->_char3, char3 == -[UARPAssetTagOS char3](v5, "char3")))
      {
        char4 = self->_char4;
        v10 = char4 == -[UARPAssetTagOS char4](v5, "char4");
      }
      else
      {
        v10 = 0;
      }

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (char)char1
{
  return self->_char1;
}

- (char)char2
{
  return self->_char2;
}

- (char)char3
{
  return self->_char3;
}

- (char)char4
{
  return self->_char4;
}

- (unsigned)tag
{
  return self->_tag;
}

@end
