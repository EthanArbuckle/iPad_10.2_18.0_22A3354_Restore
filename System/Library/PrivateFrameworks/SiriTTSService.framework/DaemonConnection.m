@implementation DaemonConnection

- (void).cxx_destruct
{

  swift_release();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_1_34();
}

- (void)dealloc
{
  _TtC14SiriTTSService16DaemonConnection *v2;

  v2 = self;
  sub_19AD48990();
}

- (_TtC14SiriTTSService16DaemonConnection)init
{
  sub_19AE10E28();
}

@end
