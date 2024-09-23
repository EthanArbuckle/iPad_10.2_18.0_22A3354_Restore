@implementation ICLaunchTaskRunner

- (ICLaunchTaskRunner)init
{
  ICLaunchTaskRunner *result;

  result = (ICLaunchTaskRunner *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.LaunchTaskRunner", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___ICLaunchTaskRunner_launchTasks));
  v3 = (char *)self + OBJC_IVAR___ICLaunchTaskRunner_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_1001FDCAC((uint64_t)self + OBJC_IVAR___ICLaunchTaskRunner_delegate);
}

+ (id)runDelayedLaunchTasksWithDelegate:(id)a3 completionHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v5 = _Block_copy(a4);
  v6 = swift_allocObject(&unk_10055E6C8, 24, 7);
  *(_QWORD *)(v6 + 16) = v5;
  swift_unknownObjectRetain(a3);
  v8 = _s11MobileNotes16LaunchTaskRunnerC010runDelayedC5Tasks8delegate17completionHandlerAC17CancellationTokenCAA0cdE8Delegate_pSg_ySbYbctFZ_0(v7, (uint64_t)sub_1001FDC98, v6);
  swift_unknownObjectRelease(a3, v9);
  swift_release(v6);
  return v8;
}

@end
