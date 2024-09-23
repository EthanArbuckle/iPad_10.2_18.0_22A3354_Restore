@implementation PDDeviceRegistrationServiceInterface

void __PDDeviceRegistrationServiceInterface_block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE2969E8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_255;
  _MergedGlobals_255 = v0;

  v2 = (void *)_MergedGlobals_255;
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  v4 = objc_opt_class();
  v5 = (id)objc_msgSend(v3, "initWithObjects:", v4, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_performRegistrationForMemberOfRegions_withReason_completion_, 0, 0);

}

@end
