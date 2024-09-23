@implementation CRLDeviceManagementRestrictionsManager

+ (NSString)deviceManagementRestrictionsChangedNotificationName
{
  return (NSString *)sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD610, (id *)&static CRLDeviceManagementRestrictionsManager.deviceManagementRestrictionsChangedNotificationName, (uint64_t)sub_1009A3FC8);
}

- (BOOL)isMathPaperSolvingAllowed
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed, v4, 0, 0);
  return *v2;
}

- (void)setIsMathPaperSolvingAllowed:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed, v5, 1, 0);
  *v4 = a3;
}

- (BOOL)isKeyboardMathSolvingAllowed
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed, v4, 0, 0);
  return *v2;
}

- (void)setIsKeyboardMathSolvingAllowed:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed, v5, 1, 0);
  *v4 = a3;
}

- (BOOL)isDefinitionLookupAllowed
{
  BOOL *v2;
  _BYTE v4[24];

  v2 = (BOOL *)self + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed, v4, 0, 0);
  return *v2;
}

- (void)setIsDefinitionLookupAllowed:(BOOL)a3
{
  BOOL *v4;
  _BYTE v5[24];

  v4 = (BOOL *)self + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed, v5, 1, 0);
  *v4 = a3;
}

- (void)dealloc
{
  _TtC8Freeform38CRLDeviceManagementRestrictionsManager *v2;
  id v3;
  void *v4;
  objc_super v5;

  v2 = self;
  v3 = sub_1009A42A4();
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
  sub_1004CB49C(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager____lazy_storage___connection));
}

+ (_TtC8Freeform38CRLDeviceManagementRestrictionsManager)sharedManager
{
  return (_TtC8Freeform38CRLDeviceManagementRestrictionsManager *)sub_10064879C((uint64_t)a1, (uint64_t)a2, &qword_1013DD618, (id *)&qword_1013FF120, (uint64_t)sub_1009A4410);
}

- (void)registerObserver
{
  _TtC8Freeform38CRLDeviceManagementRestrictionsManager *v2;

  v2 = self;
  CRLDeviceManagementRestrictionsManager.registerObserver()();

}

- (_TtC8Freeform38CRLDeviceManagementRestrictionsManager)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isMathPaperSolvingAllowed) = 1;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isKeyboardMathSolvingAllowed) = 1;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager_isDefinitionLookupAllowed) = 1;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC8Freeform38CRLDeviceManagementRestrictionsManager____lazy_storage___connection) = (Class)1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLDeviceManagementRestrictionsManager();
  return -[CRLDeviceManagementRestrictionsManager init](&v3, "init");
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  id v6;
  _TtC8Freeform38CRLDeviceManagementRestrictionsManager *v7;

  if (a4)
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v6 = a3;
  v7 = self;
  _s8Freeform38CRLDeviceManagementRestrictionsManagerC63profileConnectionDidReceiveEffectiveSettingsChangedNotification_8userInfoySo09MCProfileG0CSg_SDys11AnyHashableVypGSgtF_0(a3);

  swift_bridgeObjectRelease();
}

@end
