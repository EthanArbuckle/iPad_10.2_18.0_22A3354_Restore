@implementation TTRIShowRemindersViewController

- (_TtC9Reminders31TTRIShowRemindersViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10029A414();
}

- (void)viewDidLoad
{
  uint64_t v2;
  _TtC9Reminders31TTRIShowRemindersViewController *v3;

  v3 = self;
  sub_10028E4B4((uint64_t)v3, v2);

}

- (void)viewWillLayoutSubviews
{
  uint64_t v2;
  _TtC9Reminders31TTRIShowRemindersViewController *v3;

  v3 = self;
  sub_1002901D4((uint64_t)v3, v2);

}

- (void)viewDidLayoutSubviews
{
  _TtC9Reminders31TTRIShowRemindersViewController *v2;

  v2 = self;
  sub_1002908A0(0, 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC9Reminders31TTRIShowRemindersViewController *v4;

  v4 = self;
  sub_100290BFC(a3, (uint64_t)v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC9Reminders31TTRIShowRemindersViewController *v4;

  v4 = self;
  sub_100290F58(a3, (uint64_t)v4);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC9Reminders31TTRIShowRemindersViewController *v4;

  v4 = self;
  sub_1002915D0(a3, (uint64_t)v4);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType(self, a2);
  v4 = (char *)v8.receiver;
  -[TTRIShowRemindersViewController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter + 8];
  ObjectType = swift_getObjectType(*(_QWORD *)&v4[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter], v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 376))(ObjectType, v5);

}

- (void)updateUserActivityState:(id)a3
{
  id v4;
  _TtC9Reminders31TTRIShowRemindersViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100291A74(v4, (uint64_t)v5);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_class *ObjectType;
  _TtC9Reminders31TTRIShowRemindersViewController *v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v8 = self;
  if (-[TTRIShowRemindersViewController isEditing](v8, "isEditing") == v5)
  {

  }
  else
  {
    UIViewController.endFirstResponderEditing()();
    v9.receiver = v8;
    v9.super_class = ObjectType;
    -[TTRIShowRemindersViewController setEditing:animated:](&v9, "setEditing:animated:", v5, v4);
    objc_msgSend(*(id *)&v8->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_contentViewController], "setEditing:animated:", v5, v4);
    sub_1002908A0(1, 1);
    sub_100291CAC();

  }
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  Class isa;
  uint64_t v9;

  v3 = sub_10002A750((uint64_t *)&unk_1006415A0);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100521140;
  v5 = *(void **)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_contentViewController];
  *(_QWORD *)(v4 + 32) = v5;
  v9 = v4;
  specialized Array._endMutation()(v4);
  v6 = v5;
  sub_10002A750((uint64_t *)&unk_100652070);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return (NSArray *)isa;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC9Reminders31TTRIShowRemindersViewController *v7;
  _TtC9Reminders31TTRIShowRemindersViewController *v8;
  char v9;
  _OWORD v11[2];

  if (a4)
  {
    v7 = self;
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v11);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v11, 0, sizeof(v11));
    v8 = self;
  }
  v9 = sub_100291F8C((uint64_t)a3, (uint64_t)v11);

  sub_1000073A0((uint64_t)v11, &qword_100640E50);
  return v9 & 1;
}

- (void)cut:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100293F24);
}

- (void)copy:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100294014);
}

- (void)paste:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100294104);
}

- (void)validateCommand:(id)a3
{
  id v4;
  _TtC9Reminders31TTRIShowRemindersViewController *v5;

  v4 = a3;
  v5 = self;
  sub_1002941F4(v4, (uint64_t)v5);

}

- (void)ttr_updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4;
  _TtC9Reminders31TTRIShowRemindersViewController *v5;

  v4 = a3;
  v5 = self;
  sub_10029A5EC();

}

- (void)endEditingReminderAction:(id)a3
{
  _TtC9Reminders31TTRIShowRemindersViewController *v5;
  uint64_t v6;
  _TtC9Reminders31TTRIShowRemindersViewController *v7;
  uint64_t v8;
  uint64_t ObjectType;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  ObjectType = swift_getObjectType(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter], v6);
  (*(void (**)(uint64_t, uint64_t))(v8 + 368))(ObjectType, v8);

  sub_1000073A0((uint64_t)v10, &qword_100640E50);
}

- (void)collapseReminderSubtasksWithArrowKeyAction:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100294C70);
}

- (void)expandReminderSubtasksWithArrowKeyAction:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100294E34);
}

- (void)collapseReminderSubtasksAlternativeShortcutAction:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100294C70);
}

