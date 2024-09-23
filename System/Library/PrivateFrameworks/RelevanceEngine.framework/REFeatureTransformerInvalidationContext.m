@implementation REFeatureTransformerInvalidationContext

- (void)invalidateAtDate:(id)a3
{
  objc_storeStrong((id *)&self->_invalidationDate, a3);
}

- (NSDate)invalidationDate
{
  return self->_invalidationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invalidationDate, 0);
}

@end
