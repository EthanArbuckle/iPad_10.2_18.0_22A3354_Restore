@implementation RPPairableHost

- (NSString)name
{
  RPPairableHost *v2;
  void *v3;

  v2 = self;
  RPPairableHost.name.getter();

  v3 = (void *)sub_1CF73EEB0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)model
{
  RPPairableHost *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  RPPairableHost.model.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1CF73EEB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSUUID)identifier
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  RPPairableHost *v7;
  void *v8;
  uint64_t v10;

  v3 = sub_1CF73E664();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  RPPairableHost.identifier.getter((uint64_t)v6);

  v8 = (void *)sub_1CF73E640();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSUUID *)v8;
}

- (BOOL)available
{
  RPPairableHost *v2;
  char v3;

  v2 = self;
  v3 = RPPairableHost.available.getter();

  return v3 & 1;
}

- (BOOL)paired
{
  RPPairableHost *v2;
  char v3;

  v2 = self;
  v3 = RPPairableHost.paired.getter();

  return v3 & 1;
}

- (void)registerChangeHandlerOnTargetQueue:(id)a3 handler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  RPPairableHost *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  RPPairableHost.registerChangeHandler(on:handler:)(a3, (uint64_t)sub_1CF6DFC24, v7);

  swift_release();
}

- (void)pairInvokingHandlersOnQueue:(id)a3 handlingPairingChallengesUsing:(id)a4 handlingCompletionUsing:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  RPPairableHost *v13;

  v8 = _Block_copy(a4);
  v9 = _Block_copy(a5);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v8;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v9;
  v12 = a3;
  v13 = self;
  RPPairableHost.pair(invokingHandlersOn:handlingPairingChallengesUsing:completionHandler:)(a3, (uint64_t)sub_1CF6DFC14, v10, (uint64_t)sub_1CF6A6F88, v11);

  swift_release();
  swift_release();
}

- (RPPairableHost)init
{
  RPPairableHost.init()();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end
