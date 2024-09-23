@implementation SRSmartRepliesManager

+ (_TtC12SmartReplies21SRSmartRepliesManager)shared
{
  if (one-time initialization token for shared != -1)
    swift_once();
  return (_TtC12SmartReplies21SRSmartRepliesManager *)(id)static SRSmartRepliesManager.shared;
}

- (id)suggestionsFor:(id)a3
{
  _QWORD *v4;
  _TtC12SmartReplies21SRSmartRepliesManager *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = SRSmartRepliesManager.suggestions(for:)(v4);

  return v6;
}

- (void)suggestionsFor:(id)a3 completion:(id)a4
{
  void *v6;
  _TtC12SmartReplies21SRSmartRepliesManager *v7;
  _QWORD *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v8 = a3;
  v7 = self;
  specialized SRSmartRepliesManager.suggestions(for:completion:)(v8, v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)registerResponseFor:(id)a3 message:(id)a4 time:(id)a5 metadata:(id)a6 language:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _TtC12SmartReplies21SRSmartRepliesManager *v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  _TtC12SmartReplies21SRSmartRepliesManager *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for Date?);
  v42 = *(_QWORD *)(v16 - 8);
  v17 = *(_QWORD *)(v42 + 64);
  v18 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v38 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v45 = (uint64_t)&v38 - v20;
  if (a3)
  {
    v41 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v44 = v21;
    if (a4)
      goto LABEL_3;
LABEL_6:
    v40 = 0;
    v43 = 0;
    if (a5)
      goto LABEL_4;
    goto LABEL_7;
  }
  v41 = 0;
  v44 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  v40 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v43 = v22;
  if (a5)
  {
LABEL_4:
    v23 = v45;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    v24 = type metadata accessor for Date();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v23, 0, 1, v24);
    goto LABEL_8;
  }
LABEL_7:
  v25 = type metadata accessor for Date();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v45, 1, 1, v25);
LABEL_8:
  if (a6)
    v39 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v39 = 0;
  v26 = a7;
  v27 = self;
  if (a7)
  {
    v38 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a7 = v28;

  }
  else
  {
    v38 = 0;
  }
  v29 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v15, 1, 1, v29);
  outlined init with copy of Date?(v45, (uint64_t)v19);
  v30 = (*(unsigned __int8 *)(v42 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80);
  v31 = (v17 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
  v32 = (_QWORD *)swift_allocObject();
  v32[2] = 0;
  v32[3] = 0;
  v33 = v41;
  v32[4] = v27;
  v32[5] = v33;
  v34 = v40;
  v32[6] = v44;
  v32[7] = v34;
  v32[8] = v43;
  outlined init with take of RepliesToRobotsParameters?((uint64_t)v19, (uint64_t)v32 + v30, (uint64_t *)&demangling cache variable for type metadata for Date?);
  v35 = v38;
  *(_QWORD *)((char *)v32 + v31) = v39;
  v36 = (_QWORD *)((char *)v32 + ((v31 + 15) & 0xFFFFFFFFFFFFFFF8));
  *v36 = v35;
  v36[1] = (uint64_t)a7;
  swift_bridgeObjectRetain();
  v37 = v27;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v15, (uint64_t)&closure #1 in SRSmartRepliesManager.registerResponse(for:message:time:metadata:language:)partial apply, (uint64_t)v32);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  outlined destroy of Any?(v45, (uint64_t *)&demangling cache variable for type metadata for Date?);
}

- (void)registerResponseDisplayedAtIndex:(id)a3 displaySetting:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  id v15;
  _TtC12SmartReplies21SRSmartRepliesManager *v16;
  id v17;
  id v18;
  uint64_t v19;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v12 = v11;
  }
  else
  {
    v10 = 0;
    v12 = 0;
  }
  v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = v10;
  v14[7] = v12;
  v15 = a3;
  v16 = self;
  v17 = v15;
  v18 = a4;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v9, (uint64_t)&closure #1 in SRSmartRepliesManager.registerResponseDisplayed(atIndex:displaySetting:)partial apply, (uint64_t)v14);
  swift_release();

}

- (_TtC12SmartReplies21SRSmartRepliesManager)init
{
  return (_TtC12SmartReplies21SRSmartRepliesManager *)SRSmartRepliesManager.init()();
}

- (void).cxx_destruct
{
  swift_release();
  outlined consume of BiomeLoggingManager?(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesManager____lazy_storage___biomeManager));
  outlined consume of ModelResponseManager?(*(uint64_t *)((char *)&self->super.isa
                                                       + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesManager____lazy_storage___modelResponseManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12SmartReplies21SRSmartRepliesManager____lazy_storage___rkManager));
  swift_release();
}

@end
