@implementation UIFirstTypeIdentifierEligibleForMassStorage

void ___UIFirstTypeIdentifierEligibleForMassStorage_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[9];

  v6[8] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CEC4B8];
  v6[0] = *MEMORY[0x1E0CEC498];
  v6[1] = v0;
  v1 = *MEMORY[0x1E0CEC448];
  v6[2] = *MEMORY[0x1E0CEC4D0];
  v6[3] = v1;
  v2 = *MEMORY[0x1E0CEC4D8];
  v6[4] = *MEMORY[0x1E0CEC678];
  v6[5] = v2;
  v3 = *MEMORY[0x1E0CEC4C0];
  v6[6] = *MEMORY[0x1E0CEC4A8];
  v6[7] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 8);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_MergedGlobals_1282;
  _MergedGlobals_1282 = v4;

}

@end