- (void)expandReminderSubtasksAlternativeShortcutAction:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100294E34);
}

- (void)deleteReminderAction:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC9Reminders31TTRIShowRemindersViewController *v12;
  _TtC9Reminders31TTRIShowRemindersViewController *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  _OWORD v17[2];

  v5 = sub_10002A750((uint64_t *)&unk_100640EB0);
  __chkstk_darwin(v5);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v12 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v17);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v13 = self;
  }
  sub_100293C70((uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1000073A0((uint64_t)v7, (uint64_t *)&unk_100640EB0);
  }
  else
  {
    sub_10001F580((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Item);
    v14 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
    ObjectType = swift_getObjectType(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter], v15);
    (*(void (**)(char *, Reminders::TTRReminderIDsWithMatchingHashtagsProvider (__swiftcall *)(Swift::OpaquePointer), _QWORD, uint64_t, uint64_t))(v14 + 80))(v11, TTRReminderIDsWithMatchingHashtagsProvider.init(reminders:), 0, ObjectType, v14);
    sub_10001F544((uint64_t)v11, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Item);
  }

  sub_1000073A0((uint64_t)v17, &qword_100640E50);
}

- (void)newReminderAction:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100295194);
}

- (void)startEditingReminderAction:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100295254);
}

- (void)expandAllItemsAction:(id)a3
{
  _TtC9Reminders31TTRIShowRemindersViewController *v5;
  uint64_t v6;
  _TtC9Reminders31TTRIShowRemindersViewController *v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  id v16;
  _OWORD v17[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v17);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v7 = self;
  }
  v8 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  ObjectType = swift_getObjectType(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter], v6);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 448))(ObjectType, v8);
  v11 = *(void **)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_contentViewController];
  v12 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_contentViewController];
  v14 = swift_getObjectType(v11, v13);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 200);
  v16 = v11;
  v15(v10, v14, v12);

  swift_bridgeObjectRelease(v10);
  sub_1000073A0((uint64_t)v17, &qword_100640E50);
}

- (void)collapseAllItemsAction:(id)a3
{
  _TtC9Reminders31TTRIShowRemindersViewController *v5;
  uint64_t v6;
  _TtC9Reminders31TTRIShowRemindersViewController *v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  id v16;
  _OWORD v17[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v17);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v7 = self;
  }
  v8 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  ObjectType = swift_getObjectType(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter], v6);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 448))(ObjectType, v8);
  v11 = *(void **)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_contentViewController];
  v12 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_contentViewController];
  v14 = swift_getObjectType(v11, v13);
  v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 208);
  v16 = v11;
  v15(v10, v14, v12);

  swift_bridgeObjectRelease(v10);
  sub_1000073A0((uint64_t)v17, &qword_100640E50);
}

- (void)showReminderInfoAction:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100295524);
}

- (void)toggleReminderCompletionStateAction:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_1002957A0);
}

- (void)indentSelectedReminderAction:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100295994);
}

- (void)outdentSelectedReminderAction:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100295B20);
}

- (void)toggleFlaggedForSelectedReminderAction:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_100295CAC);
}

- (void)addStructuredHashtagForSelectedReminderAction:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _TtC9Reminders31TTRIShowRemindersViewController *v12;
  _TtC9Reminders31TTRIShowRemindersViewController *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  _OWORD v17[2];

  v5 = sub_10002A750((uint64_t *)&unk_100640EB0);
  __chkstk_darwin(v5);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    v12 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v17);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
    v13 = self;
  }
  sub_100293C70((uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1000073A0((uint64_t)v7, (uint64_t *)&unk_100640EB0);
  }
  else
  {
    sub_10001F580((uint64_t)v7, (uint64_t)v11, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Item);
    v14 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
    ObjectType = swift_getObjectType(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter], v15);
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 176))(v11, ObjectType, v14);
    sub_10001F544((uint64_t)v11, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Item);
  }

  sub_1000073A0((uint64_t)v17, &qword_100640E50);
}

- (void)setReminderDueDateToTodayAction:(id)a3
{
  sub_1002960D0(self, (uint64_t)a2, (uint64_t)a3, 1);
}

- (void)setReminderDueDateToTomorrowAction:(id)a3
{
  sub_1002960D0(self, (uint64_t)a2, (uint64_t)a3, 2);
}

- (void)setReminderDueDateToWeekendAction:(id)a3
{
  sub_1002960D0(self, (uint64_t)a2, (uint64_t)a3, 3);
}

- (void)setReminderDueDateToNextWeekAction:(id)a3
{
  sub_1002960D0(self, (uint64_t)a2, (uint64_t)a3, 4);
}

