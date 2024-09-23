@implementation MetroStateMonitor

+ (_TtC24AppletTranslationLibrary17MetroStateMonitor)shared
{
  if (qword_1EF8D99B0 != -1)
    swift_once();
  return (_TtC24AppletTranslationLibrary17MetroStateMonitor *)(id)qword_1EF8DB8B8;
}

- (BOOL)inMetro
{
  uint64_t v2;
  _TtC24AppletTranslationLibrary17MetroStateMonitor *v3;
  BOOL v4;
  BOOL v6;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC24AppletTranslationLibrary17MetroStateMonitor_state);
  v3 = self;
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  sub_1C35772B4((_BYTE *)(v2 + 16), &v6);
  os_unfair_lock_unlock((os_unfair_lock_t)(v2 + 20));
  v4 = v6;

  swift_release();
  return v4;
}

- (void)consumeStateWithAid:(id)a3 newState:(BOOL)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  _TtC24AppletTranslationLibrary17MetroStateMonitor *v9;

  v6 = sub_1C35B6C60();
  v8 = v7;
  v9 = self;
  sub_1C35772C0(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (_TtC24AppletTranslationLibrary17MetroStateMonitor)init
{
  uint64_t v3;
  uint64_t v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtC24AppletTranslationLibrary17MetroStateMonitor_state;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF8D9B28);
  v4 = swift_allocObject();
  *(_DWORD *)(v4 + 20) = 0;
  *(_BYTE *)(v4 + 16) = 0;
  *(Class *)((char *)&self->super.isa + v3) = (Class)v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for MetroStateMonitor();
  return -[MetroStateMonitor init](&v6, sel_init);
}

- (void).cxx_destruct
{
  swift_release();
}

@end
