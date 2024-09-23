@implementation _NSCoreTypesetterLayoutCache

- (uint64_t)getCount:(_QWORD *)a3 glyphs:(_QWORD *)a4 advances:(_QWORD *)a5 elasticAdvances:(CFTypeRef *)a6 resolvedFont:(_QWORD *)a7 textAlignment:
{
  uint64_t v7;
  uint64_t v8;
  CFTypeRef v11;

  if (result)
  {
    v7 = result;
    v8 = *(_QWORD *)(result + 16);
    if (v8)
    {
      *a2 = *(_QWORD *)(result + 8);
      *a3 = v8;
      *a4 = *(_QWORD *)(result + 24);
      *a5 = *(_QWORD *)(result + 32);
      v11 = CFRetain(*(CFTypeRef *)(result + 40));
      *a6 = CFAutorelease(v11);
      *a7 = *(_QWORD *)(v7 + 48);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setCount:(const void *)a3 glyphs:(const void *)a4 advances:(const void *)a5 elasticAdvances:(void *)a6 resolvedFont:(double)a7 textAlignment:
{
  size_t v12;
  void **v13;
  void *v14;
  void *v15;
  const void *v16;

  if (result)
  {
    v12 = a2;
    v13 = result;
    result[1] = (void *)a2;
    free(result[2]);
    v14 = malloc_type_malloc(2 * v12, 0x1000040BDFB0063uLL);
    v13[2] = v14;
    memcpy(v14, a3, 2 * v12);
    free(v13[3]);
    v12 *= 16;
    v15 = malloc_type_malloc(v12, 0x1000040451B5BE8uLL);
    v13[3] = v15;
    memcpy(v15, a4, v12);
    *((double *)v13 + 4) = a7;
    v16 = v13[5];
    if (v16)
      CFRelease(v16);
    result = (void **)CFRetain(a5);
    v13[5] = result;
    v13[6] = a6;
  }
  return result;
}

- (void)setCTLine:(void *)a3 attachmentLayoutContext:(char)a4 validForDrawing:
{
  CFTypeRef v8;
  void *v9;

  if (a1)
  {
    v8 = *(CFTypeRef *)(a1 + 56);
    if (v8 != cf)
    {
      if (v8)
      {
        CFRelease(v8);
        *(_QWORD *)(a1 + 56) = 0;
      }
      if (cf)
        *(_QWORD *)(a1 + 56) = CFRetain(cf);
    }
    v9 = *(void **)(a1 + 64);
    if (v9 != a3)
    {

      *(_QWORD *)(a1 + 64) = a3;
    }
    *(_BYTE *)(a1 + 72) = a4;
  }
}

- (BOOL)getCTLine:(_QWORD *)a3 attachmentLayoutContext:(_BYTE *)a4 lineValidForDrawing:
{
  CFTypeRef v5;
  _BOOL8 v6;
  CFTypeRef v7;

  if (!a1)
    return 0;
  if (a4)
    *a4 = *(_BYTE *)(a1 + 72);
  if (a3)
    *a3 = *(_QWORD *)(a1 + 64);
  if (!a2)
    return 0;
  v5 = *(CFTypeRef *)(a1 + 56);
  v6 = v5 != 0;
  if (v5)
  {
    v7 = CFRetain(v5);
    v5 = CFAutorelease(v7);
  }
  *a2 = v5;
  return v6;
}

- (void)dealloc
{
  __CTFont *resolvedFont;
  __CTLine *line;
  objc_super v5;

  free(self->_glyphs);
  free(self->_advances);
  resolvedFont = self->_resolvedFont;
  if (resolvedFont)
    CFRelease(resolvedFont);
  line = self->_line;
  if (line)
    CFRelease(line);

  v5.receiver = self;
  v5.super_class = (Class)_NSCoreTypesetterLayoutCache;
  -[_NSCoreTypesetterLayoutCache dealloc](&v5, sel_dealloc);
}

@end
