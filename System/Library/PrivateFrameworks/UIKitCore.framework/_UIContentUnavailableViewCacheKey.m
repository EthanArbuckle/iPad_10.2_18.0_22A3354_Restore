@implementation _UIContentUnavailableViewCacheKey

- (_UIContentUnavailableViewCacheKey)initWithStyle:(unint64_t)a3 color:(CGColor *)a4
{
  _UIContentUnavailableViewCacheKey *v6;
  _UIContentUnavailableViewCacheKey *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIContentUnavailableViewCacheKey;
  v6 = -[_UIContentUnavailableViewCacheKey init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_style = a3;
    CGColorRetain(a4);
    v7->_color = a4;
  }
  return v7;
}

- (unint64_t)hash
{
  CFHashCode color;
  unint64_t style;

  style = self->_style;
  color = (CFHashCode)self->_color;
  if (color)
    color = CFHash((CFTypeRef)color);
  return color ^ style;
}

- (BOOL)isEqual:(id)a3
{
  _UIContentUnavailableViewCacheKey *v4;
  BOOL v5;

  v4 = (_UIContentUnavailableViewCacheKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[_UIContentUnavailableViewCacheKey isEqualToCacheKey:](self, "isEqualToCacheKey:", v4);
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
  v6 = v4 && (CGColorRef)self->_style == v4[1] && CGColorEqualToColor(self->_color, v4[2]);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)_UIContentUnavailableViewCacheKey;
  -[_UIContentUnavailableViewCacheKey dealloc](&v3, sel_dealloc);
}

@end
