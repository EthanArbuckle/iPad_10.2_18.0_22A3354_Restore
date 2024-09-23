@implementation TSWPParagraphBreakingCharacterSet

void __TSWPParagraphBreakingCharacterSet_block_invoke()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend(v0, "addCharactersInRange:", 10, 1);
  objc_msgSend(v0, "addCharactersInRange:", 13, 1);
  objc_msgSend(v0, "addCharactersInRange:", 8233, 1);
  objc_msgSend(v0, "addCharactersInRange:", 11, 1);
  objc_msgSend(v0, "addCharactersInRange:", 5, 1);
  objc_msgSend(v0, "addCharactersInRange:", 12, 1);
  objc_msgSend(v0, "addCharactersInRange:", 6, 1);
  objc_msgSend(v0, "addCharactersInRange:", 15, 1);
  objc_msgSend(v0, "addCharactersInRange:", 4, 1);
  TSWPParagraphBreakingCharacterSet::sParagraphBreakingCharacterSet = objc_msgSend(v0, "copy");

}

@end
