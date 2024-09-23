@implementation SectionedDataSource

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  _TtC12PhotosUICore19SectionedDataSource *v4;
  int64_t v5;

  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PhotosUICore19SectionedDataSource_itemList), *(int64_t *)((char *)&self->super._totalNumberOfItemsCache+ OBJC_IVAR____TtC12PhotosUICore19SectionedDataSource_itemList));
  v4 = self;
  v5 = sub_1A7ADF984();

  return v5;
}

- (int64_t)numberOfSubitemsInItem:(int64_t)a3 section:(int64_t)a4
{
  return 0;
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t item;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC12PhotosUICore19SectionedDataSource *v8;
  void *v10;
  uint64_t v11[6];
  uint64_t v12[3];
  uint64_t AssociatedTypeWitness;
  uint64_t AssociatedConformanceWitness;

  item = a3->item;
  v5 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PhotosUICore19SectionedDataSource_itemList);
  v6 = v5[3];
  v7 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v6);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v12);
  v8 = self;
  MEMORY[0x1A85C55F0](item, v6, v7);
  __swift_project_boxed_opaque_existential_1(v12, AssociatedTypeWitness);
  v11[3] = swift_getAssociatedTypeWitness();
  v11[4] = swift_getAssociatedConformanceWitness();
  v11[5] = swift_getAssociatedConformanceWitness();
  __swift_allocate_boxed_opaque_existential_1(v11);
  sub_1A7ADF8DC();
  sub_1A6A79144();
  sub_1A6A791A0();
  swift_dynamicCast();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);

  return v10;
}

- (id)objectsInIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t item;
  _TtC12PhotosUICore19SectionedDataSource *v4;
  uint64_t v5;
  void *v6;

  item = a3->item;
  v4 = self;
  v6 = (void *)SectionedDataSource.objects(in:)((uint64_t)v4, v5, item);

  return v6;
}

- (PXSimpleIndexPath)indexPathForObjectID:(SEL)a3
{
  _TtC12PhotosUICore19SectionedDataSource *v7;
  int64_t v8;
  char v9;
  char v10;
  int64_t v11;
  PXSimpleIndexPath *result;
  _QWORD v13[4];

  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC12PhotosUICore19SectionedDataSource_itemList), *(int64_t *)((char *)&self->super._totalNumberOfItemsCache+ OBJC_IVAR____TtC12PhotosUICore19SectionedDataSource_itemList));
  v13[3] = swift_getObjectType();
  v13[0] = a4;
  swift_unknownObjectRetain_n();
  v7 = self;
  v8 = sub_1A7ADF9B4();
  v10 = v9;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  if ((v10 & 1) != 0)
    v8 = sub_1A7ADC1D4();
  v11 = -[PXSectionedDataSource dataSourceIdentifier](v7, sel_dataSourceIdentifier, v13[0]);
  swift_unknownObjectRelease();

  retstr->dataSourceIdentifier = v11;
  retstr->section = 0;
  retstr->item = v8;
  retstr->subitem = 0;
  return result;
}

- (_TtC12PhotosUICore19SectionedDataSource)init
{
  _TtC12PhotosUICore19SectionedDataSource *result;

  result = (_TtC12PhotosUICore19SectionedDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore19SectionedDataSource_itemList);
}

@end
