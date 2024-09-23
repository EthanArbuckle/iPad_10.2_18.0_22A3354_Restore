@implementation TSDInsertionContext

+ (id)nonInteractiveInsertionContext
{
  if (nonInteractiveInsertionContext_createNonInteractiveInsertionContextOnce != -1)
    dispatch_once(&nonInteractiveInsertionContext_createNonInteractiveInsertionContextOnce, &__block_literal_global_53);
  return (id)nonInteractiveInsertionContext_nonInteractiveInsertionContext;
}

TSDNonInteractiveInsertionContext *__53__TSDInsertionContext_nonInteractiveInsertionContext__block_invoke()
{
  TSDNonInteractiveInsertionContext *result;

  result = objc_alloc_init(TSDNonInteractiveInsertionContext);
  nonInteractiveInsertionContext_nonInteractiveInsertionContext = (uint64_t)result;
  return result;
}

+ (id)nonInteractiveFloatingInsertionContext
{
  if (nonInteractiveFloatingInsertionContext_createNonInteractiveFloatingInsertionContextOnce != -1)
    dispatch_once(&nonInteractiveFloatingInsertionContext_createNonInteractiveFloatingInsertionContextOnce, &__block_literal_global_1_1);
  return (id)nonInteractiveFloatingInsertionContext_nonInteractiveFloatingInsertionContext;
}

TSDNonInteractiveFloatingInsertionContext *__61__TSDInsertionContext_nonInteractiveFloatingInsertionContext__block_invoke()
{
  TSDNonInteractiveFloatingInsertionContext *result;

  result = objc_alloc_init(TSDNonInteractiveFloatingInsertionContext);
  nonInteractiveFloatingInsertionContext_nonInteractiveFloatingInsertionContext = (uint64_t)result;
  return result;
}

+ (id)dragInsertionContextWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 fromDragToInsertController:(BOOL)a5 insertWillBeDiscarded:(BOOL)a6
{
  return (id)objc_msgSend(a1, "dragInsertionContextWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertWillBeDiscarded:", a4, 1, a5, a6, a3.x, a3.y);
}

+ (id)dragInsertionContextWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 shouldEndEditing:(BOOL)a5 fromDragToInsertController:(BOOL)a6 insertWillBeDiscarded:(BOOL)a7
{
  return -[TSDDragInsertionContext initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertWillBeDiscarded:]([TSDDragInsertionContext alloc], "initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertWillBeDiscarded:", a4, a5, a6, a7, a3.x, a3.y);
}

- (TSDInsertionContext)init
{
  TSDInsertionContext *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDInsertionContext;
  v2 = -[TSDInsertionContext init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_class();
    if (v3 == objc_opt_class())
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSDInsertionContext init]");
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDInsertionContext.m"), 71, CFSTR("Cannot instantiate abstract class"));

      return 0;
    }
  }
  return v2;
}

- (BOOL)hasPreferredCenter
{
  return 0;
}

- (BOOL)isPreferredCenterRequired
{
  return 0;
}

- (CGPoint)preferredCenter
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x24BDBEFB0];
  v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)shouldEndEditing
{
  return 1;
}

- (BOOL)insertFloating
{
  return 0;
}

- (BOOL)insertFromDrag
{
  return 0;
}

- (BOOL)fromDragToInsertController
{
  return 0;
}

- (BOOL)insertWillBeDiscarded
{
  return 0;
}

- (BOOL)isInteractive
{
  return 1;
}

@end
