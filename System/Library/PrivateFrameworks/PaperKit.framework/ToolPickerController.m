@implementation ToolPickerController

- (void)handleSqueezeInteractionDidChangePaletteViewVisibilityNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8PaperKit20ToolPickerController *v9;
  uint64_t v10;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  ToolPickerController.handleSqueezeInteractionDidChangePaletteViewVisibilityNotification(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)toolPickerWillShowNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8PaperKit20ToolPickerController *v9;
  uint64_t v10;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  ToolPickerController.toolPickerWillShowNotification(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)toolPickerDidHideNotification:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v3 = type metadata accessor for Notification();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3, v5);
  v7 = (char *)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  specialized ToolPickerController.toolPickerDidHideNotification(_:)();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3
{
  return -1;
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  return -1;
}

- (void)stickerPickerViewControllerDidDismiss
{
  _TtC8PaperKit20ToolPickerController *v2;

  v2 = self;
  ToolPickerController.stickerPickerViewControllerDidDismiss()();

}

- (void)insertStickerFromItemProvider:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(id, uint64_t (*)(char), uint64_t, uint64_t, uint64_t);
  id v11;
  _TtC8PaperKit20ToolPickerController *v12;
  id v13;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = (char *)self + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
  if (MEMORY[0x1DF0E666C]((char *)self + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
  {
    v8 = *((_QWORD *)v7 + 1);
    ObjectType = swift_getObjectType();
    v10 = *(void (**)(id, uint64_t (*)(char), uint64_t, uint64_t, uint64_t))(v8 + 72);
    v11 = a3;
    v12 = self;
    v10(v11, partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> (), v6, ObjectType, v8);

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    v13 = a3;
    swift_release();
  }

}

- (_TtC8PaperKit20ToolPickerController)init
{
  _TtC8PaperKit20ToolPickerController *result;

  result = (_TtC8PaperKit20ToolPickerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit20ToolPickerController____lazy_storage___textToolListViewController));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PaperKit20ToolPickerController____lazy_storage___shapeButtonListViewController));
}

- (void)imageDescriptionViewControllerDidSave:(id)a3
{
  id v4;
  _TtC8PaperKit20ToolPickerController *v5;

  v4 = a3;
  v5 = self;
  ToolPickerController.imageDescriptionViewControllerDidSave(_:)(v4);

}

- (void)imageDescriptionViewControllerDidCancel:(id)a3
{
  id v4;
  _TtC8PaperKit20ToolPickerController *v5;

  v4 = a3;
  v5 = self;
  ToolPickerController.imageDescriptionViewControllerDidCancel(_:)(v4);

}

- (void)imageDescriptionViewControllerDidDismiss:(id)a3
{
  id v4;
  _TtC8PaperKit20ToolPickerController *v5;

  v4 = a3;
  v5 = self;
  ToolPickerController.imageDescriptionViewControllerDidDismiss(_:)(v4);

}

@end
