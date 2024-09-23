@implementation PXLayoutPerformerCacheEntry

- (PXLayoutPerformer)performer
{
  return self->_performer;
}

- (void)setPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_performer, a3);
}

- (unint64_t)reentryCount
{
  return self->_reentryCount;
}

- (void)setReentryCount:(unint64_t)a3
{
  self->_reentryCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_performer, 0);
}

@end
