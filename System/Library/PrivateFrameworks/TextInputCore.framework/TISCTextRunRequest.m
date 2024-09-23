@implementation TISCTextRunRequest

- (id)strings
{
  return self->_strings;
}

- (CGColor)color
{
  return self->_color;
}

- (double)maxFontSize
{
  return self->_maxFontSize;
}

- (double)minFontSize
{
  return self->_minFontSize;
}

- (BOOL)allowTruncation
{
  return self->_allowTruncation;
}

- (id)truncationSentinel
{
  return self->_truncationSentinel;
}

- (unint64_t)widthGroup
{
  return self->_widthGroup;
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_color);
  v3.receiver = self;
  v3.super_class = (Class)TISCTextRunRequest;
  -[TISCTextRunRequest dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncationSentinel, 0);
  objc_storeStrong((id *)&self->_strings, 0);
}

+ (id)textRunRequestWithStrings:(id)a3 color:(CGColor *)a4 maxFontSize:(double)a5 minFontSize:(double)a6 allowTruncation:(BOOL)a7 truncationSentinel:(id)a8 widthGroup:(unint64_t)a9
{
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;

  v15 = a3;
  v16 = a8;
  v17 = objc_opt_new();
  v18 = *(void **)(v17 + 8);
  *(_QWORD *)(v17 + 8) = v15;
  v19 = v15;

  *(_QWORD *)(v17 + 16) = CGColorRetain(a4);
  *(double *)(v17 + 24) = a5;
  *(double *)(v17 + 32) = a6;
  *(_BYTE *)(v17 + 40) = a7;
  v20 = objc_msgSend(v16, "copy");

  v21 = *(void **)(v17 + 48);
  *(_QWORD *)(v17 + 48) = v20;

  *(_QWORD *)(v17 + 56) = a9;
  return (id)v17;
}

@end
