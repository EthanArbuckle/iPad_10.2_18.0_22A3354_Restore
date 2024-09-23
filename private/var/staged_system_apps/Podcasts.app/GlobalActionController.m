@implementation GlobalActionController

- (UIResponder)nextResponder
{
  return (UIResponder *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.isa
                                                                + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_debugActionsController));
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = (void *)objc_opt_self(NSNotificationCenter);
  v5 = self;
  v6 = objc_msgSend(v4, "defaultCenter");
  objc_msgSend(v6, "removeObserver:", v5);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  -[GlobalActionController dealloc](&v7, "dealloc");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_objectGraph));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_libraryDataProvider));
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.isa
                                      + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_syncController));
  sub_10003D380((Class *)((char *)&self->super.super.isa
                        + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl));
  sub_10003D380((Class *)((char *)&self->super.super.isa
                        + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_episodeController));
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playbackController));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_debugActionsController));
}

- (void)addPodcastAction
{
  sub_10022410C(self, (uint64_t)a2, (Class *)&off_1004A4300, (SEL *)&selRef_presentAddPodcastUI);
}

- (void)focusSearchField
{
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v2;

  v2 = self;
  sub_100221608();

}

- (void)refreshCommand
{
  uint64_t v3;
  uint64_t ObjectType;
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[3];
  uint64_t v10;
  uint64_t v11;

  v3 = *(_QWORD *)&self->objectGraph[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_libraryDataProvider];
  ObjectType = swift_getObjectType(*(Class *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_libraryDataProvider), a2);
  v5 = self;
  dispatch thunk of LibraryDataProviderProtocol.libraryActionController.getter(v9, ObjectType, v3);
  v6 = v10;
  v7 = v11;
  sub_10003A834(v9, v10);
  v8 = dispatch thunk of LibraryActionControllerProtocol.updateAllFeeds()(v6, v7);
  swift_release(v8);
  sub_10003D380(v9);
  objc_msgSend(*(id *)((char *)&v5->super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_syncController), "syncEverything");

}

- (void)goToCurrentShow
{
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v2;

  v2 = self;
  sub_100221DC8();

}

- (void)showNotificationSettings
{
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v2;

  v2 = self;
  sub_10022286C();

}

- (void)playPause
{
  uint64_t v2;
  uint64_t v3;
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v4;

  v4 = self;
  if ((_UIAccessibilityFullKeyboardAccessEnabled() & 1) == 0 && !sub_100226BB4())
  {
    v2 = *(_QWORD *)&v4->libraryDataProvider[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl
                                           + 8];
    v3 = *(_QWORD *)&v4->syncController[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl];
    sub_10003A834((Class *)((char *)&v4->super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl), v2);
    (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v3 + 80))(0, 0, v2, v3);
  }

}

- (void)alternatePlayPause
{
  uint64_t v2;
  uint64_t v3;
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v4;

  v4 = self;
  if (_UIAccessibilityFullKeyboardAccessEnabled())
  {
    v2 = *(_QWORD *)&v4->libraryDataProvider[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl
                                           + 8];
    v3 = *(_QWORD *)&v4->syncController[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl];
    sub_10003A834((Class *)((char *)&v4->super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl), v2);
    (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v3 + 80))(0, 0, v2, v3);
  }

}

- (void)nextTrack
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD, _QWORD, uint64_t, uint64_t);
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v7;

  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl);
  v4 = v3[3];
  v5 = v3[4];
  sub_10003A834(v3, v4);
  v6 = *(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v5 + 112);
  v7 = self;
  v6(0, 0, v4, v5);

}

- (void)previousTrack
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD, _QWORD, uint64_t, uint64_t);
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v7;

  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl);
  v4 = v3[3];
  v5 = v3[4];
  sub_10003A834(v3, v4);
  v6 = *(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v5 + 128);
  v7 = self;
  v6(0, 0, v4, v5);

}

