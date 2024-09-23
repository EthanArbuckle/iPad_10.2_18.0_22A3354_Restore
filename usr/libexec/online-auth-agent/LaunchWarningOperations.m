@implementation LaunchWarningOperations

- (_TtC17online_auth_agent23LaunchWarningOperations)init
{
  return (_TtC17online_auth_agent23LaunchWarningOperations *)sub_100020450();
}

- (BOOL)setUserOverride:(BOOL)a3 forID:(unint64_t)a4 error:(id *)a5
{
  _TtC17online_auth_agent23LaunchWarningOperations *v7;

  v7 = self;
  sub_100020820(a3, a4);

  return 1;
}

- (id)lookupLaunchWarningData:(id)a3 cdhashType:(unsigned int)a4 error:(id *)a5
{
  id v8;
  _TtC17online_auth_agent23LaunchWarningOperations *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  Class isa;

  v8 = a3;
  v9 = self;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = v11;

  v13 = sub_100020C40(v10, v12, a4);
  v15 = v14;

  sub_10000EE2C(v10, v12);
  isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10000EE2C(v13, v15);
  return isa;
}

- (BOOL)syncLaunchWarningsAndReturnError:(id *)a3
{
  _TtC17online_auth_agent23LaunchWarningOperations *v3;

  v3 = self;
  sub_100021398();

  return 1;
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_launchWarningController));
  sub_1000111D0((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17online_auth_agent23LaunchWarningOperations_metrics));

}

@end
