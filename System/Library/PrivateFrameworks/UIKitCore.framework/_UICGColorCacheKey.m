@implementation _UICGColorCacheKey

- (_UICGColorCacheKey)initWithColors:(CGColor *)a3
{
  _UICGColorCacheKey *v4;
  _UICGColorCacheKey *v5;
  CGColor **v6;
  CGColor **v8;
  objc_super v9;
  uint64_t v10;

  v9.receiver = self;
  v9.super_class = (Class)_UICGColorCacheKey;
  v4 = -[_UICGColorCacheKey init](&v9, sel_init);
  v5 = v4;
  if (a3 && v4)
  {
    v4->_colors = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
    v8 = (CGColor **)&v10;
    do
    {
      CFArrayAppendValue(v5->_colors, a3);
      v6 = v8++;
      a3 = *v6;
    }
    while (*v6);
  }
  return v5;
}

- (void)dealloc
{
  __CFArray *colors;
  objc_super v4;

  colors = self->_colors;
  if (colors)
    CFRelease(colors);
  v4.receiver = self;
  v4.super_class = (Class)_UICGColorCacheKey;
  -[_UICGColorCacheKey dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  __CFArray *colors;
  unint64_t v4;
  CFIndex v5;
  CFHashCode ValueAtIndex;

  colors = self->_colors;
  if (!colors || CFArrayGetCount(colors) < 1)
    return 0;
  v4 = 0;
  v5 = 0;
  do
  {
    ValueAtIndex = (CFHashCode)CFArrayGetValueAtIndex(self->_colors, v5);
    if (ValueAtIndex)
      ValueAtIndex = CFHash((CFTypeRef)ValueAtIndex);
    v4 ^= ValueAtIndex;
    ++v5;
  }
  while (v5 < CFArrayGetCount(self->_colors));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  _UICGColorCacheKey *v4;
  BOOL v5;

  v4 = (_UICGColorCacheKey *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[_UICGColorCacheKey isEqualToCacheKey:](self, "isEqualToCacheKey:", v4);
  }

  return v5;
}

- (BOOL)isEqualToCacheKey:(id)a3
{
  CFArrayRef *v4;
  __CFArray *colors;
  CFIndex Count;
  const __CFArray *v7;
  CGColor *ValueAtIndex;
  CGColor *v9;
  CFIndex v10;
  CFIndex v11;
  CGColor *v12;
  CGColor *v13;
  BOOL v14;
  BOOL v15;

  v4 = (CFArrayRef *)a3;
  colors = self->_colors;
  if (colors)
  {
    Count = CFArrayGetCount(colors);
    v7 = v4[1];
    if (!v7 || Count != CFArrayGetCount(v7))
      goto LABEL_10;
    if (Count < 1)
    {
      v15 = 1;
      goto LABEL_12;
    }
    ValueAtIndex = (CGColor *)CFArrayGetValueAtIndex(self->_colors, 0);
    v9 = (CGColor *)CFArrayGetValueAtIndex(v4[1], 0);
    if (CGColorEqualToColor(ValueAtIndex, v9))
    {
      v10 = 1;
      do
      {
        v11 = v10;
        if (Count == v10)
          break;
        v12 = (CGColor *)CFArrayGetValueAtIndex(self->_colors, v10);
        v13 = (CGColor *)CFArrayGetValueAtIndex(v4[1], v11);
        v14 = CGColorEqualToColor(v12, v13);
        v10 = v11 + 1;
      }
      while (v14);
      v15 = v11 >= Count;
    }
    else
    {
LABEL_10:
      v15 = 0;
    }
  }
  else
  {
    v15 = v4[1] == 0;
  }
LABEL_12:

  return v15;
}

@end
