@implementation ACMRequest

+ (id)authenticationRequest
{
  -[ACMAppleConnect private](+[ACMAppleConnect sharedInstance](ACMAppleConnect, "sharedInstance"), "private");
  return (id)objc_msgSend(+[ACMExternalAppleConnectImplComponents components](ACMExternalAppleConnectImplComponents, "components"), "createAuthenticationRequest");
}

+ (id)ticketVerificationRequest
{
  return (id)objc_msgSend(+[ACMExternalAppleConnectImplComponents components](ACMExternalAppleConnectImplComponents, "components"), "createTicketVerificationRequest");
}

@end
