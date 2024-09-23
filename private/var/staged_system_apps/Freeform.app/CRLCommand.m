@implementation CRLCommand

- (BOOL)shouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup
{
  return *((_BYTE *)&self->super.isa
         + OBJC_IVAR____TtC8Freeform10CRLCommand_shouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup);
}

- (void)setShouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup:(BOOL)a3
{
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC8Freeform10CRLCommand_shouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup) = a3;
}

- (_TtC8Freeform10CRLCommand)init
{
  objc_super v3;

  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC8Freeform10CRLCommand_committed) = 0;
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC8Freeform10CRLCommand_shouldSendChangeNotificationsWhenEnqueuedInProgressiveGroup) = 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLCommand();
  return -[CRLCommand init](&v3, "init");
}

@end
