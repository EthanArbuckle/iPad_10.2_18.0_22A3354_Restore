@implementation PGTitleSpecArgument

- (id)_resolvedStringWithMomentNodes:(id)a3 argumentEvaluationContext:(id)a4
{
  return 0;
}

- (id)_resolvedStringWithMomentNodes:(id)a3 features:(id)a4 argumentEvaluationContext:(id)a5
{
  return 0;
}

- (BOOL)requiresInput
{
  return self->_requiresInput;
}

- (void)setRequiresInput:(BOOL)a3
{
  self->_requiresInput = a3;
}

- (id)inputVariable
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setInputVariable:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_inputVariable, 0);
}

@end
