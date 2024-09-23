@implementation AEMinimalTemplateStepIf

- (NSString)conditional
{
  return self->_conditional;
}

- (void)setConditional:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)negated
{
  return self->_negated;
}

- (void)setNegated:(BOOL)a3
{
  self->_negated = a3;
}

- (NSMutableArray)thenSteps
{
  return self->_thenSteps;
}

- (void)setThenSteps:(id)a3
{
  objc_storeStrong((id *)&self->_thenSteps, a3);
}

- (NSMutableArray)elseSteps
{
  return self->_elseSteps;
}

- (void)setElseSteps:(id)a3
{
  objc_storeStrong((id *)&self->_elseSteps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elseSteps, 0);
  objc_storeStrong((id *)&self->_thenSteps, 0);
  objc_storeStrong((id *)&self->_conditional, 0);
}

@end
