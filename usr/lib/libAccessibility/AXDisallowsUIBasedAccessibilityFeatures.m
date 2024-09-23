@implementation AXDisallowsUIBasedAccessibilityFeatures

void __AXDisallowsUIBasedAccessibilityFeatures_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processName");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("druid")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("pointeruid")) & 1) != 0
    || objc_msgSend(v1, "isEqualToString:", CFSTR("nsattributedstringagent")))
  {
    AXDisallowsUIBasedAccessibilityFeatures_DisallowedForClient = 1;
  }

}

@end
