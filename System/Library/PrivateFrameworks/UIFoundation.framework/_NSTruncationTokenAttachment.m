@implementation _NSTruncationTokenAttachment

- (_QWORD)initWithAttributedString:(const void *)a3 lineRef:
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v5 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)_NSTruncationTokenAttachment;
    a1 = objc_msgSendSuper2(&v9, sel_initWithData_ofType_, 0, 0);
    if (a1)
    {
      v6 = objc_msgSend(v5, "copy");
      v7 = (void *)a1[18];
      a1[18] = v6;

      if (a3)
        a1[19] = CFRetain(a3);
    }
  }

  return a1;
}

- (void)dealloc
{
  __CTLine *lineRef;
  __CTRunDelegate *runDelegate;
  objc_super v5;

  lineRef = self->_lineRef;
  if (lineRef)
    CFRelease(lineRef);
  runDelegate = self->_runDelegate;
  if (runDelegate)
    CFRetain(runDelegate);
  v5.receiver = self;
  v5.super_class = (Class)_NSTruncationTokenAttachment;
  -[NSTextAttachment dealloc](&v5, sel_dealloc);
}

- (CGRect)bounds
{
  _NSTruncationTokenAttachment *v2;
  double width;
  const __CTLine *lineRef;
  double TypographicBounds;
  NSStringDrawingContext *stringDrawingContext;
  NSStringDrawingContext *v7;
  NSStringDrawingContext *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect v13;
  CGRect result;

  v2 = self;
  objc_sync_enter(v2);
  width = v2->_width;
  if (width == 0.0)
  {
    lineRef = v2->_lineRef;
    if (lineRef)
    {
      TypographicBounds = CTLineGetTypographicBounds(lineRef, 0, 0, 0);
    }
    else
    {
      stringDrawingContext = v2->stringDrawingContext;
      if (!stringDrawingContext)
      {
        v7 = objc_alloc_init(NSStringDrawingContext);
        v8 = v2->stringDrawingContext;
        v2->stringDrawingContext = v7;

        -[NSStringDrawingContext setCachesLayout:](v2->stringDrawingContext, "setCachesLayout:", 1);
        stringDrawingContext = v2->stringDrawingContext;
      }
      -[NSAttributedString boundingRectWithSize:options:context:](v2->_attributedString, "boundingRectWithSize:options:context:", 0, stringDrawingContext, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      TypographicBounds = CGRectGetWidth(v13);
    }
    width = TypographicBounds;
    v2->_width = TypographicBounds;
  }
  objc_sync_exit(v2);

  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  v12 = width;
  result.size.height = v11;
  result.size.width = v12;
  result.origin.y = v10;
  result.origin.x = v9;
  return result;
}

- (CTRunDelegateRef)runDelegate
{
  _QWORD *v1;
  CTRunDelegateRef v2;

  if (!a1)
    return 0;
  v1 = a1;
  objc_sync_enter(v1);
  v2 = (CTRunDelegateRef)v1[16];
  if (!v2)
  {
    v2 = CTRunDelegateCreate(&callbacks, v1);
    v1[16] = v2;
  }
  objc_sync_exit(v1);

  return v2;
}

- (void)_showWithBounds:(CGRect)a3 attributes:(id)a4 location:(id)a5 textContainer:(id)a6 applicationFrameworkContext:(int64_t)a7 acceptsViewProvider:(BOOL)a8
{
  -[NSAttributedString drawWithRect:options:context:](self->_attributedString, "drawWithRect:options:context:", 0, self->stringDrawingContext, a6, a7, a8, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->stringDrawingContext, 0);
}

@end
