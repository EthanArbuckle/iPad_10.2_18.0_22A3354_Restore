@implementation DOCPreviewController

- (void)documentPicker:(id)a3 didConfirmDocumentsAt:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC5Files20DOCPreviewController *v10;

  v7 = type metadata accessor for URL(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_1003EF044(v8);

  swift_bridgeObjectRelease(v8);
}

- (QLPreviewControllerDelegate)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCPreviewController(0);
  return -[DOCPreviewController delegate](&v3, "delegate");
}

- (void)setDelegate:(id)a3
{
  _TtC5Files20DOCPreviewController *v5;
  _TtC5Files20DOCPreviewController *v6;
  objc_super v7;

  v5 = (_TtC5Files20DOCPreviewController *)a3;
  if (!a3)
    v5 = self;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for DOCPreviewController(0);
  v6 = self;
  swift_unknownObjectRetain(a3);
  -[DOCPreviewController setDelegate:](&v7, "setDelegate:", v5);

  swift_unknownObjectRelease(v5);
}

- (NSArray)keyCommands
{
  _TtC5Files20DOCPreviewController *v2;
  id v3;
  NSArray v4;

  v2 = self;
  v3 = DOCPreviewController.keyCommands.getter();

  if (v3)
  {
    sub_10004F2F0(0, &qword_1006445C0, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC5Files20DOCPreviewController *v7;
  uint64_t v8;
  _TtC5Files20DOCPreviewController *v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = DOCPreviewController.canPerformAction(_:withSender:)((uint64_t)a3, (uint64_t)v12);

  sub_10000CB4C((uint64_t)v12, &qword_100642730);
  return v10 & 1;
}

- (void)duplicate:(id)a3
{
  _TtC5Files20DOCPreviewController *v5;
  uint64_t v6;
  _TtC5Files20DOCPreviewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  DOCPreviewController.duplicate(_:)();

  sub_10000CB4C((uint64_t)v8, &qword_100642730);
}

- (void)move:(id)a3
{
  _TtC5Files20DOCPreviewController *v5;
  uint64_t v6;
  _TtC5Files20DOCPreviewController *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  _s5Files20DOCPreviewControllerC4moveyyypSgF_0();

  sub_10000CB4C((uint64_t)v8, &qword_100642730);
}

+ (id)sharedControllerFor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = _s5Files20DOCPreviewControllerC06sharedC03forACSgSo8NSStringCSg_tFZ_0(a3);

  return v5;
}

+ (void)clearSharedControllerFor:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  if (a3)
  {
    v3 = qword_1006411A8;
    v5 = a3;
    if (v3 != -1)
      swift_once(&qword_1006411A8, sub_100470A10);
    objc_msgSend((id)qword_100656EE0, "removeObjectForKey:");
  }
  else
  {
    v5 = *(id *)DOCLog.Source.unsafeMutableAddressor();
    v4 = static os_log_type_t.debug.getter(v5);
    os_log(_:dso:log:type:_:)("Scene Identifier was nil. This may not be not be a problem. Reproduce and investigate if it is ok.", 98, 2, &_mh_execute_header, v5, v4, _swiftEmptyArrayStorage);
  }

}

- (_TtC5Files20DOCPreviewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10047569C();
}

