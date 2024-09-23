@implementation MCDSharePlayTogetherViewModel

+ (NSString)notificationName
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (int64_t)connectedParticipantsCount
{
  _QWORD *v2;
  uint64_t (*v3)(void);
  _TtC16MusicApplication29MCDSharePlayTogetherViewModel *v4;
  _QWORD *v5;
  int64_t v6;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication29MCDSharePlayTogetherViewModel_session);
  v3 = *(uint64_t (**)(void))&stru_1A8.segname[(*v2 & swift_isaMask) - 8];
  v4 = self;
  v5 = v2;
  v6 = v3();

  return v6;
}

- (int64_t)pendingParticipantsCount
{
  _QWORD *v2;
  uint64_t (*v3)(void);
  _TtC16MusicApplication29MCDSharePlayTogetherViewModel *v4;
  _QWORD *v5;
  int64_t v6;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication29MCDSharePlayTogetherViewModel_session);
  v3 = *(uint64_t (**)(void))((char *)&stru_1A8.reloff + (*v2 & swift_isaMask));
  v4 = self;
  v5 = v2;
  v6 = v3();

  return v6;
}

- (BOOL)isActive
{
  _QWORD *v2;
  uint64_t (*v3)(void);
  _TtC16MusicApplication29MCDSharePlayTogetherViewModel *v4;
  _QWORD *v5;

  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16MusicApplication29MCDSharePlayTogetherViewModel_session);
  v3 = *(uint64_t (**)(void))&stru_248.segname[(*v2 & swift_isaMask) + 16];
  v4 = self;
  v5 = v2;
  LOBYTE(v3) = v3();

  return v3 & 1;
}

- (_TtC16MusicApplication29MCDSharePlayTogetherViewModel)init
{
  _TtC16MusicApplication29MCDSharePlayTogetherViewModel *result;

  result = (_TtC16MusicApplication29MCDSharePlayTogetherViewModel *)_swift_stdlib_reportUnimplementedInitializer("MusicApplication.MCDSharePlayTogetherViewModel", 46, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16MusicApplication29MCDSharePlayTogetherViewModel_session));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16MusicApplication29MCDSharePlayTogetherViewModel_participantsSubscription));
}

@end
