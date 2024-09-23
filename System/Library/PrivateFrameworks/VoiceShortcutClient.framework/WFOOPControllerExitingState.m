@implementation WFOOPControllerExitingState

- (unint64_t)stage
{
  return 9;
}

- (BOOL)canTransitionToState:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v4, "stage") == 2)
    {
      v5 = 1;
    }
    else
    {
      v8.receiver = self;
      v8.super_class = (Class)WFOOPControllerExitingState;
      v5 = -[WFOOPControllerState canTransitionToState:](&v8, sel_canTransitionToState_, v4);
    }
    v6 = v4;
  }
  else
  {

    v6 = 0;
    v5 = 0;
  }

  return v5;
}

@end
