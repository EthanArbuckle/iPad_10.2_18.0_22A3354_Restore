@implementation SBHIDIsAccessibilitySenderID

void __SBHIDIsAccessibilitySenderID_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E91CE008);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SBHIDIsAccessibilitySenderID_accessibilitySenderIDs;
  SBHIDIsAccessibilitySenderID_accessibilitySenderIDs = v0;

}

@end
