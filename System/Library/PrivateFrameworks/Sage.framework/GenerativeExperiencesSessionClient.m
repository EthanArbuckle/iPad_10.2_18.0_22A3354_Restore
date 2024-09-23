@implementation GenerativeExperiencesSessionClient

- (void)sessionDidProduceCompletionResponseFor:(id)a3 element:(id)a4 isComplete:(BOOL)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC4Sage34GenerativeExperiencesSessionClient *v12;
  uint64_t v13;

  v7 = sub_2457BAAD4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2457BAABC();
  v11 = a4;
  v12 = self;
  sub_2457718C4();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)sessionDidProduceDocumentRegistrationStatusFor:(id)a3 documentID:(int64_t)a4 registrationStatus:(id)a5 isComplete:(BOOL)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  _TtC4Sage34GenerativeExperiencesSessionClient *v13;
  uint64_t v14;

  v8 = sub_2457BAAD4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2457BAABC();
  v12 = a5;
  v13 = self;
  sub_245771BA4();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)sessionDidEncounterCompletionErrorFor:(id)a3 error:(id)a4
{
  sub_245772570(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_245771E5C);
}

- (void)sessionDidEncounterRegistrationErrorFor:(id)a3 documentID:(int64_t)a4 error:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC4Sage34GenerativeExperiencesSessionClient *v12;
  uint64_t v13;

  v7 = sub_2457BAAD4();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2457BAABC();
  v11 = a5;
  v12 = self;
  sub_245772010();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)sessionDidProduceOneShotCompletionFor:(id)a3 completion:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC4Sage34GenerativeExperiencesSessionClient *v11;
  uint64_t v12;

  v6 = sub_2457BAAD4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2457BAABC();
  v10 = a4;
  v11 = self;
  sub_24577220C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)sessionDidProduceOneShotCompletionErrorFor:(id)a3 error:(id)a4
{
  sub_245772570(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, id))sub_245772418);
}

- (_TtC4Sage34GenerativeExperiencesSessionClient)init
{
  GenerativeExperiencesSessionClient.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
