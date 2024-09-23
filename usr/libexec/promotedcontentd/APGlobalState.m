@implementation APGlobalState

+ (void)createWithTimerXPCActivity:(id)a3 database:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  sub_10003CE78(v5, v6);

}

+ (void)startWorkCoordinator
{
  uint64_t v2;
  uint64_t v3;

  v2 = qword_10026D188;
  if (qword_10026D188)
  {
    v3 = swift_retain(qword_10026D188, a2);
    dispatch thunk of WorkCoordinator.startNow()(v3);
    swift_release(v2);
  }
  else
  {
    __break(1u);
  }
}

- (APGlobalState)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GlobalState();
  return -[APGlobalState init](&v3, "init");
}

@end
