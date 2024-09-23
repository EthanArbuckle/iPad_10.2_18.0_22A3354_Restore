@implementation PUSectionedGridLayoutInvalidationContext

- (id)description
{
  void *v3;
  _BOOL4 v4;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PUSectionedGridLayoutInvalidationContext;
  -[PUSectionedGridLayoutInvalidationContext description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[UICollectionViewLayoutInvalidationContext invalidateDataSourceCounts](self, "invalidateDataSourceCounts");
  v5 = CFSTR("N");
  if (v4)
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  if (self->_invalidateForVerticalScroll)
    v5 = CFSTR("Y");
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" invalidateDataSourceCounts: %@, invalidateForVerticalScroll: %@"), v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)invalidateForVerticalScroll
{
  return self->_invalidateForVerticalScroll;
}

- (void)setInvalidateForVerticalScroll:(BOOL)a3
{
  self->_invalidateForVerticalScroll = a3;
}

- (BOOL)sectioningIsPreserved
{
  return self->_sectioningIsPreserved;
}

- (void)setSectioningIsPreserved:(BOOL)a3
{
  self->_sectioningIsPreserved = a3;
}

- (BOOL)samplingIsPreserved
{
  return self->_samplingIsPreserved;
}

- (void)setSamplingIsPreserved:(BOOL)a3
{
  self->_samplingIsPreserved = a3;
}

- (BOOL)invalidationHasBeenRedispatched
{
  return self->_invalidationHasBeenRedispatched;
}

- (void)setInvalidationHasBeenRedispatched:(BOOL)a3
{
  self->_invalidationHasBeenRedispatched = a3;
}

@end
