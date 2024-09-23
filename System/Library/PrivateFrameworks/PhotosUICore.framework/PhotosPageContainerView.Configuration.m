@implementation PhotosPageContainerView.Configuration

- (PXGSingleViewLayout)weakLayout
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_weakLayout);
  swift_beginAccess();
  return (PXGSingleViewLayout *)*v2;
}

- (void)setWeakLayout:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_weakLayout);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtCC12PhotosUICore23PhotosPageContainerView13Configuration)init
{
  _TtCC12PhotosUICore23PhotosPageContainerView13Configuration *result;

  result = (_TtCC12PhotosUICore23PhotosPageContainerView13Configuration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_weakLayout));
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_willAdd));
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_didAdd));
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_willRemove));
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCC12PhotosUICore23PhotosPageContainerView13Configuration_didRemove));
}

@end
