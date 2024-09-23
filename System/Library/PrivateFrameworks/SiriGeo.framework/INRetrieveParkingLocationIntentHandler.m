@implementation INRetrieveParkingLocationIntentHandler

- (void)handleRetrieveParkingLocation:(id)a3 completion:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC7SiriGeo38INRetrieveParkingLocationIntentHandler *v9;

  v6 = _Block_copy(a4);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  specialized INRetrieveParkingLocationIntentHandler.handle(intent:completion:)((uint64_t)partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned INDeleteParkingLocationIntentResponse) -> (), v7);

  swift_release();
}

- (_TtC7SiriGeo38INRetrieveParkingLocationIntentHandler)init
{
  uint64_t v3;
  _TtC7SiriGeo38INRetrieveParkingLocationIntentHandler *v4;
  objc_super v6;

  v3 = OBJC_IVAR____TtC7SiriGeo38INRetrieveParkingLocationIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)OS_os_log.init(subsystem:category:)();

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for INRetrieveParkingLocationIntentHandler();
  return -[INRetrieveParkingLocationIntentHandler init](&v6, sel_init);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC7SiriGeo38INRetrieveParkingLocationIntentHandler_logObject));
}

@end
