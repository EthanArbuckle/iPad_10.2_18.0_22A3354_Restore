@implementation ICUserNotificationContext

- (void)clearRunLoop
{
  __CFRunLoopSource *runLoopSourceRef;

  runLoopSourceRef = self->_runLoopSourceRef;
  if (runLoopSourceRef)
  {
    CFRelease(runLoopSourceRef);
    self->_runLoopSourceRef = 0;
  }
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (__CFRunLoopSource)runLoopSourceRef
{
  return self->_runLoopSourceRef;
}

- (void)setRunLoopSourceRef:(__CFRunLoopSource *)a3
{
  self->_runLoopSourceRef = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
