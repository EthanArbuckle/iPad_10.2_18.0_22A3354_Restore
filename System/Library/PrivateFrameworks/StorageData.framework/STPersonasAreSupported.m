@implementation STPersonasAreSupported

void __STPersonasAreSupported_block_invoke()
{
  void *v0;
  char v1;

  objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  STPersonasAreSupported_personasSupported = objc_msgSend(v0, "isMultiUser") ^ 1;

  v1 = STPersonasAreSupported_personasSupported;
  if (STPersonasAreSupported_personasSupported)
    v1 = MGGetBoolAnswer() ^ 1;
  STPersonasAreSupported_personasSupported = v1;
}

@end
