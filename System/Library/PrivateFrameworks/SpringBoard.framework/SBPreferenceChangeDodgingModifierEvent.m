@implementation SBPreferenceChangeDodgingModifierEvent

- (SBPreferenceChangeDodgingModifierEvent)initWithIdentifier:(id)a3 phase:(unint64_t)a4 style:(unint64_t)a5
{
  id v10;
  SBPreferenceChangeDodgingModifierEvent *v11;
  void *v13;
  objc_super v14;

  v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SBPreferenceChangeDodgingModifierEvent;
  v11 = -[SBPreferenceChangeDodgingModifierEvent init](&v14, sel_init);
  if (v11)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBPreferenceChangeDodgingModifierEvent.m"), 16, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

    }
    objc_storeStrong((id *)&v11->_identifier, a3);
    v11->_phase = a4;
    v11->_style = a5;
  }

  return v11;
}

- (unint64_t)type
{
  return 5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)phase
{
  return self->_phase;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
