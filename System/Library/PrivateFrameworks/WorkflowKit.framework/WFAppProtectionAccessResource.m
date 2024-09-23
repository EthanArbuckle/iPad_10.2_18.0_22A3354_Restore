@implementation WFAppProtectionAccessResource

- (WFAppProtectionAccessResource)initWithAssociatedAppBundleIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1C1B0F224();
  return (WFAppProtectionAccessResource *)sub_1C176F420(v3, v4);
}

- (void)appProtectionSubjectsChanged:(id)a3 forSubscription:(id)a4
{
  unint64_t v5;
  WFAppProtectionAccessResource *v6;

  sub_1C1B0F7F4();
  v5 = sub_1C1B0F380();
  swift_unknownObjectRetain();
  v6 = self;
  sub_1C176F8B8(v5);
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)applicationContext:(id)a3 applicationStateDidChange:(int64_t)a4
{
  id v5;
  WFAppProtectionAccessResource *v6;

  v5 = a3;
  v6 = self;
  sub_1C176FAB8();

}

+ (BOOL)isSystemResource
{
  return 1;
}

- (NSString)associatedAppIdentifier
{
  uint64_t v2;
  void *v3;

  sub_1C176FF24();
  if (v2)
  {
    v3 = (void *)sub_1C1B0F1F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (unint64_t)status
{
  WFAppProtectionAccessResource *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = self;
  sub_1C176FF8C();
  v4 = v3;

  return v4;
}

- (id)localizedErrorReasonForStatus:(unint64_t)a3
{
  WFAppProtectionAccessResource *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = self;
  sub_1C176FFDC(a3);
  v6 = v5;

  if (v6)
  {
    v7 = (void *)sub_1C1B0F1F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)localizedErrorRecoveryOptionsForStatus:(unint64_t)a3
{
  WFAppProtectionAccessResource *v4;
  uint64_t v5;
  void *v6;

  v4 = self;
  v5 = sub_1C17703CC(a3);

  if (v5)
  {
    v6 = (void *)sub_1C1B0F374();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)makeAvailableWithUserInterface:(WFUserInterfaceHost *)a3 completionHandler:(id)a4
{
  void *v6;
  _QWORD *v7;
  WFAppProtectionAccessResource *v8;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1C18B1138((uint64_t)&unk_1EF6FF2F0, (uint64_t)v7);
}

- (void)dealloc
{
  WFAppProtectionAccessResource *v2;

  v2 = self;
  sub_1C1770814();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (WFAppProtectionAccessResource)initWithDefinition:(id)a3 enableDistributedNotifications:(BOOL)a4
{
  if (a3)
    sub_1C1B0F164();
  sub_1C1770B94();
}

- (WFAppProtectionAccessResource)initWithDefinition:(id)a3
{
  if (a3)
    sub_1C1B0F164();
  sub_1C1770BF8();
}

- (WFAppProtectionAccessResource)init
{
  sub_1C1770C58();
}

@end
