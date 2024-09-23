@implementation MusicApplicationContextProvider

- (_TtC16MusicApplication31MusicApplicationContextProvider)init
{
  return (_TtC16MusicApplication31MusicApplicationContextProvider *)sub_3D5780();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_nowPlaying));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_nowPlayingSubscription));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_cachedPresentationPolicyNormal));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_cachedPresentationPolicyRestricted));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_bindings));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_playerRequestController));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_urlBagObserver));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_notificationSettingsManager));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider____lazy_storage___musicRecognitionModuleContextProvider));
}

- (id)contextPropertyWithName:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC16MusicApplication31MusicApplicationContextProvider *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD v18[3];
  uint64_t v19;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = a3;
  v9 = self;
  sub_3D6BC8(v5, v7, (uint64_t)v18);

  swift_bridgeObjectRelease(v7);
  v10 = v19;
  if (!v19)
    return 0;
  v11 = __swift_project_boxed_opaque_existential_1(v18, v19);
  v12 = *(_QWORD *)(v10 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, double))(v12 + 16))(v15, v13);
  v16 = (void *)_bridgeAnythingToObjectiveC<A>(_:)(v15, v10);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v10);
  __swift_destroy_boxed_opaque_existential_1(v18);
  return v16;
}

- (BOOL)allowsModalMessageDisplay
{
  return (*((_BYTE *)&self->super.isa
          + OBJC_IVAR____TtC16MusicApplication31MusicApplicationContextProvider_nowPlayingItemHasVideo) & 1) == 0;
}

- (id)viewControllerForModalPresentation
{
  return (id)sub_3D88D4();
}

- (void)messageCoordinator:(id)a3 didRequestAction:(id)a4
{
  uint64_t v7;
  id v8;
  id v9;
  _TtC16MusicApplication31MusicApplicationContextProvider *v10;

  v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_3D79E4((uint64_t)v8, v7);

  swift_bridgeObjectRelease(v7);
}

- (id)presentationPolicyForPolicyGroup:(int64_t)a3
{
  _TtC16MusicApplication31MusicApplicationContextProvider *v4;
  id v5;

  v4 = self;
  v5 = sub_3D7C98(a3);

  return v5;
}

- (double)lastMessageDisplayTime
{
  void *v3;
  _TtC16MusicApplication31MusicApplicationContextProvider *v4;
  id v5;
  double v6;

  v3 = (void *)objc_opt_self(NSUserDefaults);
  v4 = self;
  v5 = objc_msgSend(v3, "standardUserDefaults");
  v6 = sub_3D8238();

  return v6;
}

- (void)setLastMessageDisplayTime:(double)a3
{
  void *v5;
  _TtC16MusicApplication31MusicApplicationContextProvider *v6;
  id v7;
  unint64_t v8;
  _QWORD v9[2];
  _QWORD v10[4];

  v5 = (void *)objc_opt_self(NSUserDefaults);
  v6 = self;
  v7 = objc_msgSend(v5, "standardUserDefaults");
  v10[3] = &type metadata for Double;
  *(double *)v10 = a3;
  v9[0] = 0xD00000000000001CLL;
  v9[1] = 0x80000000010DAA70;
  v8 = sub_55EA0();
  NSUserDefaults.subscript.setter((uint64_t)v10, (uint64_t)v9, (uint64_t)&type metadata for String, v8);

}

@end
