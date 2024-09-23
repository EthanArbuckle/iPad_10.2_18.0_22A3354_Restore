@implementation MTNotificationSettingsPresentationController

+ (_TtC8Podcasts44MTNotificationSettingsPresentationController)shared
{
  if (qword_100552088 != -1)
    swift_once(&qword_100552088, sub_10025BAF0);
  return (_TtC8Podcasts44MTNotificationSettingsPresentationController *)(id)qword_100572F28;
}

+ (void)setShared:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = qword_100552088;
  v4 = a3;
  if (v3 != -1)
    swift_once(&qword_100552088, sub_10025BAF0);
  v5 = (void *)qword_100572F28;
  qword_100572F28 = (uint64_t)v4;

}

- (_TtC8Podcasts44MTNotificationSettingsPresentationController)init
{
  objc_super v4;

  swift_unknownObjectWeakInit((char *)self+ OBJC_IVAR____TtC8Podcasts44MTNotificationSettingsPresentationController_activePresentedSettingsViewController, 0);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MTNotificationSettingsPresentationController();
  return -[MTNotificationSettingsPresentationController init](&v4, "init");
}

- (void)presentModalWithHighlightedPodcastUuid:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC8Podcasts44MTNotificationSettingsPresentationController *v7;
  Swift::String_optional v8;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  v8.value._countAndFlagsBits = v4;
  v8.value._object = v6;
  MTNotificationSettingsPresentationController.presentModal(highlightedPodcastUuid:)(v8);

  swift_bridgeObjectRelease(v6);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtC8Podcasts44MTNotificationSettingsPresentationController_activePresentedSettingsViewController);
}

@end
