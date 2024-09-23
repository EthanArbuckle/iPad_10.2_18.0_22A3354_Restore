@implementation THSectionRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)setNeedsDisplayInRect:(CGRect)a3
{
  if (!CGRectIsEmpty(a3))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionRep setNeedsDisplayInRect:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionRep.m"), 27, CFSTR("this method should never be called, and section reps should never get a bitmap allocated"));
}

- (void)drawInLayerContext:(CGContext *)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THSectionRep drawInLayerContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THSectionRep.m"), 37, CFSTR("this method should never be called, and section reps should never get a bitmap allocated"));
}

- (BOOL)masksToBounds
{
  return 1;
}

@end
