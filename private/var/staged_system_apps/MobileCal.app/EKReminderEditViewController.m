@implementation EKReminderEditViewController

- (_TtC9MobileCal28EKReminderEditViewController)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC9MobileCal28EKReminderEditViewController *result;

  v5 = (char *)self + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_currentModule;
  v6 = type metadata accessor for RemindersInCalendarUtilities.ReminderEditingModule(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_internalEditViewDelegate, 0);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_event) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_ignoreUnsavedChanges) = 0;
  v7 = a3;

  result = (_TtC9MobileCal28EKReminderEditViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100195A30, "MobileCal/EKReminderEditViewController.swift", 44, 2, 22, 0);
  __break(1u);
  return result;
}

- (_TtC9MobileCal28EKReminderEditViewController)initWithModel:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v5 = (char *)self + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_currentModule;
  v6 = type metadata accessor for RemindersInCalendarUtilities.ReminderEditingModule(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_internalEditViewDelegate, 0);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_event) = 0;
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_ignoreUnsavedChanges) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_model) = (Class)a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EKReminderEditViewController(0);
  v7 = a3;
  return -[EKReminderEditViewController initWithNibName:bundle:](&v9, "initWithNibName:bundle:", 0, 0);
}

- (EKEventOrIntegrationEditViewDelegate)internalEditViewDelegate
{
  return (EKEventOrIntegrationEditViewDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_internalEditViewDelegate);
}

- (void)setInternalEditViewDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_internalEditViewDelegate, a3);
}

- (EKEvent)event
{
  return (EKEvent *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_event));
}

- (void)setEvent:(id)a3
{
  void *v4;
  _TtC9MobileCal28EKReminderEditViewController *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_event);
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_event) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_1001264FC();
}

- (void)refreshStartAndEndDates
{
  _TtC9MobileCal28EKReminderEditViewController *v2;

  v2 = self;
  sub_100126E64();

}

- (void)configureAppearanceForSplitDayView
{
  id v3;
  _TtC9MobileCal28EKReminderEditViewController *v4;
  id v5;
  id v6;

  v3 = objc_allocWithZone((Class)UINavigationBarAppearance);
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  objc_msgSend(v5, "configureWithOpaqueBackground");
  v6 = -[EKReminderEditViewController navigationBar](v4, "navigationBar");
  objc_msgSend(v6, "setScrollEdgeAppearance:", v5);

}

- (BOOL)hasUnsavedChanges
{
  _TtC9MobileCal28EKReminderEditViewController *v2;
  char v3;

  v2 = self;
  v3 = sub_1001271A4();

  return v3 & 1;
}

- (BOOL)willPresentDialogOnSave
{
  _TtC9MobileCal28EKReminderEditViewController *v2;
  uint64_t v3;
  char v4;

  v2 = self;
  v4 = sub_100127328((uint64_t)v2, v3);

  return v4 & 1;
}

- (void)completeAndSaveWithContinueBlock:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  _TtC9MobileCal28EKReminderEditViewController *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject(&unk_1001B6620, 24, 7);
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_100128AF0;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_1001274B8((void (*)(uint64_t))v7, v6);
  sub_10011FA88((uint64_t)v7, v6);

}

- (BOOL)ignoreUnsavedChanges
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_ignoreUnsavedChanges);
}

- (void)setIgnoreUnsavedChanges:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_ignoreUnsavedChanges) = a3;
}

- (void)cancelEditing
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _TtC9MobileCal28EKReminderEditViewController *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_10000EDD8(&qword_1001F5D60);
  __chkstk_darwin(v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor(0);
  v7 = self;
  v8 = static MainActor.shared.getter(v7);
  v9 = (_QWORD *)swift_allocObject(&unk_1001B65F8, 40, 7);
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  v10 = sub_1001236B0((uint64_t)v5, (uint64_t)&unk_1001F5DA8, (uint64_t)v9);

  swift_release(v10);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for EKReminderEditViewController(0);
  v4 = v9.receiver;
  -[EKReminderEditViewController viewWillAppear:](&v9, "viewWillAppear:", v3);
  v5 = objc_msgSend(v4, "presentationController", v9.receiver, v9.super_class);
  v6 = objc_msgSend(v5, "delegate");
  swift_unknownObjectRelease(v6);

  if (!v6)
  {
    v7 = objc_msgSend(v4, "presentationController");
    if (v7)
    {
      v8 = v7;
      objc_msgSend(v7, "setDelegate:", v4);

      v4 = v8;
    }
  }

}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _TtC9MobileCal28EKReminderEditViewController *v9;
  id v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = sub_10000EDD8(&qword_1001F5D60);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor(0);
  v9 = self;
  v10 = a3;
  v11 = static MainActor.shared.getter(v10);
  v12 = (_QWORD *)swift_allocObject(&unk_1001B65D0, 40, 7);
  v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = v9;
  v13 = sub_1001236B0((uint64_t)v7, (uint64_t)&unk_1001F5D98, (uint64_t)v12);

  swift_release(v13);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4;
  _TtC9MobileCal28EKReminderEditViewController *v5;
  uint64_t v6;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100128254((uint64_t)v5, v6);

  return self & 1;
}

- (BOOL)wantsManagement
{
  return 1;
}

- (BOOL)canManagePresentationStyle
{
  return 1;
}

- (_TtC9MobileCal28EKReminderEditViewController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  _TtC9MobileCal28EKReminderEditViewController *result;

  result = (_TtC9MobileCal28EKReminderEditViewController *)_swift_stdlib_reportUnimplementedInitializer("MobileCal.EKReminderEditViewController", 38, "init(navigationBarClass:toolbarClass:)", 38, 0);
  __break(1u);
  return result;
}

- (_TtC9MobileCal28EKReminderEditViewController)initWithRootViewController:(id)a3
{
  id v3;
  _TtC9MobileCal28EKReminderEditViewController *result;

  v3 = a3;
  result = (_TtC9MobileCal28EKReminderEditViewController *)_swift_stdlib_reportUnimplementedInitializer("MobileCal.EKReminderEditViewController", 38, "init(rootViewController:)", 25, 0);
  __break(1u);
  return result;
}

- (_TtC9MobileCal28EKReminderEditViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9MobileCal28EKReminderEditViewController *result;

  v4 = a4;
  result = (_TtC9MobileCal28EKReminderEditViewController *)_swift_stdlib_reportUnimplementedInitializer("MobileCal.EKReminderEditViewController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001CCFC((uint64_t)self + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_currentModule, &qword_1001F5D68);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_model));
  sub_10011FF30((uint64_t)self + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_internalEditViewDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC9MobileCal28EKReminderEditViewController_event));
}

@end
