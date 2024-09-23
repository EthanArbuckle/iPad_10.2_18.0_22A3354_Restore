@implementation PNTripFetcherWrapper

+ (BOOL)supportsCollection:(id)a3
{
  return +[PNTripFetcher supportsCollection:](PNTripFetcher, "supportsCollection:", a3);
}

@end