- (void)jumpForwards
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD, _QWORD, uint64_t, uint64_t);
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v7;

  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl);
  v4 = v3[3];
  v5 = v3[4];
  sub_10003A834(v3, v4);
  v6 = *(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v5 + 144);
  v7 = self;
  v6(0, 0, v4, v5);

}

- (void)jumpBackwards
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD, _QWORD, uint64_t, uint64_t);
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v7;

  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl);
  v4 = v3[3];
  v5 = v3[4];
  sub_10003A834(v3, v4);
  v6 = *(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(v5 + 160);
  v7 = self;
  v6(0, 0, v4, v5);

}

- (void)setThreeQuartersSpeed
{
  sub_100222D44((char *)self, (uint64_t)a2, 0);
}

- (void)setNormalSpeed
{
  sub_100222D44((char *)self, (uint64_t)a2, 1);
}

- (void)setOneAndAQuarterSpeed
{
  sub_100222D44((char *)self, (uint64_t)a2, 2);
}

- (void)setOneAndAHalfSpeed
{
  sub_100222D44((char *)self, (uint64_t)a2, 3);
}

- (void)setOneAndThreeQuartersSpeed
{
  sub_100222D44((char *)self, (uint64_t)a2, 4);
}

- (void)setDoubleSpeed
{
  sub_100222D44((char *)self, (uint64_t)a2, 5);
}

- (void)increaseVolume
{
  uint64_t v2;
  uint64_t v3;
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v4;

  v4 = self;
  if ((static Podcasts.isBlueMoonEnabled()(v4) & 1) != 0)
  {
    dispatch thunk of PlaybackController.increaseVolume()();
  }
  else
  {
    v2 = *(_QWORD *)&v4->libraryDataProvider[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl
                                           + 8];
    v3 = *(_QWORD *)&v4->syncController[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl];
    sub_10003A834((Class *)((char *)&v4->super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl), v2);
    (*(void (**)(uint64_t, uint64_t))(v3 + 216))(v2, v3);
  }

}

- (void)decreaseVolume
{
  uint64_t v2;
  uint64_t v3;
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v4;

  v4 = self;
  if ((static Podcasts.isBlueMoonEnabled()(v4) & 1) != 0)
  {
    dispatch thunk of PlaybackController.decreaseVolume()();
  }
  else
  {
    v2 = *(_QWORD *)&v4->libraryDataProvider[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl
                                           + 8];
    v3 = *(_QWORD *)&v4->syncController[OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl];
    sub_10003A834((Class *)((char *)&v4->super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController_playerControl), v2);
    (*(void (**)(uint64_t, uint64_t))(v3 + 224))(v2, v3);
  }

}

- (void)didChangeStoreAccount:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v10;
  Class isa;
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v12;
  uint64_t v13;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = (void *)objc_opt_self(MTAccountController);
  v10 = self;
  isa = Notification._bridgeToObjectiveC()().super.isa;
  LODWORD(v9) = objc_msgSend(v9, "iTunesAccountDidChangeForACAccountNotification:", isa);

  if ((_DWORD)v9)
  {
    v12 = (_TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *)objc_msgSend((id)objc_opt_self(UIMenuSystem), "mainSystem");
    -[GlobalActionController setNeedsRebuild](v12, "setNeedsRebuild");

    v10 = v12;
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)mainWindowDidChangeKey:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v10;
  id v11;
  uint64_t v12;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = (void *)objc_opt_self(UIMenuSystem);
  v10 = self;
  v11 = objc_msgSend(v9, "mainSystem");
  objc_msgSend(v11, "setNeedsRebuild");

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)reportAConcern
{
  void *v3;
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v4;
  id v5;
  void *v6;
  _QWORD v7[6];

  v3 = (void *)objc_opt_self(IMURLBag);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedInstance");
  v7[4] = sub_100223118;
  v7[5] = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_10034F9E4;
  v7[3] = &unk_1004B6808;
  v6 = _Block_copy(v7);
  objc_msgSend(v5, "reportAConcernURLWithCompletion:", v6);
  _Block_release(v6);

}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v7;
  uint64_t v8;
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v9;
  unsigned __int8 v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_100223250((uint64_t)a3, (uint64_t)v12);

  sub_100007A28((uint64_t)v12, (uint64_t *)&unk_100552300);
  return v10 & 1;
}

