@implementation PCSGetPublicIdentitites

void __PCSGetPublicIdentitites_block_invoke()
{
  uint64_t v0;
  const void *v1;

  v0 = 0;
  PCSGetPublicIdentitites_dict = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v1 = (const void *)*MEMORY[0x1E0C9AE50];
  do
    CFDictionarySetValue((CFMutableDictionaryRef)PCSGetPublicIdentitites_dict, PCSGetPublicIdentitites_publicIdentities[v0++], v1);
  while (v0 != 7);
}

@end
