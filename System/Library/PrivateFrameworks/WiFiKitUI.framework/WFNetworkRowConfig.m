@implementation WFNetworkRowConfig

- (WFNetworkListRecord)network
{
  WFNetworkRowConfig *v3;
  id v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_219752408();

  swift_release();
  swift_release();
  return (WFNetworkListRecord *)v5;
}

- (void)setNetwork:(id)a3
{
  WFNetworkRowConfig *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_2197427F4(a3);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752414();
}

- (NSString)subtitle
{
  WFNetworkRowConfig *v3;
  void *v4;
  uint64_t v6;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_219752408();

  swift_release();
  swift_release();
  if (!v6)
    return (NSString *)0;
  v4 = (void *)sub_219752984();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (void)setSubtitle:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  WFNetworkRowConfig *v7;

  if (a3)
  {
    v4 = sub_2197529A8();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = self;
  sub_219742D28(v4, v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752414();
}

- (int64_t)connectionState
{
  WFNetworkRowConfig *v3;
  int64_t v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_219752408();

  swift_release();
  swift_release();
  return v5;
}

- (void)setConnectionState:(int64_t)a3
{
  WFNetworkRowConfig *v4;

  v4 = self;
  sub_2197432BC(a3);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752414();
}

- (BOOL)problematicConnection
{
  WFNetworkRowConfig *v3;
  BOOL v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_219752408();

  swift_release();
  swift_release();
  return v5;
}

- (void)setProblematicConnection:(BOOL)a3
{
  WFNetworkRowConfig *v4;

  v4 = self;
  sub_219743768(a3);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752414();
}

- (unint64_t)signalBars
{
  WFNetworkRowConfig *v3;
  unint64_t v5;

  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  sub_219752408();

  swift_release();
  swift_release();
  return v5;
}

- (void)setSignalBars:(unint64_t)a3
{
  WFNetworkRowConfig *v4;

  v4 = self;
  sub_219743C14(a3);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_219752414();
}

- (unint64_t)context
{
  unint64_t *v2;

  v2 = (unint64_t *)((char *)self + OBJC_IVAR___WFNetworkRowConfig_context);
  swift_beginAccess();
  return *v2;
}

- (void)setContext:(unint64_t)a3
{
  unint64_t *v4;

  v4 = (unint64_t *)((char *)self + OBJC_IVAR___WFNetworkRowConfig_context);
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)hideConnectionState
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___WFNetworkRowConfig_hideConnectionState;
  swift_beginAccess();
  return *v2;
}

- (void)setHideConnectionState:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___WFNetworkRowConfig_hideConnectionState;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)showInfoButton
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___WFNetworkRowConfig_showInfoButton;
  swift_beginAccess();
  return *v2;
}

- (void)setShowInfoButton:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___WFNetworkRowConfig_showInfoButton;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isEditable
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR___WFNetworkRowConfig_isEditable;
  swift_beginAccess();
  return *v2;
}

- (void)setIsEditable:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR___WFNetworkRowConfig_isEditable;
  swift_beginAccess();
  *v4 = a3;
}

- (id)infoButtonHandler
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD aBlock[6];

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler);
  swift_beginAccess();
  if (!*v2)
    return 0;
  v3 = v2[1];
  aBlock[4] = *v2;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2197315E4;
  aBlock[3] = &block_descriptor_2;
  v4 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v4;
}

- (void)setInfoButtonHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v4;
    v4 = sub_219744F1C;
  }
  else
  {
    v5 = 0;
  }
  v6 = (uint64_t *)((char *)self + OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler);
  swift_beginAccess();
  v7 = *v6;
  *v6 = (uint64_t)v4;
  v6[1] = v5;
  sub_219731D9C(v7);
}

+ (id)settingsNetworkRowConfig
{
  swift_getObjCClassMetadata();
  return static WFNetworkRowConfigModel.settingsNetworkRowConfig()();
}

+ (id)knownNetworkRowConfig
{
  swift_getObjCClassMetadata();
  return static WFNetworkRowConfigModel.knownNetworkRowConfig()();
}

+ (id)setupNetworkRowConfig
{
  swift_getObjCClassMetadata();
  return static WFNetworkRowConfigModel.setupNetworkRowConfig()();
}

- (WFNetworkRowConfig)init
{
  return (WFNetworkRowConfig *)WFNetworkRowConfigModel.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v3 = (char *)self + OBJC_IVAR___WFNetworkRowConfig__network;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255096500);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR___WFNetworkRowConfig__subtitle;
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2550967B0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR___WFNetworkRowConfig__connectionState;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550967A8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR___WFNetworkRowConfig__problematicConnection;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550964E0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  v11 = (char *)self + OBJC_IVAR___WFNetworkRowConfig__signalBars;
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255096798);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  sub_219731D9C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___WFNetworkRowConfig_infoButtonHandler));
}

@end
