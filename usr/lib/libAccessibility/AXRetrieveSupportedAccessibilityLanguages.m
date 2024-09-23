@implementation AXRetrieveSupportedAccessibilityLanguages

uint64_t __AXRetrieveSupportedAccessibilityLanguages_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __AXRetrieveSupportedAccessibilityLanguages_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  AXCLanguageToLocales();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "allValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v1);

  objc_msgSend(v5, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingComparator:", &__block_literal_global_1439);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)AXRetrieveSupportedAccessibilityLanguages_Langauges;
  AXRetrieveSupportedAccessibilityLanguages_Langauges = v3;

}

@end
