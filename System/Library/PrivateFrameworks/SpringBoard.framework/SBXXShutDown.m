@implementation SBXXShutDown

void ___SBXXShutDown_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;

  objc_msgSend((id)SBApp, "restartManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x1E0CB3940];
  FBSProcessPrettyDescription();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("Request from process = %@"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shutdownForReason:", v2);

}

@end
