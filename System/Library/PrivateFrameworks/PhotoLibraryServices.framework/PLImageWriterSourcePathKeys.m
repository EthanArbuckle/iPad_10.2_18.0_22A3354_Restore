@implementation PLImageWriterSourcePathKeys

void __PLImageWriterSourcePathKeys_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[7];

  v5[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D74F40];
  v5[0] = *MEMORY[0x1E0D74EC0];
  v5[1] = v0;
  v1 = *MEMORY[0x1E0D74E80];
  v5[2] = *MEMORY[0x1E0D74D80];
  v5[3] = v1;
  v2 = *MEMORY[0x1E0D74E60];
  v5[4] = *MEMORY[0x1E0D74E68];
  v5[5] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)PLImageWriterSourcePathKeys_keys;
  PLImageWriterSourcePathKeys_keys = v3;

}

@end
