@implementation _TVStackViewFlowLayoutInvalidationContext

- (BOOL)invalidateSectionMetrics
{
  return self->_invalidateSectionMetrics;
}

- (void)setInvalidateSectionMetrics:(BOOL)a3
{
  self->_invalidateSectionMetrics = a3;
}

@end
