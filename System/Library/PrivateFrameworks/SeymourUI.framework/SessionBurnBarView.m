@implementation SessionBurnBarView

- (CGSize)intrinsicContentSize
{
  double *v2;
  uint64_t v3;
  _TtC9SeymourUI18SessionBurnBarView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = (double *)MEMORY[0x24BEBE9C8];
  v3 = qword_255B81FD8;
  v4 = self;
  if (v3 != -1)
    swift_once();
  v5 = *v2;
  v6 = *(double *)&qword_255B87F90;
  if (qword_255B81FE0 != -1)
    swift_once();
  v7 = *(double *)&qword_255B87F98;

  v8 = v6 + v7;
  v9 = v5;
  result.height = v8;
  result.width = v9;
  return result;
}

- (_TtC9SeymourUI18SessionBurnBarView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _TtC9SeymourUI18SessionBurnBarView *result;

  v5 = OBJC_IVAR____TtC9SeymourUI18SessionBurnBarView_burnBar;
  type metadata accessor for BurnBar();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  v8 = objc_msgSend(v6, sel_init);
  objc_msgSend(v8, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)v8;

  result = (_TtC9SeymourUI18SessionBurnBarView *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (_TtC9SeymourUI18SessionBurnBarView)initWithFrame:(CGRect)a3
{
  _TtC9SeymourUI18SessionBurnBarView *result;

  result = (_TtC9SeymourUI18SessionBurnBarView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

}

@end
