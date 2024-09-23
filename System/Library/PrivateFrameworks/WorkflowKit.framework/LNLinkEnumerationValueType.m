@implementation LNLinkEnumerationValueType

uint64_t __132__LNLinkEnumerationValueType_ContentItem__wf_contentItemFromLinkValue_appBundleIdentifier_displayedBundleIdentifier_teamIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

@end
