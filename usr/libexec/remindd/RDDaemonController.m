@implementation RDDaemonController

- (id)syncChangeTrackingPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  return sub_1004AD454(self, (int)a2, (int)a3, a4, (uint64_t (*)(void))sub_1004AD6A4);
}

- (id)syncDebugPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  return sub_1004AD454(self, (int)a2, (int)a3, a4, (uint64_t (*)(void))sub_1004AD83C);
}

- (id)syncDebugPerformerWithErrorHandler:(id)a3
{
  void *v4;
  _TtC7remindd18RDDaemonController *v5;
  void *v6;
  void *v7;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1004AD83C((uint64_t)v5);
  v7 = v6;
  _Block_release(v4);
  _Block_release(v4);

  return v7;
}

- (void)asyncDebugPerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _TtC7remindd18RDDaemonController *v11;

  v7 = _Block_copy(a4);
  v8 = _Block_copy(a5);
  v9 = swift_allocObject(&unk_1007F62E0, 24, 7);
  *(_QWORD *)(v9 + 16) = v7;
  v10 = swift_allocObject(&unk_1007F6308, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v11 = self;
  sub_1004AD9D4();

  swift_release(v9);
  swift_release(v10);
}

- (id)syncStorePerformerWithReason:(id)a3 errorHandler:(id)a4
{
  return sub_1004AD454(self, (int)a2, (int)a3, a4, (uint64_t (*)(void))sub_1004ADBA0);
}

- (void)asyncStorePerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
  sub_1004AD4C4(self, (int)a2, (int)a3, a4, a5, (uint64_t (*)(void))sub_1004ADBA0);
}

- (id)syncSyncInterfacePerformerWithReason:(id)a3 errorHandler:(id)a4
{
  return sub_1004AD454(self, (int)a2, (int)a3, a4, (uint64_t (*)(void))sub_1004ADD38);
}

- (void)asyncSyncInterfacePerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
  sub_1004AD4C4(self, (int)a2, (int)a3, a4, a5, (uint64_t (*)(void))sub_1004ADD38);
}

- (id)syncIndexingPerformerWithReason:(id)a3 errorHandler:(id)a4
{
  return sub_1004AD454(self, (int)a2, (int)a3, a4, (uint64_t (*)(void))sub_1004ADEC4);
}

- (void)asyncIndexingPerformerWithReason:(id)a3 loadHandler:(id)a4 errorHandler:(id)a5
{
  sub_1004AD4C4(self, (int)a2, (int)a3, a4, a5, (uint64_t (*)(void))sub_1004ADEC4);
}

- (_TtC7remindd18RDDaemonController)init
{
  _TtC7remindd18RDDaemonController *result;

  result = (_TtC7remindd18RDDaemonController *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDDaemonController", 26, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd18RDDaemonController_xpcDaemon));
  sub_1000178E8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity), *(_QWORD *)&self->xpcDaemon[OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity], *(_QWORD *)&self->xpcDaemon[OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity + 8], *(_QWORD *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity], *(_QWORD *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity + 8], *(unsigned int *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity + 16] | ((unint64_t)*(unsigned __int16 *)&self->clientIdentity[OBJC_IVAR____TtC7remindd18RDDaemonController_clientIdentity + 20] << 32));

}

@end
