@implementation FindInteractionTextView

- (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView)initWithCoder:(id)a3
{
  id v5;
  _TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView *result;

  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView_copyDelegate, 0);
  v5 = a3;

  result = (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/EpisodeDetailTranscriptViewController.swift", 67, 2, 1261, 0);
  __break(1u);
  return result;
}

- (void)findInteraction:(id)a3 didBeginFindSession:(id)a4
{
  id v6;
  id v7;
  _TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_C6C8C(v6, (uint64_t)v7);

}

- (void)findInteraction:(id)a3 didEndFindSession:(id)a4
{
  objc_class *ObjectType;
  id v8;
  id v9;
  _TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView *v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView_navBarButtonUpdater), *(_QWORD *)&self->navBarButtonUpdater[OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView_navBarButtonUpdater+ 8]);
  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_BE458(0);
  -[FindInteractionTextView becomeFirstResponder](v10, "becomeFirstResponder");
  v11.receiver = v10;
  v11.super_class = ObjectType;
  -[FindInteractionTextView findInteraction:didEndFindSession:](&v11, "findInteraction:didEndFindSession:", v8, v9);

}

- (void)copy:(id)a3
{
  _TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView *v5;
  __n128 v6;
  uint64_t v7;
  _TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView *v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v9, v7, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v8 = self;
  }
  sub_C6EDC((uint64_t)v9);

  sub_D1D4((uint64_t)v9, &qword_3D1A70);
}

- (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  id v4;
  _TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView *result;

  v4 = a4;
  result = (_TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.FindInteractionTextView", 47, "init(frame:textContainer:)", 26, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView_copyDelegate);
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.super.super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_4B6A8D49F15B3AE23629E1279D1F5DBE23FindInteractionTextView_navBarButtonUpdater));
}

@end
