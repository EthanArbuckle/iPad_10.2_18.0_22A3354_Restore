@implementation SettingsViewController

- (_TtC5TeaUI22SettingsViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  SettingsViewController.init(coder:)();
}

- (void)viewDidLoad
{
  _TtC5TeaUI22SettingsViewController *v2;

  v2 = self;
  SettingsViewController.viewDidLoad()();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5TeaUI22SettingsViewController *v4;

  v4 = self;
  SettingsViewController.viewWillAppear(_:)(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC5TeaUI22SettingsViewController *v4;

  v4 = self;
  SettingsViewController.viewWillDisappear(_:)(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC5TeaUI22SettingsViewController *v2;

  v2 = self;
  SettingsViewController.viewDidLayoutSubviews()();

}

- (void)doDone
{
  _TtC5TeaUI22SettingsViewController *v2;

  v2 = self;
  sub_1B15272F8();

}

- (void)keyboardWillChangeFrameWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC5TeaUI22SettingsViewController *v9;
  uint64_t v10;

  v4 = sub_1B16B7910();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B78E0();
  v9 = self;
  sub_1B15273B0((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC5TeaUI22SettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  SettingsViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC5TeaUI22SettingsViewController_actionHandler);

  swift_release();
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5TeaUI22SettingsViewController *v12;
  uint64_t v14;

  v6 = sub_1B16B7D60();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B7D0C();
  v11 = a3;
  v12 = self;
  LOBYTE(self) = SettingsViewController.tableView(_:shouldHighlightRowAt:)();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return self & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5TeaUI22SettingsViewController *v12;
  uint64_t v13;

  v6 = sub_1B16B7D60();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B7D0C();
  v11 = a3;
  v12 = self;
  SettingsViewController.tableView(_:didSelectRowAt:)(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return SettingsViewController.numberOfSections(in:)((UITableView *)self);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC5TeaUI22SettingsViewController *v7;
  Swift::Int v8;

  v6 = a3;
  v7 = self;
  v8 = SettingsViewController.tableView(_:numberOfRowsInSection:)((UITableView *)v7, a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5TeaUI22SettingsViewController *v12;
  void *v13;
  uint64_t v15;

  v6 = sub_1B16B7D60();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B7D0C();
  v11 = a3;
  v12 = self;
  v13 = (void *)SettingsViewController.tableView(_:cellForRowAt:)(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v13;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5TeaUI22SettingsViewController *v12;
  double v13;
  double v14;
  uint64_t v16;

  v6 = sub_1B16B7D60();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B7D0C();
  v11 = a3;
  v12 = self;
  SettingsViewController.tableView(_:heightForRowAt:)();
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v14;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  return sub_1B152A530(self, (uint64_t)a2, a3, a4, (void (*)(void))SettingsViewController.tableView(_:titleForHeaderInSection:));
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  return sub_1B152A530(self, (uint64_t)a2, a3, a4, (void (*)(void))SettingsViewController.tableView(_:titleForFooterInSection:));
}

@end
