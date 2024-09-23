@implementation StationListObserver

- (void)dealloc
{
  void *v2;
  _TtC8Podcasts19StationListObserver *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19StationListObserver_stationsObserver);
  v3 = self;
  objc_msgSend(v2, "setDelegate:", 0);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for StationListObserver(0);
  -[StationListObserver dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC8Podcasts19StationListObserver_currentValue));
  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts19StationListObserver_didChange), *(_QWORD *)&self->currentValue[OBJC_IVAR____TtC8Podcasts19StationListObserver_didChange]);

  v3 = (char *)self + OBJC_IVAR____TtC8Podcasts19StationListObserver_options;
  v4 = type metadata accessor for StationListOptions(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC8Podcasts19StationListObserver_managedContextProvider));
}

- (void)controllerDidChangeContent:(id)a3
{
  id v4;
  _TtC8Podcasts19StationListObserver *v5;

  v4 = a3;
  v5 = self;
  sub_10032877C();

}

- (_TtC8Podcasts19StationListObserver)init
{
  _TtC8Podcasts19StationListObserver *result;

  result = (_TtC8Podcasts19StationListObserver *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.StationListObserver", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
