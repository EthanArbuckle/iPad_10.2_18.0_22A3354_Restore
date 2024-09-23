@implementation IsWhitespaceCharacter

id __IsWhitespaceCharacter_block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  IsWhitespaceCharacter::sWhitespaceCharacterSet = (uint64_t)result;
  return result;
}

@end
