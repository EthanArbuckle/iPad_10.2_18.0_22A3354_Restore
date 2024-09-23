@implementation BadgeMaskLayer

- (_TtC23ShelfKitCollectionViews14BadgeMaskLayer)initWithLayer:(id)a3
{
  __n128 v5;
  _QWORD *v6;
  objc_class *v7;
  _TtC23ShelfKitCollectionViews14BadgeMaskLayer *v8;
  objc_super v10;
  _QWORD v11[4];

  v5 = swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v11, a3, v5);
  swift_unknownObjectRelease(a3);
  v6 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14BadgeMaskLayer_size);
  v7 = (objc_class *)type metadata accessor for BadgeMaskLayer();
  *v6 = 0;
  v6[1] = 0;
  v10.receiver = self;
  v10.super_class = v7;
  v8 = -[BadgeMaskLayer init](&v10, "init");
  __swift_destroy_boxed_opaque_existential_0(v11);
  return v8;
}

- (_TtC23ShelfKitCollectionViews14BadgeMaskLayer)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC23ShelfKitCollectionViews14BadgeMaskLayer *result;

  v4 = (Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14BadgeMaskLayer_size);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViews14BadgeMaskLayer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/GlyphButton.swift", 41, 2, 718, 0);
  __break(1u);
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtC23ShelfKitCollectionViews14BadgeMaskLayer *v5;

  v4 = a3;
  v5 = self;
  sub_1E5E10(v4);

}

- (_TtC23ShelfKitCollectionViews14BadgeMaskLayer)init
{
  _TtC23ShelfKitCollectionViews14BadgeMaskLayer *result;

  result = (_TtC23ShelfKitCollectionViews14BadgeMaskLayer *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.BadgeMaskLayer", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
