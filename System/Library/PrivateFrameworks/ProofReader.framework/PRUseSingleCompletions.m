@implementation PRUseSingleCompletions

uint64_t __PRUseSingleCompletions_block_invoke()
{
  uint64_t result;

  PRUseSingleCompletions_allowList = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", &unk_1EA8E7258);
  result = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", &unk_1EA8E7270);
  PRUseSingleCompletions_denyList = result;
  return result;
}

@end
