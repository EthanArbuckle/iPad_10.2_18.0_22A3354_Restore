@implementation StreamsBookmark

+ (BOOL)supportsSecureCoding
{
  char v2;

  static StreamsBookmark.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static StreamsBookmark.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC23SiriInvocationAnalytics15StreamsBookmark *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = OUTLINED_FUNCTION_30_3();
  StreamsBookmark.encode(with:)((NSCoder)v6);

  OUTLINED_FUNCTION_3_9(v7);
}

- (_TtC23SiriInvocationAnalytics15StreamsBookmark)initWithCoder:(id)a3
{
  _TtC23SiriInvocationAnalytics15StreamsBookmark *result;

  StreamsBookmark.init(coder:)(a3);
  OUTLINED_FUNCTION_17_0();
  return result;
}

- (NSString)debugDescription
{
  _TtC23SiriInvocationAnalytics15StreamsBookmark *v2;
  void *v3;

  v2 = self;
  StreamsBookmark.debugDescription.getter();

  v3 = (void *)sub_2464F8B64();
  OUTLINED_FUNCTION_2();
  return (NSString *)v3;
}

- (_TtC23SiriInvocationAnalytics15StreamsBookmark)init
{
  StreamsBookmark.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
