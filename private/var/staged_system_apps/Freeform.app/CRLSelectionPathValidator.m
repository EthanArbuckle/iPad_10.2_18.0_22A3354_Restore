@implementation CRLSelectionPathValidator

- (_TtC8Freeform8CRLBoard)board
{
  return (_TtC8Freeform8CRLBoard *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_board);
}

- (void)setBoard:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_board, a3);
}

- (CRLSelectionModelTranslator)selectionModelTranslator
{
  return (CRLSelectionModelTranslator *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                + OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_selectionModelTranslator));
}

- (void)setSelectionModelTranslator:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_selectionModelTranslator);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_selectionModelTranslator) = (Class)a3;
  v3 = a3;

}

- (_TtC8Freeform25CRLSelectionPathValidator)initWithBoard:(id)a3 translator:(id)a4
{
  uint64_t v7;
  id v8;
  objc_super v10;

  v7 = swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_board);
  swift_unknownObjectWeakAssign(v7, a3);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_selectionModelTranslator) = (Class)a4;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CRLSelectionPathValidator();
  v8 = a4;
  return -[CRLSelectionPathValidator init](&v10, "init");
}

- (id)selectionPathFromPersistableSelectionPath:(id)a3
{
  id v4;
  _TtC8Freeform25CRLSelectionPathValidator *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1005853C8((uint64_t)v4);

  return v6;
}

- (id)selectionPathFromPersistableSelectionPath:(id)a3 selectableBoardItemsFromParentMapAndSiblings:(id)a4
{
  void *v6;
  id v7;
  _TtC8Freeform25CRLSelectionPathValidator *v8;
  id v9;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  v9 = sub_100586594((uint64_t)v7, (uint64_t)v8, (uint64_t)v6);
  _Block_release(v6);
  _Block_release(v6);

  return v9;
}

- (_TtC8Freeform25CRLSelectionPathValidator)init
{
  _TtC8Freeform25CRLSelectionPathValidator *result;

  result = (_TtC8Freeform25CRLSelectionPathValidator *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLSelectionPathValidator", 34, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_board);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8Freeform25CRLSelectionPathValidator_selectionModelTranslator));
}

@end