- (void)dismissViaKeyCommand
{
  -[DOCPreviewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5Files20DOCPreviewController *v4;

  v4 = self;
  DOCPreviewController.viewWillAppear(_:)(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  objc_class *v8;
  _TtC5Files20DOCPreviewController *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[24];
  objc_super v14;

  v3 = a3;
  v5 = sub_10006922C(&qword_100643470);
  __chkstk_darwin(v5);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = (objc_class *)type metadata accessor for DOCPreviewController(0);
  v14.receiver = self;
  v14.super_class = v8;
  v9 = self;
  -[DOCPreviewController viewDidAppear:](&v14, "viewDidAppear:", v3);
  sub_100472264();
  v10 = type metadata accessor for URL(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (uint64_t)v9 + OBJC_IVAR____TtC5Files20DOCPreviewController_importedURL;
  swift_beginAccess((char *)v9 + OBJC_IVAR____TtC5Files20DOCPreviewController_importedURL, v13, 33, 0);
  sub_100118024((uint64_t)v7, v11);
  swift_endAccess(v13);

}

- (int64_t)modalPresentationStyle
{
  return 5;
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCPreviewController(0);
  -[DOCPreviewController setModalPresentationStyle:](&v4, "setModalPresentationStyle:", a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC5Files20DOCPreviewController *v4;

  v4 = self;
  DOCPreviewController.viewWillDisappear(_:)(a3);

}

- (void)reallyBecomeCurrent:(id)a3
{
  void **v5;
  void *v6;
  _TtC5Files20DOCPreviewController *v7;
  id v8;
  id v9;
  id v10;
  _BYTE v11[24];

  v5 = (void **)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC5Files20DOCPreviewController_currentUserActivity);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files20DOCPreviewController_currentUserActivity, v11, 0, 0);
  v6 = *v5;
  v7 = self;
  v8 = a3;
  objc_msgSend(v6, "becomeCurrent");
  v9 = -[DOCPreviewController currentPreviewItem](v7, "currentPreviewItem");
  if (v9)
  {
    v10 = v9;
    sub_100475060(v9);

    swift_unknownObjectRelease(v10);
  }
  else
  {

  }
}

- (int64_t)numberOfPreviewItemsInPreviewController:(id)a3
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  void *v8;
  uint64_t v9;
  id v10;
  _TtC5Files20DOCPreviewController *v11;
  int64_t v12;

  v3 = (uint64_t *)((char *)self + OBJC_IVAR____TtC5Files20DOCPreviewController_source);
  v4 = self->editingDelegate[OBJC_IVAR____TtC5Files20DOCPreviewController_source];
  if (v4 == 255)
    return 0;
  v5 = *v3;
  if ((v4 & 1) != 0)
    return *(_QWORD *)(v5 + 16);
  if (!((unint64_t)v5 >> 62))
    return *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v8 = (void *)v3[1];
  if (v5 >= 0)
    v9 = v5 & 0xFFFFFFFFFFFFFF8;
  else
    v9 = *v3;
  v10 = a3;
  v11 = self;
  sub_1003EF2CC((id)v5, v8, v4);
  v12 = _CocoaArrayWrapper.endIndex.getter(v9);
  sub_100323BCC(v5, v8, v4);

  return v12;
}

- (id)previewController:(id)a3 previewItemAtIndex:(int64_t)a4
{
  char *v6;
  int v7;
  void *v9;
  void *v10;
  id v11;
  _TtC5Files20DOCPreviewController *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _TtC5Files20DOCPreviewController *v17;

  v6 = (char *)self + OBJC_IVAR____TtC5Files20DOCPreviewController_source;
  v7 = self->editingDelegate[OBJC_IVAR____TtC5Files20DOCPreviewController_source];
  if (v7 == 255)
  {
    v15 = objc_allocWithZone((Class)QLItem);
    v16 = a3;
    v17 = self;
    v14 = objc_msgSend(v15, "init");
  }
  else
  {
    v10 = *(void **)v6;
    v9 = (void *)*((_QWORD *)v6 + 1);
    v11 = a3;
    v12 = self;
    sub_1003EF2CC(v10, v9, v7);
    v14 = (id)sub_10046E8D8(a4, (uint64_t)v10, v13, v7 & 1);
    sub_100323BCC((uint64_t)v10, v9, v7);
  }

  return v14;
}

- (int64_t)previewController:(id)a3 editingModeForPreviewItem:(id)a4
{
  id v6;
  _TtC5Files20DOCPreviewController *v7;
  int64_t v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100475800((uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (id)dismissActionsForPreviewController:(id)a3
{
  sub_10004F2F0(0, &qword_10064EBF8, QLDismissAction_ptr);
  return Array._bridgeToObjectiveC()().super.isa;
}

- (BOOL)shouldAppendDefaultDismissActionsForPreviewController:(id)a3
{
  return 1;
}

- (BOOL)previewController:(id)a3 shouldAllowKeyCommandWithIdentifier:(unint64_t)a4
{
  return a4 - 4 < 0xFFFFFFFFFFFFFFFELL;
}

- (void)previewController:(id)a3 willSaveEditedItem:(id)a4
{
  id v6;
  _TtC5Files20DOCPreviewController *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_10047597C(a4);

  swift_unknownObjectRelease(a4);
}

- (void)previewController:(id)a3 didSaveEditedCopyOfPreviewItem:(id)a4 atURL:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC5Files20DOCPreviewController *v14;
  uint64_t v15;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a5);
  v13 = a3;
  swift_unknownObjectRetain(a4);
  v14 = self;
  sub_100475B00((uint64_t)a4, (uint64_t)v12);

  swift_unknownObjectRelease(a4);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)previewControllerWillDismiss:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(void);
  id v12;
  _TtC5Files20DOCPreviewController *v13;
  _BYTE v14[24];

  v5 = (char *)self + OBJC_IVAR____TtC5Files20DOCPreviewController_visibilityDelegate;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC5Files20DOCPreviewController_visibilityDelegate, v14, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5, v6);
  if (Strong)
  {
    v9 = Strong;
    v10 = *((_QWORD *)v5 + 1);
    swift_getObjectType(Strong, v8);
    v11 = *(void (**)(void))(v10 + 8);
    v12 = a3;
    v13 = self;
    v11();

    swift_unknownObjectRelease(v9);
  }
}

- (id)previewController:(id)a3 transitionViewForPreviewItem:(id)a4
{
  id v6;
  _TtC5Files20DOCPreviewController *v7;
  void *v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100475FA4((uint64_t)a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (id)excludedActivityTypesForPreviewController:(id)a3
{
  id v4;
  _TtC5Files20DOCPreviewController *v5;
  _QWORD *v6;
  Class isa;

  v4 = a3;
  v5 = self;
  v6 = _s5Files20DOCPreviewControllerC21excludedActivityTypes3forSayypGSo09QLPreviewC0C_tF_0();

  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (_TtC5Files20DOCPreviewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Files20DOCPreviewController *result;

  v4 = a4;
  result = (_TtC5Files20DOCPreviewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCPreviewController", 26, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files20DOCPreviewController_editingDelegate);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files20DOCPreviewController_visibilityDelegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files20DOCPreviewController_actionManager);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files20DOCPreviewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files20DOCPreviewController_duplicatedNodeObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files20DOCPreviewController_duplicatedNodeSubscriber));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files20DOCPreviewController_itemBeingRenamed));
  sub_100323BCC(*(uint64_t *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Files20DOCPreviewController_source), *(void **)&self->super._nonSourceBasedQLItems[OBJC_IVAR____TtC5Files20DOCPreviewController_source], self->editingDelegate[OBJC_IVAR____TtC5Files20DOCPreviewController_source]);
  sub_10000CB4C((uint64_t)self + OBJC_IVAR____TtC5Files20DOCPreviewController_importedURL, &qword_100643470);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files20DOCPreviewController_transitioningProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files20DOCPreviewController_observation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files20DOCPreviewController_linkNavigateInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files20DOCPreviewController_currentUserActivity));
}

@end
