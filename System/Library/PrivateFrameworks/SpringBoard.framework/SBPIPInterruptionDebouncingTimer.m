@implementation SBPIPInterruptionDebouncingTimer

- (SBPIPInterruptionAssertion)debouncedAssertion
{
  return (SBPIPInterruptionAssertion *)objc_loadWeakRetained((id *)&self->_debouncedAssertion);
}

- (void)setDebouncedAssertion:(id)a3
{
  objc_storeWeak((id *)&self->_debouncedAssertion, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_debouncedAssertion);
}

@end
