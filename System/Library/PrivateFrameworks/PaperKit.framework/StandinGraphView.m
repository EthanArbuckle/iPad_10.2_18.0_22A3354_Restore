@implementation StandinGraphView

- (_TtC8PaperKit16StandinGraphView)initWithFrame:(CGRect)a3
{
  return (_TtC8PaperKit16StandinGraphView *)StandinGraphView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  _TtC8PaperKit16StandinGraphView *v2;

  v2 = self;
  StandinGraphView.layoutSubviews()();

}

- (_TtC8PaperKit16StandinGraphView)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  _TtC8PaperKit16StandinGraphView *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit16StandinGraphView_label) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit16StandinGraphView_expressions) = (Class)MEMORY[0x1E0DEE9D8];
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC8PaperKit16StandinGraphView_range);
  *v4 = 0u;
  v4[1] = 0u;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit16StandinGraphView_isSelected) = 0;
  v5 = a3;

  result = (_TtC8PaperKit16StandinGraphView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