- (void)validateCommand:(id)a3
{
  id v4;
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v5;

  v4 = a3;
  v5 = self;
  sub_100223460(v4);

}

- (_TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController)init
{
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *result;

  result = (_TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *)_swift_stdlib_reportUnimplementedInitializer("Podcasts.GlobalActionController", 31, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)menuBarNewStation
{
  id v3;
  _TtC8PodcastsP33_1EBA7FB1085F92D3987B8EDF2EAB73D122GlobalActionController *v4;
  id v5;

  v3 = objc_allocWithZone((Class)MTAddPodcastOrStationController);
  v4 = self;
  v5 = objc_msgSend(v3, "init");
  objc_msgSend(v5, "presentAddStationUI");

}

- (void)manageAccount
{
  uint64_t v0;
  void *ObjCClassFromMetadata;
  id v2;
  unsigned int v3;
  id v4;
  id v5;

  v0 = sub_100005EC8(0, (unint64_t *)&unk_10055B1C0, off_1004A42F8);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v0);
  v2 = objc_msgSend(ObjCClassFromMetadata, "sharedInstance");
  v3 = objc_msgSend(v2, "isUserLoggedIn");

  if (v3)
  {
    objc_msgSend((id)objc_opt_self(MTAccountController), "openAccountsPanel");
  }
  else
  {
    v4 = objc_msgSend(ObjCClassFromMetadata, "sharedInstance");
    v5 = String._bridgeToObjectiveC()();
    objc_msgSend(v4, "promptAccountAuthenticationWithDebugReason:forced:", v5, 1);

  }
}

- (void)showPrivacyInfo
{
  uint64_t v0;
  uint64_t v1;
  NSString v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  static String._unconditionallyBridgeFromObjectiveC(_:)(kMTPodcastsPrivacyIdentifier);
  v1 = v0;
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v1);
  v9 = objc_msgSend((id)objc_opt_self(OBPrivacyPresenter), "presenterForPrivacySplashWithIdentifier:", v2);

  v3 = v9;
  if (v9)
  {
    v4 = (void *)objc_opt_self(UIApplication);
    v5 = v9;
    v6 = objc_msgSend(v4, "sharedApplication");
    v7 = objc_msgSend(v6, "delegate");

    if (v7)
    {
      if ((objc_msgSend(v7, "respondsToSelector:", "window") & 1) != 0)
      {
        v8 = objc_msgSend(v7, "window");
        swift_unknownObjectRelease(v7);
        v7 = objc_msgSend(v8, "rootViewController");

      }
      else
      {
        swift_unknownObjectRelease(v7);
        v7 = 0;
      }
    }
    objc_msgSend(v5, "setPresentingViewController:", v7);

    v3 = v9;
  }
  objc_msgSend(v3, "present");

}

- (void)showMainWindow
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  id v10;

  v0 = (void *)objc_opt_self(UIApplication);
  v1 = objc_msgSend(v0, "sharedApplication");
  v2 = objc_msgSend(v1, "connectedScenes");

  v3 = sub_100005EC8(0, &qword_10055B020, UIScene_ptr);
  v4 = sub_10022746C();
  v5 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v2, v3, v4);

  sub_10022036C(v5);
  v7 = v6;
  *(_QWORD *)&v8 = swift_bridgeObjectRelease(v5).n128_u64[0];
  if (v7)
  {
    v9 = objc_msgSend(v7, "session", v8);

  }
  else
  {
    v9 = 0;
  }
  v10 = objc_msgSend(v0, "sharedApplication");
  objc_msgSend(v10, "requestSceneSessionActivation:userActivity:options:errorHandler:", v9, 0, 0, 0);

}

