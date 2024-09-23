@implementation CRLInsertionContext

- (id)initSubclass
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLInsertionContext;
  return -[CRLInsertionContext init](&v3, "init");
}

+ (id)nonInteractiveInsertionContext
{
  if (qword_101415098 != -1)
    dispatch_once(&qword_101415098, &stru_101245828);
  return (id)qword_101415090;
}

+ (id)nonInteractiveFloatingInsertionContext
{
  if (qword_1014150A8 != -1)
    dispatch_once(&qword_1014150A8, &stru_101245848);
  return (id)qword_1014150A0;
}

+ (id)iosDragFloatingInsertionContext
{
  if (qword_1014150B8 != -1)
    dispatch_once(&qword_1014150B8, &stru_101245868);
  return (id)qword_1014150B0;
}

+ (id)nonInteractiveNonEditingEndingFloatingInsertionContext
{
  if (qword_1014150C8 != -1)
    dispatch_once(&qword_1014150C8, &stru_101245888);
  return (id)qword_1014150C0;
}

+ (id)nonInteractiveInlineInsertionContext
{
  if (qword_1014150D8 != -1)
    dispatch_once(&qword_1014150D8, &stru_1012458A8);
  return (id)qword_1014150D0;
}

+ (id)dragInsertionContextWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 fromDragToInsertController:(BOOL)a5 insertFloating:(BOOL)a6 targetZOrder:(unint64_t)a7
{
  return objc_msgSend(a1, "dragInsertionContextWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertFloating:targetZOrder:", a4, 1, a5, a6, a7, a3.x, a3.y);
}

+ (id)dragInsertionContextWithPreferredCenter:(CGPoint)a3 required:(BOOL)a4 shouldEndEditing:(BOOL)a5 fromDragToInsertController:(BOOL)a6 insertFloating:(BOOL)a7 targetZOrder:(unint64_t)a8
{
  return -[CRLDragInsertionContext initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertFloating:targetZOrder:]([CRLDragInsertionContext alloc], "initWithPreferredCenter:required:shouldEndEditing:fromDragToInsertController:insertFloating:targetZOrder:", a4, a5, a6, a7, a8, a3.x, a3.y);
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
  double x;
  double y;
  CGPoint result;

  x = CGPointZero.x;
  y = CGPointZero.y;
  result.y = y;
  result.x = x;
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

- (BOOL)insertInline
{
  return 0;
}

- (unint64_t)targetZOrder
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isInteractive
{
  return 1;
}

@end
