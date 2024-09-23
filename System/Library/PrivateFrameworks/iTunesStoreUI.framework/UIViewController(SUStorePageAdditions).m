@implementation UIViewController(SUStorePageAdditions)

- (uint64_t)handleStoreFailureWithError:()SUStorePageAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "parentViewController"), "handleStoreFailureWithError:", a3);
}

- (uint64_t)hasDisplayableContent
{
  return 1;
}

- (uint64_t)loadMoreWithURL:()SUStorePageAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "parentViewController"), "loadMoreWithURL:", a3);
}

- (uint64_t)pushStorePage:()SUStorePageAdditions withTarget:animated:
{
  return objc_msgSend((id)objc_msgSend(a1, "parentViewController"), "pushStorePage:withTarget:animated:", a3, a4, a5);
}

- (uint64_t)reloadWithURLRequestProperties:()SUStorePageAdditions
{
  return objc_msgSend((id)objc_msgSend(a1, "parentViewController"), "reloadWithURLRequestProperties:", a3);
}

@end
