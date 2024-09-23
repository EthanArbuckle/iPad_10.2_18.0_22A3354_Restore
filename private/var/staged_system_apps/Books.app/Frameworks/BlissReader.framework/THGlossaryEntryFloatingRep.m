@implementation THGlossaryEntryFloatingRep

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)THGlossaryEntryFloatingRep;
  -[THGlossaryEntryFloatingRep dealloc](&v2, "dealloc");
}

- (void)drawInLayerContext:(CGContext *)a3
{
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler", a3), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THGlossaryEntryFloatingRep drawInLayerContext:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THGlossaryEntryFloatingRep.m"), 34, CFSTR("this method should never be called, and entry reps should never get a bitmap allocated"));
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

@end
