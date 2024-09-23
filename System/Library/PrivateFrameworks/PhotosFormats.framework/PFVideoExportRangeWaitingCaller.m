@implementation PFVideoExportRangeWaitingCaller

- (PFVideoExportRangeWaitingCaller)init
{
  PFVideoExportRangeWaitingCaller *v2;
  dispatch_semaphore_t v3;
  OS_dispatch_semaphore *semaphore;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFVideoExportRangeWaitingCaller;
  v2 = -[PFVideoExportRangeWaitingCaller init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_semaphore_create(0);
    semaphore = v2->_semaphore;
    v2->_semaphore = (OS_dispatch_semaphore *)v3;

  }
  return v2;
}

- (BOOL)canResumeForRange:(_NSRange)a3
{
  NSRange v4;

  v4 = NSIntersectionRange(self->_requestedRange, a3);
  return self->_requestedRange.location == v4.location && self->_requestedRange.length == v4.length;
}

- (void)waitWithTimeout:(unint64_t)a3
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, a3);
}

- (void)resume
{
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (OS_dispatch_semaphore)semaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (_NSRange)requestedRange
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_requestedRange, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setRequestedRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_requestedRange, &v3, 16, 1, 0);
}

- (BOOL)requestedRangeIsAvailable
{
  return self->_requestedRangeIsAvailable;
}

- (void)setRequestedRangeIsAvailable:(BOOL)a3
{
  self->_requestedRangeIsAvailable = a3;
}

- (BOOL)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
}

+ (id)waitingCallerWithRequestedRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;

  length = a3.length;
  location = a3.location;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setRequestedRange:", location, length);
  return v5;
}

@end