- (void)resetIdentifier
{
  void *v0;
  id v1;
  Swift::String v2;
  Swift::String v3;
  void *object;
  id v5;
  Swift::String v6;
  Swift::String v7;
  void *v8;
  NSString v9;
  NSString v10;
  id v11;
  id v12;
  Swift::String v13;
  Swift::String v14;
  void *v15;
  NSString v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  Swift::String v21;
  Swift::String v22;
  void *v23;
  NSString v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  _QWORD aBlock[5];
  uint64_t v30;
  Swift::String v31;
  Swift::String v32;
  Swift::String v33;
  Swift::String v34;

  v0 = (void *)objc_opt_self(NSBundle);
  v1 = objc_msgSend(v0, "mainBundle");
  v31._countAndFlagsBits = 0xD000000000000011;
  v2._countAndFlagsBits = 0xD00000000000001CLL;
  v31._object = (void *)0x8000000100435DA0;
  v2._object = (void *)0x8000000100435D80;
  v3._countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  object = NSLocalizedString(_:tableName:bundle:value:comment:)(v2, (Swift::String_optional)0, (NSBundle)v1, v3, v31)._object;

  v5 = objc_msgSend(v0, "mainBundle");
  v6._countAndFlagsBits = 0xD00000000000001ELL;
  v32._countAndFlagsBits = 0xD00000000000002ALL;
  v32._object = (void *)0x8000000100435DE0;
  v6._object = (void *)0x8000000100435DC0;
  v7._countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v8 = NSLocalizedString(_:tableName:bundle:value:comment:)(v6, (Swift::String_optional)0, (NSBundle)v5, v7, v32)._object;

  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v8);
  v11 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v9, v10, 1);

  v12 = objc_msgSend(v0, "mainBundle");
  v13._countAndFlagsBits = 0xD000000000000024;
  v33._object = (void *)0x8000000100435E40;
  v13._object = (void *)0x8000000100435E10;
  v14._countAndFlagsBits = 0;
  v14._object = (void *)0xE000000000000000;
  v33._countAndFlagsBits = 0xD000000000000010;
  v15 = NSLocalizedString(_:tableName:bundle:value:comment:)(v13, (Swift::String_optional)0, (NSBundle)v12, v14, v33)._object;

  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v15);
  aBlock[4] = sub_1002230D4;
  v30 = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1001AC13C;
  aBlock[3] = &unk_1004B6830;
  v17 = _Block_copy(aBlock);
  swift_release(v30);
  v18 = (void *)objc_opt_self(UIAlertAction);
  v19 = objc_msgSend(v18, "actionWithTitle:style:handler:", v16, 2, v17);
  _Block_release(v17);

  objc_msgSend(v11, "addAction:", v19);
  v20 = objc_msgSend(v0, "mainBundle");
  v34._object = (void *)0xE000000000000000;
  v21._countAndFlagsBits = 0x6C65636E6143;
  v21._object = (void *)0xE600000000000000;
  v22._countAndFlagsBits = 0;
  v22._object = (void *)0xE000000000000000;
  v34._countAndFlagsBits = 0;
  v23 = NSLocalizedString(_:tableName:bundle:value:comment:)(v21, (Swift::String_optional)0, (NSBundle)v20, v22, v34)._object;

  v24 = String._bridgeToObjectiveC()();
  v25 = objc_msgSend(v18, "actionWithTitle:style:handler:", v24, 1, 0, swift_bridgeObjectRelease(v23).n128_f64[0]);

  objc_msgSend(v11, "addAction:", v25);
  v26 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v27 = sub_100290A2C();
  v28 = objc_msgSend(v27, "rootViewController");

  if (v28)
  {
    objc_msgSend(v28, "presentViewController:animated:completion:", v11, 0, 0);

  }
}

@end
