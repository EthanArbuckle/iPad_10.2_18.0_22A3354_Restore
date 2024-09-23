@implementation TIGetEnableMoltoCrescendoValue

uint64_t __TIGetEnableMoltoCrescendoValue_block_invoke()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  return objc_msgSend(v0, "_configureKey:domain:defaultValue:", CFSTR("EnableMoltoCrescendo"), CFSTR("com.apple.keyboard"), MEMORY[0x1E0C9AAA0]);
}

@end
