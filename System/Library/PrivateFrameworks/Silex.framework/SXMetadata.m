@implementation SXMetadata

- (int64_t)suppressRecommendedReadsWithValue:(id)a3 withType:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 == 2)
    return objc_msgSend(a3, "BOOLValue", v4, v5);
  else
    return -1;
}

@end
