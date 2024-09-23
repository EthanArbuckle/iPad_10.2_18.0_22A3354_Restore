@implementation SBAnimationCompletionDodgingModifierEvent

- (SBAnimationCompletionDodgingModifierEvent)initWithIdentifier:(id)a3 finished:(BOOL)a4 retargeted:(BOOL)a5
{
  id v8;
  SBAnimationCompletionDodgingModifierEvent *v9;
  uint64_t v10;
  NSString *identifier;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBAnimationCompletionDodgingModifierEvent;
  v9 = -[SBAnimationCompletionDodgingModifierEvent init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    v9->_finished = a4;
    v9->_retargeted = a5;
  }

  return v9;
}

- (unint64_t)type
{
  return 3;
}

- (id)description
{
  void *v3;
  NSString *identifier;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBAnimationCompletionDodgingModifierEvent;
  -[SBDodgingModifierEvent description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  identifier = self->_identifier;
  NSStringFromBOOL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBOOL();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@ finished:%@ retargeted:%@"), identifier, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)finished
{
  return self->_finished;
}

- (BOOL)retargeted
{
  return self->_retargeted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
