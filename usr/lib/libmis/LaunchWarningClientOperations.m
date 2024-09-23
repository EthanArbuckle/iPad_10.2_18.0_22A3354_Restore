@implementation LaunchWarningClientOperations

- (id)queryExecutableURL:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC3mis29LaunchWarningClientOperations *v9;
  void *v10;
  void *v11;
  uint64_t v13;

  v5 = sub_1DF331F44();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DF331F20();
  v9 = self;
  sub_1DF30DE38();
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11;
}

- (_TtC3mis29LaunchWarningClientOperations)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for LaunchWarningClientOperations();
  return -[LaunchWarningClientOperations init](&v3, sel_init);
}

- (id)queryAppBundle:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC3mis29LaunchWarningClientOperations *v9;
  _QWORD *v10;
  uint64_t v12;

  v5 = sub_1DF331F44();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DF331F20();
  v9 = self;
  v10 = sub_1DF3183F0((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v10;
}

- (id)checkForLaunchWarning:(id)a3 error:(id *)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC3mis29LaunchWarningClientOperations *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  uint64_t v15;

  v5 = sub_1DF331F44();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DF331F20();
  v9 = self;
  v10 = sub_1DF31894C();
  v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  v13 = (void *)sub_1DF331F74();
  sub_1DF311830((uint64_t)v10, v12);
  return v13;
}

- (BOOL)setUserOverride:(BOOL)a3 forBundle:(id)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC3mis29LaunchWarningClientOperations *v11;
  uint64_t v13;

  v7 = sub_1DF331F44();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DF331F20();
  v11 = self;
  sub_1DF318C18(a3, (uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return 1;
}

@end
