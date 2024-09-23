@implementation FMExtendedPlatterInfoView

- (_TtC6FindMy25FMExtendedPlatterInfoView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002C381C();
}

- (void)platterTapped
{
  void (*v2)(_QWORD *);
  uint64_t v4;
  _TtC6FindMy25FMExtendedPlatterInfoView *v5;
  _QWORD v6[4];

  v2 = *(void (**)(_QWORD *))((char *)&self->super.super.super.isa
                                       + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_actionHandler);
  if (v2)
  {
    v4 = *(_QWORD *)&self->iconImageView[OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_actionHandler];
    v6[3] = swift_getObjectType(self);
    v6[0] = self;
    v5 = self;
    sub_1000A190C((uint64_t)v2, v4);
    v2(v6);
    sub_1000327F0((uint64_t)v2, v4);
    sub_100029574(v6);

  }
}

- (void)handleCloseAction
{
  char *v2;
  uint64_t Strong;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  _TtC6FindMy25FMExtendedPlatterInfoView *v7;

  v2 = (char *)self + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_delegate);
  if (Strong)
  {
    v4 = Strong;
    v5 = *((_QWORD *)v2 + 1);
    ObjectType = swift_getObjectType(Strong);
    (*(void (**)(_TtC6FindMy25FMExtendedPlatterInfoView *, uint64_t, uint64_t))(v5 + 8))(self, ObjectType, v5);
    swift_unknownObjectRelease(v4);
  }
  else
  {
    v7 = self;
  }
  -[FMExtendedPlatterInfoView removeFromSuperview](self, "removeFromSuperview");

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_100258F38(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1002C2F48);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1002C31F0(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1002C31F0(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_100258F38(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_1002C328C);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy25FMExtendedPlatterInfoView *v6;

  v5 = a3;
  v6 = self;
  sub_1002C34BC((uint64_t)a3);

}

- (_TtC6FindMy25FMExtendedPlatterInfoView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy25FMExtendedPlatterInfoView *result;

  result = (_TtC6FindMy25FMExtendedPlatterInfoView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMExtendedPlatterInfoView", 32, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_iconImageView));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_delegate);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_actionLabel));
  sub_1000327F0(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_actionHandler), *(_QWORD *)&self->iconImageView[OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_actionHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_closeButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_containerView));
  swift_bridgeObjectRelease(*(_QWORD *)&self->iconImageView[OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->iconImageView[OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->iconImageView[OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_actionTitle]);
  sub_100259444((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMExtendedPlatterInfoView_platterIcon);
}

@end
