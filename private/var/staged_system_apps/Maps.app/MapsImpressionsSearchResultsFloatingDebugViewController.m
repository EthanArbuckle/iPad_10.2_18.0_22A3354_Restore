@implementation MapsImpressionsSearchResultsFloatingDebugViewController

+ (MapsImpressionsSearchResultsFloatingDebugViewController)sharedInstance
{
  if (qword_1014D43B8 != -1)
    dispatch_once(&qword_1014D43B8, &stru_1011E88D0);
  return (MapsImpressionsSearchResultsFloatingDebugViewController *)(id)qword_1014D43B0;
}

- (id)iconText
{
  return CFSTR("Search Impressions");
}

@end
