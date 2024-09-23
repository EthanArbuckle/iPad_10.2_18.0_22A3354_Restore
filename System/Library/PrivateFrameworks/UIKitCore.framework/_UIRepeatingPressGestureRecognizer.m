@implementation _UIRepeatingPressGestureRecognizer

- (_UIRepeatingPressGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIRepeatingPressGestureRecognizer *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIRepeatingPressGestureRecognizer;
  v4 = -[UIGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(v5, "setDelegate:", v4);
    -[_UIRepeatingPressGestureRecognizer setClock:](v4, "setClock:", v5);

  }
  return v4;
}

- (int64_t)_buttonType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[UIGestureRecognizer allowedPressTypes](self, "allowedPressTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

  }
  else
  {
    v4 = -1;
  }

  return v4;
}

- (void)_setButtonType:(int64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (-[_UIRepeatingPressGestureRecognizer _buttonType](self, "_buttonType") != a3)
  {
    -[UIGestureRecognizer view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIRepeatingPressGestureRecognizer.m"), 59, CFSTR("_buttonType can't be changed after a gesture recognizer is added to a view"));

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureRecognizer setAllowedPressTypes:](self, "setAllowedPressTypes:", v8);

  }
}

- (BOOL)_shouldReceivePress:(id)a3
{
  int64_t v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIRepeatingPressGestureRecognizer;
  if (-[UIGestureRecognizer _shouldReceivePress:](&v7, sel__shouldReceivePress_))
    return 1;
  v6 = -[_UIRepeatingPressGestureRecognizer _buttonType](self, "_buttonType");
  return v6 == objc_msgSend(a3, "type");
}

- (void)setView:(id)a3
{
  void *v5;
  objc_super v6;

  if (!a3)
  {
    -[_UIRepeatingPressGestureRecognizer clock](self, "clock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopClock");

  }
  v6.receiver = self;
  v6.super_class = (Class)_UIRepeatingPressGestureRecognizer;
  -[UIGestureRecognizer setView:](&v6, sel_setView_, a3);
}

- (void)_resetGestureRecognizer
{
  void *v3;
  objc_super v4;

  self->_force = 0.0;
  -[_UIRepeatingPressGestureRecognizer clock](self, "clock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopClock");

  v4.receiver = self;
  v4.super_class = (Class)_UIRepeatingPressGestureRecognizer;
  -[UIGestureRecognizer _resetGestureRecognizer](&v4, sel__resetGestureRecognizer);
}

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 12;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;

  self->_force = 1.0;
  if (-[_UIRepeatingPressGestureRecognizer _buttonType](self, "_buttonType", a3, a4) == -1)
  {
    -[_UIRepeatingPressGestureRecognizer setChangeCount:](self, "setChangeCount:", 0);
    -[UIGestureRecognizer setState:](self, "setState:", 1);
    -[_UIRepeatingPressGestureRecognizer clock](self, "clock");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startClock");

  }
  else
  {
    -[UIGestureRecognizer setState:](self, "setState:", 5);
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  if (-[_UIRepeatingPressGestureRecognizer _buttonType](self, "_buttonType", a3, a4) == -1)
    -[UIGestureRecognizer setState:](self, "setState:", 2);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v5;

  if (-[_UIRepeatingPressGestureRecognizer _buttonType](self, "_buttonType", a3, a4) == -1)
  {
    -[UIGestureRecognizer setState:](self, "setState:", 3);
    -[_UIRepeatingPressGestureRecognizer clock](self, "clock");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopClock");

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;

  if (-[_UIRepeatingPressGestureRecognizer _buttonType](self, "_buttonType", a3, a4) == -1)
  {
    -[UIGestureRecognizer setState:](self, "setState:", 4);
    -[_UIRepeatingPressGestureRecognizer clock](self, "clock");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stopClock");

  }
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  double v6;
  id v7;

  objc_msgSend(a4, "_lastPreparedPress", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "force");
  self->_force = v6;

  -[_UIRepeatingPressGestureRecognizer setChangeCount:](self, "setChangeCount:", 0);
  -[UIGestureRecognizer setState:](self, "setState:", 1);
  -[_UIRepeatingPressGestureRecognizer clock](self, "clock");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startClock");

}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  void *v5;
  double v6;

  objc_msgSend(a4, "_lastPreparedPress", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "force");
  self->_force = v6;

  -[UIGestureRecognizer setState:](self, "setState:", 2);
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v5;

  self->_force = 0.0;
  -[UIGestureRecognizer setState:](self, "setState:", 3, a4);
  -[_UIRepeatingPressGestureRecognizer clock](self, "clock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopClock");

}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;

  self->_force = 0.0;
  -[UIGestureRecognizer setState:](self, "setState:", 4, a4);
  -[_UIRepeatingPressGestureRecognizer clock](self, "clock");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopClock");

}

- (void)repeatingGestureClockDidTick:(id)a3
{
  -[_UIRepeatingPressGestureRecognizer setChangeCount:](self, "setChangeCount:", -[_UIRepeatingPressGestureRecognizer changeCount](self, "changeCount", a3) + 1);
  -[UIGestureRecognizer setState:](self, "setState:", 2);
}

- (unint64_t)numberOfTouchesRequired
{
  return self->_numberOfTouchesRequired;
}

- (void)setNumberOfTouchesRequired:(unint64_t)a3
{
  self->_numberOfTouchesRequired = a3;
}

- (double)_force
{
  return self->_force;
}

- (unint64_t)changeCount
{
  return self->_changeCount;
}

- (void)setChangeCount:(unint64_t)a3
{
  self->_changeCount = a3;
}

- (_UIRepeatingGestureClock)clock
{
  return self->_clock;
}

- (void)setClock:(id)a3
{
  objc_storeStrong((id *)&self->_clock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clock, 0);
}

@end
