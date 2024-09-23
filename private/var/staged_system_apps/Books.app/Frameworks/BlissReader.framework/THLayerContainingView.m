@implementation THLayerContainingView

- (void)addSublayer:(id)a3
{
  objc_msgSend(a3, "setContentsScale:", TSUScreenScale(self, a2));
  objc_msgSend(-[THLayerContainingView layer](self, "layer"), "addSublayer:", a3);
}

- (void)removeSublayer:(id)a3
{
  id v5;

  v5 = objc_msgSend(a3, "superlayer");
  if (v5 == -[THLayerContainingView layer](self, "layer"))
    objc_msgSend(a3, "removeFromSuperlayer");
  else
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THLayerContainingView removeSublayer:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/THLayerContainingView.m"), 33, CFSTR("this isn't one of our sublayers"));
}

- (BOOL)allowLayerDelegate
{
  return self->_allowLayerDelegate;
}

- (void)setAllowLayerDelegate:(BOOL)a3
{
  self->_allowLayerDelegate = a3;
}

@end
