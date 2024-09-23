@implementation WKUserContentController(SafariSharedUIExtras)

+ (id)safari_userContentController
{
  if (+[WKUserContentController(SafariSharedUIExtras) safari_userContentController]::once != -1)
    dispatch_once(&+[WKUserContentController(SafariSharedUIExtras) safari_userContentController]::once, &__block_literal_global_71);
  return (id)+[WKUserContentController(SafariSharedUIExtras) safari_userContentController]::controller;
}

+ (id)safari_privateBrowsingUserContentController
{
  if (+[WKUserContentController(SafariSharedUIExtras) safari_privateBrowsingUserContentController]::once != -1)
    dispatch_once(&+[WKUserContentController(SafariSharedUIExtras) safari_privateBrowsingUserContentController]::once, &__block_literal_global_1);
  return (id)+[WKUserContentController(SafariSharedUIExtras) safari_privateBrowsingUserContentController]::controller;
}

+ (id)safari_readingListFetcherUserContentController
{
  if (+[WKUserContentController(SafariSharedUIExtras) safari_readingListFetcherUserContentController]::once != -1)
    dispatch_once(&+[WKUserContentController(SafariSharedUIExtras) safari_readingListFetcherUserContentController]::once, &__block_literal_global_3_1);
  return (id)+[WKUserContentController(SafariSharedUIExtras) safari_readingListFetcherUserContentController]::controller;
}

+ (id)safari_readerUserContentController
{
  if (+[WKUserContentController(SafariSharedUIExtras) safari_readerUserContentController]::once != -1)
    dispatch_once(&+[WKUserContentController(SafariSharedUIExtras) safari_readerUserContentController]::once, &__block_literal_global_2_2);
  return (id)+[WKUserContentController(SafariSharedUIExtras) safari_readerUserContentController]::controller;
}

+ (id)safari_webExtensionUserContentController
{
  if (+[WKUserContentController(SafariSharedUIExtras) safari_webExtensionUserContentController]::once != -1)
    dispatch_once(&+[WKUserContentController(SafariSharedUIExtras) safari_webExtensionUserContentController]::once, &__block_literal_global_4_2);
  return (id)+[WKUserContentController(SafariSharedUIExtras) safari_webExtensionUserContentController]::controller;
}

@end
