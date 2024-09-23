@implementation PhotosDetailsLocationSearchDataSource

- (PXPhotosDetailsLocationSearchDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource_delegate;
  swift_beginAccess();
  return (PXPhotosDetailsLocationSearchDelegate *)(id)MEMORY[0x1A85CED04](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (id)requestInfoOfKind:(id)a3 withResultHandler:(id)a4
{
  void *v5;
  _TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource *v6;
  void *v7;

  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = self;
  v7 = (void *)sub_1A695BB3C((uint64_t)v6, (void (**)(_QWORD, _QWORD))v5);
  _Block_release(v5);
  _Block_release(v5);

  return v7;
}

- (void)infoUpdaterDidUpdate:(id)a3
{
  id v4;
  _TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource *v5;

  v4 = a3;
  v5 = self;
  sub_1A695AC18((uint64_t)v4);

}

- (_TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource)init
{
  _TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource *result;

  result = (_TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource_suggester));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource_assets));
  swift_bridgeObjectRelease();
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource_completion));
  sub_1A688D368((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource_delegate);
  sub_1A6855D80(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource_undoManagerProvider));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12PhotosUICore37PhotosDetailsLocationSearchDataSource____lazy_storage___infoUpdater));
}

@end
