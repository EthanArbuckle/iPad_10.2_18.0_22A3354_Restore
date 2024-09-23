@implementation DiscoveryService

- (void)dealloc
{
  _TtC21ProximityReaderDaemon16DiscoveryService *v2;

  v2 = self;
  sub_244D6C078();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
}

- (_TtC21ProximityReaderDaemon16DiscoveryService)init
{
  _TtC21ProximityReaderDaemon16DiscoveryService *result;

  result = (_TtC21ProximityReaderDaemon16DiscoveryService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)contentWithTopic:(NSString *)a3 subtopic:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9;
  char *v10;
  void *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  NSString *v16;
  NSString *v17;
  _TtC21ProximityReaderDaemon16DiscoveryService *v18;
  uint64_t v19;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257415740);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  v13 = sub_244E4E55C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2574150C0;
  v14[5] = v12;
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2574150C8;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  sub_244D6FD54((uint64_t)v10, (uint64_t)&unk_2574150D0, (uint64_t)v15);
  swift_release();
}

- (void)contentListWithCompletionHandler:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _TtC21ProximityReaderDaemon16DiscoveryService *v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257415740);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = self;
  v9 = sub_244E4E55C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_257415098;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2574150A0;
  v11[5] = v10;
  v12 = self;
  sub_244D6FD54((uint64_t)v6, (uint64_t)&unk_2574150A8, (uint64_t)v11);
  swift_release();
}

- (void)layoutBundleWithContentId:(NSString *)a3 completionHandler:(id)a4
{
  uint64_t v7;
  char *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  NSString *v14;
  _TtC21ProximityReaderDaemon16DiscoveryService *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257415740);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = v9;
  v10[4] = self;
  v11 = sub_244E4E55C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_257415038;
  v12[5] = v10;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_257415040;
  v13[5] = v12;
  v14 = a3;
  v15 = self;
  sub_244D6FD54((uint64_t)v8, (uint64_t)&unk_257415048, (uint64_t)v13);
  swift_release();
}

- (void)cancelRequestWithCompletionHandler:(id)a3
{
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _TtC21ProximityReaderDaemon16DiscoveryService *v12;
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257415740);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _Block_copy(a3);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = self;
  v9 = sub_244E4E55C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v6, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = &unk_257414FF0;
  v10[5] = v8;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_257415000;
  v11[5] = v10;
  v12 = self;
  sub_244D6FD54((uint64_t)v6, (uint64_t)&unk_257415010, (uint64_t)v11);
  swift_release();
}

- (void)sendAnalyticsWithAnalyticsData:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC21ProximityReaderDaemon16DiscoveryService *v8;

  v4 = a3;
  v8 = self;
  v5 = sub_244E4C324();
  v7 = v6;

  sub_244D6EF8C();
  sub_244D651AC(v5, v7);

}

@end
