@implementation DOCShortcutsActionRunner

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutputFiles:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v7;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(id, id, __n128);
  id v13;
  id v14;
  _TtC5FilesP33_AE816C615539461ED264CC7968FD4AFF24DOCShortcutsActionRunner *v15;
  __n128 v16;

  v7 = a4;
  if (a4)
  {
    v10 = sub_10004F2F0(0, (unint64_t *)&unk_10064E030, WFContextualActionFile_ptr);
    v7 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v7, v10);
  }
  v12 = *(void (**)(id, id, __n128))((char *)&self->super.isa
                                              + OBJC_IVAR____TtC5FilesP33_AE816C615539461ED264CC7968FD4AFF24DOCShortcutsActionRunner_completionHandler);
  v11 = *(_QWORD *)&self->completionHandler[OBJC_IVAR____TtC5FilesP33_AE816C615539461ED264CC7968FD4AFF24DOCShortcutsActionRunner_completionHandler];
  v13 = a3;
  v14 = a5;
  v15 = self;
  v16 = swift_retain();
  v12(v7, a5, v16);

  swift_release(v11);
  swift_bridgeObjectRelease(v7);
}

- (_TtC5FilesP33_AE816C615539461ED264CC7968FD4AFF24DOCShortcutsActionRunner)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC5FilesP33_AE816C615539461ED264CC7968FD4AFF24DOCShortcutsActionRunner_completionHandler);
  *v2 = DOCSplitBrowserViewController.didCommitPreview(of:);
  v2[1] = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCShortcutsActionRunner();
  return -[DOCShortcutsActionRunner init](&v4, "init");
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->completionHandler[OBJC_IVAR____TtC5FilesP33_AE816C615539461ED264CC7968FD4AFF24DOCShortcutsActionRunner_completionHandler]);
}

@end
