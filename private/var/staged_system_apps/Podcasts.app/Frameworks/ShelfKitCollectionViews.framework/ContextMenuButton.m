@implementation ContextMenuButton

- (_TtC23ShelfKitCollectionViews17ContextMenuButton)initWithCoder:(id)a3
{
  id v3;
  _TtC23ShelfKitCollectionViews17ContextMenuButton *result;

  v3 = a3;
  _StringGuts.grow(_:)(27);
  swift_bridgeObjectRelease(0xE000000000000000);
  result = (_TtC23ShelfKitCollectionViews17ContextMenuButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000000307D10, "ShelfKitCollectionViews/ContextMenuButton.swift", 47, 2, 60, 0);
  __break(1u);
  return result;
}

- (UIColor)tintColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[ContextMenuButton tintColor](&v3, "tintColor");
}

- (void)setTintColor:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC23ShelfKitCollectionViews17ContextMenuButton *v7;
  void *v8;
  UIColor *v9;
  objc_super v10;
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v11.receiver = self;
  v11.super_class = ObjectType;
  v6 = a3;
  v7 = self;
  -[ContextMenuButton setTintColor:](&v11, "setTintColor:", v6);
  v8 = *(Class *)((char *)&v7->super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_button);
  v10.receiver = v7;
  v10.super_class = ObjectType;
  v9 = -[ContextMenuButton tintColor](&v10, "tintColor");
  objc_msgSend(v8, "setTintColor:", v9);

}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _TtC23ShelfKitCollectionViews17ContextMenuButton *v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = type metadata accessor for InteractionContext(0);
  v22 = *(_QWORD *)(v6 - 8);
  v23 = v6;
  __chkstk_darwin(v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for PresentationSource(0);
  v9 = *(_QWORD *)(v21 - 8);
  __chkstk_darwin(v21);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)&self->episodeController[OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_episodeController
                                          + 8];
  v20 = *(_QWORD *)&self->episodeController[OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_episodeController
                                          + 16];
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_episodeController), v12);
  v13 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_objectGraph);
  v14 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_model;
  v15 = self;
  v16 = a3;
  v17 = PresentationSource.init(view:)(self);
  UIView.interactionContext.getter(v17);
  v18 = (void *)EpisodeControllerProtocol.contextMenuConfiguration(asPartOf:for:selectedModels:presentationSource:interactionContext:)(v13, v14, _swiftEmptyArrayStorage, v11, v8, v12, v20);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v23);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v21);

  return v18;
}

- (_TtC23ShelfKitCollectionViews17ContextMenuButton)initWithFrame:(CGRect)a3
{
  _TtC23ShelfKitCollectionViews17ContextMenuButton *result;

  result = (_TtC23ShelfKitCollectionViews17ContextMenuButton *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.ContextMenuButton", 41, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_objectGraph));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_episodeController));
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.super.super.super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_model));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews17ContextMenuButton_button));
}

@end
