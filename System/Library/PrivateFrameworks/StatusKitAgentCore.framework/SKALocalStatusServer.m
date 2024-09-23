@implementation SKALocalStatusServer

- (void)objcShutdown
{
  swift_retain();
  SKALocalStatusServer.objcShutdown()();
  swift_release();
}

- (SKALocalStatusServer)initWithIdsDeviceProvider:(id)a3
{
  swift_unknownObjectRetain();
  return (SKALocalStatusServer *)SKALocalStatusServer.init(idsDeviceProvider:)(a3);
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v5;
  id v6;

  if (a4)
    v5 = sub_218988FA0();
  else
    v5 = 0;
  v6 = a3;
  swift_retain();
  sub_21897DE40(v5);

  swift_release();
  swift_bridgeObjectRelease();
}

- (SKALocalStatusServer)init
{
  SKALocalStatusServer *result;

  swift_defaultActor_initialize();
  result = (SKALocalStatusServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
