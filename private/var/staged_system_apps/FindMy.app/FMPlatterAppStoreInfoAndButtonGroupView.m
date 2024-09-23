@implementation FMPlatterAppStoreInfoAndButtonGroupView

- (_TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10018BCF0();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView *v6;

  v5 = a3;
  v6 = self;
  sub_10018B638((uint64_t)a3);

}

- (_TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView *result;

  result = (_TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMPlatterAppStoreInfoAndButtonGroupView", 46, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_sharedLockupViewGroup));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_contentStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_secondaryStackView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_actionButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_topSeparator));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_actionButtonShowingConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_actionButtonHiddenConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_lockupViewShowingContstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_lockupViewHiddenConstraints));
  swift_bridgeObjectRelease(*(_QWORD *)&self->sharedLockupViewGroup[OBJC_IVAR____TtC6FindMy39FMPlatterAppStoreInfoAndButtonGroupView_displayedAppBundleID]);
}

@end
