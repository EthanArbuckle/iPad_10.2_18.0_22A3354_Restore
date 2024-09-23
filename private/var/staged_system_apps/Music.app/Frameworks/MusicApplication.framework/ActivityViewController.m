@implementation ActivityViewController

- (int64_t)sharingStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ActivityViewController();
  return -[ActivityViewController sharingStyle](&v3, "sharingStyle");
}

- (void)setSharingStyle:(int64_t)a3
{
  objc_class *v5;
  _TtC16MusicApplication22ActivityViewController *v6;
  id v7;
  objc_super v8;
  objc_super v9;

  v5 = (objc_class *)type metadata accessor for ActivityViewController();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[ActivityViewController sharingStyle](&v9, "sharingStyle");
  v8.receiver = v6;
  v8.super_class = v5;
  -[ActivityViewController setSharingStyle:](&v8, "setSharingStyle:", a3);
  sub_A182C(v7);

}

- (void)_prepareActivity:(id)a3
{
  id v4;
  _TtC16MusicApplication22ActivityViewController *v5;

  v4 = a3;
  v5 = self;
  sub_A1974(v4);

}

- (_TtC16MusicApplication22ActivityViewController)initWithActivityItems:(id)a3 applicationActivities:(id)a4
{
  id v4;
  _TtC16MusicApplication22ActivityViewController *result;

  v4 = a3;
  result = (_TtC16MusicApplication22ActivityViewController *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.ActivityViewController", 39, "init(activityItems:applicationActivities:)", 42, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->recipientEmail[OBJC_IVAR____TtC16MusicApplication22ActivityViewController_recipientEmail]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->recipientEmail[OBJC_IVAR____TtC16MusicApplication22ActivityViewController_recipientPhoneNumber]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC16MusicApplication22ActivityViewController_defaultExcludedActivityTypes));
}

@end
