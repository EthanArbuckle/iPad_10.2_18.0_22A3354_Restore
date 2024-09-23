@implementation GlyphMaskLayer

- (_TtC23ShelfKitCollectionViews14GlyphMaskLayer)initWithLayer:(id)a3
{
  __n128 v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _TtC23ShelfKitCollectionViews14GlyphMaskLayer *v9;
  objc_super v11;
  _QWORD v12[3];
  uint64_t v13;

  v5 = swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v12, a3, v5);
  swift_unknownObjectRelease(a3);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14GlyphMaskLayer_symbolImage) = 0;
  v6 = v13;
  v7 = __swift_project_boxed_opaque_existential_1(v12, v13);
  v8 = _bridgeAnythingToObjectiveC<A>(_:)(v7, v6);
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for GlyphMaskLayer();
  v9 = -[GlyphMaskLayer initWithLayer:](&v11, "initWithLayer:", v8);
  swift_unknownObjectRelease(v8);
  __swift_destroy_boxed_opaque_existential_0(v12);
  return v9;
}

- (_TtC23ShelfKitCollectionViews14GlyphMaskLayer)initWithCoder:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews14GlyphMaskLayer *result;

  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC23ShelfKitCollectionViews14GlyphMaskLayer_symbolImage) = 0;
  v4 = a3;

  result = (_TtC23ShelfKitCollectionViews14GlyphMaskLayer *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/GlyphButton.swift", 41, 2, 760, 0);
  __break(1u);
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  CGContext *v4;
  _TtC23ShelfKitCollectionViews14GlyphMaskLayer *v5;

  v4 = a3;
  v5 = self;
  sub_1E6120(v4);

}

- (_TtC23ShelfKitCollectionViews14GlyphMaskLayer)init
{
  _TtC23ShelfKitCollectionViews14GlyphMaskLayer *result;

  result = (_TtC23ShelfKitCollectionViews14GlyphMaskLayer *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.GlyphMaskLayer", 38, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews14GlyphMaskLayer_symbolImage));
}

@end
