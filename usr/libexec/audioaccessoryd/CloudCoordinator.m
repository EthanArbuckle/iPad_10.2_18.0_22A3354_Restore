@implementation CloudCoordinator

- (BOOL)isEqual:(id)a3
{
  _OWORD v6[2];

  if (a3)
  {
    swift_retain(self);
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v6);
    swift_release(self);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_1000B3C60((uint64_t)v6);
  return 0;
}

- (int64_t)hash
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;

  v3 = objc_msgSend((id)swift_retain(self), "cloudContainerIdentifier");
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v6 = v5;

  v7 = String.hashValue.getter(v4, v6);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
  return v7;
}

- (Class)superclass
{
  uint64_t v2;

  v2 = type metadata accessor for CloudCoordinator(0);
  return (Class)swift_getObjCClassFromMetadata(v2);
}

- (_TtC15audioaccessoryd16CloudCoordinator)self
{
  return (_TtC15audioaccessoryd16CloudCoordinator *)(id)swift_retain(self);
}

- (id)performSelector:(SEL)a3
{
  id v4;

  v4 = objc_msgSend((id)swift_retain(self), "cloudContainerIdentifier");
  swift_release(self);
  return v4;
}

- (id)performSelector:(SEL)a3 withObject:(id)a4
{
  NSString *v6;
  __int128 v8;
  __int128 v9;

  if (a4)
  {
    swift_retain(self);
    swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(&v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
    swift_retain(self);
  }
  v6 = -[CloudCoordinator cloudContainerIdentifier](self, "cloudContainerIdentifier", v8, v9);
  swift_release(self);
  sub_1000B3C60((uint64_t)&v8);
  return v6;
}

- (id)performSelector:(SEL)a3 withObject:(id)a4 withObject:(id)a5
{
  NSString *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  if (!a4)
  {
    v12 = 0u;
    v13 = 0u;
    swift_unknownObjectRetain(a5);
    swift_retain(self);
    if (a5)
      goto LABEL_3;
LABEL_5:
    v10 = 0u;
    v11 = 0u;
    goto LABEL_6;
  }
  swift_unknownObjectRetain(a5);
  swift_retain(self);
  swift_unknownObjectRetain(a4);
  _bridgeAnyObjectToAny(_:)(&v12);
  swift_unknownObjectRelease(a4);
  if (!a5)
    goto LABEL_5;
LABEL_3:
  _bridgeAnyObjectToAny(_:)(&v10);
  swift_unknownObjectRelease(a5);
LABEL_6:
  v8 = -[CloudCoordinator cloudContainerIdentifier](self, "cloudContainerIdentifier", v10, v11, v12, v13);
  swift_release(self);
  sub_1000B3C60((uint64_t)&v10);
  sub_1000B3C60((uint64_t)&v12);
  return v8;
}

- (BOOL)isProxy
{
  return 0;
}

- (BOOL)isKindOfClass:(Class)a3
{
  return 0;
}

- (BOOL)isMemberOfClass:(Class)a3
{
  return 0;
}

- (BOOL)conformsToProtocol:(id)a3
{
  return 0;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return 0;
}

- (NSString)description
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  swift_retain(self);
  sub_1000E780C();
  v4 = v3;
  swift_release(self);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (NSString)debugDescription
{
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  swift_retain(self);
  sub_1000E780C();
  v4 = v3;
  swift_release(self);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (OS_dispatch_queue)pushDelegateQueue
{
  __n128 v3;
  void *v4;

  swift_retain(self);
  v4 = sub_1000E7A74(v3);
  swift_release(self);
  return (OS_dispatch_queue *)v4;
}

- (void)setPushDelegateQueue:(id)a3
{
  void *v3;
  id v4;

  v3 = *(void **)self->$__lazy_storage_$_pushDelegateQueue;
  *(_QWORD *)self->$__lazy_storage_$_pushDelegateQueue = a3;
  v4 = a3;
  sub_10010587C(v3);
}

- (void)onIdentityUpdateNotification
{
  uint64_t v3;

  v3 = swift_retain(self);
  sub_1000F25C8(v3);
  swift_release(self);
}

- (void)accountDidChange:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v5 = type metadata accessor for Notification(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = swift_retain(self);
  sub_1000F47F4(v9);
  swift_release(self);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (NSString)cloudContainerIdentifier
{
  unsigned __int8 *v2;
  uint64_t v3;
  NSString v4;

  v2 = &self->_TtCs12_SwiftObject_opaque[OBJC_IVAR____TtC15audioaccessoryd16CloudCoordinator_configuration];
  v3 = *(_QWORD *)&v2[*(int *)(type metadata accessor for CloudCoordinatorConfiguration(0) + 24) + 8];
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (void)didReceiveWithPublicToken:(id)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a3;
  swift_retain(self);
  v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;

  v10 = static os_log_type_t.default.getter(v9);
  if (qword_1002101D0 != -1)
    swift_once(&qword_1002101D0, sub_1001686F0);
  v11 = qword_100218DD8;
  v12 = sub_1000A0980((uint64_t *)&unk_1002103C0);
  v13 = swift_allocObject(v12, 72, 7);
  *(_OWORD *)(v13 + 16) = xmmword_100184870;
  Data.hexString.getter(v6, v8);
  v15 = v14;
  v17 = v16;
  *(_QWORD *)(v13 + 56) = &type metadata for String;
  *(_QWORD *)(v13 + 64) = sub_1000A0DF4();
  *(_QWORD *)(v13 + 32) = v15;
  *(_QWORD *)(v13 + 40) = v17;
  os_log(_:dso:log:_:_:)(v10, &_mh_execute_header, v11, "APS public token: <%@>", 22, 2, v13);
  swift_bridgeObjectRelease(v13);
  sub_1000A103C(v6, v8);
  swift_release(self);
}

- (void)didReceiveWithToken:(id)a3 forTopic:(id)a4 identifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  swift_retain(self);
  v12 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = v13;

  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v10);
  v17 = v16;

  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(v11);
  v20 = v19;

  sub_100104CE0(v12, v14, v15, v17, v18, v20);
  swift_bridgeObjectRelease(v17);
  swift_bridgeObjectRelease(v20);
  sub_1000A103C(v12, v14);
  swift_release(self);
}

- (void)didReceiveWithMessage:(id)a3
{
  id v4;

  v4 = a3;
  swift_retain(self);
  sub_1000FE5F0(v4);

  swift_release(self);
}

@end
