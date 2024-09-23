@implementation MusicMessagesAppViewController

- (void)viewDidLoad
{
  _TtC16MusicMessagesApp30MusicMessagesAppViewController *v2;

  v2 = self;
  sub_1000294A4();

}

- (void)dealloc
{
  _TtC16MusicMessagesApp30MusicMessagesAppViewController *v2;

  v2 = self;
  sub_1000296C4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicMessagesApp30MusicMessagesAppViewController__sharingViewController));
}

- (void)didStartSendingMessage:(id)a3 conversation:(id)a4
{
  id v6;
  id v7;
  _TtC16MusicMessagesApp30MusicMessagesAppViewController *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = String._bridgeToObjectiveC()();
  AnalyticsSendEvent(v9, 0);

}

- (_TtC16MusicMessagesApp30MusicMessagesAppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC16MusicMessagesApp30MusicMessagesAppViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC16MusicMessagesApp30MusicMessagesAppViewController__sharingViewController) = 0;
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC16MusicMessagesApp30MusicMessagesAppViewController__sharingViewController) = 0;
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for MusicMessagesAppViewController();
  v11 = -[MusicMessagesAppViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC16MusicMessagesApp30MusicMessagesAppViewController)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MusicMessagesApp30MusicMessagesAppViewController__sharingViewController) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MusicMessagesAppViewController();
  return -[MusicMessagesAppViewController initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
