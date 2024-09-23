@implementation MTNotificationSettingsViewController

- (_TtC8Podcasts36MTNotificationSettingsViewController)initWithCoder:(id)a3
{
  _QWORD *v4;
  id v5;
  _TtC8Podcasts36MTNotificationSettingsViewController *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8Podcasts36MTNotificationSettingsViewController_contentViewController) = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC8Podcasts36MTNotificationSettingsViewController_newEpisodeNotifcationGroupInitialHighlightedPodcastUuid);
  *v4 = 0;
  v4[1] = 0;
  v5 = a3;

  result = (_TtC8Podcasts36MTNotificationSettingsViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0x74726F7075736E75, 0xEA00000000006465, "Podcasts/MTNotificationSettingsViewController.swift", 51, 2, 26, 0);
  __break(1u);
  return result;
}

- (_TtC8Podcasts36MTNotificationSettingsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC8Podcasts36MTNotificationSettingsViewController *)sub_100373AEC(v5, v7, a4);
}

- (void)viewDidLoad
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MTNotificationSettingsViewController();
  v2 = (char *)v5.receiver;
  -[MTNotificationSettingsViewController viewDidLoad](&v5, "viewDidLoad");
  v3 = *(void **)&v2[OBJC_IVAR____TtC8Podcasts36MTNotificationSettingsViewController_sectionedContentViewController];
  v4 = v3;
  sub_1003741B8(v3);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MTNotificationSettingsViewController();
  v4 = v5.receiver;
  -[MTNotificationSettingsViewController viewWillAppear:](&v5, "viewWillAppear:", v3);
  sub_1001A8450();

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MTNotificationSettingsViewController();
  v4 = v5.receiver;
  -[MTNotificationSettingsViewController viewDidAppear:](&v5, "viewDidAppear:", v3);
  if (qword_100552088 != -1)
    swift_once(&qword_100552088, sub_10025BAF0);
  swift_unknownObjectWeakAssign(qword_100572F28+ OBJC_IVAR____TtC8Podcasts44MTNotificationSettingsPresentationController_activePresentedSettingsViewController);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MTNotificationSettingsViewController();
  v4 = v5.receiver;
  -[MTNotificationSettingsViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  if (qword_100552088 != -1)
    swift_once(&qword_100552088, sub_10025BAF0);
  swift_unknownObjectWeakAssign(qword_100572F28+ OBJC_IVAR____TtC8Podcasts44MTNotificationSettingsPresentationController_activePresentedSettingsViewController);

}

- (void)dismissButtonTappedFrom:(id)a3
{
  _TtC8Podcasts36MTNotificationSettingsViewController *v5;
  uint64_t v6;
  _TtC8Podcasts36MTNotificationSettingsViewController *v7;
  __int128 v8;
  __int128 v9;

  if (a3)
  {
    v5 = self;
    v6 = swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(&v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
    v7 = self;
  }
  -[MTNotificationSettingsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v8, v9);

  sub_1000485DC((uint64_t)&v8);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts36MTNotificationSettingsViewController_sectionedContentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8Podcasts36MTNotificationSettingsViewController_contentViewController));
  swift_bridgeObjectRelease(*(_QWORD *)&self->sectionedContentViewController[OBJC_IVAR____TtC8Podcasts36MTNotificationSettingsViewController_newEpisodeNotifcationGroupInitialHighlightedPodcastUuid]);
}

@end
