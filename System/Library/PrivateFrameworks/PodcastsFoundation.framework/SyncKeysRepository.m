@implementation SyncKeysRepository

- (id)subscriptionsSyncVersionFor:(int64_t)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(int64_t, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1A905DC3C((uint64_t)v5, (uint64_t)v14);
  v6 = v15;
  v7 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  v8 = *(void (**)(int64_t, uint64_t, uint64_t))(v7 + 96);
  v9 = self;
  v8(a3, v6, v7);
  v11 = v10;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);

  if (!v11)
    return 0;
  v12 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return v12;
}

+ (_TtC18PodcastsFoundation18SyncKeysRepository)shared
{
  if (qword_1ED2A46E0 != -1)
    swift_once();
  return (_TtC18PodcastsFoundation18SyncKeysRepository *)(id)qword_1ED2A46D0;
}

- (_TtC18PodcastsFoundation18SyncKeysRepository)init
{
  _TtC18PodcastsFoundation18SyncKeysRepository *result;

  result = (_TtC18PodcastsFoundation18SyncKeysRepository *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
}

- (BOOL)isNonFollowedShowsSyncDirty
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v7;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 8);
  v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  swift_endAccess();

  return v3 & 1;
}

- (void)setIsNonFollowedShowsSyncDirty:(BOOL)a3
{
  _BOOL8 v3;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BOOL8, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v9;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  v6 = *((_QWORD *)v5 + 3);
  v7 = *((_QWORD *)v5 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  v8 = *(void (**)(_BOOL8, uint64_t, uint64_t))(v7 + 16);
  v9 = self;
  v8(v3, v6, v7);
  swift_endAccess();

}

- (BOOL)isInterestSyncDirty
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v7;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 32);
  v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  swift_endAccess();

  return v3 & 1;
}

- (void)setIsInterestSyncDirty:(BOOL)a3
{
  _BOOL8 v3;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BOOL8, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v9;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  v6 = *((_QWORD *)v5 + 3);
  v7 = *((_QWORD *)v5 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  v8 = *(void (**)(_BOOL8, uint64_t, uint64_t))(v7 + 40);
  v9 = self;
  v8(v3, v6, v7);
  swift_endAccess();

}

- (BOOL)isPlaylistSyncDirty
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v7;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 56);
  v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  swift_endAccess();

  return v3 & 1;
}

- (void)setIsPlaylistSyncDirty:(BOOL)a3
{
  _BOOL8 v3;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BOOL8, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v9;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  v6 = *((_QWORD *)v5 + 3);
  v7 = *((_QWORD *)v5 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  v8 = *(void (**)(_BOOL8, uint64_t, uint64_t))(v7 + 64);
  v9 = self;
  v8(v3, v6, v7);
  swift_endAccess();

}

- (BOOL)isSubscriptionSyncDirtyFor:(int64_t)a3
{
  _TtC18PodcastsFoundation18SyncKeysRepository *v4;

  v4 = self;
  LOBYTE(a3) = SyncKeysRepository.isSubscriptionSyncDirty(for:)(a3);

  return a3 & 1;
}

- (void)markSubscriptionSyncDirty:(BOOL)a3 for:(int64_t)a4
{
  _TtC18PodcastsFoundation18SyncKeysRepository *v6;

  v6 = self;
  SyncKeysRepository.markSubscriptionSyncDirty(_:for:)(a3, a4);

}

- (void)updateSubscriptionsSyncVersionFor:(int64_t)a3 newValue:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(int64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v13;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  if (a4)
  {
    v6 = sub_1A93F8040();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1A905DC3C((uint64_t)v9, (uint64_t)v14);
  v10 = v15;
  v11 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  v12 = *(void (**)(int64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 104);
  v13 = self;
  v12(a3, v6, v8, v10, v11);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);

  swift_bridgeObjectRelease();
}

- (void)resetSubscriptionsSyncVersionFor:(int64_t)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(int64_t, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1A905DC3C((uint64_t)v5, (uint64_t)v10);
  v6 = v11;
  v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v8 = *(void (**)(int64_t, uint64_t, uint64_t))(v7 + 112);
  v9 = self;
  v8(a3, v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);

}

- (BOOL)isBookmarksSyncDirtyFor:(int64_t)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(int64_t, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v9;
  _QWORD v11[3];
  uint64_t v12;
  uint64_t v13;

  v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1A905DC3C((uint64_t)v5, (uint64_t)v11);
  v6 = v12;
  v7 = v13;
  __swift_project_boxed_opaque_existential_1(v11, v12);
  v8 = *(uint64_t (**)(int64_t, uint64_t, uint64_t))(v7 + 120);
  v9 = self;
  LOBYTE(a3) = v8(a3, v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v11);

  return a3 & 1;
}

- (void)markBookmarksSyncDirty:(BOOL)a3 for:(int64_t)a4
{
  _BOOL8 v5;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_BOOL8, int64_t, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v11;
  _QWORD v12[3];
  uint64_t v13;
  uint64_t v14;

  v5 = a3;
  v7 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1A905DC3C((uint64_t)v7, (uint64_t)v12);
  v8 = v13;
  v9 = v14;
  __swift_project_boxed_opaque_existential_1(v12, v13);
  v10 = *(void (**)(_BOOL8, int64_t, uint64_t, uint64_t))(v9 + 128);
  v11 = self;
  v10(v5, a4, v8, v9);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);

}

- (void)markInterestSyncDirty:(BOOL)a3
{
  _BOOL8 v3;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BOOL8, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1A905DC3C((uint64_t)v5, (uint64_t)v10);
  v6 = v11;
  v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v8 = *(void (**)(_BOOL8, uint64_t, uint64_t))(v7 + 280);
  v9 = self;
  v8(v3, v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);

}

- (NSString)nonFollowedShowsSyncVersion
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 184);
  v7 = self;
  v6(v4, v5);
  v9 = v8;
  swift_endAccess();

  if (!v9)
    return (NSString *)0;
  v10 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

