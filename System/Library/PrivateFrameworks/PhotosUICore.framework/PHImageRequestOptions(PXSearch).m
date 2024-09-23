@implementation PHImageRequestOptions(PXSearch)

+ (id)px_searchRequestOptions
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
  objc_msgSend(v0, "setNetworkAccessAllowed:", 1);
  return v0;
}

@end
