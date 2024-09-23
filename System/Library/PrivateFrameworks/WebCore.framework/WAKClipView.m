@implementation WAKClipView

- (WAKClipView)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  WAKClipView *v14;
  int v15;
  _QWORD *i;
  void (*v17)(_QWORD *);
  char v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = malloc_type_calloc(0x70uLL, 1uLL, 0x2B517A3EuLL);
  v9 = v8;
  if (v8)
  {
    v8[1] = &WKViewClassInfo;
    ++*(_DWORD *)v8;
    *((CGFloat *)v8 + 6) = x;
    *((CGFloat *)v8 + 7) = y;
    *((_OWORD *)v8 + 4) = *MEMORY[0x1E0C9D538];
    *((CGFloat *)v8 + 10) = width;
    *((CGFloat *)v8 + 11) = height;
    v8[2] = &self->super.viewContext;
    v8[12] = 0x3F80000000000000;
  }
  v14 = -[WAKView _initWithViewRef:](self, "_initWithViewRef:", v8);
  if (*(_DWORD *)v9)
  {
    v15 = *(_DWORD *)v9 - 1;
    *(_DWORD *)v9 = v15;
    if (!v15)
    {
      for (i = (_QWORD *)v9[1]; i; i = (_QWORD *)*i)
      {
        v17 = (void (*)(_QWORD *))i[2];
        if (v17)
          v17(v9);
      }
    }
  }
  else
  {
    WKReportError("/Library/Caches/com.apple.xbs/Sources/WebCore/Source/WebCore/platform/ios/wak/WKUtilities.c", 62, "void WAKRelease(const void *)", "attempt to release invalid object", v10, v11, v12, v13, v19);
  }
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WAKClipView;
  -[WAKView dealloc](&v3, sel_dealloc);
}

- (void)_setDocumentView:(id)a3
{
  id v4;
  id v6;

  v4 = *(id *)&self->_copiesOnScroll;
  if (v4 != a3)
  {
    objc_msgSend(v4, "removeFromSuperview");

    v6 = a3;
    *(_QWORD *)&self->_copiesOnScroll = v6;
    -[WAKView addSubview:](self, "addSubview:", v6);
  }
}

- (CGRect)documentVisibleRect
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v3 = *(void **)&self->_copiesOnScroll;
  if (v3)
  {
    v4 = objc_msgSend(v3, "_viewRef");
    -[WAKView bounds](self, "bounds");
    WKViewConvertRectFromSuperview(v4, v12, v13, v14, v15, v5, v6, v7, v8, v9, v10, v11);
  }
  else
  {
    v16 = *MEMORY[0x1E0C9D648];
    v17 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v18 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (WAKView)documentView
{
  return *(WAKView **)&self->_copiesOnScroll;
}

- (BOOL)copiesOnScroll
{
  return *(&self->super._drawsOwnDescendants + 1);
}

- (void)setCopiesOnScroll:(BOOL)a3
{
  *(&self->super._drawsOwnDescendants + 1) = a3;
}

@end
