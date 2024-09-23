@implementation TUCTServerConnection

void __TUCTServerConnection_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  TUCTServerConnection_sConnection = _CTServerConnectionCreateOnTargetQueue();
  if (!TUCTServerConnection_sConnection)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CTServerConnectionRef  _Nonnull TUCTServerConnection(void)_block_invoke");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("TUUtilities.m"), 467, CFSTR("Unable to get CT server connection"));

  }
}

@end
