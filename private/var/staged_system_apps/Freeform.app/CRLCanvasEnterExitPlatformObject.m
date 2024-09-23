@implementation CRLCanvasEnterExitPlatformObject

+ (id)platformObjectWithGesture:(id)a3
{
  id v3;
  CRLCanvasEnterExitPlatformObject *v4;

  v3 = a3;
  v4 = -[CRLCanvasEnterExitPlatformObject initWithGesture:]([CRLCanvasEnterExitPlatformObject alloc], "initWithGesture:", v3);

  return v4;
}

- (CRLCanvasEnterExitPlatformObject)initWithGesture:(id)a3
{
  id v5;
  CRLCanvasEnterExitPlatformObject *v6;
  CRLCanvasEnterExitPlatformObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRLCanvasEnterExitPlatformObject;
  v6 = -[CRLCanvasEnterExitPlatformObject init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_UIGestureRecognizer, a3);

  return v7;
}

- (UIGestureRecognizer)UIGestureRecognizer
{
  return self->_UIGestureRecognizer;
}

- (void)setUIGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_UIGestureRecognizer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UIGestureRecognizer, 0);
}

@end
