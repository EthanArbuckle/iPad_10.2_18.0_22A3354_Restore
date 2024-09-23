@implementation PNGRestrictOptions

void ___PNGRestrictOptions_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MessagesBlastDoorService")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.MessagesAirlockService")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.SubcredentialUIService.SubcredentialInvitationMessagesExtension")) & 1) != 0|| objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.CredentialSharingService.ShareableCredentialsMessagesExtension")))
  {
    v2 = *MEMORY[0x1E0CBD2A8];
    v5[0] = *MEMORY[0x1E0CBD288];
    v5[1] = v2;
    v6[0] = MEMORY[0x1E0C9AAB0];
    v6[1] = CFSTR("public.png");
    v5[2] = *MEMORY[0x1E0CBD1C8];
    v6[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)qword_1ECF22210;
    qword_1ECF22210 = v3;

  }
}

@end
