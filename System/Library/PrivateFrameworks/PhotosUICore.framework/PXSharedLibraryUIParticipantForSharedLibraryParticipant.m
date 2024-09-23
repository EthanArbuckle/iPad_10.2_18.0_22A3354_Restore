@implementation PXSharedLibraryUIParticipantForSharedLibraryParticipant

void __PXSharedLibraryUIParticipantForSharedLibraryParticipant_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97218], "descriptorForRequiredKeysForStyle:", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x1E0C966A8];
  v5[0] = v0;
  v5[1] = v1;
  v2 = *MEMORY[0x1E0C96890];
  v5[2] = *MEMORY[0x1E0C967C0];
  v5[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)PXSharedLibraryUIParticipantForSharedLibraryParticipant_keys;
  PXSharedLibraryUIParticipantForSharedLibraryParticipant_keys = v3;

}

@end
