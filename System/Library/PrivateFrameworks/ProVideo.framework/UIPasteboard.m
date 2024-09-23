@implementation UIPasteboard

uint64_t __62__UIPasteboard_PCXPasteboardAdditions__pcxPasteboardWithName___block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0CEA810], "pasteboardWithUniqueName");
  pcxPasteboardWithName__s_utPasteboard = result;
  return result;
}

@end
