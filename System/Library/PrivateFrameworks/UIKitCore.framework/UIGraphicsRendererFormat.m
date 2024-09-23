@implementation UIGraphicsRendererFormat

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[UIGraphicsRendererFormat bounds](self, "bounds");
  v4[1] = v5;
  v4[2] = v6;
  v4[3] = v7;
  v4[4] = v8;
  return v4;
}

- (CGRect)bounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bounds.origin.x;
  y = self->_bounds.origin.y;
  width = self->_bounds.size.width;
  height = self->_bounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

+ (UIGraphicsRendererFormat)defaultFormat
{
  char *v2;
  __int128 v3;

  v2 = (char *)objc_alloc_init((Class)a1);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *(_OWORD *)(v2 + 8) = *MEMORY[0x1E0C9D648];
  *(_OWORD *)(v2 + 24) = v3;
  return (UIGraphicsRendererFormat *)v2;
}

+ (UIGraphicsRendererFormat)preferredFormat
{
  char *v2;
  __int128 v3;

  v2 = (char *)objc_alloc_init((Class)a1);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *(_OWORD *)(v2 + 8) = *MEMORY[0x1E0C9D648];
  *(_OWORD *)(v2 + 24) = v3;
  return (UIGraphicsRendererFormat *)v2;
}

@end
