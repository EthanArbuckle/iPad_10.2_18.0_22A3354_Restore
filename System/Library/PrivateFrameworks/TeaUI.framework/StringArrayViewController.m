@implementation StringArrayViewController

- (_TtC5TeaUI25StringArrayViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B15C94E0();
}

- (void)viewDidLoad
{
  _TtC5TeaUI25StringArrayViewController *v2;

  v2 = self;
  sub_1B15C9590();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC5TeaUI25StringArrayViewController *v4;

  v4 = self;
  sub_1B15C9818(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC5TeaUI25StringArrayViewController *v4;

  v4 = self;
  sub_1B15C98B0(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC5TeaUI25StringArrayViewController *v2;

  v2 = self;
  sub_1B15C9994();

}

- (void)doAdd
{
  _TtC5TeaUI25StringArrayViewController *v2;

  v2 = self;
  sub_1B15C9A80();

}

- (void)keyboardWillChangeFrameWithNotification:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC5TeaUI25StringArrayViewController *v9;
  uint64_t v10;

  v4 = sub_1B16B7910();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B78E0();
  v9 = self;
  sub_1B15C9C18((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return sub_1B15C9CF0();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5TeaUI25StringArrayViewController *v12;
  id v13;
  uint64_t v15;

  v6 = sub_1B16B7D60();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B7D0C();
  v11 = a3;
  v12 = self;
  v13 = sub_1B15C9D48(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v13;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  _TtC5TeaUI25StringArrayViewController *v14;
  uint64_t v15;

  v8 = sub_1B16B7D60();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8, v10);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B7D0C();
  v13 = a3;
  v14 = self;
  sub_1B15CA21C(v13, a4, (uint64_t)v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v8);
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  void *v5;

  sub_1B15CA40C();
  if (v4)
  {
    v5 = (void *)sub_1B16B983C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (_TtC5TeaUI25StringArrayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    sub_1B16B9860();
  v5 = a4;
  sub_1B15CA4AC();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_7_70();
  OUTLINED_FUNCTION_7_70();
  swift_bridgeObjectRelease();
}

@end
