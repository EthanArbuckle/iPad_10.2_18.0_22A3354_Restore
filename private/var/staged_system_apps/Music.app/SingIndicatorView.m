@implementation SingIndicatorView

- (void)showSingIndicator
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC5Music17SingIndicatorView *v7;
  __n128 v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v3 = sub_100007E8C((uint64_t *)&unk_1011A13B0);
  __chkstk_darwin(v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor(0);
  v7 = self;
  v9 = static MainActor.shared.getter(v8);
  v10 = (_QWORD *)swift_allocObject(&unk_1010BF928, 40, 7);
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v7;
  sub_100166D14((uint64_t)v5, (uint64_t)&unk_1011A2160, (uint64_t)v10);
  swift_release();

}

- (_TtC5Music17SingIndicatorView)init
{
  return (_TtC5Music17SingIndicatorView *)sub_1003241B4();
}

- (_TtC5Music17SingIndicatorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100324BB8();
}

- (void)layoutSubviews
{
  _TtC5Music17SingIndicatorView *v2;

  v2 = self;
  sub_100324518();

}

- (void)traitCollectionDidChange:(id)a3
{
  _TtC5Music17SingIndicatorView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_100324974(a3);

}

- (_TtC5Music17SingIndicatorView)initWithFrame:(CGRect)a3
{
  _TtC5Music17SingIndicatorView *result;

  result = (_TtC5Music17SingIndicatorView *)_swift_stdlib_reportUnimplementedInitializer("Music.SingIndicatorView", 23, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music17SingIndicatorView____lazy_storage___gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5Music17SingIndicatorView_singIndicatorLabel));
}

@end