- (void)setNonFollowedShowsSyncVersion:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v11;

  if (a3)
  {
    v4 = sub_1A93F8040();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  v8 = *((_QWORD *)v7 + 3);
  v9 = *((_QWORD *)v7 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 192);
  v11 = self;
  v10(v4, v6, v8, v9);
  swift_endAccess();

}

- (NSString)interestSyncVersion
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 232);
  v7 = self;
  v6(v4, v5);
  v9 = v8;
  swift_endAccess();

  if (!v9)
    return (NSString *)0;
  v10 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

- (void)setInterestSyncVersion:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v11;

  if (a3)
  {
    v4 = sub_1A93F8040();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  v8 = *((_QWORD *)v7 + 3);
  v9 = *((_QWORD *)v7 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 240);
  v11 = self;
  v10(v4, v6, v8, v9);
  swift_endAccess();

}

- (NSString)podcastsDomainVersion
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 208);
  v7 = self;
  v6(v4, v5);
  v9 = v8;
  swift_endAccess();

  if (!v9)
    return (NSString *)0;
  v10 = (void *)sub_1A93F8010();
  swift_bridgeObjectRelease();
  return (NSString *)v10;
}

- (void)setPodcastsDomainVersion:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v11;

  if (a3)
  {
    v4 = sub_1A93F8040();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  v8 = *((_QWORD *)v7 + 3);
  v9 = *((_QWORD *)v7 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v7, v8);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 216);
  v11 = self;
  v10(v4, v6, v8, v9);
  swift_endAccess();

}

- (BOOL)isLibrarySyncEnabled
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v7;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore);
  swift_beginAccess();
  v4 = v3[3];
  v5 = v3[4];
  __swift_project_boxed_opaque_existential_1(v3, v4);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 136);
  v7 = self;
  LOBYTE(v3) = v6(v4, v5);
  swift_endAccess();

  return v3 & 1;
}

- (void)setIsLibrarySyncEnabled:(BOOL)a3
{
  _BOOL8 v3;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_BOOL8, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v9;

  v3 = a3;
  v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  v6 = *((_QWORD *)v5 + 3);
  v7 = *((_QWORD *)v5 + 4);
  __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v5, v6);
  v8 = *(void (**)(_BOOL8, uint64_t, uint64_t))(v7 + 144);
  v9 = self;
  v8(v3, v6, v7);
  swift_endAccess();

}

- (double)subscriptionsLastSyncTimestampFor:(int64_t)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(int64_t, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v9;
  double v10;
  char v11;
  double v12;
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1A905DC3C((uint64_t)v5, (uint64_t)v14);
  v6 = v15;
  v7 = v16;
  __swift_project_boxed_opaque_existential_1(v14, v15);
  v8 = *(uint64_t (**)(int64_t, uint64_t, uint64_t))(v7 + 336);
  v9 = self;
  v10 = COERCE_DOUBLE(v8(a3, v6, v7));
  if ((v11 & 1) != 0)
    v12 = 0.0;
  else
    v12 = v10;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);

  return v12;
}

- (void)updateSubscriptionsLastSyncTimestampFor:(int64_t)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(int64_t, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1A905DC3C((uint64_t)v5, (uint64_t)v10);
  v6 = v11;
  v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v8 = *(void (**)(int64_t, uint64_t, uint64_t))(v7 + 344);
  v9 = self;
  v8(a3, v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);

}

- (void)resetSubscriptionsLastSyncTimestampFor:(int64_t)a3
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(int64_t, uint64_t, uint64_t);
  _TtC18PodcastsFoundation18SyncKeysRepository *v9;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v5 = (char *)self + OBJC_IVAR____TtC18PodcastsFoundation18SyncKeysRepository_syncKeysStore;
  swift_beginAccess();
  sub_1A905DC3C((uint64_t)v5, (uint64_t)v10);
  v6 = v11;
  v7 = v12;
  __swift_project_boxed_opaque_existential_1(v10, v11);
  v8 = *(void (**)(int64_t, uint64_t, uint64_t))(v7 + 352);
  v9 = self;
  v8(a3, v6, v7);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);

}

+ (BOOL)shouldSyncInReadOnlyMode
{
  char v2;
  char v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  if ((isRunningUnitTests() & 1) != 0
    || (objc_msgSend((id)objc_opt_self(), sel_isRunningOnHomepod) & 1) == 0)
  {
    v2 = 0;
  }
  else
  {
    v5 = &type metadata for Podcasts;
    v6 = sub_1A90A4238();
    v4[0] = 32;
    v2 = sub_1A93F7500();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  }
  return v2 & 1;
}

@end
