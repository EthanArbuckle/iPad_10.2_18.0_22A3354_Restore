@implementation AppController

- (UIViewController)rootViewController
{
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v2;
  id v3;

  v2 = self;
  v3 = sub_1002CFB60();

  return (UIViewController *)v3;
}

- (UITabBarController)tabBarController
{
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1002CFC84();

  return (UITabBarController *)v3;
}

- (uint64_t)handleiTMSUrlScheme:(uint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  id v11;
  NSURL *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  Class isa;
  uint64_t v18;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = (void *)objc_opt_self(UIApplication);
  v10 = a1;
  v11 = objc_msgSend(v9, "sharedApplication");
  URL._bridgeToObjectiveC()(v12);
  v14 = v13;
  v15 = sub_100138698((uint64_t)_swiftEmptyArrayStorage);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_100026844(&qword_10055B800, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_1003C9B68);
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v11, "openURL:options:completionHandler:", v14, isa, 0, swift_bridgeObjectRelease(v15).n128_f64[0]);

  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)showSearchControllerWithSearchText:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v7;

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
  sub_1002D29EC(v4, v6);

  swift_bridgeObjectRelease(v6);
}

- (void)showDownloadsControllerAnimated:(BOOL)a3
{
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v3;

  v3 = self;
  sub_1002D2C50();

}

- (void)presentStation:(id)a3 new:(BOOL)a4
{
  id v6;
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v7;

  v6 = a3;
  v7 = self;
  sub_1002CFF90(v6, a4);

}

- (void)presentPodcast:(id)a3 episode:(id)a4 podcastTab:(unint64_t)a5 startPlayback:(BOOL)a6 animated:(BOOL)a7
{
  _BOOL4 v7;
  char *v10;
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a6;
  v10 = (char *)a3;
  v11 = self;
  if (a4 && (v12 = objc_msgSend(a4, "uuid")) != 0)
  {
    v13 = v12;
    v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(v12);
    v16 = v15;

  }
  else
  {
    v14 = 0;
    v16 = 0;
  }
  sub_1002D2ED8(v10, v14, v16, 0, v7);

  swift_bridgeObjectRelease(v16);
}

- (void)presentPodcast:(id)a3 episodeUuid:(id)a4 episodeNotAvailable:(BOOL)a5 podcastTab:(unint64_t)a6 startPlayback:(BOOL)a7 animated:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v16;

  v8 = a7;
  v9 = a5;
  if (a4)
  {
    v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v14 = v13;
  }
  else
  {
    v12 = 0;
    v14 = 0;
  }
  v15 = (char *)a3;
  v16 = self;
  sub_1002D2ED8(v15, v12, v14, v9, v8);

  swift_bridgeObjectRelease(v14);
}

- (BOOL)isUnplayedTabSelected
{
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v2;
  char v3;
  char v4;

  v2 = self;
  NavigationTab.intValue.getter(8);
  sub_1002D3500();
  v4 = v3;

  return v4 & 1;
}

- (void)selectUnplayedTab
{
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v2;

  v2 = self;
  sub_1002D0818();

}

- (void)selectUnplayedTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (*v7)(__n128);
  uint64_t v8;
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v9;

  v5 = a3;
  v7 = (void (*)(__n128))_Block_copy(a5);
  if (v7)
  {
    v8 = swift_allocObject(&unk_1004BEE00, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v7 = (void (*)(__n128))sub_1002D407C;
  }
  else
  {
    v8 = 0;
  }
  v9 = self;
  sub_1002D3804(v5, v7, v8, 8);
  sub_10002CA30((uint64_t)v7, v8);

}

- (BOOL)isMyPodcastsTabSelected
{
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v6;
  uint64_t v7;
  char v8;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  sub_10000A520((uint64_t)self + OBJC_IVAR____TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController_appTraits, (uint64_t)v10);
  v3 = v11;
  v4 = v12;
  sub_10003A834(v10, v11);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 16);
  v6 = self;
  v7 = v5(v3, v4);
  NavigationTab.intValue.getter(v7);
  sub_100175988(v7);
  sub_10003D380(v10);
  sub_1002D3500();
  LOBYTE(v7) = v8;

  return v7 & 1;
}

- (void)switchToLibrary
{
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v2;

  v2 = self;
  sub_1002D0998();

}

- (void)selectMyPodcastsTab
{
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v2;

  v2 = self;
  sub_1002D0998();

}

