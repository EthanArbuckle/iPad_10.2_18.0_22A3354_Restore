@implementation MapsImpressionsPlaceCardFloatingDebugViewController

+ (MapsImpressionsPlaceCardFloatingDebugViewController)sharedInstance
{
  if (qword_1014D43A8 != -1)
    dispatch_once(&qword_1014D43A8, &stru_1011E88B0);
  return (MapsImpressionsPlaceCardFloatingDebugViewController *)(id)qword_1014D43A0;
}

- (id)iconText
{
  return CFSTR("Placecard Impressions");
}

@end
