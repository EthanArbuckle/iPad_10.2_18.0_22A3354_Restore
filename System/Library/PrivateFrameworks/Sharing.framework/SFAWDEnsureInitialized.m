@implementation SFAWDEnsureInitialized

void __SFAWDEnsureInitialized_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)getAWDServerConnectionClass[0]()), "initWithComponentId:", 64);
  v1 = (void *)gSFAWDServerConnection;
  gSFAWDServerConnection = v0;

  if (gSFAWDServerConnection)
  {
    if (gLogCategory_Report <= 40 && (gLogCategory_Report != -1 || _LogCategory_Initialize()))
LABEL_7:
      LogPrintF();
  }
  else if (gLogCategory_Report <= 50 && (gLogCategory_Report != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
}

@end
