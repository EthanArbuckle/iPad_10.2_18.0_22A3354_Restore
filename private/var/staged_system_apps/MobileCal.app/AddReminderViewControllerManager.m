@implementation AddReminderViewControllerManager

- (AddItemViewControllerManagerDelegate)addItemViewControllerManagerDelegate
{
  return (AddItemViewControllerManagerDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_addItemViewControllerManagerDelegate, a2);
}

- (void)setAddItemViewControllerManagerDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_addItemViewControllerManagerDelegate, a3);
}

- (_TtC9MobileCal32AddReminderViewControllerManager)initWithModel:(id)a3
{
  id v3;
  _TtC9MobileCal32AddReminderViewControllerManager *v4;
  _TtC9MobileCal32AddReminderViewControllerManager *v5;

  v3 = a3;
  sub_10011F468(v3);
  v5 = v4;

  return v5;
}

- (NSString)newItemTitle
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  _TtC9MobileCal32AddReminderViewControllerManager *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  __int16 v19;
  _BYTE v20[16];

  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v8 = &v20[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin();
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = self;
  v14 = String.LocalizationValue.init(stringLiteral:)(0x7265646E696D6552, 0xE800000000000000);
  static Locale.current.getter(v14);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  v19 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("NewReminderItemTitle", 20, 2, v10, 0, 0, v8, v6, "Title for creating a new reminder, displayed in a segmented control at the top of the UI for creating an event or reminder.", 123, v19);
  String.init(localized:)(v12);
  v16 = v15;

  v17 = (NSString *)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16);
  return v17;
}

- (NSString)newItemBackButtonTitle
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  _TtC9MobileCal32AddReminderViewControllerManager *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSString *v17;
  __int16 v19;
  _BYTE v20[16];

  v3 = type metadata accessor for LocalizedStringResource.BundleDescription(0, a2);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = &v20[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Locale(0);
  __chkstk_darwin();
  v8 = &v20[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin();
  v10 = &v20[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin();
  v12 = &v20[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = self;
  v14 = String.LocalizationValue.init(stringLiteral:)(0x696D65522077654ELL, 0xEC0000007265646ELL);
  static Locale.current.getter(v14);
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v4 + 104))(v6, enum case for LocalizedStringResource.BundleDescription.main(_:), v3);
  v19 = 2;
  LocalizedStringResource.init(_:defaultValue:table:locale:bundle:comment:)("NewReminderItemBackButtonTitle", 30, 2, v10, 0, 0, v8, v6, "Title for back button used for view controllers pushed on the new reminder editor", 81, v19);
  String.init(localized:)(v12);
  v16 = v15;

  v17 = (NSString *)String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16);
  return v17;
}

- (id)createViewController:(id)a3
{
  id v4;
  _TtC9MobileCal32AddReminderViewControllerManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_10011A98C(v4);

  return v6;
}

- (UIViewController)viewController
{
  _TtC9MobileCal32AddReminderViewControllerManager *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_10011BA68();

  return (UIViewController *)v3;
}

- (void)updateUIFromState:(id)a3
{
  id v4;
  _TtC9MobileCal32AddReminderViewControllerManager *v5;

  v4 = a3;
  v5 = self;
  sub_10011BBA4(v4);

}

- (void)updateStateFromUI:(id)a3
{
  id v4;
  _TtC9MobileCal32AddReminderViewControllerManager *v5;

  v4 = a3;
  v5 = self;
  sub_10011BF40(v4);

}

- (BOOL)canDismiss
{
  _TtC9MobileCal32AddReminderViewControllerManager *v2;
  char v3;

  v2 = self;
  v3 = sub_10011CC2C();

  return v3 & 1;
}

- (id)confirmDismissAlertController
{
  _TtC9MobileCal32AddReminderViewControllerManager *v2;
  uint64_t v3;
  id v4;

  v2 = self;
  v4 = sub_10011CE94((uint64_t)v2, v3);

  return v4;
}

- (void)presentationControllerDidDismiss
{
  uint64_t Strong;
  void *v4;
  _TtC9MobileCal32AddReminderViewControllerManager *v5;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_addItemViewControllerManagerDelegate, a2);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = self;
    objc_msgSend(v4, "addItemViewControllerManager:didCompleteWithAction:", v5, 0);

    swift_unknownObjectRelease(v4);
  }
}

- (BOOL)hasUnsavedChanges
{
  _TtC9MobileCal32AddReminderViewControllerManager *v2;
  char v3;

  v2 = self;
  v3 = sub_10011D5EC();

  return v3 & 1;
}

- (BOOL)willPresentDialogOnSave
{
  _TtC9MobileCal32AddReminderViewControllerManager *v2;
  char v3;

  v2 = self;
  v3 = sub_10011D778();

  return v3 & 1;
}

- (void)completeAndSaveWithContinueBlock:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC9MobileCal32AddReminderViewControllerManager *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_1001B60C8, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_10011FF28;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_10011D910((uint64_t)v7, v6);
  sub_10011FA88((uint64_t)v7, v6);

}

- (BOOL)ignoreUnsavedChanges
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_ignoreUnsavedChanges);
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_ignoreUnsavedChanges) = a3;
}

- (void)cancelEditing
{
  _TtC9MobileCal32AddReminderViewControllerManager *v2;

  v2 = self;
  sub_10011DEE8();

}

- (void)requestReminderSheet:(id)a3
{
  id v4;
  _TtC9MobileCal32AddReminderViewControllerManager *v5;

  v4 = a3;
  v5 = self;
  sub_10011F808(v4);

}

- (_TtC9MobileCal32AddReminderViewControllerManager)init
{
  _TtC9MobileCal32AddReminderViewControllerManager *result;

  result = (_TtC9MobileCal32AddReminderViewControllerManager *)_swift_stdlib_reportUnimplementedInitializer("MobileCal.AddReminderViewControllerManager", 42, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_undoManager));

  sub_10001CCFC((uint64_t)self + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_creationModule, (uint64_t *)&unk_1001F5970);
  sub_10001CCFC((uint64_t)self + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_initialDateComponents, (uint64_t *)&unk_1001F5D80);
  sub_10011FF30((uint64_t)self + OBJC_IVAR____TtC9MobileCal32AddReminderViewControllerManager_addItemViewControllerManagerDelegate);
}

@end
