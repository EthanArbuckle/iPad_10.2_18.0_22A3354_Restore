@implementation TPSSavedTipsManager

- (id)savedDateWithCorrelationId:(id)a3
{
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  TPSSavedTipsManager *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _BYTE v13[16];
  TPSSavedTipsManager *v14;
  uint64_t v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  MEMORY[0x1E0C80A78]();
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_19A990D58();
  v14 = self;
  v15 = v6;
  v16 = v7;
  v8 = self;
  sub_19A990FC8();

  swift_bridgeObjectRelease();
  v9 = sub_19A990ADC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = 0;
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48))(v5, 1, v9) != 1)
  {
    v11 = (void *)sub_19A990AA0();
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v5, v9);
  }
  return v11;
}

+ (TPSSavedTipsManager)sharedInstance
{
  if (qword_1ED03D398 != -1)
    swift_once();
  return (TPSSavedTipsManager *)(id)qword_1ED03D388;
}

- (TPSTip)currentTip
{
  TPSSavedTipsManager *v3;
  id *v4;
  TPSTip *v5;

  swift_getKeyPath();
  sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  v3 = self;
  sub_19A990B3C();
  swift_release();
  v4 = (id *)((char *)&v3->super.isa + OBJC_IVAR___TPSSavedTipsManager__currentTip);
  swift_beginAccess();
  v5 = (TPSTip *)*v4;

  return v5;
}

- (void)setCurrentTip:(id)a3
{
  id v5;
  TPSSavedTipsManager *v6;

  swift_getKeyPath();
  sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  v5 = a3;
  v6 = self;
  sub_19A990B30();

  swift_release();
}

- (BOOL)isCurrentTipSaved
{
  TPSSavedTipsManager *v3;
  _BYTE *v4;

  swift_getKeyPath();
  sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  v3 = self;
  sub_19A990B3C();
  swift_release();
  v4 = (char *)v3 + OBJC_IVAR___TPSSavedTipsManager__isCurrentTipSaved;
  swift_beginAccess();
  LOBYTE(v4) = *v4;

  return (char)v4;
}

- (void)setIsCurrentTipSaved:(BOOL)a3
{
  TPSSavedTipsManager *v4;

  swift_getKeyPath();
  sub_19A90A994(&qword_1EE3B6880, (uint64_t (*)(uint64_t))type metadata accessor for TPSSavedTipsManager, (uint64_t)&protocol conformance descriptor for TPSSavedTipsManager);
  v4 = self;
  sub_19A990B30();

  swift_release();
}

- (TPSSavedTipsManager)init
{
  return (TPSSavedTipsManager *)TPSSavedTipsManager.init()();
}

- (BOOL)isSavedWithTipIdentifier:(id)a3
{
  uint64_t v4;
  TPSSavedTipsManager *v5;
  BOOL v7;

  if (a3)
    v4 = sub_19A990D58();
  else
    v4 = 0;
  MEMORY[0x1E0C80A78](v4);
  v5 = self;
  sub_19A990FC8();

  swift_bridgeObjectRelease();
  return v7;
}

- (void)toggleSavedTipWithCorrelationId:(id)a3 tipIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  TPSSavedTipsManager *v11;

  v5 = sub_19A990D58();
  v7 = v6;
  v8 = sub_19A990D58();
  v10 = v9;
  v11 = self;
  sub_19A96C820(v5, v7, v8, v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)updateSavedTipsWithCorrelationId:(id)a3 tipIdentifier:(id)a4 savedDate:(id)a5 lastUsedVersion:(id)a6
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  TPSSavedTipsManager *v22;
  uint64_t v23;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED03D380);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_19A990D58();
  v13 = v12;
  v14 = sub_19A990D58();
  v16 = v15;
  if (a5)
  {
    sub_19A990AB8();
    v17 = sub_19A990ADC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v10, 0, 1, v17);
  }
  else
  {
    v18 = sub_19A990ADC();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v10, 1, 1, v18);
  }
  v19 = sub_19A990D58();
  v21 = v20;
  v22 = self;
  sub_19A96CD98(v11, v13, v14, v16, (uint64_t)v10, v19, v21);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_19A960074((uint64_t)v10);
}

- (id)identifiers
{
  TPSSavedTipsManager *v2;
  void *v3;

  v2 = self;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED03D140);
  sub_19A990FC8();

  v3 = (void *)sub_19A990E30();
  swift_bridgeObjectRelease();
  return v3;
}

- (void)removeInvalidEntries
{
  TPSSavedTipsManager *v2;

  v2 = self;
  sub_19A96DAFC();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR___TPSSavedTipsManager___observationRegistrar;
  v4 = sub_19A990B6C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
