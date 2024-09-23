@implementation AEHighlightContainerLayer

+ (id)layer
{
  id v2;
  void *v3;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___AEHighlightContainerLayer;
  v2 = objc_msgSendSuper2(&v5, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v3, "setBlendMode:", 0);
  return v3;
}

+ (id)defaultActionForKey:(id)a3
{
  return kCFNull;
}

- (void)setBlendMode:(int)a3
{
  _QWORD *v5;
  void *v6;

  if (self->_blendMode != a3)
  {
    switch(a3)
    {
      case 1:
        v5 = &kCAFilterMultiplyBlendMode;
        goto LABEL_8;
      case 2:
        v5 = &kCAFilterScreenBlendMode;
        goto LABEL_8;
      case 3:
        v5 = &kCAFilterOverlayBlendMode;
        goto LABEL_8;
      case 9:
        v5 = &kCAFilterHardLightBlendMode;
LABEL_8:
        v6 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", *v5));
        -[AEHighlightContainerLayer setCompositingFilter:](self, "setCompositingFilter:", v6);

        break;
      default:
        -[AEHighlightContainerLayer setCompositingFilter:](self, "setCompositingFilter:", 0);
        break;
    }
    self->_blendMode = a3;
  }
}

- (void)renderInContext:(CGContext *)a3
{
  objc_super v5;

  CGContextSaveGState(a3);
  CGContextSetBlendMode(a3, (CGBlendMode)self->_blendMode);
  v5.receiver = self;
  v5.super_class = (Class)AEHighlightContainerLayer;
  -[AEHighlightContainerLayer renderInContext:](&v5, "renderInContext:", a3);
  CGContextRestoreGState(a3);
}

- (int)blendMode
{
  return self->_blendMode;
}

@end
