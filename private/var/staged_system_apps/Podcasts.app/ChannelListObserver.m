@implementation ChannelListObserver

- (_TtC8Podcasts19ChannelListObserver)init
{
  return (_TtC8Podcasts19ChannelListObserver *)sub_10002E6AC();
}

- (void)dealloc
{
  void *v2;
  _TtC8Podcasts19ChannelListObserver *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19ChannelListObserver_channelObserver);
  v3 = self;
  objc_msgSend(v2, "setDelegate:", 0);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for ChannelListObserver();
  -[ChannelListObserver dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts19ChannelListObserver_currentValue));
  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19ChannelListObserver_didChange), *(_QWORD *)&self->currentValue[OBJC_IVAR____TtC8Podcasts19ChannelListObserver_didChange]);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts19ChannelListObserver_mangedContextProvider));
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  _TtC8Podcasts19ChannelListObserver *v5;

  v4 = a3;
  v5 = self;
  sub_100176DAC();

}

@end
