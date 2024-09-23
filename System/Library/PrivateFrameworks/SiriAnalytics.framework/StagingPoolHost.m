@implementation StagingPoolHost

- (void)vendStagingAccessWithAuditToken:(id *)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  _TtC13SiriAnalytics15StagingPoolHost *v7;
  __int128 v8;
  __int128 v9;

  v8 = *(_OWORD *)&a3->var0[4];
  v9 = *(_OWORD *)a3->var0;
  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = v9;
  *(_OWORD *)(v6 + 32) = v8;
  *(_QWORD *)(v6 + 48) = v5;
  *(_QWORD *)(v6 + 56) = self;
  v7 = self;
  sub_1A02AA970((uint64_t)&unk_1EE58F878, v6);
}

- (void)dataPoolUrlWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC13SiriAnalytics15StagingPoolHost *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_1A02AA970((uint64_t)&unk_1EE58F838, v5);
}

- (_TtC13SiriAnalytics15StagingPoolHost)init
{
  sub_1A02AB6C8();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC13SiriAnalytics15StagingPoolHost_stagingContainerURL;
  v3 = OUTLINED_FUNCTION_34();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
