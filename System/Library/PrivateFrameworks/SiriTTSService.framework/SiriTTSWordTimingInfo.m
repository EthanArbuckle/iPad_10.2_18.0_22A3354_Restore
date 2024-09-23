@implementation SiriTTSWordTimingInfo

+ (BOOL)supportsSecureCoding
{
  char v2;

  static WordTimingInfo.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static WordTimingInfo.supportsSecureCoding.setter(a3);
}

- (double)startTime
{
  return sub_19AD693E0();
}

- (void)setStartTime:(double)a3
{
  sub_19AD6943C(a3);
}

- (_NSRange)textRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  sub_19AD694D8();
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setTextRange:(_NSRange)a3
{
  sub_19AD69534(a3.location, a3.length);
}

- (SiriTTSWordTimingInfo)init
{
  return (SiriTTSWordTimingInfo *)WordTimingInfo.init()();
}

- (SiriTTSWordTimingInfo)initWithStartTiming:(double)a3 textRange:(_NSRange)a4
{
  return (SiriTTSWordTimingInfo *)WordTimingInfo.init(startTiming:textRange:)(a4.location, a4.length, a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SiriTTSWordTimingInfo *v5;

  v4 = a3;
  v5 = self;
  sub_19AD69760(v4);

}

- (SiriTTSWordTimingInfo)initWithCoder:(id)a3
{
  return (SiriTTSWordTimingInfo *)WordTimingInfo.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_19AD75A78(self, (uint64_t)a2, (void (*)(void))sub_19AD69A4C);
}

- (BOOL)isEqual:(id)a3
{
  return sub_19AD742E8(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))WordTimingInfo.isEqual(_:));
}

- (int64_t)hash
{
  return WordTimingInfo.hash.getter();
}

@end
