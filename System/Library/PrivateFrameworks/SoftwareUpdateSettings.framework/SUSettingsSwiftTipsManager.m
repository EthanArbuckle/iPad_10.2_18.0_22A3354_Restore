@implementation SUSettingsSwiftTipsManager

+ (SUSettingsSwiftTipsManager)sharedManager
{
  if (qword_255C3B0E0 != -1)
    swift_once();
  return (SUSettingsSwiftTipsManager *)(id)static SUSettingsSwiftTipsManager.shared;
}

- (BOOL)shouldShowUserDefaultsBasedComingSoonTip
{
  char v2;

  _s22SoftwareUpdateSettings26SUSettingsSwiftTipsManagerC40shouldShowUserDefaultsBasedComingSoonTipSbvg_0();
  return v2 & 1;
}

- (void)setup
{
  void (*v2)(_QWORD);
  SUSettingsSwiftTipsManager *v3;

  v2 = *(void (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xB8);
  v3 = self;
  v2(0);

}

- (void)setupForManualControl:(BOOL)a3
{
  SUSettingsSwiftTipsManager *v4;

  v4 = self;
  SUSettingsSwiftTipsManager.setup(forManualControl:)(a3);

}

- (void)configureManualComingSoonTipWithTitle:(id)a3 andContent:(id)a4 learnMoreLink:(id)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  SUSettingsSwiftTipsManager *v15;
  Swift::String v16;
  Swift::String_optional v17;
  Swift::String_optional v18;

  v8 = sub_22CBCA65C();
  v10 = v9;
  if (!a4)
  {
    v11 = 0;
    if (a5)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v11 = sub_22CBCA65C();
  a4 = v12;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v13 = sub_22CBCA65C();
  a5 = v14;
LABEL_6:
  v15 = self;
  v16._countAndFlagsBits = v8;
  v16._object = v10;
  v17.value._countAndFlagsBits = v11;
  v17.value._object = a4;
  v18.value._countAndFlagsBits = v13;
  v18.value._object = a5;
  SUSettingsSwiftTipsManager.configureManualComingSoonTip(withTitle:andContent:learnMoreLink:)(v16, v17, v18);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (SUSettingsSwiftTipsManager)init
{
  SUSettingsSwiftTipsManager *v2;
  uint64_t v3;
  _OWORD *v4;
  __int128 v5;
  objc_super v7;
  _OWORD v8[3];

  v2 = self;
  v3 = nullsub_6();
  nullsub_1(v3);
  v4 = (_OWORD *)((char *)v2 + OBJC_IVAR___SUSettingsSwiftTipsManager_mockedComingSoonTip);
  sub_22CBC7490((uint64_t)v8);
  v5 = v8[1];
  *v4 = v8[0];
  v4[1] = v5;
  v4[2] = v8[2];
  *((_BYTE *)&v2->super.isa + OBJC_IVAR___SUSettingsSwiftTipsManager_inManualControl) = 0;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for SUSettingsSwiftTipsManager();
  return -[SUSettingsSwiftTipsManager init](&v7, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
