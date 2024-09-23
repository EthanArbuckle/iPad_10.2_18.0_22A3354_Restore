@implementation SBUserNotificationAuthenticator

void ___SBUserNotificationAuthenticator_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0D22990]), "initWithEntitlement:additionalCredentials:", CFSTR("com.apple.springboard.CFUserNotification"), 3);
  v1 = (void *)_SBUserNotificationAuthenticator___authenticator;
  _SBUserNotificationAuthenticator___authenticator = v0;

}

@end
