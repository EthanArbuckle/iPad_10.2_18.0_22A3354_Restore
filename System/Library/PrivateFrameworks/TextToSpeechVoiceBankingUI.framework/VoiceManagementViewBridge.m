@implementation VoiceManagementViewBridge

+ (id)makeVoiceManagementViewControllerWithVoiceID:(id)a3 voiceName:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;

  v4 = type metadata accessor for VoiceManagementView();
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (uint64_t *)((char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = sub_2488BB6B0();
  v9 = *(_QWORD *)(v8 - 8);
  v11 = MEMORY[0x24BDAC7A8](v8, v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v14);
  v16 = (char *)&v21 - v15;
  sub_2488BB698();
  sub_2488BD7A4();
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v16, v8);
  VoiceManagementView.init(voiceID:)((uint64_t)v13, v7);
  v17 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2577959F8));
  v18 = (id)sub_2488BCC1C();
  v19 = (void *)sub_2488BD774();
  objc_msgSend(v18, sel_setTitle_, v19);
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v9 + 8))(v16, v8);
  return v18;
}

- (VoiceManagementViewBridge)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VoiceManagementViewBridge();
  return -[VoiceManagementViewBridge init](&v3, sel_init);
}

@end
