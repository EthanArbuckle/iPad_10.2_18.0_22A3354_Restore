@implementation SBScheduleEventDodgingModifierEventResponse

- (SBScheduleEventDodgingModifierEventResponse)initWithName:(id)a3
{
  id v4;
  SBScheduleEventDodgingModifierEventResponse *v5;
  uint64_t v6;
  NSString *name;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBScheduleEventDodgingModifierEventResponse;
  v5 = -[SBChainableModifierEventResponse init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

  }
  return v5;
}

- (unint64_t)type
{
  return 2;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBScheduleEventDodgingModifierEventResponse;
  -[SBDodgingModifierEventResponse description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), self->_name);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
