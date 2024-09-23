@implementation MTNotificationSettingsSectionedViewController

- (_TtC8Podcasts45MTNotificationSettingsSectionedViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001AB1B4();
}

- (_TtC8Podcasts45MTNotificationSettingsSectionedViewController)init
{
  return (_TtC8Podcasts45MTNotificationSettingsSectionedViewController *)sub_1001A8364();
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MTNotificationSettingsSectionedViewController();
  v2 = v3.receiver;
  -[MTGenericSettingsViewController viewDidLoad](&v3, "viewDidLoad");
  sub_1001A8450();

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for MTNotificationSettingsSectionedViewController();
  v4 = (char *)v7.receiver;
  -[MTGenericSettingsViewController viewWillAppear:](&v7, "viewWillAppear:", v3);
  v5 = *(_QWORD *)&v4[OBJC_IVAR____TtC8Podcasts45MTNotificationSettingsSectionedViewController_newEpisodeNotifcationGroupInitialHighlightedPodcastUuid
                    + 8];
  if (v5)
  {
    v6 = *(_QWORD *)&v4[OBJC_IVAR____TtC8Podcasts45MTNotificationSettingsSectionedViewController_newEpisodeNotifcationGroupInitialHighlightedPodcastUuid];
    swift_bridgeObjectRetain(*(_QWORD *)&v4[OBJC_IVAR____TtC8Podcasts45MTNotificationSettingsSectionedViewController_newEpisodeNotifcationGroupInitialHighlightedPodcastUuid
                                          + 8]);
    sub_1001A90E8(v6, v5, 0);

    swift_bridgeObjectRelease(v5);
  }
  else
  {

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC8Podcasts45MTNotificationSettingsSectionedViewController *v4;

  v4 = self;
  sub_1001AA6D0(a3);

}

- (void)configureCell:(id)a3 atIndexPath:(id)a4 withDescription:(id)a5 inGroupWithIdentifier:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  _TtC8Podcasts45MTNotificationSettingsSectionedViewController *v24;
  uint64_t v25;

  v11 = sub_10003F544((uint64_t *)&unk_1005598F0);
  __chkstk_darwin(v11);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v18 = type metadata accessor for IndexPath(0, v16, v17);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 0, 1, v18);
  }
  else
  {
    v19 = type metadata accessor for IndexPath(0, v12, v13);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v15, 1, 1, v19);
  }
  if (a6)
  {
    v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6);
    a6 = v21;
  }
  else
  {
    v20 = 0;
  }
  v22 = a3;
  v23 = a5;
  v24 = self;
  sub_1001AAA18(a3, (uint64_t)v15, a5, v20, (uint64_t)a6);

  swift_bridgeObjectRelease(a6);
  sub_100007A28((uint64_t)v15, (uint64_t *)&unk_1005598F0);
}

- (double)heightForRowWithDescription:(id)a3 inGroupWithIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8Podcasts45MTNotificationSettingsSectionedViewController *v10;
  double v11;

  if (a4)
  {
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = a3;
  v10 = self;
  v11 = sub_1001AAD9C((uint64_t)a3, v6, v8);

  swift_bridgeObjectRelease(v8);
  return v11;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8Podcasts45MTNotificationSettingsSectionedViewController_allowNotificationsSection));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8Podcasts45MTNotificationSettingsSectionedViewController_newEpisodeSection));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC8Podcasts45MTNotificationSettingsSectionedViewController_serverPushSection));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Podcasts45MTNotificationSettingsSectionedViewController_orderedSections));
  sub_100152110((uint64_t)self + OBJC_IVAR____TtC8Podcasts45MTNotificationSettingsSectionedViewController_delegate);
  swift_bridgeObjectRelease(*(_QWORD *)(&self->super.super._emphasizedCellNeedsScrollToVisible
                                      + OBJC_IVAR____TtC8Podcasts45MTNotificationSettingsSectionedViewController_newEpisodeNotifcationGroupInitialHighlightedPodcastUuid));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                                     + OBJC_IVAR____TtC8Podcasts45MTNotificationSettingsSectionedViewController_subscriptions));
}

@end
