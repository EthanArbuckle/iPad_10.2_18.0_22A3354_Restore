@implementation TIEmojiCharacterSet

void ____TIEmojiCharacterSet_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  if (!EmojiFoundationLibraryCore_frameworkLibrary)
  {
    EmojiFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!EmojiFoundationLibraryCore_frameworkLibrary)
    {
      v4 = 0;
      v3 = (void *)abort_report_np();
      free(v3);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3500], "_emojiCharacterSet", v4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "removeCharactersInRange:", 8205, 1);
  v2 = (void *)__TIEmojiCharacterSet___emojiCharacterSet;
  __TIEmojiCharacterSet___emojiCharacterSet = (uint64_t)v1;

}

@end
