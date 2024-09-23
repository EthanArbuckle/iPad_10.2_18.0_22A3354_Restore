@implementation ScreenshotDelegate

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutputFiles:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  uint64_t v7;
  id v10;
  id v11;
  _TtC16SiriMessagesFlowP33_AC72C49DCF17A2EF063087622590466618ScreenshotDelegate *v12;

  v7 = (uint64_t)a4;
  if (a4)
  {
    sub_246A94C7C(0, &qword_2576308B0);
    v7 = sub_246D637B0();
  }
  v10 = a3;
  v11 = a5;
  v12 = self;
  sub_246B9AF1C(v10, v7, a5);

  swift_bridgeObjectRelease();
}

- (_TtC16SiriMessagesFlowP33_AC72C49DCF17A2EF063087622590466618ScreenshotDelegate)init
{
  sub_246B9B180();
}

- (void).cxx_destruct
{
  swift_release();
}

@end
