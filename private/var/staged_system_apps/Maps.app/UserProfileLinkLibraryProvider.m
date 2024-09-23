@implementation UserProfileLinkLibraryProvider

+ (_TtC4Maps30UserProfileLinkLibraryProvider)sharedInstance
{
  if (qword_1014910C8 != -1)
    swift_once(&qword_1014910C8, sub_1001ABD54);
  return (_TtC4Maps30UserProfileLinkLibraryProvider *)(id)static UserProfileLinkLibraryProvider.shared;
}

- (int64_t)userProfileLinkType
{
  return 0;
}

- (id)observers
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC4Maps30UserProfileLinkLibraryProvider_observers));
}

- (_TtC4Maps30UserProfileLinkLibraryProvider)initWithCountsManager:(id)a3
{
  _TtC4Maps30UserProfileLinkLibraryProvider *result;

  UserProfileLinkLibraryProvider.init(countsManager:)((char *)a3);
  return result;
}

- (id)createUserProfileLink
{
  _TtC4Maps30UserProfileLinkLibraryProvider *v2;
  UserProfileLink *v3;
  void *v4;
  void *v5;

  v2 = self;
  UserProfileLinkLibraryProvider.createUserProfileLink()(v3);
  v5 = v4;

  return v5;
}

- (void)notifyObservers
{
  _TtC4Maps30UserProfileLinkLibraryProvider *v2;

  v2 = self;
  sub_1001AC4B0();

}

- (id)retrieveSubtitleText
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _TtC4Maps30UserProfileLinkLibraryProvider *v7;
  unint64_t v8;
  NSString v9;

  if ((self->observers[OBJC_IVAR____TtC4Maps30UserProfileLinkLibraryProvider_lastTotalCount] & 1) != 0)
  {
    v2 = 0xE000000000000000;
  }
  else
  {
    v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps30UserProfileLinkLibraryProvider_lastTotalCount);
    v5 = sub_100008B04((uint64_t *)&unk_10149A4F0);
    v6 = swift_allocObject(v5, 72, 7);
    *(_OWORD *)(v6 + 16) = xmmword_100E22F40;
    *(_QWORD *)(v6 + 56) = &type metadata for Int;
    *(_QWORD *)(v6 + 64) = &protocol witness table for Int;
    *(_QWORD *)(v6 + 32) = v4;
    v7 = self;
    static String.localizedStringWithFormat(_:_:)(25637, 0xE200000000000000, v6);
    v2 = v8;

    swift_bridgeObjectRelease(v6);
  }
  v9 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return v9;
}

- (_TtC4Maps30UserProfileLinkLibraryProvider)init
{
  _TtC4Maps30UserProfileLinkLibraryProvider *result;

  result = (_TtC4Maps30UserProfileLinkLibraryProvider *)_swift_stdlib_reportUnimplementedInitializer("Maps.UserProfileLinkLibraryProvider", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

- (void)libraryItemsCountManager:(id)a3 didUpdateCounts:(id)a4
{
  id v6;
  id v7;
  _TtC4Maps30UserProfileLinkLibraryProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s4Maps30UserProfileLinkLibraryProviderC24libraryItemsCountManager_15didUpdateCountsyAA0ehiJ0C_AA0ehI0CtF_0();

}

@end
