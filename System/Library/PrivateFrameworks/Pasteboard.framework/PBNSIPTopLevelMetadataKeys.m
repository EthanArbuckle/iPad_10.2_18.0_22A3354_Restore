@implementation PBNSIPTopLevelMetadataKeys

void __PBNSIPTopLevelMetadataKeys_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[5];

  v2[4] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("com.apple.Pasteboard.teamData");
  v2[1] = CFSTR("com.apple.Pasteboard.estimatedDisplayedSize");
  v2[2] = CFSTR("com.apple.Pasteboard.preferredPresentationStyle");
  v2[3] = CFSTR("com.apple.Pasteboard.teamData");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_2;
  _MergedGlobals_2 = v0;

}

@end
