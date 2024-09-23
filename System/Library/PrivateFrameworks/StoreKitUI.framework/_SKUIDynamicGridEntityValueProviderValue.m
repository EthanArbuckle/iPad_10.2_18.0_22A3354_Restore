@implementation _SKUIDynamicGridEntityValueProviderValue

- (IKEntityValueProviding)entityValueProvider
{
  return self->_entityValueProvider;
}

- (void)setEntityValueProvider:(id)a3
{
  objc_storeStrong((id *)&self->_entityValueProvider, a3);
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityValueProvider, 0);
}

@end
