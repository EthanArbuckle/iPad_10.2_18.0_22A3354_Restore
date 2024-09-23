@implementation PKContinuityPaymentServiceInterface

void __PKContinuityPaymentServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE238D40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF223E8;
  qword_1ECF223E8 = v0;

  v2 = (void *)qword_1ECF223E8;
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_didReceiveUpdatedPaymentDevices_, 0, 0);

}

@end
