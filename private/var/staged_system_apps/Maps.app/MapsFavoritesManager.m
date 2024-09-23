@implementation MapsFavoritesManager

+ (_TtC4Maps20MapsFavoritesManager)sharedManager
{
  if (qword_101490E30 != -1)
    swift_once(&qword_101490E30, sub_1000F999C);
  return (_TtC4Maps20MapsFavoritesManager *)(id)qword_1014D49B0;
}

- (id)observers
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_observers));
}

- (NSArray)storeSubscriptionTypes
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_storeSubscriptionTypes);
  swift_bridgeObjectRetain(v2);
  sub_100008B04((uint64_t *)&unk_101499CC0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;

  v5 = sub_100008B04((uint64_t *)&unk_101499CC0);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_storeSubscriptionTypes);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_storeSubscriptionTypes) = v6;
  swift_bridgeObjectRelease(v7);
}

- (NSArray)shortcuts
{
  return (NSArray *)sub_1000F9B74((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps20MapsFavoritesManager__shortcuts);
}

- (void)setShortcuts:(id)a3
{
  sub_1000F9AF4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000F9AD0);
}

- (NSArray)sortedShortcuts
{
  return (NSArray *)sub_1000F9B74((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps20MapsFavoritesManager__sortedShortcuts);
}

- (void)setSortedShortcuts:(id)a3
{
  sub_1000F9AF4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000F9B5C);
}

- (NSArray)suggestions
{
  return (NSArray *)sub_1000F9B74((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC4Maps20MapsFavoritesManager__suggestions);
}

- (void)setSuggestions:(id)a3
{
  sub_1000F9AF4(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000F9C44);
}

- (BOOL)hasInitialData
{
  os_unfair_lock_s **v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  _TtC4Maps20MapsFavoritesManager *v6;
  char v8;
  char v9[24];

  v3 = (os_unfair_lock_s **)((char *)self + OBJC_IVAR____TtC4Maps20MapsFavoritesManager__hasInitialData);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps20MapsFavoritesManager__hasInitialData, v9, 0, 0);
  v4 = *v3;
  v5 = *v3 + 4;
  v6 = self;
  swift_retain();
  os_unfair_lock_lock(v4 + 5);
  sub_100104C40(v5, &v8);
  os_unfair_lock_unlock(v4 + 5);
  LOBYTE(v5) = v8;

  swift_release();
  return (char)v5;
}

- (void)setHasInitialData:(BOOL)a3
{
  os_unfair_lock_s **v4;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  _TtC4Maps20MapsFavoritesManager *v7;
  _BYTE v8[24];

  v4 = (os_unfair_lock_s **)((char *)self + OBJC_IVAR____TtC4Maps20MapsFavoritesManager__hasInitialData);
  swift_beginAccess((char *)self + OBJC_IVAR____TtC4Maps20MapsFavoritesManager__hasInitialData, v8, 33, 0);
  v5 = *v4 + 4;
  v6 = *v4 + 5;
  v7 = self;
  os_unfair_lock_lock(v6);
  sub_100108D2C(v5);
  os_unfair_lock_unlock(v6);
  swift_endAccess(v8);

}

- (NSArray)shortcutsForMapsHome
{
  return (NSArray *)sub_1000F9E38(self, (uint64_t)a2, sub_1000F9E20);
}

- (NSArray)shortcutsForLibrary
{
  return (NSArray *)sub_1000F9E38(self, (uint64_t)a2, sub_1000F9E8C);
}

- (NSArray)shortcutsForCarplay
{
  return (NSArray *)sub_1000F9E38(self, (uint64_t)a2, sub_1000F9FB0);
}

- (BOOL)active
{
  return *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_active);
}

- (void)setActive:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_active) = a3;
}

- (int64_t)mapViewMode
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_mapViewMode);
}

- (void)setMapViewMode:(int64_t)a3
{
  _TtC4Maps20MapsFavoritesManager *v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_mapViewMode) = (Class)a3;
  v3 = self;
  sub_1000FA38C();

}

- (_TtC4Maps20MapsFavoritesManager)init
{
  return (_TtC4Maps20MapsFavoritesManager *)sub_1000FA558();
}

- (void)proposePlacesForTypeWithType:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _TtC4Maps20MapsFavoritesManager *v15;
  uint64_t v16;

  v7 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (_QWORD *)swift_allocObject(&unk_1011A2868, 40, 7);
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1011A2890, 48, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_10149AB20;
  v13[5] = v11;
  v14 = (_QWORD *)swift_allocObject(&unk_1011A28B8, 48, 7);
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_10149AB28;
  v14[5] = v13;
  v15 = self;
  sub_10020D758((uint64_t)v9, (uint64_t)&unk_10149AB30, (uint64_t)v14);
  swift_release();
}

- (id)shortcutForMapItem:(id)a3
{
  id v4;
  _TtC4Maps20MapsFavoritesManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1000FC36C(v4);

  return v6;
}

- (void)getShortcutsCountWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC4Maps20MapsFavoritesManager *v13;
  uint64_t v14;

  v5 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1011A27F0, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1011A2818, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10149AAF8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1011A2840, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10149AB00;
  v12[5] = v11;
  v13 = self;
  sub_10020D758((uint64_t)v7, (uint64_t)&unk_10149AB08, (uint64_t)v12);
  swift_release();
}

- (void)loadAllShortcutsWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC4Maps20MapsFavoritesManager *v13;
  uint64_t v14;

  v5 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1011A2778, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1011A27A0, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10149AAD8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1011A27C8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10149AAE0;
  v12[5] = v11;
  v13 = self;
  sub_10020D758((uint64_t)v7, (uint64_t)&unk_10149AAE8, (uint64_t)v12);
  swift_release();
}

- (void)registerObserver:(id)a3
{
  sub_1000FE58C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000FE450);
}

- (void)unregisterObserver:(id)a3
{
  sub_1000FE58C(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000FE4E0);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  void *var1;
  unsigned int var0;
  _TtC4Maps20MapsFavoritesManager *v5;

  var1 = a3.var1;
  var0 = a3.var0;
  v5 = self;
  sub_100100D48(var0, (uint64_t)var1);

}

- (void)storeDidChangeWithTypes:(id)a3
{
  _TtC4Maps20MapsFavoritesManager *v3;

  v3 = self;
  sub_100107AE8((uint64_t)&unk_1011A2728, (uint64_t)&unk_1011A2750, (uint64_t)&unk_10149AAC0, (uint64_t)&unk_10149AAC8);

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_etaTimer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC4Maps20MapsFavoritesManager____lazy_storage___msgRoutine));

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC4Maps20MapsFavoritesManager_storeSubscriptionTypes));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager__shortcuts));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager__sortedShortcuts));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager__setupButtons));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager__suggestions));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager__hasInitialData));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC4Maps20MapsFavoritesManager__needsSuggestions));
}

- (void)migrateFavoritesIfNeededWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _TtC4Maps20MapsFavoritesManager *v13;
  uint64_t v14;

  v5 = sub_100008B04(&qword_101494070);
  __chkstk_darwin(v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  v9 = swift_allocObject(&unk_1011A2388, 32, 7);
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = self;
  v10 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject(&unk_1011A23B0, 48, 7);
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_10149A9B8;
  v11[5] = v9;
  v12 = (_QWORD *)swift_allocObject(&unk_1011A23D8, 48, 7);
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10149A9C0;
  v12[5] = v11;
  v13 = self;
  sub_10020D758((uint64_t)v7, (uint64_t)&unk_10149F0F0, (uint64_t)v12);
  swift_release();
}

@end
