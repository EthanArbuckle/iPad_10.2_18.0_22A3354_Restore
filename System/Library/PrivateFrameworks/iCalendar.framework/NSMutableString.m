@implementation NSMutableString

uint64_t __49__NSMutableString_ICSWriter__controlCharacterSet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithRange:", 0, 9);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)controlCharacterSet_controlCharacterSet;
  controlCharacterSet_controlCharacterSet = v0;

  objc_msgSend((id)controlCharacterSet_controlCharacterSet, "addCharactersInRange:", 10, 22);
  return objc_msgSend((id)controlCharacterSet_controlCharacterSet, "addCharactersInRange:", 127, 1);
}

@end
