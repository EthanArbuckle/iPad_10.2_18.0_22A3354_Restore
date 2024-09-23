@implementation LNPrimitiveValueType(ContentItem)

- (id)wf_contentItemClassWithAppBundleIdentifier:()ContentItem
{
  void *v1;

  if ((unint64_t)objc_msgSend(a1, "typeIdentifier") > 0xC)
  {
    v1 = 0;
  }
  else
  {
    objc_opt_class();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

@end
