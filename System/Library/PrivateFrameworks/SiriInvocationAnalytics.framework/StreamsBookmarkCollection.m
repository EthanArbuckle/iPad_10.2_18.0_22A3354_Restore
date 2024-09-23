@implementation StreamsBookmarkCollection

+ (BOOL)supportsSecureCoding
{
  char v2;

  static StreamsBookmarkCollection.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static StreamsBookmarkCollection.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC23SiriInvocationAnalytics25StreamsBookmarkCollection *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  v5 = self;
  v6 = OUTLINED_FUNCTION_30_3();
  StreamsBookmarkCollection.encode(with:)((NSCoder)v6);

  OUTLINED_FUNCTION_3_9(v7);
}

- (_TtC23SiriInvocationAnalytics25StreamsBookmarkCollection)initWithCoder:(id)a3
{
  _TtC23SiriInvocationAnalytics25StreamsBookmarkCollection *result;

  StreamsBookmarkCollection.init(coder:)(a3);
  OUTLINED_FUNCTION_17_0();
  return result;
}

- (_TtC23SiriInvocationAnalytics25StreamsBookmarkCollection)init
{
  StreamsBookmarkCollection.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
