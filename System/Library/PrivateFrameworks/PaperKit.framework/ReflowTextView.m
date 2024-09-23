@implementation ReflowTextView

- (_TtC8PaperKit14ReflowTextView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized ReflowTextView.init(coder:)();
}

- (void)layoutSubviews
{
  char *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ReflowTextView();
  v2 = (char *)v8.receiver;
  -[ReflowTextView layoutSubviews](&v8, sel_layoutSubviews);
  v3 = *(_QWORD **)&v2[OBJC_IVAR____TtC8PaperKit14ReflowTextView_layoutManager];
  objc_msgSend(v2, sel_frame, v8.receiver, v8.super_class);
  v3[2] = v4;
  v3[3] = v5;
  v3[4] = v6;
  v3[5] = v7;
  ReflowLayoutManager.scaleTextToFit()();
  if (one-time initialization token for showDebugUI != -1)
    swift_once();
  if (static ReflowTextView.showDebugUI == 1)
    ReflowTextView.lineDebug()();

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ReflowTextView();
  -[ReflowTextView frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(CGRect *)(*(char **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit14ReflowTextView_layoutManager)
            + 16) = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ReflowTextView();
  -[ReflowTextView setFrame:](&v7, sel_setFrame_, x, y, width, height);
}

- (_TtC8PaperKit14ReflowTextView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit14ReflowTextView *result;

  result = (_TtC8PaperKit14ReflowTextView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectWeakDestroy();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit14ReflowTextView____lazy_storage___displayLink));
  swift_bridgeObjectRelease();
}

@end