- (void)setReminderDueDateToNoneAction:(id)a3
{
  sub_1002960D0(self, (uint64_t)a2, (uint64_t)a3, 0);
}

- (void)postponeAllOverdueToTodayAction:(id)a3
{
  _TtC9Reminders31TTRIShowRemindersViewController *v5;
  uint64_t v6;
  _TtC9Reminders31TTRIShowRemindersViewController *v7;
  uint64_t v8;
  uint64_t ObjectType;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  ObjectType = swift_getObjectType(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter], v6);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 640))(1, ObjectType, v8);

  sub_1000073A0((uint64_t)v10, &qword_100640E50);
}

- (void)printListAction:(id)a3
{
  _TtC9Reminders31TTRIShowRemindersViewController *v5;
  uint64_t v6;
  _TtC9Reminders31TTRIShowRemindersViewController *v7;
  uint64_t v8;
  uint64_t ObjectType;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  ObjectType = swift_getObjectType(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter], v6);
  (*(void (**)(uint64_t, uint64_t))(v8 + 792))(ObjectType, v8);

  sub_1000073A0((uint64_t)v10, &qword_100640E50);
}

- (void)toggleShowCompletedAction:(id)a3
{
  _TtC9Reminders31TTRIShowRemindersViewController *v5;
  uint64_t v6;
  _TtC9Reminders31TTRIShowRemindersViewController *v7;
  uint64_t v8;
  uint64_t ObjectType;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, __n128);
  __n128 v17;
  _OWORD v18[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v18);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v18, 0, sizeof(v18));
    v7 = self;
  }
  v8 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  ObjectType = swift_getObjectType(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter], v6);
  v13 = (uint64_t *)TTRITipKitSignalContext.RemindersList.keyboardShortcut.unsafeMutableAddressor(ObjectType, v10, v11, v12);
  v14 = *v13;
  v15 = v13[1];
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, __n128))(v8 + 808);
  v17 = swift_bridgeObjectRetain(v15);
  v16(v14, v15, ObjectType, v8, v17);

  swift_bridgeObjectRelease(v15);
  sub_1000073A0((uint64_t)v18, &qword_100640E50);
}

- (void)newSectionAction:(id)a3
{
  _TtC9Reminders31TTRIShowRemindersViewController *v5;
  uint64_t v6;
  _TtC9Reminders31TTRIShowRemindersViewController *v7;
  uint64_t v8;
  uint64_t ObjectType;
  _OWORD v10[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v10);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v7 = self;
  }
  v8 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  ObjectType = swift_getObjectType(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter], v6);
  (*(void (**)(uint64_t, uint64_t))(v8 + 856))(ObjectType, v8);

  sub_1000073A0((uint64_t)v10, &qword_100640E50);
}

- (void)newSectionWithSelectionAction:(id)a3
{
  sub_1002964B8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(id))sub_1002963F0);
}

- (void)willAddDeactivationReasonWithNotification:(id)a3
{
  sub_1002980B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1002978D8);
}

- (void)keyboardWillShowNotificationWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC9Reminders31TTRIShowRemindersViewController *v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100290E04(1u);
  sub_100297B9C();
  sub_1002908A0(0, 1);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)keyboardDidShowNotificationWithNotification:(id)a3
{
  sub_100297EA8(self, (uint64_t)a2, (uint64_t)a3, 2u);
}

- (void)keyboardWillHideNotificationWithNotification:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC9Reminders31TTRIShowRemindersViewController *v9;
  double v10;
  uint64_t v11;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_100290E04(3u);
  v10 = *(double *)&v9->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_keyboardHeight];
  *(_QWORD *)&v9->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_keyboardHeight] = 0;
  sub_100296F98(v10);
  sub_1002908A0(0, 1);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)keyboardDidHideNotificationWithNotification:(id)a3
{
  sub_100297EA8(self, (uint64_t)a2, (uint64_t)a3, 0);
}

- (void)keyboardWillChangeFrameNotificationWithNotification:(id)a3
{
  sub_1002980B4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_100297F70);
}

- (BOOL)accessibilityPerformMagicTap
{
  _TtC9Reminders31TTRIShowRemindersViewController *v2;
  char v3;

  v2 = self;
  sub_100297290();
  v3 = sub_1000D4C9C();

  swift_release();
  return v3 & 1;
}

