@implementation CRLDeviceManagementRestrictionsManager

+ (NSString)deviceManagementRestrictionsChangedNotificationName
{
  return (NSString *)sub_100046FC4((uint64_t)a1, (uint64_t)a2, &qword_100083110, (id *)&static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName, (uint64_t)sub_100046AC4);
}

- (BOOL)isMathPaperSolvingAllowed
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self
     + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed;
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed, v4, 0, 0);
  return *v2;
}

- (void)setIsMathPaperSolvingAllowed:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self
     + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed;
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed, v5, 1, 0);
  *v4 = a3;
}

- (BOOL)isKeyboardMathSolvingAllowed
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self
     + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed;
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed, v4, 0, 0);
  return *v2;
}

- (void)setIsKeyboardMathSolvingAllowed:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self
     + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed;
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed, v5, 1, 0);
  *v4 = a3;
}

- (BOOL)isDefinitionLookupAllowed
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self
     + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed;
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed, v4, 0, 0);
  return *v2;
}

- (void)setIsDefinitionLookupAllowed:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self
     + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed;
  swift_beginAccess((char *)self+ OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed, v5, 1, 0);
  *v4 = a3;
}

- (void)dealloc
{
  _TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager *v2;
  id v3;
  void *v4;
  objc_super v5;

  v2 = self;
  v3 = sub_100046DE0();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, "unregisterObserver:", v2);

  }
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for CRLDeviceManagementRestrictionsManager();
  -[CRLDeviceManagementRestrictionsManager dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  sub_100047588(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager____lazy_storage___connection));
}

+ (_TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager)sharedManager
{
  return (_TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager *)sub_100046FC4((uint64_t)a1, (uint64_t)a2, &qword_100083118, (id *)&qword_1000853A0, (uint64_t)sub_100046F4C);
}

- (void)registerObserver
{
  _TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager *v2;

  v2 = self;
  CRLDeviceManagementRestrictionsManager.registerObserver()();

}

- (_TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed) = 1;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed) = 1;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed) = 1;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager____lazy_storage___connection) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLDeviceManagementRestrictionsManager();
  return -[CRLDeviceManagementRestrictionsManager init](&v3, "init");
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC20USDRendererExtension38CRLDeviceManagementRestrictionsManager *v8;

  if (a4)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  v7 = a3;
  v8 = self;
  _s20USDRendererExtension38CRLDeviceManagementRestrictionsManagerC63profileConnectionDidReceiveEffectiveSettingsChangedNotification_8userInfoySo09MCProfileH0CSg_SDys11AnyHashableVypGSgtF_0(a3);

  swift_bridgeObjectRelease(v6);
}

@end
