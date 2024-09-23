@implementation DaemonDataSource

- (_TtC19MailWidgetExtension16DaemonDataSource)init
{
  return (_TtC19MailWidgetExtension16DaemonDataSource *)sub_100011078();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19MailWidgetExtension16DaemonDataSource_messagesDataSource));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC19MailWidgetExtension16DaemonDataSource_statusDataSource));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC19MailWidgetExtension16DaemonDataSource_mailboxDataSource));

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC19MailWidgetExtension16DaemonDataSource_queue));
}

@end
