@implementation SingIndicatorView

- (void)showSingIndicator
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC16MusicApplication17SingIndicatorView *v7;
  __n128 v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_14AD5A0);
  __chkstk_darwin(v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor(0);
  v7 = self;
  v9 = static MainActor.shared.getter(v8);
  v10 = (_QWORD *)swift_allocObject(&unk_135A960, 40, 7);
  v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v7;
  v11 = sub_2223C8((uint64_t)v5, (uint64_t)&unk_14DB140, (uint64_t)v10);
  swift_release(v11);

}

- (_TtC16MusicApplication17SingIndicatorView)init
{
  return (_TtC16MusicApplication17SingIndicatorView *)sub_347688();
}

- (_TtC16MusicApplication17SingIndicatorView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_348118();
}

- (void)layoutSubviews
{
  _TtC16MusicApplication17SingIndicatorView *v2;

  v2 = self;
  sub_3479F8();

}

- (void)traitCollectionDidChange:(id)a3
{
  _TtC16MusicApplication17SingIndicatorView *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_347E54(a3);

}

- (_TtC16MusicApplication17SingIndicatorView)initWithFrame:(CGRect)a3
{
  _TtC16MusicApplication17SingIndicatorView *result;

  result = (_TtC16MusicApplication17SingIndicatorView *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.SingIndicatorView", 34, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17SingIndicatorView____lazy_storage___gradientView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17SingIndicatorView_singIndicatorLabel));
}

@end
