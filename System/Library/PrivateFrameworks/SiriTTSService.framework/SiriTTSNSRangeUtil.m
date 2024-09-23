@implementation SiriTTSNSRangeUtil

- (SiriTTSNSRangeUtil)init
{
  return (SiriTTSNSRangeUtil *)sub_19AD8BE60();
}

+ (_NSRange)mapUtf8RangeToUtf16:(_NSRange)a3 inText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = sub_19AE55448();
  v8 = static NSRangeUtil.mapUtf8RangeToUtf16(_:inText:)(location, length, v6, v7);
  v10 = v9;
  swift_bridgeObjectRelease();
  v11 = v8;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

@end
