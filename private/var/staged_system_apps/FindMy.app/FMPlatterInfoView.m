@implementation FMPlatterInfoView

- (_TtC6FindMy17FMPlatterInfoView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002594C8();
}

- (void)handleCloseAction
{
  -[FMPlatterInfoView removeFromSuperview](self, "removeFromSuperview");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_100258F38(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100258A08);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_100258C8C(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_100258C8C(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_100258F38(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_100258D28);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy17FMPlatterInfoView *v6;

  v5 = a3;
  v6 = self;
  sub_100258FD0((uint64_t)a3);

}

- (_TtC6FindMy17FMPlatterInfoView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy17FMPlatterInfoView *result;

  result = (_TtC6FindMy17FMPlatterInfoView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPlatterInfoView", 24, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(_QWORD *)&self->iconImageView[OBJC_IVAR____TtC6FindMy17FMPlatterInfoView_actionTitle]);
  sub_100259444((uint64_t)self + OBJC_IVAR____TtC6FindMy17FMPlatterInfoView_platterIcon);

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMPlatterInfoView_chevronWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMPlatterInfoView_titleTrailingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy17FMPlatterInfoView_subtitleTrailingConstraint));

}

@end
