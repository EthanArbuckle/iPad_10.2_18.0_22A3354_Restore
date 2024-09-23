@implementation _UIModernSwitchVisualElementCacheKey

- (unint64_t)hash
{
  CFHashCode color;
  unint64_t mask;

  mask = self->_mask;
  color = (CFHashCode)self->_color;
  if (color)
    color = CFHash((CFTypeRef)color);
  return color ^ mask;
}

- (BOOL)isEqual:(id)a3
{
  _UIModernSwitchVisualElementCacheKey *v4;
  BOOL v5;

  v4 = (_UIModernSwitchVisualElementCacheKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[_UIModernSwitchVisualElementCacheKey isEqualToCacheKey:](self, "isEqualToCacheKey:", v4);
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
  v6 = v4 && (CGColorRef)self->_mask == v4[1] && CGColorEqualToColor(self->_color, v4[2]);

  return v6;
}

- (_UIModernSwitchVisualElementCacheKey)initWithMask:(unint64_t)a3 color:(CGColor *)a4
{
  _UIModernSwitchVisualElementCacheKey *v6;
  _UIModernSwitchVisualElementCacheKey *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIModernSwitchVisualElementCacheKey;
  v6 = -[_UIModernSwitchVisualElementCacheKey init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_mask = a3;
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
  v3.super_class = (Class)_UIModernSwitchVisualElementCacheKey;
  -[_UIModernSwitchVisualElementCacheKey dealloc](&v3, sel_dealloc);
}

@end
