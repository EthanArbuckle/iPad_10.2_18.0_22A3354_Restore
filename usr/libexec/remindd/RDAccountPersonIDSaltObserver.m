@implementation RDAccountPersonIDSaltObserver

- (NSUUID)uuid
{
  return (NSUUID *)UUID._bridgeToObjectiveC()().super.isa;
}

- (_TtP7remindd20ObservingAccountInfo_)account
{
  return (_TtP7remindd20ObservingAccountInfo_ *)(id)swift_unknownObjectRetain(*(Class *)((char *)&self->super.isa + OBJC_IVAR___RDAccountPersonIDSaltObserver_account));
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                      + OBJC_IVAR___RDAccountPersonIDSaltObserver_callbackQueue));
}

+ (NSError)InitiallyNilError
{
  return (NSError *)sub_1001BA4C0((uint64_t)a1, (uint64_t)a2, &qword_100837768, (id *)&qword_100872200, (uint64_t)sub_1004EDADC);
}

+ (NSError)NilValueError
{
  return (NSError *)sub_1001BA4C0((uint64_t)a1, (uint64_t)a2, &qword_100837770, (id *)&qword_100872208, (uint64_t)sub_1004EDB08);
}

+ (NSError)InvalidValueError
{
  return (NSError *)sub_1001BA4C0((uint64_t)a1, (uint64_t)a2, &qword_100837778, (id *)&qword_100872210, (uint64_t)sub_1004EDB34);
}

+ (NSError)AccountAbsentError
{
  return (NSError *)sub_1001BA4C0((uint64_t)a1, (uint64_t)a2, &qword_100837780, (id *)&qword_100872218, (uint64_t)sub_1004EDB60);
}

- (RDAccountPersonIDSaltObserver)initWithAccountObjectID:(id)a3 accountType:(int64_t)a4 initialSaltValue:(id)a5 callbackQueue:(id)a6 successHandler:(id)a7 errorHandler:(id)a8
{
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;

  v13 = _Block_copy(a7);
  v14 = _Block_copy(a8);
  v15 = swift_allocObject(&unk_1007F7D48, 24, 7);
  *(_QWORD *)(v15 + 16) = v13;
  v16 = swift_allocObject(&unk_1007F7D70, 24, 7);
  *(_QWORD *)(v16 + 16) = v14;
  v17 = a3;
  v18 = a5;
  return (RDAccountPersonIDSaltObserver *)sub_1004EDC24(v17, (void *)a4, a5, a6, sub_10021B6C0, v15, (uint64_t)sub_1004EF77C, v16);
}

- (NSString)propertyName
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->account[OBJC_IVAR___RDAccountPersonIDSaltObserver_propertyName];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setPropertyName:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR___RDAccountPersonIDSaltObserver_propertyName);
  v6 = *(_QWORD *)&self->account[OBJC_IVAR___RDAccountPersonIDSaltObserver_propertyName];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (void)notify:(id)a3
{
  RDAccountPersonIDSaltObserver *v5;
  uint64_t v6;
  RDAccountPersonIDSaltObserver *v7;
  _OWORD v8[2];

  if (a3)
  {
    v5 = self;
    swift_unknownObjectRetain(a3);
    _bridgeAnyObjectToAny(_:)(v8, v6);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v7 = self;
  }
  sub_1004EE9E4((uint64_t)v8);

  sub_10000882C((uint64_t)v8, (uint64_t *)&unk_10083D5B0);
}

- (NSString)description
{
  RDAccountPersonIDSaltObserver *v2;
  NSString v3;

  v2 = self;
  sub_1004EEC70();

  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  objc_class *ObjectType;
  RDAccountPersonIDSaltObserver *v4;
  objc_super v5;
  char v6;

  ObjectType = (objc_class *)swift_getObjectType(self);
  v6 = 1;
  v4 = self;
  CurrentValueSubject.send(completion:)(&v6);
  v5.receiver = v4;
  v5.super_class = ObjectType;
  -[RDAccountPersonIDSaltObserver dealloc](&v5, "dealloc");
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___RDAccountPersonIDSaltObserver_uuid;
  v4 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___RDAccountPersonIDSaltObserver_account));

  swift_release(*(_QWORD *)&self->account[OBJC_IVAR___RDAccountPersonIDSaltObserver_successHandler]);
  swift_release(*(_QWORD *)&self->account[OBJC_IVAR___RDAccountPersonIDSaltObserver_errorHandler]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->account[OBJC_IVAR___RDAccountPersonIDSaltObserver_propertyName]);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___RDAccountPersonIDSaltObserver_currentValueSubject));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___RDAccountPersonIDSaltObserver_cancellables));
}

- (RDAccountPersonIDSaltObserver)init
{
  RDAccountPersonIDSaltObserver *result;

  result = (RDAccountPersonIDSaltObserver *)_swift_stdlib_reportUnimplementedInitializer("remindd.RDAccountPersonIDSaltObserver", 37, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
