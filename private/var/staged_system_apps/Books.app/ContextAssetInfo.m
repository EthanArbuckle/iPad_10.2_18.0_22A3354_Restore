@implementation ContextAssetInfo

- (_TtC5Books16ContextAssetInfo)init
{
  _TtC5Books16ContextAssetInfo *result;

  result = (_TtC5Books16ContextAssetInfo *)_swift_stdlib_reportUnimplementedInitializer("Books.ContextAssetInfo", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1002995DC((uint64_t)self + OBJC_IVAR____TtC5Books16ContextAssetInfo_dataSource);
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC5Books16ContextAssetInfo_coverImageProvider));
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa
                                          + OBJC_IVAR____TtC5Books16ContextAssetInfo_libraryAssetProvider));
  swift_bridgeObjectRelease(*(_QWORD *)&self->dataSource[OBJC_IVAR____TtC5Books16ContextAssetInfo_shareableURLStringOverride]);
}

@end
