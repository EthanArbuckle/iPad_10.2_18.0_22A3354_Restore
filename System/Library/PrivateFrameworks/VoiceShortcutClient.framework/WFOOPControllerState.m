@implementation WFOOPControllerState

- (BOOL)canTransitionToState:(id)a3
{
  id v4;
  unint64_t v5;
  BOOL v6;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = objc_msgSend(v4, "stage");
    v6 = v5 > -[WFOOPControllerState stage](self, "stage");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[WFOOPControllerState stage](self, "stage");
  if (v4 > 9)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E5FC4C08[v4];
  v9.receiver = self;
  v9.super_class = (Class)WFOOPControllerState;
  -[WFOOPControllerState description](&v9, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (unint64_t)stage
{
  return self->_stage;
}

- (void)setStage:(unint64_t)a3
{
  self->_stage = a3;
}

@end
