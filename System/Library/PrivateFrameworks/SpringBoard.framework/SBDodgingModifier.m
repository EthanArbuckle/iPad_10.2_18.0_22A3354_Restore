@implementation SBDodgingModifier

+ (id)contextProtocol
{
  return &unk_1EFC59C60;
}

+ (id)queryProtocol
{
  return &unk_1EFC59B90;
}

- (id)_handleEvent:(id)a3
{
  id v4;
  id v5;
  SBDodgingModifier *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDodgingModifier;
  v5 = -[SBChainableModifier _handleEvent:](&v8, sel__handleEvent_, v4);
  switch(objc_msgSend(v4, "type"))
  {
    case 0:
      -[SBDodgingModifier handleInsertionEvent:](self, "handleInsertionEvent:", v4);
      v6 = (SBDodgingModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      -[SBDodgingModifier handleRemovalEvent:](self, "handleRemovalEvent:", v4);
      v6 = (SBDodgingModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      -[SBDodgingModifier handleCustomEvent:](self, "handleCustomEvent:", v4);
      v6 = (SBDodgingModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      -[SBDodgingModifier handleAnimationCompletionEvent:](self, "handleAnimationCompletionEvent:", v4);
      v6 = (SBDodgingModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 4:
      -[SBDodgingModifier handleRotationEvent:](self, "handleRotationEvent:", v4);
      v6 = (SBDodgingModifier *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 5:
      -[SBDodgingModifier handlePreferenceChangeEvent:](self, "handlePreferenceChangeEvent:", v4);
      v6 = (SBDodgingModifier *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      self = v6;
      break;
    default:
      break;
  }

  return self;
}

- (BOOL)runsInternalVerificationAfterEventDispatch
{
  return 0;
}

+ (id)newEventResponse
{
  return objc_alloc_init(SBDodgingModifierEventResponse);
}

- (id)handleInsertionEvent:(id)a3
{
  return 0;
}

- (id)handleRemovalEvent:(id)a3
{
  return 0;
}

- (id)handleCustomEvent:(id)a3
{
  return 0;
}

- (id)handleAnimationCompletionEvent:(id)a3
{
  return 0;
}

- (id)handleRotationEvent:(id)a3
{
  return 0;
}

- (id)handlePreferenceChangeEvent:(id)a3
{
  return 0;
}

@end
