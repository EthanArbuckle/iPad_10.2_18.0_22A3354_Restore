@implementation ExpressMode

+ (id)checkCompatibilityWithPassInformation:(id)a3 useLegacyBehavior:(BOOL)a4 error:(id *)a5
{
  id v6;
  void *v7;

  v6 = a3;
  sub_1C35A7C58(v6, a4);

  sub_1C3575208(0, (unint64_t *)&qword_1EF8D95A0);
  v7 = (void *)sub_1C35B6CD8();
  swift_bridgeObjectRelease();
  return v7;
}

+ (id)checkCompatibilityWithPassInformation:(id)a3 error:(id *)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v4 = qword_1ED7E1268;
  v5 = a3;
  if (v4 != -1)
    swift_once();
  sub_1C3588538(v5, 1);
  v7 = v6;
  swift_bridgeObjectRelease();
  sub_1C358663C(v7);

  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED7E1280);
  v8 = (void *)sub_1C35B6CD8();
  swift_bridgeObjectRelease();
  return v8;
}

+ (BOOL)getFastPathWithPassInformation:(id)a3 fastPathOut:(BOOL *)a4 useLegacyBehavior:(BOOL)a5 error:(id *)a6
{
  id v8;

  v8 = a3;
  sub_1C35A7EE0(v8, (uint64_t)a4, a5);

  return 1;
}

+ (BOOL)applyConfiguration:(id)a3 toSecureElement:(id)a4 inSessionWithAID:(id)a5 hasActivatedApplets:(BOOL *)a6 skipActivations:(BOOL)a7 useLegacyBehavior:(BOOL)a8 error:(id *)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  id v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  BOOL result;
  void *v27;

  v9 = a8;
  if (a5)
  {
    v14 = a3;
    v15 = a4;
    v16 = a5;
    v17 = sub_1C35B6A5C();
    v19 = v18;

  }
  else
  {
    v20 = a3;
    v21 = a4;
    v17 = 0;
    v19 = 0xF000000000000000;
  }
  if (qword_1ED7E1268 != -1)
    swift_once();
  v22 = sub_1C3588538(a3, v9);
  sub_1C358CC0C(v22, v23, (uint64_t)a4, v17, v19, (uint64_t)a6, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v19 >> 60 != 15)
  {

LABEL_14:
    sub_1C3574174(v17, v19);
    return 1;
  }
  processAuxiliaryElements(secureElement:passInformation:)((TransceiverWrapper *)a4, (NSArray)a3);

  if (!v27)
    goto LABEL_14;
  sub_1C3574174(v17, v19);
  if (a9)
  {
    v24 = (void *)sub_1C35B69B4();

    v25 = v24;
    result = 0;
    *a9 = v24;
  }
  else
  {

    return 0;
  }
  return result;
}

- (_TtC24AppletTranslationLibrary11ExpressMode)init
{
  return (_TtC24AppletTranslationLibrary11ExpressMode *)sub_1C35960F4();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC24AppletTranslationLibrary11ExpressMode_logger;
  v4 = sub_1C35B6AE0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
