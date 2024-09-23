@implementation _NSCGTextGraphicsContext

- (void)dealloc
{
  CGContext *context;
  objc_super v4;

  context = self->_context;
  if (context)
    CGContextRelease(context);
  v4.receiver = self;
  v4.super_class = (Class)_NSCGTextGraphicsContext;
  -[_NSCGTextGraphicsContext dealloc](&v4, sel_dealloc);
}

- (_NSCGTextGraphicsContext)initWithCGContext:(CGContext *)a3
{
  _NSCGTextGraphicsContext *v4;
  _NSCGTextGraphicsContext *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NSCGTextGraphicsContext;
  v4 = -[_NSCGTextGraphicsContext init](&v7, sel_init);
  v5 = v4;
  if (a3 && v4)
    v4->_context = CGContextRetain(a3);
  return v5;
}

- (CGContext)CGContext
{
  return self->_context;
}

- (BOOL)isFlipped
{
  return 1;
}

- (void)becomeCurrentGraphicsContextDuringBlock:(id)a3
{
  setCurrentCGContextDuringBlock_iOS((uint64_t)self->_context, -[_NSCGTextGraphicsContext isFlipped](self, "isFlipped"), (uint64_t)a3);
}

+ (id)graphicsContextForApplicationFrameworkContext:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  NSString *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99768];
  v6 = NSStringFromClass((Class)a1);
  objc_msgSend(v4, "raise:format:", v5, CFSTR("+[%@ %@] should not be invoked."), v6, NSStringFromSelector(a2));
  return 0;
}

- (BOOL)isDrawingToScreen
{
  return 1;
}

- (void)saveGraphicsState
{
  CGContext *context;

  context = self->_context;
  if (context)
    CGContextSaveGState(context);
}

- (void)restoreGraphicsState
{
  CGContext *context;

  context = self->_context;
  if (context)
    CGContextRestoreGState(context);
}

@end
