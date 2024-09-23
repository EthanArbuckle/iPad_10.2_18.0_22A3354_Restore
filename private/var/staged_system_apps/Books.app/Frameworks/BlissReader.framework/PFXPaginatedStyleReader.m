@implementation PFXPaginatedStyleReader

- (id)supportedMediaTypes
{
  return +[PFXStylesheet paginatedMediaTypes](PFXStylesheet, "paginatedMediaTypes");
}

@end
