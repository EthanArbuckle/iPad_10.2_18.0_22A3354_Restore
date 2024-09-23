@implementation NotificationSettingsViewController

- (_TtC9SeymourUI34NotificationSettingsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B948CC4();
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _TtC9SeymourUI34NotificationSettingsViewController *v6;
  objc_super v7;

  v3 = (void *)objc_opt_self();
  v4 = OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_notifyToken;
  v5 = *(unsigned int *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_notifyToken);
  v6 = self;
  if (objc_msgSend(v3, sel_tokenIsValid_, v5))
    objc_msgSend(v3, sel_cancelToken_, *(unsigned int *)((char *)&self->super.super.super.isa + v4));
  v7.receiver = v6;
  v7.super_class = (Class)type metadata accessor for NotificationSettingsViewController();
  -[NotificationSettingsViewController dealloc](&v7, sel_dealloc);
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_accountProvider);
  sub_22B3A05F0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_browsingStringBuilder);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_contentAvailabilityClient);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_fitnessModeObserver);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_networkEvaluator);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_notificationSettingsProvider);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_storefrontLocalizer);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_syncManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_tableView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_wheelchairStatus);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_contentUnavailableView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_loadingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController_spinnerView));
  swift_bridgeObjectRelease();
  v3 = (char *)self
     + OBJC_IVAR____TtC9SeymourUI34NotificationSettingsViewController__fitnessPlusNotificationSettingsEnabled;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255BA1020);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)viewDidLoad
{
  _TtC9SeymourUI34NotificationSettingsViewController *v2;

  v2 = self;
  sub_22B94420C();

}

- (void)updateSettings
{
  _TtC9SeymourUI34NotificationSettingsViewController *v2;

  v2 = self;
  sub_22B9462D0();

}

- (void)switchTappedWithCellSwitch:(id)a3
{
  id v4;
  _TtC9SeymourUI34NotificationSettingsViewController *v5;

  v4 = a3;
  v5 = self;
  sub_22B946A40(v4);

}

- (_TtC9SeymourUI34NotificationSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC9SeymourUI34NotificationSettingsViewController *result;

  v4 = a4;
  result = (_TtC9SeymourUI34NotificationSettingsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC9SeymourUI34NotificationSettingsViewController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = _s9SeymourUI34NotificationSettingsViewControllerC16numberOfSections2inSiSo07UITableE0C_tF_0();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC9SeymourUI34NotificationSettingsViewController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_22B948F58(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC9SeymourUI34NotificationSettingsViewController *v11;
  _QWORD *v12;
  uint64_t v14;

  v6 = sub_22BA79C14();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22BA79BCC();
  v10 = a3;
  v11 = self;
  v12 = NotificationSettingsViewController.tableView(_:cellForRowAt:)(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_22B947D1C(self, (uint64_t)a2, a3, a4, (void (*)(uint64_t))sub_22B94904C);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_22B947D1C(self, (uint64_t)a2, a3, a4, (void (*)(uint64_t))sub_22B94913C);
}

@end
