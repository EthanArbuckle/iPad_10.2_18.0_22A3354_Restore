@implementation _UISearchBarBackgroundCacheKey

- (_UISearchBarBackgroundCacheKey)initWithBarPosition:(int64_t)a3 usesContiguousBarBackground:(BOOL)a4 scale:(double)a5 alpha:(double)a6 height:(double)a7 statusBarHeight:(double)a8 backgroundColor:(CGColor *)a9 strokeColor:(CGColor *)a10
{
  _UISearchBarBackgroundCacheKey *v18;
  _UISearchBarBackgroundCacheKey *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)_UISearchBarBackgroundCacheKey;
  v18 = -[_UISearchBarBackgroundCacheKey init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_barPosition = a3;
    v18->_usesContiguousBarBackground = a4;
    v18->_scale = a5;
    v18->_alpha = a6;
    v18->_height = a7;
    v18->_statusBarHeight = a8;
    CGColorRetain(a9);
    v19->_backgroundColor = a9;
    CGColorRetain(a10);
    v19->_strokeColor = a10;
  }
  return v19;
}

- (unint64_t)hash
{
  int64_t barPosition;
  _BOOL8 usesContiguousBarBackground;
  double alpha;
  double scale;
  double statusBarHeight;
  double height;
  CGColor *backgroundColor;
  CFHashCode v10;
  CFHashCode strokeColor;

  barPosition = self->_barPosition;
  usesContiguousBarBackground = self->_usesContiguousBarBackground;
  scale = self->_scale;
  alpha = self->_alpha;
  height = self->_height;
  statusBarHeight = self->_statusBarHeight;
  backgroundColor = self->_backgroundColor;
  if (backgroundColor)
    v10 = CFHash(backgroundColor);
  else
    v10 = 0;
  strokeColor = (CFHashCode)self->_strokeColor;
  if (strokeColor)
    strokeColor = CFHash((CFTypeRef)strokeColor);
  return barPosition ^ usesContiguousBarBackground ^ (unint64_t)scale ^ (unint64_t)height ^ (unint64_t)statusBarHeight ^ v10 ^ strokeColor ^ (unint64_t)(alpha * 100.0);
}

- (BOOL)isEqual:(id)a3
{
  _UISearchBarBackgroundCacheKey *v4;
  BOOL v5;

  v4 = (_UISearchBarBackgroundCacheKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[_UISearchBarBackgroundCacheKey isEqualToCacheKey:](self, "isEqualToCacheKey:", v4);
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
  v6 = v4
    && (CGColorRef)self->_barPosition == v4[1]
    && self->_usesContiguousBarBackground == *((unsigned __int8 *)v4 + 16)
    && self->_scale == *((double *)v4 + 3)
    && self->_alpha == *((double *)v4 + 4)
    && self->_height == *((double *)v4 + 5)
    && self->_statusBarHeight == *((double *)v4 + 6)
    && CGColorEqualToColor(self->_backgroundColor, v4[7])
    && CGColorEqualToColor(self->_strokeColor, v5[8]);

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_backgroundColor);
  CGColorRelease(self->_strokeColor);
  v3.receiver = self;
  v3.super_class = (Class)_UISearchBarBackgroundCacheKey;
  -[_UISearchBarBackgroundCacheKey dealloc](&v3, sel_dealloc);
}

@end
