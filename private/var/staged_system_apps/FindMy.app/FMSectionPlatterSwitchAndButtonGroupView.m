@implementation FMSectionPlatterSwitchAndButtonGroupView

- (_TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100140C00();
}

- (void)handleActionWithSender:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(id, uint64_t, uint64_t);
  id v11;
  _TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView *v12;

  v5 = (char *)self + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_delegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_delegate);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 1);
    ObjectType = swift_getObjectType(Strong);
    v10 = *(void (**)(id, uint64_t, uint64_t))(v8 + 16);
    v11 = a3;
    v12 = self;
    v10(v11, ObjectType, v8);

    swift_unknownObjectRelease(v7);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView *v6;

  v5 = a3;
  v6 = self;
  sub_1001408AC((uint64_t)a3);

}

- (_TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView)initWithFrame:(CGRect)a3
{
  _TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView *result;

  result = (_TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView *)_swift_stdlib_reportUnimplementedInitializer("FindMy.FMSectionPlatterSwitchAndButtonGroupView", 47, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_sectionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_switchView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_actionButton));
  sub_10005E190((uint64_t)self + OBJC_IVAR____TtC6FindMy40FMSectionPlatterSwitchAndButtonGroupView_delegate);
}

@end
