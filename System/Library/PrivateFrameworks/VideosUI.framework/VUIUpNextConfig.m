@implementation VUIUpNextConfig

- (VUIUpNextConfig)init
{
  VUIUpNextConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUIUpNextConfig;
  result = -[VUIUpNextConfig init](&v3, sel_init);
  if (result)
  {
    *(int64x2_t *)&result->_upNextCallDelayAfterMarkAsWatched = vdupq_n_s64(0x1F4uLL);
    result->_shouldUpdateOutboundAfterRemoveFromUpNext = 0;
  }
  return result;
}

- (void)setUpNextRefreshCallDelayAfterRemoveFromUpNext:(unint64_t)a3
{
  self->_upNextRefreshCallDelayAfterRemoveFromUpNext = a3;
}

- (void)setUpNextCallDelayAfterMarkAsWatched:(unint64_t)a3
{
  self->_upNextCallDelayAfterMarkAsWatched = a3;
}

- (void)setShouldUpdateOutboundAfterRemoveFromUpNext:(BOOL)a3
{
  self->_shouldUpdateOutboundAfterRemoveFromUpNext = a3;
}

- (unint64_t)upNextCallDelayAfterMarkAsWatched
{
  return self->_upNextCallDelayAfterMarkAsWatched;
}

- (unint64_t)upNextRefreshCallDelayAfterRemoveFromUpNext
{
  return self->_upNextRefreshCallDelayAfterRemoveFromUpNext;
}

- (BOOL)shouldUpdateOutboundAfterRemoveFromUpNext
{
  return self->_shouldUpdateOutboundAfterRemoveFromUpNext;
}

@end
