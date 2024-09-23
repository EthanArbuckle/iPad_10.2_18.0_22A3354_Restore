@implementation PXImageExtraction

- (void)cancel
{
  -[PXImageExtraction _setCancelled:](self, "_setCancelled:", 1);
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)_setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

@end
