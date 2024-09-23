@implementation BKTapActionView

- (_TtC5Books15BKTapActionView)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC5Books15BKTapActionView *result;

  v5 = (char *)self + OBJC_IVAR____TtC5Books15BKTapActionView_listener;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  v6 = a3;

  result = (_TtC5Books15BKTapActionView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 1701867342, 0xE400000000000000, "Books/TapActionView.swift", 25, 2, 53, 0);
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  _TtC5Books15BKTapActionView *v2;

  v2 = self;
  sub_10046F930();

}

- (CGSize)intrinsicContentSize
{
  double *v2;
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC5Books15BKTapActionView_fixedSize);
  if ((self->fixedSize[OBJC_IVAR____TtC5Books15BKTapActionView_fixedSize + 8] & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)type metadata accessor for BKTapActionView();
    -[BKTapActionView intrinsicContentSize](&v5, "intrinsicContentSize");
  }
  else
  {
    v3 = *v2;
    v4 = v2[1];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)fireAction:(id)a3
{
  uint64_t v5;
  void (*v6)(uint64_t);
  _TtC5Books15BKTapActionView *v7;
  uint64_t v8;

  v6 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books15BKTapActionView_action);
  v5 = *(_QWORD *)&self->fixedSize[OBJC_IVAR____TtC5Books15BKTapActionView_action];
  swift_unknownObjectRetain(a3);
  v7 = self;
  v8 = swift_retain(v5);
  v6(v8);
  swift_unknownObjectRelease(a3);

  swift_release(v5);
}

- (void)be_singleTapAction
{
  uint64_t v2;
  void (*v3)(uint64_t);
  _TtC5Books15BKTapActionView *v4;
  uint64_t v5;

  v3 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC5Books15BKTapActionView_action);
  v2 = *(_QWORD *)&self->fixedSize[OBJC_IVAR____TtC5Books15BKTapActionView_action];
  v4 = self;
  v5 = swift_retain(v2);
  v3(v5);

  swift_release(v2);
}

- (_TtC5Books15BKTapActionView)initWithFrame:(CGRect)a3
{
  _TtC5Books15BKTapActionView *result;

  result = (_TtC5Books15BKTapActionView *)_swift_stdlib_reportUnimplementedInitializer("Books.BKTapActionView", 21, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->fixedSize[OBJC_IVAR____TtC5Books15BKTapActionView_action]);
  sub_1001FE9A0((uint64_t)self + OBJC_IVAR____TtC5Books15BKTapActionView_listener);
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC5Books15BKTapActionView *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = (void *)sub_1004700C0(v8);

  return v12;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC5Books15BKTapActionView *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_1004701C4(v6);

  return v9;
}

@end
