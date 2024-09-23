@implementation PCSServiceItemsGetTooRolledServiceTypes

void ___PCSServiceItemsGetTooRolledServiceTypes_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[17];

  v3[16] = *MEMORY[0x1E0C80C00];
  v3[0] = kPCSBTCloudPairing;
  v3[1] = CFSTR("IdentityServicesEngram");
  v3[2] = kPCSServiceKeyboardServicesSecure;
  v3[3] = kPCSServiceRoutined;
  v3[4] = kPCSServiceHealthSync;
  v3[5] = kPCSServiceSiriProfile;
  v3[6] = kPCSServiceSiriKnowledge;
  v3[7] = kPCSServiceKnowledgestore;
  v3[8] = kPCSServiceWalletPaymentServices;
  v3[9] = kPCSServiceNewsContent;
  v3[10] = kPCSBTCloudPairing;
  v3[11] = kPCSMessagesDevelopment;
  v3[12] = kPCSMessages;
  v3[13] = kPCSIDServicesEngram;
  v3[14] = kPCSCoreSuggestionsPseudoEvents;
  v3[15] = kPCSAccessibilityVOPronunciation;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 16);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_PCSServiceItemsGetTooRolledServiceTypes_tooRolled;
  _PCSServiceItemsGetTooRolledServiceTypes_tooRolled = v1;

}

@end
