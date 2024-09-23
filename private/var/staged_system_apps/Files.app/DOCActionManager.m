@implementation DOCActionManager

- (_TtC5Files16DOCActionManager)init
{
  uint64_t ObjectType;
  id v4;
  id v5;
  _TtC5Files16DOCActionManager *v6;

  ObjectType = swift_getObjectType(self, a2);
  v4 = objc_msgSend((id)objc_opt_self(FPItemManager), "defaultManager");
  v5 = objc_msgSend((id)objc_opt_self(DOCManagedPermission), "defaultPermission");
  v6 = (_TtC5Files16DOCActionManager *)(*(uint64_t (**)(id, id))(ObjectType + 248))(v4, v5);
  swift_deallocPartialClassInstance(self, ObjectType, 64, 7);
  return v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files16DOCActionManager_forbiddenActionIdentifiers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Files16DOCActionManager_associatedActionManagers));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_actions));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files16DOCActionManager_actionManagerDelegate);

}

- (void)setAssociatedActionManagers:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;

  v5 = type metadata accessor for DOCActionManager();
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_associatedActionManagers);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_associatedActionManagers) = v6;
  swift_bridgeObjectRelease(v7);
}

- (NSArray)forbiddenActionIdentifiers
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_forbiddenActionIdentifiers);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setForbiddenActionIdentifiers:(id)a3
{
  objc_class *v4;
  uint64_t v5;

  v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v5 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_forbiddenActionIdentifiers);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_forbiddenActionIdentifiers) = v4;
  swift_bridgeObjectRelease(v5);
}

- (NSArray)associatedActionManagers
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_associatedActionManagers);
  type metadata accessor for DOCActionManager();
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (NSArray)actions
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_actions);
  sub_10004F2F0(0, (unint64_t *)&unk_1006475D0, UIDocumentBrowserAction_ptr);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setActions:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;

  v5 = sub_10004F2F0(0, (unint64_t *)&unk_1006475D0, UIDocumentBrowserAction_ptr);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_actions);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files16DOCActionManager_actions) = v6;
  swift_bridgeObjectRelease(v7);
}

+ (BOOL)canMove:(id)a3 to:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t inited;
  uint64_t v15;
  _BYTE v16[40];

  v6 = sub_10006922C((uint64_t *)&unk_1006424B0);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v6);
  v8 = (void *)FPActionReparent;
  swift_unknownObjectRetain(a4);
  v9 = sub_1003598CC(v8, v7);
  v10 = v9;
  if (a4)
  {
    if ((v9 & 1) == 0)
    {
      swift_unknownObjectRelease(a4);
      swift_bridgeObjectRelease(v7);
      v10 = 0;
      return v10 & 1;
    }
    v11 = (void *)FPActionImportHere;
    v12 = sub_10006922C((uint64_t *)&unk_1006441A0);
    inited = swift_initStackObject(v12, v16);
    *(_OWORD *)(inited + 16) = xmmword_1004D9B40;
    *(_QWORD *)(inited + 32) = a4;
    v15 = inited;
    specialized Array._endMutation()(inited);
    swift_unknownObjectRetain(a4);
    v10 = sub_1003598CC(v11, v15);
    swift_bridgeObjectRelease(v15);
    swift_unknownObjectRelease(a4);
  }
  swift_bridgeObjectRelease(v7);
  return v10 & 1;
}

+ (BOOL)canCreateNewFolderIn:(id)a3
{
  return sub_100352AB8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100359064);
}

+ (BOOL)canImportIn:(id)a3
{
  return sub_100352AB8((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_100358FD4);
}

+ (BOOL)canShowInfoIn:(id)a3
{
  return a3 != 0;
}

- (void)performAction:(id)a3 withURLs:(id)a4 completionHandler:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _TtC5Files16DOCActionManager *v15;

  v8 = _Block_copy(a5);
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v11 = v10;
  v12 = sub_10004F2F0(0, &qword_100644C20, FPSandboxingURLWrapper_ptr);
  v13 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v12);
  v14 = swift_allocObject(&unk_1005E0168, 24, 7);
  *(_QWORD *)(v14 + 16) = v8;
  v15 = self;
  DOCActionManager.perform(actionWithIdentifier:with:completionHandler:)(v9, v11, v13, (uint64_t)sub_100145FB4, v14);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v13);
  swift_release(v14);
}

@end
