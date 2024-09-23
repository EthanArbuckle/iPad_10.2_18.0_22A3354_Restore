@implementation _BKMousePointerServerClientPerDisplay

- (BSInvalidatable)renderingAssertion
{
  return self->_renderingAssertion;
}

- (void)setRenderingAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_renderingAssertion, a3);
}

- (BSInvalidatable)modelUpdateAssertion
{
  return self->_modelUpdateAssertion;
}

- (void)setModelUpdateAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_modelUpdateAssertion, a3);
}

- (NSMutableDictionary)buttonDownRepositionUniqueIdentifierToAssertionMap
{
  return self->_buttonDownRepositionUniqueIdentifierToAssertionMap;
}

- (void)setButtonDownRepositionUniqueIdentifierToAssertionMap:(id)a3
{
  objc_storeStrong((id *)&self->_buttonDownRepositionUniqueIdentifierToAssertionMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonDownRepositionUniqueIdentifierToAssertionMap, 0);
  objc_storeStrong((id *)&self->_modelUpdateAssertion, 0);
  objc_storeStrong((id *)&self->_renderingAssertion, 0);
}

@end
