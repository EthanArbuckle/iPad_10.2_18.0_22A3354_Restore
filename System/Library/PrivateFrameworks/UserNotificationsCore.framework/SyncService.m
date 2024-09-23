@implementation SyncService

- (_TtC21UserNotificationsCore11SyncService)init
{
  _TtC21UserNotificationsCore11SyncService *result;

  SyncService.init()();
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  _TtC21UserNotificationsCore11SyncService *v4;
  _TtC21UserNotificationsCore11SyncService *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21UserNotificationsCore11SyncService_queue_flushTimer))
  {
    swift_getObjectType();
    v4 = self;
    swift_unknownObjectRetain();
    sub_249B02938();
    swift_unknownObjectRelease();
  }
  else
  {
    v5 = self;
  }
  v6.receiver = self;
  v6.super_class = ObjectType;
  -[SyncService dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  sub_249A03038((uint64_t)self + OBJC_IVAR____TtC21UserNotificationsCore11SyncService_delegate);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

@end
