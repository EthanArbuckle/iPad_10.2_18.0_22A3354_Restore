@implementation PersonalizationConfigurationService

- (void)onConfigurationChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  __n128 v18;
  uint64_t v19;

  v5 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Notification(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 1, 1, v12);
  v13 = qword_1009CE1B8;
  swift_retain_n(self, 2);
  if (v13 != -1)
    swift_once(&qword_1009CE1B8, sub_100007894);
  v14 = qword_1009DD230;
  v15 = sub_100008DB0(&qword_1009DD3C0, (uint64_t (*)(uint64_t))_s5Books18PropertyValueActorV9ActorTypeCMa_0, (uint64_t)&unk_10071D65C);
  v16 = (_QWORD *)swift_allocObject(&unk_1008FF528, 40, 7);
  v16[2] = v14;
  v16[3] = v15;
  v16[4] = self;
  swift_retain(v14);
  v17 = sub_10030C02C((uint64_t)v7, (uint64_t)&unk_1009DD440, (uint64_t)v16);
  swift_release(self);
  v18 = swift_release(v17);
  (*(void (**)(char *, uint64_t, __n128))(v9 + 8))(v11, v8, v18);
}

@end
