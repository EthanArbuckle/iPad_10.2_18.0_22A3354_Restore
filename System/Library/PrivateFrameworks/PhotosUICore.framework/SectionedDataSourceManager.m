@implementation SectionedDataSourceManager

- (id)createInitialDataSource
{
  _TtC12PhotosUICore26SectionedDataSourceManager *v3;
  id v4;
  uint64_t v6[5];

  type metadata accessor for SectionedDataSource();
  swift_getObjectType();
  v6[3] = swift_getAssociatedTypeWitness();
  v6[4] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v6);
  v3 = self;
  sub_1A7ADF420();
  v4 = sub_1A6A78E94((uint64_t)v6);

  return v4;
}

- (_TtC12PhotosUICore26SectionedDataSourceManager)init
{
  _TtC12PhotosUICore26SectionedDataSourceManager *result;

  result = (_TtC12PhotosUICore26SectionedDataSourceManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
