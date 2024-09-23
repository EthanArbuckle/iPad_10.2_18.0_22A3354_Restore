@implementation UIViewController(SUStorePageChildViewController)

- (uint64_t)displayedURL
{
  return 0;
}

- (double)documentBounds
{
  double result;

  if (!objc_msgSend(a1, "isViewLoaded"))
    return *MEMORY[0x24BDBF070];
  objc_msgSend((id)objc_msgSend(a1, "view"), "bounds");
  return result;
}

- (uint64_t)storePageProtocol
{
  return 0;
}

- (uint64_t)storePageProtocolDidChange
{
  return objc_msgSend((id)objc_msgSend(a1, "parentViewController"), "storePageProtocolDidChange");
}

- (uint64_t)viewIsReady
{
  return 1;
}

@end
