@implementation LNArrayValueType

id __113__LNArrayValueType_ContentItem__wf_contentCollectionFromLinkValue_appBundleIdentifier_displayedBundleIdentifier___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  objc_msgSend(v3, "valueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wf_contentItemFromLinkValue:appBundleIdentifier:displayedBundleIdentifier:teamIdentifier:", v3, a1[4], a1[5], a1[6]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
