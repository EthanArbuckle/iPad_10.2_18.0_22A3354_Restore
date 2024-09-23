@implementation _NSUIKitTextGraphicsContext

- (CGContext)CGContext
{
  return (CGContext *)softLinkUIGraphicsGetCurrentContext[0]();
}

- (BOOL)isFlipped
{
  return 1;
}

+ (_NSUIKitTextGraphicsContext)sharedContext
{
  if (sharedContext_once != -1)
    dispatch_once(&sharedContext_once, &__block_literal_global_100);
  return (_NSUIKitTextGraphicsContext *)sharedContext_sharedContext;
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
  CGContext *v2;

  if (softLinkUIGraphicsGetCurrentContext[0]())
  {
    v2 = (CGContext *)softLinkUIGraphicsGetCurrentContext[0]();
    CGContextSaveGState(v2);
  }
}

- (void)restoreGraphicsState
{
  CGContext *v2;

  if (softLinkUIGraphicsGetCurrentContext[0]())
  {
    v2 = (CGContext *)softLinkUIGraphicsGetCurrentContext[0]();
    CGContextRestoreGState(v2);
  }
}

- (void)becomeCurrentGraphicsContextDuringBlock:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

@end
