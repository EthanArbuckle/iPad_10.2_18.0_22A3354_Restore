@implementation NSString

uint64_t __47__NSString_VSSpeechService__vs_isCJKCharacter___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3780]);
  v1 = (void *)vs_isCJKCharacter____CJKCharacterSet;
  vs_isCJKCharacter____CJKCharacterSet = (uint64_t)v0;

  objc_msgSend((id)vs_isCJKCharacter____CJKCharacterSet, "addCharactersInRange:", 19968, 40959);
  objc_msgSend((id)vs_isCJKCharacter____CJKCharacterSet, "addCharactersInRange:", 13312, 19903);
  objc_msgSend((id)vs_isCJKCharacter____CJKCharacterSet, "addCharactersInRange:", 0x20000, 173791);
  objc_msgSend((id)vs_isCJKCharacter____CJKCharacterSet, "addCharactersInRange:", 173824, 177983);
  objc_msgSend((id)vs_isCJKCharacter____CJKCharacterSet, "addCharactersInRange:", 177984, 178207);
  objc_msgSend((id)vs_isCJKCharacter____CJKCharacterSet, "addCharactersInRange:", 178208, 183983);
  return objc_msgSend((id)vs_isCJKCharacter____CJKCharacterSet, "addCharactersInRange:", 183984, 191471);
}

@end
