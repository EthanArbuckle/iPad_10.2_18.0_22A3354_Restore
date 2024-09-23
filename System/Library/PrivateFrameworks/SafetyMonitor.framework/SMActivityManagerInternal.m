@implementation SMActivityManagerInternal

+ (SMActivityManagerInternal)shared
{
  if (qword_254415870 != -1)
    swift_once();
  return (SMActivityManagerInternal *)(id)static SMActivityManager.shared;
}

- (SMActivityManagerInternal)init
{
  _QWORD *v2;
  SMActivityManagerInternal *v3;
  SMActivityManagerInternal *v4;
  uint64_t v5;
  uint64_t *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR___SMActivityManagerInternal_activities) = (Class)MEMORY[0x24BEE4AF8];
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___SMActivityManagerInternal_silentAudioFileName);
  *v2 = 0xD000000000000010;
  v2[1] = 0x8000000245595740;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SMActivityManager();
  v3 = -[SMActivityManagerInternal init](&v8, sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254415840);
  v4 = v3;
  v5 = sub_24558F524();
  v6 = (uint64_t *)((char *)v4 + OBJC_IVAR___SMActivityManagerInternal_activities);
  swift_beginAccess();
  *v6 = v5;

  swift_bridgeObjectRelease();
  return v4;
}

- (void)startActivityWith:(id)a3 localState:(id)a4
{
  id v6;
  id v7;
  SMActivityManagerInternal *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  _s13SafetyMonitor17SMActivityManagerC13startActivity4with10localStateySo09SMSessiondI0CSg_So014SMLocalSessionI0CSgtF_0();

}

- (void)updateActivityWith:(id)a3 localState:(id)a4 shouldNotify:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  SMActivityManagerInternal *v10;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_245525C64(v8, v5);

}

- (void)endActivities
{
  SMActivityManagerInternal *v2;

  v2 = self;
  SMActivityManager.endActivities()();

}

- (BOOL)hasActivity
{
  SMActivityManagerInternal *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254415840);
  v3 = self;
  v4 = sub_24558F524();
  v5 = (uint64_t *)((char *)v3 + OBJC_IVAR___SMActivityManagerInternal_activities);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
  if ((unint64_t)*v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v6 = sub_24558F98C();

    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = *(_QWORD *)((*v5 & 0xFFFFFFFFFFFFF8) + 0x10);

  }
  return v6 != 0;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
