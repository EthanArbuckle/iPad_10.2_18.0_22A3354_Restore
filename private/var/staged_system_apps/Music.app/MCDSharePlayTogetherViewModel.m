@implementation MCDSharePlayTogetherViewModel

+ (NSString)notificationName
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (int64_t)connectedParticipantsCount
{
  _QWORD *v2;
  uint64_t (*v3)(void);
  _TtC5Music29MCDSharePlayTogetherViewModel *v4;
  _QWORD *v5;
  int64_t v6;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music29MCDSharePlayTogetherViewModel_session);
  v3 = *(uint64_t (**)(void))((*v2 & swift_isaMask) + 0x1B0);
  v4 = self;
  v5 = v2;
  v6 = v3();

  return v6;
}

- (int64_t)pendingParticipantsCount
{
  _QWORD *v2;
  uint64_t (*v3)(void);
  _TtC5Music29MCDSharePlayTogetherViewModel *v4;
  _QWORD *v5;
  int64_t v6;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music29MCDSharePlayTogetherViewModel_session);
  v3 = *(uint64_t (**)(void))((*v2 & swift_isaMask) + 0x1E0);
  v4 = self;
  v5 = v2;
  v6 = v3();

  return v6;
}

- (BOOL)isActive
{
  _QWORD *v2;
  uint64_t (*v3)(void);
  _TtC5Music29MCDSharePlayTogetherViewModel *v4;
  _QWORD *v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Music29MCDSharePlayTogetherViewModel_session);
  v3 = *(uint64_t (**)(void))((*v2 & swift_isaMask) + 0x268);
  v4 = self;
  v5 = v2;
  LOBYTE(v3) = v3();

  return v3 & 1;
}

- (_TtC5Music29MCDSharePlayTogetherViewModel)init
{
  _TtC5Music29MCDSharePlayTogetherViewModel *result;

  result = (_TtC5Music29MCDSharePlayTogetherViewModel *)_swift_stdlib_reportUnimplementedInitializer("Music.MCDSharePlayTogetherViewModel", 35, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC5Music29MCDSharePlayTogetherViewModel_participantsSubscription));
}

@end
