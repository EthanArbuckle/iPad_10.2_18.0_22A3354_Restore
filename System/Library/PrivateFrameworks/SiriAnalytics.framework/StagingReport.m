@implementation StagingReport

- (int)addedCount
{
  int result;

  StagingReport.addedCount.getter();
  return result;
}

- (void)setAddedCount:(int)a3
{
  StagingReport.addedCount.setter(a3);
}

- (int)missingTimestampCount
{
  int result;

  StagingReport.missingTimestampCount.getter();
  return result;
}

- (void)setMissingTimestampCount:(int)a3
{
  StagingReport.missingTimestampCount.setter(a3);
}

- (int)result
{
  int result;

  StagingReport.result.getter();
  return result;
}

- (void)setResult:(int)a3
{
  StagingReport.result.setter(a3);
}

- (_TtC13SiriAnalytics13StagingReport)initWithResult:(int)a3
{
  return (_TtC13SiriAnalytics13StagingReport *)sub_1A027710C(a3);
}

+ (id)failed
{
  id v2;

  swift_getObjCClassMetadata();
  sub_1A0277190();
  return v2;
}

+ (id)timedOut
{
  id v2;

  swift_getObjCClassMetadata();
  sub_1A02771D8();
  return v2;
}

+ (id)terminated
{
  id v2;

  swift_getObjCClassMetadata();
  sub_1A0277220();
  return v2;
}

- (void)added
{
  sub_1A02772AC(&OBJC_IVAR____TtC13SiriAnalytics13StagingReport_addedCount);
}

- (void)missingTimestamp
{
  sub_1A02772AC(&OBJC_IVAR____TtC13SiriAnalytics13StagingReport_missingTimestampCount);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static StagingReport.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static StagingReport.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13SiriAnalytics13StagingReport *v5;

  v4 = a3;
  v5 = self;
  StagingReport.encode(with:)((NSCoder)v4);

}

- (_TtC13SiriAnalytics13StagingReport)initWithCoder:(id)a3
{
  return (_TtC13SiriAnalytics13StagingReport *)StagingReport.init(coder:)(a3);
}

- (_TtC13SiriAnalytics13StagingReport)init
{
  StagingReport.init()();
}

@end
