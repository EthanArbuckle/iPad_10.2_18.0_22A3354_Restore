@implementation SUIBUIBridgeClient

- (SUIBUIBridgeClient)initWithDelegate:(id)a3
{
  swift_unknownObjectRetain();
  return (SUIBUIBridgeClient *)SUIBUIBridgeClient.init(delegate:)((uint64_t)a3);
}

- (SUIBUIBridgeClient)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  id v6;

  swift_unknownObjectRetain();
  v6 = a4;
  return (SUIBUIBridgeClient *)SUIBUIBridgeClient.init(delegate:delegateQueue:)((uint64_t)a3, a4);
}

- (void)dealloc
{
  SUIBUIBridgeClient *v2;

  v2 = self;
  sub_24744EA80();
}

- (void).cxx_destruct
{

  OUTLINED_FUNCTION_1_1();
}

- (void)preheat
{
  SUIBUIBridgeClient *v2;

  v2 = self;
  SUIBUIBridgeClient.preheat()();

}

- (void)siriDismissed
{
  SUIBUIBridgeClient *v2;

  v2 = self;
  SUIBUIBridgeClient.siriDismissed()();

}

- (void)siriPrompted
{
  SUIBUIBridgeClient *v2;

  v2 = self;
  SUIBUIBridgeClient.siriPrompted()();

}

- (void)stopAttendingForReason:(unint64_t)a3
{
  SUIBUIBridgeClient *v4;

  v4 = self;
  SUIBUIBridgeClient.stopAttending(for:)(a3);

}

- (void)siriWillPrompt
{
  SUIBUIBridgeClient *v2;

  v2 = self;
  SUIBUIBridgeClient.siriWillPrompt()();

}

- (void)startAttending
{
  SUIBUIBridgeClient *v2;

  v2 = self;
  SUIBUIBridgeClient.startAttending()();

}

- (SUIBUIBridgeClient)init
{
  SUIBUIBridgeClient.init()();
}

@end
