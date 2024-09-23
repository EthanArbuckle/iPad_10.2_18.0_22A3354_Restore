@implementation UIKeyboardFloatingPinchGestureRecognizer

- (UIKeyboardFloatingPinchGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  UIKeyboardFloatingPinchGestureRecognizer *v4;
  uint64_t v5;
  NSMutableSet *activeTouches;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIKeyboardFloatingPinchGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v8, sel_initWithTarget_action_, a3, a4);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 2);
    activeTouches = v4->_activeTouches;
    v4->_activeTouches = (NSMutableSet *)v5;

  }
  return v4;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  UIKeyboardFloatingPinchGestureRecognizer *v8;
  uint64_t v9;
  objc_super v10;

  v6 = a3;
  v7 = a4;
  -[NSMutableSet unionSet:](self->_activeTouches, "unionSet:", v6);
  if ((unint64_t)-[NSMutableSet count](self->_activeTouches, "count") < 3)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKeyboardFloatingPinchGestureRecognizer;
    -[UIGestureRecognizer touchesBegan:withEvent:](&v10, sel_touchesBegan_withEvent_, v6, v7);
  }
  else
  {
    if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateBegan
      || -[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateChanged)
    {
      v8 = self;
      v9 = 3;
    }
    else
    {
      v8 = self;
      v9 = 5;
    }
    -[UIGestureRecognizer setState:](v8, "setState:", v9);
  }

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  NSMutableSet *activeTouches;
  id v7;
  id v8;
  objc_super v9;

  activeTouches = self->_activeTouches;
  v7 = a4;
  v8 = a3;
  -[NSMutableSet minusSet:](activeTouches, "minusSet:", v8);
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardFloatingPinchGestureRecognizer;
  -[UIGestureRecognizer touchesEnded:withEvent:](&v9, sel_touchesEnded_withEvent_, v8, v7);

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  NSMutableSet *activeTouches;
  id v7;
  id v8;
  objc_super v9;

  activeTouches = self->_activeTouches;
  v7 = a4;
  v8 = a3;
  -[NSMutableSet minusSet:](activeTouches, "minusSet:", v8);
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardFloatingPinchGestureRecognizer;
  -[UIGestureRecognizer touchesCancelled:withEvent:](&v9, sel_touchesCancelled_withEvent_, v8, v7);

}

- (void)reset
{
  objc_super v3;

  -[NSMutableSet removeAllObjects](self->_activeTouches, "removeAllObjects");
  v3.receiver = self;
  v3.super_class = (Class)UIKeyboardFloatingPinchGestureRecognizer;
  -[UIGestureRecognizer reset](&v3, sel_reset);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeTouches, 0);
}

@end
