@implementation PlatformContentController

- (void)syncablePlayheadDidChangeForEpisodeUuid:(id)a3 isSignificant:(BOOL)a4
{
  id v5;
  _TtC8Podcasts25PlatformContentController *v6;

  v5 = a3;
  v6 = self;
  sub_100049264((uint64_t)v5);

}

- (void)performMigrationIfNecessaryWithOptionKeyDown:(BOOL)a3 :(id)a4
{
  void *v5;
  uint64_t v6;
  _TtC8Podcasts25PlatformContentController *v7;
  _TtC8Podcasts25PlatformContentController *v8;

  v5 = _Block_copy(a4);
  _Block_copy(v5);
  v6 = qword_100552080;
  v7 = self;
  v8 = v7;
  if (v6 != -1)
  {
    swift_once(&qword_100552080, sub_10000A9B0);
    v7 = v8;
  }
  sub_1000078E8((uint64_t)v7, (uint64_t)v5);
  _Block_release(v5);
  _Block_release(v5);

}

- (void)setMigrationPresenter:(id)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(id, uint64_t, uint64_t);
  _TtC8Podcasts25PlatformContentController *v9;
  _BYTE v10[24];

  v5 = (char *)self + OBJC_IVAR____TtC8Podcasts25PlatformContentController_platformImpl;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Podcasts25PlatformContentController_platformImpl, v10, 33, 0);
  v6 = *((_QWORD *)v5 + 3);
  v7 = *((_QWORD *)v5 + 4);
  sub_100038DEC((uint64_t)v5, v6);
  v8 = *(void (**)(id, uint64_t, uint64_t))(v7 + 24);
  swift_unknownObjectRetain_n(a3, 2);
  v9 = self;
  v8(a3, v6, v7);
  swift_endAccess(v10);

  swift_unknownObjectRelease(a3);
}

- (_TtC8Podcasts25PlatformContentController)init
{
  return (_TtC8Podcasts25PlatformContentController *)sub_10000BEDC();
}

- (BOOL)isMigrationPossible
{
  return 0;
}

+ (NSString)ImportLibraryNotification
{
  return (NSString *)String._bridgeToObjectiveC()();
}

+ (NSString)ImportLibraryNotificationKeyPath
{
  return (NSString *)String._bridgeToObjectiveC()();
}

- (MTMigrationPresenter)migrationPresenter
{
  _QWORD *v2;
  _QWORD *v3;
  _BYTE v5[24];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts25PlatformContentController_platformImpl);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Podcasts25PlatformContentController_platformImpl, v5, 0, 0);
  v3 = sub_10003A834(v2, v2[3]);
  return (MTMigrationPresenter *)(id)swift_unknownObjectRetain(*(_QWORD *)(*v3 + 16));
}

- (void).cxx_destruct
{
  sub_10003D380((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Podcasts25PlatformContentController_platformImpl));
  sub_100007A28((uint64_t)self + OBJC_IVAR____TtC8Podcasts25PlatformContentController_syncabilityController, &qword_10055C9E0);
  sub_100007A28((uint64_t)self + OBJC_IVAR____TtC8Podcasts25PlatformContentController_syncToAppController, &qword_10055C9E8);
}

@end
