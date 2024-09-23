@implementation PRTagger

- (PRTagger)initWithTagSchemes:(id)a3 orthoIndex:(unint64_t)a4
{
  PRTagger *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRTagger;
  result = -[NLTagger initWithTagSchemes:](&v6, sel_initWithTagSchemes_, a3);
  if (result)
    result->_orthoIndex = a4;
  return result;
}

- (void)setOrthoIndex:(unint64_t)a3
{
  self->_orthoIndex = a3;
}

- (unint64_t)orthoIndex
{
  return self->_orthoIndex;
}

@end
