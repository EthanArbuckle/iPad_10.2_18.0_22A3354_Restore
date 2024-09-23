@implementation SharedDefaults

void ___SharedDefaults_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_SharedDefaults__sharedDefaults;
  _SharedDefaults__sharedDefaults = v0;

}

@end
