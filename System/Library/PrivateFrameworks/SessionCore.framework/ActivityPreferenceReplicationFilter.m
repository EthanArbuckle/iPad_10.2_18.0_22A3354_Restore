@implementation ActivityPreferenceReplicationFilter

- (_TtC11SessionCore35ActivityPreferenceReplicationFilter)init
{
  return (_TtC11SessionCore35ActivityPreferenceReplicationFilter *)sub_1C1381788();
}

- (void).cxx_destruct
{
  sub_1C1382580(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtC11SessionCore35ActivityPreferenceReplicationFilter_filterDidUpdate));
  swift_release();
  sub_1C132C860((uint64_t)self + OBJC_IVAR____TtC11SessionCore35ActivityPreferenceReplicationFilter_lockedAppSettings, (uint64_t *)&unk_1ED797BB0);
}

- (void)settingsModel:(void *)a3 didAddSettings:
{
  void (*v3)(uint64_t);
  id v5;
  uint64_t v6;
  char *v7;

  v3 = *(void (**)(uint64_t))&a1[OBJC_IVAR____TtC11SessionCore35ActivityPreferenceReplicationFilter_filterDidUpdate];
  if (v3)
  {
    v5 = a3;
    v7 = a1;
    v6 = sub_1C1382688((uint64_t)v3);
    v3(v6);
    sub_1C1382580((uint64_t)v3);

  }
}

- (void)settingsModel:(id)a3 didChangeGlobalSettings:(id)a4
{
  void (*v4)(uint64_t);
  id v6;
  uint64_t v7;
  _TtC11SessionCore35ActivityPreferenceReplicationFilter *v8;

  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC11SessionCore35ActivityPreferenceReplicationFilter_filterDidUpdate);
  if (v4)
  {
    v6 = a3;
    swift_unknownObjectRetain();
    v8 = self;
    v7 = sub_1C1382688((uint64_t)v4);
    v4(v7);
    sub_1C1382580((uint64_t)v4);

    swift_unknownObjectRelease();
  }
}

@end
