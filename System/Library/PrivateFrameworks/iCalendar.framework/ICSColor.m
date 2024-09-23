@implementation ICSColor

- (ICSColor)initWithRed:(unsigned __int8)a3 green:(unsigned __int8)a4 blue:(unsigned __int8)a5
{
  ICSColor *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICSColor;
  result = -[ICSColor init](&v9, sel_init);
  if (result)
  {
    result->_red = a3;
    result->_green = a4;
    result->_blue = a5;
  }
  return result;
}

- (unsigned)red
{
  return self->_red;
}

- (unsigned)green
{
  return self->_green;
}

- (unsigned)blue
{
  return self->_blue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t red;
  id v5;

  red = self->_red;
  v5 = a3;
  objc_msgSend(v5, "encodeInt:forKey:", red, CFSTR("Red"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_green, CFSTR("Green"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_blue, CFSTR("Blue"));

}

- (ICSColor)initWithCoder:(id)a3
{
  id v4;
  ICSColor *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ICSColor;
  v5 = -[ICSColor init](&v7, sel_init);
  if (v5)
  {
    v5->_red = objc_msgSend(v4, "decodeIntForKey:", CFSTR("Red"));
    v5->_green = objc_msgSend(v4, "decodeIntForKey:", CFSTR("Green"));
    v5->_blue = objc_msgSend(v4, "decodeIntForKey:", CFSTR("Blue"));
  }

  return v5;
}

+ (id)symbolicColorForLegacyRGB:(id)a3
{
  return (id)symbolicColorForLegacyRGB((CFStringRef)a3);
}

+ (BOOL)colorDetailsAreEffectivelyDifferentFirstColor:(id)a3 secondColor:(id)a4 firstSymbolicName:(id)a5 secondSymbolicName:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  id v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = v12;
  if (v11)
  {
    v14 = objc_msgSend(v11, "isEqualToString:", CFSTR("custom")) ^ 1;
    if (v13)
    {
LABEL_3:
      v15 = objc_msgSend(v13, "isEqualToString:", CFSTR("custom")) ^ 1;
      goto LABEL_6;
    }
  }
  else
  {
    v14 = 0;
    if (v12)
      goto LABEL_3;
  }
  v15 = 0;
LABEL_6:
  if (((v14 | v15) & 1) != 0)
  {
    if (v11 != v13)
    {
      LOBYTE(v16) = 1;
      if (v11 && v13)
      {
        v17 = v11;
        v18 = v13;
LABEL_15:
        v16 = objc_msgSend(v17, "isEqualToString:", v18) ^ 1;
        goto LABEL_17;
      }
      goto LABEL_17;
    }
LABEL_16:
    LOBYTE(v16) = 0;
    goto LABEL_17;
  }
  if (v9 == v10)
    goto LABEL_16;
  LOBYTE(v16) = 1;
  if (v9 && v10)
  {
    v17 = v9;
    v18 = v10;
    goto LABEL_15;
  }
LABEL_17:

  return v16;
}

@end
