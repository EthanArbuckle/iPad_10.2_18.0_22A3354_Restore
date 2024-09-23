@implementation TextInputUIBundle

void __TextInputUIBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/TextInputUI.framework"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECD7EA68;
  qword_1ECD7EA68 = v0;

}

@end
