@implementation SoundsUserDefaults

void __SoundsUserDefaults_block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.preferences.sounds"));
  v1 = (void *)qword_1ECD7E470;
  qword_1ECD7E470 = v0;

}

@end
