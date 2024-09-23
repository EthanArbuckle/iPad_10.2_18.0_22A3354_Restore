@implementation GetContactQuickActionButtonsViewModel

- (void)dealloc
{
  _TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel *v2;

  v2 = self;
  sub_2461E0604();
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(char *, uint64_t);

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_73_0(OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_contact);
  OUTLINED_FUNCTION_73_0(OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_dataSource);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_dialRequestPerformer);
  v3 = OUTLINED_FUNCTION_93();
  OUTLINED_FUNCTION_16_3(v3);
  v4 = OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_16_3(v4);
  OUTLINED_FUNCTION_73_0(OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel_lock);
  swift_release();
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257559870);
  OUTLINED_FUNCTION_16_3(v5);
  v6 = (char *)self + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel__groupedAudioActions;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257559868);
  OUTLINED_FUNCTION_103((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14, v22, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8));
  OUTLINED_FUNCTION_103((uint64_t)self + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel__groupedMessageActions, v15, v16, v17, v18, v19, v20, v21, v23, v24);
  v25((char *)self + OBJC_IVAR____TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel__groupedVideoActions, v7);
}

- (_TtC14SiriContactsUI37GetContactQuickActionButtonsViewModel)init
{
  sub_2461E1748();
}

@end
