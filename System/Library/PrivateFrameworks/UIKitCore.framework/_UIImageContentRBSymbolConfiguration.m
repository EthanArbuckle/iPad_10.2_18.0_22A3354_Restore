@implementation _UIImageContentRBSymbolConfiguration

- (_UIImageContentRBSymbolConfiguration)init
{
  _UIImageContentRBSymbolConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIImageContentRBSymbolConfiguration;
  result = -[_UIImageContentRBSymbolConfiguration init](&v3, sel_init);
  if (result)
    result->_variableValue = INFINITY;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_styleResolverForMultiplyColor, 0);
  objc_destroyWeak((id *)&self->_vectorGlyph);
}

@end
