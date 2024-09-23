@implementation LNSearchCriteriaValueType(ContentItem)

- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  if (objc_msgSend(a1, "typeIdentifier"))
    return 0;
  objc_opt_class();
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
