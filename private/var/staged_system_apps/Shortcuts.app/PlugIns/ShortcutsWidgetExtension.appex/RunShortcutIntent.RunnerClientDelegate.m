@implementation RunShortcutIntent.RunnerClientDelegate

- (void)workflowRunnerClient:(id)a3 didStartRunningWorkflowWithProgress:(id)a4
{
  id v6;
  id v7;
  _TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10001D0A0(v6, a4);

}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v9;
  id v10;
  _TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate *v11;
  id v12;

  v9 = a3;
  v10 = a4;
  v11 = self;
  v12 = a5;
  sub_10001D324(v9, (uint64_t)a4, (uint64_t)a5);

}

- (_TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate)init
{
  sub_10001D680();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self
     + OBJC_IVAR____TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate_continuation;
  v4 = sub_1000024DC(&qword_10002DC88);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtCV24ShortcutsWidgetExtension17RunShortcutIntentP33_82D064107D62BB69BF784D876A4D3C0420RunnerClientDelegate_runningTracker));
}

@end
