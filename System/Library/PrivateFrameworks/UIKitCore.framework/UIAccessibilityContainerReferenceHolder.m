@implementation UIAccessibilityContainerReferenceHolder

- (void)setReferencedContainer:(id)a3
{
  objc_storeWeak(&self->_referencedContainer, a3);
}

- (id)referencedContainer
{
  return objc_loadWeakRetained(&self->_referencedContainer);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_referencedContainer);
}

@end
