@implementation FitnessSettingsProvider

- (void)wheelchairUseCharacteristicCache:(id)a3 wheelchairUsageDidChange:(BOOL)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t ObjectType;
  id v12;
  __n128 v13;
  unint64_t v14;
  uint64_t v15;

  v6 = type metadata accessor for AccountFitnessSettingsChanged(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)&self->eventHub[8];
  ObjectType = swift_getObjectType(*(_QWORD *)self->eventHub);
  v12 = a3;
  v13 = swift_retain(self);
  AccountFitnessSettingsChanged.init()(v13);
  v14 = sub_1001DBD9C();
  dispatch thunk of EventHubProtocol.publish<A>(_:)(v9, v6, v14, ObjectType, v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  swift_release(self);
}

@end
