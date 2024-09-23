@implementation Preferences.KVOProxy

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _TtCV16UniversalControl11PreferencesP33_E97794F8E31B248CD291BA178D3BF85D8KVOProxy *v14;
  void *v15;
  id v16;
  _TtCV16UniversalControl11PreferencesP33_E97794F8E31B248CD291BA178D3BF85D8KVOProxy *v17;
  _OWORD v18[2];

  if (a3)
  {
    v10 = _sSo18UVCClientAssertiona16UniversalControlE11descriptionSSvg_0();
    v12 = v11;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v18, 0, sizeof(v18));
    v16 = a5;
    v17 = self;
    if (a5)
      goto LABEL_4;
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v10 = 0;
  v12 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v13 = a5;
  v14 = self;
  sub_2498370E4();
  swift_unknownObjectRelease();
  if (!a5)
    goto LABEL_7;
LABEL_4:
  type metadata accessor for NSKeyValueChangeKey(0);
  sub_2497E6F50();
  v15 = (void *)sub_249836C94();

LABEL_8:
  sub_2497E6B5C(v10, v12, (uint64_t)v18, v15, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_24978917C((uint64_t)v18);
}

- (_TtCV16UniversalControl11PreferencesP33_E97794F8E31B248CD291BA178D3BF85D8KVOProxy)init
{
  sub_2497E6E9C();
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV16UniversalControl11PreferencesP33_E97794F8E31B248CD291BA178D3BF85D8KVOProxy_userDefaults));
}

@end
