@implementation _UIBarTapGestureRecognizer

- (_UIBarTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  _UIBarTapGestureRecognizer *v4;
  _UIBarTapGestureRecognizer *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIBarTapGestureRecognizer;
  v4 = -[UITapGestureRecognizer initWithTarget:action:](&v7, sel_initWithTarget_action_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[UITapGestureRecognizer setNumberOfTapsRequired:](v4, "setNumberOfTapsRequired:", 1);
    -[UITapGestureRecognizer setNumberOfTouchesRequired:](v5, "setNumberOfTouchesRequired:", 1);
    -[UIGestureRecognizer setCancelsTouchesInView:](v5, "setCancelsTouchesInView:", 0);
    v5->_failWhenTappingInBars = 1;
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("You cannot change the delegate of the UINavigationController's barHideOnTapGestureRecognizer"));
}

- (void)_setDelegate:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("UIBarCommon.m"), 679, CFSTR("delegate doesn't implement required methods (%@)"), v5);

  }
  v7.receiver = self;
  v7.super_class = (Class)_UIBarTapGestureRecognizer;
  -[UIGestureRecognizer setDelegate:](&v7, sel_setDelegate_, v5);

}

- (int64_t)_categoryForTapLocation:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  int64_t v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;

  y = a3.y;
  x = a3.x;
  -[UIGestureRecognizer delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_existingNavigationBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_existingToolbarWithItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_7;
  if (!objc_msgSend(v6, "isNavigationBarHidden"))
  {
    -[UIGestureRecognizer view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertPoint:fromView:", v11, x, y);
    v13 = v12;
    v15 = v14;

    if ((objc_msgSend(v7, "pointInside:withEvent:", 0, v13, v15) & 1) != 0)
    {
      v10 = 2;
      goto LABEL_14;
    }
LABEL_7:
    if (v8)
    {
      v16 = objc_msgSend(v6, "isToolbarHidden");
      -[UIGestureRecognizer view](self, "view");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16)
      {
        objc_msgSend(v17, "bounds");
        v20 = v19;
        objc_msgSend(v8, "frame");
        v22 = v20 - v21;

        if (y >= v22)
        {
          v10 = 5;
          goto LABEL_14;
        }
      }
      else
      {
        objc_msgSend(v8, "convertPoint:fromView:", v17, x, y);
        v24 = v23;
        v26 = v25;

        if ((objc_msgSend(v8, "pointInside:withEvent:", 0, v24, v26) & 1) != 0)
        {
          v10 = 4;
          goto LABEL_14;
        }
      }
    }
    v10 = 1;
    goto LABEL_14;
  }
  objc_msgSend(v7, "_heightIncludingBackground");
  if (y > v9)
    goto LABEL_7;
  v10 = 3;
LABEL_14:

  return v10;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void *v5;
  int64_t v6;
  objc_super v7;

  self->_tapCategory = 0;
  v7.receiver = self;
  v7.super_class = (Class)_UIBarTapGestureRecognizer;
  -[UITapGestureRecognizer touchesBegan:withEvent:](&v7, sel_touchesBegan_withEvent_, a3, a4);
  -[UIGestureRecognizer view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITapGestureRecognizer locationInView:](self, "locationInView:", v5);
  v6 = -[_UIBarTapGestureRecognizer _categoryForTapLocation:](self, "_categoryForTapLocation:");

  if (self->_failWhenTappingInBars && (v6 == 4 || v6 == 2))
    -[UIGestureRecognizer setState:](self, "setState:", 5);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBarTapGestureRecognizer;
  -[UITapGestureRecognizer touchesEnded:withEvent:](&v6, sel_touchesEnded_withEvent_, a3, a4);
  if (-[UIGestureRecognizer state](self, "state") == UIGestureRecognizerStateEnded)
  {
    -[UIGestureRecognizer view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITapGestureRecognizer locationInView:](self, "locationInView:", v5);
    self->_tapCategory = -[_UIBarTapGestureRecognizer _categoryForTapLocation:](self, "_categoryForTapLocation:");

  }
  else
  {
    self->_tapCategory = 0;
  }
}

- (id)description
{
  unint64_t tapCategory;
  const __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  tapCategory = self->_tapCategory;
  if (tapCategory > 5)
    v3 = &stru_1E16EDF20;
  else
    v3 = off_1E16B5B78[tapCategory];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_UIBarTapGestureRecognizer;
  -[UIGestureRecognizer description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ tapCategory=%@"), v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)tapCategory
{
  return self->_tapCategory;
}

- (BOOL)failWhenTappingInBars
{
  return self->_failWhenTappingInBars;
}

- (void)setFailWhenTappingInBars:(BOOL)a3
{
  self->_failWhenTappingInBars = a3;
}

@end
