@implementation SPContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPContext)initWithCoder:(id)a3
{
  id v4;
  SPContext *v5;
  SPContext *v6;

  v4 = a3;
  v5 = -[SPContext init](self, "init");
  if (v5)
  {
    if (NSDecodeSInt64RangedIfPresent())
      v5->_locationCategory = 0;
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  if (self->_locationCategory)
    objc_msgSend(a3, "encodeInteger:forKey:", self->_locationCategory, CFSTR("loCt"));
}

- (id)description
{
  return -[SPContext descriptionWithLevel:](self, "descriptionWithLevel:", 50);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v10;

  v4 = a3;
  NSAppendPrintF_safe();
  v5 = 0;
  v6 = v5;
  if (self->_locationCategory)
  {
    v10 = v5;
    NSAppendPrintF_safe();
    v7 = v10;

    v6 = v7;
  }
  if (v4 < 0x15)
  {
    NSAppendPrintF_safe();
    v8 = v6;

    v6 = v8;
  }
  return v6;
}

- (unsigned)locationCategory
{
  return self->_locationCategory;
}

- (void)setLocationCategory:(unsigned __int8)a3
{
  self->_locationCategory = a3;
}

- (unsigned)noiseLevel
{
  return self->_noiseLevel;
}

@end
