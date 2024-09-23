@implementation OneUpSharePlayDataSource

- (int64_t)numberOfSections
{
  return 1;
}

- (int64_t)numberOfItemsInSection:(int64_t)a3
{
  return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12PhotosUICore24OneUpSharePlayDataSource_assets), sel_count, a3);
}

- (id)assetAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  return objc_msgSend(*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12PhotosUICore24OneUpSharePlayDataSource_assets), sel_objectAtIndexedSubscript_, a3->item);
}

- (id)objectAtIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  int64_t section;
  int64_t item;
  _TtC12PhotosUICore24OneUpSharePlayDataSource *v6;
  id v7;

  dataSourceIdentifier = a3->dataSourceIdentifier;
  section = a3->section;
  item = a3->item;
  v6 = self;
  v7 = OneUpSharePlayDataSource.object(at:)(dataSourceIdentifier, section, item);

  return v7;
}

- (id)assetReferenceAtItemIndexPath:(PXSimpleIndexPath *)a3
{
  int64_t dataSourceIdentifier;
  int64_t section;
  int64_t item;
  int64_t subitem;
  void *v7;
  _TtC12PhotosUICore24OneUpSharePlayDataSource *v8;
  id v9;
  _QWORD v11[4];

  dataSourceIdentifier = a3->dataSourceIdentifier;
  section = a3->section;
  item = a3->item;
  subitem = a3->subitem;
  v7 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore24OneUpSharePlayDataSource_assets);
  v8 = self;
  v11[0] = dataSourceIdentifier;
  v11[1] = section;
  v11[2] = item;
  v11[3] = subitem;
  v9 = objc_msgSend(objc_allocWithZone((Class)off_1E50B1688), sel_initWithSectionObject_itemObject_subitemObject_indexPath_, 0, objc_msgSend(v7, sel_objectAtIndexedSubscript_, item), 0, v11);

  swift_unknownObjectRelease();
  return v9;
}

- (id)assetsInSectionIndexPath:(PXSimpleIndexPath *)a3
{
  return (id)swift_unknownObjectRetain();
}

- (id)indexPathForDisplayAsset:(id)a3 hintIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _TtC12PhotosUICore24OneUpSharePlayDataSource *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;

  sub_1A67ECD50(0, &qword_1EE8C6220, (void (*)(uint64_t))MEMORY[0x1E0CB1658]);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v22 - v11;
  if (a4)
  {
    sub_1A7ADCC78();
    v13 = sub_1A7ADCC90();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 0, 1, v13);
  }
  else
  {
    v14 = sub_1A7ADCC90();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 1, 1, v14);
  }
  v15 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12PhotosUICore24OneUpSharePlayDataSource_assets);
  if ((objc_msgSend(v15, sel_respondsToSelector_, sel_indexOfObject_) & 1) != 0)
  {
    swift_unknownObjectRetain();
    v16 = self;
    v17 = objc_msgSend(v15, sel_indexOfObject_, a3);
    if (v17 == (id)sub_1A7ADC1D4())
    {
      v18 = sub_1A7ADCC90();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v12, 1, 1, v18);
    }
    else
    {
      MEMORY[0x1A85C28D8](v17, 0);
      v18 = sub_1A7ADCC90();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v12, 0, 1, v18);
    }
    swift_unknownObjectRelease();

  }
  else
  {
    v18 = sub_1A7ADCC90();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v12, 1, 1, v18);
  }
  sub_1A67EC074((uint64_t)v9, &qword_1EE8C6220, (void (*)(uint64_t))MEMORY[0x1E0CB1658]);
  sub_1A7ADCC90();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v12, 1, v18) != 1)
  {
    v20 = (void *)sub_1A7ADCC6C();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v12, v18);
  }
  return v20;
}

- (PXSimpleIndexPath)indexPathForAssetReference:(SEL)a3
{
  id v6;
  _TtC12PhotosUICore24OneUpSharePlayDataSource *v7;
  int64_t v8;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  int64_t v13;
  int64_t v14;
  PXSimpleIndexPath *result;

  v6 = a4;
  v7 = self;
  v8 = OneUpSharePlayDataSource.indexPath(for:)(v6);
  v10 = v9;
  v12 = v11;
  v14 = v13;

  retstr->dataSourceIdentifier = v8;
  retstr->section = v10;
  retstr->item = v12;
  retstr->subitem = v14;
  return result;
}

- (_TtC12PhotosUICore24OneUpSharePlayDataSource)init
{
  _TtC12PhotosUICore24OneUpSharePlayDataSource *result;

  result = (_TtC12PhotosUICore24OneUpSharePlayDataSource *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

@end