- (void)selectMyPodcastsTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (*v7)(__n128);
  uint64_t v8;
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v9;

  v5 = a3;
  v7 = (void (*)(__n128))_Block_copy(a5);
  if (v7)
  {
    v8 = swift_allocObject(&unk_1004BEDD8, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v7 = (void (*)(__n128))sub_1002D407C;
  }
  else
  {
    v8 = 0;
  }
  v9 = self;
  sub_1002D3674(v5, v7);
  sub_10002CA30((uint64_t)v7, v8);

}

- (void)selectFeaturedTab
{
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v2;

  v2 = self;
  sub_1002D0C08();

}

- (void)selectFeaturedTabAndPopToRoot:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (*v7)(__n128);
  uint64_t v8;
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v9;

  v5 = a3;
  v7 = (void (*)(__n128))_Block_copy(a5);
  if (v7)
  {
    v8 = swift_allocObject(&unk_1004BEDB0, 24, 7);
    *(_QWORD *)(v8 + 16) = v7;
    v7 = (void (*)(__n128))sub_1002D407C;
  }
  else
  {
    v8 = 0;
  }
  v9 = self;
  sub_1002D3804(v5, v7, v8, 9);
  sub_10002CA30((uint64_t)v7, v8);

}

- (void)presentNowPlayingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_opt_self(MTPlayerController);
  v6 = self;
  v7 = objc_msgSend(v5, "defaultInstance");
  objc_msgSend(v7, "presentNowPlayingAnimated:", v3);

}

- (void)dismissNowPlayingAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v6;
  id v7;

  v3 = a3;
  v5 = (void *)objc_opt_self(MTPlayerController);
  v6 = self;
  v7 = objc_msgSend(v5, "defaultInstance");
  objc_msgSend(v7, "dismissNowPlayingAnimated:completion:", v3, 0);

}

- (void)dismissNowPlayingAnimated:(BOOL)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v8;

  v6 = _Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject(&unk_1004BED60, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_100048D5C;
  }
  else
  {
    v7 = 0;
  }
  v8 = self;
  sub_1002D3B8C(a3, v6, v7);
  sub_10002CA30((uint64_t)v6, v7);

}

- (void)presentMigration
{
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v2;

  v2 = self;
  sub_1002D0FA0();

}

- (void)dismissMigration
{
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v2;

  v2 = self;
  sub_1002D18A8();

}

- (void)presentLibraryPicker:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_1004BED38, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1002D1E40((uint64_t)sub_1002D4050, v5);

  swift_release(v5);
}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v10;

  v7 = type metadata accessor for URL(0);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_1002D3C64(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)documentPickerWasCancelled:(id)a3
{
  id v4;
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *v5;

  v4 = a3;
  v5 = self;
  sub_1002D3F08();

}

- (_TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController)init
{
  _TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *result;

  result = (_TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.AppController", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController_appDelegate));
  sub_10003D380((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController_appTraits));
  sub_10002CA30(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController_onLibrarySelection), *(_QWORD *)&self->appDelegate[OBJC_IVAR____TtC8PodcastsP33_9AAABDB1DF664191160F6CD588B99E9913AppController_onLibrarySelection]);
}

- (uint64_t)selectSearchTabAndFocusSearchField
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  void (*v10)(char *, char *, uint64_t);
  id v11;
  NSURL *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  Class isa;
  uint64_t v18;

  sub_10003F544((uint64_t *)&unk_100553DC0);
  __chkstk_darwin();
  v1 = (char *)&v18 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = type metadata accessor for URL(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin();
  v7 = (char *)&v18 - v6;
  v8 = objc_msgSend((id)objc_opt_self(MTURLResolver), "searchUrlForSearchText:", 0);
  if (v8)
  {
    v9 = v8;
    static URL._unconditionallyBridgeFromObjectiveC(_:)(v8);

    v10 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v10(v1, v5, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v1, 0, 1, v2);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) != 1)
    {
      v10(v7, v1, v2);
      v11 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
      URL._bridgeToObjectiveC()(v12);
      v14 = v13;
      v15 = sub_100138698((uint64_t)_swiftEmptyArrayStorage);
      type metadata accessor for OpenExternalURLOptionsKey(0);
      sub_100026844(&qword_10055B800, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_1003C9B68);
      isa = Dictionary._bridgeToObjectiveC()().super.isa;
      objc_msgSend(v11, "openURL:options:completionHandler:", v14, isa, 0, swift_bridgeObjectRelease(v15).n128_f64[0]);

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v7, v2);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  }
  return sub_100007A28((uint64_t)v1, (uint64_t *)&unk_100553DC0);
}

@end
