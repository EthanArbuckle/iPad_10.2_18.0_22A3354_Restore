@implementation DebugTableViewSource

- (_TtC5TeaUI20DebugTableViewSource)init
{
  sub_1B1699C9C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectWeakDestroy();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC5TeaUI20DebugTableViewSource *v5;
  int64_t v6;
  int64_t v7;

  v4 = a3;
  v5 = self;
  sub_1B1699D2C();
  v7 = v6;

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5;
  _TtC5TeaUI20DebugTableViewSource *v6;
  int64_t v7;
  int64_t v8;

  v5 = a3;
  v6 = self;
  sub_1B1699E6C();
  v8 = v7;

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
  _TtC5TeaUI20DebugTableViewSource *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v6 = sub_1B16B7D60();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B7D0C();
  v11 = a3;
  v12 = self;
  sub_1B1699F64();
  v14 = v13;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return v14;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v5;
  _TtC5TeaUI20DebugTableViewSource *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = self;
  sub_1B169A700();
  v8 = v7;

  if (v8)
  {
    v9 = (void *)sub_1B16B983C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC5TeaUI20DebugTableViewSource *v12;
  uint64_t v13;

  v6 = sub_1B16B7D60();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6, v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B16B7D0C();
  v11 = a3;
  v12 = self;
  sub_1B169A824(v11);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

@end
