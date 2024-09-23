@implementation TSWPDummyTapGesture

- (TSWPDummyTapGesture)initWithKind:(id)a3
{
  TSWPDummyTapGesture *v4;
  TSWPDummyTapGesture *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPDummyTapGesture;
  v4 = -[TSWPDummyTapGesture init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[TSWPDummyTapGesture setGestureKind:](v4, "setGestureKind:", a3);
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPDummyTapGesture setGestureKind:](self, "setGestureKind:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSWPDummyTapGesture;
  -[TSWPDummyTapGesture dealloc](&v3, sel_dealloc);
}

- (CGPoint)unscaledLocationForICC:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 0.0;
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)boundsLocationForICC:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 0.0;
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)naturalLocationForRep:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 0.0;
  v4 = 0.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)isDone
{
  return 1;
}

- (TSDGestureTarget)cachedGestureTarget
{
  return self->cachedGestureTarget;
}

- (void)setCachedGestureTarget:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (TSDGestureDelegate)gestureDelegate
{
  return self->gestureDelegate;
}

- (void)setGestureDelegate:(id)a3
{
  self->gestureDelegate = (TSDGestureDelegate *)a3;
}

- (NSString)gestureKind
{
  return self->_gestureKind;
}

- (void)setGestureKind:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (TSDRep)targetRep
{
  return self->targetRep;
}

- (void)setTargetRep:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (int)gestureState
{
  return self->gestureState;
}

@end
