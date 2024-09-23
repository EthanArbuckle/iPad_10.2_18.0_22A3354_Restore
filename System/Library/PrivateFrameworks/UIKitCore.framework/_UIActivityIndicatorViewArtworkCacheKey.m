@implementation _UIActivityIndicatorViewArtworkCacheKey

- (_UIActivityIndicatorViewArtworkCacheKey)initWithStyle:(int64_t)a3 width:(double)a4 spokeCount:(int64_t)a5 spokeFrameRatio:(int64_t)a6 shadowOffset:(CGSize)a7 color:(CGColor *)a8 shadowColor:(CGColor *)a9
{
  CGFloat height;
  CGFloat width;
  _UIActivityIndicatorViewArtworkCacheKey *v17;
  _UIActivityIndicatorViewArtworkCacheKey *v18;
  objc_super v20;

  height = a7.height;
  width = a7.width;
  v20.receiver = self;
  v20.super_class = (Class)_UIActivityIndicatorViewArtworkCacheKey;
  v17 = -[_UIActivityIndicatorViewArtworkCacheKey init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_style = a3;
    v17->_width = a4;
    v17->_spokeCount = a5;
    v17->_spokeFrameRatio = a6;
    v17->_shadowOffset.width = width;
    v17->_shadowOffset.height = height;
    CGColorRetain(a8);
    v18->_color = a8;
    CGColorRetain(a9);
    v18->_shadowColor = a9;
  }
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  _UIActivityIndicatorViewArtworkCacheKey *v4;
  BOOL v5;

  v4 = (_UIActivityIndicatorViewArtworkCacheKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[_UIActivityIndicatorViewArtworkCacheKey isEqualToCacheKey:](self, "isEqualToCacheKey:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  CGColorRef *v4;
  CGColorRef *v5;
  BOOL v6;
  BOOL v7;

  v4 = (CGColorRef *)a3;
  v5 = v4;
  v7 = v4
    && (CGColorRef)self->_style == v4[1]
    && self->_width == *((double *)v4 + 2)
    && (CGColorRef)self->_spokeCount == v4[3]
    && (CGColorRef)self->_spokeFrameRatio == v4[4]
    && (self->_shadowOffset.width == *((double *)v4 + 5)
      ? (v6 = self->_shadowOffset.height == *((double *)v4 + 6))
      : (v6 = 0),
        v6 && CGColorEqualToColor(self->_color, v4[7]))
    && CGColorEqualToColor(self->_shadowColor, v5[8]);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_color);
  CGColorRelease(self->_shadowColor);
  v3.receiver = self;
  v3.super_class = (Class)_UIActivityIndicatorViewArtworkCacheKey;
  -[_UIActivityIndicatorViewArtworkCacheKey dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  int64_t style;
  double width;
  int64_t spokeCount;
  int64_t spokeFrameRatio;
  double v7;
  double height;
  CGColor *color;
  CFHashCode v10;
  CFHashCode shadowColor;

  style = self->_style;
  width = self->_width;
  spokeCount = self->_spokeCount;
  spokeFrameRatio = self->_spokeFrameRatio;
  v7 = self->_shadowOffset.width;
  height = self->_shadowOffset.height;
  color = self->_color;
  if (color)
    v10 = CFHash(color);
  else
    v10 = 0;
  shadowColor = (CFHashCode)self->_shadowColor;
  if (shadowColor)
    shadowColor = CFHash((CFTypeRef)shadowColor);
  return style ^ spokeCount ^ spokeFrameRatio ^ (unint64_t)width ^ (unint64_t)v7 ^ (unint64_t)height ^ v10 ^ shadowColor;
}

@end
