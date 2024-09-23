@implementation INStopShareETAIntentHandler

- (void)resolveRecipientsForStopShareETA:(id)a3 withCompletion:(id)a4
{
  @objc INStopShareETAIntentHandler.resolveRecipients(for:with:)(self, (int)a2, a3, a4, (void (*)(id, id, void *))specialized INStopShareETAIntentHandler.resolveRecipients(for:with:));
}

- (void)confirmStopShareETA:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC7SiriGeo27INStopShareETAIntentHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  specialized INStopShareETAIntentHandler.confirm(intent:completion:)((char *)v8, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (void)handleStopShareETA:(id)a3 completion:(id)a4
{
  @objc INStopShareETAIntentHandler.resolveRecipients(for:with:)(self, (int)a2, a3, a4, (void (*)(id, id, void *))specialized INStopShareETAIntentHandler.handle(intent:completion:));
}

- (_TtC7SiriGeo27INStopShareETAIntentHandler)init
{
  uint64_t v3;
  _TtC7SiriGeo27INStopShareETAIntentHandler *v4;
  uint64_t v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_logObject;
  type metadata accessor for OS_os_log(0, &lazy cache variable for type metadata for OS_os_log);
  v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)OS_os_log.init(subsystem:category:)();
  v5 = OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_contactService;
  type metadata accessor for ContactService();
  swift_allocObject();
  *(Class *)((char *)&v4->super.isa + v5) = (Class)ContactService.init()();
  *(Class *)((char *)&v4->super.isa + OBJC_IVAR____TtC7SiriGeo27INStopShareETAIntentHandler_sharedTripContact) = 0;

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for INStopShareETAIntentHandler();
  return -[INStopShareETAIntentHandler init](&v7, sel_init);
}

- (void).cxx_destruct
{

  swift_release();
}

@end
