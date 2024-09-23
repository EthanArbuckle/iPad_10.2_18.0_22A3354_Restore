@implementation PFXPaginatedLinkReader

- (id)supportedCssMediaTypes
{
  return +[PFXStylesheet paginatedMediaTypes](PFXStylesheet, "paginatedMediaTypes");
}

@end
