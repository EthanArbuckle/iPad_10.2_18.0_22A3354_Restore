@implementation ShareSheetIsMusic

void ___ShareSheetIsMusic_block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v0) = objc_msgSend(v1, "isEqualToString:", CFSTR("Music"));
  _ShareSheetIsMusic_IsMusic = (char)v0;
}

@end
