@implementation PUImageViewExtraction

- (void)cancel
{
  -[PUImageViewExtraction _setCancelled:](self, "_setCancelled:", 1);
}

- (BOOL)_isCancelled
{
  return self->__cancelled;
}

- (void)_setCancelled:(BOOL)a3
{
  self->__cancelled = a3;
}

@end
