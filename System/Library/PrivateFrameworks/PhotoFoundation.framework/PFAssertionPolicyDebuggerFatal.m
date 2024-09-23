@implementation PFAssertionPolicyDebuggerFatal

- (void)notifyAssertion:(id)a3
{
  id v3;

  v3 = a3;
  if (+[PFAssertionHandler runningUnderDebugger](PFAssertionHandler, "runningUnderDebugger")
    && objc_msgSend(v3, "isFatal"))
  {
    __debugbreak();
  }

}

@end
