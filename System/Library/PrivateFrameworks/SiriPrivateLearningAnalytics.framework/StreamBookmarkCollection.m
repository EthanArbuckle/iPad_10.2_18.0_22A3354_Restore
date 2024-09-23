@implementation StreamBookmarkCollection

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_1EF99F011;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_1EF99F011 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  _TtC28SiriPrivateLearningAnalytics24StreamBookmarkCollection *v6;
  void *v7;
  id v8;

  type metadata accessor for StreamBookmark();
  v5 = a3;
  v6 = self;
  v7 = (void *)sub_1CB846A44();
  v8 = (id)_sSS28SiriPrivateLearningAnalyticsE10toNSObjectSo0F0CyF_0();
  objc_msgSend(v5, sel_encodeObject_forKey_, v7, v8);

}

- (_TtC28SiriPrivateLearningAnalytics24StreamBookmarkCollection)initWithCoder:(id)a3
{
  return (_TtC28SiriPrivateLearningAnalytics24StreamBookmarkCollection *)StreamBookmarkCollection.init(coder:)(a3);
}

- (_TtC28SiriPrivateLearningAnalytics24StreamBookmarkCollection)init
{
  _TtC28SiriPrivateLearningAnalytics24StreamBookmarkCollection *result;

  result = (_TtC28SiriPrivateLearningAnalytics24StreamBookmarkCollection *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
