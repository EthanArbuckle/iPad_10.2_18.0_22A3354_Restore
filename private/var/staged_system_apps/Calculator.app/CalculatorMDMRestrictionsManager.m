@implementation CalculatorMDMRestrictionsManager

- (_TtC10Calculator32CalculatorMDMRestrictionsManager)init
{
  return (_TtC10Calculator32CalculatorMDMRestrictionsManager *)sub_100046974();
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC10Calculator32CalculatorMDMRestrictionsManager *v5;
  id v6;
  void *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v4 = (void *)objc_opt_self(MCProfileConnection);
  v5 = self;
  v6 = objc_msgSend(v4, "sharedConnection");
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "unregisterObserver:", v5);

    v8.receiver = v5;
    v8.super_class = ObjectType;
    -[CalculatorMDMRestrictionsManager dealloc](&v8, "dealloc");
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease(*(_QWORD *)&self->_isCalculatorModeScientificAllowed[OBJC_IVAR____TtC10Calculator32CalculatorMDMRestrictionsManager_appDomainID]);
  v3 = (char *)self + OBJC_IVAR____TtC10Calculator32CalculatorMDMRestrictionsManager___observationRegistrar;
  v4 = type metadata accessor for ObservationRegistrar(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC10Calculator32CalculatorMDMRestrictionsManager *v8;

  if (a4)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  v7 = a3;
  v8 = self;
  sub_10004718C(a3);

  swift_bridgeObjectRelease(v6);
}

@end
