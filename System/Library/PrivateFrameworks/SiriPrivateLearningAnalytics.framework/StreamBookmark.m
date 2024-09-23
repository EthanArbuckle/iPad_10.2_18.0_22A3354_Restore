@implementation StreamBookmark

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EF99F010;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EF99F010 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC28SiriPrivateLearningAnalytics14StreamBookmark *v5;

  v4 = a3;
  v5 = self;
  sub_1CB7C6D84(v4);

}

- (_TtC28SiriPrivateLearningAnalytics14StreamBookmark)initWithCoder:(id)a3
{
  return (_TtC28SiriPrivateLearningAnalytics14StreamBookmark *)StreamBookmark.init(coder:)(a3);
}

- (NSString)debugDescription
{
  _TtC28SiriPrivateLearningAnalytics14StreamBookmark *v2;
  void *v3;

  v2 = self;
  sub_1CB7C78BC();

  v3 = (void *)_sSS28SiriPrivateLearningAnalyticsE10toNSObjectSo0F0CyF_0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC28SiriPrivateLearningAnalytics14StreamBookmark)init
{
  _TtC28SiriPrivateLearningAnalytics14StreamBookmark *result;

  result = (_TtC28SiriPrivateLearningAnalytics14StreamBookmark *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end
