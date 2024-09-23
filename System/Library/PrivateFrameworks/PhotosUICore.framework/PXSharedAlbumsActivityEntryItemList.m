@implementation PXSharedAlbumsActivityEntryItemList

- (PXSharedAlbumsActivityEntryItemList)initWithActivities:(id)a3
{
  unint64_t v3;

  sub_1A6856488(0, (unint64_t *)&qword_1EE8D8DD0);
  v3 = sub_1A7AE3A10();
  return (PXSharedAlbumsActivityEntryItemList *)sub_1A6F9C5A4(v3);
}

- (id)itemAtIndex:(int64_t)a3
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)((char *)self + OBJC_IVAR___PXSharedAlbumsActivityEntryItemList_items);
  if ((v4 & 0xC000000000000001) != 0)
  {
    v6 = self;
    v5 = (id)MEMORY[0x1A85CA5A0](a3, v4);

    return v5;
  }
  if (a3 < 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10) > (unint64_t)a3)
  {
    v5 = *(id *)(v4 + 8 * a3 + 32);
    return v5;
  }
  __break(1u);
  return self;
}

- (int64_t)count
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___PXSharedAlbumsActivityEntryItemList_numberOfItems);
}

- (PXSharedAlbumsActivityEntryItemList)init
{
  PXSharedAlbumsActivityEntryItemList *result;

  result = (PXSharedAlbumsActivityEntryItemList *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A6F65C24((uint64_t)self + OBJC_IVAR___PXSharedAlbumsActivityEntryItemList_representedValue);
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___PXSharedAlbumsActivityEntryItemList_loadingStatus;
  v4 = sub_1A7ADF6CC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
