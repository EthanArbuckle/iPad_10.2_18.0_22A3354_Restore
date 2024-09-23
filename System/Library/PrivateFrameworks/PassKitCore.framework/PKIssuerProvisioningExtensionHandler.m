@implementation PKIssuerProvisioningExtensionHandler

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = (void *)MEMORY[0x19400CFE8]();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "setHandler:", self);
      objc_msgSend(v6, "connect");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid configuration for PKIssuerProvisioningExtensionHandler extension."));
      objc_msgSend(v6, "completeRequestReturningItems:completionHandler:", 0, 0);
    }
    objc_autoreleasePoolPop(v5);
    v4 = v6;
  }

}

- (void)statusWithCompletion:(void *)completion
{
  if (completion)
    (*((void (**)(void *, _QWORD))completion + 2))(completion, 0);
}

- (void)passEntriesWithCompletion:(void *)completion
{
  if (completion)
    (*((void (**)(void *, _QWORD))completion + 2))(completion, 0);
}

- (void)remotePassEntriesWithCompletion:(void *)completion
{
  if (completion)
    (*((void (**)(void *, _QWORD))completion + 2))(completion, 0);
}

- (void)generateAddPaymentPassRequestForPassEntryWithIdentifier:(NSString *)identifier configuration:(PKAddPaymentPassRequestConfiguration *)configuration certificateChain:(NSArray *)certificates nonce:(NSData *)nonce nonceSignature:(NSData *)nonceSignature completionHandler:(void *)completion
{
  if (completion)
    (*((void (**)(void *, _QWORD))completion + 2))(completion, 0);
}

@end
