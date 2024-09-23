@implementation UIKeyboardIsFiveRowKeyboard

void __UIKeyboardIsFiveRowKeyboard_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("Armenian"), CFSTR("Kazakh-Cyrillic"), CFSTR("Khmer"), CFSTR("Lao"), CFSTR("Thai"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7EAF8;
  qword_1ECD7EAF8 = v0;

}

@end
