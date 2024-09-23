@implementation SBDodgingModifierEventResponse

+ (id)newEventResponse
{
  return objc_alloc_init(SBDodgingModifierEventResponse);
}

- (unint64_t)type
{
  return 0;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  const __CFString *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBDodgingModifierEventResponse;
  -[SBChainableModifierEventResponse description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBDodgingModifierEventResponse type](self, "type");
  v5 = CFSTR("Generic");
  if (v4 == 1)
    v5 = CFSTR("Invalidation");
  if (v4 == 2)
    v5 = CFSTR("ScheduleEvent");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

@end
