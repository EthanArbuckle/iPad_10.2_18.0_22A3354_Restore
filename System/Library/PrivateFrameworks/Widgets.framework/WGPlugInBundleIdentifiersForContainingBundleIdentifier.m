@implementation WGPlugInBundleIdentifiersForContainingBundleIdentifier

void __WGPlugInBundleIdentifiersForContainingBundleIdentifier_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "bundleIdentifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v3);

}

@end
