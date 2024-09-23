@implementation HttpTemplateController

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC23ShelfKitCollectionViews22HttpTemplateController *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (void *)objc_opt_self(NSNotificationCenter);
  v5 = self;
  v6 = objc_msgSend(v4, "defaultCenter");
  objc_msgSend(v6, "removeObserver:", v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[HttpTemplateController dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews22HttpTemplateController_objectGraph));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews22HttpTemplateController_actionRunner));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC23ShelfKitCollectionViews22HttpTemplateController_templateAction));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22HttpTemplateController_textFields));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews22HttpTemplateController_okAction));
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtC23ShelfKitCollectionViews22HttpTemplateController *v12;
  char v13;

  length = a4.length;
  location = a4.location;
  static String._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v10 = v9;
  v11 = a3;
  v12 = self;
  sub_26BD74(v11, location, length);
  LOBYTE(length) = v13;

  swift_bridgeObjectRelease(v10);
  return length & 1;
}

- (void)textFieldDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC23ShelfKitCollectionViews22HttpTemplateController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  if (*((_BYTE *)&self->super.isa
       + OBJC_IVAR____TtC23ShelfKitCollectionViews22HttpTemplateController_hasRequiredParameters) == 1)
  {
    v9 = self;
    sub_26BA5C();

  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC23ShelfKitCollectionViews22HttpTemplateController)init
{
  _TtC23ShelfKitCollectionViews22HttpTemplateController *result;

  result = (_TtC23ShelfKitCollectionViews22HttpTemplateController *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.HttpTemplateController", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
