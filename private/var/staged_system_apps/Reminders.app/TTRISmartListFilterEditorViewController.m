@implementation TTRISmartListFilterEditorViewController

- (_TtC9Reminders39TTRISmartListFilterEditorViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001CC8F0();
}

- (void)loadView
{
  id v3;
  _TtC9Reminders39TTRISmartListFilterEditorViewController *v4;
  id v5;

  v3 = objc_allocWithZone((Class)UITableView);
  v4 = self;
  v5 = objc_msgSend(v3, "initWithFrame:style:", 2, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v5, "setEstimatedRowHeight:", UITableViewAutomaticDimension);
  objc_msgSend(v5, "setEstimatedSectionHeaderHeight:", UITableViewAutomaticDimension);
  objc_msgSend(v5, "setEstimatedSectionHeaderHeight:", UITableViewAutomaticDimension);
  -[TTRISmartListFilterEditorViewController setView:](v4, "setView:", v5);

}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders39TTRISmartListFilterEditorViewController *v3;

  v3 = self;
  sub_1001BF4F4((uint64_t)v3, v2);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *ObjectType;
  _TtC9Reminders39TTRISmartListFilterEditorViewController *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[5];
  objc_super v12;

  v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v12.receiver = self;
  v12.super_class = ObjectType;
  v6 = self;
  -[TTRISmartListFilterEditorViewController viewWillAppear:](&v12, "viewWillAppear:", v3);
  v7 = -[TTRISmartListFilterEditorViewController view](v6, "view");
  if (v7)
  {
    v8 = v7;
    v9 = objc_opt_self(UITableView);
    v10 = swift_dynamicCastObjCClassUnconditional(v8, v9, 0, 0, 0);
    v11[3] = sub_100005ED8(0, (unint64_t *)&qword_100646410, UITableView_ptr);
    v11[4] = &protocol witness table for UITableView;
    v11[0] = v10;
    UIViewController.deselectRowsAlongsideTransition(for:animated:)(v11, v3);
    sub_100027F10(v11);
    TTRKeyboardAvoidance<>.startAvoidingKeyboard()(ObjectType, &off_1005F5A20);

  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType(self, a2);
  v4 = v5.receiver;
  -[TTRISmartListFilterEditorViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  objc_msgSend(v4, "becomeFirstResponder", v5.receiver, v5.super_class);
  *((_BYTE *)v4
  + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController_ttrAccessibilityShouldAnnounceOptionChanges) = 1;

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9Reminders39TTRISmartListFilterEditorViewController *v4;

  v4 = self;
  sub_1001BF9FC(a3, (uint64_t)v4);

}

- (void)cancelButtonAction:(id)a3
{
  _TtC9Reminders39TTRISmartListFilterEditorViewController *v5;
  _TtC9Reminders39TTRISmartListFilterEditorViewController *v6;
  _OWORD v7[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v6 = self;
  }
  sub_1001C9F84();

  sub_1000073A0((uint64_t)v7, &qword_100640E50);
}

- (void)doneButtonAction:(id)a3
{
  _TtC9Reminders39TTRISmartListFilterEditorViewController *v5;
  _TtC9Reminders39TTRISmartListFilterEditorViewController *v6;
  _OWORD v7[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v7, 0, sizeof(v7));
    v6 = self;
  }
  sub_1002E5FA8();

  sub_1000073A0((uint64_t)v7, &qword_100640E50);
}

- (_TtC9Reminders39TTRISmartListFilterEditorViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders39TTRISmartListFilterEditorViewController *result;

  v4 = a4;
  result = (_TtC9Reminders39TTRISmartListFilterEditorViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRISmartListFilterEditorViewController", 49, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController_presenter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController_tableDataController));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___dateSection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___dateGroup));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___locationSection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___locationGroup));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___flaggedSection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___flaggedGroup));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___prioritySection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___priorityGroup));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___listsSection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___listsGroup));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___hashtagsSection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___hashtagsGroup));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___disabledFiltersSection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___disabledFiltersGroup));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___documentationSection));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___filterOperatorSection));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___enabledFilters));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___dateOptionsCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___compactDateDetailCell1));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___compactDatePickerCell1));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___relativeRangeCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___compactDateDetailCell2));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___compactDatePickerCell2));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___regularWidthDatePickerCell1));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___regularWidthDatePickerCell2));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___includePastDueRemindersCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___timeOptionsCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___priorityOptionsCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___flaggedOptionsCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___locationOptionsCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___locationQuickPicksCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___locationDetailCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___hashtagOptionsCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___hashtagCollectionCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___hashtagToggleShowMoreCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___listsOptionsCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___listCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___listPopoverCell));
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController____lazy_storage___filterOperatorCell));
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  _TtC9Reminders39TTRISmartListFilterEditorViewController *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  id v9;
  _TtC9Reminders39TTRISmartListFilterEditorViewController *v10;

  v4 = self;
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders39TTRISmartListFilterEditorViewController_presenter);
  v6 = v5[13];
  v7 = v5[14];
  sub_10001413C(v5 + 10, v6);
  v8 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 24);
  v9 = a3;
  v10 = v4;
  LOBYTE(v4) = v8(v6, v7);

  return (v4 & 1) == 0;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4;
  _TtC9Reminders39TTRISmartListFilterEditorViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1001C9F84();

}

@end
