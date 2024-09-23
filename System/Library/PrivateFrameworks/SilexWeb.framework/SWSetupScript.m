@implementation SWSetupScript

- (NSString)identifier
{
  return (NSString *)CFSTR("setup");
}

- (WKUserScript)userScript
{
  return (WKUserScript *)objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x24BDFA900]), "initWithSource:injectionTime:forMainFrameOnly:", CFSTR("var applenews = {};"),
                                                           0,
                                                           1));
}

- (NSString)executableScript
{
  return self->executableScript;
}

- (BOOL)queueable
{
  return self->queueable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->executableScript, 0);
}

@end
