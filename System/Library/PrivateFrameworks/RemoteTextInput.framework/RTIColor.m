@implementation RTIColor

+ (RTIColor)colorWithCGColor:(CGColor *)a3
{
  char *v4;
  CGColorSpace *DeviceRGB;
  CGColor *CopyByMatchingToColorSpace;
  const CGFloat *Components;
  size_t NumberOfComponents;

  v4 = (char *)objc_alloc_init((Class)a1);
  v4[8] = 1;
  *((_QWORD *)v4 + 6) = CGColorRetain(a3);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(DeviceRGB, kCGRenderingIntentDefault, a3, 0);
  Components = CGColorGetComponents(CopyByMatchingToColorSpace);
  NumberOfComponents = CGColorGetNumberOfComponents(CopyByMatchingToColorSpace);
  memcpy(v4 + 16, Components, 8 * NumberOfComponents);
  CGColorRelease(CopyByMatchingToColorSpace);
  return (RTIColor *)v4;
}

- (void)dealloc
{
  CGColor *cgColor;
  objc_super v4;

  cgColor = self->_cgColor;
  if (cgColor)
  {
    CFRelease(cgColor);
    self->_cgColor = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)RTIColor;
  -[RTIColor dealloc](&v4, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", self->_values, 32, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt32:forKey:", *((char *)self + 8), CFSTR("colorType"));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("colorValues"));

}

- (RTIColor)initWithCoder:(id)a3
{
  id v4;
  RTIColor *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The decoder must allow keyed coding."));
  v8.receiver = self;
  v8.super_class = (Class)RTIColor;
  v5 = -[RTIColor init](&v8, sel_init);
  if (v5)
  {
    *((_BYTE *)v5 + 8) = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("colorType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colorValues"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getBytes:length:", v5->_values, 32);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (RTIColor)colorWithWhite:(double)a3 alpha:(double)a4
{
  double *v6;

  v6 = (double *)objc_alloc_init((Class)a1);
  *((_BYTE *)v6 + 8) = 0;
  v6[2] = a3;
  v6[3] = a4;
  v6[4] = 0.0;
  v6[5] = 0.0;
  return (RTIColor *)v6;
}

+ (RTIColor)colorWithRed:(double)a3 green:(double)a4 blue:(double)a5 alpha:(double)a6
{
  double *v10;

  v10 = (double *)objc_alloc_init((Class)a1);
  *((_BYTE *)v10 + 8) = 1;
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = a5;
  v10[5] = a6;
  return (RTIColor *)v10;
}

- (CGColor)cgColor
{
  CGColor *result;

  result = self->_cgColor;
  if (!result)
  {
    if (*((_BYTE *)self + 8) == 1)
    {
      result = CGColorCreateSRGB(self->_values[0], self->_values[1], self->_values[2], self->_values[3]);
      goto LABEL_6;
    }
    if (!*((_BYTE *)self + 8))
    {
      result = CGColorCreateGenericGray(self->_values[0], self->_values[1]);
LABEL_6:
      self->_cgColor = result;
      return result;
    }
    return 0;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;

  result = -[RTIColor init](+[RTIColor allocWithZone:](RTIColor, "allocWithZone:", a3), "init");
  *((_BYTE *)result + 8) = *((_BYTE *)self + 8);
  v5 = *(_OWORD *)&self->_values[2];
  *((_OWORD *)result + 1) = *(_OWORD *)self->_values;
  *((_OWORD *)result + 2) = v5;
  return result;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t result;
  double *values;

  v3 = 0;
  result = *((char *)self + 8);
  values = self->_values;
  do
    result = (unint64_t)((double)(257 * result) + values[v3++] * 256.0);
  while (v3 != 4);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  RTIColor *v4;
  BOOL v8;

  v4 = (RTIColor *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    v8 = (objc_opt_isKindOfClass() & 1) != 0
      && *((unsigned __int8 *)self + 8) == *((unsigned __int8 *)v4 + 8)
      && *(_QWORD *)&v4->_values[0] == *(_QWORD *)&self->_values[0]
      && *(_QWORD *)&v4->_values[1] == *(_QWORD *)&self->_values[1]
      && *(_QWORD *)&v4->_values[2] == *(_QWORD *)&self->_values[2]
      && *(_QWORD *)&v4->_values[3] == *(_QWORD *)&self->_values[3];
  }

  return v8;
}

- (id)description
{
  void *v3;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p"), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("; color = %@"), -[RTIColor cgColor](self, "cgColor"));
  return v3;
}

@end
