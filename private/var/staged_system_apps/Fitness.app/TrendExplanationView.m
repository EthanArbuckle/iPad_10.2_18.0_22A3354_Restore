@implementation TrendExplanationView

- (_TtC10FitnessApp20TrendExplanationView)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp20TrendExplanationView *)sub_100588568(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp20TrendExplanationView)initWithCoder:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  _TtC10FitnessApp20TrendExplanationView *v7;
  objc_class *v8;
  uint64_t v9;

  v4 = OBJC_IVAR____TtC10FitnessApp20TrendExplanationView_textView;
  v5 = type metadata accessor for TrendsFooterTextView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v5));
  v7 = self;
  v8 = (objc_class *)objc_msgSend(v6, "init");
  *(Class *)((char *)&self->super.super.super.isa + v4) = v8;

  v9 = type metadata accessor for TrendExplanationView();
  swift_deallocPartialClassInstance(v7, v9, 16, 7);
  return 0;
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return a6 == 0;
}

- (void).cxx_destruct
{

}

@end
