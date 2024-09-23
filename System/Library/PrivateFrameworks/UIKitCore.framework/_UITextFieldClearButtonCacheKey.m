@implementation _UITextFieldClearButtonCacheKey

- (_UITextFieldClearButtonCacheKey)initWithVariant:(int)a3 color:(CGColor *)a4
{
  _UITextFieldClearButtonCacheKey *v6;
  _UITextFieldClearButtonCacheKey *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UITextFieldClearButtonCacheKey;
  v6 = -[_UITextFieldClearButtonCacheKey init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_variant = a3;
    CGColorRetain(a4);
    v7->_color = a4;
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)_UITextFieldClearButtonCacheKey;
  -[_UITextFieldClearButtonCacheKey dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  uint64_t variant;
  CFHashCode color;

  variant = self->_variant;
  color = (CFHashCode)self->_color;
  if (color)
    color = CFHash((CFTypeRef)color);
  return color ^ variant;
}

- (BOOL)isEqual:(id)a3
{
  _UITextFieldClearButtonCacheKey *v4;
  BOOL v5;

  v4 = (_UITextFieldClearButtonCacheKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[_UITextFieldClearButtonCacheKey isEqualToCacheKey:](self, "isEqualToCacheKey:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  CGColorRef *v4;
  CGColorRef *v5;
  BOOL v6;

  v4 = (CGColorRef *)a3;
  v5 = v4;
  v6 = v4 && self->_variant == *((_DWORD *)v4 + 2) && CGColorEqualToColor(self->_color, v4[2]);

  return v6;
}

@end
