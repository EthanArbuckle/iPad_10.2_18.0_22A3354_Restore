@implementation SBPIPWindowLevelOverrideAssertion

- (SBPIPWindowLevelOverrideAssertion)initWithWindowLevel:(unint64_t)a3 reason:(int64_t)a4 identifier:(id)a5 invalidationBlock:(id)a6
{
  SBPIPWindowLevelOverrideAssertion *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBPIPWindowLevelOverrideAssertion;
  result = -[SBPIPBehaviorOverrideAssertion initWithReason:identifier:invalidationBlock:](&v8, sel_initWithReason_identifier_invalidationBlock_, a4, a5, a6);
  if (result)
    result->_windowLevel = a3;
  return result;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBPIPWindowLevelOverrideAssertion;
  -[SBPIPBehaviorOverrideAssertion descriptionBuilderWithMultilinePrefix:](&v7, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendUInt64:withName:", self->_windowLevel, CFSTR("Window Level"));
  return v4;
}

- (unint64_t)windowLevel
{
  return self->_windowLevel;
}

@end
