@implementation SUContinuation

- (void)cancel
{
  -[SUContinuation sendErrorToDelegate:](self, "sendErrorToDelegate:", 0);
}

- (void)sendErrorToDelegate:(id)a3
{
  SUContinuation *v5;

  v5 = self;
  -[SUContinuationDelegate continuation:failedWithError:](self->_delegate, "continuation:failedWithError:", self, a3);
}

- (void)sendFinishToDelegate
{
  SUContinuation *v3;

  v3 = self;
  -[SUContinuationDelegate continuationFinished:](self->_delegate, "continuationFinished:", self);
}

- (SUContinuationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUContinuationDelegate *)a3;
}

@end
