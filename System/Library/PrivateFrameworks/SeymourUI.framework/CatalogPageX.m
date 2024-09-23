@implementation CatalogPageX

- (_TtC9SeymourUI12CatalogPageX)init
{
  _TtC9SeymourUI12CatalogPageX *result;

  result = (_TtC9SeymourUI12CatalogPageX *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_delegate);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_impressionsTracker);
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC9SeymourUI12CatalogPageX *v8;

  sub_22BA79C14();
  v6 = sub_22BA808BC();
  v7 = a3;
  v8 = self;
  sub_22B68DEA4(v6);

  swift_bridgeObjectRelease();
}

- (void)_collectionView:(id)a3 orthogonalScrollViewDidScroll:(id)a4 section:(int64_t)a5
{
  id v9;
  _TtC9SeymourUI12CatalogPageX *v10;

  if (MEMORY[0x22E2F3FFC]((char *)self + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_delegate, a2))
  {
    if (a5 < 0)
    {
      __break(1u);
    }
    else if ((*(_QWORD **)((char *)&self->super.isa + OBJC_IVAR____TtC9SeymourUI12CatalogPageX_shelves))[2] > (unint64_t)a5)
    {
      v9 = a3;
      swift_unknownObjectRetain();
      v10 = self;
      swift_unknownObjectRetain();
      sub_22B681E28(a4);

      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
      return;
    }
    __break(1u);
  }
}

- (void)collectionView:(id)a3 willDisplayCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_22B68DD90(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_22B68EC4C);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  sub_22B68DD90(self, (uint64_t)a2, a3, a4, (uint64_t)a5, (void (*)(id, char *))sub_22B68EECC);
}

@end
