@implementation SASelfLogger

- (SASelfLogger)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SiriAudioSelfLogger();
  return -[SASelfLogger init](&v3, sel_init);
}

- (void)emitMWTCheckPointWithMwtCheckpoint:(int64_t)a3 requestId:(id)a4
{
  sub_229792DCC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t, char *))sub_22965238C);
}

- (void)emitMWTCheckPointWithMwtCheckpoint:(int64_t)a3 requestId:(id)a4 timeStamp:(unint64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  SASelfLogger *v12;
  id v13;
  void *v14;
  uint64_t v15;

  v8 = sub_2297DBA98();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2297DBA80();
  v12 = self;
  v13 = sub_229652664(a3, (uint64_t)v11);
  if (v13)
  {
    v14 = v13;
    objc_msgSend((id)(*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)v12->super.isa) + 0x50))(), sel_emitMessage_timestamp_, v13, a5);

    swift_unknownObjectRelease();
  }
  else
  {

  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)getSiriRequestUUIDFor:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  SASelfLogger *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255A5FB00);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2297DCE60();
  v7 = self;
  sub_2297DBA50();

  swift_bridgeObjectRelease();
  v8 = sub_2297DBA98();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    v10 = (void *)sub_2297DBA74();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v10;
}

- (void)emitMWTMusicMetadata:(id)a3 requestId:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  SASelfLogger *v11;
  uint64_t v12;

  v6 = sub_2297DBA98();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2297DBA80();
  v10 = (char *)a3;
  v11 = self;
  sub_2297917BC(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)emitVMCPUStatsWithStage:(int64_t)a3 requestId:(id)a4
{
  sub_229792DCC(self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t, char *))sub_229792C44);
}

- (void)emitVMCPUStatsWithVmCpuStatsData:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  SASelfLogger *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_2297DB954();
  v7 = v6;

  sub_229792E7C();
  sub_229649200(v5, v7);

}

- (id)collectVMCPUStatsWithStage:(int64_t)a3 requestId:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v14;

  v5 = sub_2297DBA98();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2297DBA80();
  v9 = sub_22979981C(a3, (uint64_t)v8);
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = 0;
  if (v11 >> 60 != 15)
  {
    v12 = (void *)sub_2297DB948();
    sub_2296CB2F0(v9, v11);
  }
  return v12;
}

@end
