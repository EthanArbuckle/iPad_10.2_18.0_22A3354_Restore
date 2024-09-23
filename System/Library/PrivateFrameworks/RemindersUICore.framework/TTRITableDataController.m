@implementation TTRITableDataController

- (_TtC15RemindersUICore23TTRITableDataController)init
{
  _TtC15RemindersUICore23TTRITableDataController *result;

  result = (_TtC15RemindersUICore23TTRITableDataController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore23TTRITableDataController_tableView);
  swift_bridgeObjectRelease();
  sub_1B48F5B6C(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC15RemindersUICore23TTRITableDataController_cachedSectionsMetadata), *(_QWORD *)&self->tableView[OBJC_IVAR____TtC15RemindersUICore23TTRITableDataController_cachedSectionsMetadata]);
  swift_release();
  swift_release();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v4;
  _TtC15RemindersUICore23TTRITableDataController *v5;
  int64_t v6;

  v4 = a3;
  v5 = self;
  v6 = _s15RemindersUICore23TTRITableDataControllerC16numberOfSections2inSiSo11UITableViewC_tF_0();

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  _TtC15RemindersUICore23TTRITableDataController *v7;
  int64_t v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1B48F6E68(a4);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15RemindersUICore23TTRITableDataController *v11;
  id v12;
  uint64_t v14;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  v12 = TTRITableDataController.tableView(_:cellForRowAt:)((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v12;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  UITableView *v6;
  _TtC15RemindersUICore23TTRITableDataController *v7;
  UIView_optional *v8;
  void *v9;
  void *v10;

  v6 = (UITableView *)a3;
  v7 = self;
  TTRITableDataController.tableView(_:viewForHeaderInSection:)(v8, v6, a4);
  v10 = v9;

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  UITableView *v6;
  _TtC15RemindersUICore23TTRITableDataController *v7;
  UIView_optional *v8;
  void *v9;
  void *v10;

  v6 = (UITableView *)a3;
  v7 = self;
  TTRITableDataController.tableView(_:viewForFooterInSection:)(v8, v6, a4);
  v10 = v9;

  return v10;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v6;
  _TtC15RemindersUICore23TTRITableDataController *v7;
  double v8;

  v6 = a3;
  v7 = self;
  v8 = sub_1B48F70B0(a4);

  return v8;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v6;
  _TtC15RemindersUICore23TTRITableDataController *v7;
  double v8;
  double v9;

  v6 = a3;
  v7 = self;
  sub_1B48F7344(a4);
  v9 = v8;

  return v9;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15RemindersUICore23TTRITableDataController *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t ObjectType;
  char v19;
  uint64_t v21;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  if (sub_1B48EBEA4((uint64_t)v9))
  {
    v15 = v12;
    v16 = v13;
    v17 = v14;
    ObjectType = swift_getObjectType();
    v19 = (*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t, uint64_t))(v15 + 48))(v16, v17, v10, ObjectType, v15);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {

    v19 = 0;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v19 & 1;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15RemindersUICore23TTRITableDataController *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t ObjectType;
  char v19;
  uint64_t v21;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  if (sub_1B48EBEA4((uint64_t)v9))
  {
    v15 = v12;
    v16 = v13;
    v17 = v14;
    ObjectType = swift_getObjectType();
    v19 = (*(uint64_t (**)(uint64_t, uint64_t, id, uint64_t, uint64_t))(v15 + 64))(v16, v17, v10, ObjectType, v15);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {

    v19 = 0;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v19 & 1;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15RemindersUICore23TTRITableDataController *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  char v15;
  uint64_t v17;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  if (sub_1B48EB934((uint64_t)v9))
  {
    v13 = v12;
    ObjectType = swift_getObjectType();
    v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 88))(ObjectType, v13);

    swift_unknownObjectRelease();
  }
  else
  {

    v15 = 0;
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v15 & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC15RemindersUICore23TTRITableDataController *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t v15;

  v6 = sub_1B4903CB0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v10 = a3;
  v11 = self;
  if (sub_1B48EB934((uint64_t)v9))
  {
    v13 = v12;
    ObjectType = swift_getObjectType();
    (*(void (**)(char *, id, uint64_t, uint64_t))(v13 + 96))(v9, v10, ObjectType, v13);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC15RemindersUICore23TTRITableDataController *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t ObjectType;
  uint64_t v21;

  v8 = sub_1B4903CB0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B4903C38();
  v12 = a3;
  v13 = self;
  if (sub_1B48EBEA4((uint64_t)v11))
  {
    v17 = v14;
    v18 = v15;
    v19 = v16;
    ObjectType = swift_getObjectType();
    (*(void (**)(int64_t, uint64_t, uint64_t, id, uint64_t, uint64_t))(v17 + 72))(a4, v18, v19, v12, ObjectType, v17);

    swift_unknownObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  _TtC15RemindersUICore23TTRITableDataController *v18;
  void (*v19)(char *, uint64_t);
  void *v20;
  uint64_t v22;

  v7 = sub_1B4903CB0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v22 - v12;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v22 - v15;
  sub_1B4903C38();
  sub_1B4903C38();
  v17 = a3;
  v18 = self;
  TTRITableDataController.tableView(_:targetIndexPathForMoveFromRowAt:toProposedIndexPath:)((uint64_t)v13, (uint64_t)v10, (uint64_t)v16);

  v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v10, v7);
  v19(v13, v7);
  v20 = (void *)sub_1B4903C08();
  v19(v16, v7);
  return v20;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  _TtC15RemindersUICore23TTRITableDataController *v15;
  void (*v16)(char *, uint64_t);
  uint64_t v17;

  v7 = sub_1B4903CB0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v17 - v12;
  sub_1B4903C38();
  sub_1B4903C38();
  v14 = a3;
  v15 = self;
  TTRITableDataController.tableView(_:moveRowAt:to:)((uint64_t)v14, (uint64_t)v13, (uint64_t)v10);

  v16 = *(void (**)(char *, uint64_t))(v8 + 8);
  v16(v10, v7);
  v16(v13, v7);
}

@end
