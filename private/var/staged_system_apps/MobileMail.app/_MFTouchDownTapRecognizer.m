@implementation _MFTouchDownTapRecognizer

- (_MFTouchDownTapRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6;
  _MFTouchDownTapRecognizer *v7;
  _MFTouchDownTapRecognizer *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_MFTouchDownTapRecognizer;
  v7 = -[_MFTouchDownTapRecognizer initWithTarget:action:](&v10, "initWithTarget:action:", v6, a4);
  v8 = v7;
  if (v7)
    -[_MFTouchDownTapRecognizer setDelaysTouchesEnded:](v7, "setDelaysTouchesEnded:", 0);

  return v8;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)_MFTouchDownTapRecognizer;
  -[_MFTouchDownTapRecognizer touchesBegan:withEvent:](&v8, "touchesBegan:withEvent:", v6, v7);
  self->_numberOfTouches += (unint64_t)objc_msgSend(v6, "count");
  (*((void (**)(void))self->_touchdownHandler + 2))();

}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)_MFTouchDownTapRecognizer;
  -[_MFTouchDownTapRecognizer touchesEnded:withEvent:](&v8, "touchesEnded:withEvent:", v6, v7);
  self->_numberOfTouches -= (unint64_t)objc_msgSend(v6, "count");
  (*((void (**)(void))self->_touchdownHandler + 2))();

}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  v8.receiver = self;
  v8.super_class = (Class)_MFTouchDownTapRecognizer;
  -[_MFTouchDownTapRecognizer touchesCancelled:withEvent:](&v8, "touchesCancelled:withEvent:", v6, v7);
  self->_numberOfTouches -= (unint64_t)objc_msgSend(v6, "count");
  (*((void (**)(void))self->_touchdownHandler + 2))();

}

- (unint64_t)numberOfTouches
{
  return self->_numberOfTouches;
}

- (void)reset
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MFTouchDownTapRecognizer;
  -[_MFTouchDownTapRecognizer reset](&v3, "reset");
  self->_numberOfTouches = 0;
  (*((void (**)(void))self->_touchdownHandler + 2))();
}

- (id)touchdownHandler
{
  return self->_touchdownHandler;
}

- (void)setTouchdownHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_touchdownHandler, 0);
}

@end
