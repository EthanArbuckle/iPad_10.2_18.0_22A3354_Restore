@implementation PXBaseDisplayAssetCollection

- (BOOL)isEnriched
{
  return 0;
}

- (BOOL)isEnrichmentComplete
{
  return 1;
}

- (double)promotionScore
{
  return 0.0;
}

- (BOOL)isAggregation
{
  return 0;
}

- (BOOL)isRecent
{
  return 0;
}

- (unsigned)px_highlightEnrichmentState
{
  return 0;
}

- (int64_t)px_highlightKind
{
  return -1;
}

- (NSString)uuid
{
  return (NSString *)CFSTR("base");
}

- (NSString)localizedSubtitle
{
  return 0;
}

- (NSString)localizedDebugDescription
{
  return 0;
}

- (NSArray)localizedLocationNames
{
  return 0;
}

- (NSString)localizedDateDescription
{
  return 0;
}

- (NSString)localizedShortDateDescription
{
  return 0;
}

- (NSString)localizedSmartDescription
{
  return 0;
}

- (id)localizedDateDescriptionWithOptions:(unint64_t)a3
{
  return 0;
}

- (unint64_t)estimatedAssetCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

@end
