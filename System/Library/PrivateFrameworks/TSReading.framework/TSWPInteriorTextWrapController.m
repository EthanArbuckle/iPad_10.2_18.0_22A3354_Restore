@implementation TSWPInteriorTextWrapController

+ (id)sharedInteriorTextWrapController
{
  id result;

  result = (id)+[TSWPInteriorTextWrapController sharedInteriorTextWrapController]::sSharedInstance;
  if (!+[TSWPInteriorTextWrapController sharedInteriorTextWrapController]::sSharedInstance)
  {
    result = objc_alloc_init((Class)a1);
    +[TSWPInteriorTextWrapController sharedInteriorTextWrapController]::sSharedInstance = (uint64_t)result;
  }
  return result;
}

- (id)beginWrappingToColumn:(id)a3 target:(id)a4 hasWrapables:(BOOL *)a5
{
  TSWPInteriorCookie *v8;

  v8 = objc_alloc_init(TSWPInteriorCookie);
  objc_opt_class();
  objc_msgSend(a4, "parent");
  -[TSWPInteriorCookie setLayout:](v8, "setLayout:", TSUDynamicCast());
  -[TSWPInteriorCookie setColumn:](v8, "setColumn:", a3);
  *a5 = 1;
  return v8;
}

- (unsigned)splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] wrappableAttachments:(id)a5 ignoreFloatingGraphics:(BOOL)a6 floatingCausedWrap:(BOOL *)a7 skipHint:(double *)a8 userInfo:(id)a9
{
  double height;
  double width;
  double y;
  double x;
  void *v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *a8 = 1.0;
  objc_opt_class();
  v14 = (void *)TSUDynamicCast();
  if (v14)
    return objc_msgSend((id)objc_msgSend(v14, "layout"), "cropLine:lineSegmentRects:", a4, x, y, width, height);
  else
    return 1;
}

- (double)nextUnobstructedSpanStartingAt:(CGRect)a3 wrappableAttachments:(id)a4 userInfo:(id)a5
{
  return 0.0;
}

@end
