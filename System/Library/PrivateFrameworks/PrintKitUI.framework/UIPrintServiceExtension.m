@implementation UIPrintServiceExtension

- (NSArray)printerDestinationsForPrintInfo:(UIPrintInfo *)printInfo
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (void)_authenticatedRequestForRequest:(id)a3 challengeResponse:(id)a4 reply:(id)a5
{
  (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (void)_apOp:(id)a3 reply:(id)a4
{
  (*((void (**)(id, _QWORD))a4 + 2))(a4, 0);
}

@end
