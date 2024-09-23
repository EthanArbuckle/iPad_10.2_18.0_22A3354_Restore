@implementation BottomPlayerManager

- (_TtC16MusicApplication19BottomPlayerManager)init
{
  return (_TtC16MusicApplication19BottomPlayerManager *)sub_234794();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication19BottomPlayerManager_routingController));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16MusicApplication19BottomPlayerManager_queuesMap));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16MusicApplication19BottomPlayerManager_forcedPaths));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16MusicApplication19BottomPlayerManager_subscriptions));

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication19BottomPlayerManager_localDeviceQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication19BottomPlayerManager_overrideCurrentQueue));
  v3 = (char *)self + OBJC_IVAR____TtC16MusicApplication19BottomPlayerManager__queues;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_14BAF88);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16MusicApplication19BottomPlayerManager_ignoredQueues));
}

- (void)routingControllerAvailableRoutesDidChange:(id)a3
{
  id v4;
  _TtC16MusicApplication19BottomPlayerManager *v5;

  v4 = a3;
  v5 = self;
  sub_237674(v4);

}

@end
