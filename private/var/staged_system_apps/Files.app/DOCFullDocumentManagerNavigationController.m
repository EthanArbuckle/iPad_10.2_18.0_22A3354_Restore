@implementation DOCFullDocumentManagerNavigationController

- (NSArray)viewControllers
{
  id v2;
  NSArray *v3;
  unint64_t v4;
  uint64_t v5;
  Class isa;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCFullDocumentManagerNavigationController();
  v2 = v8.receiver;
  v3 = -[DOCFullDocumentManagerNavigationController viewControllers](&v8, "viewControllers");
  v4 = sub_10004C6C4();
  v5 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v3, v4);

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v5);
  return (NSArray *)isa;
}

- (_TtC5Files42DOCFullDocumentManagerNavigationController)init
{
  _TtC5Files42DOCFullDocumentManagerNavigationController *result;

  result = (_TtC5Files42DOCFullDocumentManagerNavigationController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCFullDocumentManagerNavigationController", 48, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)setViewControllers:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  _TtC5Files42DOCFullDocumentManagerNavigationController *v7;

  v5 = sub_10004C6C4();
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = self;
  sub_100003F18(v6);

}

- (_TtC5Files42DOCFullDocumentManagerNavigationController)initWithConfiguration:(id)a3
{
  id v4;
  _TtC5Files42DOCFullDocumentManagerNavigationController *v5;
  void *v6;
  _TtC5Files42DOCFullDocumentManagerNavigationController *v7;
  objc_super v9;

  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Files42DOCFullDocumentManagerNavigationController_chromelessAppearanceDisabled) = 1;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files42DOCFullDocumentManagerNavigationController_configuration) = (Class)a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCFullDocumentManagerNavigationController();
  v4 = a3;
  v5 = -[DOCNavigationController init](&v9, "init");
  v6 = *(Class *)((char *)&v5->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files42DOCFullDocumentManagerNavigationController_configuration);
  v7 = v5;
  objc_msgSend(v6, "isPickerUI", v9.receiver, v9.super_class);

  return v7;
}

- (BOOL)chromelessAppearanceDisabled
{
  return *((_BYTE *)&self->super.super.super.super.super.isa
         + OBJC_IVAR____TtC5Files42DOCFullDocumentManagerNavigationController_chromelessAppearanceDisabled);
}

- (void)setChromelessAppearanceDisabled:(BOOL)a3
{
  _TtC5Files42DOCFullDocumentManagerNavigationController *v4;

  v4 = self;
  sub_10016E5B0(a3);

}

- (BOOL)navigationBar:(id)a3 shouldPopItem:(id)a4
{
  id v6;
  id v7;
  _TtC5Files42DOCFullDocumentManagerNavigationController *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  unsigned __int8 v14;
  __objc2_prot *v16;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = -[DOCFullDocumentManagerNavigationController delegate](v8, "delegate");
  if (!v9)
  {

LABEL_6:
    v14 = 1;
    goto LABEL_7;
  }
  v10 = v9;
  v16 = &OBJC_PROTOCOL____TtP5Files34UINavigationControllerDelegate_DOC__0;
  v11 = swift_dynamicCastObjCProtocolConditional(v9, 1, &v16);
  if (!v11)
  {

    swift_unknownObjectRelease(v10);
    goto LABEL_6;
  }
  v12 = (void *)v11;
  v13 = -[DOCFullDocumentManagerNavigationController topViewController](v8, "topViewController");
  v14 = objc_msgSend(v12, "navigationController:canPop:", v8, v13);

  swift_unknownObjectRelease(v10);
LABEL_7:

  return v14;
}

- (_TtC5Files42DOCFullDocumentManagerNavigationController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC5Files42DOCFullDocumentManagerNavigationController *result;

  v3 = a3;
  result = (_TtC5Files42DOCFullDocumentManagerNavigationController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCFullDocumentManagerNavigationController", 48, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files42DOCFullDocumentManagerNavigationController_configuration));
}

@end
