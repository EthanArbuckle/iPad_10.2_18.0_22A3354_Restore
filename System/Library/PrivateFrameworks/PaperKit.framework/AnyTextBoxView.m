@implementation AnyTextBoxView

- (_TtC8PaperKit14AnyTextBoxView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  uint64_t v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit14AnyTextBoxView_textView) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit14AnyTextBoxView_isScribbling) = 0;
  v8 = (char *)self + OBJC_IVAR____TtC8PaperKit14AnyTextBoxView_liveUneditedModelCoordinateSpace;
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  *((_OWORD *)v8 + 2) = 0u;
  v8[48] = 1;
  v9 = OBJC_IVAR____TtC8PaperKit14AnyTextBoxView_analytics;
  type metadata accessor for FormTextFieldAnalytics();
  swift_allocObject();
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)FormTextFieldAnalytics.init()();
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AnyTextBoxView();
  return -[AnyTextBoxView initWithFrame:](&v11, sel_initWithFrame_, x, y, width, height);
}

- (_TtC8PaperKit14AnyTextBoxView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8PaperKit14AnyTextBoxView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit14AnyTextBoxView_textView) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit14AnyTextBoxView_isScribbling) = 0;
  v5 = (char *)self + OBJC_IVAR____TtC8PaperKit14AnyTextBoxView_liveUneditedModelCoordinateSpace;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  v5[48] = 1;
  v6 = OBJC_IVAR____TtC8PaperKit14AnyTextBoxView_analytics;
  type metadata accessor for FormTextFieldAnalytics();
  swift_allocObject();
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)FormTextFieldAnalytics.init()();
  v7 = a3;

  result = (_TtC8PaperKit14AnyTextBoxView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release();
}

@end
