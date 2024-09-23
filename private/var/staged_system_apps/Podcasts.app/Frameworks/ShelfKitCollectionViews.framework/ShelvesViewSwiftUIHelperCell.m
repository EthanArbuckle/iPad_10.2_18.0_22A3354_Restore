@implementation ShelvesViewSwiftUIHelperCell

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell *v5;

  v4 = a3;
  v5 = self;
  sub_ED2A4(v4);

}

- (UICellConfigurationState)_bridgedConfigurationState
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell *v7;
  Class isa;
  uint64_t v10;

  v3 = type metadata accessor for UICellConfigurationState(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_ED50C();

  isa = UICellConfigurationState._bridgeToObjectiveC()().super.super.isa;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (UICellConfigurationState *)isa;
}

- (void)prepareForReuse
{
  _TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell *v2;

  v2 = self;
  sub_ED5F4();

}

- (_TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  char *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  __asm { FMOV            V0.2D, #10.0 }
  *(_OWORD *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell_cellSize) = _Q0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell_objectGraph) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell_interactionContextView) = 7;
  v14 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell_transitionNamespace;
  *(_QWORD *)v14 = 0;
  v14[8] = 1;
  v16.receiver = self;
  v16.super_class = ObjectType;
  return -[ShelvesViewSwiftUIHelperCell initWithFrame:](&v16, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell *)sub_ED748(a3);
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews28ShelvesViewSwiftUIHelperCell_objectGraph));
}

@end
