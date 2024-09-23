@implementation SearchUISportsKitWrapper

+ (void)createSessionWithCanonicalId:(id)a3 completionBlock:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = sub_1DAE0D3D4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  sub_1DAE0D53C();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  sub_1DAE0D41C();
  v11 = (void *)sub_1DAE0D410();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0DA9050], v5);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_1DADDB2C8;
  *(_QWORD *)(v12 + 24) = v10;
  sub_1DAE0C564();
  sub_1DAE0D3E0();

  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)checkForSessionWithCanonicalId:(id)a3 completionBlock:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = sub_1DAE0D3D4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  sub_1DAE0D53C();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  sub_1DAE0D41C();
  v11 = (void *)sub_1DAE0D410();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0DA9050], v5);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_1DADDB2C4;
  *(_QWORD *)(v12 + 24) = v10;
  sub_1DAE0C564();
  sub_1DAE0D3F8();

  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)destroySessionWithCanonicalId:(id)a3 completionBlock:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v5 = sub_1DAE0D3D4();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78]();
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  sub_1DAE0D53C();
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  sub_1DAE0D41C();
  v11 = (void *)sub_1DAE0D410();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x1E0DA9050], v5);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_1DADDB264;
  *(_QWORD *)(v12 + 24) = v10;
  sub_1DAE0C564();
  sub_1DAE0D3EC();

  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRelease();
  swift_release();
}

+ (void)liveActivitiesEnabledWithCompletionBlock:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v3 = _Block_copy(a3);
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v3;
  sub_1DAE0D41C();
  v5 = (void *)sub_1DAE0D410();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_1DADDB230;
  *(_QWORD *)(v6 + 24) = v4;
  sub_1DAE0C564();
  sub_1DAE0D404();
  swift_release();

  swift_release();
}

- (_TtC8SearchUI24SearchUISportsKitWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SearchUISportsKitWrapper();
  return -[SearchUISportsKitWrapper init](&v3, sel_init);
}

@end
