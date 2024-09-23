@implementation SBXXDeactivateReachability

void ___SBXXDeactivateReachability_block_invoke()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0DABEA8];
  v6[0] = &unk_1E91D0248;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0DA9D78];
  v2 = v0;
  objc_msgSend(v1, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "emitEvent:withPayload:", 8, v2);

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deactivateReachability");

}

@end
