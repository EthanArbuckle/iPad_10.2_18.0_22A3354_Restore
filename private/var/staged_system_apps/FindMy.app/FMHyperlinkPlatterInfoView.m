@implementation FMHyperlinkPlatterInfoView

- (_TtC6FindMy26FMHyperlinkPlatterInfoView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1000D842C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  _TtC6FindMy26FMHyperlinkPlatterInfoView *v5;

  v4 = a3;
  v5 = self;
  sub_1000D85E8();

}

- (void)buttonPressed
{
  void (*v2)(_QWORD *);
  uint64_t v4;
  void *v5;
  _TtC6FindMy26FMHyperlinkPlatterInfoView *v6;
  id v7;
  _QWORD v8[4];

  v2 = *(void (**)(_QWORD *))((char *)&self->super.super.super.isa
                                       + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_actionHandler);
  if (v2)
  {
    v4 = *(_QWORD *)&self->style[OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_actionHandler];
    v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_button);
    v8[3] = sub_1000D83F0();
    v8[0] = v5;
    v6 = self;
    sub_1000A190C((uint64_t)v2, v4);
    v7 = v5;
    v2(v8);
    sub_1000327F0((uint64_t)v2, v4);
    sub_100029574(v8);

  }
}

- (_TtC6FindMy26FMHyperlinkPlatterInfoView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy26FMHyperlinkPlatterInfoView *result;

  result = (_TtC6FindMy26FMHyperlinkPlatterInfoView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMHyperlinkPlatterInfoView", 33, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->style[OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_glyphName]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_circleTintColor));
  swift_bridgeObjectRelease(*(_QWORD *)&self->style[OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_labelTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->style[OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_actionTitle]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_containerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_circleImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_iconImageView));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_heightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_labelTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_labelCenterYConstraint));
  sub_1000327F0(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_actionHandler), *(_QWORD *)&self->style[OBJC_IVAR____TtC6FindMy26FMHyperlinkPlatterInfoView_actionHandler]);
}

@end
