@implementation FBSDisplayConfiguration(SBDisplayManagerCallbackLogging)

- (id)_sbLoggingDescription
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v7;
  id (*v8)(uint64_t);
  void *v9;
  id v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v7 = 3221225472;
  v8 = __81__FBSDisplayConfiguration_SBDisplayManagerCallbackLogging___sbLoggingDescription__block_invoke;
  v9 = &unk_1E8E9E820;
  v10 = v2;
  v11 = a1;
  v3 = v2;
  objc_msgSend(v3, "appendBodySectionWithName:multilinePrefix:block:", 0, CFSTR("\t"), &v6);
  objc_msgSend(v3, "build", v6, v7, v8, v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
