@implementation TSWPIsPotentialTateChuYokoCharacter

uint64_t __TSWPIsPotentialTateChuYokoCharacter_block_invoke()
{
  id v0;
  uint64_t result;

  v0 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend(v0, "addCharactersInRange:", 48, 10);
  objc_msgSend(v0, "addCharactersInRange:", 65296, 10);
  objc_msgSend(v0, "addCharactersInRange:", 8352, 18);
  objc_msgSend(v0, "addCharactersInRange:", 36, 1);
  objc_msgSend(v0, "addCharactersInRange:", 162, 1);
  objc_msgSend(v0, "addCharactersInRange:", 163, 1);
  objc_msgSend(v0, "addCharactersInRange:", 164, 1);
  objc_msgSend(v0, "addCharactersInRange:", 165, 1);
  objc_msgSend(v0, "addCharactersInRange:", 2546, 1);
  objc_msgSend(v0, "addCharactersInRange:", 2547, 1);
  objc_msgSend(v0, "addCharactersInRange:", 3647, 1);
  objc_msgSend(v0, "addCharactersInRange:", 6107, 1);
  objc_msgSend(v0, "addCharactersInRange:", 65020, 1);
  objc_msgSend(v0, "addCharactersInRange:", 46, 1);
  objc_msgSend(v0, "addCharactersInRange:", 44, 1);
  objc_msgSend(v0, "addCharactersInRange:", 39, 1);
  objc_msgSend(v0, "addCharactersInRange:", 45, 1);
  objc_msgSend(v0, "addCharactersInRange:", 47, 1);
  objc_msgSend(v0, "addCharactersInRange:", 40, 1);
  objc_msgSend(v0, "addCharactersInRange:", 41, 1);
  objc_msgSend(v0, "addCharactersInRange:", 123, 1);
  objc_msgSend(v0, "addCharactersInRange:", 125, 1);
  objc_msgSend(v0, "addCharactersInRange:", 91, 1);
  result = objc_msgSend(v0, "addCharactersInRange:", 93, 1);
  TSWPIsPotentialTateChuYokoCharacter::_tateChuYokoCharacterSet = (uint64_t)v0;
  return result;
}

@end
