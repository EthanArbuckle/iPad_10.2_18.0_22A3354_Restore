@implementation CRLiOSAllTouchesDoneGestureRecognizer

- (CRLiOSAllTouchesDoneGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  CRLiOSAllTouchesDoneGestureRecognizer *v4;
  NSMutableSet *v5;
  NSMutableSet *touches;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLiOSAllTouchesDoneGestureRecognizer;
  v4 = -[CRLiOSAllTouchesDoneGestureRecognizer initWithTarget:action:](&v8, "initWithTarget:action:", a3, a4);
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    touches = v4->_touches;
    v4->_touches = v5;

    -[CRLiOSAllTouchesDoneGestureRecognizer setCancelsTouchesInView:](v4, "setCancelsTouchesInView:", 0);
    -[CRLiOSAllTouchesDoneGestureRecognizer setDelaysTouchesEnded:](v4, "setDelaysTouchesEnded:", 0);
  }
  return v4;
}

- (void)reset
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLiOSAllTouchesDoneGestureRecognizer;
  -[CRLiOSAllTouchesDoneGestureRecognizer reset](&v4, "reset");
  -[NSMutableSet removeAllObjects](self->_touches, "removeAllObjects");
  if (self->_currentlyCountingTouches)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSAllTouchesDoneGestureRecognizer delegate](self, "delegate"));
    objc_msgSend(v3, "didStopCountingTouches:", self);

    self->_currentlyCountingTouches = 0;
  }
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char isKindOfClass;
  uint64_t v12;

  v3 = a3;
  objc_opt_class(UIPanGestureRecognizer, v4);
  if ((objc_opt_isKindOfClass(v3, v5) & 1) != 0
    && (v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "view")),
        objc_opt_class(UIScrollView, v8),
        v10 = objc_opt_isKindOfClass(v7, v9),
        v7,
        (v10 & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class(CRLiOSCanvasZoomPinchGestureRecognizer, v6);
    isKindOfClass = objc_opt_isKindOfClass(v3, v12);
  }

  return isKindOfClass & 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  -[NSMutableSet unionSet:](self->_touches, "unionSet:", a3, a4);
  if (-[NSMutableSet count](self->_touches, "count"))
  {
    if (!self->_currentlyCountingTouches)
    {
      v12 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet anyObject](self->_touches, "anyObject"));
      v5 = objc_msgSend(v12, "type");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSAllTouchesDoneGestureRecognizer view](self, "view"));
      objc_msgSend(v12, "locationInView:", v6);
      v8 = v7;
      v10 = v9;

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSAllTouchesDoneGestureRecognizer delegate](self, "delegate"));
      objc_msgSend(v11, "didStartCountingTouches:touchType:atSomeTouchPoint:", self, v5, v8, v10);

      self->_currentlyCountingTouches = 1;
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[CRLiOSAllTouchesDoneGestureRecognizer p_touchesEndedOrCancelled:](self, "p_touchesEndedOrCancelled:", a3, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[CRLiOSAllTouchesDoneGestureRecognizer p_touchesEndedOrCancelled:](self, "p_touchesEndedOrCancelled:", a3, a4);
}

- (void)p_touchesEndedOrCancelled:(id)a3
{
  void *v4;

  -[NSMutableSet minusSet:](self->_touches, "minusSet:", a3);
  if (!-[NSMutableSet count](self->_touches, "count") && !-[CRLiOSAllTouchesDoneGestureRecognizer state](self, "state"))
  {
    -[CRLiOSAllTouchesDoneGestureRecognizer setState:](self, "setState:", 3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSAllTouchesDoneGestureRecognizer delegate](self, "delegate"));
    objc_msgSend(v4, "didStopCountingTouches:", self);

    self->_currentlyCountingTouches = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touches, 0);
}

@end
