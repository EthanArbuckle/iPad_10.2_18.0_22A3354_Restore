@implementation TTRIDebugController

- (_TtC9Reminders19TTRIDebugController)init
{
  uint64_t v3;
  id v4;
  _TtC9Reminders19TTRIDebugController *v5;
  objc_super v7;

  v3 = OBJC_IVAR____TtC9Reminders19TTRIDebugController_store;
  v4 = objc_allocWithZone((Class)REMStore);
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, "init");

  v7.receiver = v5;
  v7.super_class = (Class)type metadata accessor for TTRIDebugController();
  return -[TTRIDebugController init](&v7, "init");
}

- (void).cxx_destruct
{

}

@end