- (_TtC9Reminders31TTRIShowRemindersViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9Reminders31TTRIShowRemindersViewController *result;

  v4 = a4;
  result = (_TtC9Reminders31TTRIShowRemindersViewController *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIShowRemindersViewController", 41, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_unknownObjectRelease(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter]);
  sub_10004E038(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_navigationItemOptions], *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_navigationItemOptions]);
  sub_10001F544((uint64_t)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_listInfo], (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.ListInfo);
  sub_10029A23C((uint64_t)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_internalDeferredItemUpdates]);
  swift_release();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_1000073A0((uint64_t)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_swHighlightToShowInNavBar], &qword_100653A10);
  sub_1000073A0((uint64_t)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_cellTitleItemGainingFocus_forKeyboardAvoidance], (uint64_t *)&unk_100640EB0);
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t ObjectType;
  void (*v14)(_QWORD *__return_ptr, uint64_t, uint64_t);
  id v15;
  _TtC9Reminders31TTRIShowRemindersViewController *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  _QWORD v28[3];
  uint64_t v29;

  v5 = sub_10002A750((uint64_t *)&unk_100653A90);
  __chkstk_darwin(v5);
  v7 = (char *)&v28[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TTRTemplatePublicLinkData(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v28[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  ObjectType = swift_getObjectType(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter], v12);
  v14 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v11 + 728);
  v15 = a3;
  v16 = self;
  v14(v28, ObjectType, v11);
  if (v29)
  {
    v17 = (_QWORD *)(*sub_10001413C(v28, v29) + OBJC_IVAR____TtC9Reminders25TTRIShowTemplatePresenter_dataModelSource);
    v18 = v17[1];
    v20 = swift_getObjectType(*v17, v19);
    v21 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 16))(v20, v18);
    v22 = type metadata accessor for Date(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v7, 1, 1, v22);
    v23 = TTRTemplatePublicLinkData.init(template:now:)(v21, v7);
    v24 = *(_QWORD *)&v10[*(int *)(v8 + 20)];
    v25 = (*(_QWORD *)TTRTemplatePublicLinkData.Capabilities.updateLink.unsafeMutableAddressor(v23) & ~v24) != 0;
    sub_10001F544((uint64_t)v10, (uint64_t (*)(_QWORD))&type metadata accessor for TTRTemplatePublicLinkData);
    sub_100027F10(v28);
  }
  else
  {
    sub_1000073A0((uint64_t)v28, (uint64_t *)&unk_100653A78);
    v25 = 1;
  }

  return v25;
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  void (*v11)(_QWORD *__return_ptr, uint64_t, uint64_t);
  id v12;
  _TtC9Reminders31TTRIShowRemindersViewController *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[3];
  uint64_t v21;

  v5 = sub_10002A750(&qword_100649BA0);
  __chkstk_darwin(v5);
  v7 = (char *)&v20[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  ObjectType = swift_getObjectType(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter], v9);
  v11 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v8 + 728);
  v12 = a3;
  v13 = self;
  v11(v20, ObjectType, v8);
  if (v21)
  {
    v14 = *sub_10001413C(v20, v21);
    v15 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v7, 1, 1, v15);
    type metadata accessor for MainActor(0);
    v16 = swift_retain();
    v17 = static MainActor.shared.getter(v16);
    v18 = (_QWORD *)swift_allocObject(&unk_1005FD080, 40, 7);
    v18[2] = v17;
    v18[3] = &protocol witness table for MainActor;
    v18[4] = v14;
    sub_100148368((uint64_t)v7, (uint64_t)&unk_100653A88, (uint64_t)v18);
    swift_release();
    sub_100027F10(v20);
  }
  else
  {
    sub_1000073A0((uint64_t)v20, (uint64_t *)&unk_100653A78);
  }

}

- (void)presentationControllerDidDismiss:(id)a3
{
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(_QWORD *__return_ptr, uint64_t, uint64_t);
  id v8;
  _TtC9Reminders31TTRIShowRemindersViewController *v9;
  _QWORD v10[3];
  uint64_t v11;

  v5 = *(_QWORD *)&self->feedbackGenerator[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter];
  ObjectType = swift_getObjectType(*(_QWORD *)&self->TTRIContentUnavailableHostableViewController_opaque[OBJC_IVAR____TtC9Reminders31TTRIShowRemindersViewController_presenter], a2);
  v7 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v5 + 728);
  v8 = a3;
  v9 = self;
  v7(v10, ObjectType, v5);
  if (v11)
  {
    sub_10001413C(v10, v11);
    sub_100133EF4();
    sub_100027F10(v10);
  }
  else
  {
    sub_1000073A0((uint64_t)v10, (uint64_t *)&unk_100653A78);
  }

}

@end
