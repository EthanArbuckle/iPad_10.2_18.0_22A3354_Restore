@implementation _TUIStyleReferenceElement

- (_TUIStyleReferenceElement)initWithStyleReference:(id)a3
{
  _TUIStyleReferenceElement *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_TUIStyleReferenceElement;
  result = -[_TUIStyleReferenceElement init](&v5, "init");
  if (result)
    result->_styleReference = ($36225AD0C84429F3A125462FE9B8891F)a3;
  return result;
}

- ($0F674443F67B1BBEFA3E91226872A32D)styleReference
{
  return ($0F674443F67B1BBEFA3E91226872A32D)self->_styleReference;
}

@end
